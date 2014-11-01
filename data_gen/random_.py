# random_.py because of the import below

import random

N = int(input())

random.seed(N)

A = [None]*N
for i in range(0,N):
	A[i] = i

random.shuffle(A)

for i in range(0,N):
	print(A[i])

