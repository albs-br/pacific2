; 0-2:		general
; 3-5:		-
; 6-15:		chars (0-9)
; 16-42:	chars (A-Z, .)
; 43-47:	-
; 48-255:	background tiles for scrolling (208 avaliable)
; bosses will use the same range as bg (no bg when facing bosses)
Tile_Sea_Number:	equ 0
Tile_Sea:                     ; Sea
	db  10000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000100 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 

Tile_Black_Number:	equ 1
Tile_Black:                 ; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 

Tile_Plane_Lifes:                 ; 
	db  00001000 b 		; 
	db  00001000 b 		; 
	db  01111111 b 		; 
	db  00111110 b 		; 
	db  00001000 b 		; 
	db  00001000 b 		; 
	db  00011100 b 		; 
	db  00000000 b 		; 

; ; -------------------
; ; Title screen
; StartTitleScreen:            ; 
; Tile_TitleScreen_001_Number:	equ 95
; Tile_TitleScreen_001:            ; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 
; 	db  01111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 

; ; Tile_TitleScreen_002_Number:	equ 96
; ; Tile_TitleScreen_002:            ; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 
; 	db  11111111 b 		; 

; ; Tile_TitleScreen_003_Number:	equ 97
; ; Tile_TitleScreen_003:            ; 
; 	db  11111000 b 		; 
; 	db  11111100 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 

; ; Tile_TitleScreen_004_Number:	equ 98
; ; Tile_TitleScreen_004:            ; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 

; ; Tile_TitleScreen_005_Number:	equ 99
; ; Tile_TitleScreen_005:            ; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111100 b 		; 
; 	db  11111000 b 		; 

; ; Tile_TitleScreen_006_Number:	equ 100
; ; Tile_TitleScreen_006:            ; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  01111111 b 		; 
; 	db  11111111 b 		; 

; ; Tile_TitleScreen_007_Number:	equ 101
; ; Tile_TitleScreen_007:            ; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 

; ; Tile_TitleScreen_008_Number:	equ 102
; ; Tile_TitleScreen_008:            ; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 

; ; Tile_TitleScreen_009_Number:	equ 103
; ; Tile_TitleScreen_009:            ; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11100000 b 		; 
; 	db  11110000 b 		; 

; ; Tile_TitleScreen_010_Number:	equ 104
; ; Tile_TitleScreen_010:            ; 
; 	db  00001111 b 		; 
; 	db  00011111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 

; ; Tile_TitleScreen_011_Number:	equ 105
; ; Tile_TitleScreen_011:            ; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00111111 b 		; 
; 	db  00011111 b 		; 
; 	db  00001111 b 		; 

; ; Tile_TitleScreen_012_Number:	equ 106
; ; Tile_TitleScreen_012:            ; 
; 	db  11110000 b 		; 
; 	db  11110000 b 		; 
; 	db  11110000 b 		; 
; 	db  11100000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 
; 	db  11000000 b 		; 

; ; Tile_TitleScreen_013_Number:	equ 107
; ; Tile_TitleScreen_013:            ; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111110 b 		; 
; 	db  11111100 b 		; 
; 	db  11111000 b 		; 



; EndTitleScreen:

; -------------------

Tile_Char_0_Number:	equ 6	;
Tile_Char_0:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00111100 b 		; 
	db  00000000 b 		; 

;Tile_Char_1_Number:	equ ?	;
Tile_Char_1:                     ;
	db  00111000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  01111110 b 		; 
	db  00000000 b 		; 

;Tile_Char_2_Number:	equ ?	;
Tile_Char_2:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  00000110 b 		; 
	db  00111100 b 		; 
	db  01100000 b 		; 
	db  01100000 b 		; 
	db  01111110 b 		; 
	db  00000000 b 		; 

;Tile_Char_3_Number:	equ ?	;
Tile_Char_3:                     ;
	db  01111110 b 		; 
	db  00000100 b 		; 
	db  00001000 b 		; 
	db  00011100 b 		; 
	db  00000110 b 		; 
	db  00000110 b 		; 
	db  01111100 b 		; 
	db  00000000 b 		; 

;Tile_Char_4_Number:	equ ?	;
Tile_Char_4:                     ;
	db  00001100 b 		; 
	db  00011100 b 		; 
	db  00101100 b 		; 
	db  01001100 b 		; 
	db  01111110 b 		; 
	db  00001100 b 		; 
	db  00011110 b 		; 
	db  00000000 b 		; 

; Tile_Char_5_Number:	equ ?	;
Tile_Char_5:                     ;
	db  01111100 b 		; 
	db  01000000 b 		; 
	db  01111100 b 		; 
	db  00000110 b 		; 
	db  00000110 b 		; 
	db  00000110 b 		; 
	db  01111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_6_Number:	equ ?	;
Tile_Char_6:                     ;
	db  00111100 b 		; 
	db  01100000 b 		; 
	db  01111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_7_Number:	equ ?	;
Tile_Char_7:                     ;
	db  01111110 b 		; 
	db  01000110 b 		; 
	db  00001100 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00000000 b 		; 

; Tile_Char_8_Number:	equ ?	;
Tile_Char_8:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_9_Number:	equ ?	;
Tile_Char_9:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00111110 b 		; 
	db  00000110 b 		; 
	db  00000110 b 		; 
	db  00111100 b 		; 
	db  00000000 b 		; 

