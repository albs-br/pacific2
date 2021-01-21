; specificroutines.s (can NOT be used on other programs without changes)

; depends on:
;   include/msxbios.s
;   include/vram.s
 


InitVariables:

    ld a, (BIOS_JIFFY)                  ; MSX BIOS time variable
    or 0x80                             ; A value different of zero is granted
    ld (SEED), a



    ; ld a, 1                             ;
    ; ld (Level), a                       ;

    ld hl, LevelDataStart
    ld (LevelDataLastAddr), hl


    ld ix, Player_CollisionBox

    ld a, 120                           ; (256/2) + 8  ; middle of screen minus half of sprite
    ld (Player_X), a                    ;
    ld (ix + Struct_CollisionBox.X), a
    ld a, 160                           ;
    ld (Player_Y), a                    ;
    ld (ix + Struct_CollisionBox.Y), a

    ld a, 16

    ld (ix + Struct_CollisionBox.width), a  ; width and height of plane col box
    ld (ix + Struct_CollisionBox.height), a

    ld ix, EnemyTemp_CollisionBox
    ld (ix + Struct_CollisionBox.width), a
    ld (ix + Struct_CollisionBox.height), a





    ld a, 0                             ; set all to zero
    ld (BgScrollRegister), a            ;
    ld (Player_State), a                ;
    ; ld (Player_Shot), a               ;
    ld (Enemy_0_Show), a                ;
    ld (Enemy_0_State), a               ;
    ld (Enemy_1_Show), a                ;
    ld (Enemy_1_State), a               ;
    ld (Enemy_2_Show), a                ;
    ld (Enemy_2_State), a               ;
    ld (Enemy_3_Show), a                ;
    ld (Enemy_3_State), a               ;
    ld (Enemy_4_Show), a                ;
    ld (Enemy_4_State), a               ;
    ld (Enemy_Shot_0_Show), a           ;
    ld (Enemy_Shot_1_Show), a           ;
    ld (Enemy_Shot_2_Show), a           ;
    ld (Enemy_Shot_3_Show), a           ;
    ld (Enemy_Shot_4_Show), a           ;
    ld (Player_Trigger_Pressed), a      ;
    ld (TypeLastShotTriggered), a       ;
    ld (Item_Show), a


    ; disable all 3 shots of player
    ld iy, Player_Shot_0_Obj
    ; ld (iy + Struct_PlayerShot.Enabled), a
    call DisableShot
    ld iy, Player_Shot_1_Obj
    ; ld (iy + Struct_PlayerShot.Enabled), a
    call DisableShot
    ld iy, Player_Shot_2_Obj
    ; ld (iy + Struct_PlayerShot.Enabled), a
    call DisableShot



    ; ld bc, 0
    ; ld (Player_Score), bc               ;
    ; ld a, 3                             ;
    ; ld (Player_Lifes), a                ;
    
    ret


; test git


; ---------------------------------------------------------
; Increment counter, do some actions based on its value 
; and show it on screen if debug mode = true
IncrementCounter:

    ld hl, (Counter)
    
    IFDEF DEBUG
        
        ; Show counter on screen (debug mode)
        ld hl, Counter
        ld d, 2                     ; size in bytes
        ld bc, 29                   ; names table offset (0-767)
        call PrintNumber
        
        ld hl, (Counter)
    ENDIF
    
   


    ld a, l
    and 0000 1111 b
    call z, BackgroundAnimation           ; background scroll at each 16 cycles


    ld hl, (Counter)
    inc hl
    ld (Counter), hl

    ; dec hl                      ; (4th byte)
    ; ld a, (hl)
    ; ld b, a
    
    ;ld a,d; pop af

    ; ld a, l
    ; ld b, h

    ; push af
    ; push bc
    

    ; pop bc
    ; pop af

    ; counter value is on BA. eg. counter = 0x0300
    ; b = 0x03 (hi)
    ; a = 0x00 (lo)

    ; ; if (counter == 0x0300)
    ; cp 0x00
    ; jr nz, .continue1           ; checks LSB (5th byte)
    ; ld a, b
    ; cp 0x03                     
    ; jr nz, .continue1           ; checks 4th byte



    ; look for action to be done on current counter value
    ld d, h                         ; hi
    ld e, l                         ; lo
    ; ld hl, LevelDataStart
    ld hl, (LevelDataLastAddr)

    ; TODO: lots of optimizations are possible here
    ; 1 - save the address of last action done, next time start there instead of from the beginning                         OK
    ; 2 - after read an addr on chunck, tests if is > than current counter, if so, gives up, as the actions are ordered     OK

