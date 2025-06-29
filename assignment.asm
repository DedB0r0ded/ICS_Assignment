section .data

	;Strings
	main_menu_head db '====== PART A ======', 0xA, 'This is ICS Assignment Part A was completed by 6 (SIX) members of ICS-032025-VJA Group 4. All members\' names are listed below.', 0xA, 'To open menu with a member\'s shapes, type a digit from the menu and press ENTER', 0
	main_menu_head_len equ $ - main_menu_head

	main_menu_ali_msg db '1. ALI HASAN ABBOD ALAMMARI', 0xA, 0
	main_menu_ali_len equ $ - main_menu_ali
	main_menu_ali_id db 1

	main_menu_dar_msg db '2. DARREN CHUI WENG MUN', 0xA, 0
	main_menu_dar_len equ $ - main_menu_dar
	main_menu_dar_id db 2

	main_menu_alx_msg db '3. KURAPATKIN ALIAKSANDR', 0xA, 0
	main_menu_alx_len equ $ - main_menu_alx
	main_menu_alx_id db 3

	main_menu_moh_msg db '4. MOHAMED ABDIFATAH ALI', 0xA, 0
	main_menu_moh_len equ $ - main_menu_moh
	main_menu_moh_id db 4

	main_menu_sar_msg db '5. SARRVESH MATHIVANAN', 0xA, 0
	main_menu_sar_len equ $ - main_menu_sar
	main_menu_sar_id db 5

	main_menu_abd_msg db '6. ABDIHAKIM DAHIR ADAN FARAH', 0xA, 0
	main_menu_abd_len equ $ - main_menu_abd
	main_menu_abd_id db 6

	main_menu_quit_msg db '0. Close application', 0xA, 0
	main_menu_quit_len equ $ - main_menu_quit
	
	ret_msg db '0. Return to the main menu', 0xA, 0
	ret_menu_id db 0

	
	ali_menu_msg db 'Shapes by ALI HASAN ABBOD ALAMMARI', 0xA, 0
	ali_menu_len equ $ - ali_menu_msg

	dar_menu_msg db 'Shapes by DARREN CHUI WENG MUN', 0xA, 0
	dar_menu_len equ $ - dar_menu_msg

	alx_menu_msg db 'Shapes by KURAPATKIN ALIAKSANDR', 0xA, 0
	alx_menu_len equ $ - alx_menu_msg

	moh_menu_msg db 'Shapes by MOHAMED ABDIFATAH ALI', 0xA, 0
	moh_menu_len equ $ - moh_menu_msg

	sar_menu_msg db 'Shapes by SARRVESH MATHIVANAN', 0xA, 0
	sar_menu_len equ $ - sar_menu_msg
	
	abd_menu_msg db 'Shapes by ABDIHAKIM DAHIR ADAN FARAH', 0xA, 0
	abd_menu_len equ $ - abd_menu_msg

	
	; Ali Hasan Abbod Alammari
	square_menu_msg db '1. Square', 0xA, 0
	square_menu_len equ $ - square_menu_msg
	square_menu_id db 1
	triangle_menu_msg db '2. Triangle', 0xA, 0
	triangle_menu_len equ $ - triangle_menu_msg
	triangle_menu_id db 2

	; Darren Chui Weng Mun
	point_menu_msg db '1. Pixel (Point)', 0xA, 0
	point_menu_len equ equ $ - point_menu_msg
	point_menu_id db 1
	arrow_menu_msg db '2. Arrow', 0xA, 0
	arrow_menu_len equ equ $ - arrow_menu_len
	arrow_menu_id db 2
	
	; Kurapatkin Aliaksandr
	line_menu_msg db '1. Line', 0xA, 0
	line_menu_len equ equ $ - line_menu_msg
	line_menu_id db 1
	rect_menu_msg db '2. Rectangle', 0xA, 0
	rect_menu_len equ equ $ - rect_menu_msg
	rect_menu_id db 2

	; Mohamed Abdifatah Ali
	cresent_menu_msg db '1. Cresent', 0xA, 0
	cresent_menu_len equ $ - cresent_menu_msg
	cresent_menu_id db 1
	ellipse_menu_msg db '2. Ellipse', 0xA, 0
	ellipse_menu_len equ $ - ellipse_menu_msg
	ellipse_menu_id db 2

	; Sarrvesh Mathivanan
	polygon_menu_msg db '1. Polygon', 0xA, 0
	polygon_menu_len equ $ - polygon_menu_msg
	polygon_menu_id db 1
	star_menu_msg db '2. Star', 0xA, 0
	star_menu_len equ $ - star_menu_msg
	star_menu_id db 2

	;abdihakim dahir
	diamond_menu_msg db '1. Diamond', 0xA, 0
	diamond_menu_len equ $ - diamond_menu_msg
	diamond_menu_id db 1
	heart_menu_msg db '2. Heart', 0xA, 0
	heart_menu_len equ $ - heart_menu_msg
	heart_menu_id db 2


	; Common
	newline db 10
	red_color db 27, '[', '3', '1', 'm' ; ANSI escape sequence for red
	reset_color db 27, '[', '0', 'm'

	; Ali Hasan Abbod Alammari
	ali_char db '#'

	; Darren Chui Weng Mun
	dar_pixel db '*', 10 ; Character + newline
	arrow_head1 db '   #   ', 10 		; 8 bytes including newline
	arrow_head2 db '  ###  ', 10
	arrow_head3 db ' ##### ', 10
	arrow_shaft db '   #   ', 10
	

