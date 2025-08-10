%{
#include <stdio.h>
FILE *fp;
%}

DATATYPE    (int|float|double)
ID          [a-zA-Z_][a-zA-Z0-9]*

FUNC0       {DATATYPE}[ \t]+{ID}[ \t]*\([ \t]*\)
FUNC1       {DATATYPE}[ \t]+{ID}[ \t]*\([ \t]*{DATATYPE}[ \t]+{ID}[ \t]*\)
FUNC2       {DATATYPE}[ \t]+{ID}[ \t]*\([ \t]*{DATATYPE}[ \t]+{ID}[ \t]*,[ \t]*{DATATYPE}[ \t]+{ID}[ \t]*\)

%%

{FUNC2}   {printf("Function with 2 arguments\n");}
{FUNC1}   {printf("Function with 1 argument\n");}
{FUNC0}   {printf("Function with 0 arguments\n");}
.|\n      ;   // ignore all other characters

%%


int main() {
    yyin=fopen("input.txt", "r");
    yylex();
    yyout=fopen(fp,"output.txt", "w");
    // yylex();
    return 0;
}
