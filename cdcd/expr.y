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
      expression '\n'  { printf("valid arithmetic expression\n"); }
    ;
expression:
      expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | '(' expression ')'
    | NUMBER
    ;
%%
int main(void)
{
    printf("Enter an expression: ");
    return yyparse();
}
void yyerror(char *s)
{
    printf("Invalid expression\n");
}
