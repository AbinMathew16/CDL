%{
#include<stdio.h>
#include<stdlib.h>
%}
%token a b;
%%
input: S'\n'{printf("Accepted\n");exit(0);}
S: a S1 b | b
S1: ;| a S1
%%
main(){
    printf("Enter a String: ");
    yyparse();
}
int yyerror(){
    printf("Error!\n");
    exit(0);
}