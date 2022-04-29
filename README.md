# 情報演習3 
# I❤️LA

## リンク
https://iheartla.github.io/

## 文法の制限
- 行列の中身は整数
- 変数は小文字一文字
- 変数定義は where 以下で行う
- 変数は実数の範囲でのみ定義する
- 'ℝ'の代わりに'R'
- '×'の代わりに'*'
- '∈'の代わりに':'
- その他、適用できるLA文法はとても狭い

## 例
~~~
t^3+s^5
where
t:R
s:R
~~~
~~~
t [ -1  3 -3  0
     3 -6  3  0
    -3  3  0 -1
     1  0  0  1 ] p
where
t:R^(2*4)
p:R^(4*3)
~~~
~~~
2(b+a)^Tc^-2d+g^T
where
a:R^(3*2)
b=[3 -1 
   55 7
   3 4]
c:R^(3*3)
d=[6 
   7 
   6]
g:R^2
~~~