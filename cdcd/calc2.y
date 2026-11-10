%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char *s);
%}
%token NUMBER
%%
input:
      /* empty */
    | input line
    ;
line:
      expression '\n'  { printf("Result = %d\n", $1); }
    ;
expression:
      expression '+' expression  { $$ = $1 + $3; }
    | expression '-' expression  { $$ = $1 - $3; }
    | expression '*' expression  { $$ = $1 * $3; }
    | expression '/' expression  { $$ = $1 / $3; }
    | '(' expression ')'         { $$ = $2; }
    | NUMBER                     { $$ = $1; }
    ;
%%
int main(void)
{
    printf("Enter expression: ");
    return yyparse();
}
void yyerror(char *s)
{
    printf("Error: %s\n", s);
}
