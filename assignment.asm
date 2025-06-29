; Constants
INPUT_BUFFER_LENGTH equ 10

EOL equ 0xA 	; End of line (new line)
EOS equ 0 		; End of string

SYS_READ 	equ 0
SYS_WRITE 	equ 1
SYS_EXIT 	equ 60
STDOUT 		equ 1
STDIN 		equ 0


section .data
    ;Strings
    main_menu_head1 db '================ MENU ================', EOL, EOS
    main_menu_head1_len equ $ - main_menu_head1
    main_menu_head2 db 'This is ICS Assignment Part A that was completed by 6 (SIX) members of ICS-032025-VJA Group 4.', EOS
    main_menu_head2_len equ $ - main_menu_head2
    main_menu_head3 db ' All members names are listed below.', EOL, EOS
    main_menu_head3_len equ $ - main_menu_head3
    main_menu_head4 db 'To open menu with a members shapes, type a digit from the menu and press ENTER', EOL, EOS
    main_menu_head4_len equ $ - main_menu_head4
	main_menu_head5 db '======================================', EOL, EOS
	main_menu_head5_len equ $ - main_menu_head5

    main_menu_ali_msg db '1. ALI HASAN ABBOD ALAMMARI', EOL, EOS
    main_menu_ali_len equ $ - main_menu_ali_msg 
    main_menu_ali_id db '1'

    main_menu_dar_msg db '2. DARREN CHUI WENG MUN', EOL, EOS
    main_menu_dar_len equ $ - main_menu_dar_msg 
    main_menu_dar_id db '2'

    main_menu_alx_msg db '3. KURAPATKIN ALIAKSANDR', EOL, EOS
    main_menu_alx_len equ $ - main_menu_alx_msg 
    main_menu_alx_id db '3'

    main_menu_moh_msg db '4. MOHAMED ABDIFATAH ALI', EOL, EOS
    main_menu_moh_len equ $ - main_menu_moh_msg 
    main_menu_moh_id db '4'

    main_menu_sar_msg db '5. SARRVESH MATHIVANAN', EOL, EOS
    main_menu_sar_len equ $ - main_menu_sar_msg 
    main_menu_sar_id db '5'

    main_menu_abd_msg db '6. ABDIHAKIM DAHIR ADAN FARAH', EOL, EOS
    main_menu_abd_len equ $ - main_menu_abd_msg 
    main_menu_abd_id db '6'

    main_menu_quit_msg db '0. Close application', EOL, EOS
    main_menu_quit_len equ $ - main_menu_quit_msg 
    
    ret_msg db '0. Return to the main menu', EOL, EOS
	ret_msg_len equ $ - ret_msg
    ret_menu_id db '0'
    menu_prompt db 'Select option: ', EOS
	menu_prompt_len equ $ - menu_prompt
	main_menu_id_min db '0'
	main_menu_id_max db '6'
	
	
	; Error messages to norify user in case of incorrect input
	menu_input_too_long_msg db 'Error: too many characters. Try again', EOL, EOS
	menu_input_too_long_len equ $ - menu_input_too_long_msg
	menu_input_too_short_msg db 'Error: empty input. Try again', EOL, EOS
	menu_input_too_short_len equ $ - menu_input_too_short_msg
	menu_input_invalid_range_msg db 'Error: character entered is out of valid range. Try again', EOL, EOS
	menu_input_invalid_range_len equ $ - menu_input_invalid_range_msg

    
	; Submenus
    ali_menu_msg db 'Shapes by ALI HASAN ABBOD ALAMMARI', EOL, EOS
    ali_menu_len equ $ - ali_menu_msg

    dar_menu_msg db 'Shapes by DARREN CHUI WENG MUN', EOL, EOS
    dar_menu_len equ $ - dar_menu_msg

    alx_menu_msg db 'Shapes by KURAPATKIN ALIAKSANDR', EOL, EOS
    alx_menu_len equ $ - alx_menu_msg

    moh_menu_msg db 'Shapes by MOHAMED ABDIFATAH ALI', EOL, EOS
    moh_menu_len equ $ - moh_menu_msg

    sar_menu_msg db 'Shapes by SARRVESH MATHIVANAN', EOL, EOS
    sar_menu_len equ $ - sar_menu_msg
    
    abd_menu_msg db 'Shapes by ABDIHAKIM DAHIR ADAN FARAH', EOL, EOS
    abd_menu_len equ $ - abd_menu_msg

    
    ; Ali Hasan Abbod Alammari
    square_menu_msg db '1. Square', EOL, EOS
    square_menu_len equ $ - square_menu_msg
    square_menu_id db '1'
    triangle_menu_msg db '2. Triangle', EOL, EOS
    triangle_menu_len equ $ - triangle_menu_msg
    triangle_menu_id db '2'

    ; Darren Chui Weng Mun
    point_menu_msg db '1. Pixel (Point)', EOL, EOS
    point_menu_len equ $ - point_menu_msg
    point_menu_id db '1'
    arrow_menu_msg db '2. Arrow', EOL, EOS
    arrow_menu_len equ $ - arrow_menu_msg ; Corrected: Was arrow_menu_len
    arrow_menu_id db '2'
    
    ; Kurapatkin Aliaksandr
    line_menu_msg db '1. Line', EOL, EOS
    line_menu_len equ $ - line_menu_msg
    line_menu_id db '1'
    rect_menu_msg db '2. Rectangle', EOL, EOS
    rect_menu_len equ $ - rect_menu_msg
    rect_menu_id db '2'

    ; Mohamed Abdifatah Ali
    cresent_menu_msg db '1. Cresent', EOL, EOS
    cresent_menu_len equ $ - cresent_menu_msg
    cresent_menu_id db '1'
    ellipse_menu_msg db '2. Ellipse', EOL, EOS
    ellipse_menu_len equ $ - ellipse_menu_msg
    ellipse_menu_id db '2'

    ; Sarrvesh Mathivanan
    polygon_menu_msg db '1. Polygon', EOL, EOS
    polygon_menu_len equ $ - polygon_menu_msg
    polygon_menu_id db '1'
    star_menu_msg db '2. Star', EOL, EOS
    star_menu_len equ $ - star_menu_msg
    star_menu_id db '2'

    ;abdihakim dahir
    diamond_menu_msg db '1. Diamond', EOL, EOS
    diamond_menu_len equ $ - diamond_menu_msg
    diamond_menu_id db '1'
    heart_menu_msg db '2. Heart', EOL, EOS
    heart_menu_len equ $ - heart_menu_msg
    heart_menu_id db '2'


    ; Common
    newline db EOL
    space db ' ', EOS
    red_color db 27, '[', '3', '1', 'm' ; ANSI escape sequence for red
    reset_color db 27, '[', '0', 'm'


    ; Ali Hasan Abbod Alammari
    ali_char db '#'


    ; Darren Chui Weng Mun
    dar_pixel db '*', 10 ; Character + newline
    arrow_head1 db '   #   ', 10          ; 8 bytes including newline
    arrow_head2 db '  ###  ', 10
    arrow_head3 db ' ##### ', 10
    arrow_shaft db '   #   ', 10

    
    ; Kurapatkin ALIAKSANDR
    alx_char db '*', 0

    
    ; Mohamed Abdifatah ALI
    ; Each line of text ends with ASCII NL (0x0A = 10)
    moh_ellipse_line1    db "         *** ", 10
    moh_ellipse_line2    db "       ******* ", 10
    moh_ellipse_line3    db "     *********** ", 10
    moh_ellipse_line4    db "    ************* ", 10
    moh_ellipse_line5    db "   *************** ", 10
    moh_ellipse_line6    db "   *************** ", 10
    moh_ellipse_line7    db "   *************** ", 10
    moh_ellipse_line8    db "   *************** ", 10
    moh_ellipse_line9    db "   *************** ", 10
    moh_ellipse_line10   db "    ************* ", 10
    moh_ellipse_line11   db "     *********** ", 10
    moh_ellipse_line12   db "      ********* ", 10
    moh_ellipse_line13   db "       ******* ", 10
    moh_ellipse_line14   db "         *** ", 10

    ; Compute lengths of each line (address of $ minus start of label)
    moh_ellipse_len1     equ $ - moh_ellipse_line1 
    moh_ellipse_len2     equ $ - moh_ellipse_line2 
    moh_ellipse_len3     equ $ - moh_ellipse_line3 
    moh_ellipse_len4     equ $ - moh_ellipse_line4 
    moh_ellipse_len5     equ $ - moh_ellipse_line5 
    moh_ellipse_len6     equ $ - moh_ellipse_line6 
    moh_ellipse_len7     equ $ - moh_ellipse_line7 
    moh_ellipse_len8     equ $ - moh_ellipse_line8 
    moh_ellipse_len9     equ $ - moh_ellipse_line9 
    moh_ellipse_len10    equ $ - moh_ellipse_line10 
    moh_ellipse_len11    equ $ - moh_ellipse_line11 
    moh_ellipse_len12    equ $ - moh_ellipse_line12 
    moh_ellipse_len13    equ $ - moh_ellipse_line13 
    moh_ellipse_len14    equ $ - moh_ellipse_line14 

    ; --- Define each line of the ASCII oval followed by a newline character ---
	moh_cresent_line1 db "      ***** ", 10        	; Top curve of the oval
	moh_cresent_line2 db "    ******** ", 10        ; Inner side curve
	moh_cresent_line3 db "  *** ", 10        		; Wider middle part
	moh_cresent_line4 db " *** ", 10        		; Center of the oval (repeated)
	moh_cresent_line5 db "  *** ", 10        		; Center of the oval (repeated)
	moh_cresent_line6 db "    ******** ", 10        ; Inner side curve (symmetric with line2)
	moh_cresent_line7 db "      ***** ", 10        	; Bottom curve of the oval (symmetric with line1)

	; --- Define the length of each line (used in syscall write) ---
	moh_cresent_len1 equ $ - moh_cresent_line1 
	moh_cresent_len2 equ $ - moh_cresent_line2 
	moh_cresent_len3 equ $ - moh_cresent_line3 
	moh_cresent_len4 equ $ - moh_cresent_line4 
	moh_cresent_len5 equ $ - moh_cresent_line5 
	moh_cresent_len6 equ $ - moh_cresent_line6 
	moh_cresent_len7 equ $ - moh_cresent_line7 

    
    ; Sarrvesh MATHIVANAN
    sar_char db '#'
    sar_triangle_height dq 6 ; You can set any height here
    sar_size dq 7            ; Must be an odd number
    

    ;abdihakim dahir
    abd_char db '#', 0


