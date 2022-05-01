# 情報演習3 
# I❤️LA

## 参考リンク、元論文など
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
### 1.
~~~
t^3+s^5
where
t:R
s:R
~~~
~~~
import numpy as np
def myExpression(s, t):
	# DeclIN
	# DeclIN
	return (np.power((t),3))+(np.power((s),5))

if __name__ == '__main__':
	s=np.random.randn(1,1)
	print('s : ')
	print(s)
	t=np.random.randn(1,1)
	print('t : ')
	print(t)
	print(myExpression(s, t))
~~~
~~~
s : 
[[ 0.01705895]]
t : 
[[ 0.77476029]]
[[ 0.46505259]]
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
import numpy as np
def myExpression(g, c, a):
	# DeclIN
	b = np.array([[3, -1],[55, 7],[3, 4]])
	# DeclIN
	d = np.array([[6],[7],[6]])
	# DeclIN
	return ((0)-(2*np.dot((((b)+(a)).T),(np.dot((np.power(np.linalg.inv(c), 2)),(d))))))+((g).T)

if __name__ == '__main__':
	g=np.random.randn(1,2)
	print('g : ')
	print(g)
	c=np.random.randn(3,3)
	print('c : ')
	print(c)
	a=np.random.randn(3,2)
	print('a : ')
	print(a)
	print(myExpression(g, c, a))
~~~
~~~
g : 
[[-0.23809394 -1.3033458 ]]
c : 
[[ 0.56622972 -1.16681623  0.16576344]
 [ 0.12525813  0.61534704  1.75255671]
 [ 0.19738207  0.89701867  0.87974792]]
a : 
[[-0.46620955 -1.23092471]
 [-0.98515407  0.79213559]
 [ 2.61496829 -0.72034392]]
[[-1476.69247924]
 [   57.11414637]]
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
[[ 5.04153287 -7.79842025 -2.68019263]
 [-0.57530138  0.06662936  0.0464283 ]]
~~~
