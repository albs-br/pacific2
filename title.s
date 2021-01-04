
; TitleScreen:

;     ; Clear screen (fill screen with all black patterns)
; 	; Fill all 3 names tables
;     ld	hl, NamesTable                                  ; VRAM start address
;     ld  bc, 256 * 3                                     ; number of bytes
;     ld  a, 1                                            ; value
;     call BIOS_FILVRM                                    ; Fill VRAM

;     ; Title 'PACIFIC'
; 	ld	bc, 32 * 5                                      ; Block length
; 	ld	de, NamesTable + 128                            ; VRAM start address
; 	ld	hl, TitleTiles                                  ; RAM start address
;     call BIOS_LDIRVM                                    ; Block transfer to VRAM from memory


;     ; Write 'PUSH TRIGGER TO START' on midscreen
; 	ld	de, NamesTable + 256 + (32 * 4) + 16 - 10       ; VRAM Address
; 	ld	hl, Msg_Start                                   ;
;     call PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)

;     ; Write '2020' on midscreen
; 	ld	de, NamesTable + 256 + (32 * 6) + 16 - 2        ; VRAM Address
; 	ld	hl, Msg_2020                                    ;
;     call PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)

;     ; Write '            ANDREBAPTISTA.COM.BR' on screen bottom
; 	ld	de, NamesTable + 256 + 256 + (32 * 7)           ; VRAM Address
; 	ld	hl, Msg_TitleBottomLine                         ;
;     call PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)

;     ; Write version number on screen bottom
; 	ld	de, NamesTable + 256 + 256 + (32 * 7)           ; VRAM Address
; 	ld	hl, Msg_Version                                 ;
;     call PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)



; .titleloop:

;     ld a, 0x51                                          ; a: color pattern for upper  
;     ld d, 0x71                                          ; d: color pattern for bottom
;     call ChangeColorTitle
;     call .delay
;     ret nz

;     ld a, 0x41                                          ; a: color pattern for upper  
;     ld d, 0x71                                          ; d: color pattern for bottom
;     call ChangeColorTitle
;     call .delay
;     ret nz

;     jp .titleloop


; .delay:
;     ;ld c, 0x04                  ; 3 nested loops
;     ld d, 0x60                  
;     ld e, 0xff              
; .loop:                          ; 
;     ; check if spacebar is pressed
;     ld a, 8                 ; 8th line
;     call BIOS_SNSMAT        ; Read Data Of Specified Line From Keyboard Matrix
;     bit 0, a                ; 0th bit (space bar)
;     jp z, .triggerPressed

;     ld a, 1                 ; 1=JOY 1, TRIGGER A
;     call BIOS_GTTRIG        ; Output: A=255 button pressed, A=0 button released
;     jp nz, .triggerPressed


;     dec e
;     jp nz, .loop                ; inner loop
;     dec d
;     jp nz, .loop                ; 
;     ; dec c
;     ; jp nz, .loop                ; outer loop
    
;     xor a                       ; same as ld a, 0, but faster
;     ret

; .triggerPressed:
;     or 1                        ; same as ld a, 1, but faster
;     ret



; Input:
;    a: Level Number (1-6)
LevelTitleScreen:

    ;call LevelTitleAnimation_1
    ;call LevelTitleAnimation_2

;.loopEternal:
;    jp .loopEternal

    push hl
    push af

    ; Clear screen (fill screen with all black patterns)
	; Fill all 3 names tables
    ld	hl, NamesTable                                  ; VRAM start address
    ld  bc, 256 * 3                                     ; number of bytes
    ld  a, 1                                            ; value
    call BIOS_FILVRM                                    ; Fill VRAM

    ; Write 'LEVEL ' on midscreen
	ld	de, NamesTable + 256 + (32 * 3) + 16 - 3        ; VRAM Address
	ld	hl, Msg_Level                                   ;
    call PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)
    
    ; Write level number
    pop af
    add Tile_Char_0_Number
    ld h, d
    ld l, e
	call BIOS_WRTVRM		                            ; Writes data in VRAM (HL: address, A: value)


    ; Write level name on midscreen
	ld	de, NamesTable + 256 + (32 * 4) + 16 - 8        ; VRAM Address
    pop hl
    call PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)



    call WaitSomeSeconds



    ld hl, PatternsTable + (256 * 8) + (Tile_Char_0_Number*8)           ; VRAM Start Address
    ld de, PatternsTable + (256 * 8) + (Tile_Char_Z_Number*8) + 8 + 1   ; VRAM End Address
    call FadeChars

    call ClearNameTables
    call LoadPatternTable_Chars_2ndThird                ; restore chars


    ret


