---
layout: article
title: "Matrix Invariants"
math: true
category: notes
---

The characteristic polynomial $$\chi_A$$ of an $$N\times N$$ matrix is given by 

$$\chi_A(\lambda) = \det(A - \lambda I)$$

Its coefficients are traces of 'wedge powers' of the $$A$$. The two well-known ones are $$\wedge^1 A = A$$ and $$\wedge^N A$$, whose traces are $$\tr A$$ (the regular trace) and $$\tr \wedge^N A = \det A$$:

$$\begin{aligned}
\chi_A(\lambda) &= (-\lambda)^N + (\tr A) (-\lambda)^{N-1} + \ldots + (\tr \wedge^{N-1}A) (-\lambda) + \det A \\ &= \sum_N (-\lambda)^k \tr(\wedge^{N-k} A) \end{aligned}$$

This equation's real (+complex, if necessary) roots are of course the eigenvalues of $$A$$, which I will call $$a_i$$:

$$\chi(a_i) = 0$$

The [Cayley-Hamilton theorem](https://en.wikipedia.org/wiki/Cayley%E2%80%93Hamilton_theorem) says that $$A$$ is a solution to its own characteristic equation, expanded to operate on matrices:

$$\chi(A) = 0_N$$

(Note that this is _not_ provable by just writing $$\det(A - AI) = \det(0)$$, for a few reasons: it's not saying it's equal to 0 at all, but to the 0 _matrix_, and because, well, that 'technique' would prove false formulas like $$\text{perm}(A - AI) = 0$$ also, which is false. (Where 'perm' is the permanent function, the determinant with all plus signs))

-------

Proofs of C-H seem to be complicated.

Well, not always. It's easy to prove if $$A$$ is diagonalizable: $$ A = P^{-1} \Lambda P$$. Then all the $$P$$'s factor out of the sum and all the diagonal entries, being eigenvalues, immediately become 0.

If $$A$$ is not diagonalizable, it has at least a Jordan Normal form, and you can argue based on how the equation acts on that. But it seems to be in that class of proofs that move away from the intuitive understanding of what's going on before circling back. I have a hunch there's a more direct interpretation that makes the result obvious.

Regardless of whether $$A$$ is diagonalizable, the traces are given by the _symmetric sums of eigenvalues_.

$$\begin{aligned}
\tr \; A&= \sum a_i \\
\tr \wedge^{2} A &= \sum_{i \neq j} a_i a_j = \frac{1}{2!} \sum_{ij} a_i a_j \\
\vdots \\
\tr \wedge^{N} A &= \prod a_i = \det A
\end{aligned}$$

It is interesting that there are $$\binom{N}{k}$$ terms in each sum. Somehow it makes the expression for $$\chi_A(\lambda)$$ look a _lot_ like a binomial expansion:

$$(A - \lambda I)^{N} = \sum \binom{N}{k} (-\lambda)^{k} A^{N-k} \stackrel{?}{\Lra} \chi_{A} \sum (-\lambda)^k \tr(\wedge^{N-k} A)$$

I wonder if this can lead us to an understanding that makes the C-H result obvious (for non-diagonal matrices, where it is otherwise nontrivial).

## 2

We should discuss $$\wedge^k A$$ more, first.

Recall that the wedge product turns a vector space $$V$$ into a _graded algebra_, and go look that up. What's important is:

* $$\b{u} \wedge \b{v} = \b{u} \otimes \b{v} - \b{v} \otimes \b{u}$$ (definition)

* $$\Ra \b{u} \wedge \b{u} = 0$$ (consequence of antisymmetry.)

(Note we pretend that $$0 \simeq 0_{N}$$ and really if you worry too much about what spaces these live in you might get in trouble. ACTUALLY, you can treat $$\wedge^{k} V$$ as antisymmetric elements of $$V^{\otimes k}$$ if you want, when $$k > 1$$.)

$$\wedge^k V$$ is spanned by wedge products of $$k$$ basis vectors at a time of $$V$$. For example, in $$\bb{R}^{3}$$, the bases are:

$$
\begin{aligned}
\wedge^0 V &\simeq \b{R} \\
\wedge^1 V &= span(\b{x}, \b{y}, \b{z}) \simeq V \\
\wedge^2 V &= span(\b{y \wedge z}, \b{z \wedge x}, \b{x \wedge y}) \\
\wedge^3 V &= span(\b{x \wedge y \wedge z})
\end{aligned}$$

We will sometimes write $$\bar{\b{x}}$$ to indicate the wedge product of "everything except $$\b{x}$$". So the basis of $$\wedge^{2} \bb{R}^{3}$$ is $$(\b{\bar{x}}, \b{\bar{y}}, \b{\bar{z}})$$.

$$\b{x \wedge y \wedge z}$$ is the unit pseudoscalar, ie, volume element. The choice of $$\b{x \wedge y \wedge z}$$ as the basis element (instead of a negative permutation thereof) assigns an orientation to the space. We will often just write it as $$\b{i}$$, for analogy with complex numbers. Maybe we should try $$\overline{1}$$?)

