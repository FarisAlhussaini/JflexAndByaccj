%{
import java.io.*;
%}
%token DEF IF THEN ELSE
%token PLUS MINUS LPAREN RPAREN EQL ASSIGN COLON COMMA SEMICOLON
%token<sval> IDENTIFIER
%token<ival> LITERALS
%token Whitespace
%left MINUS PLUS
%right ELSE



%%

p	: 	d SEMICOLON p 
| 		d  
;  

d	: 	DEF IDENTIFIER LPAREN args RPAREN EQL e  
;

args	: 	IDENTIFIER COMMA args  
| 		IDENTIFIER 
;

e	: 	LITERALS 
| 		IDENTIFIER 
|		IF e EQL e THEN e ELSE e 
| 		e PLUS e 
|		e MINUS e    	
| 		IDENTIFIER LPAREN s RPAREN  
; 

s	: 	e COMMA s 
| 		e  
; 


%%

private Lexer lexer;


private int yylex() {

    int yyl_return = -1;
    
try {
      yylval = new ParserVal(0);

      yyl_return = lexer.yylex();
    }
 
   catch (IOException e) {
      System.err.println("IO error :"+e);

    }
    return yyl_return;
  }



  public void yyerror (String error) {

    System.err.println ("Error: " + error);
  }



  public Parser(Reader r) {

    lexer = new Lexer(r , this);
  }



  public static void main(String args[]) throws IOException {

    System.out.println("Fibonacci parser:");
    Parser yyparser;

    if ( args.length > 0 ) {
      // parse a file
	
      yyparser = new Parser(new FileReader(args[0]));
	yyparser.yyparse();
	System.out.println("No error detected.");
    }

    else {
    
	System.out.println("ERROR: Provide an input file as Parser argument");

    }
  }
 