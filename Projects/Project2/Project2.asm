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
        AND R4 R4 0
        LEA R0 EPrompt
        PUTS 
        AND R0 R0 0     ; Clear R0
        GETC            ; Get digit (no input validation) 
        LD R1 ASCII
        ADD R4 R0 R1    ; Convert input char to int and store in new register
        STI R0 KeyPtr   ; Store input at x4001 
        OUT             ; Print key 
        AND R0 R0 0     ; Clear R0 
        LEA R0 SPrompt  ; Load prompt for input 
        PUTS
        AND R0 R0 0     ; Clear R0 
                        ; Begin inputting 20 chars 
        LD R3 StrPtr    ; Pointer to where the input should be stored 
        LD R5 SolPtr    ; Pointer to output
        ADD R2 R2 10    ; Counter = 20
        ADD R2 R2 10
EInput  GETC 
        OUT 
        ADD R1 R0 0     ; Store input in new register to be encrypted
        ; Check if \n was inputted 
        ADD R0 R0 -10   ; Newline == ASCII 10
        BRz EIend       ; Break if input == \n 
        ADD R0 R0 10    ; Else, return input back to what it was 
        STR R0 R3 0     ; Store character in memory x4002 + n 
; Perform encryption algorithm                        
; xxxx xxxx xxxx xxxx AND 0000 0000 0000 0001 = 0 if LSB is 0
; Thus, if (input AND 1) = 0, add 1, then add key 
; else subract 1, and add key 
; Store location in memory
        AND R6 R1 1      
        BRz EZero
        BRp EOne
EZero   ADD R1 R1 1     ; Toggle LSB 
        BRnzp ENext 
EOne    ADD R1 R1 -1    ; Toggle LSB 
ENext   ADD R1 R1 R4    ; Key is in R4 
        STR R1 R5 0     ; Store at x4020 + n 
        ADD R3 R3 1     ; Increment pointers &
        ADD R5 R5 1
        ADD R2 R2 -1    ; Decrement counter
        BRp EInput
        
EIend   LEA R0 SolPtr
        OUT 
      
        ; Clear registers 
        AND R0 R0 0
        AND R1 R1 0
        AND R2 R2 0 
        AND R3 R3 0
        AND R4 R4 0
        AND R5 R5 0
        AND R6 R6 0 
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
NegD    .FILL -68
ASCII   .FILL -48
InPtr   .FILL x4000
KeyPtr  .FILL x4001
StrPtr  .FILL x4002
SolPtr  .FILL x4020
Key     .BLKW 1 
ER7     .BLKW 1
DR7     .BLKW 1
Prompt  .STRINGZ "(E)ncrypt or (D)ecrypt\n"
InFail  .STRINGZ "Illegal Input. Try again.\n"
EPrompt .STRINGZ "Please input your single-digit encryption key\n"
DPrompt .STRINGZ "Please input your single-digit decryption key\n"
SPrompt .STRINGZ "\nPlease begin inputting your string (20 char limit): "



        .END