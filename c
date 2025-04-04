#include <stdio.h>
#include <stdlib.h>
int main(){
    char choice;
    float *currencies,array[]={6.65,4.04,7.26,8.22,0.09,4.68,17.69,0.25,0.06,1.11,0.28,1.28};
    char *names[]={"US Dollar","Australian Dollar","Euro","British Pound","Indian Ruppe","Canadian Dollar","Bahraini Dinar",
                  "Cuban Peso","Japanese Yen","French Franc","Mexican Peso","Brazilian Real"};
    int from,to,amount;
    char *name1,*name2;
    float tempfrom=0,tempto=0,result;

    currencies=array;


    do{
        printf("*******************************************************************\n");
        printf("Currency Exchange Menu\n"
               "Select (c) for conversion\n"
               "Select (e) for exit\n");

        printf("Enter your choice:");
        scanf(" %c",&choice);
        if (choice == 'e' || choice != 'c') {
            break;
        }
        printf("*******************************************************************\n");
        printf("Currency List\n"
               "(1)US Dollar\n"
               "(2)Australian Dollar\n"
               "(3)Euro\n"
               "(4)British Pound\n"
               "(5)Indian Ruppe\n"
               "(6)Canadian Dollar\n"
               "(7)Bahraini Dinar\n"
               "(8)Cuban Peso\n"
               "(9)Japanese Yen\n"
               "(10)French Franc\n"
               "(11)Mexican Peso\n"
               "(12)Brazilian Real\n");
        printf("Enter your choice for currency from: ");
        scanf("%d",&from);
        printf("Enter your choice for currency to: ");
        scanf("%d",&to);
        printf("Enter the amount: ");
        scanf("%d",&amount);

        for(int i=0;i<12;i++){
            if(from==i+1){
                tempfrom=*(currencies+i);
                name1=names[i];
                }

        }
        for(int i=0;i<12;i++){
            if(to==i+1){
                tempto=*(currencies+i);
                name2=names[i];
                }
        }
        
        result=tempfrom*amount/tempto;
        printf("%d %s is %.2f %s\n ",amount,name1,result,name2);


    }while(choice!='c'||choice!='e');

    return 0;
}
