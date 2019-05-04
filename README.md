# JflexAndByaccj




This project was part of KSU's course CSC 340 (Compiler and programming languagues) project, It is built over a grammar presented as: 

P -> D; P | D

D -> def id(ARGS) = E;

ARGS -> id, ARGS | id

E -> int | id | if E1 = E2 then E3 else E4 | E1 + E2 | E1 - E2 | id(E1,...En)



To run this, change the directory to where the files are downloaded, then run yacc -J Parser.y, then jflex Lexer.jflex, then your java files would be created, compile them with javac Parser.java and Lexer.java and finally run the parser along with the input file Fib.txt as java Parser Fib.txt
