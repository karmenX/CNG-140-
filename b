#include <stdio.h>
#include <stdlib.h>
#include <math.h>


int main() {

    int size;
    float mean,deviation,sum=0, numerator = 0;
    float *array;
    printf("How many numbers you want to use in your statistics?");
    scanf("%d",&size);

    array= malloc(sizeof(int)*size);
    if(array==NULL) {
        printf("\nFailed to allocate array\n");
        exit(1);
    }
    printf("Please enter %d numbers:",size);
    for(int i=0; i<size;i++){
        scanf("%f",&array[i]);
    }
    for(int i=0; i<size;i++){
        sum+=array[i];
    }
    mean=sum/size;
    for(int i=0; i<size;i++){
        numerator+= pow(array[i],2);
    }
    deviation= sqrt(numerator/size);
    printf("Sum is %.1f\n",sum);
    printf("Mean is %.1f\n",mean);
    printf("Standart deviation is %.2f",deviation);


    return 0;
}
