; Problem 2
; Left Rotation 
; Improve the left shift operator by appending the most significant bit (MSB)
; at the end of the binary string 
		.ORIG x3000
; Store the values of b and n into memory location x3100 & x3101
		LD R4 BIN
		LD R5 INT
		STI R4 BPTR
		STI R5 NPTR
; Begin main program
		LDI R1 NPTR
		LDI R0 BPTR
; If MSB = 1 (or, CC = n) , ADD R0 R0 #1
; Else (CC = z or p) , ADD R0 R0 R0 
; Condition code set by Load instructions
LOOP	ADD R0 R0 0 	; Set CC to value of R0 
		BRn NEG 		
		BRzp POS 
NEG 	ADD R0 R0 R0 	; Rotation
		ADD R0 R0 #1	; Append 1 to end of string
		ADD R1 R1 -1	; Decrement counter 
		BRp LOOP		; Return to loop OR 
		BRnz STORE		; Break to end
POS		ADD R0 R0 R0	; Append 0 to end of string
		ADD R1 R1 -1 	; Decrement counter 
		BRp LOOP 		; Return to loop OR 
		BRnz STORE		; Break to end 
STORE	STI R0 SHFTPTR
		HALT 
; Variables 
BIN		.FILL xFFFA		; Binary string b 
INT		.FILL x0004		; Integer n, must be in range[0, 16] 
BPTR	.FILL x3100 	; Pointer to memory location for b
NPTR	.FILL X3101		; Pointer to memory location for n
SHFTPTR .FILL x3102 	; Clear memory location x3102
		.END