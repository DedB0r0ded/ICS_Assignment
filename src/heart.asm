section .data
    space db ' ', 0
    heart db '#', 0
    newline db 10, 0

section .text
    global _start

_start:
    ; Large Heart pattern - Row 1: "   ###     ###   "
    call print_3_spaces
    call print_3_hearts
    call print_5_spaces
    call print_3_hearts
    call print_3_spaces
    call print_newline
    
    ; Row 2: "  #####   #####  "
    call print_2_spaces
    call print_5_hearts
    call print_3_spaces
    call print_5_hearts
    call print_2_spaces
    call print_newline
    
    ; Row 3: " ####### ####### "
    call print_1_space
    call print_7_hearts
    call print_1_space
    call print_7_hearts
    call print_1_space
    call print_newline
    
    ; Row 4: "#################"
    call print_17_hearts
    call print_newline
    
    ; Row 5: " ############### "
    call print_1_space
    call print_15_hearts
    call print_1_space
    call print_newline
    
    ; Row 6: "  #############  "
    call print_2_spaces
    call print_13_hearts
    call print_2_spaces
    call print_newline
    
    ; Row 7: "   ###########   "
    call print_3_spaces
    call print_11_hearts
    call print_3_spaces
    call print_newline
    
    ; Row 8: "    #########    "
    call print_4_spaces
    call print_9_hearts
    call print_4_spaces
    call print_newline
    
    ; Row 9: "     #######     "
    call print_5_spaces
    call print_7_hearts
    call print_5_spaces
    call print_newline
    
    ; Row 10: "      #####      "
    call print_6_spaces
    call print_5_hearts
    call print_6_spaces
    call print_newline
    
    ; Row 11: "       ###       "
    call print_7_spaces
    call print_3_hearts
    call print_7_spaces
    call print_newline
    
    ; Row 12: "        #        "
    call print_8_spaces
    call print_1_heart
    call print_8_spaces
    call print_newline

    jmp exit_program

; Print functions for different counts
print_1_space:
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    ret

print_2_spaces:
    call print_1_space
    call print_1_space
    ret

print_3_spaces:
    call print_2_spaces
    call print_1_space
    ret

print_4_spaces:
    call print_3_spaces
    call print_1_space
    ret

print_5_spaces:
    call print_4_spaces
    call print_1_space
    ret

print_6_spaces:
    call print_5_spaces
    call print_1_space
    ret

print_7_spaces:
    call print_6_spaces
    call print_1_space
    ret

print_8_spaces:
    call print_7_spaces
    call print_1_space
    ret

print_1_heart:
    mov rax, 1
    mov rdi, 1
    mov rsi, heart
    mov rdx, 1
    syscall
    ret

print_3_hearts:
    call print_1_heart
    call print_1_heart
    call print_1_heart
    ret

print_5_hearts:
    call print_3_hearts
    call print_1_heart
    call print_1_heart
    ret

print_7_hearts:
    call print_5_hearts
    call print_1_heart
    call print_1_heart
    ret

print_9_hearts:
    call print_7_hearts
    call print_1_heart
    call print_1_heart
    ret

print_11_hearts:
    call print_9_hearts
    call print_1_heart
    call print_1_heart
    ret

print_13_hearts:
    call print_11_hearts
    call print_1_heart
    call print_1_heart
    ret

print_15_hearts:
    call print_13_hearts
    call print_1_heart
    call print_1_heart
    ret

print_17_hearts:
    call print_15_hearts
    call print_1_heart
    call print_1_heart
    ret

print_newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    ret

exit_program:
    mov rax, 60
    mov rdi, 0
    syscall
