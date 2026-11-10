%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+      { yylval = atoi(yytext); return ID; }
"+"         { return PLUS; }
"*"         { return MUL;  }
"("         { return LP;   }
")"         { return RP;   }
\n          { return 0;    }
[ \t]       { }
.           { return yytext[0]; }
%%
int yywrap(void) { return 1; }
