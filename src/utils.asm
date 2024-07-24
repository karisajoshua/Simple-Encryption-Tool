section .text

global print_string, read_string

; ------------------------------------------------------
; print_string: Prints a null-terminated string to stdout
; Input:
;   ecx - address of the string to print
; ------------------------------------------------------
print_string:
    pusha                  ; Save all general-purpose registers
    mov eax, 4             ; syscall number for sys_write
    mov ebx, 1             ; file descriptor 1 (stdout)
    mov edx, [ecx - 4]     ; length of the string (stored before the string)
    int 0x80               ; make syscall
    popa                   ; Restore all general-purpose registers
    ret

; ------------------------------------------------------
; read_string: Reads a string from stdin
; Input:
;   ecx - address of the buffer to store the string
;   edx - maximum number of bytes to read
; Output:
;   eax - number of bytes read
; ------------------------------------------------------
read_string:
    pusha                  ; Save all general-purpose registers
    mov eax, 3             ; syscall number for sys_read
    mov ebx, 0             ; file descriptor 0 (stdin)
    int 0x80               ; make syscall
    popa                   ; Restore all general-purpose registers
    ret


