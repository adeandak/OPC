TITLE examenPasado.asm
  ; Ejemplo del segundo examen 
  
; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine

myNull=0

.DATA
arrStr BYTE "on1", myNull
    BYTE "tw2", myNull
    BYTE "th3", myNull
    BYTE "fo4", myNull
    BYTE "fi5", myNull
    BYTE "si6", myNull
    BYTE "se7", myNull
    BYTE "ei8", myNull
    BYTE "ni9", myNull
    BYTE "teA", myNull
texto BYTE "Soy AAK173347", 0
textoN BYTE "Teclee N:", 0
textoAux BYTE "Indique la posicion del 1o string:" ;sabemos que el string esta entre 1 y 10. 
        BYTE "Indique la posicion del 2o string:"
        BYTE "Indique la posicion del 3o string:"
        BYTE "Indique la posicion del 4o string:"
        BYTE "Indique la posicion del 5o string:"
        BYTE "Indique la posicion del 6o string:"
        BYTE "Indique la posicion del 7o string:"
        BYTE "Indique la posicion del 8o string:"
        BYTE "Indique la posicion del 9o string:"
        BYTE "Indique la posicion del 10o string:"
tot BYTE 0

        
    
.CODE
main PROC
    ;poner que soy andy
    mov EDX, OFFSET texto
    call WriteString
    call CrLf
    
    ;preguntar cuantos elementos tiene el arreglo 
    mov EDX, OFFSET textoN
    call WriteString
    call CrLf
    call ReadInt ;leo N y se guarda en eax
    mov tot, EAX ;paso lo que tengo en EAX a la memoria
    



	exit
main ENDP

END main
