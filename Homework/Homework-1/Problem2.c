/*
 * Jonathan Limpus
 * Problem: Modify Figure 13.23 on page 367 so that one char appears before '@'
 * and between '@' and '.', and after '.' as well
 */

#include <stdio.h>
#define FALSE 0
#define TRUE 1

int main() 
{
    char nextChar;          /*Next character in e-mail address*/
    char prevChar;          /*Previous Character in email address*/
    int gotAt = FALSE;      /*Indicates if At @ was found*/
    int gotDot = FALSE;     /*Indicates if Dot. was found*/
    int charBefore = FALSE; /*Indicates if a char appeared before At @*/
    int charBetween = FALSE;/*Indicates if a char appeared between @ and . */
    int charAfter = FALSE;  /*Indicates if a char appeared after .*/

    printf("Enter your email address: ");
    do{
        scanf("%c", &nextChar);
        //Check if character before @ is alphanumeric
        if (nextChar == '@' && ((prevChar >= '0' && prevChar <= '9') || (prevChar >= 'A' && prevChar <= 'Z') || (prevChar >= 'a' && prevChar <= 'z'))) {
            gotAt = TRUE; 
            charBefore = TRUE;
        }
        //Check if an alphanumeric character exists between @ and .
        if (nextChar == '.' && gotAt == TRUE && ((prevChar >= '0' && prevChar <= '9') || (prevChar >= 'A' && prevChar <= 'Z') || (prevChar >= 'a' && prevChar <= 'z'))) {
            gotDot = TRUE;
            charBetween = TRUE;
        }
        //Check if an alphanumberic character exists after . 
        if (gotAt == TRUE && gotDot == TRUE && ((nextChar >= '0' && nextChar <= '9') || (nextChar >= 'A' && nextChar <= 'Z') || (nextChar >= 'a' && nextChar <= 'z'))) {
            charAfter = TRUE;
        }
        //Assign currently inputted char to a new variable for checking
        prevChar = nextChar;  
    }
    while (nextChar != ' ' && nextChar != '\n');
    if (gotAt == TRUE && gotDot == TRUE && charBefore == TRUE && 
        charBetween == TRUE && charAfter == TRUE) {
        printf("Your email address appears to be valid.\n");
        }
    else
        printf("Your email address is not valid!\n");
    return 0; 
}