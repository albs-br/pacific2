StartSpritePatterns:
Sprite_0:           ; Player plane 1st color
	db  0000 0000 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0111 1111 b 		; 
	db  1111 1111 b 		; 
	db  1111 1111 b 		; 

	db  0000 1111 b 		; 
	db  0000 0011 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0111 b 		; 
	db  0000 1111 b 		; 

	db  0000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1111 1110 b 		; 
	db  1111 1111 b 		; 
	db  1111 1111 b 		; 

	db  1111 0000 b 		; 
	db  1100 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1110 0000 b 		; 
	db  1111 0000 b 		; 

Sprite_1:           ; Player plane 2nd color
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0001 b 		; 
	db  1000 0001 b 		; 
	db  0111 0001 b 		; 

	db  0000 1100 b 		; 
	db  0000 0010 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0111 b 		; 

	db  0000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0001 b 		; 
	db  1000 1110 b 		; 

	db  1011 0000 b 		; 
	db  1100 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1111 0000 b 		; 

Sprite_2:           ; Player shot
	db  0000 0010 b 		; 
	db  0000 0000 b 		; 
	db  0000 0010 b 		; 
	db  0000 0010 b 		; 
	db  0000 0010 b 		; 
	db  0000 0010 b 		; 
	db  0000 0010 b 		; 
	db  0000 0010 b 		; 

	db  0000 0010 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0100 0000 b 		; 
	db  0000 0000 b 		; 
	db  0100 0000 b 		; 
	db  0100 0000 b 		; 
	db  0100 0000 b 		; 
	db  0100 0000 b 		; 
	db  0100 0000 b 		; 
	db  0100 0000 b 		; 

	db  0100 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

; Enemy plane type 0 (from top) 1st color
Sprite_3:
	db  0000 0001 b 		; 
	db  0000 1111 b 		; 
	db  0000 1111 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0011 b 		; 
	db  0111 1111 b 		; 
	db  1111 1111 b 		; 

	db  0111 1111 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0000 0000 b 		; 
	db  1110 0000 b 		; 
	db  1110 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1111 1100 b 		; 
	db  1111 1110 b 		; 

	db  1111 1100 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 


; Enemy plane type 0 (from top) 2nd color
Sprite_EnemyPlaneFromTop_2ndColor: 		equ	4
	db  0000 0000 b 		; 
	db  0000 0001 b 		; 
	db  0000 1111 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0001 0001 b 		; 
	db  0011 1000 b 		; 

	db  0001 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0000 0000 b 		; 
	db  1110 0000 b 		; 
	db  1110 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1110 1100 b 		; 
	db  1100 0110 b 		; 

	db  1110 1100 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

Sprite_5:           ; Enemy shot
	db  0110 0000 b 		; 
	db  1111 0000 b 		; 
	db  1111 0000 b 		; 
	db  0110 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

Sprite_6:           ; Enemy plane type 2 1st color
	db  0000 0110 b 		; 
	db  0000 0110 b 		; 
	db  0000 0111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0111 b 		; 
	db  0111 1111 b 		; 

	db  0111 1111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0110 b 		; 
	db  0000 0110 b 		; 

	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0001 b 		; 
	db  0000 0011 b 		; 
	db  1111 1111 b 		; 
	db  1000 0011 b 		; 
	db  1000 0011 b 		; 

	db  1000 0011 b 		; 
	db  1000 0011 b 		; 
	db  1111 1111 b 		; 
	db  0000 0011 b 		; 
	db  0000 0001 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

; Enemy plane type 2 2nd color
Sprite_EnemyPlaneFromRight_2ndColor:		equ	7
	db  0000 0010 b 		; 
	db  0000 0010 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0011 1111 b 		; 

	db  0000 0110 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0010 b 		; 
	db  0000 0010 b 		; 

	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  1111 1100 b 		; 
	db  1000 0001 b 		; 
	db  1000 0001 b 		; 

	db  1000 0001 b 		; 
	db  1000 0001 b 		; 
	db  1111 1100 b 		; 
	db  0000 0001 b 		; 
	db  0000 0001 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

Sprite_8:           ; Explosion frame 1
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0010 b 		; 
	db  0000 0100 b 		; 
	db  0000 0001 b 		; 

	db  0000 0010 b 		; 
	db  0000 0101 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  1000 0000 b 		; 
	db  0100 0000 b 		; 

	db  1010 0000 b 		; 
	db  0000 0000 b 		; 
	db  0100 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

