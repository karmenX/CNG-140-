#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void populate(int **array, int size);
void sort(int **array, int size);
void display(int **array, int size);
int main(){

        int size=3;
        int **array;
    srand(time(NULL));

    array=(int **) malloc(sizeof(int)*size );
    for(int i=0;i<size;i++){
        array[i]=(int *) malloc(sizeof(int)*size);
    }
    if(array==NULL){
        printf("Memory allocation failed.\n");
        exit(1);
    }
    populate(array,size);
    display(array,size);
    printf("\n");
    sort(array,size);
    display(array,size);
    free(array);
	

    return 0;
}
void populate(int **array, int size){


    for(int i=0;i<size;i++){
        for(int j=0;j<size;j++){
            array[i][j]=rand()%101;
        }
    }
}

void sort(int **array, int size) {

    int *temp;

    for (int j = 0; j < size; j++) {
        temp = (int *) malloc(sizeof(int) * size);
        if (temp == NULL) {
            printf("Memory allocation failed.\n");
            exit(1);
        }
        for (int i = 0; i < size; i++) {
            temp[i] = array[i][j];
        }


        for (int i = 0; i < size; i++) {
            for (int k = 0; k < size - 1; k++) {
                int tempvalue;
                if (temp[k] > temp[k + 1]) {
                    tempvalue = temp[k];
                    temp[k] = temp[k + 1];
                    temp[k + 1] = tempvalue;

                }
            }
        }

        for (int i = 0; i < size; i++) {
            array[i][j] = temp[i];
        }

    }
}

void display(int **array, int size){

    for(int i=0;i<size;i++){
        for(int j=0;j<size;j++){
            printf("%5d",array[i][j]);
        }
        printf("\n");
    }


    }
