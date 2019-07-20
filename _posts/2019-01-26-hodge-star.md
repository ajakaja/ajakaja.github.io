---
layout: blog
title: "EA Notes #3: The Hodge Star"
footnotes: true
math: true
aside: true
tags: notes
---

*Previously: [matrices]({{ site.baseurl }}{% post_url 2018-10-08-exterior-1 %}) and [inner products]({{ site.baseurl }}{% post_url 2018-10-09-exterior-2 %}) on exterior algebras.*

*Vector spaces are assumed to be finite-dimensional and over $$\bb{R}$$. The grade of a multivector $$\alpha$$ will be written $$\| \alpha \|$$, while its magnitude will be written $$\vert \alpha \vert$$. Bold letters like $$\b{u}$$ will refer to (grade-1) vectors, while Greek letters like $$\alpha$$ refer to arbitrary multivectors with grade $$\| \alpha \|$$.*

<!--more-->

More notes on exterior algebra. This time, the Hodge Star operator $$\star \alpha$$.

-----------


## 1. The Hodge Star

The [Hodge Star](https://en.wikipedia.org/wiki/Hodge_star_operator) operator takes multivectors to their 'complements': $$\star \b{x} = \b{y \^ z}$$. It's relative to the unit pseudoscalar of a space, so we should probably write that as $$\star_{\bb{R}^3} \b{x} = \b{y \^ z}$$ since it's not true in any other space. Some people also write $$\ast \alpha$$ or $$\vert \alpha$$ or even ~$$\alpha$$ instead. Weird.

The choice of unit pseudoscalar $$\omega = \b{x \^ y \^ z}$$ amounts to defining a global orientation and picking that you want to use the 'right hand rule' for cross products. It's otherwise kinda arbitrary. Usually we just use alphabetical order.

This is the defining property of $$\star$$:

$$\boxed{\alpha \^ (\star  \beta) = \< \alpha, \beta \> \omega} \tag{1}$$

And sometimes people define the inner product in terms of the star:

$$\< \alpha, \beta \> = \star (\alpha \^ (\star \beta)) $$

In practice this definition means: to compute $$\star \alpha$$, figure out what value of $$\star \alpha$$ satisfies $$\alpha \^ (\star \alpha) = \< \alpha, \alpha \> \omega$$. For instance, in $$\bb{R}^3$$ we have $$\star (2 \b{x}) = 2 \b{ y \^ z}$$, because $$(2 \b{x}) \^ (2 \b{y \^ z}) = 4 \omega$$. Note that $$\star \omega = 1$$ so we can use $$\star$$ to remove it: $$ \star (4 \omega) = 4$$.

We often find ourselves dealing with $$\star^2$$, so let's write that down.

$$\boxed{\star^2 \alpha = (-1)^{|\alpha||{\star \alpha}|} \alpha} \tag{2}$$

The sign comes from having to move all the terms of $$\alpha$$ and $$\star \alpha$$ past each other to get back to the original ordering. $$\star^2 = I$$ is always true for $$n$$ odd, and for $$n$$ even is true if $$k$$ is also even. So $$\star^2 = - I$$ if and only if ($$n$$ even, $$k$$ odd). Most commonly it comes up for $$(n=2, k=1)$$, rotating a vector in the plane.

It's also helpful to note that $$\star$$ preserves inner products:

$$\begin{aligned} \< \star \alpha, \star \beta \> \omega &= \star \alpha \^ \star^2 \beta \\
&= (-1)^{\| \star \alpha \| \| \beta \|} (-1)^{\| \beta \| \| \star \beta \|} {\beta \^ \star \alpha} \\
&= (-1)^{2(n-k)k}  \< \beta, \alpha \>\omega  \\
&= \< \alpha, \beta \> \omega \\
\< \star \alpha, \star \beta \> &= \boxed{\< \alpha, \beta \>}
\tag{3}
\end{aligned}$$

$$\star$$ is a linear transformation from $$\^ V \ra \^ V$$, and when restricted to elements of a particular grade, from spaces $$\^^{k} V \ra \^^{n-k} V$$. We can write it down as a matrix or as a tensor product. In $$\bb{R}^2$$ for instance it acts on vectors as:

$$\star_{\bb{R}^2} = \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}$$

Which also happens to be a $$\frac{\pi}{2}$$ rotation operator. That's probably important.

Wikipedia will tell you that the main purpose of $$\star$$ is to define, like, the de Rham cohomology on differential manifolds, or something like that. Wikipedia is silly and that was clearly written by a specialist. The main purpose of $$\star$$ is to be able to do geometry and physics for 150 years while pretending that multivectors don't exist. Anything that comes from a cross product (areas, magnetic fields, angular momenta) is, in fact, a bivector, and we get away with ignoring that fact because $$\star$$ lets us treat them like vectors.



-------

## 2. Note on Duality


Note that the Hodge star is also called the 'Hodge dual', although this is normally not the same thing vector space duality.

When you are keeping track of duality, I have found references which define $$\star$$ as both $$\^^k V \ra \^^{n-k}V$$ and as $$\^^k V \ra \^^{n-k} V^*$$. I am not sure which one is more 'correct'.

