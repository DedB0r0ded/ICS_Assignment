; --------------------------------------------------------------------
; ellipses.asm
; Print a 14-line ASCII “ellipes” to stdout, then exit cleanly.
; --------------------------------------------------------------------

section .data
    ; Each line of text ends with ASCII NL (0x0A = 10)
line1   db "         ***         ", 10
line2   db "       *******       ", 10
line3   db "     ***********     ", 10
line4   db "    *************    ", 10
line5   db "   ***************   ", 10
line6   db "   ***************   ", 10
line7   db "   ***************   ", 10
line8   db "   ***************   ", 10
line9   db "   ***************   ", 10
line10  db "    *************    ", 10
line11  db "     ***********     ", 10
line12  db "      *********      ", 10
line13  db "       *******       ", 10
line14  db "         ***         ", 10

    ; Compute lengths of each line (address of $ minus start of label)
len1    equ $ - line1
len2    equ $ - line2
len3    equ $ - line3
len4    equ $ - line4
len5    equ $ - line5
len6    equ $ - line6
len7    equ $ - line7
len8    equ $ - line8
len9    equ $ - line9
len10   equ $ - line10
len11   equ $ - line11
len12   equ $ - line12
len13   equ $ - line13
len14   equ $ - line14

section .text
    global _start        ; entry point for Linux

_start:
    ; -------------------------------
    ; Prepare common registers for write()
    ; -------------------------------
    mov  rdi, 1          ; rdi = file descriptor (1 = stdout)
    mov  rax, 1          ; rax = syscall number for write()

    ; -------------------------------
    ; Write each line in turn
    ; -------------------------------
    ; write(fd=1, buf=&line1, len1)
    lea  rsi, [rel line1]  ; rsi = pointer to line1
    mov  rdx, len1         ; rdx = number of bytes
    syscall                ; invoke kernel

    lea  rsi, [rel line2]
    mov  rdx, len2
    syscall

    lea  rsi, [rel line3]
    mov  rdx, len3
    syscall

    lea  rsi, [rel line4]
    mov  rdx, len4
    syscall

    lea  rsi, [rel line5]
    mov  rdx, len5
    syscall

    lea  rsi, [rel line6]
    mov  rdx, len6
    syscall

    lea  rsi, [rel line7]
    mov  rdx, len7
    syscall

    lea  rsi, [rel line8]
    mov  rdx, len8
    syscall

    lea  rsi, [rel line9]
    mov  rdx, len9
    syscall

    lea  rsi, [rel line10]
    mov  rdx, len10
    syscall

    lea  rsi, [rel line11]
    mov  rdx, len11
    syscall

    lea  rsi, [rel line12]
    mov  rdx, len12
    syscall

    lea  rsi, [rel line13]
    mov  rdx, len13
    syscall

    lea  rsi, [rel line14]
    mov  rdx, len14
    syscall

    ; -------------------------------
    ; Exiting the process
    ; -------------------------------
    mov  rax, 60         ; syscall number for exit()
    xor  rdi, rdi        ; exit status = 0
    syscall
