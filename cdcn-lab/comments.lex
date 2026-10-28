/*
 * 5iii. LEX Program - Detect Comments (SAS)
 *
 * HOW IT WORKS (one line):
 *  Single-line comment: // followed by anything to end of line
 *  Multi-line comment:  /* ... */ — the regex handles
 *  the tricky case of escaped stars inside.
 */

%{
#include <stdio.h>
%}

%%

//.*                                { printf("single line comment\n"); }
"/*"([^*]|\*+[^*/])*\*+"/"        { printf("Multi Line comment\n"); }
.*                                 { printf("Not a comment\n"); }

%%

int yywrap() { return 1; }

int main() {
    printf("Enter a comment: ");
    yylex();
    return 0;
}

/*
 * SAMPLE RUN:
 * Enter a comment: // This is CD-CN Lab
 * single line comment
 * Enter a comment: /* Hi, Hello... */
 * Multi Line comment
 * Enter a comment: This is Apple
 * Not a comment
 */
