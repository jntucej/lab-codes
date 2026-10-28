/*
 * 5iv. LEX Program - Classify Operators (SAS)
 *
 * HOW IT WORKS (one line):
 *  Each operator type gets its own rule; longest match wins.
 *  Order matters: two-char operators must come before
 *  one-char operators they contain ("+" before "=" is fine,
 *  but "+=" must be its own rule before bare "+" would
 *  partially match it).
 */

%{
#include <stdio.h>
%}

%%

"+"|"-"|"*"|"/"|"%"              { printf("Arithmetic operator\n"); }
"=="|"!="|"<"|"<="|">"|">="     { printf("Relational operator\n"); }
"="|"+="|"-="|"*="|"/="         { printf("Assignment operator\n"); }
"&&"|"||"|"!"                    { printf("Logical Operator\n"); }
"++"|"--"                        { printf("Increment / Decrement operator\n"); }
.*                               { printf("Not an operator\n"); }

%%

int yywrap() { return 1; }

int main() {
    printf("Enter an operator: ");
    yylex();
    return 0;
}

/*
 * SAMPLE RUN:
 * Enter an operator: +
 * Arithmetic operator
 * Enter an operator: ==
 * Relational operator
 * Enter an operator: $
 * Not an operator
 */
