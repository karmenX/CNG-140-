#include <stdio.h>
int reverse(int);
int main(){
    int number;
    printf("Please enter a value of x: ");
    scanf("%d",&number);
    printf("f(%d)= %d ",number, reverse(number) );


    return 0;

}
int reverse(int number){
    int f=0;
    if(number<=0)
        return 0;
    else
        f= reverse(number-1)+2;
        return f;


}
