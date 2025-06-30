%option noyywrap

%{
// Roll Number: 1703xxx
#include <stdio.h>
%}

digit      [0-9]
letter     [a-zA-Z_]
id         {letter}({letter}|{digit})*
delim      [ \t]
newline    \n
string     \"([^\"\n]|\\\")*\"

%%

"int"                       { printf("%s -> KEYWORD\n", yytext); }
"return"                    { printf("%s -> KEYWORD\n", yytext); }
"printf"|"scanf"            { printf("%s -> FUNCTION\n", yytext); }
{digit}+                    { printf("%s -> NUMBER\n", yytext); }
{id}                        { printf("%s -> IDENTIFIER\n", yytext); }
"="                         { printf("%s -> ASSIGN\n", yytext); }
"+"                         { printf("%s -> ADD\n", yytext); }
"-"                         { printf("%s -> SUB\n", yytext); }
"*"                         { printf("%s -> MUL\n", yytext); }
"/"                         { printf("%s -> DIV\n", yytext); }
"("                         { printf("%s -> LPAREN\n", yytext); }
")"                         { printf("%s -> RPAREN\n", yytext); }
"{"                         { printf("%s -> LBRACE\n", yytext); }
"}"                         { printf("%s -> RBRACE\n", yytext); }
","                         { printf("%s -> COMMA\n", yytext); }
";"                         { printf("%s -> SEMICOLON\n", yytext); }
{string}                    { printf("%s -> STRING\n", yytext); }
{delim}                     { /* skip space or tab */ }
{newline}                   { /* skip newline */ }
.                           { printf("%s -> UNKNOWN\n", yytext); }

%%

int main()
{
    yylex();
    return 0;
}
