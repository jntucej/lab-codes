/*
 * 6. LEX Program - Count Words and Lines in a File (SAS)
 *
 * HOW IT WORKS (one line):
 *  LEX tokenizes the input file word by word;
 *  we just count tokens and newlines.
 *  The input must come from a FILE (yyin = fopen),
 *  not stdin, for this version.
 */

%{
#include <stdio.h>
int words = 0, lines = 0;
%}

%%

\n              { lines++; }
[a-zA-Z0-9]+    { words++; }
[ \t]+          ;

%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    if (!yyin) {
        printf("Cannot open file\n");
        return 1;
    }
    yylex();
    printf("Number of words = %d\n", words);
    printf("Number of lines = %d\n", lines);
    fclose(yyin);
    return 0;
}

/*
 * INPUT FILE (input.txt):
 *   Hello world
 *   This is
 *   a lex program
 *
 * OUTPUT:
 *   Number of words = 12
 *   Number of lines = 3
 */
