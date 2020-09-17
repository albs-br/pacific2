
BackgroundDataStart:
    db  0x02, 0x00          ; counter value (HSB, LSB)
    db  0x00, 0x00          ; addr of tile strip for top screen
BackgroundDataEnd:


; input: AB counter value
; b = 0x03 (hi)
; a = 0x00 (lo)
BackgroundAnimation:


    ; search all names table (except the top strip with lifes and score) looking for tiles 
    ; other than 0 (sea)

    ;ld a, 0


    ; check if there is background strip to load
    cp 0x00                                                     ; check low byte of counter
    jp nz, .continue

    ld a, b
    cp 0x02                                                     ; check hi byte of counter
    jp nz, .continue


	;ld	bc, 32              ; Block length
	;ld	de, NamesTable		; VRAM address
	;ld	hl, TopStripTiles   ; RAM Address
    ;call BIOS_LDIRVM        ; Block transfer to VRAM from memory



    ; load background strip on top screen
    ;ld h, 0xb0                                                  ; hi byte of address is fixed (table aligned)
    ;ld l, 0x00                                                  ; lo byte of address
	ld	hl, TableAlignedDataStart        ; test

	ld	bc, 32                                                  ; Block length
	ld	de, NamesTable + ((TOP_SCREEN/8)*32)                    ; VRAM start address
	;ld  a, (hl)                                                ; RAM start address
    call BIOS_LDIRVM                                            ; Block transfer to VRAM from memory


.continue:


	;ld hl, Counter+4            ; LSB (5th byte)
    ld a, (Counter+4)
    and 0000 1111 b
    ret nz   ; background scroll at each 16 cycles


    ; Search all namestable (except the first row) looking for tiles != 0
    ld hl, NamesTable + ((TOP_SCREEN/8)*32)
    ld b, 1                                     ; counter for the 3 name tables
.loop:
	call BIOS_RDVRM		        ; Reads data from VRAM, as VPEEK (HL: address, output in A)
    cp 0
    jp nz, .animate

    jp .next

.animate:

    inc a
	call BIOS_WRTVRM		    ; Writes data in VRAM, as VPOKE (HL: address, A: value)

.next:

    inc l
    jp z, .incH
    jp .loop

.incH:
    inc h
    djnz .loop

    
    ld a, (BgScrollRegister)
    inc a
    cp 8
    call z, .scrollRowTiles

    and 0000 0111 b
    ld (BgScrollRegister), a

    ret

.scrollRowTiles:
    ret
