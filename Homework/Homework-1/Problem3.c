/* 
 * Jonathan Limpus
 * Problem 3
 * Problem: Modify program on Book page 298 to print every ASCII character 33-126
 * Solution: Modified all int variables to chars, added a conditional statement
 *           to reject non-printable characters
 * Source: Patt and Patel, Page 298
 */

#include <stdio.h>
#define STOP 33         //ASCII Character 33 is !

int main() {
    char counter;
    char startPoint;
    int isDone = 0; //Allows for user to re-enter if invalid

    printf("===== Countdown Program =====\n");
       
    do { 
        printf("Enter a Character: ");
        scanf("%c", &startPoint);

        if(startPoint >= 33 && startPoint <= 126) {
            for(counter = startPoint; counter >= STOP; counter--) {
                printf(" %c", counter);
            }
            printf("\n");
            isDone = 1;
        }
        else {
            printf("Please enter a valid character\n");
        }
    } while (isDone == 0);
}