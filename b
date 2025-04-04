#include<stdio.h>
#include <stdlib.h>
#include <string.h>
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

    while(fgets(text+len,SIZE,stream)!=NULL){//reads from the file and appends is to the text array starting from the current lenght which is len
        read_len=strlen(text+len);//calculates the lenght of newly read line
        len+=read_len;// updates the total lenght of the text array
        if(read_len>=SIZE-1)
            break;
    }
    printf("\n");
    printf("%s",text);

    fclose(stream);

    return 0;
}
