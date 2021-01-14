CURTAIN_LEFT_INITIAL_X:          equ     120
CURTAIN_RIGHT_INITIAL_X:         equ     CURTAIN_LEFT_INITIAL_X + 8

LevelCurtainInitialPosition_Start:
    db      (16 *  0) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  1) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  2) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  3) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  4) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  5) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  6) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  7) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  8) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 *  9) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 * 10) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    db      (16 * 11) - 1, CURTAIN_LEFT_INITIAL_X, Sprite_LevelCurtain_Left, COLOR_BLACK      ; y - 1, x, pattern number, color
    
    db      (16 *  0) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  1) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  2) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  3) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  4) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  5) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  6) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  7) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  8) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 *  9) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 * 10) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
    db      (16 * 11) - 1, CURTAIN_RIGHT_INITIAL_X, Sprite_LevelCurtain_Right, COLOR_BLACK    ; y - 1, x, pattern number, color
LevelCurtainInitialPosition_End:
