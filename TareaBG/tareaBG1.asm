INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
A SDWORD 7
B SDWORD ?
D SDWORD -15
R SDWORD ?
texto BYTE "DATO:", 0
textor BYTE "El resultado R=", 0
textorh BYTE "El resultado Rh=", 0
textofin BYTE "HASTA LA VISTA",0

.CODE 
main PROC
    mov EDX, OFFSET texto
    call WriteString
    call CrLf
    call ReadInt
    mov B, EAX

    ; -A*9
    mov EAX, A
    neg EAX
    mov EBX, 0
    mov BX,9
    imul EBX
    mov ECX, EAX

    ;(B/D)+1
    mov EAX, B
    mov EBX, D
    mov EDX, 0; por que idiv deja el residuo en EDX
    idiv EBX
    inc EAX

    ;-A*9-(B/D+1)
    sub ECX, EAX
    mov EAX, ECX

    ;-A*9-(B/D+1)+100
    add EAX,100
    
 
    mov EDX, OFFSET textor
    call CrLf
    call WriteString
    call WriteInt
    call CrLf
    mov EDX, OFFSET textorh
    call CrLf
    call WriteString
    call WriteHex
    call CrLf
    call DumpRegs
    mov EDX, OFFSET textofin
    call CrLf
    call WriteString
    mov ESI, OFFSET A
	mov ECX, (LENGTHOF A)*4
	mov EBX, TYPE A
	call DumpMem
	call Crlf
    
    exit
main ENDP

END main

END main
