# Introduction
A substitution cipher is an encryption scheme which replaces character in a message known as the plain text with another character to form an encrypted message or the cipher text. For example, given the plain text message HELLO WORLD, we can generate the cipher text IFMMP XPSME by replacing each instance of the character H with the character I, each instance of the character E with the character F and so on. In this project, you will create a simple LC-3 program which will prompt the user to either encrypt or decrypt a string using an encryption key.

# Project Requirements
You are tasked with writing a LC-3 assembly language program which either encrypts or decrypts an input string using a user-speciﬁed encryption/decryption key (See encryption scheme).
Input: Your program should prompt the user for three separate inputs from the keyboard:

1.	Option: E for encryption or D for decryption.
Your program should perform input-validation on this input, prompting the user to enter another character if a E or D was not entered. Store this input in memory address x4000.
2.	Key: An integer [0,9] which serves as the encryption or decryption key.
Your program should accept a single digit (i.e. 0 through 9) which it should then convert to a decimal number. Input-validation is not required on this input. Store this input in memory address x4001.
3.	Message: A string of characters which functions as either the plain text or the cipher text.
Your program should accept a string of at most 20 characters. The user may prematurely terminate the message with the [ENTER] key. Store this input in memory address x4002 to x4016.

Output: Your program should output either the encrypted or decrypted message string to the screen. Note: This string should begin at memory address x4020.
Other Requirements: Your program should begin at memory address x3000 and must include comments to make your program readable. As a rule of thumb, I should not require more than one-minute to understand your source code.

# Encryption Scheme
The encryption scheme will consist of two operations performed on the binary string representation of the ASCII value for each character within the message:
1.	Toggle the least signiﬁcant bit (e.g. 0110 → 0111 and 1111 → 1110)
2.	Add the encryption key (i.e. a simple addition operation)

For example, consider the character A whose ASCII value has a binary string representation of 0000 0000 0100 0001 and an encryption key value of 6. Toggling the LSB will yield the binary string 0000 0000 0100 0000 and then adding the encryption key which has a binary representation of 0110 will yield the encrypted binary string 0000 0000 0100 0110 which is the binary string representing of the character F.

# Submission Instructions
Submit the following items on Canvas:
Source Code: Name the source ﬁles FirstName LastName-part1.bin and FirstName LastName-part2.bin Report: Your report must contain the following information:
	– Your name
	– Flowcharts that show the algorithms that you used in your programs (see LucidChart) – A list of test cases and results
	– A brief discussion of your project experience
		Did you enjoy this project? What problems did you encounter?
 		What did you get out of the project?
		How did you ﬁnd the project (too easy, easy, just right, diﬃcult, too diﬃcult)
		What type of help/references did you use in your project (i.e. book, web sites, classmates,