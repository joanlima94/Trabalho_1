
%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);

%}

%token SOMA ABREPAR FECHAPAR DIV MULT NUM 

%%

calculadora:
    ABREPAR expressao FECHAPAR
    ;

expressao:
    NUM SOMA NUM {
                  printf("ADD %d, %d", $1, $2);
                 }
    | NUM MULT NUM {$$ = $1 x $3;}
    | NUM DIV NUM {$$ = $1/$3;}
    ;

%%


void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
