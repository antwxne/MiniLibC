bits 64

section .text

%ifndef TU
    global strcmp
strcmp:
%else
    global my_strcmp
my_strcmp:
%endif

    xor rax, rax
    xor rcx, rcx
    xor r8b, r8b
    xor r9b, r9b
.loop:
    mov r8b, byte [rdi + rcx]
    mov r9b, byte [rsi + rcx]
    cmp r8b, 0
    je .end
    cmp r9b, 0
    je .end
    cmp r9b, r8b
    jne .end
    inc rcx
    jmp .loop
.end:
    sub r8b, r9b
    movsx rax, r8b
    ret
