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
### 1.
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
def myExpression(p, t):
	# DeclIN
	# DeclIN
	return (0)-(np.dot((t),(np.dot((np.array([[-1, 3, -3, 0],[3, -6, 3, 0],[-3, 3, 0, -1],[1, 0, 0, 1]])),(p)))))

if __name__ == '__main__':
	p=np.random.randn(4,3)
	print('p : ')
	print(p)
	t=np.random.randn(2,4)
	print('t : ')
	print(t)
	print(myExpression(p, t))
~~~
~~~
p : 
[[-0.61506603 -0.43165407 -0.26156988]
 [ 1.3857929  -0.60073574 -0.53931391]
 [ 1.03885798 -0.27887516  0.00276415]
 [ 0.44751254  0.38525723  0.56674152]]
t : 
[[-1.07814403 -0.77922446  1.40750443  0.04543171]
 [-0.36855016 -1.70996961  0.15601197  0.9706313 ]]
[[-11.51427336   1.83032049   2.40177625]
 [-12.1377209    2.50598516   3.62486885]]
~~~
