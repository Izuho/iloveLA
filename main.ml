open Syntax
open Eval
       
let rec read_eval_print () =
  flush stdout;
  let cmd = Parser.main Lexer.token (Lexing.from_channel (open_in "input.txt")) in
  eval_command cmd

let _ = read_eval_print ()
