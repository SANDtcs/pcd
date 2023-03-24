%{
        #include "y.tab.h"
%}

%%

[0-9]+  {yylval = atoi(yytext);return number;}
['\n']  {return 0;}
.       {return yytext[0];}

%%

int yywrap(void)
{
        return 1;
}
