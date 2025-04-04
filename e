#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SIZE 10
int main(){

   int sample,tp=0,fp=0,fn=0,tn=0;
   int *test,*actual;
   float accuracy;
    printf("Enter the sample size: ");
    scanf("%d",&sample);

    test=(int *) malloc(sizeof(int)*sample);
    actual=(int *) malloc(sizeof(int)*sample);

    srand(time(NULL));

    if(test==NULL || actual==NULL){
        printf("Memory allocation failed.\n");
        exit(1);
    }
    printf("Test results: \n");
    for(int i=0;i<sample;i++){
        *(test+i)=rand()%2;
        printf("Patient[%d] = %d\n",i+1,*(test+i));
    }

    printf("Actual results:\n");
    for(int i=0;i<sample;i++){
        *(actual+i)=rand()%2;
        printf("Patient[%d] = %d\n",i+1,*(actual+i));
    }
    for(int i=0;i<sample;i++) {
        if (*(test + i) == 1 && *(actual + i) == 1)
            tp++;
        if (*(test + i) == 0 && *(actual + i) == 0)
            tn++;
        if (*(test + i) == 1 && *(actual + i) == 0)
            fp++;
        if (*(test + i) == 0 && *(actual + i) == 1)
            fn++;
    }
        accuracy=(float)(tp+tn)/(tp+tn+fp+fn);
    printf("Results Computed:\n");
    printf("TP: %d\n FN: %d\n FP: %d\n TN: %d\n ",tp,fn,fp,tn);
    printf("Accuracy: %.2f ",accuracy);


    return 0;
}
