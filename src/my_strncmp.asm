bits 64

section .text
    global my_strncmp

%ifndef TU
    global strncmp
%endif

strncmp:
my_strncmp:
    xor rax, rax
    xor rcx, rcx
.loop:
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi + rcx]
    cmp r8b, 0
    je .end
    cmp r9b, 0
    je .end
    cmp rcx, rdx
    je .end
    cmp r9b, r8b
    jne .end
    inc rcx
    jmp .loop
.end:
    sub r8b, r9b
    movsx rax, r8b
    ret
