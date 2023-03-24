%{
        #include <stdio.h>
%}

%token number
%start expression

%%

expression      : number        {while($1>0){printf("%d",$1%2);$1=$1/2;}}
                ;

%%

void main()
{
        yyparse();
}

void yyerror()
{
        printf("Error\n");
}
