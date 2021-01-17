{
 Pacific 2 
 https://github.com/albs-br/pacific2
 version (refer to data/strings.s)
 developed aug/2020-
 for MSX 1 computers

 File to be assembled by tniasm 0.45

 Tested on emulators WebMSX, Emulicious (C-Bios) and openMSX (various bios)

 Acknowledgements:
 -https://datassette.org/
 -Msx.org and users
 -Web MSX
 -Open MSX
 -Emulicious
 -MSX Pen
 -MSX Community in Brazil, Facebook and Whatsapp groups
 -8 bit workshop
}

FNAME "pacific2.rom"      ; output file

INCLUDE "include/msxbios.s"
INCLUDE "include/vram.s"


;RomSize:	equ 0x4000	            ; For 16kB Rom size.
RomSize:	equ 0x8000	            ; For 32kB Rom size.


DEBUG:      equ 255                 ; defines debug mode, value is irrelevant (comment it out for production version)

; Compilation address
	org 0x4000	                    ; 0x8000 can be also used here if Rom size is 16kB or less.
 
INCLUDE "include/romheader.s"

; Program code entry point
Execute:

; init interrupt mode and stack pointer (in case the ROM isn't the first thing to be loaded)
	di                          ; disable interrupts
	im      1                   ; interrupt mode 1
    ld      sp, (BIOS_HIMEM)    ; init SP

    call    ClearRam

    call    InitVram


    call    EnableRomPage2

IFDEF DEBUG
    ;call ShowDebugInfo     ; not working anymore
ENDIF


;NewGame:
    ; ld    a, 0                             ; test level
    ld      a, 1                             ;
    ld      (Level), a                       ;

    ld      bc, 0
    ld      (Player_Score), bc               ;
    ld      a, 3                             ;
    ;ld     a, 1                             ; debug (min number of lifes is 1)
    ld      (Player_Lifes), a                ;


    ;call   TitleScreen ; [debug]


NewLevel:
    call    InitVram


    call    InitVariables
 


    ld      a, (Level)
    call    LoadLevel



; Show initial values of lifes and score
    call    ShowScore
    call    ShowLifes



MainLoop:

    call    ReadInput

    call    UpdateScreen

    call    GameLogic

    ;call   Delay

    call    IncrementCounter

    jp      MainLoop

    ;jp     Finished

; Halt program execution. Change to "ret" to return to MSX-BASIC.
 
Finished:
	jr	    Finished	; Jump to itself endlessly.
 

 ; Routines
INCLUDE "InitVram.s"
INCLUDE "Include/CommonRoutines.s"
INCLUDE "Include/MsxConstants.s"
INCLUDE "SpecificRoutines.s"
INCLUDE "BackgroundAnimation.s"
INCLUDE "Constants.s"
INCLUDE "ReadInput.s"
INCLUDE "Sound.s"
INCLUDE "UpdateScreen/UpdateScreen.s"
INCLUDE "GameLogic/GameLogic.s"
INCLUDE "Title/Title.s"
INCLUDE "Title/LevelTitle.s"
INCLUDE "Structs/Struct_CollisionBox.s"
INCLUDE "Structs/Struct_PlayerShot.s"
INCLUDE "Structs/Struct_Enemy.s"



 ; Data
INCLUDE "Data/Tiles/Tiles.s"
INCLUDE "Data/Tiles/Background/Land.s"
INCLUDE "Data/Colors/Colors.s"
INCLUDE "Data/Colors/Background/Land.s"
INCLUDE "Data/Names.s"
INCLUDE "Data/Sprites.s"
INCLUDE "Data/Strings.s"
INCLUDE "Data/SpriteBufferInit.s"
INCLUDE "Data/LevelData/LevelData.s"
INCLUDE "Data/BackgroundData.s"
INCLUDE "Data/LevelCurtain.s"





End:
	ds TableAlignedDataStart - End, 255	; 8000h + RomSize - End if org 8000h



	org 0xbf00	                    ; table aligned data
TableAlignedDataStart:

TableAlignedDataEnd:

; Padding with 255 to make the file of 16K/32K size (can be 4K, 8K, 16k, etc) but
; some MSX emulators or Rom loaders can not load 4K/8K Roms.
; (Alternatively, include macros.asm and use ALIGN 4000H)
	ds 0x4000 + RomSize - TableAlignedDataEnd, 255	; 8000h + RomSize - End if org 8000h



; Variables (mapped to RAM memory)
	org 0xc000, 0xefff                   ; for machines with 16kb of RAM (use it if you need 16kb RAM, will crash on 8kb machines, such as the Casio PV-7)
	; CAUTION: do not use 0xe000, it causes the game to crash on real machines with some SD mappers
    ;org 0xe000                          ; for machines with 8kb of RAM (use it if you need 8kb RAM or less, will work on any machine)

; use max addr for RAM:
;         ORG  4000h,7FFFh        ; start from 4000h, warn if exceeding 7FFFh

RamStart:

INCLUDE "Variables.s"
INCLUDE 'VramSpriteAttrBuffer.s'
INCLUDE 'VramNamesTableBuffer.s'

RamEnd: