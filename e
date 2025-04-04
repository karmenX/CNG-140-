#include <stdio.h>
#include <stdlib.h>
#define SIZE 10000

int main(){

    char filename1[SIZE],filename2[SIZE];
    char message[SIZE];
    FILE *stream;
    FILE *stream2;

    do {
        printf("Enter the file name :");
        fscanf(stdin,"%s",filename1);
        stream= fopen(filename1,"r");
        if (stream == NULL) {
            printf("File did not succesfully opened.\n");
        }

    }while(stream==NULL);

        printf("Enter the file name to copy: ");
        fscanf(stdin,"%s",filename2);

        stream2 = fopen(filename2, "w");
        if (stream2 == NULL) {
            printf("File did not succesfully opened.\n");
            exit(1);
        }

    while(fgets(message,SIZE,stream)!=NULL){
        fputs(message,stream2);

    }

    printf("First file has the string %s \n",message);

    while(fscanf(stream2,"%s",message)!=EOF){
        fputs(message,stream2);
    }
    fclose(stream);
    fclose(stream2);

    stream2= fopen(filename2,"r");
    if(stream2==NULL){
        printf("File did not succesfully opened.\n");
        exit(1);
    }
    else
        printf("%s is created! ",filename2);

    printf("Contents of the copied file %s:\n", filename2);
    while(fgets(message,SIZE,stream2)!=NULL){
        printf("%s",message);
    }
    fclose(stream2);

    return 0;
}