section .bss
	input_buffer resb INPUT_BUFFER_LENGTH
	

section .text
    global _start

; ============= SUBMENU MACRO ==============
%macro submenu 4
	call get_input
	cmp al, [ret_menu_id] 	; if user wants to go back to main menu
	je main_loop			; jump to main_loop label
	
	cmp al, [%1] ; 1 parameter - id of the first menu option
	je %2	; label to jump if the first menu option selected
	
	cmp al, [%3] ; 3 parameter - id of the second menu option
	je %4	; label to jump if the second menu option selected
	
	jmp invalid_input_range ; if input value out of range - show an error
%endmacro

; ============== OUTPUT MACRO ==============
%macro print_msg 2
    mov rax, 1	; sys_print
    mov rdi, 1	; stdout
    mov rsi, %1 ; text
    mov rdx, %2 ; length
    syscall
%endmacro


_start:
main_loop:
show_main_menu:
    print_msg main_menu_head1, main_menu_head1_len
    print_msg main_menu_head2, main_menu_head2_len
    print_msg main_menu_head3, main_menu_head3_len
    print_msg main_menu_head4, main_menu_head4_len
	print_msg main_menu_head5, main_menu_head5_len
	
    print_msg main_menu_ali_msg, main_menu_ali_len
    print_msg main_menu_dar_msg, main_menu_dar_len
    print_msg main_menu_alx_msg, main_menu_alx_len
    print_msg main_menu_moh_msg, main_menu_moh_len 
    print_msg main_menu_sar_msg, main_menu_sar_len
    print_msg main_menu_abd_msg, main_menu_abd_len
    print_msg main_menu_quit_msg, main_menu_quit_len
	
	
