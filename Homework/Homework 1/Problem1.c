/* 
 * Jonathan Limpus
 * Problem 1
 * Problem: input decimal integer, and output same integer in hexadecimal form 
 * Solution: Create an integer variable named 'convert', use scanf() to have 
 * user input a value for 'convert', and output the same number as hexadecimal
 * using %x 
 */
#include <stdio.h>

int main() {
	int convert = 0;	//Integer value to be converted to hex
	 
	for(int i = 0; i < 3; ++i) {	
		//create 3 test cases to show different values being converted
		printf("\n----- TEST CASE %d -----\n", i);
		printf("Please enter an integer to be converted to hexadecimal: ");
		scanf("%d", &convert);
		printf("The decimal integer '%d' is '%x' in hexadecimal\n", convert, convert);
	}
	return 0;
}