TITLE EjerBK02

; Uso de instrucciones selectivas y repetitivas.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine

.DATA
n	DWORD ?
tot	DWORD ?
micr = 0Dh
milf = 0Ah
txtn	BYTE micr, milf, "Teclee el dato N: ", 0
txtst	BYTE "Siguiente termino: ", 0
txttot	BYTE micr, milf, "TOTAL: ", 0
error BYTE micr, milf, "ERROR. N fuera de rango.", micr, milf, 0
adios BYTE micr, milf, "ADIOS.", micr, milf, 0

.CODE
main PROC
; Escriba comentarios
	mov EDX, OFFSET txtn
	call WriteString
	call ReadInt        ; Dato en EAX
	call Crlf

      CMP EAX, 1       ; if EAX < 1
      JGE ift01        ; jump >=1 (con signo)
	   mov EDX, OFFSET error
	   call WriteString
         exit
ift01:
	
	mov n, EAX
	mov EBX, 1        ; Variable de control de While
	mov EAX, -2        ; Siguiente termino
      mov tot, 0        ; Acumulador total
	mov EDX, OFFSET txtst

whb01: CMP EBX, n        ; While EBX <= n
      JA whe01           ; jump > n  (sin signo)
            add EAX, 3
		call WriteString
		call WriteInt
		call Crlf
            add tot, EAX
            inc EBX
      JMP whb01
whe01:
	
	mov EDX, OFFSET txttot
	call WriteString
	mov EAX, tot
	call WriteInt
	call Crlf
	
	mov EDX, OFFSET adios
	call WriteString
	exit
main ENDP

END main
