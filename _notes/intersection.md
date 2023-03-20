---
layout: article
title: "Intersection notes"
footnotes: true
math: true
aside: true
tag: math
---

Q: find closed-form formula for the intersection of two line segments in $$\bb{R}^2$$ given by $$(a,b)$$ and $$(c,d)$$.

First, just find the intersection of the two lines. The methodical approach: write them both as parametric equations, solve the system.

$$
p = a + (b-a) t \\
p = c + (d-c) s
$$

Set equal to each other and rearrange:

$$(b-a) t - (d-c) s = c - a$$

This is a set of $$n$$ equations for $$2$$ unknowns, so in general it's overdetermined and may not have a solution. This makes sense: it reflects the fact that two line segments in $$\bb{R}^{n \geq 3}$$ may not intersect. The requirement that it has a solution is that $$(ab)$$ and $$(cd)$$ lay in the same plane. I believe (haven't checked carefully) that this is equivalent to saying that $$(1,a) \^ (1,b) \^ (1,c) \^ (1,d) = 0$$, that is, their two lines have zero 'volume' (in projective $$n+1$$ space). This expands to $$(abcd) = 0$$ and $$(abc) - (abd) + (acd) - (bcd) = 0$$. There might be a cleaner way though. Seems to work from trying one trivial example.) Also, trivially, $$(b-a) \^ (d-c) \neq 0$$ is required, since the two lines have to be not collinear. 

    todo: come up with a clean, compact formula for these requirements?

Assuming that there is a solution, we can solve this equation in many ways, since any two coordinates that aren't trivial should give us a valid system of equations for $$(t,s)$$. One mindless approach is to contract with the two coefficients in turn to create two scalar equations:

$$(b-a) \cdot ((b-a) t - (d-c) s) = (b-a) \cdot (c-a) \\
(d-c) \cdot ((b-a) t - (d-c) s) = (d-c) \cdot (c-a)$$

Or we can do it by eliminating variables Cramer's rule, which is really just wedging by each vector in turn to cancel out the other ones. This gives:

$$\begin{aligned}
[(d-c) \^ (b-a)] s &= (b-a) \^ (c-a) \\
[(d-c) \^ (b-a)] t &=  (d - c) \^ (c-a)
\end{aligned}$$

Both of these are equalities of bi-vectors, but if $$(b-a) \^ (d-c) \neq 0$$ then all three are parallel, so we can divide through by magnitudes, or just divide through on any single non-zero component since they all have to be the same.

    todo: it would be nice to have a 'closed form' for $$t,s$$ here instead of this 'algorithm'.

$$p$$ is actually _inside_ $$(a,b)$$ and $$(c,d)$$ if both $$s, t \in (0, 1)$$.
