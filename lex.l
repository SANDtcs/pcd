%{#include<iostream.h>
         int cnt;
%}

digit [0-9]
letters [A-Za-z]

%%
^{letters}({letters}|{digit})* ++cnt;
%%

int yywrap(void)
{
        return 1;
}

int main(int arg,char* argv[])
{
        yyin=fopen(argv[1],"r");
        yylex();
        printf("count:%d\n",cnt);
        return 0;
}



%{
        int chars,lines;
%}

%%
\n      {lines++;}
[A-Za-z]        {chars++;printf("%s\n",yytext);}
%%

int yywrap(void)
{
        return 1;
}

int main(int argc,char *argv[])
{
        yyin=fopen(argv[1],"r");
        yylex();
        fclose(yyin);
        printf("\nNumber of lines : %d\nNumber of characters : %d\n",lines,chars);
        return 0;
}



%{
        int count=0;
%}
%%
^[a-zA-Z_][a-zA-Z0-9_]* printf("VALID IDENTIFIER \n");
^[0-9]+ printf("NUMERICAL CONSTANT \n");
^[^a-zA-Z_][a-zA-Z0-9]* printf("INVALID IDENTIFIER\n");
%%

int yywrap(void)
{
        return 1;
}

int main()
{
        yylex();
        return 0;
}




digit [0-9]

%{

        int count=0;
%}
%%
^{digit}+(.{digit}+)?(E)?({digit}+)?    printf("VALID EXPO\n");

%%
int yywrap()
{
        return 1;
}

int main()
{
        yylex();
        return 0;
}




int [0-9]
float [0-9]+[.][0-9]+

%%
{int}+ printf("%s is an integer constant",yytext);
{float} printf("%s is an float constant",yytext);
%%

int yywrap()
{
        return 1;
}

int main()
{
        yylex();
}



digit [0-9]
hex [A-F]
chr [a-z]

%%
({digit}|{hex})*  printf("%s is a hexadecimal number\n",yytext);
({digit}|{chr})*  printf("not a hexadecimal");
%%

int yywrap()
{
        return 1;
}

int main()
{
        yylex();
}






.       any character except newline
\n      newline
*       zero or more copies of the preceding expression
+       one or more copies of the preceding expression
?       zero or one copy of the preceding expression
^       beginning of line
$       end of line
a|b     a or b
(ab)+   one or more copies of ab (grouping)
"a+b"   literal "a+b" (C escapes still work)
[]      character class



abc           abc
abc*          ab abc abcc abccc ...
abc+          abc abcc abccc ...
a(bc)+        abc abcbc abcbcbc ...
a(bc)?        a abc
[abc]         one of: a, b, c
[a-z]         any letter, a-z
[a\-z]        one of: a, -, z
[-az]         one of: -, a, z
[A-Za-z0-9]+  one or more alphanumeric characters
[ \t\n]+      whitespace
[^ab] 	      anything except: a, b
[a^b] 	      one of: a, ^, b
[a|b] 	      one of: a, |, b
a|b 	      one of: a, b



