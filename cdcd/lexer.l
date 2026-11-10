%{
#include <stdio.h>
%}

%%
"/*"([^*]|\*+[^*/])*\*+"/"    { printf("COMMENT: %s\n", yytext); }
"//".*                        { printf("COMMENT: %s\n", yytext); }
[0-9]+(\.[0-9]+)?             { printf("CONSTANT: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*        { printf("IDENTIFIER: %s\n", yytext); }
"=="|"!="|"<="|">="|"+"|"-"|"*"|"/"|"="|"<"|">" { printf("OPERATOR: %s\n", yytext); }
[ \t\n]+                      { /* Ignore whitespace */ }
.                             { printf("UNKNOWN: %s\n", yytext); }

%%
int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) { printf("File not found\n"); return 1; }
    } else {
        printf("Enter code (Ctrl+D to end):\n");
    }
    yylex();
    return 0;
}
int yywrap() { return 1; }
