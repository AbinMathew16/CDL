%{
#include <stdio.h>
#include <stdlib.h>

#define MAX_STACK_SIZE 100

char stack[MAX_STACK_SIZE];
int top = -1;

void push(char c) {
    if (top < MAX_STACK_SIZE - 1) {
        stack[++top] = c;
    } else {
        fprintf(stderr, "Error: Stack overflow.\n");
        exit(EXIT_FAILURE);
    }
}

char pop() {
    if (top >= 0) {
        return stack[top--];
    } else {
        fprintf(stderr, "Error: Stack underflow.\n");
        exit(EXIT_FAILURE);
    }
}

%}

%%
[()] { push(yytext[0]); }
[{}] { push(yytext[0]); }
[\[\]] { push(yytext[0]); }
\n {
    while (top >= 0) {
        char c = pop();
        if (c == '(' || c == '{' || c == '[') {
            printf("Syntax error: Unbalanced symbols.\n");
            return 0;
        }
    }
    printf("Syntax is correct.\n");
}
. { continue; }
%%
yywrap(){return 1;}
int main() {
    printf("Enter your code:\n");
    yylex();
    return 0;
}
