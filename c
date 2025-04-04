#include<stdio.h>
#define SIZE 100
#include <string.h>

void remove_comment(char *string);

int main(){

    char message[SIZE];

    printf("Please enter a C statement: ");
    gets(message);
    remove_comment(message);

    puts(message);


    return 0;
}


void remove_comment(char *string) {

  char tmp[strlen(string)+1];
  int incomment=0,j=0;

      for (int i = 0; i < strlen(string) ; i++) {

          if (string[i] == '/' && string[i+1]=='*'){
              incomment=1;
              i++;
      }
          else if(string[i]=='*' && string[i+1]=='/'){
                incomment=0;
              i++;
          }
          else if(!incomment){
              tmp[j++]= string[i];
          }

      }
    tmp[j]='\0';

    strcpy(string,tmp);


}
