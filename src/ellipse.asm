; --------------------------------------------------------------------
; ellipses.asm
; Print a 14-moh_ellipse_line ASCII “ellipes” to stdout, then exit cleanly.
; --------------------------------------------------------------------

section .data
    ; Each moh_ellipse_line of text ends with ASCII NL (0x0A = 10)
moh_ellipse_line1   db "         ***         ", 10
moh_ellipse_line2   db "       *******       ", 10
moh_ellipse_line3   db "     ***********     ", 10
moh_ellipse_line4   db "    *************    ", 10
moh_ellipse_line5   db "   ***************   ", 10
moh_ellipse_line6   db "   ***************   ", 10
moh_ellipse_line7   db "   ***************   ", 10
moh_ellipse_line8   db "   ***************   ", 10
moh_ellipse_line9   db "   ***************   ", 10
moh_ellipse_line10  db "    *************    ", 10
moh_ellipse_line11  db "     ***********     ", 10
moh_ellipse_line12  db "      *********      ", 10
moh_ellipse_line13  db "       *******       ", 10
moh_ellipse_line14  db "         ***         ", 10

    ; Compute moh_ellipse_lengths of each moh_ellipse_line (address of $ minus start of label)
moh_ellipse_len1    equ $ - moh_ellipse_line1
moh_ellipse_len2    equ $ - moh_ellipse_line2
moh_ellipse_len3    equ $ - moh_ellipse_line3
moh_ellipse_len4    equ $ - moh_ellipse_line4
moh_ellipse_len5    equ $ - moh_ellipse_line5
moh_ellipse_len6    equ $ - moh_ellipse_line6
moh_ellipse_len7    equ $ - moh_ellipse_line7
moh_ellipse_len8    equ $ - moh_ellipse_line8
moh_ellipse_len9    equ $ - moh_ellipse_line9
moh_ellipse_len10   equ $ - moh_ellipse_line10
moh_ellipse_len11   equ $ - moh_ellipse_line11
moh_ellipse_len12   equ $ - moh_ellipse_line12
moh_ellipse_len13   equ $ - moh_ellipse_line13
moh_ellipse_len14   equ $ - moh_ellipse_line14

section .text
    global _start        ; entry point for Linux

_start:
    ; -------------------------------
    ; Prepare common registers for write()
    ; -------------------------------
    mov  rdi, 1          ; rdi = file descriptor (1 = stdout)
    mov  rax, 1          ; rax = syscall number for write()

    ; -------------------------------
    ; Write each moh_ellipse_line in turn
    ; -------------------------------
    ; write(fd=1, buf=&moh_ellipse_line1, moh_ellipse_len1)
    lea  rsi, [rel moh_ellipse_line1]  ; rsi = pointer to moh_ellipse_line1
    mov  rdx, moh_ellipse_len1         ; rdx = number of bytes
    syscall                ; invoke kernel

    lea  rsi, [rel moh_ellipse_line2]
    mov  rdx, moh_ellipse_len2
    syscall

    lea  rsi, [rel moh_ellipse_line3]
    mov  rdx, moh_ellipse_len3
    syscall

    lea  rsi, [rel moh_ellipse_line4]
    mov  rdx, moh_ellipse_len4
    syscall

    lea  rsi, [rel moh_ellipse_line5]
    mov  rdx, moh_ellipse_len5
    syscall

    lea  rsi, [rel moh_ellipse_line6]
    mov  rdx, moh_ellipse_len6
    syscall

    lea  rsi, [rel moh_ellipse_line7]
    mov  rdx, moh_ellipse_len7
    syscall

    lea  rsi, [rel moh_ellipse_line8]
    mov  rdx, moh_ellipse_len8
    syscall

    lea  rsi, [rel moh_ellipse_line9]
    mov  rdx, moh_ellipse_len9
    syscall

    lea  rsi, [rel moh_ellipse_line10]
    mov  rdx, moh_ellipse_len10
    syscall

    lea  rsi, [rel moh_ellipse_line11]
    mov  rdx, moh_ellipse_len11
    syscall

    lea  rsi, [rel moh_ellipse_line12]
    mov  rdx, moh_ellipse_len12
    syscall

    lea  rsi, [rel moh_ellipse_line13]
    mov  rdx, moh_ellipse_len13
    syscall

    lea  rsi, [rel moh_ellipse_line14]
    mov  rdx, moh_ellipse_len14
    syscall

    ; -------------------------------
    ; Exiting the process
    ; -------------------------------
    mov  rax, 60         ; syscall number for exit()
    xor  rdi, rdi        ; exit status = 0
    syscall
