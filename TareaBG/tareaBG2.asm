INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
Svector WORD 2002h, 4004h, 6006h, 8008h
Cvector SWORD -2, -4, -6, -8
textoS BYTE "Suma:", 0
textoP BYTE "Producto:", 0
textofin BYTE "ADIOS", 0 

.CODE
main PROC

    movzx EAX, Svector+6
    movsx EBX, Cvector+6 ;hay que ponerlo como movsx por que es signado
    ADD EAX,EBX
    mov EDX, OFFSET textoS
    call WriteString
    call WriteInt
    call CrLf

    movzx EAX, Svector+4
    movsx EBX, Cvector+4
    imul EBX
    call CrLf
    mov EDX, OFFSET textoP
    call WriteString
    call WriteInt
    call CrLf

    call CrLf
    mov EDX, OFFSET textofin
    call WriteString
    call CrLf


    exit

main ENDP

END main
