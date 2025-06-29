INPUT_BUFFER_LENGTH equ 10
EOL equ 0xA 	; End of line (new line)
EOS equ 0 		; End of string

SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60
STDOUT equ 1
STDIN equ 0

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
    ret_menu_id db '0'
    menu_prompt db 'Select option: ', EOS
	menu_prompt_len equ $ - menu_prompt
	main_menu_id_min db '0'
	main_menu_id_max db '6'
	
	
	; Error messages to norify user in case of incorrect input
	menu_input_too_long_msg db 'Error: too many characters. Try again'
	menu_input_too_long_len equ $ - menu_input_too_long_msg
	menu_input_too_short_msg db 'Error: empty input. Try again'
	menu_input_too_short_len equ $ - menu_input_too_short_msg
	menu_input_invalid_range_msg db 'Error: character entered is out of valid range. Try again'
	menu_input_invalid_range_len equ $ - menu_input_invalid_range_msg

    
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
    arrow_head1 db '    #    ', 10          ; 8 bytes including newline
    arrow_head2 db '   ###   ', 10
    arrow_head3 db '  #####  ', 10
    arrow_shaft db '    #    ', 10

    
    ; Kurapatkin ALIAKSANDR
    alx_char db '*', 0

    
    ; Mohamed Abdifatah ALI
    ; Each line of text ends with ASCII NL (0x0A = 10)
    moh_ellipse_line1    db "          *** ", 10
    moh_ellipse_line2    db "        ******* ", 10
    moh_ellipse_line3    db "      *********** ", 10
    moh_ellipse_line4    db "    ************* ", 10
    moh_ellipse_line5    db "   *************** ", 10
    moh_ellipse_line6    db "   *************** ", 10
    moh_ellipse_line7    db "   *************** ", 10
    moh_ellipse_line8    db "   *************** ", 10
    moh_ellipse_line9    db "   *************** ", 10
    moh_ellipse_line10   db "    ************* ", 10
    moh_ellipse_line11   db "      *********** ", 10
    moh_ellipse_line12   db "       ********* ", 10
    moh_ellipse_line13   db "        ******* ", 10
    moh_ellipse_line14   db "          *** ", 10

    ; Compute lengths of each line (address of $ minus start of label)
    moh_ellipse_len1     equ $ - moh_ellipse_line1 ; Corrected
    moh_ellipse_len2     equ $ - moh_ellipse_line2 ; Corrected
    moh_ellipse_len3     equ $ - moh_ellipse_line3 ; Corrected
    moh_ellipse_len4     equ $ - moh_ellipse_line4 ; Corrected
    moh_ellipse_len5     equ $ - moh_ellipse_line5 ; Corrected
    moh_ellipse_len6     equ $ - moh_ellipse_line6 ; Corrected
    moh_ellipse_len7     equ $ - moh_ellipse_line7 ; Corrected
    moh_ellipse_len8     equ $ - moh_ellipse_line8 ; Corrected
    moh_ellipse_len9     equ $ - moh_ellipse_line9 ; Corrected
    moh_ellipse_len10    equ $ - moh_ellipse_line10 ; Corrected
    moh_ellipse_len11    equ $ - moh_ellipse_line11 ; Corrected
    moh_ellipse_len12    equ $ - moh_ellipse_line12 ; Corrected
    moh_ellipse_len13    equ $ - moh_ellipse_line13 ; Corrected
    moh_ellipse_len14    equ $ - moh_ellipse_line14 ; Corrected

    ; --- Define each line of the ASCII oval followed by a newline character ---
	moh_cresent_line1 db "      ***** ", 10        ; Top curve of the oval
	moh_cresent_line2 db "    ******** ", 10        ; Inner side curve
	moh_cresent_line3 db "  *** ", 10        ; Wider middle part
	moh_cresent_line4 db " *** ", 10        ; Center of the oval (repeated)
	moh_cresent_line5 db "  *** ", 10        ; Center of the oval (repeated)
	moh_cresent_line6 db "    ******** ", 10        ; Inner side curve (symmetric with line2)
	moh_cresent_line7 db "      ***** ", 10        ; Bottom curve of the oval (symmetric with line1)

	; --- Define the length of each line (used in syscall write) ---
	moh_cresent_len1 equ $ - moh_cresent_line1 ; Corrected
	moh_cresent_len2 equ $ - moh_cresent_line2 ; Corrected
	moh_cresent_len3 equ $ - moh_cresent_line3 ; Corrected
	moh_cresent_len4 equ $ - moh_cresent_line4 ; Corrected
	moh_cresent_len5 equ $ - moh_cresent_line5 ; Corrected
	moh_cresent_len6 equ $ - moh_cresent_line6 ; Corrected
	moh_cresent_len7 equ $ - moh_cresent_line7 ; Corrected

    
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


