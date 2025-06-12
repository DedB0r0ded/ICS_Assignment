.section .data
radius:      .quad 10
center_x:    .quad 20
center_y:    .quad 12
width:       .quad 40
height:      .quad 24

circle_char: .ascii "*"
space_char:  .ascii " "
newline:     .ascii "\n"

.section .bss
buffer:      .space 1200    # enough for 40×24 + newlines

.section .text
.global _start
_start:
    # Preload & hoist constants
    movl   radius(%rip), %r12d    # r12d = radius
    imull  %r12d,    %r12d        # r12d = radius^2
    movq   center_x(%rip), %r13   # r13 = cx
    movq   center_y(%rip), %r14   # r14 = cy
    movq   width(%rip),    %r15   # r15 = width
    movq   height(%rip),   %r10   # r10 = height
    leaq   buffer(%rip),   %r11   # r11 = buffer_ptr

    xorq   %r8, %r8               # y = 0

y_loop:
    # if y < height, proceed; else print
    cmpq   %r10, %r8              # compare height, y
    jb     proceed_row            # unsigned: if y < height
    jmp    print_buffer
proceed_row:
    xorq   %r9, %r9               # x = 0

x_loop:
    # if x < width, draw pixel; else end line
    cmpq   %r15, %r9              # compare width, x
    jb     proceed_pixel          # if x < width
    jmp    end_line
proceed_pixel:
    # dx = x - cx; dx^2 in %rax
    movq   %r9,  %rax
    subq   %r13, %rax
    imulq  %rax, %rax

    # dy = y - cy; dy^2 in %rcx
    movq   %r8,  %rcx
    subq   %r14, %rcx
    imulq  %rcx, %rcx
    # aspect correction: (2*dy)^2 = 4*dy^2
    shlq   $2,    %rcx

    addq   %rcx, %rax             # rax = dx^2 + (2*dy)^2

    # if dist^2 > radius^2 then space
    cmpq   %r12, %rax             # compare radius^2, dist^2
    ja     draw_space            # if radius^2 < dist^2

draw_asterisk:
    movb   circle_char(%rip), %dl
    jmp    store_char

draw_space:
    movb   space_char(%rip), %dl

store_char:
    movb   %dl, (%r11)            # store char
    incq   %r11

    incq   %r9                    # x++
    jmp    x_loop

end_line:
    movb   newline(%rip), %dl     # newline
    movb   %dl, (%r11)
    incq   %r11

    incq   %r8                    # y++
    jmp    y_loop

print_buffer:
    # write(buffer, r11-buffer)
    leaq   buffer(%rip), %rsi
    movq   %r11,   %rdx
    subq   %rsi,   %rdx

    movq   $1, %rax               # sys_write
    movq   $1, %rdi               # stdout
    syscall

    movq   $60, %rax              # sys_exit
    xorq   %rdi, %rdi
    syscall
