#include <stdio.h>
#define SIZE 8

int main() {
    float array[SIZE];
    float sum=0.0,average;

    for(int i=0;i<SIZE;i++){
        printf("Enter number %d to populate:",i+1);
        scanf("%f",&array[i]);
    }

    for (int j=0; j<SIZE;j++){
        sum=sum+array[j];
    }

    average=sum/SIZE;
    printf("The average is %.1f\n",average);
    printf("Values > Average\tPosition\n");

    for(int k=0;k<SIZE;k++){

        if(array[k]>average)
            printf("%.1f\t\t\t%d\n", array[k], k+1);

    }

  return 0;
}
