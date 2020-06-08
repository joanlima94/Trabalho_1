
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *c);
int yylex(void);
unsigned char cont=0;
unsigned char var=1;

%}

%token SOMA EOL NUM MULT DIV EXPO ABREPAR FECHAPAR
%left SOMA MULT DIV EXPO ABREPAR FECHAPAR 

%%

CALC:
   CALC EXPR EOL {printf("Resultado : %d\n",$2);}
   | PAR {$$ = $1;} 
   ;

PAR:
   ABREPAR EXPR FECHAPAR {$$=$2;}
   |
   ;

EXPR:
   NUM {$$=$1;}
   |EXPR SOMA EXPR {$$ = $1 + $3;}
   |EXPR MULT EXPR {$$ = $1*$3;}
   |EXPR DIV EXPR {$$ = $1/$3;}
   |PAR {$$=$1;}
   ;
 
%%


void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
   yyparse();
   return 0;
}
