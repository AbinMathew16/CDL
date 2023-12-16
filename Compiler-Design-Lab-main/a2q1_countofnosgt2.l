%{
  #include<stdio.h>
  #include<string.h>
  int len=0, count=0;
%}
  
%%
[a-zA-Z]+ { 
           len=strlen(yytext);
            if(len>2){
	    count++;
	    } 
          }
%%
  
int yywrap (void ){
    return 1;
 }
  
int main(){
  printf("Enter the sentence:\n");
  yylex();
  printf("\nNumber of words whose length is greater than 2 :%d\n",count);
  return 0;
 }