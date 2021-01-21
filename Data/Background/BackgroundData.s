; Source ASM files
; INCLUDE "Data/Background/BackgroundData_1.s"
    INCLUDE "Data/Background/BackgroundData_2.s"



; Binary files before compression
EndBackgroundData_1_Unpacked:
    INCBIN "Data/Background/BackgroundData_1_Unpacked.bin"
StartBackgroundData_1_Unpacked:
BackgroundData_1_UnpackedSize:      equ StartBackgroundData_1_Unpacked - EndBackgroundData_1_Unpacked


; Binary files after compression
EndBackgroundData_1:
    INCBIN "Data/Background/BackgroundData_1_Packed.bin"
StartBackgroundData_1:



; TESTING_PLETTER:
;     INCBIN "Data/Background/TESTING_PLETTER.bin"
