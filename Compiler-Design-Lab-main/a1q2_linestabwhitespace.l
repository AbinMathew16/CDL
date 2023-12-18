%{
#include<stdio.h>
int line=0, space=0, tab=0,ch=0,words=0; 
%}
%%
[a-zA-Z0-9]+ {words++;ch+=yyleng;}
\n {line++;} 
([ ])+ {space++;} 
\t {tab++;}
. {ch++;}
%%
int yywrap(){return 1;}
int main()
{
    printf("X-----Start-----X\n");
    yylex();  
    printf("\nNo. of words=%d", words); 
    printf("\nNo. of lines=%d", line); 
    printf("\nNo. of spaces=%d", space);
    printf("\nNo. of tabs=%d", tab);
    printf("\nNo. of caracterss=%d", ch);

     
}