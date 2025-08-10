%{
    #include<stdio.h>
%}

%%
"//".* {printf("single line comment");}
"/*"([^*]|\*+[^*/])*\*+"/" {printf("multi line comment");}

%%

int main(){
    yylex();
    return 0;
}