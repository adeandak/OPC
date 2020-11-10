TITLE *MASM Template	(slides6x7.asm)*

; Descripcion:
; BGslides12x13
; 

INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.CODE
; Procedimiento principal
main PROC
    ; IMUL Examples

    MOV EAX,4823424
    MOV EBX,-423
    IMUL EBX        ; EDX:EAX = FFFFFFFF86635D80h, OF=0, CF=0
    call DumpRegs
    call CrLf
    
    ; ++++++++
    ; Your turn ... 3
    MOV EAX, 0
    MOV EBX, 0
    MOV EDX, 0

    MOV AX,8760h
    MOV BX,100h
    IMUL BX
    call DumpRegs
    call CrLf
    
    exit

main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main