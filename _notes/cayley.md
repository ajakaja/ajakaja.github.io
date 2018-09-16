---
layout: article
title: "The Cayley-Hamilton Theorem"
footnotes: true
math: true
---

A short exposition of a famous theorem using multilinear algebra. Not that there's a shortage of explanations of this, but I like my way.

<!--more-->

## 1

The [characteristic polynomial]() of an $$N \times N$$ matrix $$A$$ is given by:

$$p_A(t) = \det(A - tI) = \sum c_k (-t)^k$$

The solutions to this are the eigenvalues, which satisfy $$A \vec{v} = \lambda \vec{v}$$ for some $$\vec{v}$$.

We can get some rudimentary understanding of $$p_A(t)$$ by looking at a small example:

$$\begin{aligned}
\det \begin{pmatrix} A_{xx} - t & A_{xy} \\ A_{yx} & A_{yy} - t \end{pmatrix} &= 
(A_{xx} - t)(A_{yy} - t) - A_{xy} A_{yx} \\
&= (-t)^2 + (A_{xx} + A_{yy}) (-t) + (A_{xx}A_{xy} - A_{xy} A_{yx}) \\
&= (-t)^2 + \tr(A) (-t) + \det(A)
\end{aligned}$$

The coefficients are all related to traces of $$A$$ and its powers, in complicated ways that are not worth studying without multilinear algebra.

Though, recall that a change of basis $$A \mapsto P^{-1} A P$$ does not change $$\det A$$. Nor does it change $$\det (P^{-1} (A - tI) P) = \det(P^{-1}AP - tI)$$, so we can conclude that this polynomial is the same in any basis, which in turn immediately shows that $$\tr A$$ and all the other coefficients are the same in any basis. In fact this is part of why the characteristic polynomial is interesting -- because it is a list of all the basis-invariant properties of $$A$$.

If $$A$$ is diagonalizable, with eigenvalues $$\{ \lambda_i \}$$ on the diagonal, we can work out $$\det(A - t I)$$ and figure out that the coefficients are the _symmetric polynomials_ of the eigenvalues:

$$\det (A - tI) = (-t)^N + (\sum \lambda_i) (-t)^{N-1} + \sum_{i \neq j} (\lambda_i \lambda_j) (-t)^{N-2} + \ldots \prod \lambda_i $$

Which matches up as expected with the identities $$\tr A = \sum \lambda_i$$ and $$\det A = \prod \lambda_i$$.


-------

The [Cayley-Hamilton theorem]() says that $$A$$ is a solution to its own characteristic polynomial, so:

$$p_A(A) = \sum c_k (-A)^k = 0$$

It is entirely not valid to 'prove' Cayley-Hamilton by writing $$p_A(t) = \det(A - A I) = \det(0) = 0$$. It's obvious why if you consider a $$2 \times 2$$ matrix:

$$\det(A - tI) = 
\det \begin{pmatrix} A_{xx} - t & A_{xy} \\ A_{yx} & A_{yy} - t \end{pmatrix} 
\stackrel{!}{\neq}
 \det \begin{pmatrix} A_{xx} - t_{xx} & A_{xy} - t_{xy} \\ A_{yx} - t_{yx} & A_{yy} - t_{yy} \end{pmatrix} = \det (A - I A)$$

In fact, the polynomial $$p_A(t)$$ is scalar-valued:

$$p_A(t) = c_0 + c_1 (-t) + \ldots + c_N (-t)^N$$

To substitute $$t \mapsto A$$ at all, we have to promote it to being matrix valued:

$$p'_A(t) = c_0 I + c_1 (-t) + \ldots + c_N (-t)^N$$

--------

It is a technical process to prove that $$p'_A(A) = 0$$ by usual methods, and Wikipedia will tell you all about it.

## 2

My general stance is that multilnear algebra should be applied everywhere possible -- particularly anywhere a determinant crops up -- because things make more sense with it. It does not, itself, make total sense to me yet. There are big holes in my understanding. But it helps here.

And trying to write this down will be good practice for me.

