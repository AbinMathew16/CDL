%{
#include <stdio.h>
%}

%option noyywrap

%%

[a-zA-Z]+"://"    { printf("Scheme: %s\n", yytext); }
www\.[a-zA-Z0-9.-]+  { printf("Domain: %s\n", yytext); }
[/][a-zA-Z0-9/._-]+    { printf("Path: %s\n", yytext); }
\?[a-zA-Z0-9=&]+     { printf("Query Parameters: %s\n", yytext); }
#[a-zA-Z0-9]+         { printf("Fragment: %s\n", yytext); }

.                    { /* Ignore other characters */ }

%%

int main() {
    printf("Enter a URL: ");
    yylex();
    return 0;
}
