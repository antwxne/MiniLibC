bits 64

section .text

%ifndef TU
    global strncmp
strncmp:
%else
    global my_strncmp
my_strncmp:
%endif

    xor rax, rax
    xor rcx, rcx
.loop:
    cmp rcx, rdx
    je .end
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

.check:
    
