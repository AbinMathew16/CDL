%{
#include <stdio.h>
%}

%token SCHEME DOMAIN PATH QUERY FRAGMENT EOL INVALID

%%
url:
    SCHEME DOMAIN PATH QUERY FRAGMENT EOL {
        printf("Scheme: %s\n", $1);
        printf("Domain: %s\n", $2);
        printf("Path: %s\n", $3);
        printf("Query Parameters: %s\n", $4);
        printf("Fragment: %s\n", $5);
        printf("Valid URL\n");
    }
    | INVALID EOL {
        printf("Invalid URL\n");
    }
    ;

%%

int main() {
    yyparse();
    return 0;
}
