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




%{
int nchar, nword, nline;
%}

%%
\n { nline++; nchar++; }
[^ \t\n]+ { nword++, nchar += yyleng; }
. { nchar++; }
%%

int main(void)
{
         yylex();
         printf("%d\t%d\t%d\n", nchar, nword, nline);
         return 0;
}





/*lex program to count number of words*/
%{
#include<stdio.h>
#include<string.h>
int i = 0;
%}

/* Rules Section*/
%%
([a-zA-Z0-9])* {i++;} /* Rule for counting
						number of words*/

"\n" {printf("%d\n", i); i = 0;}
%%

int yywrap(void){}

int main()
{
	// The function that starts the analysis
	yylex();

	return 0;
}







% {
int op = 0,i;
float a, b;
% }

dig [0-9]+|([0-9]*)"."([0-9]+)
add "+"
sub "-"
mul "*"
div "/"
pow "^"
ln \n
%%

/* digi() is a user defined function */
{dig} {digi();}
{add} {op=1;}
{sub} {op=2;}
{mul} {op=3;}
{div} {op=4;}
{pow} {op=5;}
{ln} {printf("\n The Answer :%f\n\n",a);}

%%
digi()
{
if(op==0)

/* atof() is used to convert
	- the ASCII input to float */
a=atof(yytext);

else
{
b=atof(yytext);

switch(op)
{
case 1:a=a+b;
	break;

case 2:a=a-b;
break;

case 3:a=a*b;
break;

case 4:a=a/b;
break;

case 5:for(i=a;b>1;b--)
a=a*i;
break;
}
op=0;
}
}

main(int argv,char *argc[])
{
yylex();
}

yywrap()
{
return 1;
}






%{
int count = 0;
%}

%%
[A-Z] {printf("%s capital letter\n", yytext);
       count++;}
.     {printf("%s not a capital letter\n", yytext);}
\n    {return 0;}
%%

int yywrap(){}
int main(){

yylex();
printf("\nNumber of Capital letters in the given input - %d\n", count);

return 0;
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



