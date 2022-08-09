import sys

from datetime import datetime


n = 1024
q = 12289
r = 8

R = PolynomialRing(Integers(q),"y")
x = R.gen()
S = R.quotient(x^n + 1, 'x')
w = S.gen()

def smallPolynomial(times):
    ans = 0 
    for i in range(n):
        coeff = 0
        for _ in range(times):
            bit1 = randint(0, 1)
            bit2 = randint(0, 1)
            coeff += (bit1 - bit2)
    
        ans += w^i*coeff
    
    return ans

def rounding(num):
    return int(num + .5)
    
def inverse(small):
    MatrixA = []
    for i in range(n):
        aux = small*w^(n - i - 1)
        vetorA = [aux[n - i - 1] for i in range(n)]
        MatrixA.append(list(vetorA))   

    MatrixA = MatrixA[::-1]

    MA = matrix(GF(q), MatrixA)

    Y = [0 for _ in range(n)]
    Y[-1] = 1

    Z = MA.solve_right(vector(GF(q), Y))

    zPol = 0
    for (i, val) in enumerate(Z):
        zPol += val*w^i
    
    return zPol 

case = int(sys.argv[1])
erro = int(sys.argv[2])
limit = int(sys.argv[3])

m = q//(2*r + 1)


exp = 0 

recoveredKeys = 0 
recoveredCoeff = 0 

counter = {}
duplicates = {}

while exp < limit: 
	try:
		if case == 2: 
			c = smallPolynomial(erro)
			cInv = inverse(c)
			a = cInv*m
		if case == 3: 
			c = smallPolynomial(erro)
			d = smallPolynomial(erro)

			cInv = inverse(c)
			a = cInv*(m + d)
			
		for i in range(100):
			
			start = datetime.now()



		
			s = smallPolynomial(r)
			e = smallPolynomial(r)

			b = a*s + e

			b2 = b*c

			cnt = 0

			for i in range(n):
				coeffsi = s[i]
				if coeffsi < q//2: 
					coeffsi2 = rounding(float(b2[i])/m) % (2*r + 1 )        
				else: 
					coeffsi2 =  (-1*(2*r + 1 - (rounding(float(b2[i])/m) % (2*r + 1 )))) % q
					
				if coeffsi != coeffsi2:
					cnt += 1	
				else: 
					recoveredCoeff += 1 
		
			end = datetime.now()


			print(end - start)
			
			if cnt == 0: 
				recoveredKeys += 1 		

			counter[cnt] = counter.get(cnt, 0) + 1

		exp += 1 
	except: 
		print("+")
		continue
		
print("case", case)
print("erro", erro)
print("recovered keys ", recoveredKeys)
print("recovered Coeff", recoveredCoeff)
print("-----------------------------------")

for key in range(1024): 
	if key in counter: 
		print("chaves con coeff errados", key, ">", counter[key])




