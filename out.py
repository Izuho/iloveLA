import numpy as np
def myExpression(g, c, a):
	# DeclIN
	b = np.array([[3, -1],[55, 7],[3, 4]])
	# DeclIN
	d = np.array([[6],[7],[6]])
	# DeclIN
	return ((0)-(2*np.dot((((b)+(a)).T),(np.dot((np.power(np.linalg.inv(c), 2)),(d))))))+((g).T)


if __name__ == '__main__':
        a = np.random.randn(3,2)
        c = np.random.randn(3,3)
        g = np.random.randn(1,2)
        print(myExpression(g,c,a))
