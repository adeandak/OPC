TITLE *MASM Template	(slides4x5x6.asm)*

; Descripcion:
; BGslides4x5
; 

INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
val1  WORD 2000h
val2  WORD 100h


.CODE
; Procedimiento principal
main PROC
    ; 2000h * 100h, using 16-bit operands
    MOV EAX, 0
    MOV EDX, 0

    MOV AX,val1
    MUL val2        ; DX:AX = 00200000h, CF=1
    call DumpRegs
    call CrLf
    
    ; ++++++++
    ; 12345h * 1000h, using 32-bit operands

    MOV EAX,12345h
    MOV EBX,1000h
    MUL EBX         ; EDX:EAX = 0000000012345000h, CF=0
    call DumpRegs
    call CrLf

    ; ++++++++
    ; 5h * 10h, using 8-bit operands
    MOV EAX, 0
    MOV EBX, 0
    
    MOV AL,05h
    MOV BL,10h
    MUL BL	; AH:AL = 0050h, CF=0
    call DumpRegs
    call CrLf
    
    exit

main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main