


InitVram:

	call BIOS_DISSCR		; 


    ld a, 0
    ld (ADDR_CLIKSW), a     ; Key Press Click Switch 0:Off 1:On (1B/RW)

    ; call BIOS_INIGRP        ; Screen 2


; Define screen colors and mode
    ld 		a, COLOR_WHITE       ; Foregoung color
    ld 		(BIOS_FORCLR), a    
    ld 		a, COLOR_DARK_BLUE   ; Backgroung color
    ld 		(BIOS_BAKCLR), a     
    ld 		a, COLOR_BLUE        ; Border color
    ld 		(BIOS_BDRCLR), a    
    call 	BIOS_CHGCLR        ; Change Screen Color


; Set screen 2
	ld	a, 2	               		; Screen Mode (0..3 for MSX 1)
    call BIOS_CHGMOD        		; 

	call BIOS_DISSCR		; 


; Initialize VDP registers

; Write to VDP register 5 (define the address of the Sprite Attribute Table)
; Set it to 6912 (128 x 54)
; https://www.msx.org/wiki/VDP_Table_Base_Address_Registers#Control_Registers_5_and_11
	; ld	c, 5	               		; VDP Register Number (0..27, 32..46)
	; ld	b, 54	               		; Data To Write
    ; call BIOS_WRTVDP        		; Block transfer to VRAM from memory

; Write to VDP register 6 (defines the address of the Sprite Pattern Table.)
; Set it to 14336 (2048 x 7)
; https://www.msx.org/wiki/VDP_Table_Base_Address_Registers#Control_Registers_5_and_11
	; ld	c, 6	               		; VDP Register Number (0..27, 32..46)
	; ld	b, 7	               		; Data To Write
    ; call BIOS_WRTVDP        		; Block transfer to VRAM from memory

; Write to VDP register 1 (Set Screen mode, sprites size, Vblank, Display, VRAM mode setting)
; Set it to 225 (‭1110 0001‬ b)
; bit 7: 4/16K selects VRAM configuration. Write 1 if the VDP is not a V9938 nor V9958.
; bit 6: BL disables the screen display when reseted.VDP's commands work a bit faster as well. Screen display is displayed by default.
; bit 5: IE0 enables (1) or disable (0) the vertical retrace interrupts that occur at just after each display of the screen (foreground).
; bit 4: M2 is one of bits that defines the screen mode. (Write 1 to set the SCREEN 3)
; bit 3: M1 is one of bits that defines the screen mode. (Write 1 to set the SCREEN 0)
; bit 2: not used (always 0)
; bit 1: SI defines the sprite size. Write 1 to use 16x16 sprites, 0 to use 8x8 sprites.
; bit 0: MAG enlarges the sprites when 1 is written. (0 by default)
; https://www.msx.org/wiki/VDP_Mode_Registers#Control_Register_1
	ld	c, 1	               		; VDP Register Number (0..27, 32..46)
	ld	b, 0xe2; ‭% 1110 0010   	 ; Data To Write
    call BIOS_WRTVDP        		; Block transfer to VRAM from memory

; Write to VDP register 2 (determines the base address of the Name Table which constitutes the foreground.)
; Screen 2: set it to 6144 (1024 x 6)
	; ld	c, 2	               		; VDP Register Number (0..27, 32..46)
	; ld	b, 6	               		; Data To Write
    ; call BIOS_WRTVDP        		; Block transfer to VRAM from memory


; --------------------------------------------------
	call BIOS_DISSCR		; 


	call ClearVRAM



; -----------------------------------------------
; Define pattern
	; ld	hl, PatternsTable   ; VRAM Address
	; ld	a, 1000 0000 b      ; Value
	; call BIOS_WRTVRM		; Writes data in VRAM, as VPOKE (HL: address, A: value)

; Define patterns (copying 8 bytes from memory to VRAM)
; First third
	ld	bc, 3 * 8           ; Block length
	ld	de, PatternsTable   ; VRAM start address
	ld	hl, Tile_Sea        ; RAM start address
    call BIOS_LDIRVM        ; Block transfer to VRAM from memory

; Second third
	ld	bc, 3 * 8           ; Block length
	ld	de, PatternsTable + (256 * 8); VRAM start address
	ld	hl, Tile_Sea        ; RAM start address
    call BIOS_LDIRVM        ; Block transfer to VRAM from memory

