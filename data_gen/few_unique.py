import random

N = int(input())
# C = int(input()) # How many unique values?

random.seed(N)

A = [random.randint(1,100) for _ in range(N)] # random.randint(1,C)

for i in range(0,N):
	print(A[i])
