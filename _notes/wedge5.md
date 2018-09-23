---
layout: article
title: "Multilinear algebra"
math: true
aside: true
footnotes: true
---

I suspect that there is a theory that unifies much of linear algebra in such a way that makes these results 'obvious'. I suspect that this unification is inherently 'natural', in some sense, and that it is therefore the natural language for physics.


## 1. Vector Spaces

Claim: we need to be doing linear algebra on modules, rather than vector spaces. I don't quite know, yet, what this loses you.

[Here](https://research-repository.st-andrews.ac.uk/bitstream/handle/10023/12643/ModuleTheory_CCBY.pdf?sequence=7&isAllowed=y) is a textbook on module theory.

A module is like a vector space, except that the scalar components are elements of a ring instead of a field. (reminder: unlike a field, a ring does not necessary have division or commutative multiplication. A field is a ring where every element except $$0$$ has a multiplicative inverse.)

The main reason for wanting to use rings is that it means we can make tensors out of other tensors (with multiplication as $$\cdot$$, $$\wedge$$, or $$\otimes$$).

One obvious reason why this would be useful is that it might let you prove many theorems inductively on matrices of smaller matrices. But mostly it sounds good because there are lots of examples where it would be useful -- note that any tensor with $$>2$$ indices can be considered as a matrix of other tensors.

## 2. Multiplication is Tensor Products

The fundamental set operations are, _more or less_, the direct sum and direct product. Purely symbolically these may be seen as operating on tuples:

$$\{ a_i \ldots \} \oplus \{b_j \ldots  \} = \{ a_i, \ldots, b_j, \ldots \}$$

$$\{ a_i \ldots \} \otimes \{ b_j \ldots \} = \{ (a_i, b_j), \ldots \}$$

I believe that it's useful to think of these as the 'fundamental' operations of addition and multiplication, and the more familiar numeric versions are just simple versions of these.

Any time we have a vector like thing over a basis, its $$+$$ operation is really $$\oplus$$, and its multiplication is really -- somehow -- $$\otimes$$: 

$$\vec{v} = v_x \hat{x} + v_y \hat{y} \equiv (v_x \otimes \hat{x}) \oplus (v_y \otimes \hat{y})$$


A sketch of an argument: Suppose you have two spaces $$A$$ and $$V$$, and a mapping $$\phi: A \ra \bb{R}$$. Then you have a canonical mapping:

$$\phi \otimes 1 : A \otimes V \ra  \bb{R} \otimes V$$

Implemented as:

$$(\phi \otimes 1) (a, b) = (\phi(a), b) \in \bb{R} \otimes V$$

This means you can treat elements of $$A$$ as something like scalar multiples of $$B$$, even if they are actually elements of some larger space. A simple example: if $$A$$ and $$B$$ are vector spaces, then $$A \mapsto \det A$$ preserves multiplication, ie:

$$(\det (A_1, A_2) , B) = ( \det(A_1) \det(A_2) B)$$

And thus we can treat elements of $$A$$ as 'scalar-like', at least as long as we don't try to add them together (which is rare with matrices anyway). (See also: all of representation theory, which is concerned with this except that it maps things to matrix groups (subgroups of $$GL(N)$$ instead of scalars, basically because you can't preserve group properties if you just map to scalars.)

Anyway, the point is, the most general sense of you can come up with for _any_ two objecs of 'multiplying' them is to just append them together into a tuple. On vectors this the tensor product:

$$\vec{v} \otimes \vec{u} = \{ v_i \} \otimes \{ u_j \} = \{ v_i, u_j \}$$

And since matrices are vectors themselves ($$M : A \ra B \in A^* \otimes B$$) this works on all of linear algebra.

Other multiplication operations are some type of 'reduced view' of a tensor product:

$$ST = S \cdot T = \tr S \otimes T = \tr_{jk} S_{ij} T_{kl}$$

$$S \wedge T = S \otimes T - S \otimes T$$