Tile_Char_A_Number:	equ 16	; NOT same as ascii code for this char
Tile_Char_A:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01111110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00000000 b 		; 

; Tile_Char_B_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_B:                     ;
	db  01111100 b 		; 
	db  00110110 b 		; 
	db  00110110 b 		; 
	db  00111100 b 		; 
	db  00110110 b 		; 
	db  00110110 b 		; 
	db  01111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_C_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_C:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  01100000 b 		; 
	db  01100000 b 		; 
	db  01100000 b 		; 
	db  01100110 b 		; 
	db  00111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_D_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_D:                     ;
	db  01111100 b 		; 
	db  00110110 b 		; 
	db  00110110 b 		; 
	db  00110110 b 		; 
	db  00110110 b 		; 
	db  00110110 b 		; 
	db  01111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_E_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_E:                     ;
	db  01111110 b 		; 
	db  00110010 b 		; 
	db  00110000 b 		; 
	db  00111100 b 		; 
	db  00110000 b 		; 
	db  00110010 b 		; 
	db  01111110 b 		; 
	db  00000000 b 		; 

; Tile_Char_F_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_F:                     ;
	db  01111110 b 		; 
	db  00110010 b 		; 
	db  00110000 b 		; 
	db  00111100 b 		; 
	db  00110000 b 		; 
	db  00110000 b 		; 
	db  01111000 b 		; 
	db  00000000 b 		; 

; Tile_Char_G_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_G:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  01100000 b 		; 
	db  01101110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_H_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_H:                     ;
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01111110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00000000 b 		; 

; Tile_Char_I_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_I:                     ;
	db  01111110 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  01111110 b 		; 
	db  00000000 b 		; 

; Tile_Char_J_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_J:                     ;
	db  00011110 b 		; 
	db  00001100 b 		; 
	db  00001100 b 		; 
	db  00001100 b 		; 
	db  01101100 b 		; 
	db  01101100 b 		; 
	db  00111000 b 		; 
	db  00000000 b 		; 

; Tile_Char_K_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_K:                     ;
	db  01100010 b 		; 
	db  01100100 b 		; 
	db  01101000 b 		; 
	db  01110000 b 		; 
	db  01101000 b 		; 
	db  01100100 b 		; 
	db  01100010 b 		; 
	db  00000000 b 		; 

; Tile_Char_L_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_L:                     ;
	db  01111000 b 		; 
	db  00110000 b 		; 
	db  00110000 b 		; 
	db  00110000 b 		; 
	db  00110000 b 		; 
	db  00110010 b 		; 
	db  01111110 b 		; 
	db  00000000 b 		; 

; Tile_Char_M_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_M:                     ;
	db  01100010 b 		; 
	db  01110110 b 		; 
	db  01101010 b 		; 
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  00000000 b 		; 

; Tile_Char_N_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_N:                     ;
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  01110010 b 		; 
	db  01101010 b 		; 
	db  01100110 b 		; 
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  00000000 b 		; 

; Tile_Char_O_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_O:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_P_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_P:                     ;
	db  01111100 b 		; 
	db  00110010 b 		; 
	db  00110010 b 		; 
	db  00111100 b 		; 
	db  00110000 b 		; 
	db  00110000 b 		; 
	db  01111000 b 		; 
	db  00000000 b 		; 

; Tile_Char_Q_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_Q:                     ;
	db  00111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01101110 b 		; 
	db  00111100 b 		; 
	db  00000110 b 		; 

; Tile_Char_R_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_R:                     ;
	db  01111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01111100 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00000000 b 		; 

; Tile_Char_S_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_S:                     ;
	db  00111110 b 		; 
	db  01100000 b 		; 
	db  01100000 b 		; 
	db  00111100 b 		; 
	db  00000110 b 		; 
	db  00000110 b 		; 
	db  01111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_T_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_T:                     ;
	db  01111110 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00000000 b 		; 

; Tile_Char_U_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_U:                     ;
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  01100110 b 		; 
	db  00111100 b 		; 
	db  00000000 b 		; 

; Tile_Char_V_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_V:                     ;
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  00110100 b 		; 
	db  00110100 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00000000 b 		; 

; Tile_Char_W_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_W:                     ;
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  01101010 b 		; 
	db  01110110 b 		; 
	db  01100010 b 		; 
	db  00000000 b 		; 

; Tile_Char_X_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_X:                     ;
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  00110100 b 		; 
	db  00011000 b 		; 
	db  00110100 b 		; 
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  00000000 b 		; 

; Tile_Char_Y_Number:	equ ?	; NOT same as ascii code for this char
Tile_Char_Y:                     ;
	db  01100010 b 		; 
	db  01100010 b 		; 
	db  00110100 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 
	db  00000000 b 		; 

Tile_Char_Z_Number:		equ 41	; NOT same as ascii code for this char
Tile_Char_Z:                     ;
	db  01111110 b 		; 
	db  00001100 b 		; 
	db  00011000 b 		; 
	db  00110000 b 		; 
	db  01100000 b 		; 
	db  01100000 b 		; 
	db  01111110 b 		; 
	db  00000000 b 		; 

Tile_Char_Dot_Number:	equ 42	; NOT same as ascii code for this char
Tile_Char_Dot:                     ;
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00000000 b 		; 
	db  00011000 b 		; 
	db  00011000 b 		; 

; -------------------------------------
