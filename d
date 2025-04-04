#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define SIZE 100
#define NUM_BOATS 500

struct Data{
    char *lastname;
    char *license;
    char *boatname;
};

int main() {

    struct Data boat[NUM_BOATS];
    char filename[]="data.txt";
    FILE *stream;

    for(int i=0;i<NUM_BOATS;i++){
        boat[i].lastname=(char *)malloc(sizeof(char )*SIZE);
        boat[i].license=(char *)malloc(sizeof(char )*SIZE);
        boat[i].boatname=(char *)malloc(sizeof(char )*SIZE);

        if(boat[i].lastname==NULL){
            printf("Memory allocation failed.\n");
            exit(1);
        }

        if(boat[i].license==NULL){
            printf("Memory allocation failed.\n");
            exit(1);
        }

        if(boat[i].boatname==NULL){
            printf("Memory allocation failed.\n");
            exit(1);
        }
        strcpy(boat[i].lastname, "defaultName");
        strcpy(boat[i].license, "123");
        strcpy(boat[i].boatname, "defaultName");

    }
    stream= fopen(filename,"w");
    if(stream==NULL){
        printf("Failed to open the file.\n");
        exit(1);
    }

    for(int i=0;i<NUM_BOATS;i++){
        fprintf(stream,"%s %s %s\n",boat[i].lastname,boat[i].license,boat[i].boatname);
    }

    fclose(stream);
    for(int i=0;i<SIZE;i++) {
        free(boat[i].boatname);
        free(boat[i].license);
        free(boat[i].lastname);
    }

    return 0;
}
