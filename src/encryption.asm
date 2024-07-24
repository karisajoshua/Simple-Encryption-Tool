section .text

; Encrypt function
; Input:
;   edi - address of the input buffer
;   ecx - length of the input buffer
; Output:
;   encrypted text in the input buffer

global encrypt

encrypt:
    xor ebx, ebx          ; initialize counter to 0
    mov bl, cl            ; copy input length to bl

enc_loop:
    dec ebx               ; decrement counter
    js enc_done           ; if counter < 0, jump to done
    mov al, [edi + ebx]   ; load byte from input buffer
    xor al, 0xAA          ; XOR with 0xAA
    mov [edi + ebx], al   ; store byte back to input buffer
    jmp enc_loop          ; repeat loop

enc_done:
    ret                   ; return from function
