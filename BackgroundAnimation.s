BackgroundAnimation:

    ; search all names table (except the top strip with lifes and score) looking for tiles 
    ; other than 0 (sea)


    ; Search all namestable buffer (except for the first row) looking for tiles != 0
    ld      hl, NamesTableBuffer + SCREEN_WIDTH_IN_TILES
    ld      bc, 768 - SCREEN_WIDTH_IN_TILES
.loop:
	ld      a, (hl)
    or      a                            ; same as cp 0 but faster
    jp      nz, .animate

    jp      .next

.animate:

    inc     (hl)
	

.next:

    inc     hl
    dec     bc
    
    ld      a, c                     ; if (bc <> 0) .loop
    or      b
    or      a                        ; same as cp 0 but faster
    jp      nz, .loop

    
    ld      a, (BgScrollRegister)
    inc     a
    cp      8
    call    z, ScrollTiles

    ; and 0000 0111 b
    ld      (BgScrollRegister), a

    call    RotateTile3Thirds
    ; call    UpdateNamesTable_BackGround
    call    UpdateNamesTable

    ret

ScrollTiles:

    ; scroll all tiles
	ld	    bc, 22 * 32                                             ; Block length
	ld	    hl, (NextBgLineAddr)
    ld      de, NamesTableBuffer + (SCREEN_WIDTH_IN_TILES * 2)      ; Destiny
    ;ldir                                                        ; Copy BC number of bytes from HL to DE
    ; 22 * 32 unrolled ldi's (3520 less cycles). Made with MSXUtilities
    ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi 
    
    ; load next bg line
    ld	    hl, (NextBgLineAddr)
	ld	    bc, 32                                                  ; Block length
    and     a                                                       ; Clear C flag
    sbc     hl, bc
    ld	    (NextBgLineAddr), hl
    ld      de, NamesTableBuffer + SCREEN_WIDTH_IN_TILES            ; Destiny
    ; ldir                                                        ; Copy BC number of bytes from HL to DE
    ; 32 unrolled ldi's (160 less cycles). Made with MSXUtilities
    ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi ldi 

    ; clear BgScrollRegister when exit subroutine
    xor     a                                                       ; same as ld a, 0 but faster

    ret
