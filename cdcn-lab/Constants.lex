/*
 * 5ii. LEX Program - Validate Constants (SAS)
 *
 * HOW IT WORKS (one line):
 *  Integer: optional sign + digits
 *  Float:   optional sign + digits + dot + digits
 *  Order matters: put the float rule BEFORE the integer rule
 *  so "6.7" doesn't match as just "6".
 */

%{
#include <stdio.h>
%}

%%

^[+-]?[0-9]+\.[0-9]+      { printf("valid floating constant\n"); }
^[+-]?[0-9]+              { printf("valid Integer constant\n"); }
.*                        { printf("Invalid constant\n"); }

%%

int yywrap() { return 1; }

int main() {
    printf("Enter a constant: ");
    yylex();
    return 0;
}

/*
 * SAMPLE RUN:
 * Enter a constant: 46
 * valid Integer constant
 * Enter a constant: 6.7
 * valid floating constant
 * Enter a constant: Sahithi
 * Invalid constant
 */