GameFinished:

    ; Clear screen (fill screen with all black patterns)
	; Fill all 3 names tables
    ld	hl, NamesTable                                  ; VRAM start address
    ld  bc, 256 * 3                                     ; number of bytes
    ld  a, 1                                            ; value
    call BIOS_FILVRM                                    ; Fill VRAM

    ; Write Game Finished strings on midscreen
	ld hl, Msg_GameFinished_0                           ; first string addr
    ld a, 8                                             ; number of strings
    ld	de, NamesTable + 256                            ; VRAM Address
.loop:
    push af
    push hl
    push de
    call PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)

    ld bc, 32                                           ; string size

    ; de += 32
    pop hl                                              ; from de to hl
    add hl, bc
    ld d, h
    ld e, l

    ; hl += 32
    pop hl
    add hl, bc

    pop af
    dec a
    jp nz, .loop

    call WaitSomeSeconds
    call WaitSomeSeconds
    call WaitSomeSeconds

    jp Execute




; LevelTitleAnimation_1:

;     ; parameters
;     ld hl, LevelTitleBuffer_Line0
;     ld (RamAddrSource), hl
;     ld hl, PatternsTable + (48 * 8)
;     ld (VramAddrDestiny), hl


;     ; -- fill names table with 48 to (48+32) on the target line
; 	ld	hl, NamesTable       ; VRAM Address
; 	ld	a, 48                       ; Value
; .loop:
;     push af
;     call BIOS_WRTVRM		; Writes data in VRAM, as VPOKE (HL: address, A: value)
;     inc hl
;     pop af
;     inc a
;     cp 48 + 32
;     jp nz, .loop

;     ; fill color table for chars 48 to (48+32) with text color pattern
; 	ld de, ColorsTable + (48 * 8)     							                ; VRAM color table start address
; 	ld hl, Colors_Char_1        												; RAM start address of color pattern (8 bytes)
; 	ld a, 32													                ; number of cells in color table to be filled by the pattern 
; 	call FillColorTable

;     ; -- copy patterns of string to buffer (unfinished)
;     ; hl points to string
; ;     ld a, (hl)
; ;     and a                           ; same as cp 0 but faster
; ;     jp z, .stringEnded              ; end of string
; ; .stringEnded:


;     ; fill first 10 positions of buffer with 0-9 sequence patterns
;     ld bc, 8 * 10
;     ld hl, Tile_Char_0
;     ld de, (RamAddrSource)
;     ldir                                                    ; copy BC bytes from HL to DE

;     ;ld hl, LevelTitleBuffer_Line0 + (62 * 8)                ; last position of buffer - 1
;     ld bc, 62 * 8
;     ld hl, (RamAddrSource)                                  
;     add hl, bc                                              ; last position of buffer - 1
;     ld c, 0
;     ld b, 8 ; 8 lines
; .loopNextLine:
;     ;ld (RamAddrSource), hl
;     push hl
;     push bc
;     ld c, 0
;     ld b, 0;256-8                                             ; make 32 * 8 = 256 line shifts (256 = 0)
; .loopLineShift:
;     push hl
;     push bc
;     ; -- loop from last - 1 (62) to first (0) shifting right px patterns of first line
;     ld b, 63                                                 ; counter
;     ;ld hl, LevelTitleBuffer_Line0 + (62 * 8)                ; last position of buffer - 1
; .shiftRightBits:
;     ;push bc
;     push hl
;     call ShiftRight8Pixels              ; Input: HL: RAM address
;     ld de, 8
;     pop hl
;     and a                                                       ; Clear C flag
;     sbc hl, de
;     ;pop bc
;     djnz .shiftRightBits

