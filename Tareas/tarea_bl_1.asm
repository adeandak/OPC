INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
; Textos para la Consola

micr = 0Dh
milf = 0Ah
txtn	BYTE micr, milf, "Teclee el dato N: ", 0
txtst	BYTE "Termino ", 0
txttot	BYTE micr, milf, "TOTAL: ", 0

error BYTE micr, milf, "ERROR. N fuera de rango.", micr, milf, 0
adios BYTE micr, milf, "ADIOS.", micr, milf, 0

; variables
n	SDWORD ?
suma	SDWORD 0
i	DWORD 1
ant	SDWORD 0
act SDWORD 0
signo SDWORD 1

.CODE
main proc
	mov EDX, OFFSET txtn
	call WriteString
	call ReadInt        ; Dato en EAX
        mov n,EAX
	.WHILE n<1
		mov EDX, OFFSET error
		call WriteString
		call Crlf
		mov EDX, OFFSET txtn
		call WriteString
		call ReadInt        ; Dato en EAX
                mov n, EAX
	.ENDW
        ;call DumpRegs
        MOV ESI, n
        INC ESI
        MOV ECX, 0
        .WHILE (i<ESI)
		NEG signo 
		MOV EAX, ant
		MOV EBX, i
           

		IMUL EBX, i
		IMUL EBX, signo
                  ADD EAX, EBX
		MOV ant, EAX
		ADD ECX, EAX
                  
		mov EDX, OFFSET txtst
			call WriteString ;imprimimos el termino
                  
                  mov EAX, i
			call WriteInt
                  mov AL, ' '
                  call WriteChar
                 
                  mov EAX, ant
			call WriteInt
			call Crlf
		INC i
	.ENDW
	
	MOV EDX, offset txttot
		call WriteString
		mov EAX, ECX
		call WriteInt
		mov edx, offset adios
		call WriteString
		call crlf
	            
            
main ENDP

END main