%{
        #include "y.tab.h"
%}

%%

[0-9]+ {yylval = atoi(yytext);return number;}
. return 0;

%%

int yywrap(void)
{
        return 1;
}
