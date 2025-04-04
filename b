#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_SIZE 4

struct address_t{

    char nickname[10];
    int xx;
    int yy;
    int zz;
    int mm;

};

void scan_address(struct address_t *data, int *count);
void print_message(struct address_t *address1, struct address_t *address2);
int local_address(struct address_t *address1, struct address_t *address2);


int main(){

    struct address_t array[MAX_SIZE];
    int count=0;

    for(int i=0;i<MAX_SIZE;i++){
        strcpy(array[i].nickname,"none");
        array[i].xx=0;
        array[i].yy=0;
        array[i].zz=0;
        array[i].mm=0;
    }
    scan_address(array,&count);
    for(int i=0;i<MAX_SIZE;i++){
        for(int j=i+1;j<MAX_SIZE;j++){
            if(local_address(&array[i],&array[j])){
                print_message(&array[i],&array[j]);
                break;}
        }
    }



    return 0;
}

void scan_address(struct address_t *data,int *count){

    FILE *stream= fopen("internet.txt","r");
    if(stream==NULL){
        printf("Failed to open the file\n");
        exit(1);
    }
    while(*count<MAX_SIZE){
    fscanf(stream,"%d.%d.%d.%d\t%s\n",&data[*count].xx,&data[*count].yy,&data[*count].zz,&data[*count].mm,data[*count].nickname);
    (*count)++;
    }
    fclose(stream);
}

int local_address(struct address_t *address1, struct address_t *address2){

    if(address1->xx==address2->xx && address1->yy== address2->yy )
            return 1;

    return 0;

}

void print_message(struct address_t *address1, struct address_t *address2){

        printf(" %s, %s, are on the same local network.",address1->nickname,address2->nickname);
        return;

}
