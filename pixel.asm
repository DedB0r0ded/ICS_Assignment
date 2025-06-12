section .data
    pixel db '*', 10     ; Character + newline

section .text
    global _start

_start:
    ; Write the pixel to stdout using syscall
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, pixel      ; address of character
    mov rdx, 2          ; length (char + newline)
    syscall

    ; Exit
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; status 0
    syscall