I am going to use all of these operations: $$\otimes$$, $$\wedge$$, $$\cdot$$ and $$\tr$$ -- on spaces which are not vector spaces, without indication. I will still call it the 'tensor product', also.

## 3. Wedges 

The tensor product of two objects from the same space can be decomposed into its diagonal- and off-diagonal components:

$$u \otimes v = \{ u_i v_j \}_{i = j} \oplus \{ u_i v_j \}_{i \neq j}$$

Roughly, we may interpret the diagonal term as a "length squared" term, and the off-diagonal term as an "area" term. (Consider that $$\| \vec{v} \|^2 = v_x^2 + v_y^2$$ and $$area(\vec{v}) = v_x v_y$$, ish.) The wedge product deletes the length term and returns an antisymmetrized area term:

$$u \wedge v = u \otimes v - v \otimes u = \{ u_i v_j - u_j v_i \} \in \wedge^2 V \subset \otimes^2 V$$

The wedge product is our way to get off-diagonal elements of tensors, at the cost of not being able to distinguish between $$A_{xy}$$ and $$-A_{yx}$$. I suspect there is a good 'natural' reason for this -- something like: the order of terms we ($$xy$$ vs $$yx$$) is totally arbitrary, and the resulting theory shouldn't be able to distinguish between them, so it has to act symmetrically on both components of a tensor product.

What is odd is that it requires the existence of a subtraction operation. I haven't figured out how to see that as 'natural' on arbitrary, non-spatial spaces.

Note: $$u \otimes v - v \otimes u$$ is NOT a universal definition of the wedge product. Actually, this is very confusing. People cite that formula everywhere, but it's wrong. What is correct -- but totally unsatisfying -- is something like this:

$$ u \wedge v = \text{Alt} (u \otimes v)$$

Where $$\text{Alt}()$$ is a thing which fully antisymmetrized its argument over all its 'indexes'. I don't want to rely on indexes, so I don't want that.

Here's why it's not the naive $$u \otimes v - v \otimes u$$: because this doesn't work:

$$\begin{aligned} a \wedge b \wedge c &= a \wedge (b \otimes c - c \otimes b) \\
& \stackrel{?}{=} abc - acb + bca - cba \\
&\neq abc - acb + bca - cba + \boxed{cab - bac} \end{aligned}$$

It's got to more something more like this;

$$a \wedge (b \otimes c) = a \otimes (b \otimes c) - b \otimes (a \wedge c)$$

Which has something like:

$$a \wedge b \stackrel{?}{=} (a \otimes b - b \otimes a \; \wedge)$$