; Last third
	ld	bc, 3 * 8           ; Block length
	ld	de, PatternsTable + (256 * 8) + (256 * 8); VRAM start address
	ld	hl, Tile_Sea        ; RAM start address
    call BIOS_LDIRVM        ; Block transfer to VRAM from memory



; Define colors
;	ld	hl, ColorsTable     ; VRAM Address
;	ld	a, 0xf0             ; Value
;	call BIOS_WRTVRM		; Writes data in VRAM (HL: address, A: value)
 
; Define colors (copying 8 bytes from memory to VRAM)
; First third
	ld	bc, 3 * 8           						; Block length
	ld	de, ColorsTable     						; VRAM start address
	ld	hl, Colors_Sea_Daylight        				; RAM start address
    call BIOS_LDIRVM        						; Block transfer to VRAM from memory
    
; Second third
	ld	bc, 3 * 8             						; Block length
	ld	de, ColorsTable + (256 * 8)					; VRAM start address
	ld	hl, Colors_Sea_Daylight        				; RAM start address
    call BIOS_LDIRVM        						; Block transfer to VRAM from memory

; Last third
	ld	bc, 3 * 8              						; Block length
	ld	de, ColorsTable + (256 * 8) + (256 * 8)		; VRAM start address
	ld	hl, Colors_Sea_Daylight        				; RAM start address
    call BIOS_LDIRVM        						; Block transfer to VRAM from memory


; ; Fill names table
; ; Top strip with lifes, score, etc
; 	ld	bc, 32              ; Block length
; 	ld	de, NamesTable		; VRAM address
; 	ld	hl, TopStripTiles   ; RAM Address
;     call BIOS_LDIRVM        ; Block transfer to VRAM from memory
; 	; ld	hl, NamesTable 		; VRAM start address
;     ; ld  bc, 32              ; number of bytes
;     ; ld  a, 1                ; value
;     ; call BIOS_FILVRM        ; Fill VRAM

; ; FIll the remainder of the 3 names tables
; 	ld	hl, NamesTable + 32 ; VRAM start address
;     ld  bc, 768 - 32            ; number of bytes
;     ld  a, 0                ; value
;     call BIOS_FILVRM        ; Fill VRAM




;---------------------
; Define char patterns

NUMBER_OF_CHARS:  equ 37

; Patterns Table (first third)
	ld	bc, NUMBER_OF_CHARS * 8               ; Block length
	ld	de, PatternsTable + (Tile_Char_0_Number*8) ; VRAM Address
	ld	hl, Tile_Char_0          ; RAM Address
    call BIOS_LDIRVM        ; Block transfer to VRAM from memory

; Patterns Table (second third)
	; ld	bc, NUMBER_OF_CHARS * 8               ; Block length
	; ld	de, PatternsTable + (256 * 8) + (Tile_Char_0_Number*8) ; VRAM Address
	; ld	hl, Tile_Char_0          ; RAM Address
    ; call BIOS_LDIRVM        ; Block transfer to VRAM from memory
	call LoadPatternTable_Chars_2ndThird

; Patterns Table (third third)
	ld	bc, NUMBER_OF_CHARS * 8               ; Block length
	ld	de, PatternsTable + (256 * 8) + (256 * 8) + (Tile_Char_0_Number*8) ; VRAM Address
	ld	hl, Tile_Char_0          ; RAM Address
    call BIOS_LDIRVM        ; Block transfer to VRAM from memory





; ;Colors table - Title screen - (first third)
; 	ld	de, ColorsTable + (Tile_TitleScreen_001_Number * 8)      				; VRAM color table start address
; 	ld	hl, Colors_Title        												; RAM start address of color pattern (8 bytes)
; 	ld a, 0 + (EndTitleScreen - StartTitleScreen) / 8							; number of cells in color table to be filled by the pattern 
; 	call FillColorTable
; ;Colors table - Title screen - (second third)
; 	ld	de, ColorsTable + (256 * 8) + (Tile_TitleScreen_001_Number * 8)      	; VRAM color table start address
; 	ld	hl, Colors_Title        												; RAM start address of color pattern (8 bytes)
; 	ld a, 0 + (EndTitleScreen - StartTitleScreen) / 8							; number of cells in color table to be filled by the pattern 
; 	call FillColorTable





;Colors table - Chars - (first third)
; color white gradiend, for digits  0-9
	ld	de, ColorsTable + (Tile_Char_0_Number*8)     							; VRAM color table start address
	ld	hl, Colors_Char        													; RAM start address of color pattern (8 bytes)
	ld a, 10																	; number of cells in color table to be filled by the pattern 
	call FillColorTable
