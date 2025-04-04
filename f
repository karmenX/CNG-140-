#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 5

int main() {
    int input,found;
    int array[SIZE];
    srand(time(NULL));

    for (int i = 0; i < SIZE; i++) {
        array[i] = rand()%100;
        printf("Array[%d] = %d\n", i, array[i]);
    }

    printf("Enter a value of x: ");
    scanf("%d",&input);
    for(int i=0; i<SIZE; i++) {
        for (int j = 0; j < i; j++) {

            if (array[i]+array[j]==input){
                printf("a[%d]=%d\ta[%d]=%d",i,array[i],j,array[j]);
                printf("\n");
                found=1;
            }
            else
                found=0;


        }
    }
    if(found==0)
        printf("ai + aj = x doesnt exist!");
    
  return 0;
}
