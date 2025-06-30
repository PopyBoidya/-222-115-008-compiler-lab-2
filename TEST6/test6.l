%option noyywrap

%{
// Roll Number: 1703xxx
#include <stdio.h>
%}

digit       [0-9]+
delim       [ \t\n]
id          [a-zA-Z_][a-zA-Z0-9_]*
operator    [+\-*/=<>%]

%%
"int"                   { printf("%s -> KEYWORD\n", yytext); }
"if"                    { printf("%s -> KEYWORD\n", yytext); }
"else"                  { printf("%s -> KEYWORD\n", yytext); }
"for"                   { printf("%s -> KEYWORD\n", yytext); }
"break"                 { printf("%s -> KEYWORD\n", yytext); }
"return"                { printf("%s -> KEYWORD\n", yytext); }
"scanf"                 { printf("%s -> FUNCTION\n", yytext); }
"printf"                { printf("%s -> FUNCTION\n", yytext); }
{digit}                 { printf("%s -> NUMBER\n", yytext); }
"+"                     { printf("%s -> ADD\n", yytext); }
"-"                     { printf("%s -> SUBTRACT\n", yytext); }
"*"                     { printf("%s -> MULTIPLY\n", yytext); }
"/"                     { printf("%s -> DIVIDE\n", yytext); }
"%"                     { printf("%s -> MODULO\n", yytext); }
"="                     { printf("%s -> ASSIGN\n", yytext); }
"<="                    { printf("%s -> LESS_EQUAL\n", yytext); }
">="                    { printf("%s -> GREATER_EQUAL\n", yytext); }
"<"                     { printf("%s -> LESS\n", yytext); }
">"                     { printf("%s -> GREATER\n", yytext); }
"("                     { printf("%s -> LEFT_PAREN\n", yytext); }
")"                     { printf("%s -> RIGHT_PAREN\n", yytext); }
"{"                     { printf("%s -> LEFT_BRACE\n", yytext); }
"}"                     { printf("%s -> RIGHT_BRACE\n", yytext); }
";"                     { printf("%s -> SEMICOLON\n", yytext); }
","                     { printf("%s -> COMMA\n", yytext); }
{delim}                 { /* ignore whitespace */ }
{id}                    { printf("%s -> IDENTIFIER\n", yytext); }
.                       { printf("%s -> UNKNOWN\n", yytext); }

%%

int main()
{
    yylex();
    return 0;
}
