%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}
%token ID
%%
E : E '+' T | E '-' T | T ;
T : T '*' F | T '/' F | F ;
F : '(' E ')' | ID ;
%%
void yyerror(const char *s) { printf("Error: %s\n", s); }
int main() {
    printf("Enter expression: ");
    yyparse();
    printf("Parsing Successful!\n");
    return 0;
}
int yylex() {
    int c = getchar();
    if (c == ' ' || c == '\t') return yylex();
    if (c >= 'a' && c <= 'z') return ID;
    return c;
}
