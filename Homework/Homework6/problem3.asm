;
; Jonathan Limpus
; Write a short LC-3 program that compares the two numbers in R1 and R2 and puts the value 0
; in R0 if R1 = R2, 1 if R1 > R2 and -1 if R1 < R2
;

	.ORIG 	x3000
	LD 		R1 #12	
	LD 		R2 #13
	;Subtract R2 from R1, if result is 0, then R1 = R2 
	;If < 0, R1 < R2 
	;If > 0; R1 > R2 
	NOT R2, R2 
	ADD R2, R2, +1 
	ADD R3, R2, R1 
	BRn 3
	BRz 4
	BRp 5
	LD R0 7 ;Memory location containing -1
	JMP END 
	LD R0 6  ;Mem location containing 0
	JMP END 
	LD R0 5  ;Mem location containing 1
	JMP END
	HALT
	.FILL	10
	.FILL 	2
	.FILL 	-1
	.FILL	0
	.FILL	1

END	.END
	
	