open Syntax
open List

exception ShapeErr
exception NoAVarErr
        
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

let dict = ref []
let dict2 = ref []
         
let rec search_var v = List.assoc v (!dict)

let rec eval_vec vec str i =
  match vec with
  | Vector (ii, nvec) ->
     (match ii with
      | YInt (n) -> 
         if str = "" then
           eval_vec nvec (string_of_int n) (i+1)
         else
           eval_vec nvec (str^", "^(string_of_int n)) (i+1)
      | YFloat (n) ->
         if str = "" then
           eval_vec nvec (string_of_float n) (i+1)
         else
           eval_vec nvec (str^", "^(string_of_float n)) (i+1))
  | EndVEC -> (("["^str^"]"), i)

let rec eval_mat mat str i j =
  match mat with
  | Mat (vec, nmat) ->
     let (v, x) = eval_vec vec "" 0 in
     if i = -1 || i = x then
       if str = "" then
         eval_mat nmat v x (j+1)
       else
         eval_mat nmat (str^","^v) x (j+1)
     else
       (print_string ("mat "^str^(string_of_int i)^(string_of_int x)^" size is wrong");
        raise ShapeErr)
  | EndMAT ->
     if j = 1 then
       (str^"", (1,i))
     else
       ("["^str^"]", (j,i))

                     
let rec eval_ans ans =
  (match ans with
   | Plus (ans1, ans2) ->
      let (a, (s1l,s1r)) = eval_ans ans1 in
      let (b, (s2l,s2r)) = eval_ans ans2 in
      if s1l < 0 then
        if s2l < 0 then
          if s1r < 0 then
            if s2r < 0 then                 
              ("("^a^")+("^b^")", (-1,-1))
            else
              ("("^a^")+("^b^")", (-1,s2r))
          else
            if s2r = s1r then
              ("("^a^")+("^b^")", (-1,s1r))
            else
              (let a = string_of_int s1l in
               let b = string_of_int s1r in
               let c = string_of_int s2l in
               let d = string_of_int s2r in
               print_string ("Plus with ("^a^","^b^") and ("^c^","^d^")\n");
               raise ShapeErr)
        else
          if s1r < 0 then
            if s2r < 0 then                 
              ("("^a^")+("^b^")", (s2l,-1))
            else
              ("("^a^")+("^b^")", (s2l,s2r))
          else
            if s2r = s1r then
              ("("^a^")+("^b^")", (s2l,s1r))
            else
              (let a = string_of_int s1l in
               let b = string_of_int s1r in
               let c = string_of_int s2l in
               let d = string_of_int s2r in
               print_string ("Plus with ("^a^","^b^") and ("^c^","^d^")\n");
               raise ShapeErr)
      else
        if s2l < 0 then
          if s1r < 0 then
            if s2r < 0 then                 
              ("("^a^")+("^b^")", (s1l,-1))
            else
              ("("^a^")+("^b^")", (s1l,s2r))
          else
            if s2r = s1r then
              ("("^a^")+("^b^")", (s1l,s1r))
            else
              (let a = string_of_int s1l in
               let b = string_of_int s1r in
               let c = string_of_int s2l in
               let d = string_of_int s2r in
               print_string ("Plus with ("^a^","^b^") and ("^c^","^d^")\n");
               raise ShapeErr)
        else if s1l = s2l then
          if s1r < 0 then
            if s2r < 0 then                 
              ("("^a^")+("^b^")", (s1l,-1))
            else
              ("("^a^")+("^b^")", (s1l,s2r))
          else
            if s2r = s1r then
              ("("^a^")+("^b^")", (s1l,s1r))
            else
              (let a = string_of_int s1l in
               let b = string_of_int s1r in
               let c = string_of_int s2l in
               let d = string_of_int s2r in
               print_string ("Plus with ("^a^","^b^") and ("^c^","^d^")\n");
               raise ShapeErr)
        else
          (let a = string_of_int s1l in
           let b = string_of_int s1r in
           let c = string_of_int s2l in
           let d = string_of_int s2r in
           print_string ("Plus with ("^a^","^b^") and ("^c^","^d^")\n");
           raise ShapeErr)
   | Minus (ans1, ans2) ->
      let (a, (s1l,s1r)) = eval_ans ans1 in
      let (b, (s2l,s2r)) = eval_ans ans2 in
      if s1l < 0 then
        if s2l < 0 then
          if s1r < 0 then
            if s2r < 0 then                 
              ("("^a^")-("^b^")", (-1,-1))
            else
              ("("^a^")-("^b^")", (-1,s2r))
          else
            if s2r = s1r then
              ("("^a^")-("^b^")", (-1,s1r))
            else
              (let a = string_of_int s1l in
               let b = string_of_int s1r in
               let c = string_of_int s2l in
               let d = string_of_int s2r in
               print_string ("Minus with ("^a^","^b^") and ("^c^","^d^")\n");
               raise ShapeErr)
        else
          if s1r < 0 then
            if s2r < 0 then                 
              ("("^a^")-("^b^")", (s2l,-1))
            else
              ("("^a^")-("^b^")", (s2l,s2r))
          else
            if s2r = s1r then
              ("("^a^")-("^b^")", (s2l,s1r))
            else
              (let a = string_of_int s1l in
               let b = string_of_int s1r in
               let c = string_of_int s2l in
               let d = string_of_int s2r in
               print_string ("Minus with ("^a^","^b^") and ("^c^","^d^")\n");
               raise ShapeErr)
      else
        if s2l < 0 then
          if s1r < 0 then
            if s2r < 0 then                 
              ("("^a^")-("^b^")", (s1l,-1))
            else
              ("("^a^")-("^b^")", (s1l,s2r))
          else
            if s2r = s1r then
              ("("^a^")-("^b^")", (s1l,s1r))
            else
              (let a = string_of_int s1l in
               let b = string_of_int s1r in
               let c = string_of_int s2l in
               let d = string_of_int s2r in
               print_string ("Minus with ("^a^","^b^") and ("^c^","^d^")\n");
               raise ShapeErr)
        else if s1l = s2l then
          if s1r < 0 then
            if s2r < 0 then                 
              ("("^a^")-("^b^")", (s1l,-1))
            else
              ("("^a^")-("^b^")", (s1l,s2r))
          else
            if s2r = s1r then
              ("("^a^")-("^b^")", (s1l,s1r))
            else
              (let a = string_of_int s1l in
               let b = string_of_int s1r in
               let c = string_of_int s2l in
               let d = string_of_int s2r in
               print_string ("Minus with ("^a^","^b^") and ("^c^","^d^")\n");
               raise ShapeErr)
        else
          (let a = string_of_int s1l in
           let b = string_of_int s1r in
           let c = string_of_int s2l in
           let d = string_of_int s2r in
           print_string ("Minus with ("^a^","^b^") and ("^c^","^d^")\n");
           raise ShapeErr)
   | Div (ans1, ans2) ->
      let (a, (s1l,s1r)) = eval_ans ans1 in
      let (b, (s2l,s2r)) = eval_ans ans2 in
      if s2l < 2 && s2r < 2 then
        ("("^a^"/"^b^")", (s1l,s1r))
      else
        let c = string_of_int s2l in
        let d = string_of_int s2r in
        print_string ("Div by ("^c^","^d^")\n");
        raise ShapeErr
   | Mult (ans1, ans2) ->
      let (a, (s1l,s1r)) = eval_ans ans1 in
      let (b, (s2l,s2r)) = eval_ans ans2 in
      if (s1l, s1r) = (-2,-2) then
        (a^"*"^b, (s2l,s2r))
      else if (s2l, s2r) = (-2,-2) then
        (b^"*"^a, (s1l,s1r))
      else if s1r = s2l || s1r = -1 || s2l = -1 then
        ("np.dot(("^a^"),("^b^"))", (s1l,s2r))
      else           
        (let a = string_of_int s1l in
         let b = string_of_int s1r in
         let c = string_of_int s2l in
         let d = string_of_int s2r in
         print_string ("Mult with ("^a^","^b^") and ("^c^","^d^")\n");
         raise ShapeErr)
   | Tenti (ans1) ->
      let (a, (b, c)) = eval_ans ans1 in
      ("("^a^").T", (c,b))
   | Power (ans1, i) ->
      let (a, (b, c)) = eval_ans ans1 in
      if b = c then
        if i >= 0 then
          ("np.power(("^a^"),"^(string_of_int i)^")", (b,b))
        else
          ("np.power(np.linalg.inv("^a^"), "^(string_of_int (-i))^")", (b,b))
      else
        let b = string_of_int b in
        let c = string_of_int c in
        (print_string ("Inv with ("^b^","^c^")\n");
         raise ShapeErr)
   | AInt (n) ->
      (string_of_int n, (-2,-2))
   | AFloat (n) ->
      (string_of_float n, (-2,-2))
   | AVar (v) ->
      (try
         let a = search_var v in a
       with Not_found ->
         (print_string ("No such AVar("^v^")\n");
          raise NoAVarErr))
   | AZeros ->
      ("0", (-1,-1))
   | AMat mat ->
      let (v,(i,j)) = eval_mat mat "" (-1) 0 in
      ("np.array("^v^")",(i,j))
  )
        
