%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char *s);
%}
%token LETTER DIGIT
%%
input:
      /* empty */
    | input line
    ;
line:
      variable '\n'  { printf("valid variable\n"); }
    ;
variable:
      LETTER
    | variable LETTER
    | variable DIGIT
    ;
%%
int main(void)
{
    printf("Enter a variable: ");
    return yyparse();
}
void yyerror(char *s)
{
    printf("Invalid variable\n");
}
