%{
        void yyerror(char *s);
        int yylex();
        #include <stdio.h>
        #include <stdlib.h>
%}

%token FOR ID BOP UOP NUMBER DO WHILE IF ELSE

%%

program         :       FOR '(' lexp ';' lexp ';' lexp ')' lbody        {printf("For Loop\n");}
                |       WHILE '(' lexp ')' lbody                        {printf("While Loop\n");}
                |       DO codeblock WHILE '(' lexp ')' ';'             {printf("Do While Loop\n");}
                |       IF '(' lexp ')' lbody                           {printf("If Statement\n");}
                |       IF '(' lexp ')' lbody ELSE lbody                {printf("If Else Statement\n");}
                ;

lbody           :       statement
                |       codeblock
                ;

codeblock       :       '{' statement_list '}'
                ;

statement_list  :       statement_list statement
                |
                ;

statement       :       lexp ';'
                ;

lexp            :       fexp
                |
                ;

fexp            :       fexp ',' exp
                |       exp
                |       '(' fexp ')'
                ;

exp             :       ID BOP exp
                |       ID UOP
                |       UOP ID
                |       ID
                |       NUMBER
                ;

%%

int main() {
        yyparse();
        return 0;
}

void yyerror(char *s) {
        printf("Error\n");
}