Sprite_9:           ; Explosion frame 2
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0001 b 		; 
	db  0001 0100 b 		; 
	db  0000 0011 b 		; 
	db  0000 1010 b 		; 

	db  0000 0101 b 		; 
	db  0000 1010 b 		; 
	db  0010 0001 b 		; 
	db  0000 0100 b 		; 
	db  0000 0010 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0100 0000 b 		; 
	db  1000 0000 b 		; 
	db  0110 0000 b 		; 
	db  1000 0000 b 		; 

	db  1010 0000 b 		; 
	db  1100 0000 b 		; 
	db  0001 0000 b 		; 
	db  0100 0000 b 		; 
	db  0000 0000 b 		; 
	db  1000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

Sprite_10:           ; Explosion frame 3
	db  0000 0010 b 		; 
	db  0001 0111 b 		; 
	db  0100 1101 b 		; 
	db  0001 1111 b 		; 
	db  1011 0111 b 		; 
	db  0011 1101 b 		; 
	db  0110 1111 b 		; 
	db  1111 1011 b 		; 

	db  1111 1111 b 		; 
	db  0111 1101 b 		; 
	db  0010 1111 b 		; 
	db  1011 1111 b 		; 
	db  0001 1011 b 		; 
	db  0010 0111 b 		; 
	db  0000 0011 b 		; 
	db  0000 1000 b 		; 

	db  1101 0000 b 		; 
	db  1110 0000 b 		; 
	db  1011 0010 b 		; 
	db  1111 1000 b 		; 
	db  1110 1100 b 		; 
	db  1111 1101 b 		; 
	db  1101 1110 b 		; 
	db  1111 1011 b 		; 

	db  1111 0111 b 		; 
	db  1011 1110 b 		; 
	db  1111 1101 b 		; 
	db  1110 1100 b 		; 
	db  1111 1010 b 		; 
	db  1011 0000 b 		; 
	db  1110 0010 b 		; 
	db  1001 0000 b 		; 

Sprite_11:           ; Enemy plane type 3 1st color
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  1100 0011 b 		; 
	db  1100 0001 b 		; 
	db  1110 0001 b 		; 
	db  0111 1111 b 		; 

	db  0111 1111 b 		; 
	db  1110 0001 b 		; 
	db  1100 0001 b 		; 
	db  1100 0011 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0100 0000 b 		; 
	db  1100 0000 b 		; 
	db  1100 0000 b 		; 
	db  1100 0000 b 		; 
	db  1111 0000 b 		; 
	db  1100 0000 b 		; 
	db  1110 0000 b 		; 
	db  1111 1111 b 		; 

	db  1111 1111 b 		; 
	db  1110 0000 b 		; 
	db  1100 0000 b 		; 
	db  1111 0000 b 		; 
	db  1100 0000 b 		; 
	db  1100 0000 b 		; 
	db  1100 0000 b 		; 
	db  0100 0000 b 		; 


; Enemy plane type 3 2nd color
Sprite_EnemyPlaneFromLeft_2ndColor:		equ	12
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  1000 0011 b 		; 
	db  1000 0001 b 		; 
	db  1000 0001 b 		; 
	db  0000 0000 b 		; 

	db  0111 1111 b 		; 
	db  1000 0001 b 		; 
	db  1000 0001 b 		; 
	db  1000 0011 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  1111 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0111 0000 b 		; 

	db  1111 1111 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 
	db  1111 0000 b 		; 
	db  1000 0000 b 		; 
	db  1000 0000 b 		; 
	db  0000 0000 b 		; 
	db  0000 0000 b 		; 

