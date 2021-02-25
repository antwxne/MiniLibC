bits 64

section .text

%ifndef TU
    global strpbrk
strpbrk:
%else
    global my_strpbrk
my_strpbrk:
%endif

    xor rax, rax
    xor rcx, rcx

.loop:                          ;do
    xor r9, r9
    cmp byte [rdi + rcx], 0
    je .error
    jne .contains               ;call contains
.check_contains:                ;checkpoint before contains
    inc rcx                     ;rcx++

    jmp .loop                   ;while

.contains:                      ;check if &str[rcx] contains to_find
    cmp byte [rsi + r9], 0      ;check end of to_find
    je .error

    mov r10b, byte [rdi + rcx]
    mov r11b, byte [rsi + r9]

    cmp r10b, r11b              ;str[r8] == to_find[r9] ?
    jne .check_contains
    je .end

    inc r9

    jmp .contains

.end:                        ;return &str[rcx]
    add rdi, rcx
    mov rax, rdi
    ret

.error:                         ;return NULL
    xor rax, rax
    ret
