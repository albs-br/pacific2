; commonroutines.s (can be used on other programs)

; depends on:
;   include/msxbios.s
;   include/vram.s



; ---------------------------------------------------------
; Self explanatory
Delay:
    ; ld c, 0x04                  ; 3 nested loops
    ; ld d, 0xff                  
    ld e, 0xff
.loop:                          ; 
    dec e
    jp nz, .loop                ; inner loop
    ; dec d
    ; jp nz, .loop                ; 
    ; dec c
    ; jp nz, .loop                ; outer loop
    
    ret


; ---------------------------------------------------------
; Self explanatory
DelayWithParameters:
    ; ld c, 0x01                  ; inputs
    ; ld d, 0xff                  
    ; ld e, 0x80              
.loop:                          ; 
    dec e
    jp nz, .loop                ; inner loop
    dec d
    jp nz, .loop                ; 
    dec c
    jp nz, .loop                ; outer loop
    
    ret


; ---------------------------------------------------------
; Scrolling by rotating the tile pattern downwards
; 
; Inputs:
;   none
; Destroys:
;   hl, a, b, c, e
RotateTile3Thirds:
    ld bc, PatternsTable                            ; first third
    call RotateTile

    ld bc, PatternsTable + (256 * 8)                ; second third
    call RotateTile

    ld bc, PatternsTable + (256 * 8) + (256 * 8)    ; last third
    call RotateTile

    ret



; ---------------------------------------------------------
; Scrolling by rotating the pattern tile downwards
; Rotates only one tile pattern, so affects only one third of screen 2
; 
; Inputs:
;   bc: Patterns table address
; Destroys:
;   hl, a, b, e
RotateTile:
{
170 B = VPEEK(C+7)
180 FOR I=7 TO 1 STEP -1
190   VPOKE C+I, VPEEK(C+I-1)
200 NEXT
203 VPOKE C, B
205 GOTO 170
}
; B = VPEEK(C+7)
    push bc                     ; Saves entry address
    
    ld hl, 7                    ; Add 7 to patterns table address; HL = BC + 7
    add hl, bc
	;ld	hl, PatternsTable + 7   ; VRAM Address
	call BIOS_RDVRM		        ; Reads data from VRAM, as VPEEK (HL: address, output in A)
    ld e, a                     ; save pattern of the 8th (last) line

; FOR I=7 TO 1 STEP -1
    ld b, 7                     ; repeat 7 times

.loop:
; VPEEK(C+I-1)
	dec hl                      ; VRAM Address
	call BIOS_RDVRM		        ; Reads data from VRAM, as VPEEK (HL: address, output in A)

;VPOKE C+I, ...
    inc hl
	call BIOS_WRTVRM		; Writes data in VRAM (HL: address, A: value)

    dec hl

    djnz .loop

;VPOKE C, B
    pop hl                      ; Retrieve entry address directly to hl
	; ld	h, b                    ; VRAM Address; ld hl, bc
	; ld	l, c
    ld a, e                     ; pattern of the last line will go to the first
	call BIOS_WRTVRM		; Writes data in VRAM (HL: address, A: value)

    ret



; HL: address (should have the bit 6 set), A: value
Vpoke:
    push af

    ld a, l
    out (0x99), a
    ; set 6, h                    ; Set write flag
    ld a, h
    out (0x99), a
    
    pop af
    out (0x98), a

    ; res 6, h                    ; Reset write flag

    ret



