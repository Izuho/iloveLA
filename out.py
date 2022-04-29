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