;     ; -- copy last 32 patterns from buffer to VRAM
; 	; ld	de, PatternsTable + (48 * 8)                        ; VRAM start address
; 	ld	de, (VramAddrDestiny)       ; VRAM Address
; 	;ld	hl, LevelTitleBuffer_Line0 + (32 * 8)               ; RAM start address
; 	ld	bc, 32 * 8                                          ; Block length
;     ld hl, (RamAddrSource)
;     add hl, bc
;     ;call BIOS_LDIRVM                                        ; Block transfer to VRAM from memory
;     call fast_LDIRVM

;     ; call Delay
;     pop bc
;     pop hl
;     djnz .loopLineShift


;     ; ld hl, RamAddrSource
;     ; inc (hl)

;     ; ld hl, VramAddrDestiny
;     ; inc (hl)

;     pop bc                                                  ; restore counter
;     pop hl
;     inc hl
;     djnz .loopNextLine

;     ret


; LevelTitleAnimation_2:

;     ; parameters
;     ld hl, LevelTitleBuffer_Line0           ; rb 64 * 8
;     ld (RamAddrSource), hl
;     ld hl, PatternsTable + (48 * 8)
;     ld (VramAddrDestiny), hl


;     ; -- fill names table with 48 to (48+32) on the target line
; 	ld	hl, NamesTable       ; VRAM Address
; 	ld	a, 48                       ; Value
; .loop:
;     push af
;     call BIOS_WRTVRM		; Writes data in VRAM, as VPOKE (HL: address, A: value)
;     inc hl
;     pop af
;     inc a
;     cp 48 + 32
;     jp nz, .loop

;     ; fill color table for chars 48 to (48+32) with text color pattern
; 	ld de, ColorsTable + (48 * 8)     							                ; VRAM color table start address
; 	ld hl, Colors_Char_1        												; RAM start address of color pattern (8 bytes)
; 	ld a, 32													                ; number of cells in color table to be filled by the pattern 
; 	call FillColorTable

;     ; -- copy patterns of string to buffer (unfinished)
;     ; hl points to string
; ;     ld a, (hl)
; ;     and a                           ; same as cp 0 but faster
; ;     jp z, .stringEnded              ; end of string
; ; .stringEnded:

;     ; fill first 10 positions of buffer with 0-9 sequence patterns
;     ld bc, 8 * 10
;     ld hl, Tile_Char_0
;     ld de, (RamAddrSource)
;     ldir                                                    ; copy BC bytes from HL to DE


;     ld hl, (RamAddrSource)
;     ;ld c, 0
;     ld b, 0;256-8                                             ; make 32 * 8 = 256 line shifts (256 = 0)
; .loopLineShift:
;     push hl
;     push bc

;         ld hl, (RamAddrSource)                                  
;         ld bc, 62 * 8
;         add hl, bc                                              ; last position of buffer - 1
;         ;ld c, 0
;         ld b, 8 ; 8 lines
;     .loopNextLine:
;         push bc
;         push hl


;                 ; -- loop from last - 1 (62) to first (0) shifting right px patterns of first line
;                 ld b, 63                                                 ; counter
;                 ;ld hl, LevelTitleBuffer_Line0 + (62 * 8)                ; last position of buffer - 1
;             .shiftRightBits:
;                 ;push bc
;                 push hl
;                 call ShiftRight8Pixels              ; Input: HL: RAM address
;                 ld de, 8
;                 pop hl
;                 and a                                                       ; Clear C flag
;                 sbc hl, de
;                 ;pop bc

;                 djnz .shiftRightBits



;         pop hl
;         inc hl                                              ;next line
;         pop bc
;         djnz .loopNextLine

;     ; -- copy last 32 patterns from buffer to VRAM
; 	; ld	de, PatternsTable + (48 * 8)                        ; VRAM start address
; 	ld	de, (VramAddrDestiny)       ; VRAM Address
; 	;ld	hl, LevelTitleBuffer_Line0 + (32 * 8)               ; RAM start address
; 	ld	bc, 32 * 8                                          ; Block length
;     ld hl, (RamAddrSource)
;     add hl, bc
;     call fast_LDIRVM



;     pop bc                                                  ; restore counter
;     pop hl
;     djnz .loopLineShift

;     ret
