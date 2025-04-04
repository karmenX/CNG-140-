#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SIZE 5
void multiply(int array[SIZE][SIZE], int array1[SIZE][SIZE], int result[SIZE][SIZE]);
int main(){

    int digital[SIZE][SIZE];
    int mask[SIZE][SIZE] = {0};
    int masked[SIZE][SIZE];
    mask[1][1] = 1;
    mask[1][2] = 1;
    mask[1][3] = 1;
    mask[2][1] = 1;
    mask[2][2] = 1;
    mask[2][3] = 1;
    mask[3][1] = 1;
    mask[3][2] = 1;
    mask[3][3] = 1;

    srand(time(NULL));

    for(int i=0;i<SIZE;i++){
        for(int j=0;j<SIZE;j++){
            digital[i][j]=rand()%255;
        }
    }
    printf("Created image is as follows: \n");
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%3d ", digital[i][j]);
        }
        printf("\n");
    }
    printf("Mask is as follows: \n");
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%3d ", mask[i][j]);
        }
        printf("\n");
    }
    printf("Masked image is as follows:\n");
    multiply(digital, mask,masked);

    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            printf("%3d ",masked[i][j]);
        }
        printf("\n");
    }

    return 0;
}
void multiply(int array[SIZE][SIZE], int array1[SIZE][SIZE], int result[SIZE][SIZE]){
    for(int i=0;i<SIZE;i++){
        for(int j=0;j<SIZE;j++){
            result[i][j]=array[i][j]*array1[i][j];
        }
    }
}