; color green gradiend (A-Z):
	ld	de, ColorsTable + (Tile_Char_A_Number*8)     							; VRAM color table start address
	ld	hl, Colors_Char_1        												; RAM start address of color pattern (8 bytes)
	ld a, NUMBER_OF_CHARS - 10													; number of cells in color table to be filled by the pattern 
	call FillColorTable

;Colors table - Chars -  (second third)
; color white gradiend, for digits  0-9
	ld	de, ColorsTable + (256 * 8) + (Tile_Char_0_Number*8)     				; VRAM color table start address
	ld	hl, Colors_Char        													; RAM start address of color pattern (8 bytes)
	ld a, 10																	; number of cells in color table to be filled by the pattern 
	call FillColorTable
; color green gradiend  (A-Z):
	ld	de, ColorsTable + (256 * 8) + (Tile_Char_A_Number*8)     				; VRAM color table start address
	ld	hl, Colors_Char_1        												; RAM start address of color pattern (8 bytes)
	ld a, NUMBER_OF_CHARS - 10													; number of cells in color table to be filled by the pattern 
	call FillColorTable

;Colors table (last third)
; color white gradiend, for digits  0-9
	ld	de, ColorsTable + (256 * 8) + (256 * 8) + (Tile_Char_0_Number*8)     	; VRAM color table start address
	ld	hl, Colors_Char        													; RAM start address of color pattern (8 bytes)
	ld a, 10																	; number of cells in color table to be filled by the pattern 
	call FillColorTable
; color green gradiend  (A-Z):
	ld	de, ColorsTable + (256 * 8) + (256 * 8) + (Tile_Char_A_Number*8)     	; VRAM color table start address
	ld	hl, Colors_Char_1        												; RAM start address of color pattern (8 bytes)
	ld a, NUMBER_OF_CHARS - 10													; number of cells in color table to be filled by the pattern 
	call FillColorTable


    ; IFDEF DEBUG
    ;     ; Show tile set on screen (debug mode)
	; 	ld	bc, NUMBER_OF_CHARS    	; Block length
	; 	ld	de, NamesTable + 64		; VRAM Address
	; 	ld	hl, TestChars        	; RAM Address
	; 	call BIOS_LDIRVM        	; Block transfer to VRAM from memory
	; ENDIF


;---------------------
; Define background patterns

; 208 tiles avaliable for bg
; 208 / 8 = 26

; 2		small island			48,56
; 3		trees (dark green)		64,72,80
; 3		trees (light green)		88,96,104
; 2		rocks					112,120
; 5		island mid-left			128,136,144,152,160
; 5		island mid-right		168,176,184,192,200
; 3		island leftmost			208,216,224
; 3		island rightmost		232,240,248
NUMBER_OF_BG_TILES:  equ (2 + 3 + 3 + 2 + 5 + 5 + 3 + 3) * 8

; Patterns Table (top third)
	ld	bc, NUMBER_OF_BG_TILES * 8               								; Block length
	ld	de, PatternsTable + (Tile_Land_Bottom_Number*8) 						; VRAM Address
	ld	hl, Tile_Land_Bottom          											; RAM Address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

; Patterns Table (middle third)
	ld	bc, NUMBER_OF_BG_TILES * 8               								; Block length
	ld	de, PatternsTable + (256 * 8) + (Tile_Land_Bottom_Number*8) 			; VRAM Address
	ld	hl, Tile_Land_Bottom          											; RAM Address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

; Patterns Table (bottom third)
	ld	bc, NUMBER_OF_BG_TILES * 8               								; Block length
	ld	de, PatternsTable + (256 * 8) + (256 * 8) + (Tile_Land_Bottom_Number*8) ; VRAM Address
	ld	hl, Tile_Land_Bottom          											; RAM Address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory



; Colors Table (top third)
	ld	bc, NUMBER_OF_BG_TILES * 8               								; Block length
	ld	de, ColorsTable + (Tile_Land_Bottom_Number*8) 							; VRAM Address
	ld	hl, Colors_Land          												; RAM Address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

; Colors Table (middle third)
	ld	bc, NUMBER_OF_BG_TILES * 8               								; Block length
	ld	de, ColorsTable + (256 * 8) + (Tile_Land_Bottom_Number*8) 				; VRAM Address
	ld	hl, Colors_Land          												; RAM Address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory

