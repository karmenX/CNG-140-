#include <stdio.h>
float  Legendre(float x,float n);
int main(){
    float x,n;

    do{
        printf("Please enter x [-1,1]: ");
        scanf("%f",&x);
        if(x<-1 || x>1)
            printf("This x value is not valid!\n");
    }while(x>1 || x<-1);

    do{
        printf("Please enter n: ");
        scanf("%f",&n);
        if(n<2)
            printf("This n value is not valid!\n");

    }while(n<2);
    printf("The first %.0f are as follows:\n",n);
for(int i=1; i<=n;i++){
    printf("x=%f\t n=%d\t P(%d)= %f \n",x,i,i, Legendre(x,i));
}
    return 0;

}


float Legendre(float x, float n) {
    if(n==0)
        return 1;
    if(n==1)
        return x;
return  (((2*n)-1)/n)*Legendre(x,n-1) - ((n-1)/n)*Legendre(x,n-2);


}
