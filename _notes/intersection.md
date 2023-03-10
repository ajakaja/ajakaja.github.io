---
layout: article
title: "Intersection notes"
footnotes: true
math: true
aside: true
---

Q: find closed-form formula for the intersection of two line segments in $$\bb{R}^2$$ given by $$(a,b)$$ and $$(c,d)$$.

First, just find the intersection of the two lines. The methodical approach: write them both as parametric equations, solve the system.

$$
p = a + (b-a) t \\
p = c + (d-c) s
$$

Rearrange:

$$(b-a) t - (d-c) s = c - a$$

Cramer's rule for solving systems is really just wedging by each vector in turn to cancel out the other ones. (For $$n>2$$, you wedge by all $$n-1$$ other vectors).

$$\begin{aligned}
(b-a) \^ [(b-a) t - (d-c) s] &= (b-a) \^ (c-a) \\
[(d-c) \^ (b-a)] s &= (b-a) \^ (c-a) \\
\end{aligned}$$

Etc. You eventually get:

$$\begin{aligned}
t = \frac{(d-c) \^ (c-a)}{(d-c) \^ (b-a)}\\
s = \frac{(b-a) \^ (c-a)}{(d-c) \^ (b-a)}
\end{aligned}$$

Note that the denominators are the same. Also, these fractions are dividing two $$\^^2$$ bivectors as though they are scalars, which is probably not quite kosher. Nor are they particularly elegant. Anyway, we can substitute one of them --- say $$t$$ --- back into its original formula to find the point of intersection.

$$p = a + (b-a) \frac{(d-c) \^ (c-a)}{(d-c) \^ (b-a)}$$

I feel like there should be a way to write this that is symmetric in the two lines, but not sure what it is. If you extend the fraction to include the $$a$$ term, there's a manipulation using the Jacobi identity ( $$a(b \^ c) + b (c \^ a) + c (a \^ b) = 0$$ ) which gives the other formula for $$p$$ in terms of the ($$c,d$$) line, though:

$$p = c + (d-c) \frac{(b-a) \^ (c-a)}{(d-c) \^ (b-a)}$$


--------

Now that we have the point of intersection, we want to know if it's actually inside the two line segments. The way to do this is the "signature" operation from OPG. The signature of $$p$$ relative to a simplex $$S = (a_0 a_1 \ldots)$$ is found by substituting $$p$$ for each of the points in the simplex and seeing if it gives the same or the opposite orientation, which is given by the sign of e.g. $$(ap) \cdot (ab)$$. The result is a tuple like $$(+,+,-)$$. $$p$$ is 'in' $$S$$ if the signature is all $$+$$s.

(note: I don't remember the full discussion of the signature operation at the moment, or exactly why it works. In particular, it definitely seems to require that $$p$$ live in the subspace spanned by $$S$$, so I guess before you run this algorithm you have to check that $$S \^ p = 0$$.)

So for a line segment $$(ab)$$ and point $$p$$, we check $$(pb)$$ and $$(ap)$$. All three of these should be the same line with the same orientation. How do we check orientation? I guess we compute $$\sgn((ab) \cdot (pb))$$ and $$\sgn((ab) \cdot (ap))$$ and check if they are both $$1$$. Afaik this has to happen in oriented-projective space. Sheesh.

$$\begin{aligned}
(ab) &\ra (a \^ b, b-a) \\
(pb) &\ra (p \^ b, b-p) \\
(ap) &\ra (a \^ p, p-a)

\end{aligned}$$

Interestingly, and I hadn't noticed before, $$(a \^ p) \cdot (a \^ b)$$ and $$(p-a) \cdot (b-a)$$ have the same value. So we don't need to actually do the full calculations, we can just compute $$(b-a) \cdot (b-p)$$ and $$(b-a) \cdot (p-a)$$ ... which makes sense, actually.

$$\begin{aligned}
(b-a) \cdot (b-p) & \stackrel{?}{>} 0 \\
(b-a) \cdot (p-a) & \stackrel{?}{>} 0
\end{aligned}$$

And likewise for $$(c,d)$$. It's an algorithm, but it's not an especially pretty one! I have a hunch there's an easier way to do it using the boundary operator:

$$\p(abc) = (ab) + (bc) + (ca) $$

Because then, for e.g. a tetrahedron, $$p \^ \p(ab) = (pab) + (pbc) + (pca) = (pbc) + (apc) + (abp)$$ which is exactly the three terms we need to check the orientations of. Maybe it works out that $$[p \^ \p S] \cdot S$$ encompasses the result in one value? Need to look into that.
