
# Code to generate values {\bf a} that leak information about secret keys on Ring-LWE
constant paremeters: 
- n = 1024
- q = 12289 
- m = q/17 = 722

- Case 2:     
    ${\bf c} = \psi_{\mu}^n$ 
    
    ${\bf a} = ({\bf c})^{-1}.m$ 
- 
- Some values ${\bf a}$ are generated. These values leak information about secret keys. 

- Code to compile: 

  python3 test.sage.py #number_Of_Case #\mu #number_Of_value_Of_A_Generated # 
    
