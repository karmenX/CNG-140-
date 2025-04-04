 #include <stdio.h>
    #include <stdlib.h>
    #include <time.h>
    #define SIZE 10
    int main(){

    int array1[SIZE];
    int array2[SIZE];
    int printed[SIZE]={0};
        srand(time(NULL));

        for(int i=0; i<SIZE; i++){
        array1[i]=rand()%100;
        array2[i]=rand()%100;
        }
        printf("First array is as follows: [");
    for(int i=0;i<SIZE;i++){
        printf("%d",array1[i]);
        if(i<SIZE-1)
            printf(",");
    }
        printf("]\n");
        printf("Second array is as follows: [");
        for(int i=0;i<SIZE;i++){
            printf("%d",array2[i]);
            if(i<SIZE-1)
                printf(",");
        }
        printf("]\n");
        printf("Duplicate elements are as follows:");
        int found=0;
    for(int i=0;i<SIZE;i++){
        for(int j=0;j<SIZE;j++){
            if(array1[i]==array2[j] && !printed[array1[i]]) {
                if(found){
                    printf(",");
                }
                printf("%d", array1[i]);
                found=1;
                printed[array1[i]]=1;
                break;
            }
        }
    }
    if(!found)
        printf("None!");

        return 0;
    }
