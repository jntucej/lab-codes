%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[+\-*/]     { return yytext[0]; }
"("         { return '('; }
")"         { return ')'; }
\n          { return '\n'; }
[ \t]       { /* skip whitespace */ }
.           { return yytext[0]; }
%%
int yywrap(void) { return 1; }
