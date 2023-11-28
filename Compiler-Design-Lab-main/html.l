%{
#include <stdio.h>
%}

%%
<[^>]+>    { printf("HTML Tag: %s\n", yytext); }
.          { continue; }
<<EOF>>    { return 0; }
%%

int yywrap(void) {
    return 1;
}

int main() {
    printf("Enter HTML String: \n");
    yylex();
    return 0;
}