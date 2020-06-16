
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

void yyerror(char *c);
int yylex(void);
unsigned char cont=0;

%}

%token SOMA EOL NUM MULT DIV EXPO ABREPAR FECHAPAR
%left SOMA
%left MULT DIV 
%left EXPO
%left ABREPAR FECHAPAR 

%%

CALC:
   CALC EXPR EOL {printf("\nResultado: %d\n",$2);} 
   | PAR{$$=$1;}
   ;

PAR:
   ABREPAR EXPR FECHAPAR {$$=$2;}
   |
   ;

EXPR:
   NUM {$$=$1;}
   |PAR{$$=$1;}
   |EXPR EXPO EXPR {
                    if($3==0) {$$=1;printf("\tMOV A, 1\n");} 
                    else{
                        for(cont=1;cont<$3;cont++) $$=$$*$1;
                    }
                    printf("\n\tMOV C, 1\n%d",);
                    printf("MOV C, 1\nMOV A, %d\nMOV B, %d\nMOV D, %d\nPOTENCIA_%d:\n	MUL B\n	INC C\n	CMP C,D\n	JNZ POTENCIA_%d\n", $1, $1,$3,f,f);
                   }
   |EXPR MULT EXPR {$$ = $1*$3;printf("\tMOV A, %d\n\tMOV B, %d\n\tMUL B\n",$1,$3);}
   |EXPR DIV EXPR {$$ = $1/$3;printf("\tMOV A, %d\n\tMOV B, %d\n\tDIV B\n",$1,$3);}
   |EXPR SOMA EXPR {$$ = $1 + $3;printf("\tMOV A, %d\n\tMOV B, %d\n\tADD A, B\n",$1,$3);}   
   ;
 
%%


void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
   //inicialização do cód. assembly (printando "Trabalho1 EA876")
   printf("JMP start\nea876:\n\tDB \"Trabalho1 EA876\"\n\tDB 0\n\nstart:\n\tMOV C, ea876\n\tMOV D, 232\n\tCALL print\n\tHLT\n\n");
   printf("print:\n\tPUSH A\n\tPUSH B\n\tMOV B, 0\n.loop:\n");
   printf("\tMOV A, [C]\n\tMOV [D], A\n\tINC C\n\tINC D\n\tCMP B, [C]\n\tJNZ .loop\n\n\tPOP B\n\tPOP B\n\tJMP calc\ncalc:\n");
   yyparse();
   return 0;
}
