#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#define TASK 10

struct Data{
    int task_number;
    int arrival_time;
    int service_time;
    double arrival_rate;
    double service_rate;
};

void populate(struct Data *array);
void compute(struct Data *array);
void display(struct Data *array);

int main() {

    struct Data array[TASK];
    srand(time(NULL));

    populate(array);
    compute(array);
    printf("Data is as follows:\n"
           "-------------------\n");
    display(array);


    return 0;
}
void populate(struct Data *array){

    for(int i=0;i<TASK;i++){
        array[i].task_number=i+1;
        array[i].arrival_time=rand()%11;
        array[i].service_time=rand()%11;
        array[i].arrival_rate=0;
        array[i].service_rate=0;
    }
}

void compute(struct Data *array){

    for(int i=0;i<TASK;i++){
        array[i].arrival_rate= (double ) array[i].arrival_time/ array[i].service_time;
        array[i].service_rate= (double ) 1/array[i].service_time;
    }

}

void display(struct Data *array){

    for(int i=0;i<TASK;i++){
        printf("Task %d: \n",i+1);
        printf("Arrival time: %d\n",array->arrival_time);
        printf("Service time: %d\n",array->service_time);
        printf("Arrival rate: %.2f\n",array->arrival_rate);
        printf("Service rate: %.2f\n",array->service_rate);

    }
}
