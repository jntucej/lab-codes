%{
#include "y.tab.h"
%}
%%
[0-9]+      { return NUMBER; }
[+\-*/]     { return yytext[0]; }
"("         { return '('; }
")"         { return ')'; }
\n          { return '\n'; }
[ \t]       { }
.           { return yytext[0]; }
%%
int yywrap(void) { return 1; }
