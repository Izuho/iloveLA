open Syntax

let ( *$ ) str n =
  let rec iter result i =
    if i <= 0 then
      Buffer.contents result
    else
      begin
        Buffer.add_string result str;
        iter result (i-1) 
      end
  in iter (Buffer.create (String.length str * n)) n

let rec eval_command cmd =
  let Sushiki (ans, env) = cmd in
  (let rec eval_ans ans =
    (match ans with
     | Plus (cmd1, cmd2) ->
        print_string "Plus(\n";
        eval_ans cmd1;
        print_string "\n";
        eval_ans cmd2;
        print_string "\n)"
     | Minus (cmd1, cmd2) ->
        print_string "Minus(\n";
        eval_ans cmd1;
        print_string "\n";
        eval_ans cmd2;
        print_string "\n)"
     | Mult (cmd1, cmd2) ->
        print_string "Mult(\n";
        eval_ans cmd1;
        print_string "\n";
        eval_ans cmd2;
        print_string "\n)"
     | Tenti (cmd1) ->
        print_string "Tenti(\n";
        eval_ans cmd1;
        print_string "\n)"
     | Power (cmd1, i) ->
        print_string "Power(\n";
        eval_ans cmd1;
        print_string "\n";
        print_string ((string_of_int i)^"\n)")
     | AInt (n) ->
        print_string ("AInt(\n"^(string_of_int n)^"\n)")
     | AVar (v) ->
        print_string ("AVar(\n"^v^"\n)")
     | AZeros ->
        print_string "AZeros")
  in
  eval_ans ans);
  (let rec eval_env env =
    let rec eval_mat mat =
      let rec eval_vec vec =
        match vec with
        | Vector (i, nvec) ->
           print_string ((string_of_int i)^" ");
           eval_vec nvec
        | EndVEC -> print_string "\n"
      in
      match mat with
      | Mat (vec, nmat) ->
         (print_string "Mat((\n";
          eval_vec vec;
          eval_mat nmat;
          print_string "\n)")
      | EndMAT -> print_string "EndMat\n"
    in
    match env with
     | DeclIN (v, i, j, nenv) ->
        (print_string ("DeclIN((\n"^v^" "^(string_of_int i)^" "^(string_of_int j)^"\n)\n");
         eval_env nenv)
     | DeclEQ (v, mat, nenv) ->
        (print_string ("DeclEQ(\n"^v^"\n");
         eval_mat mat;
         print_string "\n)";
         eval_env nenv)
     | EndENV -> print_string " "
  in
  eval_env env)
     
