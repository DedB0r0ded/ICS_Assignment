section .data
    newline db 10
    char db '#', ' '
    red_color db 27, '[', '3', '1', 'm'   ; ANSI escape sequence for red
    reset_color db 27, '[', '0', 'm'      ; Reset color

section .text
    global _start

_start:
    ; Set red color
    mov rax, 1
    mov rdi, 1
    mov rsi, red_color
    mov rdx, 5
    syscall

    mov r8, 5          ; row counter

.row_loop:
    mov r9, 5          ; column counter

.col_loop:
    ; print '# '
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, char
    mov rdx, 2         ; 2 bytes: '#' and ' '
    syscall

    dec r9
    jnz .col_loop

    ; print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    dec r8
    jnz .row_loop

    ; Reset color
    mov rax, 1
    mov rdi, 1
    mov rsi, reset_color
    mov rdx, 4
    syscall

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall
