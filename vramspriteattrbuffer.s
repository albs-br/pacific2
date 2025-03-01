{
Sprite layers:
-------------

0-1             Player plane
2-4             Player shot
5-9             Enemies 2nd color
10-12           -
13-17           Enemies 1st color
18-22           Enemy shots
23              Item
24-25           -
26-30           Enemy shadows
31              Player shadow
}

; VRAM Sprite attributes table buffer
    VramSpriteAttrBuffer:

    ; Player 2nd color
    SpriteLayer_0_Y:         Player_Y:                   rb 1            ;
    SpriteLayer_0_X:         Player_X:                   rb 1            ;
    SpriteLayer_0_Pattern:   Player_Pattern:             rb 1            ;
    SpriteLayer_0_Color:     Player_Color:               rb 1            ;

    ; Player 1st color
    SpriteLayer_1_Y:                                     rb 1            ;
    SpriteLayer_1_X:                                     rb 1            ;
    SpriteLayer_1_Pattern:                               rb 1            ;
    SpriteLayer_1_Color:                                 rb 1            ;

    ; Player shot 0
    SpriteLayer_2_Y:         Player_Shot_Y:              rb 1            ;
    SpriteLayer_2_X:         Player_Shot_X:              rb 1            ;
    SpriteLayer_2_Pattern:   Player_Shot_Pattern:        rb 1            ;
    SpriteLayer_2_Color:     Player_Shot_Color:          rb 1            ;

    ; Player shot 1
    SpriteLayer_3_Y:         Player_Shot_1_Y:            rb 1            ;
    SpriteLayer_3_X:         Player_Shot_1_X:            rb 1            ;
    SpriteLayer_3_Pattern:   Player_Shot_1_Pattern:      rb 1            ;
    SpriteLayer_3_Color:     Player_Shot_1_Color:        rb 1            ;

    ; Player shot 2
    SpriteLayer_4_Y:         Player_Shot_2_Y:            rb 1            ;
    SpriteLayer_4_X:         Player_Shot_2_X:            rb 1            ;
    SpriteLayer_4_Pattern:   Player_Shot_2_Pattern:      rb 1            ;
    SpriteLayer_4_Color:     Player_Shot_2_Color:        rb 1            ;

    ; Enemy 0 2nd color
    SpriteLayer_5_BaseAddr:                               rb 4

    ; Enemy 1 2nd color
    SpriteLayer_6_BaseAddr:                               rb 4

    ; Enemy 2 2nd color
    SpriteLayer_7_BaseAddr:                               rb 4

    ; Enemy 3 2nd color
    SpriteLayer_8_BaseAddr:                               rb 4

    ; Enemy 4 2nd color
    SpriteLayer_9_BaseAddr:                               rb 4

    SpriteLayer_10_BaseAddr:                              rb 4
    SpriteLayer_11_BaseAddr:                              rb 4
    SpriteLayer_12_BaseAddr:                              rb 4


    ; Enemy 0 1st color
    SpriteLayer_13_BaseAddr:                              rb 4
    ; Enemy 1 1st color
    SpriteLayer_14_BaseAddr:                              rb 4
    ; Enemy 2 1st color
    SpriteLayer_15_BaseAddr:                              rb 4
    ; Enemy 3 1st color
    SpriteLayer_16_BaseAddr:                              rb 4
    ; Enemy 4 1st color
    SpriteLayer_17_BaseAddr:                              rb 4




    ; Enemy shot 0
    SpriteLayer_18_Y:                                     rb 1            ;
    SpriteLayer_18_X:                                     rb 1            ;
    SpriteLayer_18_Pattern:                               rb 1            ;
    SpriteLayer_18_Color:       Enemy_Shot_0_Color:       rb 1            ;

    ; Enemy shot 1
    SpriteLayer_19_Y:                                     rb 1            ;
    SpriteLayer_19_X:                                     rb 1            ;
    SpriteLayer_19_Pattern:                               rb 1            ;
    SpriteLayer_19_Color:       Enemy_Shot_1_Color:       rb 1            ;

    ; Enemy shot 2
    SpriteLayer_20_Y:                                     rb 1            ;
    SpriteLayer_20_X:                                     rb 1            ;
    SpriteLayer_20_Pattern:                               rb 1            ;
    SpriteLayer_20_Color:       Enemy_Shot_2_Color:       rb 1            ;

    ; Enemy shot 3
    SpriteLayer_21_Y:                                     rb 1            ;
    SpriteLayer_21_X:                                     rb 1            ;
    SpriteLayer_21_Pattern:                               rb 1            ;
    SpriteLayer_21_Color:       Enemy_Shot_3_Color:       rb 1            ;

    ; Enemy shot 4
    SpriteLayer_22_Y:                                     rb 1            ;
    SpriteLayer_22_X:                                     rb 1            ;
    SpriteLayer_22_Pattern:                               rb 1            ;
    SpriteLayer_22_Color:       Enemy_Shot_4_Color:       rb 1            ;

    ; Item (power up, extra life)
    SpriteLayer_23_Y:        Item_Y:                      rb 1            ;
    SpriteLayer_23_X:        Item_X:                      rb 1            ;
    SpriteLayer_23_Pattern:  Item_Pattern:                rb 1            ;
    SpriteLayer_23_Color:    Item_Color:                  rb 1            ;


                                                          rb (2*4)

    ; Enemy 0 Shadow
    SpriteLayer_26_Y:                                     rb 1            ;
    SpriteLayer_26_X:                                     rb 1            ;
    SpriteLayer_26_Pattern:                               rb 1            ;
    SpriteLayer_26_Color:                                 rb 1            ;

    ; Enemy 1 Shadow
    SpriteLayer_27_Y:                                     rb 1            ;
    SpriteLayer_27_X:                                     rb 1            ;
    SpriteLayer_27_Pattern:                               rb 1            ;
    SpriteLayer_27_Color:                                 rb 1            ;

    ; Enemy 2 Shadow
    SpriteLayer_28_Y:                                     rb 1            ;
    SpriteLayer_28_X:                                     rb 1            ;
    SpriteLayer_28_Pattern:                               rb 1            ;
    SpriteLayer_28_Color:                                 rb 1            ;

    ; Enemy 3 Shadow
    SpriteLayer_29_Y:                                     rb 1            ;
    SpriteLayer_29_X:                                     rb 1            ;
    SpriteLayer_29_Pattern:                               rb 1            ;
    SpriteLayer_29_Color:                                 rb 1            ;

    ; Enemy 4 Shadow
    SpriteLayer_30_Y:                                     rb 1            ;
    SpriteLayer_30_X:                                     rb 1            ;
    SpriteLayer_30_Pattern:                               rb 1            ;
    SpriteLayer_30_Color:                                 rb 1            ;



    ; Player shadow
    SpriteLayer_31_Y:                                    rb 1            ;
    SpriteLayer_31_X:                                    rb 1            ;
    SpriteLayer_31_Pattern:                              rb 1            ;
    SpriteLayer_31_Color:                                rb 1            ;
