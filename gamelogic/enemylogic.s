
GameLogicEnemy:

	; ld a, (Enemy_1_Show)			; if enemy 1 is hidden, skip enemy logic/check collision
	ld 		a, (ix)			; if enemy 1 is hidden, skip enemy logic/check collision
	or		a  ;same as cp 0
	jp 		z, .skipCheckEnemy_1

	; update enemy position
	;if(enemytype == 0)
	; ld a, (Enemy_1_Type)			;
	ld 		a, (ix + 2)			;

	or 		a ; same as cp 0
	jp 		z, .enemyType_0

	;elseif(enemytype == 1)
	dec 	a ; cp 1
	jp 		z, .enemyType_1

	;elseif(enemytype == 2)
	dec 	a ; cp 2
	jp 		z, .enemyType_2

	;elseif(enemytype == 3)
	dec 	a ; cp 3
	jp 		z, .enemyType_3			; Boat

	;else
	jp 		.contGameLogic


.enemyType_0:
	; ld a, (Enemy_1_Y)				;
	ld 		a, (ix + Struct_Enemy.Y)				;
	inc 	a
	cp 		192
	call	z, .hideEnemy

	; ld (Enemy_1_Y), a				; save updated value
	ld 		(ix + Struct_Enemy.Y), a				; save updated value

	push 	ix
    ld 		ix, EnemyTemp_CollisionBox		; update coord of collision box
    ld 		(ix + Struct_CollisionBox.Y), a
	pop 	ix

	jp 		.contGameLogic

.enemyType_1:
	; ld a, (Enemy_1_X)				;
	; TODO: optimization here: dec (ix + n)
	ld 		a, (ix + Struct_Enemy.X)				;
	dec 	a
	;cp 0
	call 	z, .hideEnemy

	; ld (Enemy_1_X), a				; save updated value
	ld 		(ix + Struct_Enemy.X), a				; save updated value

	push 	ix
    ld 		ix, EnemyTemp_CollisionBox		; update coord of collision box
    ld 		(ix + Struct_CollisionBox.X), a
	pop 	ix

	jp 		.contGameLogic

.enemyType_2:
	; ld a, (Enemy_1_X)				;
	ld 		a, (ix + Struct_Enemy.X)				;
	inc 	a
	;cp 0
	call 	z, .hideEnemy

	; ld (Enemy_1_X), a				; save updated value
	ld 		(ix + Struct_Enemy.X), a				; save updated value

	push 	ix
    ld 		ix, EnemyTemp_CollisionBox		; update coord of collision box
    ld 		(ix + Struct_CollisionBox.X), a
	pop 	ix

	jp 		.contGameLogic

.enemyType_3:
	; ld a, (Enemy_1_X)				;
	ld 		a, (ix + Struct_Enemy.X)				;
	;inc 	a
	cp 		192
	call 	z, .hideEnemy

	; ld (Enemy_1_X), a				; save updated value
	ld 		(ix + Struct_Enemy.X), a				; save updated value

	push 	ix
    ld 		ix, EnemyTemp_CollisionBox		; update coord of collision box
    ld 		(ix + Struct_CollisionBox.X), a
	pop 	ix

	jp 		.contGameLogic

.hideEnemy:
	xor		a ; same as ld a, 0
	; ld (Enemy_1_Show), a			; hide enemy
	ld 		(ix), a			; hide enemy
	ret

.contGameLogic:

	; Check collision between player and enemy
	; push ix

	; ld ix, Player_CollisionBox
	; ld iy, EnemyTemp_CollisionBox
	
	; call CollisionCheck_Boxes
	; pop ix
    ; jp c, .playerPlaneGotHit


	; Check collision between player plane and enemy
	ld 		a, (Player_State)
	or		a ; same as cp 0
	jp 		nz, .next1					; skip if player isn't alive

	ld 		a, (ix + Struct_Enemy.X)	; enemy X + 7
	add 	7
	ld 		h, a
	ld 		a, (ix + Struct_Enemy.Y)	; enemy Y + 7
	add 	7
	ld 		l, a

	ld 		a, (Player_X)
	ld 		b, a						; player x1
	add 	16
	ld 		d, a						; player x2

	ld 		a, (Player_Y)
	ld 		c, a						; player y1
	add 	16
	ld 		e, a						; player y2
	
	call 	CheckCollision             ; 
    jp 		nz, .playerPlaneGotHit


.next1:

	; ld a, (Player_Shot)				; if there is no shot fired skip check collision between shot and enemy
	; cp 0
	; jp z, .skipCheckEnemy_1

	; TODO: loop throught all 3 player shots and check it against enemy
   	ld 		iy, Player_Shot_0_Obj                  ; First shot

   	ld 		b, 3                                   ; number of shots
