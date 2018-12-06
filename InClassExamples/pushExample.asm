; Write a function which pushes the element at location R5 into the stack
			.ORIG x3000
Main		LD R6, StacPTR
			ADD R5 R5 1 
			JSR PUSH
			ADD R5 R5 1
			JSR PUSH
			JSR PUSH
			
			JSR POP 
			JSR POP
			JSR POP 
			HALT 
; Subroutine PUSH needs to copy whatever is in R5 into some location in the stack 
PUSH 		ST R0 SaveR0 			
			; Checks if R6 == UpperBound
			LD R0 UpperBound
			NOT R0 R0 
			ADD R0 R0 1
			ADD R0 R0 R6
			BRn Overflow 
			STR R6 R5 0 	; Copies R5 to somewhwere
			ADD R6 R6 -1 	; Moves R6 ptr 	
Overflow	LD R0 SaveR0 
			RET
; Removing from the stack entails: 
;	1) Save the thing the StacPTR is pointing to 
;	2) Increment the StacPTR
POP 		ST R0 SaveR0
			; Checks if R6 == LowerBound'
			LD R0 LowerBound
			NOT R0 R0 
			ADD R0 R0 1
			ADD R0 R0 R6
			BRp Underflow 
			ADD R6 R6 1
			LDR R5 R6 0	
Underflow 	LD R0 SaveR0
			RET 
; Stack needs to live somewhere, lets say x4000
StacPTR		.FILL x3101 
UpperBound  .FILL x3100
LowerBound	.FILL x3101
SaveR0 		.BLKW 1

	.END


