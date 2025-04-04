#include <stdio.h>
int gcd(int, int);
int main(){
    int m,n;
    printf("Enter m and n: ");
    scanf("%d %d",&m,&n);
    printf("GCD of %d and %d is : %d ",m,n,gcd(m,n));

    return 0;

}
int gcd(int m,int n){
    if(m==0)
        return n;
    if(n==0)
        return m;

    if(m==n)
        return m;

    if (m > n)
        return gcd(m - n, n);
    else
        return gcd(m, n - m);

}