; ---------------------------------------------------------
; Put sprite 16x16 on screen, similar to BASIC command
; 
; Inputs:
;   d: x coord
;   e: y coord
;   c: color (0-15)
;   a: pattern number (0-63)
;   b: layer (0-31)
; Destroys:
;   a, hl
PutSprite16x16:
    ; TODO: optimization oportunity here (use constants and pass the VRAM sprite address)
    ld hl, SpriteAttrTable
    ; ld hl, 0x4000 OR SpriteAttrTable; Set write flag (bit 6 of high byte)
    ; set 6, h                        ; Set write flag

    sla b                           ; layer * 4
    sla b                           ; 
    ld l, b                         ; since the sprite attr table goes from 0x1b00 to 0x1b80, there is no need to worry with the hi byte, saving cpu clocks

    ; TODO: optimization oportunity here (use constants for sprite number and pass already multiplied by 4)
    sla a                           ; shift left accumulator; multiply pattern number by 4 (necessary when using 16x16 sprites)
    sla a

    ld b, a                         ; saves a (pattern number)

    ; Sprite attributes: y, x, pattern number, color    

    ; y coord    
	ld	a, e        	            ; Value
    dec a                           ; fix bug of -1 on y axis
	call BIOS_WRTVRM		        ; Writes data in VRAM (HL: address, A: value)
    ; call Vpoke

    ; x coord    
    inc l                           ; VRAM address
	ld	a, d        	            ; Value
	call BIOS_WRTVRM		        ; Writes data in VRAM (HL: address, A: value)
    ; call Vpoke

    ; pattern number    
    inc l                           ; VRAM address
    ld a, b                         ; retrieves a (pattern number)
	call BIOS_WRTVRM		        ; Writes data in VRAM (HL: address, A: value)
    ; call Vpoke

    ; color    
    inc l                           ; VRAM address
	ld a, c           	            ; Value
	call BIOS_WRTVRM		        ; Writes data in VRAM (HL: address, A: value)
    ; call Vpoke

    ret





; ---------------------------------------------------------
; xxxxxxxxxx
; 
; Inputs:
;   hl: base sprite addr
;   c: color (0-15)
;   a: pattern number = ((0-63) * 4) + base addd
; Destroys:
;   a, hl
SetSpritePatternAndColor:
    ; Sprite attributes: y, x, pattern number, color    

    inc hl
    inc hl
    
    ; pattern number    
	call BIOS_WRTVRM		        ; Writes data in VRAM (HL: address, A: value)
    ; call Vpoke

    ; color    
    inc hl                          ; VRAM address
	ld a, c           	            ; Value
	call BIOS_WRTVRM		        ; Writes data in VRAM (HL: address, A: value)
    ; call Vpoke

    ret





; ---------------------------------------------------------
; Checks if the point (x, y) is inside the box (x1, y1, x2, y2)
; 
; Destroys:
;   
; Inputs:
;   HL: point to be checked (H: x, L: y)
;   BC: upper left corner of box to be checked (B: x1, C: y1)
;   DE: bottom right corner of box to be checked (D: x2, E: y2)
; Output:
;   Z flag set (Z): not collided
;   Z flag reset (NZ) : collided
CheckCollision:

; TODO (optimization):
; Source: https://www.msx.org/forum/msx-talk/development/collision-detection-in-assembly-not-working-at-all?page=1
; So instead of x>=x1 and x<=x2 (two comparisons) you can check if abs(x-xc)<=w/2 (with xc being the x_center and w being the width; or even better having half the width pre-computed).
; And if there are two overlapping rectangles... well abs(xc - uc)<=(w1+w2)/2 (distance between the centers less than half of the sum of the widths).

;To compare stuff, simply do a CP, and if the zero flag is set,
;A and the argument were equal, else if the carry is set the argument was greater, and finally, if 
;neither is set, then A must be greater (CP does nothing to the registers, only the F (flag) register 
;is changed). 

    ld a, h                 ; get x value

; if (x <= x2)
    cp d
	jp z, .checkY			; if x == x2 there is no need to check against x1
	jp nc, .collisionfalse	; nc: a >= argument

; if (x >= x1)
    cp b
    jp c, .collisionfalse	; c: a < argument

.checkY:
    ld a, l                 ; get y value

; if (y <= y2)
    cp e
    jp z, .collisionTrue			; if y == y2 there is no need to check against y1
    jp nc, .collisionfalse	; nc: a >= argument

