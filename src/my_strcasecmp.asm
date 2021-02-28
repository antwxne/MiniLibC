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
    cmp r8b, 'A'
    jl .simple_cmp
    cmp r9b, 'A'
    jl .simple_cmp
    cmp r8b, 'z'
    jg .simple_cmp
    cmp r9b, 'z'
    jg .simple_cmp
    cmp r8b, 91
    je .simple_cmp
    cmp r8b, 92
    je .simple_cmp
    cmp r8b, 93
    je .simple_cmp
    cmp r8b, 94
    je .simple_cmp
    cmp r8b, 95
    je .simple_cmp
    cmp r8b, 96
    je .simple_cmp
    cmp r9b, 91
    je .simple_cmp
    cmp r9b, 92
    je .simple_cmp
    cmp r9b, 93
    je .simple_cmp
    cmp r9b, 94
    je .simple_cmp
    cmp r9b, 95
    je .simple_cmp
    cmp r9b, 96
    je .simple_cmp
    cmp r9b, r10b
    je .next
.simple_cmp:
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
