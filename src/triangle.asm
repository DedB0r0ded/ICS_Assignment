section .data
    newline db 10
    hash db '#'
    space db ' '
    red_color db 27, '[', '3', '1', 'm'
    reset_color db 27, '[', '0', 'm'

section .text
    global _start

_start:
    ; Set red color
    mov rax, 1
    mov rdi, 1
    mov rsi, red_color
    mov rdx, 5
    syscall

    mov r8, 1          ; row counter starts at 1

.row_loop:
    ; Print leading spaces
    mov r10, 5
    sub r10, r8

.print_spaces:
    cmp r10, 0
    je .print_hashes
    
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    
    dec r10
    jmp .print_spaces

.print_hashes:
    mov r9, r8

.hash_loop:
    ; print '#'
    mov rax, 1
    mov rdi, 1
    mov rsi, hash
    mov rdx, 1
    syscall

    ; print space if not last hash
    dec r9
    cmp r9, 0
    je .print_newline

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

    jmp .hash_loop

.print_newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    inc r8
    cmp r8, 6
    jne .row_loop

    ; Reset terminal color
    mov rax, 1
    mov rdi, 1
    mov rsi, reset_color
    mov rdx, 4
    syscall

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall
