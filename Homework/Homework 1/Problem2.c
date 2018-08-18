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
    int gotAt = FALSE;      /*Indicates if At @ was found*/
    int gotDot = FALSE;     /*Indicates if Dot. was found*/
    int charBefore = FALSE; /*Indicates if a char appeared before At @*/
    int charBetween = FALSE;/*Indicates if a char appeared between @ and . */
    int charAfter = FALSE;  /*Indicates if a char appeared after .*/

    printf("Enter your email address: ");
    do{
        scanf("%c", &nextChar);

        if (nextChar == '@')
            gotAt = TRUE;
        if (nextChar == '.' && gotAt == TRUE)
            gotDot == TRUE;
        if ((nextChar >= 'A' && nextChar <='Z')
            
    }
    while (nextChar != ' ' && nextChar != '\n');
    if (gotAt == TRUE && gotDot == TRUE)
        printf("Your email address appears to be valid.\n");
    else
        printf("Your email address is not valid!\n");
    return 0; 
}