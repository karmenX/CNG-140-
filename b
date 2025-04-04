#include <stdio.h>
#include <stdlib.h>

void find_two_smallest(int a[], int n, int *smallest);

int main(){

    int n,smallest;
    int *array;
    printf("How many elements you want to store (n)?");
    scanf("%d",&n);

    array=(int *) malloc(sizeof(int)*n);

    if(array==NULL){
        printf("Memory allocation failed.\n");
        exit(1);
    }

    for(int i=0;i<n;i++) {
        printf("Enter a value to be stored:");
        scanf("%d", (array + i));
    }

    find_two_smallest(array,n,&smallest);
    printf("Smallest value stored is %d",smallest);
    free(array);

    return 0;
}
void find_two_smallest(int a[], int n, int *smallest){

    *smallest=a[0];
    for(int i=0;i<n;i++){
        if(*(a+i)<*smallest)
            *smallest=*(a+i);

    }
}
