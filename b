//without handling zeros

#include <stdio.h>
int reverse(int, int);
int main(){
    int number,reversed=0;
    printf("Enter a positive integer: ");
    scanf("%d",&number);

    printf("Reverse of the number is: ");
    reversed= reverse(number,reversed);
    printf("%d",reversed);

    return 0;

}
int reverse(int number, int reversed){
    if(number==0)
        return reversed;

    reversed=reversed*10+(number%10);

    return reverse(number/10,reversed);

}
