#include <stdio.h>
#include <stdlib.h>

void  populate(float **array, int n);
void display(float **array, int n);
void conversion(float **array, int n);

int main() {

    int n;
    float **array1;
    printf("Enter the size of N: ");
    scanf("%d",&n);

    array1=(float **)malloc(sizeof(int)*n );
    if(array1==NULL){
        printf("Memory allocation failed.\n");
        exit(1);
    }
    for(int i=0;i<n;i++){
        array1[i]=(float *) malloc(sizeof (int)*n);
        if(array1[i]==NULL){
            printf("Memory allocation failed.\n");
            exit(1);
        }
    }

    populate(array1,n);
    display(array1,n);
    conversion(array1,n);
    display(array1,n);




    return 0;
}
void  populate(float **array, int n){
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            printf("Enter a value to be stored for A:");
            scanf("%f",&array[i][j]);
        }
    }
}
void display(float **array,int n){
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            printf("%.4f\t",(float)array[i][j]);
        }
        printf("\n");
    }
}
void conversion(float **array, int n){

    float minvalue=array[0][0];
    float maxvalue=array[0][0];
    float cx[n][n];


    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            if(array[i][j]<minvalue){
                minvalue= array[i][j];
            }
        }
    }
    printf("min value is %.1f \n", minvalue);

    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            if(array[i][j]>maxvalue){
                maxvalue= array[i][j];
            }
        }
    }
    printf("max value is %.1f \n", maxvalue);


    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            cx[i][j]=(float)(array[i][j]-minvalue)/(float)(maxvalue-minvalue);
        }
    }
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            array[i][j]=cx[i][j];
        }
    }



}
