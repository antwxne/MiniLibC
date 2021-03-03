bits 64

section .text


%ifndef TU
    global memmove
memmove:
%else
    global my_memmove
my_memmove:
%endif
    ;; USE TMP VAR
    dec rdx
.loop:
    cmp rdx, -1
    je .end
    mov r8b, byte[rsi + rdx]
    mov byte [rdi + rdx], r8b
    dec rdx
    jmp .loop
.end:
    mov rax, rdi
    ret
