section .data
    newline db 10, 0
    star db '*', 0
    space db ' ', 0
    
section .text
    global _start

_start:
    mov r8, 8          ; rectangle height
    mov r9, 0          ; row counter
    
draw_rectangle:
    mov rcx, 15        ; rectangle width
    mov r10, 0         ; column counter
    
draw_row:
    ; Check if we draw space or border
    cmp r9, 0          ; first row?
    je draw_border
    cmp r9, 7          ; last row (height-1)?
    je draw_border
    cmp r10, 0         ; first column?
    je draw_border
    cmp r10, 14        ; last column (width-1)?
    je draw_border
    
    ; Empty inside
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, space     ; space
    mov rdx, 1         ; length
    syscall
    jmp next_char
    
draw_border:
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, star      ; star
    mov rdx, 1         ; length
    syscall
    
next_char:
    inc r10            ; next column
    cmp r10, 15        ; check if row end was reached
    jl draw_row
    
    ; new line
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, newline   ; new line
    mov rdx, 1         ; length
    syscall
    
    inc r9             ; new line
    cmp r9, 8          ; check if the rectangle end was reached
    jl draw_rectangle
    
    ; Выход из программы
    mov rax, 60        ; sys_exit
    mov rdi, 0         ; return value
    syscall