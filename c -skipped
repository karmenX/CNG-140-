#include<stdio.h>
int func(char message1[], char message2[]);

int main(){

    char message1[80],message2[80];
    int i=0;
    printf("Please enter a string 1: ");
    gets(message1);
    printf("Please enter a string 2: ");
    gets(message2);

    i=func(message1,message2);
    if(i==1)
        printf("String 1 and String 2 are identical");
    else
        printf("String 1 and String 2 are  NOT identical");
    return 0;
}
int func(char message1[],char message2[]){
    int i=0
    while(message1&&message2){
        for(i;i<80;i++){
            if(message1[i]==message2[i])
                return 1;
            else
                return 0;
        }
    }

}
