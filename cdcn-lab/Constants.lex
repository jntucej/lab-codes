/*
 * 5ii. LEX Program - Validate Constants (SAS)
 *
 * HOW IT WORKS (one line):
 *  Integer: optional sign + digits
 *  Float:   optional sign + digits + dot + digits
 *  Order matters: put the float rule BEFORE the integer rule
 *  "khalifa" fails all numeric patterns -> Invalid.
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
 * Enter a constant: khalifa
 * Invalid constant
 */
