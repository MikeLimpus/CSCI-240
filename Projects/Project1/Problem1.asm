; Jonathan Limpus 
; Project 1, Problem 1
; Implement left shift operator in LC-3 

		.ORIG x3000
; Store the values of b and n into memory location x3100 & x3101
		LD R4 BIN
		LD R5 INT
		STI R4 BPTR
		STI R5 NPTR
; Begin main program
		LDR R0 BPTR
		LDR R1 NPTR
LOOP		ADD R0 R0 R0
		ADD R1 R1 -1 
		BRp LOOP 
		STI R0 SHFTPTR
		HALT 
; Variables 
BIN		.FILL xFFFA	; Binary string b 
INT		.FILL x0004	; Integer n, must be in range[0, 16] 
BPTR		.FILL x3100 	; Pointer to memory location for b
NPTR		.FILL X3101	; Pointer to memory location for n
SHFTPTR         .FILL x3102     ; Clear memory location x3102
		.END
