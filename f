#include <stdio.h>
#include <stdlib.h>
#define SIZE 100

int main() {
    
    char data[5][SIZE] = {
            "Ahmet 10031 7.82",
            "Mehmet 10067 9.14",
            "Ali 10083 8.79",
            "Veli 10095 10.57",
            "Huseyin 10105 8.50"
    };
    char temp[SIZE];//the buffer to hold the data for a temporary time

    char filename[SIZE];
    char filename2[ SIZE ];
    FILE *stream,*stream2;
    printf("Enter file name:");
    fscanf(stdin,"%s",filename);

    stream= fopen(filename,"w");//open file to write the data

    if (stream == NULL) {
        printf("Failed to open file %s for writing\n", filename);
        exit(1);
    }

    for (int i = 0; i < 5; i++) {//iterate the array according to row size, write to the file 
        fprintf(stream, "%s\n", data[i]);
    }
    
    fclose(stream);

    printf("Data has been written to %s\n", filename);

    printf("Enter the duplicate file name:");
    fscanf(stdin,"%s",filename2);

    stream= fopen(filename,"r");//open the original file to read the data
    if (stream == NULL) {
        printf("Failed to open file %s for writing\n", filename);
        exit(1);
    }

    stream2= fopen(filename2,"w");//open the second file to write the read data
    if(stream2==NULL){
        printf("Failed to open the file.\n");
        exit(1);
    }

    while(fgets(temp,SIZE,stream)!=NULL){//use fgets to write the data read from the original file, takes from stream and holds in temp, then writes the temp to stream2
        fputs(temp,stream2);
    }
    printf("Your %s file has been duplicated to %s!",filename,filename2);
    fclose(stream2);
    
    return 0;
}