main_input:
    print_msg menu_prompt, menu_prompt_len
    ; Clear the buffer before input
	call get_input
	
jump_to_submenu:
	cmp al, [ret_menu_id]
	je exit
	
	cmp al, [main_menu_ali_id]
	je show_ali_menu
	
	cmp al, [main_menu_dar_id]
	je show_dar_menu
	
	cmp al, [main_menu_alx_id]
	je show_alx_menu
	
	cmp al, [main_menu_moh_id]
	je show_moh_menu
	
	cmp al, [main_menu_sar_id]
	je show_sar_menu
	
	cmp al, [main_menu_abd_id]
	je show_abd_menu
	
	jmp invalid_input_range
	

show_ali_menu:
	print_msg ali_menu_msg, ali_menu_len
	print_msg square_menu_msg, square_menu_len
	print_msg triangle_menu_msg, triangle_menu_len
	print_msg ret_msg, ret_msg_len 
	submenu square_menu_id, draw_square, triangle_menu_id, draw_triangle
	
show_dar_menu:
	print_msg dar_menu_msg, dar_menu_len
	print_msg point_menu_msg, point_menu_len
	print_msg arrow_menu_msg, arrow_menu_len
	print_msg ret_msg, ret_msg_len 
	submenu point_menu_id, draw_point, arrow_menu_id, draw_arrow

