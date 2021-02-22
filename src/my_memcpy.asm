bits 64

section .text

%ifndef TU
    global memcpy
memcpy:
%else
    global my_memcpy
my_memcpy:
%endif

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
