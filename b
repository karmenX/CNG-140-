#include <stdio.h>
#include <stdlib.h>


struct Date
{
    int month;
    int day;
    int year;
};
int dayscalculated(struct Date birthday);

int main() {
    struct Date birth;
    int days=0;

    printf("Enter your birthday: ");
    scanf("%d / %d / %d",&birth.month,&birth.day,&birth.year);

    switch (birth.month) {
        case 1:
            printf("You are born in January!");
            break;
        case 2:
            printf("You are born in February!");
            break;
        case 3:
            printf("You are born in March!");
            break;
        case 4:
            printf("You are born in April!");
            break;
        case 5:
            printf("You are born in May!");
            break;
        case 6:
            printf("You are born in June!");
            break;
        case 7:
            printf("You are born in July!");
            break;
        case 8:
            printf("You are born in August!");
            break;
        case 9:
            printf("You are born in September!");
            break;
        case 10:
            printf("You are born in October!");
            break;
        case 11:
            printf("You are born in November!");
            break;
        case 12:
            printf("You are born in December!");
            break;
        default:
            printf("Enter a month between 1-12!");
            exit(1);
    }
    printf("\n");

    days=dayscalculated( birth);
    printf("You were born %d days later than 1/1/1900!",days);


    return 0;
}
int dayscalculated(struct Date birthday){

    int total,a=(birthday.year-1900),b=(birthday.month-1),c=(birthday.day-1);
    total=(a*365)+(b*30)+c;

return total;
}
