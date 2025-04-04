#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int test,result;
    int *patient1,*patient2;
    float q=0,r=0,s=0;
    float dissimilarity=0.0;
    srand(time(NULL));
    printf("Enter the test size: ");
    scanf("%d",&test);
    patient1= (int *)malloc(sizeof (int)*test);
    patient2= (int *)malloc(sizeof (int)*test);
    printf("Patient 1: ");
    for(int i=0;i<test;i++){
        result=rand()%2;
        patient1[i]=result;
        printf("%d ",result);
    }
    printf("\n");
    printf("Patient 2: ");
    for(int i=0;i<test;i++){
        result=rand()%2;
        patient2[i]=result;
        printf("%d ",result);
    }
    printf("\n");
    for(int i=0;i<test;i++) {
        if (patient1[i] == 1 && patient2[i]==1)
            q++;
        else if (patient1[i]==1 && patient2[i]==0)
            r++;
        else if (patient1[i]==0 && patient2[i]==1)
            s++;

    }
    printf("q= %.2f\t r=%.2f\t s=%.2f\t", q, r, s);
    printf("\n");
    dissimilarity=(r+s)/(q+r+s);
    if(dissimilarity<=0.5)
        printf("Your patients have dissimilarity measure of %.2f and they are more likely to have the same illness. ",dissimilarity);
    else if(dissimilarity==0.0)
        printf("Your patients have dissimilarity measure of %.2f and they definitely have the same illness. ",dissimilarity);
    else if(dissimilarity==1.0)
        printf("Your patients have dissimilarity measure of %.2f and they definitely not have the same illness. ",dissimilarity);
    else
        printf("Your patients have dissimilarity measure of %.2f and they are more likely NOT to have the same ",dissimilarity);

    return 0;
}
