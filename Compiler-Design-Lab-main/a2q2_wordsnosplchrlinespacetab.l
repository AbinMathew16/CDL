%{
#include<stdio.h>
int lines=0, words=0,special=0,space=0,tab=0;
%}
%%


 
\n { lines++; words++;}
([ ])+ {space++;words++;} 
\t {tab++;words++;} 
[A-Z] ;
[a-z] ;
[0-9] ;
. special++;
%%





int main(){
printf("Enter a Paragraph:\n");
yylex();
printf(" This Paragraph contains -->");
printf("\n\t%d lines", lines);
printf("\n\t%d words",words);
printf("\n\t%d special characters",special);
printf("\n\t%d space",space);
printf("\n\t%d tab",tab);
return 0;
}
 
int yywrap(){
return(1);
}
