
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *c);
int yylex(void);

%}

%token SOMA ABREPAR FECHAPAR DIV MULT NUM EXPO '\n'
%left DIV MULT SOMA EXPO

%%

CALC:
   CALC EXPR { }
   | PAR { }
   | ABREPAR PAR FECHAPAR { }
   ;

PAR:
   | ABREPAR EXPR FECHAPAR {printf("isso é um ()\n");}

EXPR:
   NUM {printf("isso é um numero\n");}
   |EXPR SOMA EXPR {printf("isso é uma soma\n");}
   |EXPR MULT EXPR {printf("isso é uma mult\n");}
   |EXPR DIV EXPR {printf("isso é uma div\n");}
   |EXPR EXPO EXPR {printf("isso é uma expo\n");}
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
