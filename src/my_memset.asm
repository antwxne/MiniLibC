bits 64

section .text
    global my_memset

%ifndef TU
    global memset
%endif

memset:
my_memset:
    xor rcx, rcx
.loop:
    cmp rcx, rdx
    je .end
    mov r8b, byte[rsi]
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp .loop
.end:
    mov rax, rdi
    ret
