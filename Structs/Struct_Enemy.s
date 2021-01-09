;     Enemy_0_Base_Address:
;     Enemy_0_Show:               rb 1            ;
;     Enemy_0_State:              rb 1            ; State, to control the explosion animation
;     Enemy_0_Type:               rb 1            ;
;     Enemy_0_1stColor:           rb 1            ;
;     Enemy_0_2ndColor:           rb 1            ;
;     Enemy_0_X:                  rb 1            ;
;     Enemy_0_Y:                  rb 1            ;
;     Enemy_0_2ndColorPattern:    rb 1            ;0
; ; Enemy shot 0
;     Enemy_Shot_0_Show:          rb 1            ;
;     Enemy_Shot_0_X:             rb 1            ;
;     Enemy_Shot_0_Y:             rb 1            ;
;     Enemy_Shot_0_DeltaX:        rb 1            ;

Struct_Enemy:
.Show:               equ     0
.State:              equ     1
.Type:               equ     2
.1stColor:           equ     3
.2ndColor:           equ     4
.X:                  equ     5
.Y:                  equ     6
.2ndColorPattern:    equ     7
.Shot_Show:          equ     8
.Shot_X:             equ     9
.Shot_Y:             equ     10
.Shot_DeltaX:        equ     11