; Item (extra life)
Sprite_Item_ExtraLife:		equ	13 * 4
	db  0000 0001 b 		; 
	db  0000 0010 b 		; 
	db  0000 0100 b 		; 
	db  0000 1000 b 		; 
	db  0001 0000 b 		; 
	db  0010 0000 b 		; 
	db  0100 0000 b 		; 
	db  1000 0000 b 		; 

	db  1111 1111 b 		; 
	db  0111 1111 b 		; 
	db  0011 1111 b 		; 
	db  0001 1111 b 		; 
	db  0000 1111 b 		; 
	db  0000 0111 b 		; 
	db  0000 0011 b 		; 
	db  0000 0001 b 		; 

	db  1000 0000 b 		; 
	db  1100 0000 b 		; 
	db  1110 0000 b 		; 
	db  1111 0000 b 		; 
	db  1111 1000 b 		; 
	db  1111 1100 b 		; 
	db  1111 1110 b 		; 
	db  1111 1111 b 		; 

	db  0000 0001 b 		; 
	db  0000 0010 b 		; 
	db  0000 0100 b 		; 
	db  0000 1000 b 		; 
	db  0001 0000 b 		; 
	db  0010 0000 b 		; 
	db  0100 0000 b 		; 
	db  1000 0000 b 		; 


; 50 points 1st color
Sprite_50points_1stColor:		equ	14 * 4
	db 00000000b
	db 00001010b
	db 00001000b
	db 00001110b
	db 00000000b
	db 00001110b
	db 00000000b
	db 00000000b
	
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	
	db 00000000b
	db 10100000b
	db 10100000b
	db 10100000b
	db 10000000b
	db 11100000b
	db 00000000b
	db 00000000b
	
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b

; 50 points 2nd color
Sprite_50points_2ndColor:		equ	15 * 4
	db 00000111b
	db 00000100b
	db 00000111b
	db 00000001b
	db 00000111b
	db 00000000b
	db 00000000b
	db 00000000b

	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b

	db 01110000b
	db 01010000b
	db 01010000b
	db 01010000b
	db 01110000b
	db 00000000b
	db 00000000b
	db 00000000b

	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b
	db 00000000b

; --- Boat
; color 1
Sprite_Boat_1stColor:		equ	16 * 4
	DB 00000000b
	DB 00000011b
	DB 00001100b
	DB 00110111b
	DB 11000011b
	DB 01110000b
	DB 00111111b
	DB 00001111b

	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b

	DB 00000000b
	DB 11100000b
	DB 00111110b
	DB 11110011b
	DB 11110011b
	DB 00000011b
	DB 11111111b
	DB 11111110b

	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b

Sprite_Boat_2ndColor:		equ	17 * 4
	; color 14
	DB 00000000b
	DB 00000000b
	DB 00000011b
	DB 00001000b
	DB 00111100b
	DB 00001111b
	DB 00000000b
	DB 00000000b

	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b

	DB 00000000b
	DB 00000000b
	DB 11000000b
	DB 00001100b
	DB 00001100b
	DB 11111100b
	DB 00000000b
	DB 00000000b

	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b

Sprite_LevelCurtain_Left:		equ	18 * 4
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b

	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b

	DB 11111111b
	DB 11111110b
	DB 11111100b
	DB 11111000b
	DB 11110000b
	DB 11100000b
	DB 11000000b
	DB 10000000b

	DB 10000000b
	DB 11000000b
	DB 11100000b
	DB 11110000b
	DB 11111000b
	DB 11111100b
	DB 11111110b
	DB 11111111b

Sprite_LevelCurtain_Right:		equ	19 * 4
	DB 00000001b
	DB 00000011b
	DB 00000111b
	DB 00001111b
	DB 00011111b
	DB 00111111b
	DB 01111111b
	DB 11111111b
	
	DB 11111111b
	DB 01111111b
	DB 00111111b
	DB 00011111b
	DB 00001111b
	DB 00000111b
	DB 00000011b
	DB 00000001b

	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b
	DB 11111111b

Sprite_Transparent:		equ	63 * 4
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b

	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b
	DB 00000000b

EndSpritePatterns:
{
; Sprite attributes: y-1, x, number, color    
SpriteAttr_0:
    db  (192-32), (256/2)-4, 4, 14          ; Player Plane 2nd color
    db  (192-32), (256/2)-4, 0, 15          ; Player Plane 1st color
    db  (192-32)+8, (256/2)-4+8, 0, 1       ; Player Plane shadow
    db  80, 148, 0, 14     ; y, x, number, color
    db  90, 168, 0, 13     ; y, x, number, color
    db  80, 188, 0, 12     ; y, x, number, color
    db  90, 208, 0, 11     ; y, x, number, color
    db  80, 228, 0, 10     ; y, x, number, color
}