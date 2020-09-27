
; BackgroundData:
; .start:
;     db  0x01, 0x00          ; counter value (HSB, LSB)
;     db  0x00, 0x00          ; addr of tile strip for top screen
; .end:


; input: AB counter value
; b = 0x03 (hi)
; a = 0x00 (lo)
BackgroundAnimation:



    ; search all names table (except the top strip with lifes and score) looking for tiles 
    ; other than 0 (sea)



    ; check if there is background strip to load
    cp 0x00                                                     ; check low byte of counter
    jp nz, .continue

    ld a, b
    cp 0x00                                                    ; check hi byte of counter
    jp nz, .continue


    ; ld	bc, 32              ; Block length
	; ld	de, NamesTable		; VRAM address
	; ld	hl, TopStripTiles   ; RAM Address
    ; call BIOS_LDIRVM        ; Block transfer to VRAM from memory


    ; load background strip on top screen
    ;ld h, 0xb0                                                  ; hi byte of address is fixed (table aligned)
    ;ld l, 0x00                                                  ; lo byte of address
	ld	hl, (NextBgLineAddr)
	; ld	hl, TableAlignedDataStart        ; test

	ld	bc, 32                                                  ; Block length
    ;ld  hl, ???                                                ; Origin
    ld  de, VramNamesTableBuffer                                ; Destiny
    ldir                                                        ; Copy BC number of bytes from HL to DE


.continue:

    call RotateTile3Thirds
    call UpdateNamesTable


    ; Search all namestable buffer (except for the first row) looking for tiles != 0
    ld hl, VramNamesTableBuffer
    ld bc, 768 - 32
.loop:
	ld a, (hl)
    cp 0
    jp nz, .animate

    jp .next

.animate:

    ; inc a
	; ld (hl), a
    inc (hl)
	

.next:

    inc hl
    dec bc
    
    ld a, c                     ; if (bc <> 0) .loop
    or b
    or a                        ; same as cp 0 but faster
    jp nz, .loop

    
    ld a, (BgScrollRegister)
    inc a
    cp 8
    call z, ScrollTiles

    ; and 0000 0111 b
    ld (BgScrollRegister), a

    ret

ScrollTiles:

    ;call BIOS_BEEP

    ; scroll all tiles
	ld	bc, 22 * 32                                             ; Block length
	; ld	hl, TableAlignedDataStart        ; test
	ld	hl, (NextBgLineAddr)
    ld  de, VramNamesTableBuffer + 32                           ; Destiny
    ldir                                                        ; Copy BC number of bytes from HL to DE


    ; clear first line
;     ld hl, VramNamesTableBuffer         ; RAM start address
; 	ld de, VramNamesTableBuffer + 32                                                  ; Block length
; .loop:
;     xor a                   ; same as ld a, 0, but faster
;     ld (hl), a

;     inc hl
;     call BIOS_DCOMPR        ; Compare Contents Of HL & DE, Set Z-Flag IF (HL == DE), Set CY-Flag IF (HL < DE)
;     jp z, .ret
;     jp .loop
    
    ; load next bg line
    ld	hl, (NextBgLineAddr)
	ld	bc, 32                                                  ; Block length
    and a                                                       ; Clear C flag
    sbc hl, bc
    ld	(NextBgLineAddr), hl
    ld  de, VramNamesTableBuffer                                ; Destiny
    ldir                                                        ; Copy BC number of bytes from HL to DE

.ret:
    xor a                                                       ; same as ld a, 0 but faster

    ret
