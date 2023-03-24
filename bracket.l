%{
        #include "y.tab.h"
%}

%%

[()]            return yytext[0];
[\n]            return 0;
.               ;

%%

int yywrap(void) {
        return 0;
}
