%option noyywrap

%{
// Roll Number: 1703xxx
#include <stdio.h>
%}

digit       [0-9]+
delim       [ \t\n]

%%
"int"                   { printf("%s -> KEYWORD\n", yytext); }
"for"                   { printf("%s -> KEYWORD\n", yytext); }
"return"                { printf("%s -> KEYWORD\n", yytext); }
"scanf"                 { printf("%s -> FUNCTION\n", yytext); }
"printf"                { printf("%s -> FUNCTION\n", yytext); }
{digit}                 { printf("%s -> NUMBER\n", yytext); }
"+"                     { printf("%s -> ADD OPERATOR\n", yytext); }
"-"                     { printf("%s -> SUBTRACT OPERATOR\n", yytext); }
"="                     { printf("%s -> ASSIGNMENT OPERATOR\n", yytext); }
";"                     { printf("%s -> SEMICOLON\n", yytext); }
"("                     { printf("%s -> LEFT PARENTHESIS\n", yytext); }
")"                     { printf("%s -> RIGHT PARENTHESIS\n", yytext); }
"{"                     { printf("%s -> LEFT BRACE\n", yytext); }
"}"                     { printf("%s -> RIGHT BRACE\n", yytext); }
"<="                    { printf("%s -> LESS THAN OR EQUAL\n", yytext); }
"<"                     { printf("%s -> LESS THAN\n", yytext); }
">"                     { printf("%s -> GREATER THAN\n", yytext); }
","                     { printf("%s -> COMMA\n", yytext); }
{delim}                 { /* Ignore whitespace */ }
.                       { printf("%s -> UNKNOWN\n", yytext); }

%%

int main()
{
    yylex();
    return 0;
}
