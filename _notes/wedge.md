---
layout: article
title: "Exterior Algebra Notes"
footnotes: true
math: true
aside: true
---

Reminder to self:

An $$m \times n$$ matrix has $$m$$ **rows** and $$n$$ **columns**, and the rows are indexed first:

$$A_{ij} = \begin{pmatrix} 
A_{11} & A_{12} & \cdots & A_{1n} \\
A_{21} & A_{22} & \cdots & A_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
A_{m1} & A_{m2} & \cdots & A_{mn} \end{pmatrix}$$

The $$k$$'th column is given by $$\vec{A}_k = A_{ik}$$.

# 1 Identities

One way to define inner products on $$\wedge^k V$$:

$$\< \bigwedge_i a_i , \bigwedge_j b_j \> = \det \< a_i, b_j \> \tag{1}$$

Aside on why, copied from another page:

<aside id="innerproduct" class="toggleable hidden" placeholder="<b>Aside</b>: Explanation of inner products <em>(click to expand)</em>">

------

**Inner products on $$\^^k V$$**

Recall that the exterior algebra $$\^^V$$ is a _quotient algebra_ of the tensor algebra $$\otimes V$$ by the subspace of tensors which are symmetric in one position, like $$x \otimes x$$ and $$x \otimes y + y \otimes x$$.

Basically, we write any tensor like $$x \otimes (x + y)$$ as its [part with no symmetry] plus [part with symmetry], and we 'forget' the details of the second part:

$$x \otimes (x + y) \sim x \otimes y + \stackrel{??}{I}$$

The inner product on $$V$$ canonically extends to $$V \otimes V$$ by just operating componentwise: $$\< a \otimes b, u \otimes v \> = \< a, u\> \< b, v \>$$. But in $$\^^V$$, we don't know if $$u \otimes v + I$$ is really $$-v \otimes u$$. The only sensible way to create an inner-product-like operation is to totally antisymmetrize one of the arguments:

$$\< \alpha, \beta \>_{\^} = \< \alpha + I, \text{Asym} (\beta + I) \>_{\otimes}$$

Where $$\text{Asym}$$ is defined on simple tensor products like this:

$$\text{Asym} (\otimes_{i = 1}^k a_i ) = \sum_{\sigma \in S_k} \sgn(\sigma) \bigotimes_i a_{\sigma(i)}$$

This eliminates the $$I$$ term on the right side of the inner product (because it is symmetric in at least one two indices), and the antisymmetrization means that the $$I$$ term on the left will eliminate itself as well (because it will multiply by something antisymmetric in every index, including whichever ones it is symmetric in). 

This definition extends the same way to any $$\^^k$$, and linearly to the rest of the exterior algebra (or sesquilinearly if working over $$\bb{C}$$). 

We can see that it doesn't matter if we antisymmetrize the first or second argument, as long as we do _one_ of them. (Relabeling $$i \mapsto \sigma^{-1}(i)$$ and $$\sigma \lra \sigma^{-1}$$, and recalling that $$\sgn(\sigma) = \sgn(\sigma^{-1})$$, shows that this is equivalent to $$\sum_{\sigma \in S_k } \sgn(\sigma) a_{\sigma(i)} (b_i)$$, so we can choose to antisymmetrize either argument. Therefore it's really implementing something like (in quantum-mechanics notation) $$\< \alpha, \beta \> = \< \alpha \| \text{Asym} \| \beta \>$$.)

(This is _my_ intuition for this definition. I'm not sure if it's the best argument. Note that my $$\text{Asym}$$ is the normal $$\text{Alt}$$ operator, but without the factor of $$\frac{1}{k!}$$.)

We can see that this just creates the determinant, because the is same sum of permutations if how the determinant is defined:

$$\< \bigwedge_i a_i , \bigwedge_j b_j \> = \sum_{\sigma \in S_k} \sgn(\sigma) \prod_i \< a_i , b_{\sigma(i)} \> = \det \< a_i, b_j \>$$

