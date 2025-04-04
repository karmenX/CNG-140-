#include <stdio.h>

int count(char *string);

int main(){

    char string[100];
    int sentences;
    printf("Please enter a sentence: ");
    gets(string);
    sentences=count(string);
    printf("You entered %d sentences",sentences);

    return 0;
}

int count(char *string){
    int count=0,word=0;
    while(*string!='\0'){

        if(*(string)=='?' || *(string)=='!' || *(string)=='.')
            count++;
        if(*string==' ')
            word++;
        string++;

    }
    printf("Average words per sentence is %d\n",(word+1)/count);
    return count;

}
