# 情報演習3 
# I❤️LA

## 参考リンク、元論文など
https://iheartla.github.io/

## 文法の制限
- 行列の中身は整数 or 小数
- 変数は小文字一文字
- 変数定義は where 以下で行う
- 変数は実数の範囲でのみ定義する
- `ℝ`の代わりに`R`
- `×`の代わりに`*`
- `∈`の代わりに`:`
- ベクトルは`R^n`と表すが、これは実際には (1, n) 行列として扱われる（ので例えば内積は`a b^T`と表す）
- その他、適用できるLA文法はとても狭い

## 使い方
1. `input.txt`にLA文法で数式を書き込む
2. `make`で実行ファイル`main`を作る[^1]
3. `./main > out.py`などとして、pythonのコードに変換する
4. `python out.py`などでpythonで確認してみる

[^1] `10 shift/reduce conflict`が存在するが`parser.output`で全て期待通りに動くことを確認してある

## 例
### 1.
~~~
t^3+s^5

where

t:R
s:R
~~~
~~~
import numpy as np
def myExpression(t, s):
	# DeclIN
	# DeclIN
	return (np.power((t),3))+(np.power((s),5))

if __name__ == '__main__':
	t=np.random.randn(1,1)
	print('t : ')
	print(t)
	s=np.random.randn(1,1)
	print('s : ')
	print(s)
	print('ans : ')
	print(myExpression(t, s))
~~~
~~~
t : 
[[ 1.33811877]]
s : 
[[-0.74239184]]
ans : 
[[ 2.17047433]]
~~~
### 2.
~~~
-2(b+a)^Tc^-2d+g^T
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
~~~
def myExpression(a, c, g):
	# DeclIN
	b = np.array([[3, -1],[55, 7],[3, 4]])
	# DeclIN
	d = np.array([[6],[7],[6]])
	# DeclIN
	return ((0)-(2*np.dot((((b)+(a)).T),(np.dot((np.power(np.linalg.inv(c), 2)),(d))))))+((g).T)

if __name__ == '__main__':
	a=np.random.randn(3,2)
	print('a : ')
	print(a)
	c=np.random.randn(3,3)
	print('c : ')
	print(c)
	g=np.random.randn(1,2)
	print('g : ')
	print(g)
	print('ans : ')
	print(myExpression(a, c, g))
~~~
~~~
a : 
[[-0.3430053  -0.50330435]
 [ 0.12583491  0.51064486]
 [ 0.17391081  0.70807231]]
c : 
[[-0.13439732  0.7990794   0.83840651]
 [-0.82930956 -0.2947173  -2.43444278]
 [ 0.70319865  1.1865112   0.00401365]]
g : 
[[-0.27781355 -0.95130406]]
ans : 
[[-579.78414486]
 [ -47.14506954]]
~~~
### 3.
~~~
- t [ -1  3 -3  0
       3 -6  3  0
      -3  3  0 -1
       1  0  0  1 ] p
where
t:R^(2*4)
p:R^(4*3)
~~~
~~~
import numpy as np
def myExpression(t, p):
	# DeclIN
	# DeclIN
	return (0)-(np.dot((t),(np.dot((np.array([[-1, 3, -3, 0],[3, -6, 3, 0],[-3, 3, 0, -1],[1, 0, 0, 1]])),(p)))))

if __name__ == '__main__':
	t=np.random.randn(2,4)
	print('t : ')
	print(t)
	p=np.random.randn(4,3)
	print('p : ')
	print(p)
	print(myExpression(t, p))
~~~
~~~
t : 
[[ 1.56342203 -0.4085338  -0.74518604  0.11657031]
 [ 0.06494566  2.00997278 -0.39276147  0.15211123]]
p : 
[[-0.34430544  0.75353963 -0.3441423 ]
 [ 0.53684701  0.51035139 -0.89612821]
 [-0.13233129  0.72653566  0.19744468]
 [-0.39395823 -1.78424221 -0.9639107 ]]
ans : 
[[ -3.2275072    3.66115008   6.24468369]
 [ 10.50090406  -2.10790082  -9.80470713]]
~~~
### 4.
~~~
(a+b)(c+d)
where
a:R^(2*4)
b:R^(2*4)
c:R^(4*3)
d:R^(4*3)
~~~
~~~
import numpy as np
def myExpression(a, b, c, d):
	# DeclIN
	# DeclIN
	# DeclIN
	# DeclIN
	return np.dot(((a)+(b)),((c)+(d)))

