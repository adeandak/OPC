TITLE Ejercicio stack01

; Descripcion:
; Ejemplo de uso del Runtime Stack.
; 

INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
Adios BYTE "ADIOS.", 0

.CODE
; Procedimiento principal
main PROC
      ; Cleaning EAX and EBX
      mov EAX, 0
      mov EBX, 0
      
      push 12047506h    ; imm of 4 Bytes / 32 bits
      
      pop AX    ; recovering 2 Bytes / 16 bits
      pop BX

      ; Display EAX (AX) and EBX (BX)
      call DumpRegs
	
      ; ADIOS
      mov edx,OFFSET Adios
      call WriteString
      call CrLf
	
    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main