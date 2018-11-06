; Jonathan Limpus 
; Project 1, Problem 1
; Implement left shift operator in LC-3 

		.ORIG x3000
		LD R0 BIN
		LD R1 INT
LOOP	ADD R0 R0 R0
		ADD R1 R1 -1 
		BRp LOOP 
		ST R0 SHIFT
		HALT 
		;.ORIG x3100
BIN		.FILL xFFFA	; Binary string b 
INT		.FILL x0004	; Integer n, must be in range[0, 16]
SHIFT	.FILL x0000	; Clear memory location x3102 
		.END