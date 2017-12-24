%{

#include "common.h"
#include "minijavac.tab.h"

int yycolumn;

#define YY_USER_ACTION { \
		yylloc.first_line = yylineno; \
		yylloc.last_line = yylineno; \
		yylloc.first_column = yycolumn; \
		yylloc.last_column = yycolumn + yyleng - 1; \
		yycolumn += yyleng; }


#define YY_INPUT(buf,result,max_size) \
	{ \
		int c = MiniJavaC::Instance()->GetChar(); \
		if (c == '\n') { \
			yylineno++; \
			yycolumn = 0; \
		} \
		result = (c == EOF) ? YY_NULL : (buf[0] = c, 1); \
	}

%}

%option noyywrap


%%

[ \n\t\r]+		{ /* ignore */ }

"class"			{ return TOK_CLASS; }
"public"		{ return TOK_PUBLIC; }
"static"		{ return TOK_STATIC; }
"void"			{ return TOK_VOID; }
"main"			{ return TOK_MAIN; }
"int"			{ return TOK_INT; }
"boolean"		{ return TOK_BOOLEAN; }
"false"			{ return TOK_FALSE; }
"true"			{ return TOK_TRUE; }
"if"			{ return TOK_IF; }
"else"			{ return TOK_ELSE; }
"length"		{ return TOK_LENGTH; }
"return"		{ return TOK_RETURN; }
"while"			{ return TOK_WHILE; }
"System.out.println"	{ return TOK_PRINTLN; }
"String"		{ return TOK_STRING; }

"this"			{ return TOK_THIS; }
"new"			{ return TOK_NEW; }

"<"				{ return TOK_LT; } // Less Than
"&&"			{ return TOK_LAND; } // Logical And
"{"				{ return TOK_LB; } // Left Braces
"}"				{ return TOK_RB; } // Reft Braces
"("				{ return TOK_LP; } // Left Parentheses
")"				{ return TOK_RP; } // Right Parentheses
"["				{ return TOK_LS; } // Left Square Brackets
"]"				{ return TOK_RS; } // Right Square Brackets

"="				{ return TOK_EQUAL; }
"*"				{ return TOK_MUL; }
"+"				{ return TOK_ADD; }
"-"				{ return TOK_SUB; }
";"				{ return TOK_SEMI; }
"."				{ return TOK_DOT; }
","				{ return TOK_COM; }
"!"				{ return TOK_NOT; }
<<EOF>>			{ return TOK_EOF; }

[a-zA-Z_][a-zA-Z0-9_]*	{ return TOK_IDENTIFIER; }
[0-9]+			{ return TOK_NUM; }

.				{ return TOK_UNEXPECTED; }

%%