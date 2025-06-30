%option noyywrap

%{
// Roll Number: 1703xxx
#include <stdio.h>
%}

digit       [0-9]+
delim       [ \t\n]
id          [a-zA-Z_][a-zA-Z0-9_]*
operator    [+\-*/=<>]

%%
"int"                   { printf("%s -> KEYWORD\n", yytext); }
"printf"                { printf("%s -> FUNCTION\n", yytext); }
"scanf"                 { printf("%s -> FUNCTION\n", yytext); }
"return"                { printf("%s -> KEYWORD\n", yytext); }
{digit}                 { printf("%s -> NUMBER\n", yytext); }
"+"                     { printf("%s -> ADD\n", yytext); }
"="                     { printf("%s -> ASSIGNMENT OPERATOR\n", yytext); }
";"                     { printf("%s -> SEMICOLON\n", yytext); }
","                     { printf("%s -> COMMA\n", yytext); }
"("                     { printf("%s -> LEFT PARENTHESIS\n", yytext); }
")"                     { printf("%s -> RIGHT PARENTHESIS\n", yytext); }
"{"                     { printf("%s -> LEFT BRACE\n", yytext); }
"}"                     { printf("%s -> RIGHT BRACE\n", yytext); }
{delim}                 { /* ignore whitespace */ }
{id}                    { printf("%s -> IDENTIFIER\n", yytext); }
.                       { printf("%s -> UNKNOWN\n", yytext); }

%%

int main()
{
    yylex();
    return 0;
}
