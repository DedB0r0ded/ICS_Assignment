section .data
    newline db 10
    abd_char db '#'
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

    ; Draw upper half of diamond
    mov r8, 1          ; row counter from 1 to 5

upper_loop:
    ; Print leading spaces
    mov r10, 5
    sub r10, r8

print_spaces_upper:
    cmp r10, 0
    je print_hashes_upper

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

    dec r10
    jmp print_spaces_upper

print_hashes_upper:
    mov r9, r8

hash_loop_upper:
    ; print '#'
    mov rax, 1
    mov rdi, 1
    mov rsi, abd_char
    mov rdx, 1
    syscall

    ; print space if not last abd_char
    dec r9
    cmp r9, 0
    je newline_upper

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

    jmp hash_loop_upper

newline_upper:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    inc r8
    cmp r8, 6
    jne upper_loop

    ; Draw lower half of diamond
    mov r8, 4          ; row counter from 4 to 1

lower_loop:
    ; Print leading spaces
    mov r10, 5
    sub r10, r8

print_spaces_lower:
    cmp r10, 0
    je print_hashes_lower

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

    dec r10
    jmp print_spaces_lower

print_hashes_lower:
    mov r9, r8

hash_loop_lower:
    ; print '#'
    mov rax, 1
    mov rdi, 1
    mov rsi, abd_char
    mov rdx, 1
    syscall

    ; print space if not last abd_char
    dec r9
    cmp r9, 0
    je newline_lower

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

    jmp hash_loop_lower

newline_lower:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    dec r8
    cmp r8, 0
    jne lower_loop

    ; Reset terminal color
    mov rax, 1
    mov rdi, 1
    mov rsi, reset_color
    mov rdx, 4
    syscall

    ; Exit program
    mov rax, 60
    xor rdi, rdi
    syscall