let rec eval_env env =
  match env with
  | DeclIN (v, i, j, nenv) ->
     dict := (v, (v, (i,j)))::(!dict);
     dict2 := (v, (v, (i,j)))::(!dict2);
     "\t# DeclIN\n"^(eval_env nenv);
  | DeclEQ (v, mat, nenv) ->
     let (mat, (i,j)) = eval_mat mat "" (-1) 0 in
     dict := (v, (v, (i,j)))::(!dict);
     "\t"^v^" = np.array("^mat^")\n"^(eval_env nenv)
  | EndENV -> ""

let rec eval_param li str =
  match li with
  | ((v,_)::nli) -> 
     if str = "" then
       eval_param nli v
     else
       eval_param nli (str^", "^v)
  | [] -> str

let rec test_param li param =
  match li with
  | (_,(v,(i,j)))::nli ->
     print_string ("\t"^v^"=np.random.randn("^(string_of_int i)^","^(string_of_int j)^")\n");
     print_string ("\tprint('"^v^" : ')\n");
     print_string ("\tprint("^v^")\n");
     test_param nli param
  | [] ->
     print_string ("\tprint('ans : ')\n");
     print_string ("\tprint(myExpression("^param^"))\n")
  
     
let rec eval_command cmd =
  let Sushiki (ans, env) = cmd in
  let vv = eval_env env in
  dict2 := List.rev (!dict2);
  let param = eval_param (!dict2) "" in
  let (v,(i,j)) = eval_ans ans in
  print_string ("import numpy as np\ndef myExpression("^param^"):\n");
  print_string vv;
  print_string ("\treturn "^v^"\n\n");
  print_string ("if __name__ == '__main__':\n");
  test_param (!dict2) param