We can compute the determinant via the wedge product, using the fact that for a matrix $$A = (A_1, \ldots A_N)$$, $$\det (A) \omega = \bigwedge_i A_i$$, where $$\omega = x_1 \wedge x_2 \wedge \ldots x_N$$ is the unit volume element for the space (which let's call $$V$$, so $$\omega \in \wedge^N V$$). Applying this to $$\det(A - It)$$:

$$\begin{aligned}
\det(A - tI) &= \bigwedge_i (A - It)_i \\
&= (A_1 - x_1 t) \wedge (A_2 - x_2 t) \wedge \ldots (A_N - x_N t) \\
&= \wedge^{N} A + (-t) (\wedge^{N-1} A) + \ldots (\wedge^1 A) (-t)^{N-1} + (-t)^N \\
&= \sum (\wedge^k A) (-t)^{N-k} \in \wedge^N V
\end{aligned}$$

Where $$\wedge^k A$$ can be understood in a few different ways, but it's most easily understood with a $$3\times 3$$ example:

$$\begin{aligned}

\wedge^0 A &= x \^ y \^ z = \omega \\
\wedge^1 A &= Ax \^ y \^z + x \^ Ay \^ z + x \^ y \^ Az \\
&= (A_{xx} + A_{yy} + A_{zz}) \omega = \tr(A) \omega \\
\wedge^2 A &= Ax \^ Ay \^ z + x \^ Ay \^ Az + Ax \^ y \^ Az \\
&= A_x \^ A_y \^ z + x \^ A_y \^ A_z + A_x \^ y \^ A_z \\ &=
(A_{xx} A_{yy} - A_{xy} A_{yx} + A_{yy} A_{zz} - A_{yz} A_{zy} + A_{zz} A_{xx} - A_{zx} A_{xz}) \omega \\
&= \tr (\wedge^2 A) \omega \\
\wedge^3 A &= Ax \^ Ay \^ Az = A_x \wedge A_y \wedge A_z \omega \\
&= \det(A) \omega
\end{aligned}$$

This is verbose. Let's put it this way, instead:

$$\omega$$ is the fully-antisymmetrized tensor power of unit vectors, so (omitting $$\otimes$$ symbols for brevity, so $$xyz \equiv x \otimes y \otimes z)$$:

$$\omega = xyz- xzy + yzx - yxz + zxy - zyx$$

$$\wedge^k A$$ is $$k$$ copies of $$A$$ acting on $$\omega$$, like this:

$$\wedge^2 A = (A \otimes A \otimes 1) (\omega) \\
= A(x) A(y) z - A(x) A(z) y + A(y) A(z) x \\
- A(y) A(x) z + A(z) A(x) y - A(z) A(y) x$$

--------

We can also think of $$\det A$$ as 'the action of $$A$$ extended to the volume element', like this:

$$\det A \equiv A^{\otimes N} \cdot \omega$$

(Note that we are not treating $$\det A$$ as being scalar valued anymore; the result should have a factor of $$\omega$$ as its 'basis vector'.)

Which means that 

$$\begin{aligned} 
\det (A - tI) &= (A - It)^{\otimes N} \cdot \omega \\
\end{aligned}$$

And we'd like to expand this to something like $$(\sum A^{\otimes k} (-It)^{\otimes (N-k)}) \cdot \omega$$, but we can't, because the tensor product is not intrinsically commutative. We can easily see how it fails for, say, $$N=3$$ (again omitting lots of $$\otimes$$ symbols):

$$\begin{aligned}
(A - It)^{\otimes 3} &= (A- It) \otimes (A-It) \otimes (A- It) \\
&= AAA \\
& + (I AA + AIA + AAI) (-t) \\
&+ (IIA + IAI + AII) (-t)^2 \\
&+ (III) (-t)^3 \\
&\neq A^3 + 3A^2 I (-t) + 3A I (-t)^2  + (-t)^3
\end{aligned}$$

-------

I don't know where to go from here in terms of understanding, so let's return to proving C-H.

## 3

It's easy to see why we can't just substitute $$t \mapsto A$$ into $$\det (A - tI)$$ to prove $$C-H$$. If we replace all the $$I$$s in the part, like $$(I AA + AIA + AAI)$$, we've changed the coefficients of the polynomial entirely, and haven't proved anything about $$p_{A}(t)$$ at all.

It's important to distinguish now between tensor products and matrix _multiplication_. Just like $$\det A = A^{\otimes N} \cdot \omega$$, we can write matrix multiplication as a contraction as well:

$$AB = A_{ij} B_{jk} = A_{ij} B_{kl} \delta_{jk} \stackrel{?}{=} A \otimes B \cdot I$$

The notation is really tricky here, and I'd like to find a better one. How do we indicate which indexes $$I$$ contracts with, without using coordinates entirely? If $$A, B$$ are both elements of $$V \otimes V^*$$, then $$A \otimes B \in V \otimes V^* \otimes V \otimes V^*$$, so maybe we can write:

$$AB = A \otimes B \cdot I_{23}$$


