
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%

[+] {return SOMA;}

[(] {return ABREPAR;}

[)] {return FECHAPAR;}

[\] {return DIV;}

[x] {return MULTI;}

[0-9]+ {return NUM;}

. ;

%%


int yywrap() {
  return 1;
}
