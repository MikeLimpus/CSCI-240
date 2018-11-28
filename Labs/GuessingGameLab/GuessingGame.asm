;
; Jonathan Limpus 
; Guessing Game lab 
; 

; Inputting string into LC-3
			.ORIG x3000
			LD R1, PTR  ; Initialize R1 to the base pointer of the string
;
; Read character from the console, if not equal to '\n' then save the
; character to memory; otherwise, terminate
;
			
ReadChar	IN
; Test if character is '\n' (x000A)
			ADD R2, R0, #-10
			BRz Terminate
; If the read character is not '\n'
			STR R0, R1, #0	; Save read character to memory
			ADD R1, R1, #1  ; Increment the base pointer
			BRnzp ReadChar
; Append the null character '\0' (0x0000) to the string and output
; the string to the console
Terminate  	AND R0, R0, #0 ; Zero out register
			STR R1, R0, #0 ; Write '\0' (0x0000) to memory
			LEA R0, PTR    ; Load string base pointer to R0
			PUTS           ; Print string found at R0
			HALT
; PTR is the base pointer to the stored string
NEWLINE    .FILL x00A0
PTR        .FILL x4000
PROMPT	   .STRINGZ "Guess a number between 0 & 9" 
SMALL	   .STRINGZ "Too small" 
BIG 	   .STRINGZ "Too Big" 
CORRECT1   .STRINGZ "Correct! You took "
CORRECT2   .STRINGZ " guesses."
.END

