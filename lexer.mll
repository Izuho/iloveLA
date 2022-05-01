{
open Parser       (* The type token is defined in parser.mli *)
exception Eof
}
rule token = parse
    [' ' '\t']     { token lexbuf }     (* skip blanks *)
  | '\n'+          { EOL }
  | ':'	 	   { IN }
  | '='            { EQ }
  | 'R'		   { JISSU }
  | "where"        { WHERE }
  | ['a'-'z']      { VAR(Lexing.lexeme lexbuf) }
  | ['0'-'9']+     { INT(int_of_string(Lexing.lexeme lexbuf)) }
  | "^T"           { TENTI }
  | "^-" ['0'-'9']+ { POWERINT(- int_of_string(Str.string_after (Lexing.lexeme lexbuf) 2)) }
  | '^'	['0'-'9']+ { POWERINT(int_of_string(Str.string_after (Lexing.lexeme lexbuf) 1)) }
  | '^' { POWER }
  | '*'            { TIMES }
  | '('            { LPAREN }
  | ')'            { RPAREN }
  | '['            { LKAGI }
  | ']'            { RKAGI }
  | '-'            { MINUS }
  | '+'            { PLUS }
  | eof            { EOL }
