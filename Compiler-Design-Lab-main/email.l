%{
#include <stdio.h>
%}

%option noyywrap

%%
[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}    { printf("Valid Email: %s\n", yytext); }
.+                                            { printf("Invalid Email: %s\n", yytext); }

%%


int main() {
    printf("Enter an email address: ");
    yylex();
    return 0;
}
