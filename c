#include <stdio.h>
#include <stdlib.h>
void sum(int *array1, int *array2, int *array3, int size);
int main(){

    int size;
    int *array1,*array2,*array3;
    printf("How many elements you have? ");
    scanf("%d",&size);

    array1=(int *)malloc(size*sizeof(int));
    array2=(int *)malloc(sizeof(int)*size);
    array3=(int *)malloc(sizeof(int)*size);

    if(array1==NULL||array2==NULL||array3==NULL){
        printf("Memory allocation failed\n");
        exit(1);
    }

    for(int i=0; i<size;i++){
        printf("Enter array-1 element [%d]:",i+1);
        scanf("%d",&array1[i]);
    }
    for(int i=0; i<size;i++){
        printf("Enter array-2 element [%d]:",i+1);
        scanf("%d",&array2[i]);
    }
    sum(array1,array2,array3,size);
    for(int i=0;i<size;i++){
        printf("Result array element [1]: %d\n",*(array3+i));
    }
    free(array1);
    free(array2);
    free(array3);


    return 0;
}
void sum(int *array1, int *array2, int *array3, int size){
    for(int i=0;i<size;i++){
        *(array3+i)=*(array1+i)+*(array2+i);
    }

}
