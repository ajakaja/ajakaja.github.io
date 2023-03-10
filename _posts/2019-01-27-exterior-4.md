---
layout: blog
title: "Exterior Algebra Notes #4: The Interior Product"
footnotes: true
math: true
aside: true
tags: notes
---

*Vector spaces are assumed to be finite-dimensional and over $$\bb{R}$$. The grade of a multivector $$\alpha$$ will be written $$\| \alpha \|$$, while its magnitude will be written $$\Vert \alpha \Vert$$. Bold letters like $$\b{u}$$ will refer to (grade-1) vectors, while Greek letters like $$\alpha$$ refer to arbitrary multivectors with grade $$\| \alpha \|$$.*

More notes on exterior algebra. This time, the interior product $$\alpha \cdot \beta$$, with a lot more concrete intuition than you'll see anywhere else, but still not enough.

I am not the only person who has had [trouble](https://mathoverflow.net/questions/102917/urge-reason-for-inventing-interior-product-grassmann-algebra) figuring out what the interior product is for. This is what I have so far...

<!--more-->

---------

## 1. The Interior Product

The last main tool of exterior algebra is the _interior product_, written $$\alpha \cdot \beta$$ or $$\iota_{\alpha} \beta$$. It subtracts grades ($$\| \alpha \cdot \beta \| = \| \beta \| - \| \alpha \|$$) and, conceptually, does something akin to 'dividing $$\alpha$$ out of $$\beta$$'. It's also called the 'contraction' or 'insertion' operator. We use the same symbol as the inner product because we think of it as a generalization of the inner product: when $$\| \alpha \| = \| \beta \|$$, then $$\alpha \cdot \beta = \beta \cdot \alpha = \< \alpha, \beta \>$$.

Its abstract definition is that it is adjoint to the wedge product with respect to the inner product:

$$\boxed{\< \gamma \^ \alpha, \beta \> = \< \alpha, \gamma \cdot \beta \>} 
\tag{1}$$

In practice this means that it sort of 'undoes' wedge products, as we will see.

When we looked at the inner product we had a procedure for computing $$\< \b{a \^ b}, \b{c \^ d} \>$$. We switched from the $$\^$$ inner product to the $$\o$$ inner product, by writing both sides as tensor products, with the right side antisymmetrized using $$\text{Alt}$$:[^alt]

[^alt]: Recall that we basically elect to antisymmetrize _one_ side because if we did both we would need an extra factor of $$1/n!$$ for the same result. It might be that there are abstractions of this where you do need to do both sides (for instance if $$a \cdot b \neq b \cdot a$$?)

$$\begin{aligned}
\< \b{a \^ b}, \b{c \^ d} \> &= \< \b{a \o b}, \text{Alt}(\b{c \o d}) \> \\
&= \< \b{a \o b}, \b{c \o d - d \o c} \>_{\o} \\
&= \< \b{a, c} \>_V \< \b{b, d} \>_V - \<\b{a, d} \>_V \< \b{b, c} \>_V \\
&= (\b{a \cdot c}) (\b{b \cdot d}) - (\b{a \cdot d})( \b{b \cdot c})
\end{aligned}$$

Interior products directly generalize inner products to cases where the left side has a lower grade[^rhs], (which is why we use $$\cdot$$ for both), and can be computed with the exact same procedure:

[^rhs]: It is probably possible to generalize to either side having the lower grade, but it's not normally done that way. I want to investigate it sometime.

$$\begin{aligned}
\b{a} \cdot (\b{b \^ c}) &= \b{a} \cdot (\b{b \o c - c \o b}) \\
&= (\b{a} \cdot \b{b}) \b{c} - (\b{a} \cdot \b{c}) \b{b}
\end{aligned}$$

A general formula for the interior product of a vector with a multivector, which can be deduced from the above, is

$$\b{a} \cdot (\b{b} \^ \beta) = (\b{a} \cdot \b{b}) \^ \beta - \b{b} \^ (\b{a} \cdot \beta)$$

---------------------------

### 1.1 Projection


The intuitive meaning of the interior product is related to _projection_. We can construct the projection and rejection operators of a vector onto a multivector with:

$$\beta_{\b{a}} = \text{proj}_{\b{a}} \beta = \frac{1}{\| \b{a} \|^2} \b{a} \^ (\b{a} \cdot \beta) \\
\beta_{\perp \b{a}} = \text{proj}_{\perp \b{a}} \beta =  \frac{1}{\| \b{a} \|^2}  \b{a} \cdot (\b{a} \^ \beta)$$

$$\beta = \beta_{\b{a}} + \beta_{\perp \b{a}} = \frac{1}{\vert \b{a} \vert^2} [\b{a} \^ (\b{a} \cdot \beta) + \b{a} \cdot (\b{b} \^ \beta)]$$

To understand this, recall that the classic formula for projecting onto a _unit_ vector is:

$$\b{b}_{\b{a}} = \b{a} (\b{a} \cdot \b{b})$$

That is, we find the scalar coordinate along $$\b{a}$$, then multiply by $$\b{a}$$ once again. With multivectors, $$\b{a} \cdot \beta$$ is not a scalar, so we can't just use scalar multiplication -- so it makes some sense that it would be replaced with $$\^$$.[^tensor]

[^tensor]: the other candidate would be $$\o$$, but we'd like the result to also be a multivector so it makes sense to only consider $$\^$$.

$$\b{b}_{\b{a}} = \b{a} \^ (\b{a} \cdot \b{b})$$

The classic vector rejection formula is

$$\b{b}_{\perp \b{a}} = \b{b} - \b{b}_{\b{a}} = \b{b} - \b{a} (\b{a} \cdot \b{b})$$

Using the interior product we can write this as 

$$\b{b}_{\perp \b{a}} = \b{a} \cdot (\b{a} \^ \b{b}) = (\b{a \cdot a}) \b{b} - (\b{a} \cdot \b{b}) \b{a} = \b{b} - \b{b}_{\b{a}}$$

The multivector version $$\b{a} \^ \beta $$ is only non-zero if $$\b{\beta}$$ has a component which does not contain $$\b{a}$$ -- all $$\b{a}$$-ness is removed by the wedge product, leaving something like $$\b{a} \^ \beta_{\perp \b{a}}$$. Then $$\b{a} \cdot \b{a} \^ \beta_{\perp \b{a}} = \beta_{\perp \b{a}}$$.

The correct interpretation of $$\b{a} \cdot \beta$$, then, is a lot like what it means when $$\beta = \b{b}$$: it's finding the '$$\b{a}$$-component' of $$\beta$$. It's just that, when $$\beta$$ is a multivector, the '$$\b{a}$$-coordinate' is no longer a _scalar_.

For example this is the '$$\b{x}$$'-component of a bivector $$\b{b \^ c}$$:

$$\begin{aligned}
\b{x} \cdot (\b{b \^ c}) &= b_x \b{c} - c_x \b{b} \\
&= b_x (\b{c}_x + \b{c}_{\perp x}) - c_x (\b{b}_x + \b{b}_{\perp x}) \\
&= b_x \b{c}_{\perp x} - c_x \b{b}_{\perp x}

\end{aligned}$$

Note that the result doesn't have any $$\b{x}$$ factors in it.

Once more, to be extra explicit about this intuition:

**For a unit multivector $$\alpha$$, the meaning of $$\alpha \cdot \beta$$ is to find $$\beta_{\alpha}$$, the '$$\alpha$$ component' of $$\beta$$.**

We can remove the stipulation that $$\alpha$$ be a unit multivector, but it requires being a bit careful. To illustrate why, consider an example with just vectors. What should be the value of $$v_{5x}$$? Probably as $$\frac{1}{5} v_x$$, so that $$v_x \b{x} = v_{5x} 5 \b{x}$$. Likewise, we need to divide through by the magnitude of $$\alpha$$, so it's actually $$\frac{1}{\Vert \alpha \Vert^2} \iota_{\alpha} \beta = \beta_{\alpha}$$.

Unfortunately the rejection formula doesn't work if $$\alpha$$ is a multivector. It's still true that $$\alpha \cdot \beta$$ gives the '$$\alpha$$-coordinate' of $$\beta$$, if there is one. But we can only use $$\beta_{\perp \alpha} = \beta - \frac{1}{\Vert \alpha \Vert^2} \alpha \^ (\alpha \cdot \beta)$$. The problem is that there are cases where both $$\alpha \^ \beta = \alpha \cdot \beta = 0$$, such as for $$\b{x \^ y}$$ and $$\b{y \^ z}$$.[^overlap]

[^overlap]: I think there's a way to make it work. It looks something like: for each basis multivector of lower grade, remove it from both sides, like $$(\b{x} \cdot \alpha) \cdot (\b{x} \cdot \beta)$$. But that's complicated and will have to be saved for the future.




-----

### 1.2 Derivations


If we consider our projection/rejection operations as operators, writing $$L_{\b{a}} \beta = \b{a} \^ \beta$$ and $$\iota_{\b{a}} \beta = \b{a} \cdot \beta$$, then:

$$\iota_{\b{a}} \circ L_{\b{a}} + L_{\b{a}} \circ \iota_{\b{a}}  = \vert \b{a} \vert^2 (\text{proj}_{\b{a}} + \text{proj}_{\perp \b{a}}) = \vert \b{a} \vert^2 $$

Since $$\iota^2 = L^2 = 0$$, this could also be written as

$$(\iota_{\b{a}} + L_{\b{a}})^2 = \vert \b{a} \vert^2$$

And in fact this works (although the interpretation is trickier) with different vectors for each term:

$$(\iota_{\b{a}} + L_{\b{b}})^2 = \b{a \cdot b}$$

This turns out to be connected to a lot of other mathematics. The short version is that $$\iota$$ is, technically, a ["graded derivation"](https://en.wikipedia.org/wiki/Derivation_(differential_algebra)) on the exterior algebra, which is also codified in the 'Leibniz' property:

$$\b{v} \cdot (\alpha \^ \beta) = \b{v} \cdot \alpha + (-1)^{\| \alpha \| } \alpha \^ (\b{v} \cdot \beta)$$

This is the exterior algebra version of $$\p(uv) = (\p u) v + u (\p v)$$, and the property that $$\iota L + L \iota = I$$ is the equivalent of the [fact]((https://en.wikipedia.org/wiki/Weyl_algebra)) that $$\p_x x - x \p_x = 1$$.

I don't know much about derivations and abstract algebra yet so that'll have to wait.

------

### 1.3 Duality

If we are keeping track of vector space duality, the left side of an interior product $$\alpha \cdot \beta$$ should transform like a dual multivector. (It certainly seems like it should because the left side of an inner product $$\< \alpha , \beta \>$$ should.) I have been sloppy about this. I'm hoping to collect all of the duality and metric-tensor related stuff in a later article.

The discussion about projection above seems to me to strongly suggest that we define $$\frac{\iota_{\b{a}}}{\vert \b{a} \vert^2} = \b{a}^{-1}$$ as a sort of 'multiplicative inverse' of $$\b{a}$$ for the $$\^$$ operation. It's not a true inverse, because $$\b{a} \^ \b{a}^{-1} \^ \beta = \beta_{\b{a}}$$. Instead of being invertible, dividing and then multiplying pulls out the projection on $$\b{a}$$. There is a certain elegance to it anyway.

I sometimes suspect that interior products $$\iota_{\alpha}$$, and dual vectors in general, should be considered as _negative_-grade multivectors, so $$\iota_{\alpha} \in \^^{- \| \alpha \|} V$$. Then we could write that $$\alpha \cdot \beta \in \^^{\| \beta \| - \| \alpha \|} V$$ even if $$\alpha$$ has the higher grade. This is also compelling because it explains why dual vectors transform according to the inverse of a transformation: if $$\alpha \ra A^{\^k}(\alpha)$$, of course $$ \iota_{\alpha} \ra A^{-\^ k} (\iota_{\alpha})$$. I hope to look into it this a later article.


-------

## 2. More identities

We can use $$\iota$$ to prove a few more vector identities. First, note that $$\star$$ is just a special case of $$\iota$$.[^equalgrades]

[^equalgrades]: It is easier to use the $$\cdot$$ notation for inner products, since after all they are a special case of interior products. But sometimes I use $$\<, \>$$ anyway when it makes things clearer.

$$\begin{aligned}
\< \alpha \cdot \omega, \star \beta \> &= \< \omega, \alpha \^ \star \beta \> \\
&= \< \omega, \< \alpha, \beta \> \omega \> \\
&= \< \alpha , \beta \> \\
&= \< \star \alpha, \star \beta \>
\end{aligned}$$

Since this holds for all $$\alpha, \beta$$:

$$\star \alpha = \alpha \cdot \omega$$

(1) implies that $$\iota$$ obeys many of the the same rules as $$\^$$:

$$\begin{aligned}
(\alpha \^ \beta) \cdot \gamma &= \beta \cdot (\alpha \cdot \gamma) \\
&= (-1)^{\| \alpha \| \| \beta \|} \alpha \cdot (\beta \cdot \gamma) \\
\end{aligned}$$

Combining these, we have a way to transform applications of $$\star$$:

$$\begin{aligned}
\star (\alpha \^ \beta) &= (\alpha \^ \beta) \cdot \omega  \\
&= \beta \cdot (\alpha \cdot \omega) \\
&= \beta \cdot (\star \alpha) \\
&= (-1)^{\| \alpha \| \| \beta \|} \alpha \cdot (\star \beta)
\end{aligned}$$

Since the cross product is $$\b{a} \times \b{b} = \star (\b{a} \^ \b{b})$$:

$$\b{a} \times \b{b} = \b{b} \cdot (\star \b{a}) = - \b{a} \cdot (\star \b{b})$$

This lets us unpack cross product identities. Note that $$\star^2 = (-1)^{(1)(2)} = 1$$ in $$\bb{R}^3$$.

Here's the [vector triple product](https://en.wikipedia.org/wiki/Triple_product#Vector_triple_product):

$$\begin{aligned}
\b{a \times (b \times c)} &= \star(\b{a} \^ \star(\b{b \^ c})) \\
&= - \b{a} \cdot \star^2 (\b{b \^ c}) \\
&= - \b{a} \cdot (\b{b \^ c}) \\
&= (\b{a} \cdot \b{c}) \b{b} - (\b{a} \cdot \b{b}) \b{c}
\end{aligned}$$


The [quadruple product](https://en.wikipedia.org/wiki/Quadruple_product):

$$\begin{aligned}
(\b{a \times b}) \times (\b{c \times d}) &= ((\b{a \times b}) \cdot \b{d}) \b{c} - ((\b{a \times b}) \cdot \b{c}) \b{d} \\
&= \star(\b{a \^ b \^ d}) \b{c} - \star(\b{a \^ b \^ c}) \b{d}
\end{aligned}$$



The [Jacobi Identity](https://en.wikipedia.org/wiki/Jacobi_identity):

$$\begin{aligned}
0 &= \b{a \times (b \times c)} + \b{b \times (c \times a)} + \b{c \times (a \times b)} \\

&= -{\star( \b{a} \cdot (\b{b \^ c}) + \b{b} \cdot (\b{c \^ a}) + \b{c} \cdot (\b{a \^ b}))} \\
&= -{\star( (\b{a \cdot b} - \b{b \cdot a}) \b{c} + (\b{b \cdot c - c \cdot b}) \b{a} + (\b{c \cdot a - a \cdot c}) \b{b})} \\
&= 0
\end{aligned}$$

The Jacobi Identity can also be rearranged into the following intriguing form:

$$\begin{aligned}
\b{a} \cdot (\b{b \^ c}) &= \b{b} \cdot (\b{a \^ c}) - \b{c} \cdot (\b{a \^ b}) \\
\end{aligned}$$

This is equivalent to $$( \b{b \cdot a}) \b{c} - (\b{c \cdot a}) \b{b}$$, but it hints at greater structure (which is related to $$\cdot$$ being a derivation, above). I know it's involved in Lie Algebras, but I haven't been able to find a good purely geometric intuition for what it could mean.

(An alternative proof of the Jacobi identity: the exterior algebra element $$\b{a \^ b \^ c}$$ corresponds to the tensor algebra element $$\b{a(bc-cb) + b(ca-ac) + c(ab-bc)}$$. The identity follows from contracting any two indexes of this tensor together, since it is antisymmetric in all positions.)

--------------------------------

### 2.1 Matrix Multiplication

One case where the interior product is already being used in mathematics is when multiplying by an antisymmetric matrix. A bivector $$\b{b \^ c}$$ can be represented as a tensor product $$\b{b \o c - c \o b}$$, which can be treated as an antisymmetric matrix. The interior product $$\b{a} \cdot (\b{b \^ c})$$ is then equivalent to matrix multiplication:

$$\begin{aligned}
\b{a} \cdot (\b{b \^ c}) &= (\b{a \cdot b}) \b{c} - (\b{a \cdot c}) \b{b} \\ 
&= \begin{pmatrix} 0 & b_x c_y - b_y c_x & b_x c_z - b_z c_x \\
b_y c_x - b_x c_y & 0 & b_y c_z - b_z c_y \\
b_z c_x - b_x c_z & b_z c_y - b_y c_z & 0 \end{pmatrix} \begin{pmatrix} a_x \\ a_y \\ a_z \end{pmatrix}
\end{aligned} $$

For instance this is one way of writing a rotation operator which rotates vectors by $$\frac{\pi}{2}$$ in the $$\b{bc}$$ plane (if $$\b{b}, \b{c}$$ are orthogonal unit vectors):

$$R_{\b{bc}} (\b{a}) = \b{a} \cdot (\b{b \^ c})$$




{% include ea.html %}