It might depend on what other machinery you have around -- if you are doing linear algebra in a space which does not have an inner product, then the wedge product gives you a mapping $$\^^k V \times \^^{n-k} V \ra \^^n V$$. Since $$\^^n V \simeq \bb{R}$$ (or whatever base field) this means that $$\^^k V$$ and $$\^^{n-k} V$$ are dual, as vector spaces, but you need to actually _provide_ a mapping $$\^^n V \ra \bb{R}$$ in order to construct the duality mapping. This amounts to picking a value of $$\omega$$, which determines the orientation and scaling of the space. The choice of $$\omega$$ identifies $$\^^k \simeq \^^{n-k} V^*$$ (see [this](https://math.stackexchange.com/questions/872/what-is-the-relationship-between-the-hodge-dual-of-p-vectors-and-the-dual-space) explanation for more).

Thus, if you have no canonical inner product, you can still define a notion of vector space duality using $$\star$$.  I am mostly trying to develop for myself a low-level view of exterior algebra for use in familiar Euclidean vector spaces, so I've been assuming away the presence of an inner product without thinking about this.

If you _do_ have an inner product, then you also have an isomorphism $$V \mapsto V^*$$, and so you have $$\^^{k} V \simeq \^^{k} V^*$$, and thus $$\star$$ can be considered as a map $$\^^k V \ra \^^{n-k} V$$.

In physics, at least, we invoke vector space duality when we are concerned with preserving inner products under coordinate transformations. With $$\star: \^^k V \ra \^^{n-k} V$$, the transformation of a multivector $$\star \alpha$$ is taken care of by the transformation rules for $$\^^{n-\| \alpha \|} V$$, without needing to consider it as a dual vector.. Although keep in mind that $$\star$$ itself is only preserved by positively-oriented orthonormal transformations, which have $$\det (A) = 1$$.

--------

## 3. The Cross Product

My goal with these articles has so far been to demonstrate the usefulness of exterior algebra by cleanly showing how it leads to lots of vector identities. Thus, we should go ahead and address the cross product.

In $$\bb{R}^3$$, the vector cross product takes two vectors and produces a third vector, orthogonal to them. This is better understood as taking their wedge product, then mapping that to a vector:

$$\b{a \times b} = \star(\b{a \^ b})$$

I say 'better understood' because this understanding elucidates properties such as how as a cross product [transforms](https://en.wikipedia.org/wiki/Pseudovector) under coordinate transformations. And if you just stick with the bivector, you don't have to worry about the right hand rule either.

Some people will tell you that there's also a 7-dimensional cross product. They are basically wrong. There is, sort of, but it's the wrong generalization, and it's useless for geometry. $$a \times b = \star (a \^ b)$$ is the one you want -- it's just that it only maps back to vectors in $$\bb{R}^3$$ (or you can define it to take $$N-1$$ arguments in $$\bb{R}^N$$, but then why aren't you just using $$\^$$?).

We can quickly compute the inner product of two cross products using (3):

$$\begin{aligned}
\< \b{a \times b}, \b{c \times d} \> &= \< \star (\b{a \^ b}), \star (\b{c \^ d}) \> \\
&= \< \b{a \^ b}, \b{c \^ d} \> \\
&= (\b{a} \cdot \b{c}) (\b{b \cdot d}) - (\b{a \cdot d}) (\b{b \cdot c})
\end{aligned}$$

And here's the [scalar triple product](https://en.wikipedia.org/wiki/Triple_product#Scalar_triple_product), using (1):

$$\begin{aligned}
\b{a \cdot (b \times c)} &=  \b{a} \cdot \star (\b{b \^ c}) \\
&= \star(\b{b \^ c \^ a}) \\
&= \star(\b{a \^ b \^ c})
\end{aligned}$$

The $$\star$$ on the result reflects the fact that $$\b{a \^ b \^ c} \in \^^{3} \bb{R}^3$$, so we apply $$\star$$ to get a scalar value.


Just like we can lift a linear transformation $$A$$ to its action on a wedge product, such as $$A^{\^ 2}(\b{x \^ y}) = A(\b{x}) \^ A(\b{y})$$, we can (presumably) lift it to its action on a Hodge star or a cross product. That is, this transformation exists for $$A: V \ra V$$:

$$A^{\star}(\star \b{v}) \equiv \star A(\b{v}) \\
A^{\star} = \star A \star^{-1}$$

This is important because if you have a value which is the result of a cross product, such as a $$\b{z} = \b{x \times y}$$, it does not transform like the unit vector $$\b{z}$$. We can write down a variant of $$A$$ which acts on cross products:

$$A^{\times}(\b{u \times v}) \equiv A(\b{u}) \times A(\b{v}) \\
A^{\times} = \star A^{\^ 2} \star^{-1} = \star A^{\^ 2} \star$$

It turns out that $$A^{\times} = (A^{-1})^T$$, which I'll investigate soon when we tackle the matrix inverse.

---------

(This article used to also include the interior product but it seemed very long and unwieldy, so I've split them up.)

{% include ea.html %}
