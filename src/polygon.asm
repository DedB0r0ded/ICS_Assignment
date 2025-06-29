section .data
    hash        db '#'
    space       db ' '
    newline     db 10
    triangle_height dq 6          ; You can set any height here

section .text
    global _start

_start:
    mov     rbx, [triangle_height] ; total rows
    mov     r13, rbx               ; use r13 as row counter

.draw_rows:
    cmp     r13, 0
    je      .exit
    push    r13

    mov     rbx, [triangle_height]
    sub     rbx, r13               ; spaces = height - current row

.print_spaces:
    cmp     rbx, 0
    jle     .print_hashes
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, space
    mov     rdx, 1
    syscall
    dec     rbx
    jmp     .print_spaces

.print_hashes:
    mov     rbx, [triangle_height]
    sub     rbx, r13
    imul    rbx, 2
    add     rbx, 1                 ; hashes = 2*(row-1)+1

.print_hash_loop:
    cmp     rbx, 0
    jle     .newline
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, hash
    mov     rdx, 1
    syscall
    dec     rbx
    jmp     .print_hash_loop

.newline:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, newline
    mov     rdx, 1
    syscall

    pop     r13
    dec     r13
    jmp     .draw_rows

.exit:
    mov     rax, 60
    xor     rdi, rdi
    syscall

