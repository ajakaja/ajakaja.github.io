---
layout: article
title: "Exterior algebra notes"
math: true
aside: true
footnotes: true
---

Miscellaneous 'suggestive' formulae and ideas.

------------

## wedge-related identities

[Lagrange's Identity](https://en.wikipedia.org/wiki/Lagrange%27s_identity) is:

$$| \b{a} |^2 | \b{b} |^2 = ( \b{a} \cdot \b{b} )^2 + | \b{a} \wedge \b{b} |^2$$

(There's a lot of coordinate-notation garbage on that page, but this is the gist of it.) For quaternions and if you for some reason like the 'geometric' product, this just says that $$\| \b{a} \b{b} \|^2 = \|\b{a} \|^2 \| \b{b} \|^2$$. I'll try to figure out a cleaner form in a bit.


Related:
* [Brahmagupta–Fibonacci identity](https://en.wikipedia.org/wiki/Brahmagupta%E2%80%93Fibonacci_identity) and related, which says that "sums of two squares" $$a^2 + b^2$$ are closed under multiplication (similar results for $$n=4,8,16$$, apparently matching quaternions/etc).
* Cauchy-Schwartz: $$(\b{u}\cdot \b{v})^2 \leq \|\b{u}\|^2 \|\b{v}\|^2$$ is trivially true because it's one term short of Lagrange's Identity

It is a special case of the [Binet-Cauchy Formula](https://en.wikipedia.org/wiki/Binet%E2%80%93Cauchy_identity), which also needs a cleaner form:

$$(\b{a} \cdot \b{c}) (\b{b} \cdot \b{d})  = (\b{a} \cdot \b{d}) (\b{b} \cdot \b{c}) + (\b{a} \wedge \b{b}
) \cdot (\b{c} \wedge \b{d})$$


Even further generalized to the [Cauchey-Binet Formula](https://en.wikipedia.org/wiki/Cauchy%E2%80%93Binet_formula), which finds the determinant of two multiplied matrices that make a square matrix. Let $$A$$ be $$m \times n$$ and $$B$$ be $$n \times m$$, so that $$AB \in 2 \times 2$$ and $$BA \in 3 \times 3$$. 

Let $$[n]$$ be the set $$\{1 \ldots n \}$$, and $$\binom{[n]}{m}$$ be the set of 'selections of $$m$$ values from $$n$$' (of which there are $$\binom{n}{m}$$). Then:

$$\det(AB) = \sum_{S \in \binom{[n]}{m}} \det A_{[m], S} \det B_{S, [m]}$$

What this means is, we loop over every $$m\times m$$ submatrix of $$A$$ and $$B$$ and multiply their determinants together, to get the total determinant of $$AB$$.

For instance, for $$n=2$$:

$$\begin{pmatrix} a \cdot x & a \cdot y \\ b \cdot x & b \cdot y \end{pmatrix} = (a \wedge b) \cdot (x \wedge y)$$

And the same thing works in higher dimensions just fine.



## 2

Clearly there is some geometric interpretation for these 'matrices of dot products'. They're called the [Gramian Matrix](https://en.wikipedia.org/wiki/Gramian_matrix) of two vectors:

$$G = G_{ij} = \b{u}_i \cdot \b{v}_j$$

(It is also proportional to the covariance matrix of random vectors, and generally related to that concept.) Also, there's the "Gramian Determinant":

$$G(\b{u}, \b{v}) = \det G$$

This is also the definition of the inner product given for equal-grade multivectors given [here](https://en.wikipedia.org/wiki/Exterior_algebra#Inner_product):

$$\< v_1 \wedge v_2 \wedge \ldots v_k , w_1 \wedge w_2 \wedge \ldots w_k \> = \det( \< v_i, w_j \>)$$

I believe (need to check) that if you let some of the coefficients of this be unspecified, it might give tensor contraction / tracing between fewer numbers of indexes. Compare to the [interior product](https://en.wikipedia.org/wiki/Interior_product): 

$$\iota_X (\omega ) = \< \omega, X \>$$ 

which contracts one index of $$\omega$$ with a vector and leaves the rest untouched. Weirdly, the interior product acts like a derivative: $$\iota_X (\alpha \wedge \beta) = \iota_X (\alpha) \wedge \beta + (-1)^{pq} \alpha \wedge \iota_X(\beta)$$. I imagine that's true not just on differential forms. Is that maybe where the derivative 'comes from'?

------


I believe (to check) that what the Gramian matrix is doing is showing regular matrix multiplication, but tracing over the 'outer' dimension instead of the inner one.

* The dot product of two vectors is the trace of their outer product:

$$u \cdot v = \tr u \otimes v = \sum u_i v_i$$

* The trace of a matrix is a simple case of tensor contraction. (ignoring metrics everywhere / assuming euclidean space)

$$\tr A = \sum A_{ii}$$

* The multiplication of two matrices is the same thing, but there are extra dimensions floating around:

$$AB = A \cdot B = A_{ij} B_{jk} = \tr A_{ij} B_{kl} = \tr A \otimes B$$

This notation doesn't work great because we need to start indicating which dimensions we're tracing / contracting over.

If $$A: U \otimes V$$ and $$B: V^* \otimes W$$, then $$AB : U \otimes W = \tr_V U \otimes V \otimes V \otimes W$$. If two of the spaces are the same we'll just find some other way to refer to them.

$$AB = \tr_{V} A \otimes B$$

This is a [partial trace](https://en.wikipedia.org/wiki/Partial_trace) over $$V$$. It is also related to expectations: $$\E_V [A] = \tr_V A$$. Unlike the $$A \cdot B$$ notation, we can keep using this when we go are dealing with tensors.







## 3

Related:

The determinant of $$A = (A_x, A_y, \ldots)$$ is (the coefficient of) $$\wedge_i A_i$$, also given by $$A(x \wedge y \wedge \ldots) = (Ax) \wedge (Ay) \wedge \ldots)$$. Is this 'contraction of $$A$$ with $$i = \wedge x_i$$'? Or something else? 

It looks like a way of defining $$\wedge^N A$$, ie, the 'wedge product of a matrix with itself, $$N$$ times'. Actually, there are a bunch of places where I'm thinking that extending the wedge product to matrices might be a good idea. More on that on another page, cause it's long.

--------

The determinant can also apparently be defined on $$A : U \otimes V$$, in which case it gives the 'ratio between their volume elements': $$\det A = \frac{i_U}{i_V}$$. It becomes a scalar only if you can actually perform that division. Something like that.

Also related:

[Hyperdeterminants](https://en.wikipedia.org/wiki/Hyperdeterminant), which are determinants for $$V^{\otimes n}$$ with $$n > 2$$. They ... may be less clean, but they [apparently](https://en.wikipedia.org/wiki/Hyperdeterminant) do have some sort of geometric interpretation? It makes sense that for a 3-dimensional tensor, you could map each vector in one of the dimensions to a determinant of the rest of the tensor.

Also related:

[Quasideterminants](https://en.wikipedia.org/wiki/Quasideterminant), determinants for matrices with non-commutative entries. In practice you can't create a _single_ determinant here, but you can create one per entry of the matrix, which function sort of as 'ratios'. Their commutative analog is:

$$|A|_{ij} = (-1)^{i+j} \frac{\det A}{\det A_{\widehat{ij}}}$$

where $$A_{\widehat{ij}}$$ is $$A$$ with the $$i$$'th row and $$j$$'th column deleted (which I need a better notation for!)

These are interesting, particularly, because [block matrices](https://en.wikipedia.org/wiki/Block_matrix) are examples of matrices over things that don't commute (and they obey the same multiplication law! $$\b{PQ} = \b{P}^{i}_{j} \b{Q}^{j}_{k}$$). 

If we have a non-commutative determinant we might be able to shed light on the determinant of a block matrix:

$$\det \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$

Well, actually, we already know what that [is](https://terrytao.wordpress.com/2013/01/13/matrix-identities-as-derivatives-of-determinant-identities/):

$$\begin{pmatrix} A & B \\ C & D \end{pmatrix} = \begin{pmatrix} A & 0 \\ 0 & 1 \end{pmatrix} \begin{pmatrix} 1 & 0 \\ C & 1 \end{pmatrix} \begin{pmatrix} 1 & A^{-1}B \\ 0 & D - CA^{-1} B \end{pmatrix}$$

giving:

$$\det \begin{pmatrix} A & B \\ C & D \end{pmatrix} = \det (A) \det (D - C A^{-1} B)$$

Which generalizes the scalar version 'correctly' to non-commutative entries; compare to:

$$\det \begin{pmatrix} a& b \\ c& d \end{pmatrix} = ad - bc = (a)(d - c a^{-1} b)$$

Maybe we can say more, though, if we can study non-commutative determinants more generally.

Also, the [matrix determinant lemma](https://en.wikipedia.org/wiki/Matrix_determinant_lemma):

$$\det(\b{A} + \b{u} \otimes \b{v}) = (1 + \b{v} \b{A}^{-1} \b{u}) \det (\b{A})$$

-------

Also, there is a [crazy formula](https://en.wikipedia.org/wiki/Block_matrix#Block_matrix_inversion) for inverting a block matrix, which is interesting-ish but can't be that intuitively useful. If we write:

$$\b{Q} = \b{D} - \b{C} \b{A}^{-1} \b{B}$$

Then, if $$\b{A}$$ and $$\b{Q}$$ are square and invertible:

$$\begin{pmatrix}\b{A}&\b{B} \\ \b{C} & \b{D} \end{pmatrix}^{-1} = 
\begin{pmatrix}
\b{A}^{-1} (\b{I} + \b{B} \b{Q}^{-1} \b{C} \b{A}^{-1}) & 
-\b{A}^{-1} \b{B} \b{Q}^{-1} \b{B}^{-1} \\
-\b{Q}^{-1} \b{C} \b{A}^{-1} & \b{Q}^{-1}
\end{pmatrix}$$

We could also have used:

$$\b{P} = \b{A} - \b{B} \b{D}^{-1} \b{C}$$

Following [here](https://en.wikipedia.org/wiki/Invertible_matrix#Blockwise_inversion) the two forms can be equated and give some identities that I don't care about. 

There's also [Hua's identity](https://en.wikipedia.org/wiki/Hua%27s_identity) in any division ring, 

$$(\b{A} + \b{B})^{-1} = \b{A}^{-1} - (\b{A} + \b{A}\b{B}^{-1} \b{A})^{-1}$$

[And](https://en.wikipedia.org/wiki/Sherman%E2%80%93Morrison_formula):

$$(\b{A} + u \otimes v)^{-1} = \b{A}^{-1} + \frac{\b{A}^{-1} (u \otimes v) \b{A}^{-1}}{1 + v\b{A} u}$$


-----

Also related:

The characteristic polynomial of a matrix is given by $$\det(A - \lambda I)$$, and it has coefficients which are the symmetric polynomials in the eigenvalues $$\lambda_i$$:

$$\det(A - \lambda I) = (-\lambda)^n + (\sum \lambda_i) (-\lambda)^{n-1} +(\sum \lambda_i \lambda_j) (-\lambda)^{n-2} +  \ldots + (\prod \lambda_i)$$

These coefficients can also be thought of as -- I think? -- the traces of the wedge powers of $$A$$:

$$= (-\lambda)^n  + \tr(\wedge A) (-\lambda)^{n-1} + \tr(\wedge^2 A) (-\lambda)^{n-2} + \ldots + \tr(\wedge^n A) = \sum (-\lambda)^{n-k} \tr(\wedge^k A)$$

The [Cayley-Hamilton theorem](https://en.wikipedia.org/wiki/Cayley%E2%80%93Hamilton_theorem) says that $$A$$ is a solution to its own characteristic polynomial, if it is thought of as applying to matrices instead of scalars:

$$\sum (-A)^{n-k} \tr(\wedge^k A)  = 0$$

Each of these $$\tr(\wedge^k A)$$ terms can also be written in terms of traces of powers of $$A$$; see [here](https://en.wikipedia.org/wiki/Faddeev%E2%80%93LeVerrier_algorithm) and [here](https://en.wikipedia.org/wiki/Exterior_algebra#Leverrier's_Algorithm):

$$\tr(\wedge^2 A) = \frac{1}{2}((\tr A)^2 - \tr A^2)$$

$$\tr(\wedge^3 A) = \frac{1}{6}((\tr A)^3  -  3(\tr A^2) (\tr A) + 2 \tr A^3)$$

These also give formulas for $$\det A$$ in $$N = 2, 3$$ respectively, also, since for $$A \in \bb{R}^{N}$$, $$\tr(\wedge^N A) = \det A$$.

-----------------

All of these matrix identities might be seen as "easy to check identities for non-commutative arithmetic in general".

Consider also that you can figure out the correct forms of things like $$\frac{d}{dt} \b{A}^{-1}$$ via $$\frac{d}{dt} (\b{A} \b{A}^{-1}) = 0$$. (It's $$d_t \b{A}^{-1} = -\b{A}^{-1} d_t \b{A} \b{A}^{-1}$$, as it happens!)


------------

## 4

An idea: maybe we're carrying around all the coefficients in vector spaces entirely inadvertently. It seems like all of these properties may come from:

1. considering formal direct products and sums of _sets_ like $$(\b{x}, \b{y}, \b{z})$$.
2. enforcing multilinearity, thus fixing the behavior of the vector space that has these sets as basis elements.

## 5

The [shoelace formula](https://en.wikipedia.org/wiki/Shoelace_formula) for the area of polygon is:

Given a polygon made of vectors: $$P = (p_0, p_1, p_2, \ldots, p_n)$$, the area of $$P$$ is given by:

$$Vol(P) = \frac{1}{2}\sum p_i \wedge p_{i+1}$$

where the sum wraps around so the last term is $$p_n \wedge p_0$$

It's almost certainly not correct to consider the _list_ $$P$$ as a _matrix_ $$P_{ij}$$ -- since, like, its size can be expanded to anything, so what is the 'basis'?

But it might be some 'other kind' of object, such that the formula for $$Vol(P)$$ would be given by $$P \wedge P$$ (or, in $$N$$ dimensions, $$\wedge^N P$$). The difference is that we only wedge _adjacent_ elements of the matrix, instead of every pair-wise combination.

Incidentally, this formula is a discrete approximation to calculating the area via an integral and Green's theorem:

$$Area(D) = \iint dx \wedge dy = \int x dy = - \int y dx = \frac{1}{2} \int x dy - y dx$$

(observe that $$d(x dy) = d(-y dx) = d(x dy - y dx) = dx \wedge dy)$$.)