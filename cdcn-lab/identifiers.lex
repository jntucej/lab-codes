/*
 * 5i. LEX Program - Validate Identifiers (SAS)
 *
 * HOW IT WORKS (one line):
 *  An identifier starts with a letter or underscore,
 *  followed by any number of letters/digits/underscores.
 *  The pattern [a-zA-Z_][a-zA-Z0-9_]* does that.
 */

%{
#include <stdio.h>
%}

%%

^[a-zA-Z_][a-zA-Z0-9_]*   { printf("Valid Identifier\n"); }
.*                        { printf("Invalid Identifier\n"); }

%%

int yywrap() { return 1; }

int main() {
    printf("Enter an Identifier: ");
    yylex();
    return 0;
}

/*
 * SAMPLE RUN:
 * Enter an Identifier: intuhit
 * Valid Identifier
 * Enter an Identifier: 12sah
 * Invalid Identifier
 */
