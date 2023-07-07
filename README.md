# Egyptian fractions of harmonic numbers
## [Harmonic numbers](https://en.wikipedia.org/wiki/Harmonic_number)   
$$H(n) = \sum_{k=1}^{n}\dfrac{1}{k}$$  
- $\lim_{n \to \infty} H(n) = \infty$
- $H(n)$ is an integer iff $n = 1$ 
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
$\lceil H(n)\rceil-H(n)=43/60 = 1/2+1/6+1/20$  
$H(n)-\lfloor H(n)\rfloor=17/60=1/5+1/12$  
so $a(5)=2$  
### Important note
Let LSEF means length of the shortest egyptian fraction. Than:  
$$X < Y \quad \verb|⇏| \quad LSEF(X) < LSEF(Y)$$
 
The first counterexample:  
$$3/7 = 1/3 + 1/11 + 1/231$$ 
$$4/7 = 1/2 + 1/14$$  
So objectively we should check both $LSEF(\lceil H(n)\rceil-H(n))$ and   
$LSEF(H(n)-\lfloor H(n)\rfloor)$.  
There is strong conjecture that for such kind of numbers  
$$X < Y \quad \verb|⇒| \quad LSEF(X) < LSEF(Y)$$
but this is very open question.  
