
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%

[+] {return SOMA;}

[/] {return DIV;}

[(] {return ABREPAR;}

[)] {return FECHAPAR;}

[\^] {return EXPO;}

[*] {return MULT;}

[0-9]+ { yylval = atoi(yytext);
         return NUM;}

\n {return EOL;}

[\ \t]+ ; 



%%


int yywrap() {
  return 1;
}
