; Refer to fill functionExample.cpp for equivalent in C++



        .ORIG x3000
Main    ADD R0, R0, 0
        ADD R0, R0, 7
        JSR PrintMe     ;F Call PrintMe 
        ADD R0, R0, 1
        JSR PrintMe     ;Function PrintMe 
        JSR PassVal     ;Function call PassByValue
        JSR PrintMe     ;Function PrintMe
        JSR PassRef     ;Function PassByReference
        JSR PrintMe     ;Function PrintMe
        
; Unlike C++, there is no notion of scope
; Anything in registers will remain 
; R0 still holds value of x 
PrintMe ST R7, PrntR7   ;Store R7 to prevent loop
        ST R0, PrntR0
        LD R1, ASCII 
        ADD R0, R0, R1
        OUT 
        LD R7, PrntR7
        LD R0, PrntR0
        RET 
        
PrntR7 .BLKW 1
PrntR0 .BLKW 1
PassVal ST R0 ValR0
        ST R7 ValR7
        ADD R0, R0, 1
        ADD R6, R0, 0   ;Value of R6 is not being saved on purpose
        RET 
ValR0   .BLKW 1
ValR7   .BLKW 1
PassRef 
        ADD R0, R0, 1
        RET 
        
        
ASCII   .FILL 48
        .END