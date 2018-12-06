//Example to be translated to LC-3 assembly

#include <iostream>

void printMe(int x) {
	std::cout << x;
}	
int passByValue(int x) {
	return x + 1;
}
void passByReference(int& x) {
	x++;
}

int main() {
	int x = 10;
	printMe(x);
	x++;
	printMe(x);
	passByValue(x);
	printMe(x);
	passByReference(x);
	printMe(x);
}