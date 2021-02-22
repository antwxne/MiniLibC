bits 64

section .text
    global my_memcpy

%ifndef TU
    global memcpy
%endif


memcpy:
my_memcpy:
    xor rcx, rcx
.loop:
    cmp rcx, rdx
    je .end
    mov r8b, byte[rsi + rcx]
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp .loop
.end:
    mov rax, rdi
    ret
