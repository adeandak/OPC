INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
    TEXTO_N BYTE "TECLEE EL DATO N: ", 0
    TEXTO_PARENTESIS BYTE "(", 0
    TEXTO_RESULTADO BYTE "!): ", 0
    TEXTO_ERROR BYTE "): NO DEFINIDO", 0
    ADIOS BYTE "ADIOS", 0


.CODE
    main PROC
     mov EDX, OFFSET TEXTO_N
     call WriteString
     call ReadInt
     call CrLf
     cmp EAX, 0
     JL ERROR
        JE CERO
            mov EDX, 0
            mov EBX, EAX 
            mov ECX, EAX 
            FACTORIAL: cmp ECX, 1
                       JLE RESULTADO
                           dec ECX 
                           imul ECX
                           jmp FACTORIAL
                       
     ERROR: mov EDX, OFFSET TEXTO_PARENTESIS
            call WriteString
            call WriteInt
            mov EDX, OFFSET TEXTO_ERROR
            call WriteString
            jmp FINISH

     CERO: mov EBX, 0 
           mov EAX, 1
           jmp RESULTADO

     RESULTADO: mov EDX, OFFSET TEXTO_PARENTESIS
                call WriteString
                mov ECX, EAX 
                mov EAX, EBX
                call WriteInt
                mov EDX, OFFSET TEXTO_RESULTADO
                call WriteString
                mov EAX, ECX
                call WriteInt

     FINISH: call CrLf
             mov EDX, OFFSET ADIOS
             call WriteString
     
    main ENDP

END main