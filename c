#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define SIZE 100

int main(int argc, char *argv[]){

    if(argc!=2){
        printf("Usage: %s <filename>\n",argv[0]);
        return 1;
    }

    FILE *stream;
    stream= fopen(argv[1],"r");
    if(stream==NULL){
        printf("Failed to open the file.\n");
        exit(1);
    }

    int line=0,integers=0;
    int num;
    char ch;

    while((ch= fgetc(stream))!=EOF){
        if(ch=='\n')
            line++;
    }
    fseek(stream,-1,SEEK_END);
    ch=fgetc(stream);
    if(ch!='\n')
        line++;
    rewind(stream);

    while(fscanf(stream,"%d",&num)==1){
        integers++;
    }
    fclose(stream);
    printf("Your file has %d lines and %d integers.\n", line, integers);



    return 0;
}
