#include <stdio.h>
#include <stdlib.h>

struct Earth{

    int depth;
    float celcius;
    float fahrenheit;
};

void addEarth(struct Earth **array, int *current_size, int *number_of_earth);
void searchEarth(struct  Earth *array, int *number_of_earth);
void storeEarth(struct Earth *array, int *number_of_earth);

int main() {

    struct Earth *data;
    int initial_number=5;
    int number_of_earth=0;

    data=(struct Earth*) malloc(sizeof (struct Earth)*initial_number);
    if(data==NULL){
        printf("Memory allocation failed.\n");
        exit(1);
    }

    char choice;
    do{

        printf("1)Add depth\n"
               "2)Search depth \n"
               "3)Store depth\n"
               "4)Exit\n");
        printf("What would you like to do?");
        scanf(" %c",&choice);
        switch (choice) {
            case '1':
                addEarth(&data,&initial_number,&number_of_earth);
                break;
            case '2':
                searchEarth(data,&number_of_earth);
                break;
            case '3':
                storeEarth(data,&number_of_earth);
                break;
            case '4':
                printf("Exiting program...\n");
                exit(0);
            default:
                printf("Please enter a valid number!\n");

        }


    }while(choice!='4');

    free(data);
    return 0;
}

void addEarth(struct Earth **array, int *current_size, int *number_of_earth){

    if(*number_of_earth>=*current_size){

        int new_size= *current_size+1;
        struct Earth *temporary;
        temporary=(struct Earth*) realloc(*array,sizeof (struct Earth)*new_size);
        if(temporary==NULL){
            printf("Memory allocation failed.\n");
            exit(1);
        }
        *array=temporary;
        *current_size=new_size;
    }
    printf("Enter the depth:");
    scanf("%d",&(*array)[*number_of_earth].depth);


    (*array)[*number_of_earth].celcius=(float )(10*(*array)[*number_of_earth].depth)+20;
    (*array)[*number_of_earth].fahrenheit=(float) (1.8)*(*array)[*number_of_earth].celcius +32;
    (*number_of_earth)++;



}

void searchEarth(struct  Earth *array, int *number_of_earth) {

    int depth;
    int found = 0;
    printf("Enter the depth:");
    scanf("%d", &depth);

    for (int i = 0; i < *number_of_earth; i++) {
        if (depth == array[i].depth) {
            found = 1;
            printf("The temperature at depth %.1d is %.1f degrees Celsius\n", depth, array[i].celcius);
            printf("The temperature at depth %.1d is %.1f degrees Fahrenheit\n", depth, array[i].fahrenheit);
            break;
        }

    }
    if (!found) {
        printf("Depth %d is not found!\n", depth);
    }
}

void storeEarth(struct Earth *array, int *number_of_earth) {

    FILE *stream = fopen("earth.txt", "w");
    if (stream == NULL) {
        printf("Failed to open the file.\n");
        exit(1);
    }

    for (int i = 0; i < *number_of_earth; i++) {
        fprintf(stream, "%d %.1f %.1f\n", array[i].depth, array[i].celcius, array[i].fahrenheit);
    }
    printf("earth.txt is successfully created!\n");

    fclose(stream);
}
