%option noyywrap

digit [0-9]
letter [A-Za-z]
%{
 
#include<cstdlib>
#include<string> 
#include "y.tab.h"
%}

%%
{digit}+ {
  
   yylval.i = strtol(yytext, NULL, 10);
   return INT;
};

{letter}({letter}|{digit})*  { 

 yylval.s = new std::string(yytext);
 return VAR; 

};

[+*=,:]     return *yytext;


.|\n              ;  /*ignore all the rest*/


%%


