%{
  #include<stdio.h>
  #include<string.h>
  int len=0, ans=-1;
%}

%%
[a-zA-Z]+ { len=strlen(yytext);
            if(ans<len)
	    ans=len;}
%%
  
int yywrap (void ){
    return 1;
 }
  
int main(){
  printf("Enter the sentence:\n");
  yylex();
  printf("\nmaximum number of characters present in the longest word is : %d", ans);
  return 0;
 }