.loop1:
; TODO: trade this by a dw  OK
    ld a, (hl)
    
    cp 255                     ; value 255 in the high byte of the counter in level data means end of data
    ret z
    
    push hl


    ; DE: current counter value
    ; HL: value on the current position of level data
    ; if (hl > de) exit
    ld c, a                     ; hi byte of current position of level data
    inc hl
    ld a, (hl)
    ld l, a                     ; lo byte current position of level data
    ld h, c
    push de
    call BIOS_DCOMPR            ; Compare Contents Of HL & DE, Set Z-Flag IF (HL == DE), Set CY-Flag IF (HL < DE)
    pop de
    pop hl
    jp z, .equal
    ret nc                      ; return if HL > DE
    jp .next                    ; try next if HL < DE

; .largerThan:
    ; pop hl
    ; ret




    ; old code, slow, but works
    ; cp d
    ; jp nz, .next               ; checks high byte of address
    ; inc hl
    ; ld a, (hl)
    ; cp e
    ; jp nz, .next               ; checks low byte of address




.equal:
    ; pop hl

    ld (LevelDataLastAddr), hl


    ; do the action
    inc hl
    inc hl
    ld a, (hl)                  ; get action type
    cp 0                        ; 0 = show enemy
    call z, .showEnemy
    cp 1                        ; 1 = enemy shoots
    call z, .enemyShoots
    cp 2                        ; 2 = item
    call z, .item
    cp 200                      ; 200 = level end
    jp z, .levelEnd


    jp .continue1

.showEnemy:

    ; ld ix, Enemy_1_Base_Address
    ; jp .contEnemyNumber

;TODO check enemy number and update correct variables
; if (Enemy_N_Type == 0) ix = Enemy_1_Base_Address
    push    hl

    ld      bc, 6
    add     hl, bc

    ; inc hl
    ; inc hl
    ; inc hl
    ; inc hl
    ; inc hl
    ; inc hl
    ld      a, (hl)                  ; get enemy number

    or      a ; same as cp 0
    jp      z, .enemyNumber_0

    dec     a ; cp  1
    jp      z, .enemyNumber_1

    dec     a ; cp 2
    jp      z, .enemyNumber_2

    dec     a ; cp 3
    jp      z, .enemyNumber_3

    dec     a ; cp 4
    jp      z, .enemyNumber_4

    pop     hl

    jp      .contEnemyNumber

.enemyNumber_0:
    pop     hl
    ld      ix, Enemy_0_Base_Address
    jp      .contEnemyNumber
.enemyNumber_1:
    pop     hl
    ld      ix, Enemy_1_Base_Address
    jp      .contEnemyNumber
.enemyNumber_2:
    pop     hl
    ld      ix, Enemy_2_Base_Address
    jp      .contEnemyNumber
.enemyNumber_3:
    pop     hl
    ld      ix, Enemy_3_Base_Address
    jp      .contEnemyNumber
.enemyNumber_4:
    pop     hl
    ld      ix, Enemy_4_Base_Address
    jp      .contEnemyNumber

.contEnemyNumber:
    ld      a, 1
    ld      (ix + Struct_Enemy.Show), a                  ; show enemy

	xor     a ; same as ld a, 0
	ld      (ix + Struct_Enemy.State), a	             ; disable explosion animation

    inc     hl
    ld      a, (hl)                                      ; get enemy type
    ld      (ix + Struct_Enemy.Type), a                  ; save value

    inc     hl
    ld      a, (hl)                                      ; get 1st color
    ld      (ix + Struct_Enemy.1stColor), a              ; save value
    
    inc     hl
    ld      a, (hl)                                      ; get 2nd color
    ld      (ix + Struct_Enemy.2ndColor), a              ; save value
    
    inc     hl
    ld      a, (hl)                                      ; get x coord
    ld      (ix + Struct_Enemy.X), a                     ; save value
    
    inc     hl
    ld      a, (hl)                                      ; get y coord
    ld      (ix + Struct_Enemy.Y), a                     ; save value

    ret

