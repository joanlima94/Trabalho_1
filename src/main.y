
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *c);
int yylex(void);
unsigned char cont=0;

%}

%token SOMA EOL NUM MULT DIV EXPO ABREPAR FECHAPAR
%left SOMA MULT DIV 
%right EXPO ABREPAR FECHAPAR

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
   |EXPR EXPO EXPR {if($3==0) $$=1;
                    else
                    {
                       for(cont=1;cont<$3;cont++) $$=$$*$1;
                    } 
                   }
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
