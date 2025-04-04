#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SIZE 10
int main(){

    float miles[]={240.5, 300.0, 189.6, 310.6, 280.7, 216.9, 199.4, 160.3, 177.4, 192.3};
    float gallons[]={ 10.3, 15.6, 9.7, 14, 16.3, 15.7, 14.9, 10.7, 9.3, 9.4};
    float mpg[SIZE];

    printf("miles: [");
    for(int i=0;i<SIZE;i++){
        printf("%.1f",*(miles+i));
        if(i<SIZE-1)
        printf(",");
    }
    printf("]");
    printf("\n");

    printf("gallons: [");
    for(int i=0;i<SIZE;i++){
        printf("%.1f",*(gallons+i));
        if(i<SIZE-1)
            printf(",");
    }
    printf("]");
    printf("\n");

    for(int i=0;i<SIZE;i++){
        *(mpg+i)=(*(miles+i))/(*(gallons+i));
    }

    printf("mpg: [");
    for(int i=0;i<SIZE;i++){
        printf("%.2f",*(mpg+i));
        if(i<SIZE-1)
            printf(",");
    }
    printf("]");
    printf("\n");

    return 0;
}
