#include<stdio.h>
#define SIZE 20
#include <string.h>


int main(){

    char message[SIZE];
    char smallest_word[SIZE],largest_word[SIZE];
    printf("Enter word: ");
    scanf("%s",message);
    strcpy(smallest_word,message);
    strcpy(largest_word,message);

    while(strlen(message)!=4){


        if(strcmp(message,smallest_word)<0)
            strcpy(smallest_word,message);
        if(strcmp(message,largest_word)>0)
            strcpy(largest_word,message);

        printf("Enter word: ");
        scanf("%s",message);

    }
    printf("Smallest word: %s \n", smallest_word);
    printf("Longest word: %s",largest_word);


    return 0;
}
