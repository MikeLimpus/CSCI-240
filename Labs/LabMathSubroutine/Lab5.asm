; Jonathan Limpus
; Lab 11/26
; Given two integers X and Y compute the product XY (multiplication),
; the quotient X/Y (integer division), and the modulus X (mod Y) (remainder)

        .ORIG x3000
;;;;;;;;; Store X and Y in correct memory locations and clear registers
        LD R1 X 
        LD R2 Y
        STI R1 XPTR
        STI R2 YPTR 
        AND R1 R1 0
        AND R2 R2 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Main    JSR Mult
        JSR Div 
        JSR Mod 
        HALT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Mult    LDI R1 XPTR 
        LDI R2 YPTR  
        AND R3 R3 0 ; Clear R3
MULOOP  ADD R3 R3 R1 
        ADD R2 R2 -1
        BRp MULOOP
        STI R3 PROPTR
        ; Clear all registers
        AND R1 R1 0
        AND R2 R2 0
        AND R3 R3 0
        RET 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Div     LDI R1 XPTR
        LDI R2 YPTR
        
X       .FILL 8
Y       .FILL 2
XPTR    .FILL x3100
YPTR    .FILL x3101
PROPTR  .FILL x3102
QUOPTR  .FILL x3103
MODPTR  .FILL x3104 
        
        
        