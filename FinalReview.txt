# Final Review 
## Focus on: 

## Chapter 9 
    Understand:
        1) Trap call 
        2) Lookup table 
        3) Trap routine
            a) Storing/Loaging registers 
            b) Return statement
        4) Resume original program 
            - What values does R7 and PC have throughout this process
            - Not asking where the trap loopup table is exactly, but know the System Control Block is the first 256 words
            - Know JMP, JSR, JSRR, RET 
                - What addressing modes does the J instructions have (When to use which)
                - Some alter R7, some do not
            - Know what the machine control register is and how it can be used to start and stop a program 
                - (what bit needs to be enabled)
            - Know the difference between caller/calle save and store
            - Know how/when to store registers in a function call 
            - Understand Figure 9.7 in book
            - Sections  9.2.3 - 9.2.5 will be used for examples

## Chapter 10
        ### Do Homework 9 
        (Skip 10.2, 10.5)
        Know what a stack is and how to implement it in LC-3
            As in, consider it abstractly, meaning if I give you a pez dispenser can you describe operations in a stack and what it 
            is on the stack
        After a sequence of Push/Pop ops, be able to determine the state of the stack 
        
        Know what underflow and overflow are with respect to the stack
            How to prevent and detect it 
        
        Arithmetic Ops on the stack 
            Be able to use the stack to perform simple arithmetic operations 
        Data type conversions
            Binary -> ASCII
