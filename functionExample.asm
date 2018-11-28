; Refer to fill functionExample.cpp for equivalent in C++



        .ORIG x3000
Main    ADD R0, R0, 0
        ADD R0, R0, 7
        JSR PrintMe     ;F Call PrintMe 
        ADD R0, R0, 1
        JSR PassVal     ;Function call PassByValue
        JSR PrintMe     ;Function PrintMe
        JSR PassRef     ;Function PassByReference
        JSR PrintMe     ;Function PrintMe
        
; Unlike C++, there is no notion of scope
; Anything in registers will remain 
; R0 still holds value of x 
PrintMe LD R1, ASCII 
        ADD R0, R0, R1
        OUT 
        RET ;
PassVal ADD R0, R0, 1
        ADD R6, R0, 0
        RET 
PassRef 
        ADD R0, R0, 1
        RET 
        
        
ASCII   .FILL 48
        .END