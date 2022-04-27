%token <int> INT POWERINT
%token <string> VAR
%token WHERE JISSU TIMES
%token PLUS MINUS TENTI POWER
%token LPAREN RPAREN
%token EQ IN LKAGI RKAGI
%token EOL
%left PLUS MINUS
%nonassoc POWER
%left TIMES
%nonassoc UMINUS
%start main             /* the entry point */
%type <Syntax.sushiki> main
%%
main:
    ans EOL WHERE EOL env              { Sushiki($1,$5) }
  | MINUS subans EOL WHERE EOL env     { Sushiki($2,$6) }
;

subans:
    semians PLUS ans  { Plus(Minus(AZeros, $1),$3) }
  | semians MINUS ans { Minus(Minus(AZeros, $1),$3) }
  | semians           { Minus(AZeros,$1) }

semians_:
    VAR                    { Syntax.AVar($1) }
  | VAR TENTI              { Tenti(AVar($1)) }
  | VAR POWERINT           { Power(AVar($1), $2) }
  | INT                        { AInt($1) }
  | LPAREN ans RPAREN          { $2 }
  | LPAREN ans RPAREN TENTI    { Tenti($2) }
  | LPAREN ans RPAREN POWERINT { Power($2,$4) }
  | LPAREN MINUS subans PLUS ans RPAREN          { Plus($3,$5) }
  | LPAREN MINUS subans PLUS ans RPAREN TENTI    { Tenti(Plus($3,$5)) }
  | LPAREN MINUS subans PLUS ans RPAREN POWERINT { Power(Plus($3,$5), $7) }
  | LPAREN MINUS subans MINUS ans RPAREN          { Minus($3,$5) }
  | LPAREN MINUS subans MINUS ans RPAREN TENTI    { Tenti(Minus($3,$5)) }
  | LPAREN MINUS subans MINUS ans RPAREN POWERINT { Power(Minus($3,$5),$7) }
  | LPAREN MINUS subans ans RPAREN          { Mult($3, $4) }
  | LPAREN MINUS subans ans RPAREN TENTI    { Tenti(Mult($3, $4)) }
  | LPAREN MINUS subans ans RPAREN POWERINT { Power(Mult($3, $4),$6) }
  | LPAREN MINUS subans RPAREN TENTI    { Tenti($3) }
  | LPAREN MINUS subans RPAREN POWERINT { Power($3,$5) }
  | LPAREN MINUS subans RPAREN          { $3 }

semians:
    semians_ semians { Syntax.Mult($1,$2) }
  | semians_ { $1 }

ans:
    semians PLUS ans               { Plus($1, $3) }
  | semians MINUS ans              { Minus($1, $3) }
  | semians                        { $1 }
;

env:
    VAR IN JISSU POWER LPAREN INT TIMES INT RPAREN EOL env { DeclIN($1,$6,$8,$11) }
  | VAR IN JISSU POWERINT EOL env                         { DeclIN($1,1,$4,$6) }
  | VAR IN JISSU EOL env                                   { DeclIN($1,1,1,$5) }
  | VAR EQ LKAGI mat RKAGI EOL env                         { DeclEQ($1,$4,$7) }
  | VAR IN JISSU POWER LPAREN INT TIMES INT RPAREN      { DeclIN($1,$6,$8,EndENV) }
  | VAR IN JISSU POWERINT                               { DeclIN($1,1,$4,EndENV) }
  | VAR IN JISSU                                         { DeclIN($1,1,1,EndENV) }
  | VAR EQ LKAGI mat RKAGI                               { DeclEQ($1,$4,EndENV) }
  | EOL { EndENV }

mat:
    vector         { Mat($1, EndMAT) }
  | vector EOL mat { Mat($1, $3) }


vector:
    INT vector                     { Vector($1, $2) }
  | MINUS INT vector %prec UMINUS  { Vector(-$2, $3) }
  | INT                            { Vector($1, EndVEC) }
  | MINUS INT %prec UMINUS         { Vector(-$2, EndVEC) }
