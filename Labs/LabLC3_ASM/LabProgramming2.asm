;
; Jonathan Limpus
; Lab Assembly Language
; Hex -> Binary
; Given symbol xC, use look-up table
;
		.ORIG x3000
; Step One: Use GETC to get a hex digit into R0 
		GETC
; Step Two: Convert R0 to integer value
		ADD R0, R0, -16
		ADD R0, R0, -16
		ADD R0, R0, -16
		ADD R0, R0, -7
		
;Step Three: Get mem location of binary string 
		LEA R1, BSTRNG
NEXTADD BRz WRITE
		ADD R1, R1, 5
		ADD R0, R0, -1
		BRnzp NEXTADD
WRITE
		ADD R0, R1, 0
		PUTS
		.END
		.ORIG x6000
; Binary Lookup table 
STRPTR	.FILL x4000

BSTRNG	.STRINGZ "0000"
		.STRINGZ "0001"
		.STRINGZ "0010"
		.STRINGZ "0011"
		.STRINGZ "0100"
		.STRINGZ "0101"
		.STRINGZ "0110"
		.STRINGZ "0111"
		.STRINGZ "1000"
		.STRINGZ "1001"
		.STRINGZ "1010"
		.STRINGZ "1011"
		.STRINGZ "1110"
		.STRINGZ "1111"