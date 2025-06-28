section .data
    ; --- Define each line of the ASCII oval followed by a newline character ---
    line1 db "     *****         ", 10         ; Top curve of the oval
    line2 db "   ********        ", 10         ; Inner side curve
    line3 db "  ***              ", 10         ; Wider middle part
    line4 db " ***               ", 10         ; Center of the oval (repeated)
    line5 db "  ***              ", 10         ; Center of the oval (repeated)
    line6 db "   ********        ", 10         ; Inner side curve (symmetric with line2)
    line7 db "     *****         ", 10         ; Bottom curve of the oval (symmetric with line1)

    ; --- Define the length of each line (used in syscall write) ---
    len1 equ $ - line1               ; Length of line1
    len2 equ $ - line2               ; Length of line2
    len3 equ $ - line3               ; Length of line3
    len4 equ $ - line4               ; Length of line4
    len5 equ $ - line5               ; Length of line5
    len6 equ $ - line6               ; Length of line6
    len7 equ $ - line7               ; Length of line7

section .text
    global _start                    ; Entry point of the program

_start:
    ; --- Print line1 ---
    mov rax, 1                       ; syscall number for write (rax = 1)
    mov rdi, 1                       ; file descriptor 1 = standard output (stdout)
    mov rsi, line1                   ; pointer to the string (line1)
    mov rdx, len1                    ; length of the string
    syscall                          ; call write(line1)

    ; --- Print line2 ---
    mov rsi, line2                   ; pointer to line2
    mov rdx, len2                    ; length of line2
    syscall                          ; write(line2)

    ; --- Print line3 ---
    mov rsi, line3                   ; pointer to line3
    mov rdx, len3                    ; length of line3
    syscall                          ; write(line3)

    ; --- Print line4 ---
    mov rsi, line4                   ; pointer to line4
    mov rdx, len4                    ; length of line4
    syscall                          ; write(line4)

    ; --- Print line5 ---
    mov rsi, line5                   ; pointer to line5
    mov rdx, len5                    ; length of line5
    syscall                          ; write(line5)

    ; --- Print line6 ---
    mov rsi, line6                   ; pointer to line6
    mov rdx, len6                    ; length of line6
    syscall                          ; write(line6)

    ; --- Print line7 ---
    mov rsi, line7                   ; pointer to line7
    mov rdx, len7                    ; length of line7
    syscall                          ; write(line7)

    ; --- Exit the program  ---
    mov rax, 60                      ; syscall number for exit (rax = 60)
    xor rdi, rdi                     ; exit code 0 (success)
    syscall                          ; call exit(0)
