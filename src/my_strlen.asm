bits 64

section .text

%ifndef TU
    global strlen
strlen:
%else
    global my_strlen
my_strlen:
%endif

    xor rax, rax
.loop:
    cmp byte [rdi + rax], 0
    je .end
    inc rax
    jmp .loop
.end:
    ret
