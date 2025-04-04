#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#define N 5

double entropy_calculator (int bucket[N]);
void display_entropy(int bucket[N], double);
int main(){

    int array[N];
    float entropy=0;
    srand(time(NULL));

    for(int i=0;i<N;i++){
        array[i]=1+rand()%6;
    }

    printf("\n");
    entropy=entropy_calculator(array);
    display_entropy(array,entropy);




    return 0;
}

double entropy_calculator (int bucket[N]){
    double color[6]={0};
    float entropy=0;
    for(int i=0; i<6;i++){
        if(bucket[i]==1)
            color[0]++;
        else if(bucket[i]==2)
            color[1]++;
        else if(bucket[i]==3)
            color[2]++;
        else if(bucket[i]==4)
            color[3]++;
        else if(bucket[i]==5)
            color[4]++;
        else if(bucket[i]==6)
            color[5]++;
    }
    //just for check up
    for(int i=0;i<6;i++){
        printf("color[%d]: %.0f\t",i+1,color[i]);
    }
    printf("\n");

    for(int i=0;i<6;i++){
        if(color[i]>0)
        entropy+=(color[i]/N)* log2(color[i]/N);
    }

    return -entropy;
}

void display_entropy(int bucket[N], double entropy){
    printf("With %d samples, you have the following balls in the bucket: \n",N);
    for(int i=0;i<N;i++){
        printf("array[%d]: %d\t",i,bucket[i]);
    }
    printf("\n");
    printf("And the entropy is: %.2f",entropy);

}
