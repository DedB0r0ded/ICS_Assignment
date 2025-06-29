section .data
    ; --- Define each moh_cresent_line of the ASCII oval followed by a newmoh_cresent_line character ---
    moh_cresent_line1 db "     *****         ", 10         ; Top curve of the oval
    moh_cresent_line2 db "   ********        ", 10         ; Inner side curve
    moh_cresent_line3 db "  ***              ", 10         ; Wider middle part
    moh_cresent_line4 db " ***               ", 10         ; Center of the oval (repeated)
    moh_cresent_line5 db "  ***              ", 10         ; Center of the oval (repeated)
    moh_cresent_line6 db "   ********        ", 10         ; Inner side curve (symmetric with moh_cresent_line2)
    moh_cresent_line7 db "     *****         ", 10         ; Bottom curve of the oval (symmetric with moh_cresent_line1)

    ; --- Define the moh_cresent_length of each moh_cresent_line (used in syscall write) ---
    moh_cresent_len1 equ $ - moh_cresent_line1               ; moh_cresent_length of moh_cresent_line1
    moh_cresent_len2 equ $ - moh_cresent_line2               ; moh_cresent_length of moh_cresent_line2
    moh_cresent_len3 equ $ - moh_cresent_line3               ; moh_cresent_length of moh_cresent_line3
    moh_cresent_len4 equ $ - moh_cresent_line4               ; moh_cresent_length of moh_cresent_line4
    moh_cresent_len5 equ $ - moh_cresent_line5               ; moh_cresent_length of moh_cresent_line5
    moh_cresent_len6 equ $ - moh_cresent_line6               ; moh_cresent_length of moh_cresent_line6
    moh_cresent_len7 equ $ - moh_cresent_line7               ; moh_cresent_length of moh_cresent_line7

section .text
    global _start                    ; Entry point of the program

_start:
    ; --- Print moh_cresent_line1 ---
    mov rax, 1                       ; syscall number for write (rax = 1)
    mov rdi, 1                       ; file descriptor 1 = standard output (stdout)
    mov rsi, moh_cresent_line1                   ; pointer to the string (moh_cresent_line1)
    mov rdx, moh_cresent_len1                    ; moh_cresent_length of the string
    syscall                          ; call write(moh_cresent_line1)

    ; --- Print moh_cresent_line2 ---
    mov rsi, moh_cresent_line2                   ; pointer to moh_cresent_line2
    mov rdx, moh_cresent_len2                    ; moh_cresent_length of moh_cresent_line2
    syscall                          ; write(moh_cresent_line2)

    ; --- Print moh_cresent_line3 ---
    mov rsi, moh_cresent_line3                   ; pointer to moh_cresent_line3
    mov rdx, moh_cresent_len3                    ; moh_cresent_length of moh_cresent_line3
    syscall                          ; write(moh_cresent_line3)

    ; --- Print moh_cresent_line4 ---
    mov rsi, moh_cresent_line4                   ; pointer to moh_cresent_line4
    mov rdx, moh_cresent_len4                    ; moh_cresent_length of moh_cresent_line4
    syscall                          ; write(moh_cresent_line4)

    ; --- Print moh_cresent_line5 ---
    mov rsi, moh_cresent_line5                   ; pointer to moh_cresent_line5
    mov rdx, moh_cresent_len5                    ; moh_cresent_length of moh_cresent_line5
    syscall                          ; write(moh_cresent_line5)

    ; --- Print moh_cresent_line6 ---
    mov rsi, moh_cresent_line6                   ; pointer to moh_cresent_line6
    mov rdx, moh_cresent_len6                    ; moh_cresent_length of moh_cresent_line6
    syscall                          ; write(moh_cresent_line6)

    ; --- Print moh_cresent_line7 ---
    mov rsi, moh_cresent_line7                   ; pointer to moh_cresent_line7
    mov rdx, moh_cresent_len7                    ; moh_cresent_length of moh_cresent_line7
    syscall                          ; write(moh_cresent_line7)

    ; --- Exit the program  ---
    mov rax, 60                      ; syscall number for exit (rax = 60)
    xor rdi, rdi                     ; exit code 0 (success)
    syscall                          ; call exit(0)
