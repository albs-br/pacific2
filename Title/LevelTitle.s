; Input:
;    a: Level Number (1-6)
LevelTitleScreen:

;     call LevelTitleAnimation_1
;     call LevelTitleAnimation_2

    push    hl
    push    af

    ; Clear screen (fill screen with all black patterns)
	; Fill all 3 names tables
    ld	    hl, NamesTable                                  ; VRAM start address
    ld      bc, 256 * 3                                     ; number of bytes
    ld      a, 1                                            ; value
    call    BIOS_FILVRM                                    ; Fill VRAM

    ; Write 'LEVEL ' on midscreen
	ld	    de, NamesTable + 256 + (32 * 3) + 16 - 3        ; VRAM Address
	ld	    hl, Msg_Level                                   ;
    call    PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)
    
    ; Write level number
    pop     af
    add     Tile_Char_0_Number
    ld      h, d
    ld      l, e
	call    BIOS_WRTVRM		                            ; Writes data in VRAM (HL: address, A: value)


    ; Write level name on midscreen
	ld	    de, NamesTable + 256 + (32 * 4) + 16 - 8        ; VRAM Address
    pop     hl
    call    PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)



    call    WaitSomeSeconds



    ld      hl, PatternsTable + (256 * 8) + (Tile_Char_0_Number * 8)           ; VRAM Start Address
    ld      de, PatternsTable + (256 * 8) + (Tile_Char_Z_Number * 8) + 8 + 1   ; VRAM End Address
    call    FadeChars

    call    ClearNameTables
    call    LoadPatternTable_Chars_2ndThird                ; restore chars


; TODO:
; - change NamesTableBuffer to include TopStrip                         OK
; - copy StartBackgroundData to NamesTableBuffer                        OK
; - change curtain routine to use NamesTableBuffer, and all 24 lines    OK

    ; Copy background data to NamesTableBuffer
	ld	    bc, 768 - SCREEN_WIDTH_IN_TILES                         ; Block length
    ld      hl, (StartCurrentBackgroundDataAddress)                        ; Source
    ld      de, NamesTableBuffer + SCREEN_WIDTH_IN_TILES            ; Destiny
    ldir                                                            ; Copy BC number of bytes from HL to DE

    ; Load top strip
    call    LoadTopStripTiles
    call    ShowScore
    call    ShowLifes

    ; Curtain initial position
	ld	    bc, LevelCurtainInitialPosition_End - LevelCurtainInitialPosition_Start     ; BC: Block length
    ld      hl, LevelCurtainInitialPosition_Start                                       ; HL: Source in RAM
    ld      de, SpriteAttrTable
    call    BIOS_LDIRVM                                                                 ; Copy BC number of bytes from HL (RAM) to DE (VRAM)

    ld      a, CURTAIN_LEFT_INITIAL_X                    
    ld      [LeftCurtain_X], a                          ; current left x position
    ld      a, CURTAIN_RIGHT_INITIAL_X
    ld      [RightCurtain_X], a                         ; current right x position
.loopCurtainMovement_X:
	ld	    hl, SpriteAttrTable + 1     ; VRAM Address (x attribute of sprite)

    ld      b, 12       ; number of sprites to be updated (each side)
                
                ; left side curtain movement
                .loopCurtainMovement_Left:
                    ld      a, [LeftCurtain_X]
                    call    BIOS_WRTVRM		            ; Writes data in VRAM, as VPOKE (HL: address, A: value)
                    ld      de, 4                       ; next sprite on sprite attributes table
                    add     hl, de
                    djnz    .loopCurtainMovement_Left

                    ld      a, [LeftCurtain_X]
                    or      a ; same as cp 0
                    jp      z, .endLoopCurtainMovement_X
                    dec     a
                    ld      [LeftCurtain_X], a

                ; show scenary behind left curtain
                    push    hl
                    ld      hl, NamesTable
                    ld      de, 0
                    ; ld      de, 32
                    ; add     hl, de  ; go to second line
                    ld      a, [LeftCurtain_X]
                    add     a, 8
                    srl     a     
                    srl     a     
                    srl     a       ; divide LeftCurtain_X by 8
                    ld      e, a
                    add     hl, de  ; go to current column
                    
                    ;BgSourceTileAddr = NamesTableBuffer + de
                    push    hl
                    ld      hl, NamesTableBuffer
                    add     hl, de  ; go to current column
                    ld      (BgSourceTileAddr), hl
                    pop     hl

                    push    bc
                    ld      b, SCREEN_HEIGHT_IN_TILES
                .loopShowScenaryBehindCurtain_Left:
                                ld      de, (BgSourceTileAddr)
                                ld      a, (de)                 ; get background
                                call    BIOS_WRTVRM		        ; Writes data in VRAM, as VPOKE (HL: address, A: value)
                                ld      de, 32
                                add     hl, de                  ; go to next line
                                
                                ;BgSourceTileAddr += 32
                                push    hl
                                ld      hl, (BgSourceTileAddr)
                                add     hl, de                  ; go to next line
                                ld      (BgSourceTileAddr), hl
                                pop     hl
                                
                                djnz    .loopShowScenaryBehindCurtain_Left
                    pop     bc

                    pop     hl



                ; show scenary behind right curtain
                    push    hl
                    ld      hl, NamesTable
                    ld      de, 0
                    ; ld      de, 32
                    ; add     hl, de  ; go to second line
                    ld      a, [RightCurtain_X]
                    add     a, 7
                    srl     a     
                    srl     a     
                    srl     a       ; divide RightCurtain_X by 8
                    ld      e, a
                    add     hl, de  ; go to current column

                    ;BgSourceTileAddr = NamesTableBuffer + de
                    push    hl
                    ld      hl, NamesTableBuffer
                    add     hl, de  ; go to current column
                    ld      (BgSourceTileAddr), hl
                    pop     hl

                    push    bc
                    ld      b, SCREEN_HEIGHT_IN_TILES
                .loopShowScenaryBehindCurtain_Right:
                                ld      de, (BgSourceTileAddr)
                                ld      a, (de)                 ; get background
                                call    BIOS_WRTVRM		        ; Writes data in VRAM, as VPOKE (HL: address, A: value)
                                ld      de, 32
                                add     hl, de                  ; go to next line
                                
                                ;BgSourceTileAddr += 32
                                push    hl
                                ld      hl, (BgSourceTileAddr)
                                add     hl, de                  ; go to next line
                                ld      (BgSourceTileAddr), hl
                                pop     hl
                                
                                djnz    .loopShowScenaryBehindCurtain_Right
                    pop     bc

                    pop     hl



                ; right side curtain movement
                    ld      b, 12       ; number of sprites to be updated
                .loopCurtainMovement_Right:
                    ld      a, [RightCurtain_X]
                    ;or      a ; same as cp 0
                    ;jp      z, .skipRightCurtain
                    ;neg                             ; negating the X left position we obtain the X right position (is symetric)
                    ;jp      z, .endLoopCurtainMovement_X
                    call    BIOS_WRTVRM		        ; Writes data in VRAM, as VPOKE (HL: address, A: value)
                    ld      de, 4
                    add     hl, de
                    djnz    .loopCurtainMovement_Right

                    ld      a, [RightCurtain_X]
                    inc     a
                    ld      [RightCurtain_X], a




.skipRightCurtain:

                    ; call    Delay

    jp      .loopCurtainMovement_X

.endLoopCurtainMovement_X:

    ret



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
