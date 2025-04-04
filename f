#include <stdio.h>
#include <stdlib.h>
int main(){

  int courses,credits=0;
  int *grades,*credit;
  float *coefficients,gpa,sum=0;
    printf("*******************************************************************\n"
           "GPA CALCULATOR\n"
           "*******************************************************************\n");
    printf("Enter number of courses: ");
    scanf("%d",&courses);

    grades=(int *) malloc(sizeof(int)*courses);
    credit=(int *) malloc(sizeof(int)*courses);
    coefficients=(float *) malloc(sizeof(int)*courses);

    if(grades==NULL||credit==NULL||coefficients==NULL){
        printf("Memory allocation failed.\n");
        exit(1);
    }

    for(int i=0;i<courses;i++){
        printf("Enter grade for course %d:",i+1);
        scanf("%d",&*(grades+i));
    }

    printf("\n");

    for(int i=0;i<courses;i++){
        printf("Enter credit for course %d:",i+1);
        scanf("%d",&*(credit+i));
    }

    for(int i=0;i<courses;i++) {
        if (*(grades + i) <= 49)
            *(coefficients + i) = 0.0;
        else if (*(grades + i) <= 59)
            *(coefficients + i) = 0.5;
        else if (*(grades + i) <= 64)
            *(coefficients + i) = 1.0;
        else if (*(grades + i) <= 69)
            *(coefficients + i) = 1.5;
        else if (*(grades + i) <= 74)
            *(coefficients + i) = 2.0;
        else if (*(grades + i) <= 79)
            *(coefficients + i) = 2.5;
        else if (*(grades + i) <= 84)
            *(coefficients + i) = 3.0;
        else if (*(grades + i) <= 89)
            *(coefficients + i) = 3.5;
        else
            *(coefficients + i) = 4.0;
    }
        for(int i=0;i<courses;i++){
            float numerator;
            numerator=*(coefficients+i)* *(credit+i);
            sum+=numerator;
    }
    for(int i=0;i<courses;i++){
        credits+=*(credit+i);
    }
        gpa=sum/credits;
    printf("*******************************************************************\n"
           "Your GPA is %.2f\n"
           "*******************************************************************",gpa);




    return 0;
}
