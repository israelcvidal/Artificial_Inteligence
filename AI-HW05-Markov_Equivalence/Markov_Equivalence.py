# To check if 2 graphs have the same skeleton we are not interested in edge's direction, so we get the correspondig undirected graph: 
def getUndirectedGraphs(A,B):
	Askeleton = A
	Bskeleton = B

	for i in range(len(A)):
		for j in range(len(A[i])):
			if A[i][j] == 1:
				Askeleton[j][i] = 1

			if B[i][j] == 1:
				Bskeleton[j][i] = 1

	return Askeleton, Bskeleton



# Now we can check whether or not the two graphs have the same skeletons:
def checkSkeletons(A, B):
	Askeleton, Bskeleton = getUndirectedGraphs(A,B)

	for i in range(len(Askeleton)):
		for j in range(len(Askeleton[i])):
			if Askeleton[i][j] != Bskeleton[i][j]:
				return False
	return True


# To check if two graphs have the same immoralities, we need to check if graph A has all immoralities from B and if B has all immoralities from A:
def checkImmoralities(A,B):
	# First we check the immoralities in A
	for i in range(len(A)):
		for j in range(len(A)):
			if(i!=j):
				for k in range(len(A[i])):
					# Here we check if we have a immorality in A
					if A[i][k] == 1 and A[j][k] == 1 and A[i][j] == 0 and A[j][i] == 0:
						# here we check if B has the samme immorality
						if not(B[i][k] == 1 and B[j][k] == 1 and B[i][j] == 0 and B[j][i] == 0):
							return False

	# The same with B
	for i in range(len(B)):
		for j in range(len(B)):
			if(i!=j):
				for k in range(len(B[i])):
					# Here we check if we have a immorality in B
					if B[i][k] == 1 and B[j][k] == 1 and B[i][j] == 0 and B[j][i] == 0:
						# here we check if B has the samme immorality
						if not(A[i][k] == 1 and A[j][k] == 1 and A[i][j] == 0 and A[j][i] == 0):
							return False

	return True


# To check the Markov Equivalence we only call the functions defined above.
def checkMarkovEquivalence(A, B):
	return checkSkeletons(A,B) is True and checkImmoralities(A,B) is True



# Here we check if the graphs in Exercise 05.03 are Markov Equivalent
A = [[0, 0, 1, 1, 0, 1, 0, 0, 0], [0, 0, 1, 0, 1, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1], [0, 0, 1, 0, 0, 0, 1, 0, 0], [0, 0, 0, 1, 0, 0, 0, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]]
B = [[0, 0, 1, 1, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 1, 1], [0, 1, 1, 0, 0, 0, 1, 0, 0], [1, 0, 0, 1, 0, 0, 0, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0]]

print int(checkImmoralities(A,B))
