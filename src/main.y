
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *c);
int yylex(void);

%}

%token SOMA ABREPAR FECHAPAR DIV MULT NUM 

%%

calculadora:
    ABREPAR expressao FECHAPAR
    ;

expressao:
    NUM SOMA NUM { printf("\tADD %d, %d", $1, $2); }
    | NUM MULT NUM {}
    | NUM DIV NUM {}
    ;

%%


void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
   yyparse();
   printf("start:\n");
   return 0;

}