if __name__ == '__main__':
	a=np.random.randn(2,4)
	print('a : ')
	print(a)
	b=np.random.randn(2,4)
	print('b : ')
	print(b)
	c=np.random.randn(4,3)
	print('c : ')
	print(c)
	d=np.random.randn(4,3)
	print('d : ')
	print(d)
	print(myExpression(a, b, c, d))
~~~
~~~
a : 
[[ 1.35525152 -2.01623945 -0.12612347 -0.49646815]
 [ 1.43225647 -0.29891858  0.91456829  0.65865288]]
b : 
[[-1.35643665 -0.37711477  0.23071147 -1.32441275]
 [-0.71374622  0.76204433 -1.2034009  -0.7659846 ]]
c : 
[[ 1.19532207 -0.92854964  0.69213479]
 [-1.2618096   1.76527723 -0.06396654]
 [ 0.91412346  0.12980526  0.50082046]
 [-0.62488207 -0.62143085  1.91809712]]
d : 
[[ 0.06919712 -0.68783668  0.18177271]
 [-0.99202759  1.39598985 -1.08641659]
 [ 0.50744742  0.62353544 -1.42117799]
 [ 0.89940773  0.79337749  1.01244761]]
ans :
[[ 5.04153287 -7.79842025 -2.68019263]
 [-0.57530138  0.06662936  0.0464283 ]]
~~~
### 5.
~~~
[ t^3 t^2 t 1 ] [ -1  3 -3  1
                   3 -6  3  0
                  -3  3  0  0
                   1  0  0  0 ] p
where
t:R
p:R^(4*3)
~~~
~~~
import numpy as np
def myExpression(t, p):
	# DeclIN
	# DeclIN
	return np.dot((np.array([np.power((t),3)[0][0], np.power((t),2)[0][0], t[0][0], 1])),(np.dot((np.array([[(0)-(1), 3, (0)-(3), 1],[3, (0)-(6), 3, 0],[(0)-(3), 3, 0, 0],[1, 0, 0, 0]])),(p))))

if __name__ == '__main__':
	t=np.random.randn(1,1)
	print('t : ')
	print(t)
	p=np.random.randn(4,3)
	print('p : ')
	print(p)
	print('ans : ')
	print(myExpression(t, p))
~~~
~~~
t : 
[[-1.17279556]]
p : 
[[-0.87778973  0.18676771  0.0296709 ]
 [ 2.1934351   0.57496441  0.97074062]
 [-1.32316206 -0.57905441 -1.58359226]
 [ 0.20375548  1.17682235  0.16286953]]
ans : 
[-57.62994711 -14.7245704  -30.28083401]
~~~
### 6.
~~~
- t [ -0.5  3.2 -3.9  0
       3.4 -6.0  3.   0
      -3.7  3.1  0.  -1.2
       1.2  0    0    1.1 ] p / (a b^T)
where
t:R^(2*4)
p:R^(4*3)
a:R^4
b:R^4
~~~
~~~
import numpy as np
def myExpression(t, p, a, b):
	# DeclIN
	# DeclIN
	# DeclIN
	# DeclIN
	return (0)-(np.dot((t),(np.dot((np.array([[-0.5, 3.2, -3.9, 0],[3.4, -6., 3., 0],[-3.7, 3.1, 0., -1.2],[1.2, 0, 0, 1.1]])),((p/np.dot((a),((b).T))))))))

if __name__ == '__main__':
	t=np.random.randn(2,4)
	print('t : ')
	print(t)
	p=np.random.randn(4,3)
	print('p : ')
	print(p)
	a=np.random.randn(1,4)
	print('a : ')
	print(a)
	b=np.random.randn(1,4)
	print('b : ')
	print(b)
	print('ans : ')
	print(myExpression(t, p, a, b))
~~~
~~~
t : 
[[ 0.3568924   0.74505929 -0.22346197 -0.19561819]
 [ 2.1835776  -0.40580993  0.53523608 -0.43137105]]
p : 
[[-1.9724996   0.18719755  1.19227233]
 [ 0.26434117 -2.13451127  1.03804048]
 [-0.3970096  -1.02512511  0.32304698]
 [ 1.33868775 -0.70858078 -0.02403497]]
a : 
[[-1.14941321 -0.97767569  0.46317595 -0.72052352]]
b : 
[[-1.88872587 -1.57400203 -1.71474578  1.51362391]]
ans : 
[[ 3.91209394 -4.51108926  0.21338961]
 [-8.2746919   7.56986159 -1.34825945]]
~~~
## 今後したいこと
- 行列の中に整数、小数以外も入れられるようにする（変数など）
- 整数、小数以外に分数も使えるようにする
