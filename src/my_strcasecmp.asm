bits 64

section .text

%ifndef TU
    global strcasecmp
strcasecmp:
%else
    global my_strcasecmp
my_strcasecmp:
%endif

    xor rax, rax
    xor rcx, rcx
    xor r8b, r8b
    xor r9b, r9b
.loop:
    mov r8b, byte [rdi + rcx]
    mov r10b, r8b
    sub r10b, 'a' - 'A'
    mov r9b, byte [rsi + rcx]
    cmp r8b, 0
    je .end
    cmp r9b, 0
    je .end
    cmp r9b, r10b
    je .next
    cmp r9b, r8b
    je .next
    jne .end
.next:
    inc rcx
    jmp .loop
.end:
    sub r8b, r9b
    movsx rax, r8b
    ret
