%{
    #include<stdio.h>
    #include<string.h>
    int count=0, noofchar=0;
    FILE *fp;
%}

%% 
[^ \t\n]+ { count++; noofchar=noofchar+yyleng; printf("Word found: %s\n",yytext);}
%%

int main(){
    yyin=fopen("cWords.txt", "r");
    yylex();
    printf("Total number of words: %d\n", count);
    fp=fopen("wordOutput.txt", "w");
    fprintf(fp, "Total number of words: %d\n", count);
    fprintf(fp, "Total number of characters: %d\n", noofchar);
    fclose(fp);
    fclose(yyin);
    printf("Output written to wordOutput.txt\n");
    return 0;
}
