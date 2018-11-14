# Exam 3
## Material

This exam will cover material from Chapter 7 and Chapter 8 of the text. To prepare for the exam, be sure you:
  

    Know the components of an assembly language instruction
        Indicate the components of each assembly language instruction (mandartory and optional)
        Identify valid/invalid assembly language instructions(Be able to indicate what the components are and indicate whether a given assembly langauge instruction is valid)
    Understand what a pseduo-op (assembler directive) is.
        Be able to identify, describe, and use the five available pseduo-operations
    Understand what actions are taken during the first and second pass of the assembly process
    Are able to construct a symbol table from an assembly language program
    Understand how input/output devices interact with device registers to hold data being transferred between the device and the computer or maintain status information about the device.
    Be able to differentiate between memory-mapped I/O versus special I/O Instructions
    Learn the difference between synchronous and asynchronous instructions
    Learn the difference between interrupt-driven versus polling interactions
    Understand what is required for interrupt-driven I/O to occur (including priority)

Question types include Fill-in-the-Blank, True/False, LC-3 Program Snippets, Short Answers, Program Interpretation, and a Programming Component.


### Components of assembly language instructions 

*LABEL* OPERATOR OPERANDS ; *COMMENT*

### Psuedo-ops

  - Not technically LC-3 instructions
  - Operators for the assembler, not for the LC-3 itself

List of psuedo-ops:
```
  .END    -> Indicates end of program
  .ORIG   -> indicates where to begin program
  .BLKW   -> Allocate memory. use when the amount of memory needed is unknown to the programmer
  .FILL   -> Stores a value NNNN at the current memory address
  .STRINGZ-> Allocates n +1 places in memory for a string of characters 
  .EXTERNAL
  ```

### 2-Pass Assembly

  First Pass will populate a symbol table for all variables 
  ```
//Symbol Name		Page Address
//----------------	------------
//	BIN                     3014
//	BPTR                    3016
//	INT                     3015
//	LOOP                    3006
//	NEG                     3009
//	NPTR                    3017
//	POS                     300E
//	SHFTPTR                 3018
//	STORE                   3012

  ```
  
  ### I/O
  
  I/O devices use a [Device Status Register] and [Device Data Register] 
  
  #### Polling vs Interupt
  
  Polling: 
  ```
    LOOP  LDI R0, KBSR
              BRz LOOP
              
    KBSR  .FILL xFE02
    KBDR  .FILL xFE04
  ```
  
  