Basically it's completely unclear to me whether it's valid to think of $$\wedge$$ as a combination of tensor products. (I know you can treat it as a subalgebra of the tensor algebra, but that doesn't feel _good_.)

It's _not_ the Jacobi identity, by the way, That's the thing that is satisfied if $$a\^ (b\^c)$$ was equal to $$a(bc-cb) - (bc-cb)a$$. 


-------

Wedge products are conventionally defined to be antisymmetric, $$v \wedge v = 0$$. That may be true if you only take them on vectors, but I don't, and they're _not_ antisymmetric under reasonable definitions on non-commutative spaces. Consider a tuple $$p = \{ p_i \} \in P$$ where we have a definition of subtraction (???), but the elements $$p_i$$ do not commute. Then:

$$p \wedge p = \cancel{\{ p_i p_j - p_j p_i \}}_{i = j} +  \{ p_i p_j - p_j p_i \}_{i \neq j} = \{ p_i p_j - p_j p_i \}_{i \neq j}$$

Where the last term can't cancel out because elements of $$P$$ don't necessarily commute.

--------

An example of this in practice: we can define the wedge product of a matrix with itself in several ways. A matrix $$A = (A_x, A_y) = \begin{pmatrix} A_{xx} & A_{yx} \\ A_{xy} & A_{yy} \end{pmatrix}$$ may be seen as two column vectors, and:

$$A \wedge A = (A_x \oplus A_y) \wedge (A_x \oplus A_y) = \begin{pmatrix} A_x \^ A_x & A_x \^ A_y \\ A_y \^ A_x & A_y \^ A_y \end{pmatrix}$$

(Note this matrix form is the same as, but easier to read than, $$(A_x \^ A_x) \oplus (A_x \^ A_y) \oplus (A_y \^ A_x) \oplus (A_y \^ A_y)$$.)

A reasonable way of expanding these products. Because these are now wedges of vectors, $$A_x \^ A_x = A_y \^ A_y = 0$$, and $$A_x \^ A_y = \det(A) x \^ y = - A_y \^ A_x$$. If $$A : U \ra V$$, this result is a mapping $$\wedge^2 U \ra \wedge^2 V$$.

$$A \wedge A = \begin{pmatrix} 0 & \det A \\ -\det A & 0 \end{pmatrix} = \det A [(u_x \wedge u_y)^* \otimes (v_x \wedge v_y)]$$

Where $$[(u_x \wedge u_y)^* \otimes (v_x \wedge v_y)]$$ is the single basis element of the space $$(\wedge^2 U)^* \otimes (\wedge^2 V)$$. I'll refer to the volume element as $$\hat{i}$$ in the future, so this is really 

$$A \wedge A = \det A (\hat{i}_u^* \otimes \hat{i}_v)$$

(BY THE WAY: I am not ready to talk about the dual spaces, or what $$\hat{i}^*$$ means, so just assume it makes sense.)

-------

## 4. Wedges and dot (interior) products

All of the interesting identities about matrices involve some order of combinations of $$\tr$$, $$\wedge$$, and $$\otimes$$.

First we should look at how these work.

For spaces $$A,B$$ with identity operators $$I_A, I_B$$ and some arbitrary operations $$\phi : A \ra C$$, $$\psi: B \ra D$$, there are canonical operations we can make on the 'tensor' powers:

$$\begin{aligned}
(I_A \otimes I_B) (a,b) &= (a,b) \\
(\phi \otimes I_B) (a,b) &= (\phi(a), b) \\
(I_A \otimes \psi) (a,b) &= (a, \psi(b)) \\
(\phi \otimes \psi) (a,b) &= (\phi(a), \psi(b))
\end{aligned}$$

As such we can freely apply an operation like in either position of, say, a matrix over vector spaces, and this is what matrix multiplication 'is':

$$M = \{M_i^j\} \in U^* \otimes V$$

$$M \vec{u} \equiv (\vec{u} \otimes I_V) \cdot M =\{u^i M_i^j \} \in V $$

$$\vec{v} M \equiv (I_U \otimes \vec{v}) \cdot M= \{v_j M_i^j \} \in U^*$$

(I am using $$\equiv$$ to mean "actually means:")

--------

Since a wedge product is a tensor product, this still applies -- for instance:

$$\begin{aligned}
a \cdot (b \wedge c) &\equiv (a \otimes I) \cdot (b \otimes c - c \otimes b) \\
&= (a \cdot b) \otimes c - (a \cdot c) \otimes b \end{aligned}$$

We can also take a dot product on the right, of course, and it's understood to mean left-multiplying by $$(I,a)$$ instead of right-multiplying by $$(a,I)$$. But this notation cannot express multiplications on the _inner_ terms in the wedge product -- we would have to just write $$(I \otimes a \otimes I) \cdot$$ if we wanted to inner-product only the second term (but why would you want to do that?).

I mention all this because I find the literature around how dot products and wedges interact to be pretty confusing.

Interestingly, because the wedge product is a total antisymmetrization of its arguments, the result guarantees that $$a \cdot$$ applies to every vector equally. Check out when it's three parts (omitting $$\otimes$$ for brevity...):

$$\begin{aligned} 
a \cdot (b \wedge c \wedge d) &\equiv (a,I,I) \cdot (bcd - bdc + cdb - cbd + dbc - dcb) \\
&= (a \cdot b) (cd - dc) + (a \cdot c) (db - bd) + (a \cdot d) (bc - cb) \\
&= (a \cdot b) (c \wedge d) + (a \cdot c) ( d \wedge b) + (a \cdot d) (b \wedge c)
\end{aligned}$$

This means dot products (or any operation, applied one position at a time) can _distribute_ over the wedge product:

$$a \cdot (b \wedge c \wedge d) = (a \cdot b) \wedge c \wedge d + b \wedge (a \cdot c) \wedge d + b \wedge c \wedge (a \cdot d)$$

(If $$a \cdot b$$ is a scalar, this requires that we define $$c \wedge v = cv$$, which is standard anyway.)

------

This operation, of dotting in one position, is also called the [interior product](https://en.wikipedia.org/wiki/Interior_product), and denoted with $$\iota_a (b \wedge c)$$. 

It is very much the dual of $$\wedge$$. If $$w_a$$ is left-wedging by a (ie $$w_a b = a \wedge b)$$ and $$\iota_a$$ is left-dotting ($$\iota_a b = a \cdot b$$, then:

$$\begin{aligned}

w_a &: \wedge^k V \ra \wedge^{k+1}\\
 \iota_a &: \wedge^k V \ra \wedge^{k-1} V \\

w_a w_b &= -w_b w_a \\
\iota_a \iota_b &= - \iota_b \iota_a \\

w_a^2 &= 0 \text{ (if commutative) }\\
\iota_a^2 &= 0 \text{ (if commutative )} \\

w_a (\alpha \wedge \beta) &= (w_a \alpha) \wedge \beta + (-1)^p \alpha \wedge (w_a \beta) \\
\iota_a (\alpha \wedge \beta) &= (\iota_a \alpha) \wedge \beta + (-1)^p \alpha \wedge (\iota_a \beta) \\

\end{aligned}$$

(where $$\alpha$$ and $$\beta$$ are composite multivectors, with $$\alpha$$ having $$p$$ vector terms, which means $$w_a$$ and $$\iota_a$$ have to 'move past' $$p-1$$ terms, picking up a factor of $$(-1)^p$$)

<div class="box">

**BY THE WAY**: notice how much $$w_a$$ and $$\iota_a$$ look like derivatives? (the last property is a 'graded' product rule', which is a lot like $$d(uv) = (du)v + u (dv)$$.)

Not a coincidence, but it goes the other way: derivatives are a type of wedge product, and that's another reason this is interesting. 

The theory of wedge products is mostly found in reference to differential forms, and the [exterior derivative](https://en.wikipedia.org/wiki/Exterior_derivative) operator $$d$$ is the 'full' coordinate-free version of derivation, with:

$$d (f \alpha) = \sum_i f_{x_i} dx_i \wedge \alpha$$

Where $$\alpha$$ is a basis differential form like $$1$$ (for scalar functions) or $$dx \wedge dy$$ (a 2-form), and $$f = f(\vec{x})$$ is a function that varies in space.

$$d$$ looks a lot like a wedge product; for instance, it has $$d^2 = 0$$ and it increases grades by one. The only difference is that it also interacts with the scalar coefficient $$f(\vec{x})$$, not just the basis vector.

What's going on is that application of $$d$$ is really wedging with $$d$$:

$$d (f \alpha) \equiv d \wedge (f \alpha) = (d \wedge f) \alpha + \cancel{f (d \wedge \alpha)}$$



I believe the right model for it is something like this: we're looking at noncommutative algebra (I think it's something like the [Weyl Algebra](https://en.wikipedia.org/wiki/Weyl_algebra)) consisting of coordinates $$x_i$$ and derivatives $$d_i$$, which have the relationship that $$[d_i, x_j] = \delta_{ij}$$ (in the sense that $$(d \circ x - x \circ d) f = (d(xf) - x d(f)) = 1 f$$). 

If we imagine that $$f(x_i)$$ is locally a Taylor series $$f(x_i) = \sum f_I \frac{\vec{x}^I}{I!}$$, where $$I$$ is a [multi-index](https://en.wikipedia.org/wiki/Multi-index_notation) (use your imagination), then....

... okay haven't quite figured this out yet.

</div>	

------------

