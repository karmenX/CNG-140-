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
void find_negatives(int ar[SIZE]){
     int total=0;
     for(int i=0; i<SIZE; i++){
         if(ar[i]<0)
             total++;
     }
     printf("\nNumber of negatives are %d",total); } int main( ){ int array[SIZE]={};


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
     find_negatives(array);


     return 0;
}
