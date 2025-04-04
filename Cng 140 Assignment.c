#include <stdio.h>

int main() {
    char option,ch;
    int base, S0, S1, D, Y0, Y1, Y2, Y3, converted, counter, input;
    printf("Welcome to 1 to 4 Demultiplexer!\n"
           "   a) Compute and Display the outputs\n"
           "   b) Quit\n");
    printf("You choose: ");
    scanf(" %c", &option);

    do {
        if (option == 'a') {
            printf("You have chosen option a\n");
            printf("Which base will you use to enter input (base 2 or base 10)? ");
            scanf("%d", &base);

            if (base == 2) {
                do {
                    counter = 0; //Resetting counter
                    printf("Please enter your input: ");
                    while (counter < 3) {
                        scanf(" %c", &ch);

                        if (ch >= '0' && ch <= '1') {//Checking if the character is a binary number
                            converted = ch - '0'; // Converting character to integer with the ascii values

                            if (counter == 0) {//assigning the values to the digits, with the queue
                                S1 = converted;
                            } else if (counter == 1) {
                                S0 = converted;
                            } else if (counter == 2) {
                                D = converted;
                            }
                            counter++;
                        } else {
                            printf("It is not a valid number in base 2! Please try again!\n");
                            counter = 0; // Resetting the counter
                            printf("Please enter your input: ");
                        }
                    }

                } while (counter != 3); // repeating until exactly 3 digits
//couldn't done the error parts. 

                printf("S1 = %d, S0 = %d, D = %d\n", S1, S0, D);

                // Making the calculations according to the given table
                Y0 = (!S1) && (!S0) && D;
                Y1 = (!S1) && S0 && D;
                Y2 = S1 && (!S0) && D;
                Y3 = S1 && S0 && D;

                printf("Y0: %d  Y1: %d  Y2: %d  Y3: %d\n", Y0, Y1, Y2, Y3);

            }
            else if (base == 10) {
                printf("Please enter your input: ");
                do {
                    scanf("%d", &input);

                    // Making sure that the user doesn't enter a value greater than 7
                    if (input > 7) {
                        printf("Decimal %d cannot be represented with 3 bits. Please try again!\n", input);
                        printf("Please enter your input: ");
                    }
                    else
                        break;
                } while (1);

                // Converting decimal to binary
                int rem, binary = 0, digits = 1;
                while (input > 0) {
                    rem = input % 2;
                    input = input / 2;
                    binary = binary + (rem * digits);
                    digits = digits * 10;
                }
                printf("Binary representation of the number is: %d\n", binary);

                // Dividing the binary number to its digits
                D = binary % 10;
                S0 = (binary / 10) % 10;
                S1 = (binary / 100) % 10;
                printf("S1 = %d, S0 = %d, D = %d\n", S1, S0, D);

                // Making the calculations according to the given table
                Y0 = (!S1) && (!S0) && D;
                Y1 = (!S1) && S0 && D;
                Y2 = S1 && (!S0) && D;
                Y3 = S1 && S0 && D;

                printf("Y0: %d  Y1: %d  Y2: %d  Y3: %d\n", Y0, Y1, Y2, Y3);
            }
        }
            else if (option == 'b') {
                printf("You have chosen option b \n");
                printf("BYEE!!\n");
                break;
            } else
                printf("Invalid option ! Choose either a or b!\n");

            printf("\nWelcome to 1 to 4 Demultiplexer!\n"
                   "   a) Compute and Display the outputs\n"
                   "   b) Quit\n");
            printf("You choose: \n");
            scanf(" %c", &option);
        }
    while (1);

    return 0;
}

