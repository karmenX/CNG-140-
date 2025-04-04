#include <stdio.h>
#define SIZE 20

int is_alphabet(char *);
void clean_string(char *);

int main(){

    char string[SIZE];
    int found;
    printf("Please enter your string: ");
    scanf("%s",string);
    found=is_alphabet(string);
    if(found==1){
        printf("not alphabetic found\n");
        clean_string(string);
        printf("Cleaned string is %s",string);
    }
    else
        printf(" alphabetic \n");
    
    return 0;
}
int is_alphabet(char *array){
    printf("the string is: %s\n",array);
    for(int i=0; array[i]!='\0'; i++) {
        if (!((array[i]>='a' && array[i]<='z' )|| (array[i]>='A' && array[i]<='Z'))) {
            return 1;

        }
    }
 return 0;
    }

void clean_string(char *array){

    char tmp[SIZE];
    int j=0;
    for(int i=0; array[i]!='\0'; i++) {
        if ((array[i] >= 'a' && array[i] <= 'z') || (array[i] >= 'A' && array[i] <= 'Z')) {
            tmp[j++]= array[i];
        }
    }
    tmp[j]='\0';
    for (int i = 0; i < SIZE; ++i) {
        array[i]= tmp[i];

    }

}
