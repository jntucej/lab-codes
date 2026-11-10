%{
#include "calc.tab.h"
%}
%%
[0-9]+          { yylval = atoi(yytext); return NUM; }
[a-zA-Z][a-zA-Z0-9]* { return VAR; }
[ \t]           ; 
\n              { return 0; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"("             { return '('; }
")"             { return ')'; }
.               { return yytext[0]; }
%%