show_alx_menu:
	print_msg alx_menu_msg, alx_menu_len
	print_msg line_menu_msg, line_menu_len
	print_msg rect_menu_msg, rect_menu_len
	print_msg ret_msg, ret_msg_len 
	submenu line_menu_id, draw_line, rect_menu_id, draw_rect

show_moh_menu:
	print_msg moh_menu_msg, moh_menu_len
	print_msg cresent_menu_msg, cresent_menu_len
	print_msg ellipse_menu_msg, ellipse_menu_len
	print_msg ret_msg, ret_msg_len 
	submenu cresent_menu_id, draw_cresent, ellipse_menu_id, draw_ellipse

show_sar_menu:
	print_msg sar_menu_msg, sar_menu_len
	print_msg polygon_menu_msg, polygon_menu_len
	print_msg star_menu_msg, star_menu_len
	print_msg ret_msg, ret_msg_len 
	submenu polygon_menu_id, draw_polygon, star_menu_id, draw_star

show_abd_menu:
	print_msg abd_menu_msg, abd_menu_len
	print_msg diamond_menu_msg, diamond_menu_len
	print_msg heart_menu_msg, heart_menu_len
	print_msg ret_msg, ret_msg_len 
	submenu diamond_menu_id, draw_diamond, heart_menu_id, draw_heart
	
	
; Input handling
get_input:
	; Clear the buffer before input
	mov rdi, input_buffer
	mov rcx, INPUT_BUFFER_LENGTH
	xor al, al
	rep stosb ; Iterate through all string and fill it with empty bytes
	
	mov rax, 0	; sys_read
	mov rdi, 0	; stdin
	mov rsi, input_buffer			; buffer
	mov rdx, INPUT_BUFFER_LENGTH	; buffer length
	syscall
	
	cmp rax, 2					; 1 character + new line expected (2 in total)
	jg invalid_input_too_long 	; error if more than 2 characters
	cmp rax, 1					; if less than 2 characters
	jle invalid_input_too_short
	
	mov al, [input_buffer]
	ret
	

; Error messages printing
invalid_input_too_long:
    print_msg menu_input_too_long_msg, menu_input_too_long_len
    jmp main_input

invalid_input_too_short:
    print_msg menu_input_too_short_msg, menu_input_too_short_len
    jmp main_input

invalid_input_range:
    print_msg menu_input_invalid_range_msg, menu_input_invalid_range_len
    jmp main_input


; ==================== Ali Hasan Abbod Alammari ====================
draw_square:
	; Set red color
    mov rax, 1
    mov rdi, 1
    mov rsi, red_color
    mov rdx, 5
    syscall

    mov r8, 5          ; row counter

.row_loop:
    mov r9, 5          ; column counter

