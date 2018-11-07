; Problem 2
; Left Rotation 

		.ORIG x3000
		LD R0 BIN
		LD R1 INT
LOOP	BRn NEG 
		BRp POS
POS		ADD R0 R0 R0
		ADD R1 R1 -1 
NEG		
		BRp LOOP 
		STI R0 SHIFT
		HALT 

BIN		.FILL xFFFA	; Binary string b 
INT		.FILL x0004	; Integer n, must be in range[0, 16]
BPTR	.FILL x3100 ; Pointer to input string 
NPTR	.FILL x3101 ; Pointer to shift amount
ROTPTR	.FILL x3102	; Pointer to store answer  

		.END