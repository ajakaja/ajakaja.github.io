---
layout: blog
title: "Exterior Algebra Notes #3: The Hodge Star"
footnotes: true
math: true
aside: true
tags: notes
---

*Previously: [matrices]({{ site.baseurl }}{% post_url 2018-10-08-exterior-1 %}) and [inner products]({{ site.baseurl }}{% post_url 2018-10-09-exterior-2 %}) on exterior algebras.*

*Vector spaces are assumed to be finite-dimensional and over $$\bb{R}$$. The grade of a multivector $$\alpha$$ will be written $$\| \alpha \|$$, while its magnitude will be written $$\Vert \alpha \Vert$$. Bold letters like $$\b{u}$$ will refer to (grade-1) vectors, while Greek letters like $$\alpha$$ refer to arbitrary multivectors with grade $$\| \alpha \|$$.*

<!--more-->

More notes on exterior algebra. This time, the Hodge Star operator $$\star \alpha$$.

This is where things start to get confusing: there's a bunch of operations that do... stuff... to multivectors, but they start to stray from geometric intuition and there are tons of formulas capturing all their relationships. It's pretty unsatisfying. I'm gonna write it out anyway, but in a few posts I hope to figure out a way to know all of this stuff without having to remember so many equations.

-----------


## 1. The Hodge Star

The [Hodge Star](https://en.wikipedia.org/wiki/Hodge_star_operator) operator takes multivectors to their 'complements': $$\star \b{x} = \b{y \^ z}$$. Given a choice of pseudoscalar $$\omega$$, $$\star \alpha$$ is a multivector such that $$\alpha \^ \star \alpha = \omega$$. Notice that the operation is entirely defined _relative_ to a choice of pseudoscalar. This means that $$\star \b{x}$$ means different things depending on whether you're operating in $$\bb{R}^2$$, $$\bb{R}^3$$, etc.

Other notations for $$\star \alpha$$ include $$\ast \alpha$$ or $$\vert \alpha$$ or even ~$$\alpha$$. Weird.

The choice of unit pseudoscalar $$\omega = \b{x \^ y \^ z}$$ amounts to defining a global orientation and picking that you want to use the 'right hand rule' for cross products. It's otherwise kinda arbitrary. Usually we just use alphabetical order for the basis vectors, and that's what is meant if we don't specify otherwise.

$$\alpha \^ \star \alpha = \omega$$ doesn't totally specify $$\star \alpha$$ (we can freely add any component orthogonal to $$\alpha$$.). So instead we define $$\star$$ so that this holds for _any_ choice of $$\beta$$:

$$\boxed{\beta \^ (\star  \alpha) = \< \beta, \alpha \> \omega} \tag{1}$$

Although sometimes people define the inner product in terms of the star instead:

$$\< \beta, \alpha \> = \star (\beta \^ (\star \alpha)) $$

This definition means: to compute $$\star \alpha$$, figure out what value of $$\star \alpha$$ satisfies $$\alpha \^ (\star \alpha) = \< \alpha, \alpha \> \omega$$. Then ensure that the coefficient of anything orthogonal to $$\alpha$$ is $$0$$.

Example in $$\bb{R}^3$$: $$\star (2 \b{x}) = 2 \b{ y \^ z}$$, because $$(2 \b{x}) \^ (2 \b{y \^ z}) = (2 \b{x} \cdot 2 \b{x}) \omega = 4 \omega$$.  Of course, $$\star \b{x} \stackrel{?}{=} 2 \b{y \^ z} + 2 \b{x \^ z}$$ also satisfies $$\alpha \^ \star \alpha = 4 \omega$$, but it violates (1), because $$\b{y} \^ \star \b{x} = (\b{y} \cdot \b{x}) \omega = 0$$, but $$\b{y} \^ (2 \b{x \^ z}) = -2 \omega \neq 0$$. So we have to set the coefficient of $$\b{x \^ z}$$ (and $$\b{x \^ y}$$ for the same reason) to $$0$$.

We will use ourselves $$\star^2$$ a lot, so let's write that down.

$$\boxed{\star^2 \alpha = (-1)^{|\alpha||{\star \alpha}|} \alpha} \tag{2}$$

The sign comes from having to move all the terms of $$\alpha$$ and $$\star \alpha$$ past each other to get back to the original ordering (work through an example to see why). $$\star^2 = I$$ is always true for $$n$$ odd, and for $$n$$ even is true if $$k$$ is also even. So $$\star^2 = - I$$ if and only if ($$n$$ even, $$k$$ odd). This is the case when $$(n=2, k=1)$$, ie when rotating a vector in a plane, so $$\star^2_{\bb{R}^2} \b{x} = - \b{x}$$.

We will often use the fact that $$\star$$ preserves inner products:

$$\begin{aligned} \< \star \alpha, \star \beta \> \omega &= \star \alpha \^ \star^2 \beta \\
&= (-1)^{\| \star \alpha \| \| \beta \|} (-1)^{\| \beta \| \| \star \beta \|} {\beta \^ \star \alpha} \\
&= (-1)^{2(n-k)k}  \< \beta, \alpha \>\omega  \\
&= \< \alpha, \beta \> \omega \\
\< \star \alpha, \star \beta \> &= \boxed{\< \alpha, \beta \>}
\tag{3}
\end{aligned}$$

$$\star$$ is a linear transformation from $$\^ V \ra \^ V$$, and when restricted to elements of a particular grade, from spaces $$\^^{k} V \ra \^^{n-k} V$$. We can write this linear transformation down as a matrix. In $$\bb{R}^2$$ it takes vectors to vectors, so has a the particularly nice form of the standard rotation matrix:

$$\star_{\bb{R}^2} = \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}$$

