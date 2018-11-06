/*
 * Example of how an assembler might interpret instructions
 */

#include <iostream>
#include <string>
#include <sstream>
int main() {
	string instr1{ "POSITIVE NOT R1 ; 2's comp notation"};
	string instr2{ "ADD R1, R1, #1" };
 
	istringstream iss(instr1);
	string firstWord;
	iss >> firstWord;
	cout << "First word in instr1: " << firstWord << "\n";
	
	if(firstWord == "ADD") {
		std::cout << "0001";
	}