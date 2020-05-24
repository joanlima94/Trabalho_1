
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *c);
int yylex(void);

%}

%token SOMA SUB ABREPAR FECHAPAR DIV MULT NUM '\n' 

%%

CALC:
    CALC EXPR { }
    |
    ;

EXPR:  
   NUM '\n' {printf("isso é um numero\n");}
   |NUM SOMA NUM {printf("isso é uma soma\n");}
   |NUM SUB NUM {printf("isso é uma sub\n");}
   |NUM MULT NUM {printf("isso é uma mult\n");}
   |NUM DIV NUM {printf("isso é uma div\n");}
   ;
/*
N:
    NUM SOMA NUM { printf("\tADD %d, %d", $1, $2); }
    | NUM MULT NUM {}
    | NUM DIV NUM {}  
    ;
*/
%%


void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
   yyparse();
   return 0;
}

