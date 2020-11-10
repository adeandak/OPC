TITLE Ejercicio ejer4BH1

;Tarea BN
;Abajo el patriarcado

INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
; Textos para la Consola
mcr=0Dh
mlf=0Ah
mnul=0h
Adios BYTE mcr, mlf, "ADIOS.", mcr, mlf, mnul
error BYTE "Error pues n<1 o n>10", 0
texto1 BYTE "Ingrese el numero de temperaturas (entre 1 y 10)", 0
texto2 BYTE "Teclee la ", 0
texto3 BYTE " temperatura: ", 0
texto4 BYTE "Minimo de las temperaturas: ", 0
texto5 BYTE "Temperatura ", 0
texto6 BYTE ": ", 0
texto7 BYTE ", ", 0
textoPar BYTE "P", 0
textoImpar BYTE "I", 0

; Variables

TEMPMIN SDWORD 0
n SDWORD 0
TEMP SDWORD 0
arrayTemp SDWORD 10 DUP(?)

.CODE
; Procedimiento principal
main PROC

;lectura de las n temperaturas.
    mov ECX, 1
inicio:    
    call CrLf
    mov EDX, OFFSET texto1
    call WriteString
    call ReadInt                ;lectura de n
    mov n, EAX
    .IF n<1 || n>10             ;validación de n
        mov EDX, OFFSET error
        call WriteString
        JMP inicio
    .ENDIF
    inc n
    mov ESI, OFFSET arrayTemp
    .REPEAT
        call CrLf
        mov EDX, OFFSET texto2
        call WriteString
        mov EAX, ECX
        call WriteInt
        mov EDX, OFFSET texto3
        call WriteString
        call ReadInt                ;lectura de la temperatura
        .IF ECX==1
            mov TEMPMIN, EAX
        .ENDIF
        .IF EAX < TEMPMIN
            mov TEMPMIN, EAX
        .ENDIF
        mov [ESI], EAX
        ADD ESI, TYPE arrayTemp
        inc ECX
    .UNTIL ECX == n

    ;Impresión del mínimo de las temperaturas
    call CrLf
    mov edx,OFFSET texto4
    call WriteString
    mov eax, TEMPMIN
    call WriteInt
    call CrLf

    ;Impresión del arreglo
    .REPEAT
        call CrLf
        mov EDX, OFFSET texto5
        call WriteString
        dec ECX
        mov EAX, ECX
        call WriteInt
        mov EDX, OFFSET texto6
        call WriteString
        SUB ESI, TYPE arrayTemp
        mov EAX, [ESI]
        call WriteInt
        xchg AH, AL
        SAHF
        mov EBX, 0
        ADC EBX, 0
        mov EDX, OFFSET texto7
        call WriteString
        .IF EBX==1
            mov EDX, OFFSET textoImpar
            call WriteString
         .ELSE
            mov EDX, OFFSET textoPar
            call WriteString
        .ENDIF
    .UNTIL ECX==1

    ; ADIOS 
    call CrLf
    mov edx,OFFSET Adios
    call WriteString
	
    exit
main ENDP
; Termina el procedimiento principal

; Termina el area de Ensamble
END main