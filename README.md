# Egyptian fractions of harmonic numbers
## [Harmonic numbers](https://en.wikipedia.org/wiki/Harmonic_number)   
$$H(n) = \sum_{k=1}^{n}\dfrac{1}{k}$$  
- $\lim_{n \to \infty} H(n) = \infty$
- $H(n)$ is never integer except $n = 1$ 
## [Egyptian fractions](https://en.wikipedia.org/wiki/Egyptian_fraction)
$$\dfrac{6}{7}=\dfrac{1}{2}+\dfrac{1}{3}+\dfrac{1}{42}$$
###  [Shortest egyptian fractions](https://r-knott.surrey.ac.uk/Fractions/egyptian.html#section6.1) 
By [greedy algorithm](https://r-knott.surrey.ac.uk/Fractions/egyptian.html#section5) 
$$4/17 = 1/5 + 1/29 + 1/1233 + 1/3039345$$  
but  
$$4/17 = 1/5 + 1/30 + 1/510$$
## Fractional part of harmonic number
Let's look at $ceil(H(n))-H(n)$ and  $H(n)-floor(H(n))$  
*These amounts we have to add or remove from H(n) to get an integer*  
We can always expand these amounts into egyptian fractions.  
The question is:  
**What is the shortest length a(n) of egyptian fraction that we need to add (or subtract from) given harmonic number to get integer?**  
Now this is [draft on OEIS](https://oeis.org/draft/A363937)  
### Examples
$n=3, H(n)=11/6$  
$\lceil H(n)\rceil-H(n)=1/6$  
$H(n)-\lfloor H(n)\rfloor=5/6=1/2+1/3$,  
so $a(3)=1$  

$n=5, H(n)=137/60$  
$\lceil H(n)\rceil-H(n) = 17/60 = 1/5 + 1/12$  
$H(n)-\lfloor H(n)\rfloor = 43/60 = 1/2 + 1/6 + 1/20$  
so $a(5)=2$  
### Important note
Let **LSEF** means *length of the shortest egyptian fraction*.  
Than:  
$$X < Y \quad \verb|⇏| \quad LSEF(X) < LSEF(Y)$$
The first counterexample:  
$$3/7 = 1/3 + 1/11 + 1/231$$ 
$$4/7 = 1/2 + 1/14$$  
So objectively we should check both $LSEF(\lceil H(n)\rceil-H(n))$ and   
$LSEF(H(n)-\lfloor H(n)\rfloor)$.  
There is strong conjecture that for such kind of numbers  
$$X < Y \quad \verb|⇒| \quad LSEF(X) < LSEF(Y)$$
but this is very open question.  
## [Algorithm for LSEF(p/q)](https://mathoverflow.net/questions/308385/what-is-the-shortest-length-of-an-egyptian-fraction-expansion-for-a-given-p-q)
If there is an expansion with k terms, one of the denominators is at most kq/p. 
So to check whether there is an expansion with at most k terms: for each m from ⌈q/p⌉ to ⌊kq/p⌋, check recursively whether p/q−1/m has an expansion with at most k−1 terms.  
The existence of polynomial time algorithms for these problems, or more generally the computational complexity of such problems, remains unknown.
### [Julia code for LSEF](https://github.com/lesobrod/egyptian-fractions/blob/main/FindLSEF.jl)
[Thanks for answers](https://discourse.julialang.org/t/fast-recursion-with-big-rationals/101023)

### [Julia code for a(n)](https://github.com/lesobrod/egyptian-fractions/blob/main/HLSEF.jl)
First 30 members of a(n):  
[1, 1, 1, 2, 2, 3, 3, 3, 3, 2, 3, 4, 3, 4, 
 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 4, 5, 5, 4, 4]
