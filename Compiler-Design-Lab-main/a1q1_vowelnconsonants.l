%{
    #include<stdio.h>
    int vowel=0,consonent =0;
%}
%%
[aeiouAEIOU] { printf("vowel\t");vowel++;}
[a-zA-Z] {printf("consonent\t");consonent++;}
%%
int yywrap(){}
int main()
{
    printf("Enter the string comprising english alphabet\n");
    yylex();
    printf("Number of vowels are:  %d\n", vowel);
    printf("Number of consonants are:  %d\n", consonent);
    return 0;
} 