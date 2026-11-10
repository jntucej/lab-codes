%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char *s);
%}
%token ID PLUS MUL LP RP
%%
E: E PLUS T   { printf("E -> E + T\n"); }
 | T          { printf("E -> T\n");     }
 ;
T: T MUL F    { printf("T -> T * F\n"); }
 | F          { printf("T -> F\n");     }
 ;
F: LP E RP    { printf("F -> ( E )\n"); }
 | ID         { printf("F -> id\n");    }
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
