%{
#include <stdio.h>
%}

DIGIT       [0-9]+
ID          [a-zA-Z_][a-zA-Z_0-9]*
DATATYPE    (int|float|double)
KEYWORD     (if|else|while|do|for|switch)
RELOP       (==|!=|>=|<=|>|<)
HEADER      (<stdio\.h>|<stdlib\.h>|<string\.h>)

%%

{HEADER}    { printf("Header file: %s\n", yytext); }
{DATATYPE}  { printf("Data type: %s\n", yytext); }
{KEYWORD}   { printf("Keyword: %s\n", yytext); }
{RELOP}     { printf("Relational operator: %s\n", yytext); }
{ID}        { printf("Identifier: %s\n", yytext); }
{DIGIT}     { printf("Digit: %s\n", yytext); }

[ \t\n]+    { /* ignore whitespace */ }
.           { /* ignore other characters */ }

%%

int main() {
    yylex();
    return 0;
}