.col_loop:
    ; print '# '
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, ali_char
    mov rdx, 2         ; 2 bytes: '#' and ' '
    syscall

    dec r9
    jnz .col_loop

    ; print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    dec r8
    jnz .row_loop

    ; Reset color
    mov rax, 1
    mov rdi, 1
    mov rsi, reset_color
    mov rdx, 4
    syscall

    ; exit
	jmp show_ali_menu
	
draw_triangle:
	; Set red color
    mov rax, 1
    mov rdi, 1
    mov rsi, red_color
    mov rdx, 5
    syscall

    mov r8, 1          ; row counter starts at 1

.row_loop:
    ; Print leading spaces
    mov r10, 5
    sub r10, r8

.print_spaces:
    cmp r10, 0
    je .print_hashes
    
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    
    dec r10
    jmp .print_spaces

.print_hashes:
    mov r9, r8

.hash_loop:
    ; print '#'
    mov rax, 1
    mov rdi, 1
    mov rsi, ali_char
    mov rdx, 1
    syscall

    ; print space if not last hash
    dec r9
    cmp r9, 0
    je .print_newline

    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

    jmp .hash_loop

.print_newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    inc r8
    cmp r8, 6
    jne .row_loop

    ; Reset terminal color
    mov rax, 1
    mov rdi, 1
    mov rsi, reset_color
    mov rdx, 4
    syscall

    ; exit
	jmp show_ali_menu
	
	
; ==================== Darren Chui Weng Mun ====================
draw_point:
	; Write the pixel to stdout using syscall
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, dar_pixel  ; address of character
    mov rdx, 2          ; length (char + newline)
    syscall

    ; Exit
	jmp show_dar_menu
	
draw_arrow:
	call .draw_arrow
    jmp .exit_program

.draw_arrow:
    ; Print arrow_head1
    mov rax, 1
    mov rdi, 1
    mov rsi, arrow_head1
    mov rdx, 8
    syscall
    
    ; Print arrow_head2
    mov rax, 1
    mov rdi, 1
    mov rsi, arrow_head2
    mov rdx, 8
    syscall
    
    ; Print arrow_head3
    mov rax, 1
    mov rdi, 1
    mov rsi, arrow_head3
    mov rdx, 8
    syscall
    
    ; Print shaft (4 lines)
    mov r8, 4
.draw_shaft:
    mov rax, 1
    mov rdi, 1
    mov rsi, arrow_shaft
    mov rdx, 8
    syscall
    dec r8
    cmp r8, 0
    jne .draw_shaft
    ret

.exit_program:
	jmp show_dar_menu
	
	
; ==================== Kurapatkin Aliaksandr ====================
draw_line:
	; Draw horizontal line of 20 asterisks
    push r12
	mov r12, 20        ; number of characters
    
.draw_line:
    ; Output '*' character
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, alx_char  ; address of character
    mov rdx, 1         ; length
    syscall
    
    dec r12
	jnz .draw_line
    
    ; Output newline
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, newline   ; address of newline character
    mov rdx, 1         ; length
    syscall
    
    ; Exit program
	pop r12
	jmp show_alx_menu
	
draw_rect:
	mov r8, 8          ; rectangle height
    mov r9, 0          ; row counter
    
.draw_rectangle:
    mov rcx, 15        ; rectangle width
    mov r10, 0         ; column counter
    
.draw_row:
    ; Check if we draw space or border
    cmp r9, 0          ; first row?
    je .draw_border
    cmp r9, 7          ; last row (height-1)?
    je .draw_border
    cmp r10, 0         ; first column?
    je .draw_border
    cmp r10, 14        ; last column (width-1)?
    je .draw_border
    
    ; Empty inside
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, space     ; space
    mov rdx, 1         ; length
    syscall
    jmp .next_char
    
.draw_border:
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, alx_char  ; alx_char
    mov rdx, 1         ; length
    syscall
    
.next_char:
    inc r10            ; next column
    cmp r10, 15        ; check if row end was reached
    jl .draw_row
    
    ; new line
    mov rax, 1         ; sys_write
    mov rdi, 1         ; stdout
    mov rsi, newline   ; new line
    mov rdx, 1         ; length
    syscall
    
    inc r9             ; new line
    cmp r9, 8          ; check if the rectangle end was reached
    jl .draw_rectangle
    
    ; Exit
	jmp show_alx_menu
	
	
