%{
#include <stdio.h>
#include <string.h>

FILE *yyin;
FILE *out;
int valid_found = 0;

// Function to replace last 4 digits with #
void mask_and_write(const char *text) {
    int len = strlen(text);
    char masked[50];
    strcpy(masked, text);
    if (len >= 4) {
        masked[len-1] = '#';
        masked[len-2] = '#';
        masked[len-3] = '#';
        masked[len-4] = '#';
    }
    fprintf(out, "%s", masked);
}
%}

%%
[a-zA-Z_]{2}[0-9]{2}[a-zA-Z_]{2}[0-9]{4} {
    valid_found = 1;
    printf("Valid number plate: %s\n", yytext);
    mask_and_write(yytext);  // Mask and write to file
}

[a-zA-Z_]{2}-[0-9]{2}-[a-zA-Z_]{2}-[0-9]{4} {
    valid_found = 1;
    printf("Valid number plate: %s\n", yytext);
    mask_and_write(yytext);  // Mask and write to file
}

[a-zA-Z_]{2}[ ][0-9]{2}[ ][a-zA-Z_]{2}[ ][0-9]{4} {
    valid_found = 1;
    printf("Valid number plate: %s\n", yytext);
    mask_and_write(yytext);  // Mask and write to file
}

.|\n {
    fprintf(out, "%s", yytext); // Write other content as-is
}
%%

int main() {
    yyin = fopen("car.txt", "r");
    if (!yyin) {
        printf("Error: Cannot open input.txt\n");
        return 1;
    }

    out = fopen("output.txt", "w");
    if (!out) {
        printf("Error: Cannot open output.txt\n");
        fclose(yyin);
        return 1;
    }

    yylex();

    if (!valid_found) {
        printf("No valid number plate found.\n");
    }

    fclose(yyin);
    fclose(out);
    return 0;
}