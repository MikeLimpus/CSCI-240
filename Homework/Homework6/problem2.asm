R5 -> x4000
R6 -> x5000
x4000 -> 10
x4001 -> 2

LDR R1 R5 0 
LDR R2 R5 1 
;Convert R2 to negative for subtraction
NOT R2 R2 
ADD R2 R2 1
;Beginning of iteration 
ADD R2 R2 R1 
;Compare R2 and R1 
BRnz 3		;offset to store remainder
ADD R3 R3 1 ;ADD ome to value that will be stored as quotient
BRnzp -3 	;Return to beginning of loop 
STR R2 R6 1 ;Store remainder in x5001
STR R3 R6 0 ; Store the value of R3 (Quotient) into x5000