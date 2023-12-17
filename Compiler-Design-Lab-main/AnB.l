%{
#include "AnB.tab.h"
%}
%option noyywrap
%%
a {return a;}
b {return b;}
[\n] {return '\n';}
%%
