
{
 10 SOUND 8,15:SOUND 0,93:SOUND 1,0:FOR F=0 TO 20:NEXT F
 20 SOUND 0,45:SOUND 1,0:FOR F=0 TO 29:NEXT F: SOUND 8,0

' mude o valor do registro 0 na linha 10 para alterar o timbre
}
SoundGetItem:
	; call ResetPsg
    call BIOS_GICINI

; Register 7 must always contain 10xxxxxx or possible damage could result to the PSG
    ld a, 8					; Channel A Volume (0-15)
    ld e, 15
    call BIOS_WRTPSG		



    ; for 0 to 20
    ld b, 255
.loop1:
    ld a, 0					; Channel A Period (low 8 bits)
    ld e, 93
    call BIOS_WRTPSG

    ld a, 1					; Channel A Period (high 4 bits)
    ld e, 0
    call BIOS_WRTPSG
    
    djnz .loop1


    ld b, 255
.loop2:
    ld a, 0					; Channel A Period (low 8 bits)
    ld e, 45
    call BIOS_WRTPSG

    ld a, 1					; Channel A Period (high 4 bits)
    ld e, 0
    call BIOS_WRTPSG

	djnz .loop2

    ld a, 8					; Channel A Volume (0-15)
    ld e, 0
    call BIOS_WRTPSG

    ret



;5 sound 12, 40: sound 11, 0						' Envelope period (12: MSB, 11: LSB)
;10 SOUND 0,0: SOUND 6,250: SOUND 7,82				' CAUTION WITH REGISTER 7!
;20 SOUND 2,130: SOUND 8,16: SOUND 13,0
SoundExplosion:
	; call ResetPsg
    call BIOS_GICINI

	ld a, 12					;  Most significant bits of envelope period (0-255)
    ld e, 40
    call BIOS_WRTPSG

    ld a, 11					;  Least significant bits of envelope period (0-255)
    ld e, 0
    call BIOS_WRTPSG

    ld a, 0						;  Least significant bits of channel A frequency (0-255)
    ld e, 0
    call BIOS_WRTPSG

    ld a, 6						;  Noise generator frequency (0-31)
    ld e, 31
    call BIOS_WRTPSG

    ld a, 7						;  Mixer setting (128-191)
    ld e, 146					;  128+18
    call BIOS_WRTPSG

    ld a, 2						;  Least significant bits of channel B frequency (0-255)
    ld e, 130					;  
    call BIOS_WRTPSG

    ld a, 8						;  Volume of channel A (0-16)
    ld e, 16					;  
    call BIOS_WRTPSG

    ld a, 13					;  Envelope shape (0-15)
    ld e, 0						;  
    call BIOS_WRTPSG

	ret
    


{
; 5 sound 12, 3: sound 11, 0						' Envelope period (12: MSB, 11: LSB)
; 10 SOUND 0,0: SOUND 6,250: SOUND 7,82
; 20 SOUND 2,130: SOUND 8,16: SOUND 13,0
SoundShot_old:
	call ResetPsg

	ld a, 12					;  Most significant bits of envelope period (0-255)
    ld e, 3
    call BIOS_WRTPSG

    ld a, 11					;  Least significant bits of envelope period (0-255)
    ld e, 0
    call BIOS_WRTPSG

    ld a, 0						;  Least significant bits of channel A frequency (0-255)
    ld e, 0
    call BIOS_WRTPSG

    ld a, 6						;  Noise generator frequency (0-31)
    ld e, 250
    call BIOS_WRTPSG

    ld a, 7						;  Mixer setting (128-191)
    ;ld e, 82					;  128+18
    ; 82 = 0101 0010
    ; Bits 7 and 6 serves to specify the direction of PSG I/O ports. 
    ; Always set bit 7 and reset bit 6. Otherwise some devices connected to the joystick ports may malfunction.
    ; 1001 0010 b
    ld e, 1001 0010 b
    call BIOS_WRTPSG

    ld a, 2						;  Least significant bits of channel B frequency (0-255)
    ld e, 130					;  
    call BIOS_WRTPSG

    ld a, 8						;  Volume of channel A (0-16)
    ld e, 16					;  
    call BIOS_WRTPSG

    ld a, 13					;  Envelope shape (0-15)
    ld e, 0						;  
    call BIOS_WRTPSG
    
    ret
}

;   10 SOUND6,151:SOUND7,1:SOUND
;   8,16:SOUND12,19:SOUND13,1
SoundShot:
	; call ResetPsg
    call BIOS_GICINI

    ld a, 6						;  Noise generator frequency (0-31)
    ld e, 151
    call BIOS_WRTPSG

    ld a, 7						;  Mixer setting (128-191)
    ;ld e, 129					;  128+1
    ; 129 = 1000 0001
    ; Bits 7 and 6 serves to specify the direction of PSG I/O ports. 
    ; Always set bit 7 and reset bit 6. Otherwise some devices connected to the joystick ports may malfunction.
    ; 1001 0010 b
    ld e, 1000 0001 b
    call BIOS_WRTPSG

    ld a, 8						;  Volume of channel A (0-16)
    ld e, 16					;  
    call BIOS_WRTPSG

	ld a, 12					;  Most significant bits of envelope period (0-255)
    ld e, 19
    call BIOS_WRTPSG

    ld a, 13					;  Envelope shape (0-15)
    ld e, 1						;  
    call BIOS_WRTPSG

    ret



ResetPsg:
	;restore psg values
    ld a, 12					;  Most significant bits of envelope period (0-255)
    ld e, 0
    call BIOS_WRTPSG
    
    ld a, 11					;  Least significant bits of envelope period (0-255)
    ld e, 0x0b
    call BIOS_WRTPSG

    ld a, 0					; Channel A Period (low 8 bits)
    ld e, 0x55
    call BIOS_WRTPSG

    ld a, 6						;  Noise generator frequency (0-31)
    ld e, 0
    call BIOS_WRTPSG

    ld a, 7						;  Mixer setting (128-191)
    ld e, 0xb8					;  128+18
    call BIOS_WRTPSG

    ld a, 2						;  Least significant bits of channel B frequency (0-255)
    ld e, 0						;  
    call BIOS_WRTPSG

    ld a, 8						;  Volume of channel A (0-16)
    ld e, 0						;  
    call BIOS_WRTPSG

    ld a, 13					;  Envelope shape (0-15)
    ld e, 0						;  
    call BIOS_WRTPSG
    
    ret