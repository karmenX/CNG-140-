#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define STUDENT_NUMBER 2

struct Student{

    int id;
    char name[100];
    int section_number;

};

void scan_students(struct Student *data);
void split_sections(struct Student *data);
void display_students(struct Student *data);

int main(){

    struct Student array[STUDENT_NUMBER];

    scan_students(array);
    split_sections(array);
    display_students(array);

    return 0;
}

void scan_students(struct Student *data){

    FILE *stream= fopen("students.txt","r");
    if(stream==NULL){
        printf("Failed to open the file.\n");
        exit(1);
    }

    for(int i=0;i<STUDENT_NUMBER;i++){
        if(fscanf(stream,"%d %[^\n] \n",&data[i].id, data[i].name)!=2) {
            printf("Error reading student\n");
            break;
        }
        printf("%d %s \n",data[i].id,data[i].name);

    }
    fclose(stream);

}
void split_sections(struct Student *data){



    for(int i=0;i<STUDENT_NUMBER;i++){
        char copy[100];
        strcpy(copy,data[i].name);

        char *name= strtok(copy," ");
        char *surname= strtok(NULL," ");
        if(surname!=NULL){
            printf("%s\n",name);
            char first_letter=tolower(surname[0]);
            if(first_letter>='a' && first_letter<='k')
                data[i].section_number=1;
            else if(first_letter>='l' && first_letter<='z')
                data[i].section_number=2;
            else
                data[i].section_number=0;
        }

    }
}

void display_students(struct Student *data){

    FILE *stream= fopen("students.txt","w");
    if(stream==NULL){
        printf("Failed to open file.\n");
        exit(1);
    }

    for(int i=0;i<STUDENT_NUMBER;i++){
        fprintf(stream,"%d %s %d\n",data[i].id, data[i].name, data[i].section_number);
    }

}
