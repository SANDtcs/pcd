%{
        void yyerror(char* s);
        int yylex();
        #include <stdio.h>
%}

%token number
%start expression
%left '+' '-' '*' '/' '(' ')'

%%

expression      : E             {printf("Result : %d\n",$$);}
                ;

E               : E '+' E       {$$ = $1+$3;}
                | E '-' E       {$$ = $1-$3;}
                | E '*' E       {$$ = $1 * $3;}
                | E '/' E       {$$ = $1 / $3;}
                | '(' E ')'     {$$ = $2;}
                | number        {$$=$1;}
                ;

%%

void main()
{
        yyparse();
}

void yyerror(char* s)
{
        fprintf(stderr, "%s\n", s);
}
