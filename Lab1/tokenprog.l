%{
#include<stdio.h>
%}
digit [0-9]
letter [A-Za-z]
%option noyywrap
%%

"class"|"return"|"if"|"else"|"for"|"void"|"scanf"    {printf("\nKeyword : %s",yytext);}
"private"|"public"|"protected"                       {printf("\nAccess modifier : %s",yytext);}
"{"|"}"|"["|"]"|"("|")"|"&"                          {printf("\nSpecial symbol : %s",yytext);}
"+"|"-"|"/"|"*"|"%"                                  {printf("\nArithmetic operator : %s",yytext);}
#.*                                                  {printf("\nPre-processor directive : %s",yytext);}
[,;]                                                 {printf("\nDelimiter: %s",yytext);}
[ \t\n]                                              ; 
"int"|"char"|"float"|"bool"|"double"|"String"        {printf("\nData type : %s",yytext);}
"="                                                  {printf("\nAssignment operator : %s",yytext);}
"<"|">"|">="|"<="|"=="|"!="                          {printf("\nRelational operator : %s",yytext);}
"//".*                                               {printf("\nSingle line comment : %s",yytext);}
"/*"(.|\n)*"*/"                                      {printf("\nMulti-line comment : %s",yytext);}
{digit}*\.{digit}+                                   {printf("\nFloat : %s",yytext);}
{digit}*                                             {printf("\nInteger : %s",yytext);}
'{letter}'                                           {printf("\nCharacter : %s",yytext);}
\".*\"                                               {printf("\nString : %s",yytext);}
{letter}({letter}|{digit})*                          {printf("\nIdentifier : %s",yytext);}
{letter}({letter}|{digit})*/\(.*\)                   {printf("\nFunction : %s",yytext);}

%%

int main()
{
extern FILE *yyin, *yyout;
yyin=fopen("input.txt","r");
yyout =fopen("output.txt","w");
yylex();
return 0;
}
