section .data
    newline db 10, 0
    alx_char db '*', 0
    
section .text
    global _start

_start:
    ; Draw horizontal line of 20 asterisks
    mov rcx, 20        ; number of characters
    
draw_line:
    ; Output '*' character
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, alx_char  ; address of character
    mov rdx, 1         ; length
    syscall
    
    loop draw_line     ; rcx--, if rcx != 0, jump to draw_line
    
    ; Output newline
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, newline   ; address of newline character
    mov rdx, 1         ; length
    syscall
    
    ; Exit program
    mov rax, 60        ; sys_exit
    mov rdi, 0         ; return code
    syscall