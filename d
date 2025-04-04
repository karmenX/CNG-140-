#include <stdio.h>
#include <math.h>
#define SIZE 10

int main(){

    int heights[SIZE] = {145, 150, 155, 160, 165, 170, 175, 180, 185, 190};
    int weights[SIZE] = {45, 50, 55, 60, 65, 70, 75, 80, 85, 90};
    int bmi[SIZE][SIZE];
    float x,bmivalue;
    int value=0;

    printf("BMI Table for height 145-190 cm and weight 45-90 kg:\n"
           "(-1): Underweight range\n"
           "(0) : Healthy Weight range\n"
           "(1) : Overweight range\n"
           "(2) : Obese range\n");

            for(int i=0;i<SIZE;i++){
                for(int j=0;j<SIZE;j++){
                    x = heights[i] / 100.0;
                    bmivalue=weights[j]/pow(x, 2);
                    if(bmivalue<=18.4)
                        bmi[i][j]=-1;
                    else if(bmivalue<=24.9)
                        bmi[i][j]=0;
                    else if(bmivalue<=29.9)
                        bmi[i][j]=1;
                    else
                        bmi[i][j]=2;
                }
            }
            printf("     ");
            for(int i=0;i<SIZE;i++){
                printf("%4d ",weights[i]);
            }

            printf("\n");

            for (int i = 0; i < SIZE; i++) {
                printf("%3d |", heights[i]);
                for (int j = 0; j < SIZE; j++) {
                    printf("%4d ", bmi[i][j]);
                }
                printf("\n");
            }


    return 0;
}
