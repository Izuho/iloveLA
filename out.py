import numpy as np
def myExpression(t, p):
	# DeclIN
	# DeclIN
	return (0)-(np.dot((t),(np.dot((np.array([[-0.5, 3.2, -3.9, 0],[3.4, -6., 3., 0],[-3.7, 3.1, 0., -1.2],[1.2, 0, 0, 1.1]])),(p)))))

if __name__ == '__main__':
	t=np.random.randn(2,4)
	print('t : ')
	print(t)
	p=np.random.randn(4,3)
	print('p : ')
	print(p)
	print('ans : ')
	print(myExpression(t, p))
