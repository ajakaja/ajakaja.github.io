---
layout: article
title: "More Wedge Stuff"
math: true
aside: true
footnotes: true
---

## Motivation

Recall that a square matrix:

$$A  = \begin{pmatrix} A_1 & A_2 & \ldots & A_N \end{pmatrix}$$

has its 'volume' or 'determinant' given by:

$$\det A = A_1 \^ A_2 \^ \ldots \^ A_N$$

This may be seen as:

* the action of $$A$$ on a unit volume element, or
* the volume of $$A$$, treated _as_ a list of vectors describing a volume

The determinant may be understood meaningfully for abstract linear transformations $$A : V \ra W$$ between vector spaces of the same dimension by understanding that its result is a _ratio_ $$\frac{w}{v}$$ of scalars between the two vector spaces. That is: in each space there is a map $$V \ra \text{Vol}(V)$$, $$W \ra \text{Vol}(W)$$, and $$A: V \ra W$$ induces a canonical map $$\text{Vol}(V) \ra_{\det} \text{Vol}(W)$$ (ie, makes the diagram commute, but I don't have a convenient way to draw diagrams here).

(In the future I really _really_ want to figure out how meaningful it is to talk about volume maps between non-equal-dimension vector spaces, because I'm 90% sure that you can treat '0' determinants more meaningfully by unpacking how many dimensions are mapped to 0; etc. But that's for later.)

---------

For now, I'm interested in this:

There are generalizations of determinants to tensors, called [hyperdeterminants](https://en.wikipedia.org/wiki/Hyperdeterminant), and to matrices over non-commutative spaces, called [quasideterminants](https://en.wikipedia.org/wiki/Quasideterminant). 

I have not found any particularly useful intuition for hyperdeterminants, but it stands to reason that _one_ sense in which you may take a determinant-like-thing of, say, a rank $$3$$ tensor, would be to create one determinant per component, as a sort of vector, related to tensor contraction. So, something like $$\det T_{ij}^k \approx \det^i_k T_{ij}^k$$, where the last thing is a vector that varies in $$j$$.

Quasideterminants, meanwhile, are interesting because it turns out you _can't_ create a single thing for a non-commutative matrix that generalizes cleanly to the regular determinant when commutativity is restored. Instead, you get a 'ratio' thing, one per component of the original matrix. The quasideterminant on a commutative matrix has components:

$$|A|_{ij} = (-1)^{i + j} \frac{\det A}{\det A_{\widehat{ij}}}$$

Where $$A_{\widehat{ij}}$$ is $$A$$ with the $$i$$'th row and $$j$$'th column removed.

Well, we expect that exterior algebra should give a better understanding of 'removing columns and rows', absolutely -- that's what we use when we create $$\text{adj} (A) = \^^{N-1} A$$ to understand what's going on in Cramer's rule for matrix inverses ($$A^{-1} = \frac{\^^{N-1} A}{\^^{N} A}$$). So maybe we can use that here?

The obvious reason why determinants of non-commutative matrices (with elements from a ring, instead of a field, so they are maps between $$R$$-modules?) are attractive is because matrices themselves are non-commutative, so for instance we could write the determinant of a block matrix:

$$Q = \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$

in terms of the determinants of its smaller components! Which is appealing for (a) recursive algorithms and (b) because it might give more understanding of what's going on with $$\^$$ in general, and how to do exterior algebra on 'more things'.

By the way, there is already a well-known formula for reducing $$\det Q$$, which can be found through relatively simple manipulations (assuming the inverses in the formula exist):

$$\det Q = \det (A) \det (D - C A^{-1} B)$$

The proof is that we can write $$Q$$ as:

$$Q = \begin{pmatrix} A & 0 \\ 0 & 1 \end{pmatrix} \begin{pmatrix} 1 & 0  \\  C & 1 \end{pmatrix} \begin{pmatrix} 1 & A^{-1} B \\ 0 & D - C A^{-1} B \end{pmatrix}$$

and then determinants of matrix products multiply, and off-diagonal 0s can be shown to cancel even in block forms.

So:

our investigation begins with trying to figure out how to reconcile:

$$\det Q = \bigwedge Q_i$$

with:

$$\det Q = \det (A) \det (D - C A^{-1} B)$$

## Matrices and Wedge Products (a sketch)

We know how to wedge two vectors from the same space, no problem:

$$x_i \^ y_j = x_i y_j - x_j y_i$$

Including basis vectors:

$$x \^ y = x_i \hat{e}^i \^ y_j \hat{e}^j = (x_i y_j - x_j y_i) (\hat{e}^i \^ \hat{e}^j)$$

What this actually is is antisymmetrizing their tensor product. The tensor product $$x \otimes y$$ is:

$$x \otimes y = x_i y_j \hat{e}^i \otimes \hat{e}^j$$

Then, we identify quotient by a relation $$\sim$$ that maps duplicated basis elements like $$\hat{x} \otimes \hat{x}$$ to $$0$$, which identifies $$\hat{e}^i \otimes \hat{e}^j = - \hat{e}^j \otimes \hat{e}^i$$. (Why? Because $$(\hat{e}_i + \hat{e}_j) \otimes (\hat{e}_i + \hat{e}_j) \sim 0$$, and then expand it into four terms.)


For a more direct way to compute, though, just compute: $$x \^ y = x \otimes y - y \otimes x$$. This directly antisymmetrizes the tensor product, producing a matrix representation of $$x \^ y \in V \otimes V$$. In 2D:

$$x \^ y = \begin{pmatrix} x_1 y_1 - y_1 x_1 & x_1 y_2 - y_1 x_2 \\ x_2 y_1 - y_2 x_1 & x_2 y_2 - y_2 x_2 \end{pmatrix} = \begin{pmatrix} 0 &  x_1 y_2 - y_1 x_2 \\ -( x_1 y_2 - y_1 x_2) & 0 \end{pmatrix} $$

Because the resulting matrix is antisymmetric, we only need to write down the off-diagonal element once. We write $$x \^ y = (x_1 y_2 - y_1 x_2) (\hat{e}^1 \^ \hat{e}^2)$$. But keep in mind that we could _just as well_ write $$x \^ y = -(x_1 y_2 - y_1 x_2) (\hat{e}^2 \^ \hat{e}^1)$$. It is entirely arbitrary what order we present the elements in, and both are 'present' in the result when viewed as a tensor product.

Further wedge powers work the same way. A grade-$$k$$ wedge product (like $$x_1 \^ x_2 \^ \ldots x_k$$) is a fully-antisymmetric element of $$V^{\otimes k}$$. It may well be seen as an _element_ of $$V^{\otimes k}$$, also, but then it should have an entry in every of the $$\frac{N!}{(N-k)!}$$ positions that are off every diagonal at once (one per selection of $$k$$ basis vectors from $$N$$ total, but ordering matters). The antisymmetry condition eliminates most of the variation.

---------

For a list of $$k$$ vectors -- say, the columns of a matrix -- we can wedge them together up to $$k$$ times. So, if we have a $$N \times k$$ matrix $$A$$, whose columns are vectors $$\in V$$, but which is not square:

$$A = \begin{pmatrix} A_1 & A_2 & \ldots & A_k \end{pmatrix}$$

Then let's write $$\^^j A$$ for the 'matrix' of 'columns of $$A$$ wedged together, $$j$$ at a time'.

For example:

$$A = \begin{pmatrix} a & b & c \\ d & e & f \end{pmatrix}$$

We may compute by wedging pairs of columns together, getting three results:

$$\^^2 A = \begin{pmatrix} ae - bd & bf - ce & cd - af \end{pmatrix}$$

Or suppose we transpose it into two 3-component columns, and wedge those as vectors:

$$\^^2 A^T = \begin{pmatrix} ae - bd \\ bf - ce \\ cd - af \end{pmatrix}$$

But these are the same? Evidently there is some symmetry in this process. We can treat a wedge product of a matrix as _either_ its rows or columns, chosen $$k$$ times, and get the same result. (nb. I'm being sloppy with spaces and transposes. Indeed, it's not really correct in the usual notation, I think, to write a wedge product as a matrix -- it's being treated as an element of $$V \otimes V$$, not $$V \otimes V^{*}$$.)

We might as well also consider $$\^^1 A$$ as giving the three columns, and $$\^^1 A^T$$ as giving the two rows. Maybe this is what a matrix representation 'is'?

If $$k = 3$$, we'll get $$\^^3 A = 0$$ either way we compute -- three two-component vectors will cancel out, as will two three-component vectors.

I mention these things because later they _won't_ be true, I think. I am pretty sure that a lot of the familiar properties of wedge products are not actually fundamentally when you wedge things that are bigger than vectors of commuting scalars!

Anyway, it's clear that if we write a square matrix as two non-square parts: $$Q = \begin{pmatrix} A & B \end{pmatrix}$$, where $$Q$$ is $$N \times N$$, $$A$$ is $$N \times k$$, and $$B$$ is $$N \times (N - k)$$, then:

$$\det Q = \^^N Q = (\^^k A) \^ (\^^{N - k} B)$$

Another cases to consider: suppose we just want $$\^^2 Q$$? There is an entry for every pairwise wedge of columns of $$A$$, one for each pair of columns of $$B$$, and then one per selection of columns split between the two. Something like:

$$\^^2 Q = \begin{pmatrix} \^^2 A & A \^ B \\ B \^ A & \^^2 B \end{pmatrix}$$

Here, we notice a few things:

1. We define the wedge product of two matrices $$A \^ B$$ as the wedge product of their pairs of columns: $$A \^ B = (A_i \^ B_j)$$. Actually, this looks exactly like the formula for the wedge of two vectors, only now the coefficients are vectors? 
2. Clearly $$\^^2 A = A \^ A$$ using the same notation.
3. This equation is exactly like $$A \^ B = A \otimes B - B \otimes A$$
4. But the antisymmetry of $$\^$$ is gone. $$A \^ A \neq 0$$. Does $$A \^ B = -B \^ A$$?
5. The definition of $$A \^ A = A \otimes A - A \otimes A$$ doesn't make sense anymore. Somehow we need to recover $$A_i \^ A_j - A_j \^ A_i$$. Maybe something like $$A \^ A = A^T \otimes A - A \otimes A^T$$?

This all makes more sense with an example:

Let's write a $$2 \times 4$$ matrix $$Q$$ as two $$2 \times 2$$ matrices $$A, B$$:

$$Q = \begin{pmatrix} A & B \end{pmatrix} = \begin{pmatrix} a & b & e & f \\ c & d & g &h \end{pmatrix}$$

Then $$\^^2 Q$$ has $$6$$ components:

$$\^^2 Q = (a d - b c,  ag - e c, ah - fc , bg - ed, bh - fd, eh - fg)$$

But we can instead write these like this:

$$\^^2 Q = \begin{pmatrix} 
\begin{pmatrix} 0 & ad-bc \\ -(ad-bc) & 0 \end{pmatrix} & 
\begin{pmatrix} ag-ec & ah-fc \\ bg - de & bh-fd \end{pmatrix}\\
\begin{pmatrix} -(ag-ec) & -(bg-de) \\ -(ah-fc) & -(bh-fd) \end{pmatrix} & 
\begin{pmatrix} 0 & eh-fg \\ -(eh-fg) & 0 \end{pmatrix}
\end{pmatrix}$$

Each entry of this matrix is $$Q_i \^ Q_j$$. If we consider $$Q$$ as having four elements, then it has $$16$$ entries. But if we consider $$Q$$ as having $$2$$ _matrix_ elements $$(A,B)$$, then it has 4 entries, and the result is the same!

$$\^^2 Q = \begin{pmatrix}
A \^ A & A \^ B \\ B \^ A & B \^ B
\end{pmatrix}$$

We see that:

* $$A \^ A \neq 0$$, so the wedge product of matrices with themselves is not necessarily zero! Which is weird.
* $$A \^ B = -(B \^ A)^T$$, so the wedge product is something like skew-symmetric, which seems reasonable.
* $$A \^ B$$ is a matrix with components $$A_i \^ B_j$$. Equivalently, $$A \^ B = A \otimes B - B \otimes A$$.
* Evidently there is some symmetry going on -- when we treat two columns of a matrix as one (equivalently, two bases of a vector spaces as a _single_ 2-dimensional basis), some exterior-algebra formulas continue to work. This feels important.
* We may as well write the result as having three unique components, maybe? $$Q \^ Q = (A, B) \^ (A, B) = (A \^ A, A \^ B, B \^ B)$$

We can, of course, keep on going, though it gets unwieldly to notate. If $$Q = (A, B, C)$$ then:

$$\^^k Q = \sum_{a + b + c = k}=  A^{\^ a} \^ B^{\^ b} \^ C^{\^ c}$$

Where we define $$P^{\^ 0} = 1$$. So, it's a sum over all the wedge powers that add up to $$k$$ across the components of the matrix.

It seems that we may think of $$\^$$ as being distributive over the operation of 'concatenation into matrices'. I suppose that this is just distributing over the direct sum $$\oplus$$, and it is a property inherited from tensor products:

$$(a \oplus b) \otimes (c \oplus d) = (a \otimes c) \oplus (a \otimes d) \oplus (b \otimes c) \oplus (b \otimes d)$$

When we write the matrix $$Q = (A \; B)$$ we are implicitly decomposing one axis of $$Q$$ (a matrix in $$V \otimes V^*$$, say) into a direct sum of spaces $$(V_1 \otimes V^*) \oplus (V_2 \otimes V^*)$$, with components $$Q = A \oplus B$$. Then:

$$Q \^ Q = (A \oplus B) \^ (A \oplus B) = (A \^ A) \oplus (A \^ B) \oplus (B \^ A) \oplus (B \^ B)$$

It is clear that the _order_ of terms that are combined with $$\oplus$$ is irrelevant in this description. However, the order ends up having an effect for things like the determinant -- but that's because the determinant implicitly includes a basis (an orientation of the volume element), and that sign is ultimately "relative to that basis".

----------

We ought to be able to decompose a wedge product vertically also. If $$Q = \begin{pmatrix} A \\ B \end{pmatrix}$$ then something like this should hold:

$$Q \^ Q = (A \^ A, A \^ B, B \^ A, B \^ B)^T$$

So why not just handle a whole matrix at once?

Suppose $$R = \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$

With $$N = k + m$$, and block sizes:

$$\begin{pmatrix} k \times k & k \times m \\ m \times k & m \times m \end{pmatrix}$$

(In terms of the decomposition $$V = V_1 \oplus V_2$$, this is $$R = A_{V_1 \otimes V_1^*} \oplus B_{V_1 \otimes V_2^*} \oplus C_{V_2 \otimes V_1^*} \oplus D_{V_2 \otimes V_2^*}$$)

Then something like this should hold (abbreviating all the operations, so multiplication here is the wedge product and addition is the direct sum):

$$R^2 = A^2 + B^2 + C^2 + D^2 + AB + AC + AD + BC + BD + CD$$

There are of course $$BA$$, $$CA$$, etc terms, also, but they should (we intuit) be the same as their opposites so we omit them.

Equivalently, we can try to write a closed expression for $$\det R = R^{\^ N}$$:

$$R^{\^ N}= \bigoplus_{a + b + c + d = N} A^{\^ a} \^ B^{\^ b} \^ C^{\^ c} \^ D^{\^ d}$$

But a lot of these terms cancel out in confusing ways. Some of them are easy to see: if $$a \geq k$$, then $$A^{\wedge a} = 0$$. But also, all of these are _wedge_ products, so if any dimensions between two terms overlap, they might also give 0. That makes no sense, so I'll give an example: the first half of this formula is:

$$\bigoplus A^{\^ a} \^ B^{\^ b}$$

But $$\begin{pmatrix} A & B \end{pmatrix}$$ is a $$k \times n$$ matrix. If $$a + b \geq k$$, then it has to be 0, no matter what the rest is. So we have the requirements:

$$\begin{cases}
a, b, c, d &\geq 0 \\
a + b &\leq k \\
a + c &\leq k \\
c + d &\leq m \\
b + d &\leq m \\
a + b + c + d &= N
\end{cases}$$


This ends up canceling out almost every term. This is getting hard to think about. We need an example. Let's do $$N = 4$$, $$k = m = 2$$. Then:

$$R^{\^4} = \^^2 \begin{pmatrix} A \\ C \end{pmatrix} \bigwedge \^^2 \begin{pmatrix} B \\ D \end{pmatrix}$$

Which is much easier to work with if we write it as:

$$\begin{aligned} &= (A^{\^2} + A \wedge C + C^{\^ 2}) \wedge (B^{\^2} + B \wedge D + D^{\^ 2}) \\
&= \cancel{A^{\^2} B^{\^2}} + \cancel{A^{\^2} (B \wedge D)} + A^{\^2} D^{\^2} \\
&+ \cancel{A \^ C B^{\^2}} + A \^ C \^ B \^ D + \cancel{(A \^ C) D^{\^2}} \\
&=  C^{\^2} B^{\^2} + \cancel{C^{\^2} (B \wedge D)} + \cancel{C^{\^2} D^{\^2}} \\
&= A^{\^2} D^{\^2} + A \^ C \^ B \^ D  + C^{\^2} B^{\^2}
\end{aligned}$$

Where I have cancelled out any term that has more than two factors from $$(A,B)$$, $$(A,C)$$, $$(B,D)$$, or $$(C,D)$$.

---------

Imagine for a second that $$A^{-\^ 1}$$ means something (presumably, $$= A^{-1}$$). Then:

$$\begin{aligned} &= A^{\^2} D^{\^2} + A \^ C \^ B \^ D  + C^{\^2} \^ B^{\^2}\\
&= A^{\^2} \big(D^{\^2} + A^{-\^1} \^ C \^ B \^ D + A^{-\^2} \^ C^{\^2} \^ B^{\^2} \big) \\
&= A^{\^2} \big(D^{\^2} - C \^ A^{-\^ 1} \^ B \^ D + C^{\^2} \^ A^{-\^2} \^ B^{\^2} \big)\\
& \stackrel{?}{=} A^{\^2} (D - C \^ A^{-1} \^ B)^{\^2} \\
& \stackrel{?}{=} \det (A) \det (D - C A^{-1} B) \end{aligned}$$

Which involves doing a lot of trusting with the signs working out. But it looks pretty good! It gets to the formula we expected but through _far_ more general machinery.

--------

.... This feels like something that can be made valid. Evidently:

1. It's possible to take wedge products of matrices, and $$A \^ A = 0$$ is *not necessarily* true.
2. It is probably possible to take wedge products of non-commutative things in sensible ways. I assume that quasideterminants are the regular determinant formula applied to non-commutative things, but now it's no longer true that every ordering of factors is the same, so you have to distinguish between which row/column you 'start' on.
2. When wedging multi-dimensional matrices we have to keep track of where dimensions are duplicated in each term.
3. $$A^{-\wedge 1} $$ is more or less the matrix inverse, and $$A^{-\wedge k}$$ where $$k$$ is the size of $$A$$ (presumed square) is $$\frac{1}{A^{\wedge k}} = \frac{1}{\det A}$$.
4. Evidently there are a lot more possible manipulations of $$\det \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$ than just the regular determinant identity.
5. I assume the hyperdeterminants of tensors are this expanded wedge product being used on them directly.

I claim nothing about the correctness of anything in here. It's just suggestive.