This determinant is sometimes called the [Gram determinant](https://en.wikipedia.org/wiki/Gramian_matrix#Gram_determinant).

While the formula $$\det \< a_i, b_j \> $$ is easy enough to understand, I prefer not to use it, because it's better to prove things without indices. The logic that we have to scramble one side of the product continues to work when we're not computing inner products but _contractions_, as we'll see later.

Incidentally, this suggests that we might take this as the _definition_ of the determinant:

$$\det A = \< x_1 \^ x_2 \^ \ldots x_N, A_1 \^ A_2 \^ \ldots A_N \> = \< \omega, \^^N A \> $$

It's easy to see that this equals $$\det \< x_i, A_j \> = \det A$$. Really, the important part of this definition is $$\^^N A$$, which wedge-products all of $$A$$'s columsn together. The inner product just extracts the scalar coefficient by removing the $$\omega$$ 'unit vector'.

</aside>

Either way, what's key is that $$(x \^ y) \cdot (x \^ y) = 1$$, not $$2$$.

(identities removed because they're in a blog post)

# 2. Hodge Star

Which is more fundamental, $$\cdot$$ or $$\star$$?

------

I wonder about this. Each can be defined in terms of the other. Since

$$\star(x_1 \^ x_2 \^ \ldots x_k) = x_{k+1} \^ \ldots x_N$$

We can define the inner product as the coefficient of the wedge product with the Hodge dual:

$$\< x \^ y , x \^ y \> = (x \^ y) \^ \star(x \^ y)\\
= \boxed{1}(x \^ y) \^ z $$

$$\< a_x x + a_y y , x + y \> = (a_x x + a_y y) \^ (y \^ z + z \^ x) = a_x + a_y$$

This works, and doesn't involve _any_ weird antisymmetrization, $$\text{Alt}$$ operators, or arbitrary metrics. We can define "extract of the coefficient of the volume element" itself as $$\star \omega \in \bb{R}$$, so:

$$\< u, v \> = \star (u \^ \star v)$$

We'd like to also support contraction, which is basically the inner product extended to not-like-grade elements. We know that this should be true:


$$x \cdot (x \^ y) \stackrel{?}{=} y$$

But the sign is wrong:

$$= \star(x \^ \star(x \^ y)) \stackrel{??}{=} -y$$

Did we define it wrong? Should $$x \cdot (x \^ y)$$ actually equal $$-y$$? How would we deal with the dual version of this, $$ x \^ y \cdot x$$?

----------

The main point of concern: okay, we've deleted the metric. Now how would we do, say, relativity, which neads $$t \cdot t = -1$$? Or even how would we use complex numbers or quaternions?

If the unit volume form is $$ t \^ x \^ y \^ z$$, then we could _define_ $$\star t = - x \^ y \^ z$$, such that $$t \^ \star t = -1$$, I guess? It's the same as supplying a metric, I guess. But maybe also it captures the symmetry of the metric in a single relationship?

------

Note to self: **behavior of the Hodge Star's inverse and square**

If $$\star x = y \^ z$$ then $$\star y \^ z = x$$, right? But not true in all dimensions. For one thing, at least if you define the Hodge Dual from the metric, the signature of the metric $$s = \det g$$ comes into it (which is $$-1$$ for Minkowski space). But even in $$+,+,+,+$$ $$(w,x,y,z)$$ space, it's not true:

$$\star w = x \^ y \^ z$$

$$\star (x \^ y \^ z) = -w$$

Because $$(x \^ y \^ z \^ -w = +1 w \^ x \^ y \^ z$$

In fact the rule is:

$$\star^2 = (-1)^{k(n-k)} s$$

And therefore:

$$\star^{-1} = (-1)^{k(n-k)} s \star$$

# 3. Determinant Generalizations

The dot product definition (1) means that $$\det(AB) = \det(A) \det(B)$$ generalizes to non-square matrix multiplication, via:

$$\wedge^k A \cdot \wedge^k B = \det (A_i \cdot B_j)$$

But $$AB = A_i^j B_j^k$$, so this is the same thing?

$$\wedge^k (A \cdot B) = \det(A^i_j B^j_k)$$


---------

Generalizations of determinants to tensors, called [hyperdeterminants](https://en.wikipedia.org/wiki/Hyperdeterminant), and to matrices over non-commutative spaces, called [quasideterminants](https://en.wikipedia.org/wiki/Quasideterminant). 


I have not found any particularly useful intuition for hyperdeterminants, but it stands to reason that _one_ sense in which you may take a determinant-like-thing of, say, a rank $$3$$ tensor, would be to create one determinant per component, as a sort of vector, related to tensor contraction. So, something like $$\det T_{ij}^k \approx \det^i_k T_{ij}^k$$, where the last thing is a vector that varies in $$j$$.

Quasideterminants, meanwhile, are interesting because it turns out you _can't_ create a single thing for a non-commutative matrix that generalizes cleanly to the regular determinant when commutativity is restored. Instead, you get a 'ratio' thing, one per component of the original matrix. The quasideterminant on a commutative matrix has components:

$$|A|_{ij} = (-1)^{i + j} \frac{\det A}{\det A_{\widehat{ij}}}$$

Where $$A_{\widehat{ij}}$$ is $$A$$ with the $$i$$'th row and $$j$$'th column removed.


The obvious reason why determinants of non-commutative matrices (with elements from a ring, instead of a field, so they are maps between $$R$$-modules?) are attractive is because matrices themselves are non-commutative, so for instance we could write the determinant of a block matrix:

$$Q = \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$

------

Related:

$$\det Q = \det (A) \det (D - C A^{-1} B)$$

Proof:

$$Q = \begin{pmatrix} A & 0 \\ 0 & 1 \end{pmatrix} \begin{pmatrix} 1 & 0  \\  C & 1 \end{pmatrix} \begin{pmatrix} 1 & A^{-1} B \\ 0 & D - C A^{-1} B \end{pmatrix}$$

-------

Anyway, it's clear that if we write a square matrix as two non-square parts: $$Q = \begin{pmatrix} A & B \end{pmatrix}$$, where $$Q$$ is $$N \times N$$, $$A$$ is $$N \times k$$, and $$B$$ is $$N \times (N - k)$$, then:

$$\det Q = \^^N Q = (\^^k A) \^ (\^^{N - k} B)$$

Another cases to consider: suppose we just want $$\^^2 Q$$? There is an entry for every pairwise wedge of columns of $$A$$, one for each pair of columns of $$B$$, and then one per selection of columns split between the two. Something like:

$$\^^2 Q = \begin{pmatrix} \^^2 A & A \^ B \\ B \^ A & \^^2 B \end{pmatrix}$$

-------

What about for larger?

If $$Q = (A, B, C)$$ then:

$$\^^k Q = \sum_{a + b + c = k}=  A^{\^ a} \^ B^{\^ b} \^ C^{\^ c}$$

----------

Even larger?

Suppose $$R = \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$

With $$N = k + m$$, and block sizes:

$$\begin{pmatrix} k \times k & k \times m \\ m \times k & m \times m \end{pmatrix}$$

(In terms of the decomposition $$V = V_1 \oplus V_2$$, this is $$R = A_{V_1 \otimes V_1^*} \oplus B_{V_1 \otimes V_2^*} \oplus C_{V_2 \otimes V_1^*} \oplus D_{V_2 \otimes V_2^*}$$)


Then something like this should hold (abbreviating all the operations, so multiplication here is the wedge product and addition is the direct sum):

$$R^2 = A^2 + B^2 + C^2 + D^2 + AB + AC + AD + BC + BD + CD$$

There are of course $$BA$$, $$CA$$, etc terms, also, but they should (we intuit) be the same as their opposites so we omit them.

Equivalently, we can try to write a closed expression for $$\det R = R^{\^ N}$$:

$$R^{\^ N}= \bigoplus_{a + b + c + d = N} A^{\^ a} \^ B^{\^ b} \^ C^{\^ c} \^ D^{\^ d}$$


But a lot of these terms cancel out in confusing ways.

-------


This is getting hard to think about. We need an example. Let's do $$N = 4$$, $$k = m = 2$$. Then:

$$R^{\^4} = \^^2 \begin{pmatrix} A \\ C \end{pmatrix} \bigwedge \^^2 \begin{pmatrix} B \\ D \end{pmatrix}$$

Which is much easier to work with if we write it as:

$$\begin{aligned} &= (A^{\^2} + A \wedge C + C^{\^ 2}) \wedge (B^{\^2} + B \wedge D + D^{\^ 2}) \\
&= \cancel{A^{\^2} B^{\^2}} + \cancel{A^{\^2} (B \wedge D)} + A^{\^2} D^{\^2} \\
&+ \cancel{A \^ C B^{\^2}} + A \^ C \^ B \^ D + \cancel{(A \^ C) D^{\^2}} \\
&+  C^{\^2} B^{\^2} + \cancel{C^{\^2} (B \wedge D)} + \cancel{C^{\^2} D^{\^2}} \\
&= A^{\^2} D^{\^2} + A \^ C \^ B \^ D  + C^{\^2} B^{\^2}
\end{aligned}$$

Where I have cancelled out any term that has more than two factors from $$(A,B)$$, $$(A,C)$$, $$(B,D)$$, or $$(C,D)$$.


Imagine for a second that $$A^{-\^ 1}$$ means something (presumably, $$= A^{-1}$$). Then:

$$\begin{aligned} &= A^{\^2} D^{\^2} + A \^ C \^ B \^ D  + C^{\^2} \^ B^{\^2}\\
&= A^{\^2} \big(D^{\^2} + A^{-\^1} \^ C \^ B \^ D + A^{-\^2} \^ C^{\^2} \^ B^{\^2} \big) \\
&= A^{\^2} \big(D^{\^2} - C \^ A^{-\^ 1} \^ B \^ D + C^{\^2} \^ A^{-\^2} \^ B^{\^2} \big)\\
& \stackrel{?}{=} A^{\^2} (D - C \^ A^{-1} \^ B)^{\^2} \\
& \stackrel{?}{=} \det (A) \det (D - C A^{-1} B) \end{aligned}$$

-----

# Other formulas

that we'd like to prove trivially and generalize:

The [matrix determinant lemma](https://en.wikipedia.org/wiki/Matrix_determinant_lemma):

$$\det(\b{A} + \b{u} \otimes \b{v}) = (1 + \b{v} \b{A}^{-1} \b{u}) \det (\b{A})$$

A [crazy formula](https://en.wikipedia.org/wiki/Block_matrix#Block_matrix_inversion) for inverting a block matrix, which is interesting-ish but can't be that intuitively useful. If we write:

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

There's also [Dodgson Condensation](https://en.wikipedia.org/wiki/Dodgson_condensation), which is a way of computing determinants using the "Desnanot–Jacobi" identity:

$$\det(M)\det(M^{1,k}_{1,k}) = \det(M^1_1) \det(M^k_k) - \det(M^k_1)\det(M^1_k)$$

Where $$M_{I}^{J}$$, with $$I$$ and $$J$$ lists of indexes, is the matrix $$M$$ with the $$I$$'th rows and $$J$$'th columns deleted.

Also: [Pfaffians](https://en.wikipedia.org/wiki/Pfaffian) are intriguing. Presumably there are higher-order things like that on any antisymmetric $$T \in \o^k V$$. 

In fact I know : an antisymmetric matrix $$\in V^* \otimes V$$ may be considered as an element $$\vec{v} \in \wedge^2 V$$, but the determinant is different. The pffaffian is $$\wedge^{n/2} \vec{v}$$ (which is non-zero because $$\vec$$ is a compound bivector). The trick is sorting out what a determinant is on a matrix -- it's antisymmetric in each index, but NOT in the whole thing, so the unit volume element is $$\wedge^n V^* \otimes \wedge^n V$$. $$\vec{v}$$ is exactly 'half' of this, an element of $$\wedge^n V$$.

possible source for a bunch of stuff re: cauchy-binet? but in theoretic terms: [A multilinear algebra proof of the Cauchy-Binet formula and a multilinear version of Parseval’sidentity](https://arxiv.org/pdf/1305.0644.pdf) (Konstantopoulos).

cauchy-binet-type formulas on matrices in noncommutative rings: [Noncommutative determinants, Cauchy–Binet formulae, and Capelli-type identities](https://arxiv.org/pdf/0809.3516.pdf) (Caracciolo, Sokal, Sportiello).

[other](https://www.researchgate.net/publication/260634228_New_Method_to_Calculate_Determinants_of_nn_n_3_Matrix_by_Reducing_Determinants_to_2nd_Order) determinant methods.

## Physics things

I need to check that $$F = q v \times B$$ is 'really' $$F = q v \cdot \beta$$.

I need to check that the argument is sound that $$H_q dq + H_p dp = 0 \Lra (dq, dp) = \star (H_q, H_p) = (H_p, - H_q)$$


# Reference


## Use of $$\wedge$$

Antisymmetry dictates that $$u \wedge v = - v \wedge u$$ and $$ u \wedge u = 0$$. In a compound product, a vector may be moved around and a factor of $$-1$$ is picked up each time:

$$a \wedge b \wedge c = - b \wedge a \wedge c = b \wedge c \wedge a$$

If $$\beta$$ is an arbitrary wedge product of $$p$$ factors and $$a$$ is a single vector, then we have to move $$a$$ each of the $$p$$ terms to move it across $$\beta$$:

$$a \wedge \beta = (-1)^p \beta \wedge a$$

if $$\alpha$$ is a wedge product of $$q$$ factors, then to swap the product $$\alpha \wedge \beta$$ we have to move each term of $$\alpha$$ over each term of $$\beta$$:

$$\alpha \wedge \beta = (-1)^{pq} \beta \wedge \alpha$$

Wedging on the left by a vector $$v$$ is a linear transformation:

$$v \wedge (c \alpha + d \beta) = c (v \wedge \alpha) + d (v \wedge \beta)$$

Thus we can define a linear operator $$L_v$$, whose action on a multivector is $$L_v (\beta) = v \wedge \beta$$. Its properties are:

$$L_v^2 = 0$$

$$L_u L_v = - L_v L_u$$

$$L_u (\alpha \^ \beta) = L_u (\alpha) \^ \beta + (-1)^p \alpha \^ (L_u \beta)$$

-----


## Contraction

Suppose our vector space $$V$$ has an inner product $$\< e_i, e_j \> = 1_{ij}$$. (I prefer $$1$$ to $$\delta$$ because, well, it's the identity matrix). This inner product defines dual or covectors $$e^i = \< e^i, \_ \>$$, which are linear maps that take $$V \ra \bb{R}$$ via $$e^i (e_j) = \< e^i, e_j \> = 1_{ij}$$, and are elements of the dual vector space $$V^*$$.

We would naturally like to extend this inner product to act on multivectors such as $$(x \wedge y) \cdot (x \wedge y) = 1$$.

First, we'll define the operation of one covector on a multivector, which is called _contraction_, insertion, or the [interior product](https://en.wikipedia.org/wiki/Interior_product). It is written as $$i_v^*$$:

$$\begin{aligned} i_{v^*} x \^ y \^ z &= i_{v^*} (x(yz - zy) + y(zx-xz) + z(x y-yx)) \\
&= v^*(x) (yz-zy) + v^*(y) (zx-xz) + v^* (z)(xy-yx) \\
&= v_x (y \^ z) + v_y (z \^ x) + v_z (x \^ y) \end{aligned}$$

$$i_v^*$$ is a linear operator on multivectors which lowers their grade by one:

$$i_v^* (c \beta + d \gamma) = c i_v^* (\beta) + d i_v^* (\gamma)$$

We will often write it as a dot product with the vector $$v$$, if we have a metric available to let us identify $$v \lra v^*$$:

$$i_{v^*} \beta \equiv v\cdot \beta$$

We can write this behavior out directly on the wedge products. Assume that the wedge product with a scalar is just scalar multiplication, so $$c \^ v = cv$$ for scalar $$c$$.

$$\begin{aligned} v \cdot (x \^ y \^ z) &= (v \cdot x) \^ y \^ z - x \^ (v \cdot y) \^ z + x \^ y \^ (v \cdot z) \\
&= v_x (y \^ z) + v_y (z \^ x) + v_z (x \^ y) \end{aligned}$$

What happens if we do it again?

$$\begin{aligned} v \cdot (v \cdot (x \^ y \^ z) &= v \cdot (v_x (y \^ z) + v_y (z \^ x) + v_z (x \^ y)) \\
&= v_x (v_y z - v_z y) + v_y (v_z x - v_x z) + v_z (v_x y - v_y x) \\
&= (v_x v_y - v_y v_x) z + \ldots \\
&= 0
\end{aligned}$$

Why does this happen? Basically because the initial multivector $$x \wedge y \wedge z$$ is totally antisymmetric. This means that any choice of two component appears in either order with opposite signs. In the case above, $$x \wedge y \wedge z$$ has terms $$(xy-yx)z$$, which cancels out, because the values of $$v(x)$$ and $$v(y)$$ are both scalars and _do_ commute. We are only able to make non-zero antisymmetric combinations of tensor powers $$(x \otimes y - y \otimes x) \otimes z$$ because the tensor algebra is not commutative. 

In the $$i_{v^*} \beta = v \cdot \beta$$ notation, we can write:

$$i_{v^*}^2 = 0$$

$$i_{v^*} i_{u^*} = - i_{u^*} i_{v^*}$$

$$i_{v^*} \alpha \wedge \beta = (i_{v^*} \alpha) \wedge \beta + (-1)^p \alpha \wedge (i_{v^*} \beta)$$

(Where $$\alpha$$ still has grade $$p$$.)

These are the same rules, exactly, that $$L_v$$ obeyed above. There is clearly a duality between the grade-raising operation of wedging and the grade-lowering operation of contraction.


<aside class="toggleable" id="factorials" placeholder="<b>Aside</b>: Dealing with factorials <em>(click to expand)</em>">

Here are the options.

**1.** define the inner product of multivectors such that it divides by $$k!$$, like this:

$$\< x \^ y , x \^ y \> \equiv \frac{1}{2!}(x^* \otimes y^* - y^* \otimes x^*) (x \otimes y - y \otimes x) = 1$$

The reason this sucks is that it is no longer clearly related to contraction $$i_{x^*} i_{y^*} (x \^ y) = 1$$. 

We'd like to be able to extend the inner product to act like a dot product on _any_ multivectors, such as $$x \cdot (x \^ y)$$ and $$ (x \^ y) \cdot (x \^ y)$$, and compute them both with the same procedure. But if the latter adds a factor of $$\frac{1}{2!}$$, then what does the former do?

Is this correct?

$$x \cdot (x \^ y) \stackrel{?}{=} \frac{1}{2!} (x \otimes I) (x \^ y) = \frac{1}{2!} y$$

Or is that weird, and we should antisymmetrize the contraction too?

$$x \cdot (x \^ y) \stackrel{?}{=} \frac{1}{2!}(x \otimes I - I \otimes x) (x \^ y) = y$$

It looks okay, actually. This would make the rule "divide by $$\frac{1}{k!}$$ where $$k$$ is the grade of the right argument". But I've never seen anyone antisymmetrize linear operators on multivectors, so I don't think this is the right path.

-----------


**2**. Just fix the $$k!$$ manually.

We could just define the dual of $$(x \^ y)$$ to be $$\frac{1}{2} (x^* \^ y^*)$$, and likewise with $$k!$$ for grade-$$k$$ multivectors.

But this sucks, because it's asymmetric. We'd like there to be a clear relationship between $$x \cdot (x \^ y)$$ and $$(x \^ y) \cdot x$$ -- maybe the latter is $$y*$$, the dula of the former? But if the left argument is dual-ized, then only its grade goes into the result, so the second of these would have a factor of $$\frac{1}{2!}$$.

Well, this is basically the same as the previous solution, but defining the factor of $$k!$$ to be added by the operation of taking a dual, rather than by the inner product operation.

Or we could divide _both_ antisymmetric tensors by $$\frac{1}{\sqrt{k!}}$$ -- which would make them unit vectors in the tensor algebra, I guess! At least it's symmetric.

It's also what you do when you use tensor products in quantum mechanics; $$\frac{1}{\sqrt{2}} (\| 01 \> - \| 1 0 \>)$$ is a unit vector, for instance. But it's never seen with exterior algebra, and we'd really like to consider $$x \^ y$$ as a 'unit' vector in the space $$\wedge^2 V$$. Particularly because it is isomorphic (in $$\bb{R}^3$$) to $$z$$, and we definitely know that $$\| z \|^2 = 1$$, and maybe it would be strange if $$\| x \^ y \|^2 \neq \| \star (x \^ y) \|^2$$? The Hodge Star $$\star$$ does not normally change the magnitude of its arguments, though...

-----

**3.** Multivectors are supposed to act on tensors, not other multivectors.

As we said above, $$(x \otimes y) \cdot (x \^ y) = 1$$ works fine without any factorial terms. Maybe that's the 'correct' way to use $$x \^ y$$?

This is not that unusual. The normal presentation of differential forms -- which are the main application of exterior algebra, I think -- is to define them as "alternating multilinear functionals of vectors", which becomes the exterior algebra $$\wedge V^*$$, acting on tuples which are elements of $$\otimes V$$. This is the common usage:

$$ (\alpha \^ \beta) (u,v) = \alpha(u) \beta(v) - \beta(v) \alpha(u)$$

As it happens, you could write this _either_ as an element of $$\wedge^2 V^*$$ acting $$\otimes^2 V$$, or as an element of $$\otimes^2 V^*$$ acting on $$\wedge^2 V$$:

$$\begin{aligned}
\alpha(u) \beta(v) - \beta(v) \alpha(u) &= (\alpha \otimes \beta - \beta \otimes \alpha) (u \otimes v) \\
&= (\alpha \otimes \beta) (u \otimes v - v \otimes u)
\end{aligned}$$

As long as everything commutes, these give the same result.

In differential-form land, $$i_v$$ is understood to "fill in the first first argument" to a form, like this:

$$\omega = \omega(v_1, v_2, \ldots v_k) \in \wedge^{k} V^*$$

$$i_u \omega = \omega(u, \ldots) \in \wedge^{k-1} V^*$$

Which is the same as applying $$u$$ to the first tensor product term of $$\omega$$.

The problem with this approach is that we'd really like to use multivectors like $$x \^ y$$ in the place of pseudovectors, such as cross products, in regular vector geometry. But $$u \times v$$ is expected to have magnitude $$\| u \times v \| = \| u \| \| v \| \sin \theta_{uv}$$. But now we're not supposed to dot bivectors with other bivectors?

To get around that, we could _declare_ that the dual of $$(x \^ y)$$ is $$x^* \otimes y^*$$. But ... that's also odd. It could just as easily be $$ -y^* \otimes x^*$$. And while it will give the same result as long as it only acts on multivectors, it doesn't at all seem like $$(x^* \otimes y^*)^*$$ should be $$ x \^ y$$; it should just be $$x \otimes y$$. So I don't like this either.

------

**4.** Stop using tensor algebras in wrong ways

The symmetry in the previous section, that $$(\alpha \otimes \beta) (u \^ v) = (\alpha \^ \beta) (u \otimes v)$$, suggests that maybe we should just write _both_ sides as tensor products $$\alpha \otimes \beta$$ and $$u \otimes v$$, but having their inner product operation take care of the antisymmetrization, Like this: 

$$(\alpha \otimes \beta) \cdot ( u \otimes v) \equiv \alpha_i \beta_j u^k v^l \epsilon^{ij} \e_{kl}$$

If this seems like an odd thing to do -- it might be because it was a mistake to ever define $$u \^ v = u \otimes v - v \otimes u$$. 

In fact, the fancy abstract-algebra definition of the exterior algebra is not as a subalgebra of antisymmetric tensors, but as a _quotient_ algebra of the tensor algebra, which sets two tensors to be equivalent if they differ by only a symmetric tensor. 

That is: let $$I$$ be the ideal formed by all tensors of the form $$x \otimes x$$. Then define $$\^ V = \otimes V / I$$.

In this definition, $$xy$$ and $$-yx$$ are the _same_ element of $$\^ V$$, because $$xy + yx \sim xx + xy + yx + yy = (x+y) \otimes (x + y) \sim 0$$.

My hesitation to embracing this is that, having moved out of a literal subset of $$\otimes V$$, it might not longer be true that we can 'inherit' operations from the tensor algebra (which has canonical and natural-seeming definitions of duality, linear transformations, etc). For instance: we can no longer really consider a transformation which maps $$\^ V$$ to a non-antisymmetric element of $$\^ V$$, since its non-antisymmetric part will just be 'erased' (by being $$\sim 0$$).

Anyway, if we do things this way, then we need a definition of dual vectors which respects $$I$$, and treats different permutations of its arguments completely equally. Ie:

$$(x^* \otimes y^* + I) (y \otimes x + I) \stackrel{!}{=} 1 + I \sim 1$$ 

The only way this can work is if the operation of applying a linear transformation _totally antisymmetrizes_ one of its arguments, since (for all it knows) the element $$y \otimes x$$ is "really" $$x \otimes y$$ (because the difference between the two has been erased).

Therefore, I claim, probably without any of the requisite category-theoretical knowledge to be sure, that if we map $$\otimes V \ra \^ V$$, we have to map $$\cdot: V^* \times V \ra \bb{R}$$ to a totally-antisymmetric product -- call it $$\vee$$.

In coordinates, with $$\alpha, \beta \in \otimes V / I$$:

$$\alpha_I \vee \beta_J = \sum_{\sigma \in S_{\| J \|}} \sgn(\sigma) \alpha_I \cdot \beta_{\sigma(J)}$$

In fact, _which_ side is antisymmetrized over doesn't matter; only that one side is. We may as well write it like this:

$$\alpha \vee \beta = \< \alpha \| \text{Alt} \| \beta \>$$

Where $$\text{Alt}$$ is the operator that totally-antisymmetrizes a tensor product with appropriate minus signs.

We'll still write it with a dot product $$\alpha \cdot \beta$$, probably. But be aware that it is not the _same_ inner product as the one from $$V$$ -- in fact there is no trivial way to generalize that to $$\wedge^k V$$ such that respects the quotient by $$ x \otimes x$$. The problem is that we must have $$(u \otimes v + I) \cdot \beta = (- v \otimes u ) \cdot \beta$$, which generally just _isn't true_. What _is_ true is that:

$$\text{Alt}(u \otimes v + I) \cdot \beta = \text{Alt}(- v \otimes u + I ) = (u \otimes v - v \otimes u) \cdot \beta$$

Because:

* $$\text{Alt}(u \otimes v) = Alt(- v \otimes u)$$, because they're antisymmetric permutations of each other
* $$\text{Alt}(I) = 0$$, because the ideal $$I$$ consists of elements which are symmetric in at least one pair of positions.

</aside>