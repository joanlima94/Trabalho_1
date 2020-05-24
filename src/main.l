
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%

[+] {return SOMA;}

[-] {return SUB;}

[(] {return ABREPAR;}

[)] {return FECHAPAR;}

[/] {return DIV;}

[*] {return MULT;}

[0-9]+ {return NUM;}

. ;

%%


int yywrap() {
  return 1;
}
