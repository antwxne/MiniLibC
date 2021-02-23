bits 64

section .text

%ifndef TU
    global strcspn
strcspn
%else
    global my_strcspn
my_strcspn:
%endif

    xor rax, rax

.loop:                          ;do
    xor r9, r9
    mov r10b, byte [rdi + rax]  ;r10b = str[rax]
    cmp r10b, 0
    je .end
    jne .contains               ;call contains
.check_contains:                ;checkpoint before contains
    inc rax                     ;rcx++
    jmp .loop                   ;while


.contains:                      ;check if &str[rcx] contains to_find
    cmp byte [rsi + r9], 0      ;check end of to_find
    je .check_contains          ;jump to not_contains

    mov r11b, byte [rsi + r9]

    cmp r10b, r11b              ;str[r8] == except[r9] ?
    je .end                     ;if (str[rcx] == except[r9]) go to check_contains

    inc r9

    jmp .contains

.end:                           ;return nb bytes
    ret
