%{
#include <stdio.h>
int words = 0, lines = 1;
%}
%%
\n          { lines++; }
[^\t\n ]+   { words++; }
.           ;
%%
int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) { printf("File error\n"); return 1; }
        yylex();
        printf("Words: %d\nLines: %d\n", words, lines);
        fclose(yyin);
    } else {
        printf("Usage: ./count <filename>\n");
    }
    return 0;
}
int yywrap() { return 1; }
