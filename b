#include <stdio.h>
#define SIZE 6
int binarysearch(int array[], int size, int number){
    int left=0;
    int right=size-1;

    while(left<=right){
        int mid= left+ (right-left)/2;

        if(array[mid]==number)
            return 1;
        else if(array[mid]<number)
            left=mid+1;
        else
            right=mid-1;

    }
    return 0;
}
int main(){

 
    int array[SIZE]={23, 78, 45, 8, 32, 56};
    int swapped,input;
    int temp;

    do{
        swapped=0;
        for(int i=1;i<SIZE;i++){
            if(array[i-1]>array[i]){
                temp=array[i-1];
                array[i-1]=array[i];
                array[i]=temp;
                swapped=1;
            }

        }
        printf("After pass: ");
        for(int i = 0; i < SIZE; i++) {
            printf("%d ", array[i]);
        }
        printf("\n");
    }while(swapped);

    printf("Enter a value to search: ");
    scanf("%d",&input);

    if(binarysearch(array,SIZE,input))
        printf("This value is in the array!");
    else
        printf("This value is NOT in the array!");


    return 0;
}
