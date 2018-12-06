; Jonathan Limpus
; Project 2: Encryption

; xxxx AND 0001 for toggling LSB 
    ; if answer is one, subtract one 
    ; if answer is zero, add one 
        .ORIG x3000
Main    LEA R0 Prompt
        ; Load R[4] with value to test input 
        LD R4 NegD
        PUTS
        AND R0 R0 0     ; Clear R0 for input
        GETC 
        STI R0 InPtr    ; Save input in x4000 
                        ; Subtract 68
        ADD R0 R0 R4    ; 68 is ASCII val for D, input == 'D'
        BRz D           ; Break to decrypt subroutine
        ADD R0 R0 -1    ; 68 - 1 = 69, input == 'E' 
        BRz E           ; Break to encrypt subroutine
        BRnzp Again     ; Ask user to input a valid char 
D       JSR Decrypt
        BRnzp End
E       JSR Encrypt
        BRnzp End     
Again   LEA R0 InFail   
        PUTS
        BRnzp Main      ; Input validation
End     HALT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Encrypt ST R7 ER7       ; Save R7(PC) from PUTS
        AND R0 R0 0     ; Clear registers used in main function
        LEA R0 EPrompt
        PUTS 
        AND R0 R0 0     ; Clear R0
        GETC            ; Get digit (no input validation) 
        LD R1 ASCII
        ADD R0 R0 ASCII ; Convert input char to int 
        STI R0 KeyPtr   ; Store input at x4001 
        AND R0 R0 0     ; Clear R0 
        LD R7 ER7       ; Load R7 with former PC 
        RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
Decrypt ST R7 DR7       ; Save R7(PC) from PUTS
        AND R0 R0 0
        LEA R0 DPrompt 
        PUTS
        LD R7 DR7       ; Load R7 with former PC 
        RET



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Prompt  .STRINGZ "(E)ncrypt or (D)ecrypt\n"
InFail  .STRINGZ "Illegal Input. Try again.\n
EPrompt .STRINGZ "Please input your single-digit encryption key\n"
DPrompt .STRINGZ "Please input your single-digit decryption key\n"
NegD    .FILL -68
ASCII   .FILL -48
InPtr   .FILL x4000
KeyPtr  .FILL x4001
StrPtr  .FILL x4002
SolPtr  .FILL x4020
Key     .BLKW 1 
ER7     .BLKW 1
DR7     .BLKW 1


        .END