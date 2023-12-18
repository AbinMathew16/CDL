%{
#include <stdio.h>
%}

%option noyywrap

%%
[ \t]+   ; /* Ignore spaces and tabs */
\n       ; /* Ignore newlines */
.        { fprintf(yyout, "%c", yytext[0]); } /* Print other characters to the output file */
%%

int main(int argc, char **argv) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s input_file output_file\n", argv[0]);
        return 1;
    }

    FILE *inputFile = fopen(argv[1], "r");
    if (!inputFile) {
        perror("Error opening input file");
        return 1;
    }

    FILE *outputFile = fopen(argv[2], "w");
    if (!outputFile) {
        perror("Error opening output file");
        fclose(inputFile);
        return 1;
    }

    yyin = inputFile;
    yyout = outputFile;

    yylex();

    fclose(inputFile);
    fclose(outputFile);

    return 0;
}
