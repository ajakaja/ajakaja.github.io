---
layout: article
title: "Wedge 2 notes"
footnotes: true
math: true
aside: true
---


Goal: to easily prove more complex determinant identities.


### 1. Quasideterminants

Term-by-term pseudo-determinants for non-commutative matrices. IE:

$$\begin{vmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{vmatrix}_{11} = a_{11} - a_{12} a_{22}^{-1} a_{21}$$

* Don't reduce to commutative determinants; instead: $$\|A\|_{ij} = (-1)^{i + j} \frac{\det A}{\det A_{\widehat{ij}}}$$
* But clearly related.
* Note that components of a matrix inverse look like the inverse of this: iirc $$(-1)^{i + j} \frac{\det A_{\widehat{ij}}}{\det A}$$.
* I expect that you can compute the wedge product of non-commutative vectors, but that it matters 'where you start', ie, cyclic rotations give different values.
* I expect that you can use this to compute determinants of block matrices, using the fact that no matter what order you do things in, $$\^^n$$ still gives commuting scalars. Given, for instance, commutators between columns, you can probably express intermediate steps?

### 2. Block Matrices in general

$$Q = \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$

$$\^^2 Q \stackrel{?}{=} \^^2 \begin{pmatrix} A \\ C \end{pmatrix} + \begin{pmatrix} A \\ C \end{pmatrix} \^ \begin{pmatrix} B \\ D \end{pmatrix} + \^^2 \begin{pmatrix} B \\ D \end{pmatrix}$$

It feels like equations like that should be valid, but it's not clear how they're computationally _useful_.

### 3. Schur Complement

[Wiki](https://en.wikipedia.org/wiki/Schur_complement)

$$Q = \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$

$$Q / D = D - C A^{-1} B$$

$$Q / A = A - B D^{-1} C$$

Useful because:

$$\det Q = \det (A) \det (D - C A^{-1} B)$$

Proof in matrices (basically, performing Gaussian elimination):

$$Q = \begin{pmatrix} A & 0 \\ 0 & 1 \end{pmatrix} \begin{pmatrix} 1 & 0  \\  C & 1 \end{pmatrix} \begin{pmatrix} 1 & A^{-1} B \\ 0 & D - C A^{-1} B \end{pmatrix}$$

Related to:

* quasideterminants (note that similarity between $$D - C A^{-1} B$$ and $$a_{11} - a_{12} a_{22}^{-1} a_{21}$$
* [Dodgson condensation from Schur complementation](https://terrytao.wordpress.com/2017/08/28/dodgson-condensation-from-schur-complementation/) (Terry Tao)
* [Berenzian](https://en.wikipedia.org/wiki/Berezinian) / 'superdeterminant': determinant over superalgebras, which I ... think... are matrices over $$\^^n V$$, partitioned into even- and odd- basis components? [discussion on SE](https://physics.stackexchange.com/questions/5005/velvet-way-to-grassmann-numbers?noredirect=1&lq=1)

### 4. Desnanot–Jacobi identity and Dodgson Condensation

Basic identity (super/subscripts are omitted rows/columns) :

$$\underset{n}{\det}(M)\underset{n-2}{\det}(M^{1,k}_{1,k}) = \begin{vmatrix} \underset{n-1}{\det}(M^1_1)  & \underset{n-1}{\det}(M^k_1) \\ \underset{n-1}{\det}(M^1_k) &  \underset{n-1}{\det}(M^k_k)\end{vmatrix}$$

* I suspect some sort of determinant of $$M \o M$$, expanded interestingly.
* related to hyperdeterminants? $$(\^^n \o \^^{n-2}) (M \o M) \lra (\^^{n-1} \o \^^{n-1}) (M \o M)$$?
 * nested determinants: need to figure out how to handle?
* [general version](https://terrytao.wordpress.com/2017/08/28/dodgson-condensation-from-schur-complementation/), apparently from Sylvester: $$\underset{n}{\det}(M) \underset{n-k}{\det}(M_S^S)^{k-1} =
 \underset{k}{\det}\big( \underset{n-k+1}{\det}(M_{S / \{j\}}^{S / \{j\}}) \big)$$

NB: it's probably easier to think about if you move the removed rows to the first two positions:

$$\underset{n}{\det}(M)\underset{n-2}{\det}(M^{n-1,n}_{n-1,n}) = \begin{vmatrix} \underset{n-1}{\det}(M^1_1)  & \underset{n-1}{\det}(M^{n-1}_{n}) \\ \underset{n-1}{\det}(M^n_{n-1}) &  \underset{n-1}{\det}(M^{n-1}_{n-1})\end{vmatrix}$$


### 5. Hyperdeterminants

Generalizations of determinants to tensors are called [hyperdeterminants](https://en.wikipedia.org/wiki/Hyperdeterminant).


* generally very cludgy; lots of symbosl and little intuition.
* what are they used for?
* [this guy](https://hyperdeterminant.wordpress.com/hyperdeterminant-index/) loves hyperdeterminants, but everything is very cludgy
* Desnanot identity might be determinant of $$M \o M$$
* [Cayley-Hamilton](https://en.wikipedia.org/wiki/Cayley%E2%80%93Hamilton_theorem) might be first-index determinant, second-index trace of $$(A \o I - I \o A)$$?

### 6. Trace and Contraction

* need a general theory of how wedge powers and contractions 'interoperate'.

CF Cayley Hamilton:

$$0 \stackrel{?}{=} (\^^n \o \tr^n) (A \o I - I \o A)$$

It's unclear how to correctly talk about the fact that the second argument becomes $$A^n$$ instead of $$\^^n A$$. What operation is that?

* Should mention somewhere that $$\Delta A \omega = (1 \o A + A \o 1) \omega = (\tr A) \omega$$, and etc for higher traces ($$\Delta^k \lra \tr \^^k A$$).
* Should mention how to derive traces of $$\^^k A$$: 
$$\Delta^2 A (x \^ y \^ z) = \Delta A (Ax \^ y \^ z + x \^ Ay \^ z + x \^ y \^ Az) \\
= (A^2 \o 1 \o 1 + 1 \o A^2 \o 1 + 1 \o 1 \o A^2) (x \^ y \^ z) + \\
(A \o A \o 1 + 1 \o A \o A + A \o 1 \o A) (x \^ y \^ z)$$
	* which says that $$(\tr A)^2 = \tr (A^2) + (\tr \^^2 A)$$
* those are the [invariants of tensors](https://en.wikipedia.org/wiki/Invariants_of_tensors)
* also probably worth mentioning how they work in diagonal basis (symmetric polynomials of eigenvalues)
* related: generalized eigenvalues? can we think of bivectors as eigenvalues, sorta?

### 7. Other matrix identities / ideas

* apparently: $$\det (\text{adj} \, A) = \det A^{n-1}$$, which seems plausible given that $$\text{adj}(A) = \^^{n-1} A$$
* There are multiple places (recall?) where it seems like $$A^T \lra \^^{-n} A$$ and $$A^{-1} \lra \^^{-1} A$$. Is that useful?
* $$\det(1_n + AB) = \det(1_m + BA)$$ [Sylvester Identity](https://terrytao.wordpress.com/2013/01/13/matrix-identities-as-derivatives-of-determinant-identities/) (another...)
* trace: $$\det(1 + \e A) = 1 + \tr(A) \e + o(\e^2)$$
* general theory of matrices as expansions of vectors?
* [Amitsur-Levitzki?](https://en.wikipedia.org/wiki/Amitsur%E2%80%93Levitzki_theorem): $$S = \sum_{\sigma \in S_{2n}} \sgn(\sigma) \prod_i A_{\sigma(i)} = 0$$
	* proof from [here](https://sci-hub.tw/https://doi.org/10.1007/BF02756797) (Rosset): define a new $$2n$$-dimension exterior algebra $$A = \sum A_i \b{x}_i$$, then $$A^{\^ 2n} = S \bigwedge_i \b{x}_i$$, but $$\tr A^2 = 0$$, and if $$\tr A^i$$ for $$i>0$$ is 0 then $$A^n = 0$$. How odd.
* Tao on [matrix identities](https://terrytao.wordpress.com/2013/01/13/matrix-identities-as-derivatives-of-determinant-identities/#aeps)
	* Generally the dream -- I guess -- is to find a way to think about all these doesn't take so many 'tricks', and just makes sense.
* Matrix reference: [here](http://www2.imm.dtu.dk/pubdb/views/edoc_download.php/3274/pdf/imm3274.pdf)
* Linear Algebra via Exterior book [here](http://www.math.umaine.edu/~weiss/books/linear_algebra_via_exterior_products.pdf)


**Proof ideas**:

* [Amitsur-Levitzki?](https://en.wikipedia.org/wiki/Amitsur%E2%80%93Levitzki_theorem): $$S = \sum_{\sigma \in S_{2n}} \sgn(\sigma) \prod_i A_{\sigma(i)} = 0$$
	* proof from [here](https://sci-hub.tw/https://doi.org/10.1007/BF02756797) (Rosset): define a new $$2n$$-dimension exterior algebra $$A = \sum A_i \b{x}_i$$, then $$A^{\^ 2n} = S \bigwedge_i \b{x}_i$$, but $$\tr A^2 = 0$$, and if $$\tr A^i$$ for $$i>0$$ is 0 then $$A^n = 0$$. How odd.

* Seems like there should be a counting argument: some space is $$2n-1$$ dimensional.
* $$A_1 A_2 - A_2 A_1$$ is a wedge product, I guess? in a space with non commutative entries?$$= [A_1, A_2] = (A_1 \b{x}_1) \^ (A_2 \b{x}_2)$$
* But then it would -- I would think -- be the tensor product $$A_1 \o A_2 - A_2 \o A_1$$; instead we have the trace of that: $$\tr_{23} A_1 \o A_2$$
* Even degree elements (each pair of matrices) -- in regular exterior algebra, commute with every element. What about in matrices..? 
	* ie: do antisymmetric matrices commute? I doubt it.
* what we need to show is... ? that the space of commutators is $$2n-1$$ dimensional?
* these are called [PI rings](https://en.wikipedia.org/wiki/Polynomial_identity_ring)
* related to C-H, noncommutative in general

### 8. Mixing input and output spaces of matrix

* [Sweeping a matrix rotates its graph](https://terrytao.wordpress.com/2015/10/07/sweeping-a-matrix-rotates-its-graph/) : makes Schur complement appear (also observes that Gaussian elimination is sheering and reflecting the graph, rather than rotating it)
* [Pfaffians](https://en.wikipedia.org/wiki/Pfaffian), which are bivectors crossing the input and output space?. cf my answer [here](https://math.stackexchange.com/questions/381290/simple-concise-proof-of-muirs-identity/2941298#2941298) and the explanation [here](https://math.stackexchange.com/questions/155429/existence-of-the-pfaffian?rq=1) which is similar but better.
* maybe related: [Cartan's Lemma](https://en.wikipedia.org/wiki/Cartan%27s_lemma), that $$\sum a_i \^ b_i = 0$$ means that you can write $$b_i = A_{ij}(a_j)$$, with symmetric $$A_{ij}$$, which seems odd, I guess?

### 9. $$\bb{C}$$ and $$\bb{H}$$

It's still not entirely obvious to me how to develop complex numbers and quaternions via exterior algebra, since we normally define the inner product such that $$\| x \^ y \|^2 = 1$$.

Also, still looking for an understanding of spinors and rotation via rotors, and why quaternion rotation / rotor rotation works.


### 10. Diffgeo / vector calc

Need to write out the exterior derivative and differential forms version of all this, plus figure out what's going on with Taylor series looking a lot like _symmetric_ powers of a vector space, plus make all the covariant derivative business + GR easy to understand.

* Also, all [div/curl/grad identities](https://en.wikipedia.org/wiki/Vector_calculus_identities) should be obvious : 
* need to better-understand Hodge-star and contraction for this .
* I don't, for instance see why the [Jacobi identity ](https://en.wikipedia.org/wiki/Jacobi_identity)) $$a \times (b \times c) + b \times (c \times a) + c \times (a \times b) = 0$$ is true.
* Nor $$(a \times b) \times (c \times d) = a \cdot (b \times d) c - a \cdot (b \times c) d$$
* And why does $$a \times (b \times c) = - (a \cdot b) c + (a \cdot c) b$$ have the negative signs like that?


### 11. cauchy-binet corollaries

I'm having trouble thinking.

What is true here?

1. if $$a = \begin{pmatrix} a_x \\ a_y \end{pmatrix}$$ then $$a^T a$$ has to have its _trace_ taken to extract its length. but $$a a^T$$ just equals its value.
2. $$k$$-volumes?
3. gram matrices as how inner products transform?

### 12. what to do

1. contraction and hodge star (which are closely related); go through the rest of the vector identities
2. exterior algebra for differential forms
3. discussion of definition of $$\^$$, and the jacobi identity $$[[a,b],c] + [[b,c],a] + [[c,a],b] = a \^ b \^ c - a \^ b \^ c = 0$$?
4. non-commutative coefficients: Amitsur-Levitzki, for one, and differentials (are functions elements of the symmetric algebra?). but also: matrices of matrices, block matrix identities. I haven't figured out to represent those comfortably, though. Is there a way to prove those identities that _doesn't_ amount to just repeated the matrix manipulations, but in wedge product notation?
5. cayley hamilton, partial inverse, hyperdeterminants: things which wedge over one set of components in a tensor.
6. I still don't see how traces fit into all this, but it would be good to show the trace derivations involving $$\Delta$$?
	* I still don't understand the interaction between symmetrization and antisymmetrization
7. K-volumes and projections?