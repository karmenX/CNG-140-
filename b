#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define SIZE 100

struct Person {
    char lastname[15];
    char firstname[15];
    char age[4];
};

void adds(struct Person *data);
void search(struct Person *data, char string[]);
void delete(struct Person *data, char string[]);
void makePersistent(struct Person *data);

int main() {

    struct Person data[SIZE];
    char option;
    char string[SIZE];

    for(int i=0;i<SIZE;i++){
        strcpy(data[i].lastname,"unassigned");
        strcpy(data[i].firstname,"unassigned");
        strcpy(data[i].age,"0");
    }


    do{
        printf("1) Add person\n"
               "2) Search person\n"
               "3) Delete person\n"
               "4) Store the content\n"
               "5) Exit\n");
        printf("What would you like to do?");
        scanf(" %c",&option);
        switch (option) {
            case '1':
                adds(data);
                break;
            case '2':
                printf("Enter the lastname of the person: ");
                scanf(" %s",string);
                search(data,string);
                break;
            case '3':
                printf("Enter the lastname of the person: ");
                scanf(" %s",string);
                delete(data,string);
                break;
            case '4':
                makePersistent(data);
                printf("The content is stored to an external file called \"external.txt\". \n");
                break;
            case '5':
                exit(1);
            default:
                printf("Invalid option. Please enter a number between 1 and 5.\n");
        }

    }while(option!='5');

    return 0;
}
void adds(struct Person *data){

    int i=0;

    for(;i<SIZE;i++) {
        if(strcmp(data[i].firstname,"unassigned")==0) {
            printf("Enter the name of the person: ");
            scanf(" %s", data[i].firstname);
            printf("Enter the lastname of the person:");
            scanf(" %s", data[i].lastname);
            printf("Enter the age of the person: ");
            scanf(" %s", data[i].age);
            break;
        }

    }
    if(i==SIZE){
        printf("The list is full, cannot add more people.\n");
    }

}
void search(struct Person *data, char string[]){

    int i=0,found=0;
    for(;i<SIZE;i++){
        if(strcmp(string,data[i].lastname)==0){
            printf("Name and Surname: %s %s Age: %s\n",data[i].firstname,data[i].lastname,data[i].age);
            found=1;
            break;
        }
    }
    if(!found){
        printf("No user found!\n");
    }
}
void delete(struct Person *data, char string[]){

    int i=0,found=0;
    for(;i<SIZE;i++){
        if(strcmp(string,data[i].lastname)==0){

            printf("Name and Surname: %s %s Age: %s is deleted.\n",data[i].firstname,data[i].lastname,data[i].age);
            found=1;
            strcpy(data[i].firstname,"unassigned");
            strcpy(data[i].lastname,"unassigned");
            strcpy(data[i].age,"0");
            break;
        }
    }
    if(!found){
        printf("No user found!\n");
    }
}

void makePersistent(struct Person *data){

    char filename[]="external.txt";
    FILE *stream;

    stream= fopen(filename,"w");
    if(stream==NULL){
        printf("Failed to open the file.\n");
        exit(1);
    }
    for(int i=0; i<SIZE;i++) {
        if(strcmp(data[i].lastname,"unassigned")!=0){
            fprintf(stream," %s %s %s\n",data[i].firstname, data[i].lastname,data[i].age);
            i++;
        }
    }

    fclose(stream);

}
