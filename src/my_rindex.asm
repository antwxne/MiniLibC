bits 64

section .text

%ifndef TU
    global rindex
rindex:
%else
    global my_rindex
my_rindex:
%endif

    xor rax, rax
    xor rcx, rcx

.loop_end:
    cmp byte [rdi + rcx], 0
    je .loop
    inc rcx
    jmp .loop_end

.loop:
    cmp byte [rdi + rcx], sil
    je .end
    cmp rcx, 0
    je .error
    dec rcx
    jmp .loop

.end:
    add rdi, rcx
    mov rax, rdi
    ret

.error:
    xor rax, rax
    ret
