#include <stdio.h>

//definition of the structure to represent an account
struct Account {
    char name[20];
    int accountnumber;
    float balance;
};
//function prototypes
char displayMenu();
int getUserInput(char *prompt);
void createAccount(struct Account*data,int );
void depositMoney(struct Account *data, int);
void withdrawMoney(struct Account *data, int);
void checkBalance(struct Account *data, int);

int main() {

    int MAX_ACCOUNT_NUMBER = 5; //assigning a maximum number for the accounts in the main function since we are not allowed to use global variables
    struct Account data[MAX_ACCOUNT_NUMBER];//creating an array to hold the accounts
    char option;

    for (int i = 0; i < MAX_ACCOUNT_NUMBER; i++) { //initializing every array element to 0 so with the taken input we can assign new values to the elements
        data[i].accountnumber = 0;
        data[i].balance = 0;
    }

    do {
        option = displayMenu();//assigning the entered input and using switch loop to call the functions
        switch (option) {
            case '1':
                createAccount(data, MAX_ACCOUNT_NUMBER);
                break;
            case '2':
                depositMoney(data, MAX_ACCOUNT_NUMBER);
                break;
            case '3':
                withdrawMoney(data, MAX_ACCOUNT_NUMBER);
                break;
            case '4':
                checkBalance(data, MAX_ACCOUNT_NUMBER);
                break;
            case '5':
                printf("Thank you for using our Simple Banking System\n Goodbye!");
                break;//ends the loop
            default:
                printf("Invalid option. Please enter a number between 1 and 5.\n");
        }
    }while(option!='5');//if the input is not in the range of the menu options, asks user again to enter input

    return 0;
}

char displayMenu() {//displaying menu and taking input

    char choice;
        printf("Menu:\n"
               "1. Create New Account\n"
               "2. Deposit Money\n"
               "3. Withdraw Money\n"
               "4. Check Balance\n"
               "5. Quit\n");
        printf("Enter your choice: ");
        scanf(" %c", &choice);

    return choice;
}

int getUserInput(char *prompt){
    //takes the input and returns to the input

    int input;
    printf("%s", prompt);//prints the message according to the function
    scanf("%d",&input);

    return input;
}

void createAccount(struct Account *data, int MAX_ACCOUNT_NUMBER){

    int i;
    static int account_number=1001;//using static integer to handle the account numbers as unique numbers by making the integer value stable for every function call

    for(i=0;i<MAX_ACCOUNT_NUMBER;i++) {
        //iterates until the maximum number of account to find an empty slot in the array for assigning the inputs

        if(data[i].accountnumber==0) {//if the array is empty
            //takes inputs from the user and assigns them to the array
            data[i].accountnumber = account_number++;
            printf("Enter your name: ");
            scanf(" %s", data[i].name);
            printf("Enter initial deposit: ");
            scanf("%f", &data[i].balance);
            printf("Account created successfully!\n");
            printf("Account Holder Name is %s\n", data[i].name);
            printf("Account number is %d\n", data[i].accountnumber);
            break;
        }
    }

    if(i==MAX_ACCOUNT_NUMBER)//this condition handles the array size
        //if the iteration reached to the maximum size of the array(maximum account number), prints an error message
        printf("The list is full, cannot add more people.\n");

}

void depositMoney(struct Account *data, int MAX_ACCOUNT_NUMBER){

    int account_number;
    float deposit_money;
    int found;

    do {

        found=0;//resetting found for every attempt
        account_number = getUserInput("Enter account number: ");

        for (int i = 0; i < MAX_ACCOUNT_NUMBER; i++) {
            //iterates through all accounts to find the entered account number
            if (account_number == data[i].accountnumber) {
                //checks if there is an account with the taken input
                found = 1;
                deposit_money = (float) getUserInput("Enter deposit money: ");
                data[i].balance = data[i].balance + deposit_money;  //adding the taken deposit money to the balance
                printf("Deposit successful! New balance: %.0f\n", data[i].balance);
                break;//exits loop when the account is found
            }

        }
        if(!found){
            printf("No account found!\n");//printing error message if the account number is not found
        }

    } while (!found);//repeatedly takes input until an account is found

}

void withdrawMoney(struct Account *data, int MAX_ACCOUNT_NUMBER){

    int account_number;
    float withdrawal_money;
    int found;

    do {

        found = 0;//resetting found for every attempt
        account_number = getUserInput("Enter account number: ");

        for (int i = 0; i < MAX_ACCOUNT_NUMBER; i++) {
            //iterates through all accounts to find the entered account number
            if (account_number == data[i].accountnumber) {//checks if there is an account with the taken input
                found = 1;
                withdrawal_money = (float) getUserInput("Enter withdrawal amount:");

                if (data[i].balance >= withdrawal_money) {
                    //checks if the balance has enough funds to withdraw the money
                    data[i].balance = data[i].balance - withdrawal_money;  //withdraws the money from the total balance
                    printf("Withdrawal successful! New balance: %.0f\n", data[i].balance);
                    break;//exits loop when the account is found

                } else
                    printf("Insufficient funds. Your balance is %.0f\n", data[i].balance);//printing an error message
            }
        }
        if(!found)
            printf("No account found!\n");//printing error message if the account number is not found

    } while (!found);//repeatedly takes input until an account is found

}

void checkBalance(struct Account *data, int MAX_ACCOUNT_NUMBER){

    int account_number;
    int found;

    do {

        found = 0;//resetting found for every attempt
        account_number = getUserInput("Enter account number: ");

        for (int i = 0; i < MAX_ACCOUNT_NUMBER; i++) {
            //iterates through all accounts to find the entered account number
            if (account_number == data[i].accountnumber) {
                //checks if there is an account with the taken input
                found = 1;
                printf("Current balance: %.0f\n", data[i].balance);
                //printing the total balance of the account
                break;//exits loop when the account is found
            }
        }

        if(!found)
            printf("No account found!\n");;//printing error message if the account number is not found

    } while (!found);//repeatedly takes input until an account is found

}