; ==================== Mohamed Abdifatah Ali ====================
draw_cresent:
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
	jmp show_moh_menu
	
draw_ellipse:
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
	jmp show_moh_menu
	
	
; ==================== Sarrvesh Mathivanan ====================
draw_polygon:
	mov     rbx, [sar_triangle_height] 	; total rows
    mov     r13, rbx               		; use r13 as row counter

.draw_rows:
    cmp     r13, 0
    je      show_sar_menu
    push    r13

    mov     rbx, [sar_triangle_height]
    sub     rbx, r13               ; spaces = height - current row

.print_spaces:
    cmp     rbx, 0
    jle     .print_sar_chares
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, space
    mov     rdx, 1
    syscall
    dec     rbx
    jmp     .print_spaces

.print_sar_chares:
    mov     rbx, [sar_triangle_height]
    sub     rbx, r13
    imul    rbx, 2
    add     rbx, 1                 ; sar_chares = 2*(row-1)+1

.print_sar_char_loop:
    cmp     rbx, 0
    jle     .newline
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, sar_char
    mov     rdx, 1
    syscall
    dec     rbx
    jmp     .print_sar_char_loop

.newline:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, newline
    mov     rdx, 1
    syscall

    pop     r13
    dec     r13
    jmp     .draw_rows
	
draw_star:
	mov     rbx, [sar_size]     ; rbx = sar_size
    xor     r8, r8          	; r8 = row index

.row_loop:
    cmp     r8, rbx
    jge     show_sar_menu

    xor     r9, r9          ; r9 = column index

.col_loop:
    cmp     r9, rbx
    jge     .print_newline

    mov     rcx, rbx
    shr     rcx, 1          ; rcx = center = sar_size / 2

    ; abs(row - center)
    mov     r10, r8
    sub     r10, rcx
    cmp     r10, 0
    jns     .row_abs_ok
    neg     r10
.row_abs_ok:

    ; abs(col - center)
    mov     r11, r9
    sub     r11, rcx
    cmp     r11, 0
    jns     .col_abs_ok
    neg     r11
.col_abs_ok:

    ; Compare diagonals: abs(row-center) == abs(col-center)
    cmp     r10, r11
    je      .print_sar_char

    ; Or row is center line
    cmp     r8, rcx
    je      .print_sar_char

    jmp     .print_space

.print_sar_char:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, sar_char
    mov     rdx, 1
    syscall
    jmp     .next_col

.print_space:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, space
    mov     rdx, 1
    syscall

.next_col:
    inc     r9
    jmp     .col_loop

.print_newline:
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, newline
    mov     rdx, 1
    syscall

    inc     r8
    jmp     .row_loop

	
; ==================== hakim ====================
draw_diamond:
	; Set red color
    mov rax, 1
    mov rdi, 1
    mov rsi, red_color
    mov rdx, 5
    syscall
    ; Draw upper half of diamond
    mov r8, 1          ; row counter from 1 to 5
.upper_loop:
    ; Print leading spaces
    mov r10, 5
    sub r10, r8
.print_spaces_upper:
    cmp r10, 0
    je .print_hashes_upper
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    dec r10
    jmp .print_spaces_upper
.print_hashes_upper:
    mov r9, r8
.hash_loop_upper:
    ; print '#'
    mov rax, 1
    mov rdi, 1
    mov rsi, abd_char
    mov rdx, 1
    syscall
    ; print space if not last abd_char
    dec r9
    cmp r9, 0
    je .newline_upper
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    jmp .hash_loop_upper
.newline_upper:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    inc r8
    cmp r8, 6
    jne .upper_loop
    ; Draw lower half of diamond
    mov r8, 4          ; row counter from 4 to 1
.lower_loop:
    ; Print leading spaces
    mov r10, 5
    sub r10, r8
.print_spaces_lower:
    cmp r10, 0
    je .print_hashes_lower
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    dec r10
    jmp .print_spaces_lower
.print_hashes_lower:
    mov r9, r8