In general $$\wedge^k V$$ for $$N$$-dimensional V has $$\binom{N}{k}$$ basis elements. In $$\wedge^{N-1}$$ it is easy to order them (for each basis element, write the pseudovector element that omits that element.) But for instance, the space $$\wedge^{2} \bb{R}^4$$ has no particular nice ordering of basis elements, and it shouldn't really matter anyway.

-----------

$$\wedge^k A$$ is a matrix over the vector space $$\wedge^k V$$ (with V the underlying vector space and $$A : V \ra V \simeq V \otimes V^{*}$$). This means $$\wedge^k A \in (\wedge^k V) \otimes (\wedge^k V)^{*}$$.


The matrix $$\wedge^k A$$ has one element per basis element of $$\wedge^{k} V$$. _Specifically_, the elements are given according to the formula evident here:

$$A(\b{x} \wedge \b{y}) = (A \b{x}) \wedge (A\b{y}) = A \bar{\b{z}}$$

Since $$A$$ itself may be written as a list of column vectors $$A = \begin{pmatrix} A_x & A_y & A_z \end{pmatrix}$$, and multiplication by a basis vector just extracts a column: $$A \b{x} = A_x$$, the matrix $$\wedge^{2} A$$ is just given by:

$$\wedge^{2} A = \begin{pmatrix}A\bar{\b{x}} & A\bar{\b{y}} & A\bar{\b{z}} \end{pmatrix}$$

(Again, the order of the columns just depends on the choice of basis, which is conventioned in 3d but not really important otherwise!)

Because there is evidently one value of $$A$$ for every multivector basis element, we'll just use a subscript to select them:

$$A_{\b{b}} \equiv A(\b{b})$$

ie:

$$A_{\b{x} \wedge \b{y}} \equiv A \b{x} \wedge A \b{y}$$

### An application: matrix inverses

Suppose $$B \in \bb{R}^{N}$$ is invertible, ie has $$\det B \neq 0$$. Compute $$B^{-1}$$. 

Label the basis vectors as $$\b{x}_j$$. Since $$\det B \neq 0$$, $$B_{\b{i}}  = \bigwedge_j B_{\b{x}_j} \neq 0$$.

Note that: 

$$B_{\b{\bar{x_j}}} \wedge B_{\bar{x_j}} = B_{\b{i}} = \det B$$

Therefore the matrix in $$\wedge^{N-1} \bb{R}^{N}$$ given here is the inverse of $$B$$:

$$B^{-1} = \frac{1}{\det B} \begin{pmatrix} B_{\bar{\b{x}_j}} \end{pmatrix} = \frac{1}{\det B} \wedge^{N-1} B$$

Because:

