import numpy as np
def myExpression(p, t):
	# DeclIN
	# DeclIN
	return np.dot((t),(np.dot((np.array([[-1, 3, -3, 1],[3, -6, 3, 0],[-3, 3, 0, 0],[1, 0, 0, 0]])),(p))))

if __name__ == '__main__':
	p=np.random.randn(4,3)
	t=np.random.randn(2,4)
	print(myExpression(p, t))
