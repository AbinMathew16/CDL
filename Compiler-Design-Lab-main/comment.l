%{
#include<stdio.h>
int c_count = 0;
%}
%option noyywrap

%%
"/*"[^"*/"]*"*/" {
    c_count++;
}
"//".* {
    c_count++;
}
[^\/\n]+ {
    fprintf(yyout, "%s", yytext);
}

%%

int main(int argc, char **argv)
{
    FILE *f1, *f2;
    if (argc > 1)
    {
        f1 = fopen(argv[1], "r");
        if (!f1)
        {
            printf("file error\n");
            exit(1);
        }
        yyin = f1;

        f2 = fopen(argv[2], "w");
        if (!f2)
        {
            printf("file error\n");
            exit(1);
        }
        yyout = f2;

        yylex();

        fclose(f1);
        fclose(f2);

        printf("number of comment lines: %d\n", c_count);
    }
    return 0;
}
