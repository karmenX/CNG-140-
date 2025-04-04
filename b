#include<stdio.h>
void func(char message[]);

int main(){

    char message[80];
    printf("Please enter a string: ");
    gets(message);
    func(message);
    return 0;
}
void func(char message[]){
    int i=0;
    char string[80];
    while(message[i]){
        string[i]=message[i];
        i++;
        string[i]='\0';
    }
    printf("String 1 is copied to String 2\n");
    printf("String 1 is %s and String 2 is %s ",message,string);

}
