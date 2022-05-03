exception SynErr

type name = string 

type youso =
  | YInt of int
  | YFloat of float
          
type vector =
  | Vector of youso * vector
  | EndVEC
          
type mat =
  | Mat of vector * mat
  | EndMAT
          
type env =
  | DeclIN of name * int * int * env
  | DeclEQ of name * mat * env
  | EndENV
           
type ans =
  | Plus of ans * ans
  | Mult of ans * ans
  | Minus of ans * ans
  | Tenti of ans
  | Power of ans * int
  | AInt of int
  | AFloat of float
  | AVar of name
  | AMat of mat
  | AZeros
			  
type sushiki =
  | Sushiki of ans * env