.loop:
   	push 	bc

    ld 		a, (iy + Struct_PlayerShot.Enabled)
	or		a ; same as cp 0
	jp 		z, .nextShot


    ; Test colision between shot and enemy
	; ld a, (Player_Shot_X)			;   h: x coord
    ld 		a, (iy + Struct_PlayerShot.X);   h: x coord
	add 	a, 6						;   get the correct upper left pixel
	ld 		h, a
	; ld a, (Player_Shot_Y)			;   l: y coord
    ld 		a, (iy + Struct_PlayerShot.Y);   l: y coord
	ld 		l, a

	; ld a, (Enemy_1_X)				;   b: x1 coord
	ld 		a, (ix + Struct_Enemy.X);   b: x1 coord
	ld 		b, a
    add 	a, 15                       ;   d: x2 coord
    ld 		d, a
	; ld a, (Enemy_1_Y)				;   c: y1 coord
	ld 		a, (ix + Struct_Enemy.Y);   c: y1 coord
	ld 		c, a
    add 	a, 15                       ;   e: y2 coord
    ld 		e, a

    ; ;test
	; ld h, 80
	; ld l, 100
	; ld b, 70
	; ld c, 90
	; ld d, 110
	; ld e, 101

	call 	CheckCollision             ; 
    call 	nz, .CollisionTrue


	; push ix

	; ld ix, Player_Shot_CollisionBox
	; ld iy, EnemyTemp_CollisionBox
	
	; call CollisionCheck_Boxes
	; pop ix
    ; jp c, .colisionTrue

.nextShot:
	ld		bc, Struct_PlayerShot_Size
	add 	iy, bc
	pop 	bc
	djnz 	.loop

.skipCheckEnemy_1:

	; ld a, (Enemy_Shot_1_Show)			;
	ld 		a, (ix + Struct_Enemy.Shot_Show)			;
	or		a ; same as cp 0
	jp 		z, .next




	; update enemy shot position
	; ld a, (Enemy_Shot_1_X)				;
	ld 		a, (ix + Struct_Enemy.Shot_X)				;
	ld 		b, a
	; ld a, (Enemy_Shot_1_DeltaX)
	ld 		a, (ix + Struct_Enemy.Shot_DeltaX)
	add 	a, b
    or		a ; same as cp 0
    jp 		z, .disableEnemyShot           	;   if x == 0 disable enemy shot
	
	; ld (Enemy_Shot_1_X), a				;
	ld 		(ix + Struct_Enemy.Shot_X), a				;

	; ld a, (Enemy_Shot_1_Y)				;
	ld 		a, (ix + Struct_Enemy.Shot_Y)				;
	inc 	a
	cp 		192
    jp 		z, .disableEnemyShot           	;   if y == 192 disable enemy shot

	; ld (Enemy_Shot_1_Y), a				;
	ld 		(ix + Struct_Enemy.Shot_Y), a				;












	; Check collision between enemy shot and player plane
	; TODO: adjust the box size

	ld 		a, (Player_State)
	or		a ; same as cp 0
	jp 		nz, .next					; skip if player isn't alive

	ld 		h, (ix + Struct_Enemy.Shot_X)	; shot X
	ld 		l, (ix + Struct_Enemy.Shot_Y)	; shot Y

	ld 		a, (Player_X)
	ld 		b, a						; player x1
	add 	16
	ld 		d, a						; player x2

	ld 		a, (Player_Y)
	ld 		c, a						; player y1
	add 	16
	ld 		e, a						; player y2

	call 	CheckCollision             ; 
    jp 		nz, .playerPlaneGotHit

	jp 		.next

.playerPlaneGotHit:

	call 	SoundExplosion

	ld 		a, 1
	ld 		(Player_State), a

	ld 		hl, Player_Lifes
	dec 	(hl)
	call 	ShowLifes

	;ld a, (Player_Lifes)
	;cp 0
	;jp z, GameOver
	

.disableEnemyShot:
	xor		a ; same as ld a, 0
	; ld (Enemy_Shot_1_Show), a			;
	ld 		(ix + Struct_Enemy.Shot_Show), a			;


	;rest of logic here
.next:

    ret

.CollisionTrue:

	call 	SoundExplosion

	xor		a ; ld a, 0							; hide enemy
	; ld (Enemy_1_Show), a
	ld 		(ix), a
	inc 	a							; start animation
	; ld (Enemy_1_State), a
	ld 		(ix + Struct_Enemy.State), a

   	call 	DisableShot


	; add points to the score
	ld 		hl, (Player_Score)			;
	; attention: BCD constants should always be written in hexa
	ld 		bc, 0x05						; TODO: get this value correct for each kind of enemy
	ld 		d, h							; high byte
	ld 		a, l							; low byte
	add 	a, c
	daa
	jp 		nc, .notIncScoreHi
	inc 	d
.notIncScoreHi:
	ld 		h, d
	ld 		l, a
	ld 		(Player_Score), hl			; save updated score

	call 	ShowScore
	; call	UpdateNamesTable_TopStrip

    ret


; .gameOver:
; 	jp .gameOver