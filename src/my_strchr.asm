bits 64

section .text

%ifndef TU
    global strchr
strchr:
%else
    global my_strchr
my_strchr:
%endif

    xor rax, rax
    xor rcx, rcx

.loop:
    cmp byte [rdi + rcx], sil
    je .end
    cmp byte [rdi + rcx], 0
    je .error
    inc rcx
    jmp .loop

.end:
    add rdi, rcx
    mov rax, rdi
    ret

.error:
    xor rax, rax
    ret
