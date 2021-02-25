bits 64

section .text

%ifndef TU
    global strstr
strstr:
%else
    global my_strstr
my_strstr:
%endif

    xor rax, rax
    xor rcx, rcx

.loop:                          ;do
    mov r8, rcx
    xor r9, r9
    cmp byte [rdi + rcx], 0
    je .error
    jne .contains               ;call contains
.check_contains:                ;checkpoint before contains
    inc rcx                     ;rcx++

    jmp .loop                   ;while

.contains:                      ;check if &str[rcx] contains to_find
    cmp byte [rdi + r8], 0      ;check end of str
    je .error

    cmp byte [rsi + r9], 0      ;check end of to_find
    je .end

    mov r10b, byte [rdi + r8]
    mov r11b, byte [rsi + r9]

    cmp r10b, r11b              ;str[r8] == to_find[r9] ?
    jne .check_contains

    inc r9
    inc r8

    jmp .contains

.end:                        ;return &str[rcx]
    add rdi, rcx
    mov rax, rdi
    ret

.error:                         ;return NULL
    xor rax, rax
    ret
