%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s);
%}
%token NUM VAR
%left '+' '-'
%left '*' '/'
%%
input: 
    | input line
    ;
line: '\n'
    | expr '\n'  { printf("Result: %d\n", $1); }
    | VAR '\n'  { printf("(b) Valid Variable Recognized\n"); }
    ;
expr: expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '(' expr ')'  { $$ = $2; }
    | NUM           { $$ = $1; }
    ;
%%
void yyerror(const char *s) { printf("Error: %s\n", s); }
int main() {
    printf("Enter expression (e.g., 2+3*4) or a variable name:\n");
    yyparse();
    return 0;
}