.item:

    ;push hl

    ld      bc, 4
    add     hl, bc

    ld      a, (hl)
    ld      (Item_X), a

    ld      a, TOP_SCREEN_IN_PIXELS
    ld      (Item_Y), a

    ld      a, Sprite_Item_ExtraLife
    ld      (Item_Pattern), a

    ld      a, COLOR_LIGHT_BLUE
    ld      (Item_Color), a

    ld      a, 1
    ld      (Item_Show), a

    ; pop hl
    ret

.enemyShoots:

;TODO check enemy number and update correct variables
    ; ld ix, Enemy_1_Base_Address

    ld      bc, 7
    add     hl, bc
    ld      a, (hl)                  ; get number of related enemy
    
    or      a ; same as cp 0
    jp      z, .enemy_0_shots

    dec     a ; cp 1
    jp      z, .enemy_1_shots

    dec     a ; cp 2
    jp      z, .enemy_2_shots

    dec     a ; cp 3
    jp      z, .enemy_3_shots

    dec     a ; cp 4
    jp      z, .enemy_4_shots

    ret

.enemy_0_shots:
    ld      ix, Enemy_0_Base_Address
    jp      .checkIfEnemy_IsAlive

.enemy_1_shots:
    ld      ix, Enemy_1_Base_Address
    jp      .checkIfEnemy_IsAlive

.enemy_2_shots:
    ld      ix, Enemy_2_Base_Address
    jp      .checkIfEnemy_IsAlive

.enemy_3_shots:
    ld      ix, Enemy_3_Base_Address
    jp      .checkIfEnemy_IsAlive

.enemy_4_shots:
    ld      ix, Enemy_4_Base_Address
    jp      .checkIfEnemy_IsAlive

.checkIfEnemy_IsAlive:
    ; ld a, (Enemy_1_Show)
    ld      a, (ix)
    or      a ; same as cp 0
    ret     z

    ld      a, 1
    ld      (ix + Struct_Enemy.Shot_Show), a

    inc     hl
    ld      a, (hl)                                      ; get delta x (-1 to +1)
    ld      (ix + Struct_Enemy.Shot_DeltaX), a           ; save
    
    ld      a, (ix + Struct_Enemy.X)                     ; get x coord of enemy
    add     a, 6                                         ; add 6
    ld      (ix + Struct_Enemy.Shot_X), a                ; save as x coord of shot
    
    ld      a, (ix + Struct_Enemy.Y)                     ; get y coord of enemy
    add     a, 16                                        ; add 16
    ld      (ix + Struct_Enemy.Shot_Y), a                ; save as y coord of shot
    
    ret

.levelEnd:

    ; check if the player is dead and with no extra lifes (explosion animation still running)
	; this fixes the bug when you die in your last life just before level end and gives you 255 lifes
    ld      a, (Player_Lifes)
	or      a ; same as cp 0
	jp      z, .continue1

    ; check if is the last level
    ld      a, (Level)
    cp      6
    jp      z, GameFinished


    call    HideAllSprites


    ; write 'LEVEL  FINISHED' on midscreen
	ld	    de, NamesTable + 256 + (32 * 4) + 16 - 7        ; VRAM Address
	ld	    hl, Msg_LevelFinished                           ;
    call    PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)
    ; write 'CONGRATULATIONS' on midscreen
	ld	    de, NamesTable + 256 + (32 * 5) + 16 - 7        ; VRAM Address
	ld	    hl, Msg_LevelFinished_1                         ;
    call    PrintString                                    ; Write string in screen 2 (hl: string addr, de: vram addr)

    
    call    WaitSomeSeconds
    
    ld      hl, Level
    inc     (hl)

    pop     bc              ; release SP
    jp      NewLevel

.next:
    ; pop hl
    ld bc, LevelDataChunckSize
    add hl, bc                  ; go to next chunk start
    push de
    ld de, LevelDataEnd
    
    ; if hl >= LevelDataEnd then get out loop
    call BIOS_DCOMPR            ; Compare Contents Of HL & DE, Set Z-Flag IF (HL == DE), Set CY-Flag IF (HL < DE)
    pop de
    jp nc, .continue1

    jp .loop1


.continue1:

    ret



; Print Hex number on screen
;   hl: address of LSB (defined as word - DW - little endian)
;   d: size of number in bytes
;   bc: names table offset (0-767)
PrintNumber:
.start:
    ld a, (hl)	    			; get value
    push hl
    ld	hl, NamesTable          ; VRAM Address
    add hl, bc                  ; adjust to offset

