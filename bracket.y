%{
        void yyerror(char *s);
        #include <stdio.h>
        #include <stdlib.h>
        int flag = 0;
%}

%%

E       :       '('E')'E
        |
        ;

%%

int main() {
        yyparse();
        if(flag == 0) printf("Valid brackets\n");
        return 0;
}

void yyerror(char *s) {
        printf("Invalid brackets!\n");
        flag = 1;
}