; if (y >= y1)
    cp c
    jp c, .collisionfalse	; c: a < argument



.collisionTrue:
    ld      a, 1
    ret

.collisionfalse:
    xor     a                   ; same as ld a, 0, but faster
    ret





; Inputs (both using Struct_CollisionBox):
;   IX: obj 1
;   IY: obj 2
; Out: Carry set if collision
CollisionCheck_Boxes:
    ; check collision on x axis
    ld b, (ix + Struct_CollisionBox.X)
    ld c, (ix + Struct_CollisionBox.width)
    ld d, (iy + Struct_CollisionBox.X)
    ld e, (iy + Struct_CollisionBox.width)
    call CollisionCheck_1d
    ret nc

    ; check collision on y axis
    ld b, (ix + Struct_CollisionBox.Y)
    ld c, (ix + Struct_CollisionBox.height)
    ld d, (iy + Struct_CollisionBox.Y)
    ld e, (iy + Struct_CollisionBox.height)
    call CollisionCheck_1d
    ret


;
; CollisionCheck 1d
;
;   Calculates whether a collision occurs between two objects
;   of a certain size
;
; IN: b = coordinate of object 1
;     c = size of object 1
;     d = coordinate of object 2
;     e = size of object 2
; OUT: Carry set if collision
; CHANGES: AF
;
CollisionCheck_1d:
        ld      a,d             ; get x2                       [5]
        sub     b               ; calculate x2-x1              [5]
        jr      c,.other        ; jump if x2<x1                [13/8]
        sub     c               ; compare with size 1          [5]
        ret                     ; return result                [11]
.other:
        neg                     ; use negative value           [10]
        sub     e               ; compare with size 2          [5]
        ret                     ; return result                [11]



; ---------------------------------------------------------
; Fills a range of cells in color table with a color pattern in RAM
; 
; Destroys:
;   All registers
;
; Inputs:
;   DE: VRAM color table start address
;   HL: RAM start address of tile pattern (8 bytes)
;   A: number of cells in color table to be filled by the pattern 
; Output:
;   
FillColorTable:
	; ld	de, ColorsTable+(Tile_Char_0_Number*8)     ; VRAM Address
	; ld	hl, Colors_Char        ; RAM Address
	; ld a, 10				; loop control variable
; .loop:
	ld	bc, 8               ; Block length
	push hl
    push af
	push de
	call BIOS_LDIRVM        ; Block transfer to VRAM from memory
	pop de
	pop af
	
	ld	bc, 8               ; increment register pair de by 8
	ld h, d					; 
	ld l, e					;
	add hl, bc
	ld d, h
	ld e, l
	
	pop hl
	
	dec a
	jr nz, FillColorTable
	
	ret


; ---------------------------------------------------------
; Write string on screen 2
; 
; Destroys:
;   a
;
; Inputs:
;   DE: VRAM names table start address
;   HL: RAM start address of string (string should end with a zero)
; Output:
;   none
PrintString:
    ld a, (hl)
    and a                           ; same as cp 0 but faster
    ret z                           ; end of string


    push hl
    push de

    cp 65
    jp nc, .alpha                   ; if(a >= 65) alpha

    cp 48
    jp nc, .number                  ; if(a >= 48) number

    cp 46
    jp z, .dot

    cp 32
    jp z, .space

    jp .alpha

.dot:
    ld a, Tile_Char_Dot_Number
    jp .print

.space:
    ld a, Tile_Black_Number
    jp .print

.alpha:
    sub 65 - Tile_Char_A_Number     ; convert ASCII code to game's pattern table. eg. A = 65 to 58
    jp .print

.number:
    sub 48 - Tile_Char_0_Number     ; convert ASCII code to game's pattern table. eg. 0 = 65 to 58