; .loop:
	push af
    and 0000 1111 b             ; masking to get the low nibble
    add a, Tile_Char_0_Number   ; convert it to hex char (0-9/A-Z)
	call BIOS_WRTVRM		    ; Writes data in VRAM, as VPOKE (HL: address, A: value)

    pop af
    dec hl                      ; go to previous char position on screen
    and 1111 0000 b             ; masking to get the high nibble
    srl a                       ; shift right 4 times
    srl a
    srl a
    srl a
    add a, Tile_Char_0_Number   ; convert it to hex char (0-9/A-Z)
	call BIOS_WRTVRM		    ; Writes data in VRAM, as VPOKE (HL: address, A: value)

    pop hl
    inc hl                      ; go to next byte on value
    
    dec bc                      ; go to previous char position on screen (it's necessary 2x)
    dec bc

    dec d
    jp nz, .start

    ret

; Prints a number on screen
;   hl: address of LSB (defined as bytes - DB - little endian)
;   d: size of number in bytes
;   bc: names table offset (0-767)
; PrintNumber_LittleEndian:
;     ld a, (hl)	    			; get value
;     push hl
;     ld	hl, NamesTable          ; VRAM Address
;     add hl, bc                  ;

; ; .loop:
; 	push af
;     and 0000 1111 b             ; masking to get the low nibble
;     add a, Tile_Char_0_Number   ; convert it to ASCII char (0-9)
; 	call BIOS_WRTVRM		    ; Writes data in VRAM, as VPOKE (HL: address, A: value)

;     pop af
;     dec hl                      ; go to previous char position on screen
;     and 1111 0000 b             ; masking to get the high nibble
;     srl a                       ; shift right 4 times
;     srl a
;     srl a
;     srl a
;     add a, Tile_Char_0_Number   ; convert it to ASCII char (0-9)
; 	call BIOS_WRTVRM		    ; Writes data in VRAM, as VPOKE (HL: address, A: value)

;     pop hl
;     inc hl                      ; go to next byte on value
    
;     dec bc                      ; go to previous char position on screen (it's necessary 2x)
;     dec bc

;     dec d
;     jp nz, PrintNumber_LittleEndian

;     ret



; Prints a number on names table buffer
;   hl: address of LSB (defined as bytes - DB - little endian)
;   d: size of number in bytes
;   bc: names table offset (0-767)
; trashes: a, b, c, d, e, h, l
PrintNumber_LittleEndian_NamesTableBuffer:
.start:
    ld      a, (hl)	    			; get value
    push    hl
    ld	    hl, NamesTableBuffer    ;
    add     hl, bc                  ;

; .loop:
    ld      e, a
    and     0000 1111 b             ; masking to get the low nibble
    add     a, Tile_Char_0_Number   ; convert it to ASCII char (0-9)
    ld      (hl), a             

    ld      a, e                    ; restore original value
    dec     hl                      ; go to previous char position on screen
    and     1111 0000 b             ; masking to get the high nibble
    srl     a                       ; shift right 4 times
    srl     a
    srl     a
    srl     a
    add     a, Tile_Char_0_Number   ; convert it to ASCII char (0-9)
    ld      (hl), a             

    pop     hl
    inc     hl                      ; go to next byte on value
    
    dec     bc                      ; go to previous char position on screen (it's necessary 2x)
    dec     bc

    dec     d
    jp      nz, .start

    ret



; Input: IY: base address of the shot using Struct_PlayerShot
; Output: none
DisableShot:


    xor     a ; same as ld a, 0
    ld      (iy + Struct_PlayerShot.Enabled), a

    ld      (iy + Struct_PlayerShot.X), a

    ld      a, 256 - 16
    ld      (iy + Struct_PlayerShot.Y), a

    ld      a, Sprite_Transparent
    ld      (iy + Struct_PlayerShot.Pattern), a

    ret



DisableItem:
    xor     a ; same as ld a, 0
    ld      (Item_Show), a         	; 
    ld      (Item_X), a
    ld      a, 256 - 16
    ld      (Item_Y), a
    ld      a, Sprite_Transparent
    ld      (Item_Pattern), a

    ret


ShowLifes:
	; show current number of lifes on top of screen
    ld      hl, NamesTableBuffer + 1    ; names table buffer address
    ld      a, (Player_Lifes)
    add     a, Tile_Char_0_Number       ; convert number to chars
    ld      (hl), a

    ret 



ShowScore:
	; show current score on top of screen
	ld      hl, Player_Score       	    ; LSB
    ld      d, 2                        ; size in bytes
    ld      bc, 17                      ; names table offset (0-255); position of least significant digit
    call    PrintNumber_LittleEndian_NamesTableBuffer

    ; add 0 to number at right (score is shown on screen multiplied by ten)
    ;ld      hl, NamesTableBuffer + 18   ; names table buffer on RAM address
    ld      a, Tile_Char_0_Number       ; char '0'
    ld      (NamesTableBuffer + 18), a  ; names table buffer on RAM address

    ret



GameOver:
    ; write 'GAME OVER' on midscreen
	ld	    de, NamesTable + 256 + (32 * 4) + 16 - 4        ; VRAM Address
	ld	    hl, Msg_GameOver                                ;
    call    PrintString                                     ; Write string in screen 2 (hl: string addr, de: vram addr)

    call    WaitSomeSeconds

    jp      Execute                                         ; restart game



; Input:
;    a: Level Number (1-6, 0=test level)
LoadLevel:
	
    cp 0
    jp z, .testLevel

    cp 1
    jp z, .level1

    cp 2
    jp z, .level2

    cp 3
    jp z, .level3

    cp 4
    jp z, .level4

    cp 5
    jp z, .level5

    cp 6
    jp z, .level6

    ; else
    jp .testLevel

.testLevel:
    ;ld hl, Level_Test.seaColor
    ;ld b, (hl)                          ; set sea color
    ;ld hl, Level_Test.msgLevelName
    ;ld de, Level_Test.levelDataStart
    jp .showLevelTitle

.level1:
    push    af  ; save level number

    ; Unpack file compressed by Pletter
    ; ld      hl, EndBackgroundData_1             ; Source (start address of compressed binary data)
    ; ld      de, CurrentBackgroundData_Unpacked
    ; call    Unpack
    ; ld      hl, CurrentBackgroundData_Unpacked - (23 * SCREEN_WIDTH_IN_TILES)       ; set initial pointer to start of first BG frame
    ; ld      (StartCurrentBackgroundDataAddress), hl

    ; Old code, before compression
    ld      hl, StartBackgroundData_1 - (23 * SCREEN_WIDTH_IN_TILES)       ; set initial pointer to start of first BG frame
    ld      (StartCurrentBackgroundDataAddress), hl
    
    ld      hl, Level_1.seaColor
    ld      b, (hl)                          ; set sea color
    ld      hl, Level_1.msgLevelName
    ld      de, Level_1.levelDataStart
    pop     af  ; get level number
    jp      .showLevelTitle

.level2:
    ld      hl, StartBackgroundData_2 - (23 * SCREEN_WIDTH_IN_TILES)       ; set initial pointer to start of first BG frame
    ;ld      hl, StartBackgroundData_2 
    ld      (StartCurrentBackgroundDataAddress), hl
    
    ld hl, Level_2.seaColor
    ld b, (hl)                          ; set sea color
    ld hl, Level_2.msgLevelName
    ld de, Level_2.levelDataStart
    jp .showLevelTitle

.level3:
    ld      hl, StartBackgroundData_1 - (23 * SCREEN_WIDTH_IN_TILES)       ; set initial pointer to start of first BG frame
    ld      (StartCurrentBackgroundDataAddress), hl
    
    ld hl, Level_3.seaColor
    ld b, (hl)                          ; set sea color
    ld hl, Level_3.msgLevelName
    ld de, Level_3.levelDataStart
    jp .showLevelTitle

.level4:
    ld      hl, StartBackgroundData_1 - (23 * SCREEN_WIDTH_IN_TILES)       ; set initial pointer to start of first BG frame
    ld      (StartCurrentBackgroundDataAddress), hl
    
    ld hl, Level_4.seaColor
    ld b, (hl)                          ; set sea color
    ld hl, Level_4.msgLevelName
    ld de, Level_4.levelDataStart
    jp .showLevelTitle

.level5:
    ld      hl, StartBackgroundData_1 - (23 * SCREEN_WIDTH_IN_TILES)       ; set initial pointer to start of first BG frame
    ld      (StartCurrentBackgroundDataAddress), hl
    
    ld hl, Level_5.seaColor
    ld b, (hl)                          ; set sea color
    ld hl, Level_5.msgLevelName
    ld de, Level_5.levelDataStart
    jp .showLevelTitle

.level6:
    ld      hl, StartBackgroundData_1 - (23 * SCREEN_WIDTH_IN_TILES)       ; set initial pointer to start of first BG frame
    ld      (StartCurrentBackgroundDataAddress), hl
    
    ld hl, Level_6.seaColor
    ld b, (hl)                          ; set sea color
    ld hl, Level_6.msgLevelName
    ld de, Level_6.levelDataStart
    ; jp .showLevelTitle

.showLevelTitle:
    push    bc                          ; save sea color info
    push    de

    call    LevelTitleScreen


    pop     hl                          ; from DE to HL
    call    LoadLevelData

    call    LoadTopStripTiles

    pop     bc                          ; retrieve sea color info

    ; set type of sea (Daylight or Nighttime)
    ld      a, b
    or      a ; same as cp 0
    jp      z, .setSeaDaylight
;.setSeaNighttime:
    ld      hl, Colors_Sea_Nighttime
    jp      .cont2
.setSeaDaylight:
    ld      hl, Colors_Sea_Daylight
.cont2:
    call    SetSeaTileColor

    ret



; LoadLevelData
; Input: HL addr of level data to be loaded
LoadLevelData:
    ;ld hl, addr                                    ; addr origin
    ld      de, LevelDataStart                      ; addr destiny
    ld      bc, LevelDataEnd - LevelDataStart       ; number of bytes
    ldir                                            ; copy BC bytes from HL to DE
    
    call ResetCounter

    ; ld      hl, StartBackgroundData_1
    ld      hl, (StartCurrentBackgroundDataAddress)
    ld      (NextBgLineAddr), hl

	; load first background frame
    ld	    bc, 23 * SCREEN_WIDTH_IN_TILES                          ; Block length
	ld	    hl, (NextBgLineAddr)
    ld      de, NamesTableBuffer + SCREEN_WIDTH_IN_TILES            ; Destiny
    ldir                                                            ; Copy BC number of bytes from HL to DE


    ret


ResetCounter:
    ld hl, 0
    ld (Counter), hl                     ;
    ret



; Input: none
; Output: IY: base address of the first shot avaliable
;         Z flag set if none avaliable
GetFirstAvailableShot:
    ; TODO: loop here
    ld iy, Player_Shot_0_Obj
    ld a, (iy + Struct_PlayerShot.Enabled)
    cp 1
    ret nz

    ld iy, Player_Shot_1_Obj
    ld a, (iy + Struct_PlayerShot.Enabled)
    cp 1
    ret nz

    ld iy, Player_Shot_2_Obj
    ld a, (iy + Struct_PlayerShot.Enabled)
    cp 1
    ret nz

    ; no shot available
    and 0                               ; force Z flag
    ret

UpdateShotSpritesAttrs:
    ld iy, Player_Shot_0_Obj
    ld ix, SpriteLayer_2_Y
    call .UpdateShotSpriteAttrs

    ld iy, Player_Shot_1_Obj
    ld ix, SpriteLayer_3_Y
    call .UpdateShotSpriteAttrs

    ld iy, Player_Shot_2_Obj
    ld ix, SpriteLayer_4_Y
    call .UpdateShotSpriteAttrs

    ret 

; update ONE single shot sprite
; Input: iy: Struct_PlayerShot
.UpdateShotSpriteAttrs:
    ld a, (iy + Struct_PlayerShot.Y)
    ld (ix + 0), a

    ld a, (iy + Struct_PlayerShot.X)
    ld (ix + 1), a

    ld a, (iy + Struct_PlayerShot.Pattern)
    ld (ix + 2), a

    ret


; Input: HL: RAM address
ShiftRight8Pixels:
    ;call ShiftRight8Pixels
	;call BIOS_RDVRM		        ; Reads data from VRAM, as VPEEK (HL: address, output in A)
    ld a, (hl)
    and 0000 0001 b         ; save bit 0
    sra (hl)
    ;ld a, 0101 0101 b
    ;call BIOS_WRTVRM		; Writes data in VRAM, as VPOKE (HL: address, A: value)

    ld de, 8
    add hl, de
    or a                    ; cp 0
    jp z, .resBit7
;.setBit7:
    set 7, (hl)
    ret
.resBit7:
    res 7, (hl)
    ret
