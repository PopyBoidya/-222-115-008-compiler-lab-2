%option noyywrap

%{
#include <stdio.h>
%}

digit       [0-9]+
delim       [ \t\n]
id          [a-zA-Z_][a-zA-Z0-9_]*
operator    [+\-*/=<>%]
special     [;{}()]

%%

"int"                   { printf("%s -> KEYWORD\n", yytext); }
"if"                    { printf("%s -> KEYWORD\n", yytext); }
"else"                  { printf("%s -> KEYWORD\n", yytext); }
"for"                   { printf("%s -> KEYWORD\n", yytext); }
"return"                { printf("%s -> KEYWORD\n", yytext); }
"printf"                { printf("%s -> FUNCTION\n", yytext); }
{digit}                 { printf("%s -> NUMBER\n", yytext); }
{operator}              { printf("%s -> OPERATOR\n", yytext); }
{special}               { printf("%s -> SPECIAL SYMBOL\n", yytext); }
{id}                    { printf("%s -> IDENTIFIER\n", yytext); }
{delim}                 { /* ignore whitespace */ }

.                       { printf("%s -> UNKNOWN\n", yytext); }

%%

int main()
{
    yylex();
    return 0;
}
