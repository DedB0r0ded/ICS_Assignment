section .data
    arrow_head1 db '   #   ', 10          ; 8 bytes including newline
    arrow_head2 db '  ###  ', 10
    arrow_head3 db ' ##### ', 10
    arrow_shaft  db '   #   ', 10

section .text
    global _start

_start:
    call draw_arrow
    jmp exit_program

draw_arrow:
    ; Print arrow_head1
    mov rax, 1
    mov rdi, 1
    mov rsi, arrow_head1
    mov rdx, 8
    syscall

    ; Print arrow_head2
    mov rax, 1
    mov rdi, 1
    mov rsi, arrow_head2
    mov rdx, 8
    syscall

    ; Print arrow_head3
    mov rax, 1
    mov rdi, 1
    mov rsi, arrow_head3
    mov rdx, 8
    syscall

    ; Print shaft (4 lines)
    mov r8, 4
.draw_shaft:
    mov rax, 1
    mov rdi, 1
    mov rsi, arrow_shaft
    mov rdx, 8
    syscall

    dec r8
    cmp r8, 0
    jne .draw_shaft

    ret

exit_program:
    mov rax, 60      ; sys_exit
    xor rdi, rdi     ; exit code 0
    syscall