$$\begin{pmatrix} B_{\b{x}_j} \end{pmatrix} \frac{1}{\det B} \begin{pmatrix} B_{\bar{\b{x}_k}} \end{pmatrix} = \frac{1}{\det B} \begin{pmatrix} B_{\b{i}} \delta_{jk} \end{pmatrix} = \1_{N}$$

That is: we make the $$j$$'th column of $$B^{-1}$$ equal to the wedge products of all the other columns of $$B$$ except the $$j$$'th. This is guarantee to wedge to 0 with any of those columns, and guaranteed to wedge to $$\det B$$ with $$B_j$$.

The matrix $$\begin{pmatrix} B_{\bar{\b{x}_j}} \end{pmatrix}$$ is called the 'adjugate matrix', but it is really just $$\wedge^{N-1} B$$.

Similarly, $$\frac{1}{\det B} \wedge^{N-k} B$$ is a matrix inverse (in $$\binom{N}{k}$$-dimensional space $$\wedge^{k} \bb{R}$$) of $$\wedge^{k} B$$.

### Traces

The trace of a matrix is the sum of its diagonal elements, and is -- somehow, despite the fact that it deletes most of the matrices' information!? -- invariant under changes of basis. In a diagonal basis with eigenvalues on the diagonal, it's evidently the sum of the eigenvalues:

$$\tr A = \sum a_i$$

The determinant of a matrix is also invariant under change of basis. In a diagonal basis it's evidently the product of the eigenvalues:

$$\det A = \prod a_i$$

However, this may be better understood as the trace of a 1-dimensional matrix $$\wedge^{N} B = \det B \b{i}$$

For non-diagonalizable matrices, the Jordan normal form is usable and shows that all the off-diagonal terms cancel out, leaving both formulas correct.

The intermediate dimensional traces $$\tr (\wedge^{k} A)$$ can be seen from considering the $$\wedge^{k} A$$ in a diagonal basis. For instance, if:

$$A_{diag} = \begin{pmatrix} a_1 & 0 & 0 \\ 0 & a_2 & 0 \\ 0 & 0 & a_3 \end{pmatrix}$$

Then, say, $$\wedge^2 A =$$

$$\begin{pmatrix} a_2 a_3 & 0 & 0 \\ 0 & a_3 a_1 & 0 \\ 0 & 0 & a_1 a_2 \end{pmatrix}$$

(considered via computing the wedge products of the columns of $$A_{diag}$$, ie, $$(\wedge^2 A)_1 = A_2 \wedge A_3$$).

These are therefore the symmetric sums of $$k$$ eigenvalues. The same logic applies to non-diagonalizable, since all the off-diagonal elements in Jordan normal form happily cancel. So:

$$\tr (\wedge^k A) = \sum_{\binom{N}{k}} \prod_{k \text{ factors}} a_i$$

(I would like to find a more precise argument for this, though...)

(... Without resorting to writing down these matrices as sums with signed permutations...)

-------

Alternatively, we can use the wedge product definition $$\b{u} \wedge \b{v} = \b{u} \otimes \b{v} - \b{v} \otimes \b{u}$$ to verify this by hand.

$$A \b{x}_i$$ in a summation notation is $$A_i^j x^i$$. A tensor product in summation notation can be written as $$\b{u} \otimes \b{v} \equiv u^i v^j$$. So:

Therefore:

$$A \b{x}_i \wedge A \b{x}_j \equiv (A_i^k x^i) \wedge (A_j^l x^j) = (A_i^k x^i) (A_j^l x^j) -(A_i^l x^i) (A_j^k x^j)$$

The trace then sums over $$i,j$$ (via $$\b{x}_i \wedge \b{x}_j \cdot (A \b{x}_i \wedge A \b{x}_j)$$), which gives:

$$\tr (\wedge^{2} A) = (A_k^k) (A_l^l) -(A_k^l) (A_l^k) = \sum a_k a_l$$

(The second term cancels if $$A$$ is diagonal or triangular (Jordan form).)

## Back to C-H

