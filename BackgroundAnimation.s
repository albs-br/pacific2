BackgroundAnimation:

    ; search all names table (except the top strip with lifes and score) looking for tiles 
    ; other than 0 (sea)


    call RotateTile3Thirds
    ; call UpdateNamesTable


    ; Search all namestable buffer (except for the first row) looking for tiles != 0
    ld hl, VramNamesTableBuffer
    ld bc, 768 - 32
.loop:
	ld a, (hl)
    or a                            ; same as cp 0 but faster
    jp nz, .animate

    jp .next

.animate:

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

    call UpdateNamesTable

    ret

ScrollTiles:

    ; scroll all tiles
	ld	bc, 22 * 32                                             ; Block length
	ld	hl, (NextBgLineAddr)
    ld  de, VramNamesTableBuffer + 32                           ; Destiny
    ldir                                                        ; Copy BC number of bytes from HL to DE

    
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
