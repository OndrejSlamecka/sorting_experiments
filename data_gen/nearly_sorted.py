import random

N = int(input())

random.seed(N)

A = [None]*N
for i in range(0,N):
	A[i] = i

# Swap four out of five succesive variables
five = [1,2,3,4,5]
i = 0
while i < N - 5:
	random.shuffle(five)
	A[i + five[0]], A[i + five[1]] = A[i + five[1]], A[i + five[0]]
	A[i + five[2]], A[i + five[3]] = A[i + five[3]], A[i + five[2]]
	i += 5

for i in range(0,N):
	print(A[i])
