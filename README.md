
# Code to generate values ${\bf a}$ that leak information about secret keys on Ring-LWE
constant paremeters: 
- n = 1024
- q = 12289 
- m = ${\frac{q}{17}}$ = 722

## (1): Generateing ${\bf a}$

#### Case 2:   

  - ${\bf c} = \psi_{\mu}^n$ 

  - ${\bf a} = ({\bf c})^{-1}.m$ 

#### Case 3:  

   - ${\bf c} = \psi_{\mu}^n$ 

   - ${\bf d} = \psi_{\mu}^n$ 

   - ${\bf a} = (m + {\bf d}).({\bf c})^{-1}.m$ 

## (2): Generateing the public and secret keys 

   - ${\bf s} = \psi_{8}^n$ 

   - ${\bf e} = \psi_{8}^n$

   - ${\bf b} = {\bf a}.{\bf s} + {\bf e}$
   
     public key ${\bf pk  = \langle b, a \rangle}$ and secret key ${\bf sk = \langle s \rangle}$

## (3): Recovering coefficients of the secret key ${\bf s}$

   - ${\bf s}' = \lfloor \frac{{\bf b}*{\bf c}}{m} \rceil$ 

     ${\bf s}'$ has a high number of coefficients of the secret ${\bf s}$.

       

The command to execute the code. 

> asd
> > asdsas
> > 
   - case = $\{2, 3\}$ 
   - $\mu \in {\bf Z}$   
   - 
   - $k \in {\bf Z}$ : $k$ values of ${\bf a}$ are generated. For each value of ${\bf a}$ is executed 100 experiments)
   
          Command$  sage   test.sage   case   $\mu$   $k$
