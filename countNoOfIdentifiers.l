%{
    #include<stdio.h>
    int count=0;
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { count++; printf("Identifier found: %s\n",yytext); }
[ \t\n]          ;  // Ignore whitespace
.                { printf("Invalid character: %s\n", yytext); }

%%

int main(){
    yylex();
    printf("Total number of identifiers: %d\n", count);
    return 0;
}
