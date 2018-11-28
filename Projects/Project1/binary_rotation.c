//Implementation of Problem 2: Left Rotation in C

#include <stdio.h>

int main(void) {
	short bin = 0xFFFA; 	//Binary string to be rotated
	short n = 0x0004;	  	//Amount of bits to be rotated
	short *bPtr, *nPtr, sPtr;	//Pointers to mem locations (x3100-x3102 in LC3)
	printf("b = x%x\n", bin);
	printf("Rotated by %i bits", n);
	return 0;
	//Incomplete
}
