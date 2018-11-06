;
; Read a positive decimal value from the keyboard print
; the binary representation. Assume the constants will be 
; two digits
;

		GETC
		ADD 		R0, R0, ASCII	;Subtract 30 from input to convert from ascii
;
; Check if the value equals 9, and break to associated print statement.
; Then, return R0 to the previous value and continue checking until value is found
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
		ADD 		R0, R0, 5
		ADD			R0, R0, -4
		BRz 		PRFOUR
		ADD 		R0, R0, 4
		ADD 		R0, R0, -3
		BRz			PRTHREE
		ADD			R0, R0, 3
		ADD 		R0, R0, -2
		BRz			PRTWO
		ADD			R0, R0, 2
		ADD 		R0, R0, -1
		BRz 		PRONE
		ADD 		R0, R0, 1
		BRnzp		PRZERO
;
; Load string into R0 and output using PUTS
; Break to end 
;
PRNINE	PUTS		
PREIGHT	
PRSEVEN
PRSIX
PRFIVE
PRFOUR
PRTHREE	
PRTWO
PRONE
PRZERO
		
		
		
		






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