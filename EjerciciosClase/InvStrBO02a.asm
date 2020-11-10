TITLE Program Template          (InvStrBK02.asm)

; Este programa invierte un String.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine

.DATA
unaCade BYTE "Gabriel Garcia Marquez",0


.CODE
main PROC


	exit
main ENDP

END main