.hash_loop_lower:
    ; print '#'
    mov rax, 1
    mov rdi, 1
    mov rsi, abd_char
    mov rdx, 1
    syscall
    ; print space if not last abd_char
    dec r9
    cmp r9, 0
    je .newline_lower
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    jmp .hash_loop_lower
.newline_lower:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    dec r8
    cmp r8, 0
    jne .lower_loop
    ; Reset terminal color
    mov rax, 1
    mov rdi, 1
    mov rsi, reset_color
    mov rdx, 4
    syscall
	jmp show_abd_menu
	
draw_heart:
; Large heart pattern - Row 1: "   ###     ###   "
    call .print_3_spaces
    call .print_3_hearts
    call .print_5_spaces
    call .print_3_hearts
    call .print_3_spaces
    call .print_newline
    
    ; Row 2: "  #####   #####  "
    call .print_2_spaces
    call .print_5_hearts
    call .print_3_spaces
    call .print_5_hearts
    call .print_2_spaces
    call .print_newline
    
    ; Row 3: " ####### ####### "
    call .print_1_space
    call .print_7_hearts
    call .print_1_space
    call .print_7_hearts
    call .print_1_space
    call .print_newline
    
    ; Row 4: "#################"
    call .print_17_hearts
    call .print_newline
    
    ; Row 5: " ############### "
    call .print_1_space
    call .print_15_hearts
    call .print_1_space
    call .print_newline
    
    ; Row 6: "  #############  "
    call .print_2_spaces
    call .print_13_hearts
    call .print_2_spaces
    call .print_newline
    
    ; Row 7: "   ###########   "
    call .print_3_spaces
    call .print_11_hearts
    call .print_3_spaces
    call .print_newline
    
    ; Row 8: "    #########    "
    call .print_4_spaces
    call .print_9_hearts
    call .print_4_spaces
    call .print_newline
    
    ; Row 9: "     #######     "
    call .print_5_spaces
    call .print_7_hearts
    call .print_5_spaces
    call .print_newline
    
    ; Row 10: "      #####      "
    call .print_6_spaces
    call .print_5_hearts
    call .print_6_spaces
    call .print_newline
    
    ; Row 11: "       ###       "
    call .print_7_spaces
    call .print_3_hearts
    call .print_7_spaces
    call .print_newline
    
    ; Row 12: "        #        "
    call .print_8_spaces
    call .print_1_heart
    call .print_8_spaces
    call .print_newline
    jmp .exit_program
; Print functions for different counts
.print_1_space:
    mov rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall
    ret
.print_2_spaces:
    call .print_1_space
    call .print_1_space
    ret
.print_3_spaces:
    call .print_2_spaces
    call .print_1_space
    ret
.print_4_spaces:
    call .print_3_spaces
    call .print_1_space
    ret
.print_5_spaces:
    call .print_4_spaces
    call .print_1_space
    ret
.print_6_spaces:
    call .print_5_spaces
    call .print_1_space
    ret
.print_7_spaces:
    call .print_6_spaces
    call .print_1_space
    ret
.print_8_spaces:
    call .print_7_spaces
    call .print_1_space
    ret
.print_1_heart:
    mov rax, 1
    mov rdi, 1
    mov rsi, abd_char
    mov rdx, 1
    syscall
    ret
.print_3_hearts:
    call .print_1_heart
    call .print_1_heart
    call .print_1_heart
    ret
.print_5_hearts:
    call .print_3_hearts
    call .print_1_heart
    call .print_1_heart
    ret
.print_7_hearts:
    call .print_5_hearts
    call .print_1_heart
    call .print_1_heart
    ret
.print_9_hearts:
    call .print_7_hearts
    call .print_1_heart
    call .print_1_heart
    ret
.print_11_hearts:
    call .print_9_hearts
    call .print_1_heart
    call .print_1_heart
    ret
.print_13_hearts:
    call .print_11_hearts
    call .print_1_heart
    call .print_1_heart
    ret
.print_15_hearts:
    call .print_13_hearts
    call .print_1_heart
    call .print_1_heart
    ret
.print_17_hearts:
    call .print_15_hearts
    call .print_1_heart
    call .print_1_heart
    ret
.print_newline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    ret
.exit_program:
	jmp show_abd_menu
	
	
exit:
    mov rax, 60
    xor rdi, rdi
    syscall
