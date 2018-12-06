		.ORIG x3000
DRIVER	LD R6 EMPTY
		NOT R6 R6
		ADD R6 R6 1
		AND R0 R0 0 
		AND R1 R1 0
		ADD R0 R0 1 
		ADD R1 R1 2 
		JSR PUSH 
		ADD R0 R0 2 
		ADD R1 R1 2 
		JSR PUSH 
		
		ADD R0 R0 2
		ADD R1 R1 2 
		JSR PUSH ; SHOULD FAIL 
		
		JSR POP
		JSR POP
		JSR POP
		JSR POP
		
		JSR POP ; SHOULD FAIL 


PUSH    LD R1 , MAX
		ADD R3 R6 -2
        ADD R2, R1, R3
        BRz Failure
        ADD R6, R6, #-1
        STR R0, R6, #0
        AND R5, R5, #0
        RET
Failure AND R5, R5, #0
        ADD R5, R5, #-1
        RET
		
POP     LD R1, EMPTY
        ADD R2, R6, R1 ; Compare stack
        BRz Failure1    ; Pointer with x4000
        ADD R6, R6, #1
        AND R5, R5, #0
        RET
Failure1 AND R5, R5, #0
        ADD R5, R5, #1
        RET
EMPTY  .FILL xC000     ; EMPTY <-- x4000
MAX    .FILL xC005     ; MAX <-- -x3FFB

		.END