.print:
    ld h, d
    ld l, e
	call BIOS_WRTVRM		        ; Writes data in VRAM (HL: address, A: value)
    
    pop de
    pop hl


    inc hl
    inc de
    
    jp PrintString



WaitSomeSeconds:
    ; Wait some seconds
    ld hl, 3000
    ld b, 255
.wait:
    djnz .wait

    dec hl
    ld a, h
    or l                                                ; h OR l, to check zero

    ld b, 255
    jp nz, .wait

    ret


; Fill all VRAM with 0x00
ClearVRAM:
	ld	hl, 0x0000 			; VRAM start address
    ld  bc, 16768           ; number of bytes
    ld  a, 0x00             ; value
    call BIOS_FILVRM        ; Fill VRAM
    
    ret


; Fill all RAM with 0x00
ClearRam:
    ld hl, RamStart         ; RAM start address
    ld de, RamEnd + 1       ; RAM end address

.loop:
    xor a                   ; same as ld a, 0, but faster
    ld (hl), a

    inc hl
    call BIOS_DCOMPR        ; Compare Contents Of HL & DE, Set Z-Flag IF (HL == DE), Set CY-Flag IF (HL < DE)
    ret z
    jp .loop




; Typical routine to select the ROM on page 8000h-BFFFh from page 4000h-7BFFFh
EnableRomPage2:
; source: https://www.msx.org/wiki/Develop_a_program_in_cartridge_ROM#Typical_examples_to_make_a_32kB_ROM

	call	BIOS_RSLREG
	rrca
	rrca
	and	3	;Keep bits corresponding to the page 8000h-BFFFh
	ld	c,a
	ld	b,0
	ld	hl, BIOS_EXPTBL
	add	hl,bc
	ld	a,(hl)
	and	80h
	or	c
	ld	c,a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	and	0Ch
	or	c
	ld	h,080h
	call	BIOS_ENASLT		; Select the ROM on page 8000h-BFFFh

    ret


; Loop trought all chars (numbers and letters) in pattern table, adding
; random black points to make them "fade"
; Inputs:
;   HL: VRAM Start Address
;   DE: VRAM End Address
; Outputs:
;   none
FadeChars:

    ld b, 24                                                            ; number of iterations through all the table
.loopAllChars:
    push hl
    push de
    ; ld hl, PatternsTable + (256 * 8) + (Tile_Char_0_Number*8)           ; VRAM Start Address
    ; ld de, PatternsTable + (256 * 8) + (Tile_Char_Z_Number*8) + 8 + 1   ; VRAM End Address
.loopLines:
    call RandomNumber
    ;ld a, 5
    and 0000 0111b              ; mask to get a value between 0 and 7

; adjust the mask to have the 0 on the bit position specified by A
    ld c, 1111 1110b            ; initial mask
.loopMask:
    cp 0
    jp z, .endLoopMask

    rlc c                       ; rotate left register
    dec a
    jp .loopMask

.endLoopMask:

	call BIOS_RDVRM		        ; Reads data from VRAM, as VPEEK (HL: address, output in A)

    and c                       ; reset only the bit specified by the mask

    call BIOS_WRTVRM		    ; Writes data to VRAM, as VPOKE (HL: address, A: value)
    inc hl

    call BIOS_DCOMPR            ; Compare Contents Of HL & DE, Set Z-Flag IF (HL == DE), Set CY-Flag IF (HL < DE)
    jp nz, .loopLines

    pop de
    pop hl

    dec b
    jp nz, .loopAllChars

    ret

{
;if a < d 
    cp d
    call LabelThen
;else
    call LabelElse

}

