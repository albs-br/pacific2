; 2		small island			48,56
; 3		trees (dark green)		64,72,80
; 3		trees (light green)		88,96,104
; 2		rocks					112,120
; 5		island mid-left			128,136,144,152,160
; 5		island mid-right		168,176,184,192,200
; 3		island leftmost			208,216,224
; 3		island rightmost		232,240,248

    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 56,  0, 56,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 48,  0, 48, 56,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,200,  0,  0,  0,  0,  0, 48,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,224,152,192,248,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,216,144,184,240,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,208,136,176,232,  0,  0,  0,  0,  0,  0,  0,  0,160,200,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,168,  0,  0,  0,  0,  0,  0,  0,  0,160,152,192,200,  0,224
    db      0,  0,  0, 56,  0,160,200,160,200,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,224,152,120,104,192,248,216
    db      0,  0,  0, 48,160,152,192,152,192,200,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,216,144,112, 96,184,240,216
    db      0,  0,  0,224,152,120,104,104,184,192,200,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,208,136,144, 88,176,232,216
    db      0,  0,  0,216,144,112, 96, 88,120,184,192,248,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,136,176,168,  0,216
    db      0,  0,  0,208,136,144, 88,144,112,120,184,240, 56,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,168,  0,  0,208
    db      0,  0,  0,  0,128,136,176,136,184,112,176,232, 48,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,128,168,128,136,176,168, 56,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,200,160,200,160,200,160
    db      0,  0,  0,  0,  0,  0,  0,  0,128,168, 56, 48,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,224,152,192,152,192,152,192,152
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 48,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,216,144,184,120,184, 80,184,144
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,208,136,144,112,144, 72,144,144
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,136,176,136, 64,120,120
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 56,  0,160,200,160,200,  0,  0,  0,  0,  0,  0,128,168,128,136,112,112
    db     56,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 56, 48,160,152,192,152,192,200,  0,  0,  0,  0,  0,  0,  0,  0,128,136,144
    db     48,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 48,224,152,144,184, 80, 80,192,248,  0,  0,  0,  0,  0,  0,  0,  0,128,136
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,216,144,120,184, 72, 72,184,240,  0,  0,  0,  0,  0,  0,  0,  0,  0,128
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,208,136,112,184, 64, 64,176,232,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,136,176,136,176,168,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,168,128,168,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,200,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,152,192,200,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,224,152,144,184,192,248,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,216,144,144,184,184,240,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,208,136,144,184,176,232,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,136,176,168,  0,160,200,  0
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,168,  0,224,152,192,248
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,216,144, 80,240
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,216,144, 72,240
    db      0,  0,  0,  0,  0,  0,  0,160,200,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,216,144, 64,240
    db      0,  0,  0,  0,160,200,160,152,192,200,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,208,136,176,232
    db      0,  0,  0,160,152,192,152,104,104,192,200,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,168,  0
    db      0,  0,160,152, 80, 80,104, 96, 96,184,192,200,  0, 56,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,224,152, 80, 72, 72, 96, 96, 88,120,120,192,248, 48,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,216,144, 72, 72, 72, 96, 88,184,112,112,184,240,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,216,120, 72, 72, 72, 88,184,184,176,136,176,232,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,216,112, 64, 64, 64,144,184,176,168,128,168,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160
    db      0,208,136,176,136,176,136,176,168,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,152
    db      0,  0,128,168,128,168,128,168,  0,160,200,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,152,144
    db      0,  0,  0,  0,  0,160,200,  0,224,152,192,248,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,200,160,200,160,200,160,200,152,144,184
    db      0,  0,  0,  0,224,152,192,248,216,144,184,240,  0,  0,  0,  0,  0,  0,  0,  0,160,152,192,152,192,152,192,152,192, 80, 80,104
    db      0,  0,  0,  0,216,144,184,240,208,136,176,232,  0,  0,  0,  0,  0,  0,  0,224,152,144,184,144,184,144,184, 80, 80, 72, 72, 96
    db      0,  0,  0,  0,208,136,176,232,  0,128,168,  0,  0,  0,  0,  0, 56,  0,  0,216,144,184,144,184,144,184,144, 64, 72, 72, 72, 96
    db      0,  0,  0,  0,  0,128,168,  0,  0,  0,  0,  0,  0,  0,  0,  0, 48,  0,  0,208,136,176,136,176,136,144,144,184, 64, 64, 64, 88
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,168,128,168,128,136,144,184,144,144,144,144
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,136,176,136,144,120,120
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,168,128,136,112,112
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,136,144
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128,136
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,128
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
    db      0,  0,  0,  0,  0,  0,  0, 56,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160
    db      0,  0,  0,  0,  0,  0,  0, 48,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,152
    db      0,  0,  0,  0,  0,  0,  0,  0,  0,  0,160,200,160,200,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,224,152,144

    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128,128
    db    184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,176,168,  0,160,152,144,184,184,184,184,184,184,184,184,184
    db    184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,176,168,  0,160,152,144,184,184,184,184,184,184,184,184,184,184
    db    184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,176,168,  0,160,152,144,184,184,184,184,184,184,184,184,184,184,184
    db    184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,240,  0,224,184,184,184,184,184,184,184,184,184,184,184,184,184,184
    db    184,184,184,184,184,184,184,184,184,184,184,184,184,184,184,240,  0,216,184,184,184,184,184,184,184,184,184,184,184,184,184,184
    db    184,184,184,184,184,184,184,184,184,184,184,184,184,184,176,232,  0,208,184,184,184,184,184,184,184,184,184,184,184,184,184,184
    db    184,184,184,184,184,184,184,184,184,184,184,184,184,176,168,  0,  0,160,152,144,184,184,184,184,184,184,184,184,184,184,184,184
    db    184,184,184,184,184,184,184,184,184,184,184,184,176,168,  0,  0,160,152,144,184,184,184,184,184,184,184,184,184,184,184,184,184
    db    184,184,184,184,184,184,184,184,184,184,184,176,168,  0,  0,160,152,144,184,184,184,184,184,184,184,184,184,184,184,184,184,184
StartBackgroundData_2:


; test of speed with screen full of tiles
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
    ; db      128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128
