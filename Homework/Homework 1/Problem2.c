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
            gotDot = TRUE;
        /*
         * Checks to see if there is a character in all of the designated places.
         * There may be a better way of doing this, might want to look back at 
         * this later
         */
        if ((nextChar >= 'A' && nextChar <='Z') || (nextChar >='a' && nextChar <= 'z')) {
            if (charBefore == FALSE && charBetween == FALSE && charAfter == FALSE) {
                charBefore = TRUE;
            }
            else if (charBefore == TRUE && charBetween == FALSE && charAfter == FALSE) {
                charBetween = TRUE;
            }
            else if (charBefore == TRUE && charBetween == TRUE && charAfter == FALSE) {
                charAfter = TRUE;
            }
        }
            
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