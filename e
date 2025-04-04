#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void populateArray (int *x, int n);
int check (int *x, int n, int m);

int main(){

    int difficulty,guess,result=0;
    int *array;


    printf("----------------------------------------------\n");
    printf("Press 0 for beginner\n"
           "Press 1 for intermediate\n"
           "Press 2 for advanced\n");
    printf("Enter the difficulty level of the game:");
    scanf("%d",&difficulty);
    printf("----------------------------------------------\n");

    printf("Enter your guess (between 0 and 100):");
    scanf("%d",&guess);

    switch (difficulty) {
        case 0:
            array=(int*) malloc(sizeof(int)*150);
            populateArray (array,150);
            result= check(array,150,guess);
            break;
        case 1:
            array=(int*) malloc(sizeof(int)*100);
            populateArray (array,100);
            result= check(array,100,guess);
            break;
        case 2:
            array=(int*) malloc(sizeof(int)*50);
            populateArray (array,50);
            result= check(array,50,guess);
            break;
        default:
            break;
    }

    if(result==1)
        printf("Congrats! You win!");
    else
        printf("Gameover!");

    free(array);

    return 0;
}

void populateArray (int *x, int n){

    srand(time(NULL));

    for(int i=0;i<n;i++){
        *(x+i)=rand()%101;
    }
}

int check (int *x, int n, int m){

    for(int i=0;i<n;i++){
        if(*(x+i)==m)
            return 1;
    }

    return 0;
}