; ============== INPUT MACROS ==============
%macro get_input 0
	; Clear the buffer before input
	mov rdi, input_buffer
	mov rcx, INPUT_BUFFER_LENGTH
	xor al, al
	rep stosb ; Iterate through all string and fill it with empty bytes
	
	mov rax, 0	; sys_read
	mov rdi, 0	; stdin
	mov rsi, input_buffer			; buffer
	mov rdx, INPUT_BUFFER_LENGTH	; buffer length
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
	mov rdi, input_buffer
	mov rcx, INPUT_BUFFER_LENGTH
	xor al, al
	rep stosb ; Iterate through all string and fill it with empty bytes
	
	mov rax, 0	; sys_read
	mov rdi, 0	; stdin
	mov rsi, input_buffer			; buffer
	mov rdx, INPUT_BUFFER_LENGTH	; buffer length
	
	cmp rax, 2					; 1 character + new line expected (2 in total)
	jg invalid_input_too_long 	; error if more than 2 characters
	cmp rax, 1					; if less than 2 characters
	jle invalid_input_too_short
	
	mov al, [input_buffer]
	
jump_to_submenu:
	cmp al, [ret_menu_id]
	je exit
	
	cmp al, [main_menu_ali_id]
	je ali_menu
	
	cmp al, [main_menu_dar_id]
	je dar_menu
	
	cmp al, [main_menu_alx_id]
	je alx_menu
	
	cmp al, [main_menu_moh_id]
	je moh_menu
	
	cmp al, [main_menu_sar_id]
	je sar_menu
	
	cmp al, [main_menu_abd_id]
	je abd_menu
	
	jmp invalid_input_range
	

ali_menu:
	print_msg ali_menu_msg, ali_menu_len
	print_msg square_menu_msg, square_menu_len
	print_msg triangle_menu_msg, triangle_menu_len
	jmp main_loop
	
dar_menu:
	print_msg dar_menu_msg, dar_menu_len
	print_msg point_menu_msg, point_menu_len
	print_msg arrow_menu_msg, arrow_menu_len
	jmp main_loop

alx_menu:
	print_msg alx_menu_msg, alx_menu_len
	print_msg line_menu_msg, line_menu_len
	print_msg rect_menu_msg, rect_menu_len
	jmp main_loop

moh_menu:
	print_msg moh_menu_msg, moh_menu_len
	print_msg cresent_menu_msg, cresent_menu_len
	print_msg ellipse_menu_msg, ellipse_menu_len
	jmp main_loop

sar_menu:
	print_msg sar_menu_msg, sar_menu_len
	print_msg polygon_menu_msg, polygon_menu_len
	print_msg star_menu_msg, star_menu_len
	jmp main_loop

abd_menu:
	print_msg abd_menu_msg, abd_menu_len
	print_msg diamond_menu_msg, diamond_menu_len
	print_msg heart_menu_msg, heart_menu_len
	jmp main_loop
	
	
invalid_input_too_long:
    print_msg menu_input_too_long_msg, menu_input_too_long_len
    jmp main_input

invalid_input_too_short:
    print_msg menu_input_too_short_msg, menu_input_too_short_len
    jmp main_input

invalid_input_range:
    print_msg menu_input_invalid_range_msg, menu_input_invalid_range_len
    jmp main_input


exit:
    mov rax, 60
    xor rdi, rdi
    syscall
