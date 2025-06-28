section .data
    newline db 10, 0
    star db '*', 0
    
section .text
    global _start

_start:
    ; Рисуем горизонтальную линию из 20 звездочек
    mov rcx, 20        ; количество символов
    
draw_line:
    ; Вывод символа '*'
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, star      ; адрес символа
    mov rdx, 1         ; длина
    syscall
    
    loop draw_line     ; rcx--, если rcx != 0, то прыжок на draw_line
    
    ; Вывод новой строки
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, newline   ; адрес символа новой строки
    mov rdx, 1         ; длина
    syscall
    
    ; Выход из программы
    mov rax, 60        ; sys_exit
    mov rdi, 0         ; код возврата
    syscall