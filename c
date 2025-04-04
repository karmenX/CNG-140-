#include<stdio.h>
#include <stdlib.h>//to use exit
#include <string.h>//to use strlen 
#include <ctype.h>// to use tolower
#define SIZE 10000

int main(){

    char filename[SIZE];
    char text[SIZE];
    int len=0;//tracks the lengh of the data in the text array
    int read_len;//stores the length of the most recently read chunk of the file
    FILE *stream;

    printf("Enter your string: ");
    gets(filename);

    stream= fopen(filename,"r");
    if(stream==NULL){
        printf("Failed to open the file\n");
        exit(1);
    }

    while(fgets(text+len,SIZE-len,stream)!=NULL){//reads from the file and appends is to the text array starting from the current lenght which is len
        read_len=strlen(text+len);//calculates the lenght of newly read line
        len+=read_len;// updates the total lenght of the text array
        if(read_len>=SIZE-1)
            break;
    }
    printf("\n");
    printf("%s",text);

    char count[26];//we have 26 letters in the alphabet
    
    for(int i=0;i< len+1;i++){
        char c=tolower(text[i]);//we lower every character with the function tolower
        if(c>='a' && c<='z'){// if the element is an alphabetic character 
            count[c-'a']++;// since c-'a' is the ascii value of that alphabetic element, it'll incerement that adress value for the array
        }
    }

    for(int j=0;j<26;j++){
        if(count[j]>0)//if it is not greater than 0, then the character is not appears in the sentences, therefore we don't need to print it
        printf("Number of '%c': %d \n",'a'+j, count[j]);// 'a'+j means that whenever j is incremented it'll be the alphabetic character
    }
    
    fclose(stream);

    return 0;
}
