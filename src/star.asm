section .data
    sar_char    db '#'
    space   db ' '
    newline db 10
    sar_size    dq 7            ; Must be an odd number

section .text
    global _start

_start:
    mov     rbx, [sar_size]     ; rbx = sar_size
    xor     r8, r8          	; r8 = row index

.row_loop:
    cmp     r8, rbx
    jge     .exit

    xor     r9, r9          ; r9 = column index

.col_loop:
    cmp     r9, rbx
    jge     .print_newline

    mov     rcx, rbx
    shr     rcx, 1          ; rcx = center = sar_size / 2

    ; abs(row - center)
    mov     r10, r8
    sub     r10, rcx
    cmp     r10, 0
    jns     .row_abs_ok
    neg     r10
.row_abs_ok:

    ; abs(col - center)
    mov     r11, r9
    sub     r11, rcx
    cmp     r11, 0
    jns     .col_abs_ok
    neg     r11
.col_abs_ok:

    ; Compare diagonals: abs(row-center) == abs(col-center)
    cmp     r10, r11
    je      .print_sar_char

    ; Or row is center line
    cmp     r8, rcx
    je      .print_sar_char

    jmp     .print_space

.print_sar_char:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, sar_char
    mov     rdx, 1
    syscall
    jmp     .next_col

.print_space:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, space
    mov     rdx, 1
    syscall

.next_col:
    inc     r9
    jmp     .col_loop

.print_newline:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, newline
    mov     rdx, 1
    syscall

    inc     r8
    jmp     .row_loop

.exit:
    mov     rax, 60         ; syscall: exit
    xor     rdi, rdi
    syscall

