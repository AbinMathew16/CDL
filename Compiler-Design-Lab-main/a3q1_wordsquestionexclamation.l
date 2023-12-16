%{
    #include<stdio.h>
    int c=0;
%}

%%
[a-zA-Z0-9]*(\?|!) {printf("%s \n",yytext);c++;}
.      { continue;}
<<EOF>> { return 0; }
%%

int yywrap(void)
{
return 1;
}

int main(){
    printf("Enter Sentence : \n");
    yylex();
    printf("Total Words Ending with  ? or !  are : %d",c);
}