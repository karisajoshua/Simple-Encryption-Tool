section .data
    prompt db "Enter text to encrypt: ", 0
    encrypted_msg db "Encrypted text: ", 0
    newline db 10, 0

section .bss
    input resb 128
    input_len resb 1

section .text
    global _start

_start:
    ; Print prompt message
    mov eax, 4            ; syscall number for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, prompt       ; pointer to message
    mov edx, 22           ; length of message
    int 0x80              ; make syscall

    ; Read user input
    mov eax, 3            ; syscall number for sys_read
    mov ebx, 0            ; file descriptor 0 (stdin)
    mov ecx, input        ; pointer to input buffer
    mov edx, 128          ; maximum number of bytes to read
    int 0x80              ; make syscall
    mov [input_len], al   ; store length of input

    ; Encrypt the input
    call encrypt

    ; Print encrypted message
    mov eax, 4            ; syscall number for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, encrypted_msg ; pointer to message
    mov edx, 16           ; length of message
    int 0x80              ; make syscall

    ; Print encrypted text
    mov eax, 4            ; syscall number for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, input        ; pointer to encrypted text
    mov edx, [input_len]  ; length of encrypted text
    int 0x80              ; make syscall

    ; Print newline
    mov eax, 4            ; syscall number for sys_write
    mov ebx, 1            ; file descriptor 1 (stdout)
    mov ecx, newline      ; pointer to newline character
    mov edx, 1            ; length of newline character
    int 0x80              ; make syscall

    ; Exit program
    mov eax, 1            ; syscall number for sys_exit
    xor ebx, ebx          ; exit status 0
    int 0x80              ; make syscall

encrypt:
    xor ecx, ecx          ; initialize counter to 0
    mov cl, [input_len]   ; get length of input
    mov edi, input        ; address of input buffer

enc_loop:
    dec ecx               ; decrement counter
    js enc_done           ; if counter < 0, jump to done
    mov al, [edi + ecx]   ; load byte from input buffer
    xor al, 0xAA          ; XOR with 0xAA
    mov [edi + ecx], al   ; store byte back to input buffer
    jmp enc_loop          ; repeat loop

enc_done:
    ret                   ; return from function
