TOP_SCREEN_IN_PIXELS:           equ     8        ; top of playing field, excluding the top strip with lifes and score
SCREEN_WIDTH_IN_TILES:          equ     32


; enemy types available:
PLANE_FROM_TOP:     equ     0
PLANE_FROM_RIGHT:   equ     1
PLANE_FROM_LEFT:    equ     2
BOAT:               equ     3

; color schemes available:
; white/gray:   db  15, 14              ; enemy 1st, 2nd color
; yellow:       db  11, 10              ; enemy 1st, 2nd color
; red:          db  9, 6                ; enemy 1st, 2nd color
; blue:         db  7, 5                ; enemy 1st, 2nd color
; green:        db  3, 12               ; enemy 1st, 2nd color

; action types
SHOW_ENEMY:         equ     0
ENEMY_SHOOTS:       equ     1