Wikipedia will tell you that the main purpose of $$\star$$ is to define, like, the de Rham cohomology on differential manifolds, or something like that. Wikipedia is silly and that was clearly written by a specialist. The main purpose of $$\star$$ is to be able to do geometry and physics for 150 years while pretending that multivectors don't exist. As we will see, anything that uses a cross product (areas, magnetic fields, angular momenta) is, in fact, a bivector, and we get away with ignoring that fact because $$\star$$ lets us treat them like vectors.



-------

## 2. Note on Duality


The Hodge star is also called the 'Hodge dual'. This is not the same thing vector space duality. But it's related, so it can get kinda confusing.

When you are keeping track of duality, I have found references which define $$\star$$ as both $$\^^k V \ra \^^{n-k}V$$ and as $$\^^k V \ra \^^{n-k} V^*$$. I suppose it depends on whether you assuming the existence of an inner product as well, which lets you identify $$\^^{n-k} V \simeq \^^{n-k} V^*$$. As mentioned above, some sources define $$\star$$ in terms of the inner product and some define the inner product in terms of $$\star$$.

Even without an inner product or $$\star$$, the wedge product provides a construction of the dual space. Since the space $$\^^n V$$ is one-dimensional, it is isomorphic to $$\bb{R}$$, although there is no canonical choice of isomorphism (which amounts to picking a pseudoscalar). This means the map $$\un{k}{\alpha} \ra \alpha \^ \un{n-k}{\beta} \in \^^n V$$ is a map $$\^^k V \ra \bb{R}$$, so $$\^^{n-k} V \simeq (\^^k V)^*$$ and $$\^^k V \simeq (\^^{n-k}V)^*$$. This means the spaces are dual, in that each can be treated as a map from the other to $$\bb{R}$$, but it doesn't select a particular definition of this map.

A choice of $$\star$$ or inner product (each can be defined in terms of the other) additionally maps $$\^^k \simeq \^^{n-k} V$$, and thus provides the isomorphism $$\^^{n-k} V \simeq \^^{n-k} V^*$$. Something like that. See [this](https://math.stackexchange.com/questions/872/what-is-the-relationship-between-the-hodge-dual-of-p-vectors-and-the-dual-space) explanation for more.

In physics, at least, we invoke vector space duality when we are concerned with creating coordinate-independent quantities. In a coordinate-independent inner product like $$a \cdot b$$, one side must be contravariant and the other covariant, so that the result is invariant. Since $$\star (a \cdot b) = a \^ \star b$$, $$b$$ and $$\star b$$ must have opposite variance, so $$\star$$ has to apply the metric to perform this operation. The result is unwieldy (you can see one version on [wikipedia](https://en.wikipedia.org/wiki/Hodge_star_operator#Computation_in_index_notation)), but I think I am going to wait on figuring it out for myself until I contend with everything else in a covariant way also in some future article.

It is worth noting that $$\star$$ itself is not coordinate-invariant, at all. After all it depends on a particular choice of pseudoscalar, which is only preserved by orientation-preserving orthonormal transformations.

--------

## 3. The Cross Product

My goal with these articles has so far been to demonstrate the usefulness of exterior algebra by cleanly showing how it leads to lots of vector identities. Thus, we should go ahead and address the cross product.

In $$\bb{R}^3$$, the vector cross product takes two vectors and produces a third vector, orthogonal to them. This is better understood as taking their wedge product, then using $$\star$$ to map that to a vector:

$$\b{a \times b} = \star(\b{a \^ b})$$

I say 'better understood' because this understanding elucidates properties such as how as a cross product [transforms](https://en.wikipedia.org/wiki/Pseudovector) under coordinate transformations. And if you just stick with the bivector, you don't have to worry about the right hand rule either.

Some people will tell you that there's also a 7-dimensional cross product. They are basically wrong. Well, there is one, sort of, but it's the wrong generalization, and it's useless for geometry. $$a \times b = \star (a \^ b)$$ is the definition that extends to other dimensions the way you want -- it's just that it only maps vectors to vectors in $$\bb{R}^3$$. Alternatively, you could define it to take $$n-1$$ vectors to another vector in any $$\bb{R}^n$$, but at that point why aren't you just using $$\^$$?

In these identities we'll assume the standard unit pseudoscalar with basis vectors in alphabetical order.

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

It turns out that $$A^{\times} = (A^{-1})^T$$, which we still aren't ready to go into detail on because we need to discuss the matrix inverse.

---------

(This article used to also include the interior product but it seemed very long and unwieldy, so I've split them up.)

{% include ea.html %}