;Random number generator:
; In: nothing
; Out: A with a random number
; Destroys: nothing
;Author: Ricardo Bittencourt aka RicBit (BrMSX, Tetrinet and several other projects)
; choose a random number in the set [0,255] with uniform distribution
RandomNumber:
    PUSH HL
    LD HL, (SEED)
    ADD HL,HL
    SBC A,A
    AND 83h
    XOR L
    LD L,A
    LD (SEED), HL
    POP HL
    RET

    ; The random number generated will be any number from 0 to FFh.
    ; Despite be a random number generator routine, your results will pass in several statistical tests.
    ; Before the first call, the SEED value must be initiated with a value different of 0.
    ; For a deterministic behavior (the sequence of values will be the same if the program was initiated), use a fixed SEED value.
    ; For a somewhat more random sequence, use:
    ; LD A,(JIFFY);MSX BIOS time variable
    ; OR 80H ;A value different of zero is granted
    ; LD A,(SEED)

    ; The values obtained from this method is much more *random* that what you get from LD A,R.

; ---------------------

; FC9Eh	JIFFY	1	Contains value of the software clock, each interrupt of the VDP it is increased by 1.
; The contents can be read or changed by the function 'TIME' or instruction 'TIME'.

; -----------------------


;-----------------------------------------------
; hl: source data
; de: target address in the VDP
; bc: amount to copy
fast_LDIRVM:
    ex de,hl    ; this is wasteful, but it's to maintain the order of parameters of the original LDIRVM...
                ; For things that require real speed, this function should not be used anyway, and you should use specialized loops
    push de
    push bc
    call BIOS_SETWRT
    pop bc
    pop hl
copy_to_VDP:
    ld e,b
    ld a,c
    or a
    jr z, copy_to_VDP_lsb_0
    inc e
copy_to_VDP_lsb_0:
    ld b,c
    ; get the VDP write register:
    ld a, (BIOS_VDP_DW)
    ld c,a
    ld a,e
copy_to_VDP_loop2:
copy_to_VDP_loop:
    outi
    jp nz,copy_to_VDP_loop
    dec a
    jp nz,copy_to_VDP_loop2
    ret


; LDIRVM the NAMTBL buffer
UpdateNamesTable:
;FAST_LDIRVM_NAMTBL:
; Sets the VRAM pointer
	ld	hl, NamesTable + 32
	call	BIOS_SETWRT
; Initializes the OUTI loop
	ld	hl, VramNamesTableBuffer
	ld	a, (BIOS_VDP_DW)
	; ld	b, 0 ; (ensures 256 bytes for the first bank)
	ld	b, 256-32	; first bank without first line (32 bytes)
	ld	c, a
; Uses 3x256 = 768 OUTIs to blit the NAMTBL buffer
.LOOP0:
	outi
	jp	nz, .LOOP0
.LOOP1:
	outi
	jp	nz, .LOOP1
.LOOP2:
	outi
	jp	nz, .LOOP2
	ret


; LDIRVM the SpriteAttrTable buffer
FAST_LDIRVM_SpriteAttrTable:
; Sets the VRAM pointer
	ld	hl, SpriteAttrTable
	call	BIOS_SETWRT
; Initializes the OUTI loop
	ld	hl, VramSpriteAttrBuffer
	ld	a, (BIOS_VDP_DW)
	ld	b, 128	        ; size of SpriteAttrTable (4 x 32)
	ld	c, a
; Uses 128 OUTIs to blit the SpriteAttrTable buffer
.LOOP0:
	outi
	jp	nz, .LOOP0
	ret

{
How to know if is 50 or 60 Hz

https://www.msx.org/pt-br/node/50159?page=2

So the best way to know the current refresh frequency is:

1. Check the MSX version number at 002DH of the BIOS
2. If it’s 0, read the frequency from bit 7 of 002BH of the BIOS (0 = 60 Hz)
3. Otherwise, read the frequency from bit 1 of 0FFE8H of the system area (0 = 60 Hz)


}


; hide all sprites (208 on Y value hides the sprite and all following)
HideAllSprites:
    ld      hl, SpriteAttrTable
    ld      a, 208
    call    BIOS_WRTVRM		                            ; Writes data in VRAM (HL: address, A: value)

    ret