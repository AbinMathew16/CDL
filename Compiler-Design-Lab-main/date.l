%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%option noyywrap

%%
[0-3]?[0-9][/][0-1]?[0-9][/][0-9]{4} {
    char dateCopy[20];  // Assuming a reasonable maximum length for the date
    strcpy(dateCopy, yytext);

    int day = atoi(strtok(dateCopy, "/"));
    int month = atoi(strtok(NULL, "/"));
    int year = atoi(strtok(NULL, "/"));

    if (month < 1 || month > 12 || day < 1 || day > 31) {
        printf("%s is not a valid date.\n", yytext);
    } else if ((month == 4 || month == 6 || month == 9 || month == 11) && day > 30) {
        printf("%s is not a valid date.\n", yytext);
    } else if (month == 2) {
        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            if (day > 29) {
                printf("%s is not a valid date.\n", yytext);
            }
        } else {
            if (day > 28) {
                printf("%s is not a valid date.\n", yytext);
            }
        }
    }
    else {
        printf("%s is a valid date.\n", yytext);
    }
}
.|\n { /* Ignore other characters */ }

%%

int main() {
    yylex();
    return 0;
}
