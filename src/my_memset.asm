bits 64

section .text

%ifndef TU
    global memset
memset:
%else
    global my_memset
my_memset:
%endif

    xor rcx, rcx
.loop:
    cmp rcx, rdx
    je .end
    mov r8b, sil
    mov byte [rdi + rcx], r8b
    inc rcx
    jmp .loop
.end:
    mov rax, rdi
    ret
