#include <stdio.h>
#define SIZE 10
void search_array(int ar[SIZE]){
     int check=0,input;
     printf("Enter a number to search: ");
     scanf("%d",&input);
     for(int i=0; i<10; i++) {
         if(ar[i]==input){
             check=1;
             break;
         }
     }
     if(check==1)
         printf("Number %d is in the array!",input);
     else
         printf("Number %d is not in the array!",input);

}
int main( ){
int array[SIZE]={};


     for (int i=0; i<10; i++){
         printf("Enter  number %d to populate:",i+1);
         scanf("%d",&array[i]);
     }
     printf("the array is : \n");
     for (int i=0; i<10; i++){
         printf("%d\t",array[i]);
     }
     printf("\n");
     search_array(array);


     return 0;
}
