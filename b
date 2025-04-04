#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main(){

    int n;
    int *grades;
    printf("How many students you have? ");
    scanf("%d",&n);
    printf("Their grades are as follows:\n");

    srand(time(NULL));
    grades= (int *)malloc(sizeof(int)*n);
    if(grades==NULL){
        printf("Memory allocation failed.\n");
        exit(1);
    }

    for(int i=0;i<n;i++){
        *(grades+i) = rand() % 101;
        printf("Student %d: %d\n",i+1,*(grades+i));
    }
    return 0;
}
