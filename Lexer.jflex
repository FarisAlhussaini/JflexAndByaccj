import java.util.*;
import java.io.*;
%%
%class Lexer
%line
%byaccj
%{

  private Parser yyparser;

  public Lexer(java.io.Reader r, Parser par) {

    this(r);
    this.yyparser = par;
}


%}
DEF = "def"
IF = "if"
THEN = "then"
ELSE = "else"
PLUS = "+"
MINUS = "-"
LPAREN = "("
RPAREN = ")"
EQL = "="
ASSIGN = "="
COLON = ":"
COMMA = ","
SEMICOLON = ";"
IDENTIFIER = [a-zA-Z][a-zA-Z0-9_]*
LITERALS = 0|[1-9][0-9]*
Whitespace = [ \r\n\t ]*

%%

{DEF}						{return Parser.DEF; }
{IF}						{return Parser.IF; }
{THEN}						{return Parser.THEN; }
{ELSE}						{return Parser.ELSE; }
{PLUS}	 					{return Parser.PLUS; }
{MINUS}	 					{return Parser.MINUS; }
{LPAREN}					{return Parser.LPAREN; }
{RPAREN} 					{return Parser.RPAREN; }
{EQL}						{return Parser.EQL; }	
{ASSIGN}					{return Parser.ASSIGN;}
{COLON}						{return Parser.COLON; }
{COMMA}						{return Parser.COMMA; }
{SEMICOLON}					{return Parser.SEMICOLON; }


{IDENTIFIER}		{
								yyparser.yylval = new ParserVal(yytext());
								return Parser.IDENTIFIER; 
			}
{LITERALS}		{
								yyparser.yylval = new ParserVal(Integer.parseInt(yytext()));
								return Parser.LITERALS;
			}								
{Whitespace}                             {/* Do Nothing */  }


.			{
				String errStr = yytext();
				if ( errStr.charAt( 0 ) != 4 )
					System.err.println( "Error: Syntax error '" + errStr + "'" + "at line: " + yyline );
				return -1;
			}