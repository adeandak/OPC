INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
micr = 0Dh
milf = 0Ah
txtn	BYTE micr, milf, "Teclee el dato N: ", 0
txtm	BYTE micr, milf, "Teclee el dato M: ", 0
txten BYTE micr, milf, "N: ", 0
txtem BYTE micr, milf, "M: ", 0
error BYTE micr, milf, "ERROR. N o M fuera de Rango.", micr, milf, 0
adios BYTE micr, milf, "ADIOS.", micr, milf, 0
producto BYTE  "PRODUCTO ", 0
espacio BYTE ": ", 0

n SDWORD ?
m SDWORD ?
i SDWORD 0
total SDWORD ?
.CODE
main proc
	MOV EDX, OFFSET txtn
	CALL WriteString
	CALL ReadInt
	CALL crlf
	MOV n, EAX
	MOV EDX, OFFSET txtm
	CALL WriteString
	CALL ReadInt
	MOV m, EAX
	.IF (n < 0) || (m < 0)
		mov EDX, OFFSET error
		call WriteString
		mov EDX, OFFSET txten
		call WriteString
		mov EAX, n
		call WriteInt
		call crlf
		mov EDX, OFFSET txtem
		call WriteString
		mov EAX, m
		call WriteInt
		call crlf
		mov EDX, OFFSET adios
		call WriteString
		exit
	.ENDIF
	MOV ESI, m
	MOV ECX, n
	.IF (ESI>ECX) ;si m es mayor que n, los intercambio
		MOV m, ECX
		MOV n, ESI
		MOV ESI, m ;sin importar qué pase, m queda en ESI
	.ENDIF
	MOV EBX, 0
	.WHILE (i<ESI)
		ADD EBX, n ;acumulo en EBX m veces n
		INC i ;incremento i en 1
	.ENDW
	MOV total, EBX
	
	MOV EDX, OFFSET producto
	call WriteString
	MOV EAX, m
	call writeint
	MOV AL, "*"
	call writechar
	MOV EAX, n
	call writeint
	MOV EDX, OFFSET espacio
	call writeString
	MOV EAX, total
	call WriteInt
	mov EDX, OFFSET adios
	call WriteString
main ENDP

END main