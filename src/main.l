
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%

[+] {return SOMA;}

[-] {return SUB;}

[\] {return DIV;}

[x] {return MULTI;}


. ;

%%


int yywrap() {
  return 1;
}
