section .data
    ; Test data
    test_input1 db "Test123", 0
    expected_output1 db 0xB4, 0xCF, 0xCA, 0xCE, 0xB0, 0xB3, 0xB4, 0

    test_input2 db "Hello, World!", 0
    expected_output2 db 0xC6, 0xC1, 0xCB, 0xCB, 0xC2, 0xAA, 0xE6, 0xCA, 0xCB, 0xC2, 0xC3, 0xA0, 0xCA, 0

    test_input3 db "abcdef", 0
    expected_output3 db 0xC7, 0xCE, 0xC9, 0xCE, 0xC9, 0xCF, 0

section .bss
    result resb 128

section .text
    global _start

_start:
    ; Test case 1: Encrypt "Test123"
    mov edi, test_input1
    mov ecx, 7              ; Length of "Test123"
    call encrypt
    call compare_strings
    jmp test_case2

test_case2:
    ; Test case 2: Encrypt "Hello, World!"
    mov edi, test_input2
    mov ecx, 13             ; Length of "Hello, World!"
    call encrypt
    call compare_strings
    jmp test_case3

test_case3:
    ; Test case 3: Encrypt "abcdef"
    mov edi, test_input3
    mov ecx, 6              ; Length of "abcdef"
    call encrypt
    call compare_strings
    jmp test_done

test_done:
    ; Exit program
    mov eax, 1              ; syscall number for sys_exit
    xor ebx, ebx            ; exit status 0
    int 0x80                ; make syscall

compare_strings:
    pusha                   ; Save all general-purpose registers
    mov esi, edi            ; Source string address
    lea edi, [esi + ecx]    ; Expected output address
    xor ecx, ecx            ; Reset counter

compare_loop:
    mov al, [esi + ecx]     ; Load byte from source string
    cmp al, [edi + ecx]     ; Compare with expected output
    jne test_fail           ; If not equal, jump to test_fail
    inc ecx                 ; Increment counter
    cmp byte [esi + ecx], 0 ; Check for null terminator
    jne compare_loop        ; If not null, continue loop

test_pass:
    ; Indicate test pass
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 (stdout)
    mov ecx, pass_msg       ; message to write
    mov edx, 11             ; length of message
    int 0x80                ; make syscall
    popa                    ; Restore all general-purpose registers
    ret

test_fail:
    ; Indicate test fail
    mov eax, 4              ; syscall number for sys_write
    mov ebx, 1              ; file descriptor 1 (stdout)
    mov ecx, fail_msg       ; message to write
    mov edx, 11             ; length of message
    int 0x80                ; make syscall
    popa                    ; Restore all general-purpose registers
    ret

section .data
    pass_msg db "Test Pass", 10, 0
    fail_msg db "Test Fail", 10, 0

; Include the encryption function
%include "src/encryption.asm"