; Colors Table (bottom third)
	ld	bc, NUMBER_OF_BG_TILES * 8               								; Block length
	ld	de, ColorsTable + (256 * 8) + (256 * 8) + (Tile_Land_Bottom_Number*8) 	; VRAM Address
	ld	hl, Colors_Land          												; RAM Address
    call BIOS_LDIRVM        													; Block transfer to VRAM from memory



;-----------------------------------------
; Define sprites

;NumberOfSprites:	equ 16			;

	ld		bc, EndSpritePatterns - StartSpritePatterns		; Block length
	ld		de, SpritePatternTable							; VRAM address
	ld		hl, StartSpritePatterns        					; RAM address
    call 	BIOS_LDIRVM        							; Block transfer to VRAM from memory

; Put sprite on screen (test)
{
	ld	bc, 4 * 7               	; Block length
	ld	de, SpriteAttrTable			; VRAM address
	ld	hl, SpriteAttr_0        	; RAM address
    call BIOS_LDIRVM        		; Block transfer to VRAM from memory
}



	;-----------------------------------------
	; Initialize VRAM Sprite attributes table buffer

    ld hl, VramSpriteAttrBuffer_Init     			; addr origin
    ld de, VramSpriteAttrBuffer     				; addr destiny
    ld bc, 4 * 32                            		; number of bytes
    ldir                                			; copy BC bytes from HL to DE



	call BIOS_ENASCR		; 

	ret

LoadTopStripTiles:

	; Fill names table
	; Top strip with lifes, score, etc
	; ld	bc, 32              ; Block length
	; ld	de, NamesTable		; VRAM address
	; ld	hl, TopStripTiles   ; RAM Address
    ; call BIOS_LDIRVM        ; Block transfer to VRAM from memory

	; Update names table buffer in RAM
	ld		bc, SCREEN_WIDTH_IN_TILES                   		; Block length
	ld		hl, TopStripTiles									; Source
    ld  	de, NamesTableBuffer      							; Destiny
    ldir                                                        ; Copy BC number of bytes from HL to DE

	ret


; ; Inputs:
; ; a: color pattern for upper 
; ; d: color pattern for bottom 
; ChangeColorTitle:
; ;Colors table - Title screen (first third)
; 	ld	hl, ColorsTable + (Tile_TitleScreen_001_Number * 8)      				; VRAM color table start address
;     ld  bc, 0 + (EndTitleScreen - StartTitleScreen)		            			; number of bytes
;     call BIOS_FILVRM        													; Fill VRAM
; ;Colors table - Title screen (second third)
; 	ld	hl, ColorsTable + (256 * 8) + (Tile_TitleScreen_001_Number * 8)      	; VRAM color table start address
;     ld  bc, 0 + (EndTitleScreen - StartTitleScreen)		            			; number of bytes
; 	ld a, d
;     call BIOS_FILVRM        													; Fill VRAM

; 	ret


; Input: HL: RAM addr of color pattern (8 bytes). It may be: Colors_Sea_Daylight or Colors_Sea_Nighttime
SetSeaTileColor:
; Define colors (copying 8 bytes from memory to VRAM)
; First third
	ld	bc, 8           							; Block length
	ld	de, ColorsTable     						; VRAM start address
	;ld	hl, Colors_Sea_Daylight        				; RAM start address
	push hl
    call BIOS_LDIRVM        						; Block transfer to VRAM from memory


; Second third
	ld	bc, 8           							; Block length
	ld	de, ColorsTable + (256 * 8)					; VRAM start address
	pop hl
	push hl
	;ld	hl, Colors_Sea_Daylight        				; RAM start address
    call BIOS_LDIRVM        						; Block transfer to VRAM from memory


; Last third
	ld	bc, 8           							; Block length
	ld	de, ColorsTable + (256 * 8) + (256 * 8)		; VRAM start address
	; ld	hl, Colors_Sea_Daylight        				; RAM start address
	pop hl
    call BIOS_LDIRVM        						; Block transfer to VRAM from memory

	ret

LoadPatternTable_Chars_2ndThird:
	ld	bc, NUMBER_OF_CHARS * 8               ; Block length
	ld	de, PatternsTable + (256 * 8) + (Tile_Char_0_Number*8) ; VRAM Address
	ld	hl, Tile_Char_0          ; RAM Address
    call BIOS_LDIRVM        ; Block transfer to VRAM from memory

	ret


ClearNameTables:
	ld	hl, NamesTable 		; VRAM start address
    ld  bc, 768             ; number of bytes
    ld  a, Tile_Black_Number; value
    call BIOS_FILVRM        ; Fill VRAM
	ret