;
; Read a positive decimal value from the keyboard print
; the binary representation. Assume the constants will be 
; two digits
;

		GETC
		ADD 		R0, R0, ASCII	;Subtract 30 from input to convert from ascii
;
; Check if the value equals 9, and break to associated print statement.
; Similar to switch in high level languages
; 
		
		ADD 		R0, R0, -9		
		BRz			PRNINE			
		ADD			R0, R0, 9		;Return R0 to former value 
		ADD			R0, R0, -8
		BRz			PREIGHT
		ADD			R0, R0, 8
		ADD 		R0, R0, -7
		BRz			PRSEVEN
		ADD			R0, R0, 7
		ADD 		R0, R0, -6
		BRz			PRSIX
		ADD 		R0, R0, 6
		ADD			R0, R0, -5
		BRz			PRFIVE
		
		
		
		






;
; Lookup table to convert numbers 0-9 into 
; Psuedo-binary strings
;

NINE	.STRINGZ	"1001"
EIGHT	.STRINGZ	"1000"
SEVEN	.STRINGZ	"0111"
SIX		.STRINGZ	"0110"
FIVE	.STRINGZ	"0101"
FOUR	.STRINGZ	"0100"
THREE	.STRINGZ	"0011"
TWO		.STRINGZ	"0010"
ONE		.STRINGZ	"0001"
ZERO	.STRINGZ	"0000"

ASCII 	.FILL		xFFE2			;-30, 0-9 are assigned x30-x39 in ASCII
END		.END