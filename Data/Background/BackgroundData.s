; Source ASM files
; INCLUDE "Data/Background/BackgroundData_1.s"
INCLUDE "Data/Background/BackgroundData_2.s"



; Binary files before compression
EndBackgroundData_1:
INCBIN "Data/Background/BackgroundData_1_Unpacked.bin"
StartBackgroundData_1:



; Binary files after compression
; EndBackgroundData_1:
; INCBIN "Data/Background/BackgroundData_1_Packed.bin"
; StartBackgroundData_1:
