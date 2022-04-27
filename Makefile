SOURCES = syntax.ml lexer.mll parser.mly eval.ml main.ml
RESULT  = main

YFLAGS = -v 
LIBS = str

all: byte-code byte-code-library

-include OCamlMakefile
