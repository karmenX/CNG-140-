#include <stdio.h>
double savings(int w, double initial_savings);
void analysis(double savings, int bike_price);

int main(){

    int bike,week;
    double initial,saving=0;
    char ch;

    printf("Welcome to Bike analyser!\n");

    do{
        do{
            printf("Enter your initial savings:");
            scanf("%lf",&initial);
            if(initial<=0)
                printf("Sorry you cannot enter %.2f!\n",initial);

        }while(initial<=0);


                printf("Number of weeks: ");
                scanf("%d",&week);

                saving = savings(week, initial);
                printf("At the end of week %d, savings will be %.2f TL\n",week,saving);

                printf("Enter the price of the bike:");
                scanf("%d", &bike);

                analysis(saving, bike);
                
                printf("Do you want to try again?");
                do{

                    scanf(" %c", &ch);

                    if(ch=='N'||ch=='n'){
                        printf("Byee!");
                        break;
                    }
                    else if(ch!='y'&&ch!='Y')
                        printf("Not valid input! Try again!\n");

                }while(ch!='n' && ch!='N' && ch!='y' &&ch!='Y');

    }while (ch == 'Y' || ch == 'y');

    return 0;
}
double savings(int w, double initial_savings){
if(w<=0)
    return initial_savings;

    return (1.1* savings(w-1,initial_savings)+20);
}
void analysis(double savings, int bike_price){

    if(savings>=bike_price)
        printf("You can buy the bike!!\n");
    else
        printf("Oops! Save more money!\n");

}
