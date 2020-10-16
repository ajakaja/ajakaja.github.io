---
layout: blog
title: "All the Exterior Algebra Operations"
footnotes: true
math: true
aside: true
tags: notes
---

I'm returning to exterior algebra notes. This time, a reference for all of the many operations that I am aware of throughout the subject. It's easier to define them all in one place than to spread the definitions over articles that use them.

I will make a point of giving explicit algorithms and an explicit example of each, in the lowest dimension that can still be usefully illustrative.

Warning: very long.

<!--more-->

-----

## Background on terminology and notations

As far as I can tell, the same ideas underlying what I call 'exterior' algebra have been developed at least four separate times in four notations. A rough history is:

Grassmann developed the original ideas in the ~1840s, particularly in his _Ausdehnungslehre_, which unfortunately was never very well popularized, particularly because linear algebra hadn't really been developed yet. Grassmann's goal was, roughly, to develop 'synthetic geometry': geometry without any use of coordinates, where all of the operations act on abstract variables.

Some of Grassmann's ideas made it into projective geometry, where multivectors are called 'flats' (at least in one book I have, by Stolfi) and typically handled in projective coordinates (in which the point $$(x,y)$$ is represented by any value $$(\lambda x, \lambda y, \lambda)$$). Some ideas also made it into algebraic geometry, and there is some overlap with 'algebraic varieties'; I don't know much about this yet.

Cartan and others develop the theory of differential forms in the 1920s and included a few parts of Grassman's exterior algebra, which got the basics included in most algebra texts thereafter. Physicists adopted the differential forms notation for handling curved spaces in general relativity, so they got used to wedge products there. But most of vector calculus was eventually based on Hamilton's quaternions from the ~1840s, simplified into its modern form by Heaviside in the ~1880s.

In the 1870s Clifford combined Hamilton and Grassmann's ideas into 'Clifford Algebras', but they were largely forgotten in favor of quaternions and later vector analysis. Dirac accidentally re-invented Clifford algebras in the 1920s with the Dirac/gamma matrices in relativistic QM. Hestenes eventually figured this out and did a lot of work to popularize his 'Geometric Algebra' starting in the 1960s, and a small but vocal group of mostly physicists has been pushing for increased use of multivectors / GA since then. More on this later.

Rota and his students also discovered Grassmann at some point (the 1960s as well, I think?) and developed the whole theory again as part of what they called 'invariant theory', in which they called multivectors 'extensors'. They have a lot of good ideas but their notations largely suck. Rota and co. also overlapped into 'matroid' theory, which deals with the abstract notion of linear dependence and so ends up using a lot of the same ideas.

So "multivectors", "extensors", and "flats" (and "matroids" in the context of real vector spaces) (and "varieties" in some cases?) basically are all the same thing. "Exterior product", "wedge product", "progressive product", and "join" are all the same operation.

For the most part I greatly prefer notations and terminology based on vector algebra, so I stick with "multivector" and translate other things where possible. However, it is undeniable that the best name for the exterior product is the **join**, and its dual is the **meet**.

Everyone also picks their choice of scalar coefficients differently. I always pick the one that involves the fewer factorial terms, and I don't care about making sure the choices generalize to finite fields.

Unfortunately, Cartan and the vector analysis folks definitely got the symbol $$\^$$ for the exterior product wrong. Projective geometers and Rota got it right: it should be $$\vee$$, rather than $$\^$$. Join is to vector spaces what union is to sets, and union is $$\cup$$. Meet (discussed below) is equivalent to $$\cap$$. (And linear subspaces form a lattice, which already uses the symbols $$\^$$ and $$\v$$ this way, plus the terminology 'join' and 'meet'!) 

I'm going to keep using $$\^$$ for join here for consistency with most of the literature, but it's definitely wrong, so here's an open request to the world:

**If you ever write a textbook using exterior algebra that's going to be widely-read, please fix this notation for everyone by swapping $$\^$$ and $$\v$$ back. Thanks.**

----------

## Note on duality

Since I am mostly concerned with eventually using this stuff for physics, I can't ignore the way physicists handle vector space duality. The inner product of vectors is defined only between a vector and its dual, and contraction is performed using a metric tensor, so $$g: V \o V^* \ra \bb{R}$$. In index notation this means you always pair a lower index with an upper one: $$\b{u} \cdot \b{v} = u_i v^i$$.

However, I think most of this should be intuitive even on plain Euclidean space with an identity metric, so I tend to prefer first presenting each equation with no attention paid to duality, then a version with upper and lower indices. I'll mostly avoid including a metric-tensor version for space, but it can usually be deduced from the index-notation version.

An added complication is that there is an argument to be made that use of the dual vector space to define the inner product is a _mistake_. I am not exactly qualified to say if this correct or not, but after everything I've read I suspect it is. The alternative to vector space duality is to define everything in terms of the volume form, so the inner product is defined by the relation:

$$ \alpha \^ \star \beta = \< \alpha, \beta \> \omega$$

With $$\omega$$ a choice of pseudoscalar. This means that the choice of metric becomes a choice of _volume form field_, which is actually pretty compelling. $$\< \alpha, \_ \>$$ _is_ a linear functional $$\in V^* \simeq V \ra \bb{R}$$, and so does comprise the dual vector space. But this can also make it tricky to define $$\star$$, depending on whether you think it should give a dual multivector or not.

Another idea is to interpret $$V^*$$ as a "-1"-graded vector, so that $$\underset{-1}{a} \^ \underset{1}{b} = \underset{0}{(a \cdot b)}$$. 'Dual multivectors' then have negative grades in general. This often seems like a good idea but I'm not sure about it yet.

Rota's Invariant Theory school uses yet another definition of the inner product. They define the wedge product in terms of another operation, called a 'bracket' $$[, ]$$, so that $$\alpha \^ \star \beta = [\alpha, \beta] \omega$$, but they also seem to treat the pseudoscalar as a regular scalar and so call this an inner product. I don't think this is the right approach because I'm not comfortable forgetting the difference between $$\^^n \bb{R}$$ and $$\bb{R}$$, although as above I do like the idea of the volume form as defining the inner product. (They call the whole space equipped with such a bracket a 'Peano space'. I don't think the name caught on.)

--------

## 1. The Tensor Product $$\o$$

We should briefly mention the tensor product first. $$\o$$ is the 'free multilinear product' on vector spaces. Multilinear means that $$u \o v$$ is linear in both arguments: $$(c_1 u_1 + c_2 u_2) \o v = c_1 (u_1 \o v) + (c_2 u_2 \o v)$$, etc.  [Free](https://en.wikipedia.org/wiki/Free_object) means that any other multilinear product (such as $$\^$$) factors through $$\o$$. That is, if $$\alpha \^ \beta$$ is multilinear in its arguments, then there is a map $$f$$ such that $$f(\alpha \o \beta) = \alpha \^ \beta)$$. 

'Free'-ness is generally a useful concept. $$\^$$ happens to be the free _antisymmetric_ product, so any other antisymmetric operation on the tensor algebra factors through $$\^$$. There are 'free'-r products than $$\o$$ as well, if you let go of multilinearity and associativity as well.

$$\o$$ acting on $$V$$ (a vector space over $$\bb{R}$$) produces the 'tensor algebra' consisting of consisting of $$\o V = \bb{R} \oplus V \oplus V^{\o 2} \oplus \ldots $$, with $$\o$$ as the multiplication operation. There is a canonical inner product on any $$V^{\o n}$$ inherited from $$V$$'s: $$\< \b{a} \o \b{b}, \b{c} \o \b{d} \> = \< \b{a}, \b{c} \> \< \b{b} , \b{d} \>$$.

-------

## 2. The Exterior Product $$\^$$

The basic operation is the exterior product $$\alpha \^ \beta$$. Its most general definition is via the quotient of the tensor algebra (so, $$\o V = \bb{R} \oplus V \oplus V^{\o 2} \oplus \ldots $$, with $$\o$$ as the multiplication operation) by the relation $$x \o x \sim 0$$ for all $$x$$. Specifically, the exterior _algebra_ is the algebra you get under this quotient; the exterior _product_ is the behavior of $$\o$$ under this algebra homomorphism.

Given a vector space $$V$$ and tensor algebra $$\o V$$, we define $$I$$ as the ideal of elements of the form $$x \o x$$ (so any tensor which contains any copy of the same basis vector twice). Then:

$$\^ V \equiv V / I$$

Elements in this quotient space are multivectors like $$\alpha \^ \beta$$, and $$\o$$ maps to the $$\^$$ operation. If $$\pi$$ is the canonical projection $$V \mapsto V/I$$:

$$\pi(\alpha) \^ \pi(\beta) \equiv \pi(\alpha \o \beta)$$

In practice, you compute the wedge product of multivectors by just appending them, as the product inherits associativity from $$\o$$ (with $$\| \alpha \| = m, \| \beta \| = n$$):

$$\alpha \^ \beta = \alpha_1 \^ \ldots \^ \alpha_{m} \^ \beta_1 \^ \ldots \^ \beta_n$$

There is are several standard ways to map a wedge product back to a tensor product (reversing $$\pi$$, essentially, so we'll write it as $$\pi^{-1}$$ although it is not an inverse). One is to select *any* valid tensor:

$$\pi^{-1} \alpha \stackrel{?}{=} (\alpha_1 \^ \ldots \^ \alpha_n) = \alpha_1 \o \ldots \o \alpha_n$$

More useful, however, it to map the wedge product to a totally antisymmetrized tensor:

$$\pi^{-1} \alpha = K \sum_{\sigma \in S_{m}} \sgn(\sigma) \alpha_{\sigma(1)} \o \ldots \o \alpha_{\sigma(m)}$$

This has $$m!$$ terms for simple vectors $$\^^m \bb{R}^n$$ ($${n \choose m}$$ in total for all bases) so it is impractical for algorithms, but is good for theoretical understanding. $$K$$ is a constant that is chosen to be either $$1$$, $$\frac{1}{m!}$$, or $$\frac{1}{\sqrt{m!}}$$, depending on the source. I prefer $$K=1$$ so I'll always use that.

$$\pi^{-1}(\b{x} \^ \b{y}) = \b{x} \o \b{y} - \b{y} \o \b{x}$$

Antisymmetric tensors that appear in other subjects are usually supposed to be multivectors. Antisymmetrization is a familiar operation in Einstein notation:

$$\b{a} \^ \b{b} \^ \b{c} \equiv a_{[i} b_j c_{k]} = \sum_{\sigma \in S_3} \sgn(\sigma) a_{\sigma(1)} b_{\sigma(2)} c_{\sigma(3)}$$

Other names:

* "Wedge product", because it looks like a wedge
* "Progressive Product" (by Grassmann and Gian-Carlo Rota). 'Progressive' because it increases grades.
* "Join", in projective geometry and lattice theory. So-called because the wedge product of two vectors gives the linear subspace spanned by them, if it is non-zero.

As mentioned above, the symbol for 'join' in other fields is $$\vee$$. Exterior algebra has it backwards. It's definitely wrong: these operations in a sense generalize set-theory operations, and $$\^$$ should correspond to $$\cup$$.

--------

## 3. The Inner Product $$\<, \>$$

The multivector inner product, written $$\alpha \cdot \beta$$ or $$\< \alpha, \beta \>$$, where $$\alpha$$ and $$\beta$$ have the same grade.

There are several definitions that disagree on whether it should have any scaling factors like $$\frac{1}{k!}$$, depending on the definition of $$\^$$. I think the only reasonable definition is that $$(\b{x \^ y}) \cdot (\b{x \^ y}) = 1$$. This means that this is _not_ the same operation as the _tensor_ inner product, applied to antisymmetric tensors:

$$(\b{x \^ y}) \cdot (\b{x \^ y}) \neq (\b{x \o y} - \b{y \o x}) \cdot (\b{x \o y} - \b{y \o x}) = 2$$

But it's just too useful to normalize the magnitudes of all basis multivectors. It avoids a lot of $$k!$$ factors that would otherwise appear everywhere.

To compute, either antisymmetrize _both_ sides in the tensor representation and divide by $$k!$$, or just antisymmetrize one side (either one):

$$\begin{aligned}
(\b{a \^ b}) \cdot (\b{c \^ d}) &= \frac{1}{2!}(\b{a \o b} - \b{b \o a}) \cdot (\b{c \o d} - \b{d \o c}) \\
&= (\b{a \o b}) \cdot (\b{c \o d} - \b{d \o c}) \\
&= (\b{a \cdot c}) (\b{b \cdot d}) - (\b{a \cdot d}) (\b{b \cdot c})
\end{aligned}
$$

This also gives the coordinate form:

$$(\b{a \^ b}) \cdot (\b{c \^ d}) = a_i b_j c^{[i} d^{j]} = a_i b_j (c^i d^j - c^j d^i)$$

Or in general:

$$\< \alpha, \beta \> = \< \bigwedge \alpha_i, \bigwedge \beta_j \> = \det(\alpha_i \cdot \beta_j)$$

--------

## 4. The Interior Product $$\cdot$$

The interior product is the 'curried' form of the inner product:

$$\< \b{a} \^\alpha, \beta \> = \< \alpha, \b{a} \cdot \beta \>$$

This is written as either $$\b{a} \cdot \beta$$ or $$\iota_{\b{a}} \cdot \beta$$. Computation is done by antisymmetrizing the side with the larger grade, then contracting:

$$\b{a} \cdot (\b{b \^ c}) = \b{a} \cdot (\b{b \o c} - \b{c \o b}) = (\b{a} \cdot \b{b}) \b{c} - (\b{a} \cdot \b{c}) \b{b}$$

In index notation:

$$\b{a} \cdot (\b{b \^ c}) = a_i b^{[i} c^{j]} = a_i (b^{i} c^{j} - b^j c^i)$$

Other names: the "contraction" or "insertion" operator, because it inserts its left argument into some of the 'slots' in the inner product of the right argument.

**The two-sided interior product** 

Normally, in the notation $$\alpha \cdot \beta$$, it's understood that the lower grade is on the left, and the operation isn't defined otherwise. But some people ignore this restriction, and I'm warming up to doing away with it entirely. I can't see any reason not to define it to work either way.

When tracking dual vectors we need to be careful about which side ends up 'surviving'. To be explicit, let's track which ones we are considering as dual vectors:

$$\b{x}^* \cdot (\b{x} \^ \b{y}) = \b{y} \\
(\b{x}^* \^ \b{y}^*) \cdot \b{x} = \b{y}^*
$$

Note that in both cases the vectors contract _left-to-right_. One vector / dual-vector is inserted into the 'slots' of the other dual-vector/vector. In coordinates, these are:

$$\b{a}^* \cdot (\b{b \^ c}) = a_i (b^{[i} c^{j]})$$

$$(\b{b}^* \^ \b{c}^*) \cdot \b{a} = a^i(b_{[i} c_{j]})$$

---------

## 5. The Hodge Star $$\star$$

$$\star$$ produces the 'complementary subspace' to the subspace denoted by a multivector. It is only defined relative to a choice of pseudoscalar $$\omega$$ -- usually chosen to be all of the basis vectors in lexicographic order, like $$\b{x \^ y \^ z}$$ for $$\bb{R}^3$$. Then:

$$\star \alpha = \alpha \cdot \omega$$

A more common but less intuitive definition:

$$\alpha \^ (\star \beta) = \< \alpha, \beta \> \omega$$

The inner product and Hodge star are defined in terms of each other in various sources. For my purposes, it makes sense to assume the form of the inner product.

In practice, I compute $$\star \alpha$$ in my head by finding a set of basis vectors such at $$\alpha \^ \star \alpha = \omega$$ (up to a scalar). Explicit example in $$\bb{R}^4$$:

$$\star(\b{w} \^ \b{y}) = - \b{x \^ z}$$

because 

$$\b{(w \^ y) \^ x \^ z} = - \b{w \^ x \^ y \^ z} = - \omega$$

In Euclidean coordinates, $$\omega$$ is given by the Levi-Cevita symbol $$\epsilon_{ijk}$$, and $$\star \alpha = \alpha \cdot \omega$$ works as expected:

$$\star(\b{a} \^ \b{b})_k = \epsilon_{ijk} a^i b^j$$

This is using the convention that the $$\star$$ of a vector is a lower-index dual vector. I've seen both conventions: some people would additionally map it back to a vector using the metric:

$$\star(\b{a} \^ \b{b})^k = \epsilon_{ij}^k a^i b^j = g^{kl} \epsilon_{ijl} a^i b^j$$

Either convention seems fine as long as you keep track of what you're doing. They're both valid in index notation, anyway; the only difference is choosing which is meant by $$\star \alpha$$.

It is kinda awkward that $$\omega$$ is the usual symbol for the pseudoscalar object but $$\e$$ is the symbol with indices. It is amusing, though, that $$\e$$ looks like a sideways $$\omega$$. I'll stick with this notation here but someday I hope we could just use $$\omega$$ everywhere, since $$\e$$ is somewhat overloaded.

$$\star$$ is sometimes written $$\ast$$, but I think that's uglier. In other subjects it's written as $$\star \alpha \mapsto \alpha^{\perp}$$ which I do like.

We need a bit of notation to handle $$\star$$ is arbitrary dimensions. We index with multi-indices of whatever grade is needed -- for the Levi-Cevita symbol, we write $$\e_{I}$$ where $$I$$ ranges over the one value, $$\omega$$, of $$\^^n V$$ (note: this is different than ranging over _every_ choice of $$I$$ with $$n!$$ terms. Instead, we index by a single multivector term. It's a lot easier.) To express contraction with this, we split the index into two multi-indices: $$\e_{I \^ J}$$, so $$\star \alpha$$ is written like this:

$$(\star \alpha)_{K} = \alpha^I \e_{I K}$$

The implicit sum is over every value of $$I \in \^^{\| \alpha \|} V$$.

Note that in general $$\star^2 \alpha = (-1)^k (-1)^{n-k} \alpha$$, so $$\star^{-1} \alpha = (-1)^k (-1)^{n-k}  \star \alpha$$. 

-------

## 6. The Cross Product $$\times$$

The cross-product is only defined in $$\bb{R}^3$$ and is given by:

$$\b{a} \times \b{b} = \star (\b{a} \^ \b{b})$$

Some people say there is a seven-dimensional generalization of $$\times$$, but they're misguided. This generalizes to every dimension.

--------

## 7. The Partial Trace $$\cdot_k$$

In index notation it is common to take a 'partial trace' of a tensor: $$c_i^k = a_{ij} b^{jk}$$, and sometimes we see a partial trace of an antisymmetric tensor:

$$c_j^k = a_{[i, j]} b^{[j, k]} = (a_{ij} - a_{ji})(b^{jk} - b^{kj}) = a_{ij} b^{jk} - a_{ji} b^{jk} - a_{ij} b^{kj} + a_{ji} b^{kj}$$

For whatever reason I have never seen an coordinate-free notation for this for multivectors. But it's actually an important operation, because if we treat bivectors as rotation operators on vectors, it's how they compose:

$$[(a \b{x} + b \b{y}) \cdot  (\b{x \^ y})] \cdot (\b{x \^ y} ) = (a \b{y} - b \b{x}) \cdot (\b{x \^ y}) = - (a \b{x} + b \b{y})$$

Which means that apparently

$$R_{xy}^2 = (\b{x} \^ \b{y}) \circ  (\b{x} \^ \b{y}) = -(\b{x \o x} + \b{y \o y})$$

Note that the result _isn't_ a multivector. In general it's an element of $$\^ V \o \^ V$$. 

But it's still useful. What's the right notation, though? Tentatively, I propose we write $$\cdot_k$$ to mean contracting $$k$$ terms together. The choice of _which terms_ is a bit tricky. The geometric product, discussed later, suggests that we should do inner-to-outer. But the way we already handle inner products suggests left-to-right. For consistency let's go with the latter, and insert $$-1$$ factors as necessary.

The partial trace of two multivectors is implemented like this:

$$\alpha \cdot_k \beta = \sum_{\gamma \in \^^k V} (\gamma \cdot \alpha) \o (\gamma \cdot \beta) \in \^ V \o \^ V$$

Where the sum is over unit-length basis multivectors $$\gamma$$. Note that this use of $$\o$$ is _not_ the multiplication operation in the tensor algebra we constructed $$\^ V$$ from; rather, it is the $$\o$$ of $$\^ V \o \^ V$$. This translates to:

$$[\alpha \cdot_k \beta]_{J K} = \alpha_{IJ} \beta^I_{K} = \delta^{IH} \alpha_{IJ} \beta_{HK}$$

(That $$\delta$$ is the identity matrix; recall that indexing it by multivectors $$I, H \in \^^k V$$ means to take elements of $$\delta^{\^^k}$$ which is the identity matrix on $$\^^k V$$.)

This construction gives $$(\b{x \^ y})^{(\cdot_1) ^2} = (\b{x \o x + y \o y}) = I_{xy}$$, because we contracted the first indices together. When used on a vector as a rotation operator, we need a rule like this:

$$R_{xy}^2 = - (\b{x \^ y})^{\cdot_1 2}$$

In general, contracting operators that are going to act on grade-$$k$$ objects gives $$O \circ O = (-1)^k O^{\cdot 2}$$. But I don't think it's worth thinking too hard about this: the behavior is very specific to the usage.

**Partial Star:**

One funny thing we can do with a partial trace is apply $$\star$$ to one component of a multivector :

$$\star_k \alpha = \alpha \cdot_k \omega$$

Example in $$\bb{R}^3$$:

$$\begin{aligned}
\star_1 \b{x \^ y} &= (\star \b{x}) \o \b{y} - (\star \b{y}) \o \b{x} \\
&= (\b{y \^ z}) \o \b{y} - (\b{z \^ x}) \o \b{x}
\end{aligned}$$

I would have thought this was overkill and would never be useful, but it turns out it has a usage in the next section.

**Coproduct slice:**

Prior to this section I haven't really considered tensor powers of exterior algebras like $$\^ V \o \^ V$$ in general before, except for wedge powers of matrices like $$\^^2 A$$. But they do come up in the literature sometimes. Rota & Co had an operation they called the "coproduct slice" of a multivector, which splits a multivector in two by antisymmetrically replacing one of the $$\^$$ positions with a $$\o$$, like this:

$$\p_{2,1} (\b{x \^ y \^ z}) = (\b{x \^ y}) \o \b{z} + (\b{y \^ z}) \o \b{x} + (\b{z \^ x}) \o \b{y}$$

This gets at the idea that any wedge product (the free antisymmetric multilinear product) factors through the tensor product (the free multilinear product), and some concepts make more sense on the tensor product. For instance, it makes more sense to me to take the trace of two tensored terms than of two wedged terms. In general I am still trying to figure out for myself whether the "quotient algebra" or "antisymmetric tensor algebra" senses of $$\^$$ are more important and fundamental, and the right way to think about the two. 

Up to a sign, the coproduct slice can be implemented by tracing over the unit basis $$k$$-vectors:

$$\p_{k, n-k} \beta = \sum_{\alpha \in \^^k V} \alpha \o (\alpha \cdot \beta )$$

----------

## 8. The Meet $$\vee$$

$$\star$$ maps every multivector to another one. Its action on the wedge product is to produce a dual operation $$\vee$$, called the _meet_ (recall that the wedge product is also aptly called the 'join').

$$(\star \alpha) \vee (\star \beta) = \star(\alpha \^ \beta)$$

The result is a complete exterior algebra because it's isomorphic to one under $$\star$$. So _both_ of these are valid exterior algebras obeying the exact same rules:

$$\^ V = (\^, V)$$

$$\vee V = (\vee, \star V)$$

All operations work the same way if a $$\star$$ is attached to every argument and we replace $$\^$$ with $$\vee$$:

$$\star (\b{a} \^ \b{b}) = (\star \b{a}) \vee (\star \b{b})$$

$$\vee \bb{R}^2$$ is, for instance, spanned by $$(\star 1, \star \b{x}, \star \b{y}, \star (\b{x} \^ \b{y})) = (\b{x \^ y}, \b{y}, - \b{x}, 1)$$

Sometimes $$(\^, \v, V)$$ is called a 'double algebra': a vector space with a choice of pseudoscalar and two dual exterior algebras. It's also called the [Grassman-Cayley Algebra](https://en.wikipedia.org/wiki/Grassmann%E2%80%93Cayley_algebra). I like to write it as $$\^{ \v }V$$.

The meet is kinda weird. It is sorta like computing the union of two linear subspaces: 

$$(\b{x \^ y}) \vee (\b{y \^ z}) = (\star\b{z}) \vee (\star\b{x}) = \star (\b{z \^ x}) = \b{y}$$

But it only works if the degrees of the two arguments add up to $$\geq n$$:

$$\b{x} \vee \b{y} = \star(\b{y \^ z} \^ \b{z \^ x}) = 0$$

A general definition is kinda awkward, but we can do it using the $$\star_k$$ operation from the previous section. It looks like this:

$$\alpha \vee \beta = (\star_{\| \beta \|} \alpha) \cdot \beta$$

The $$\alpha$$ will be inner-product'd with the $$\star$$'d terms of $$\beta$$. Recall that $$\star_k \beta$$ becomes a sum of tensor products $$\beta_1 \o \beta_2$$. We end up dotting $$\alpha$$ with the first term:

$$\alpha \vee \beta = [\sum_{\alpha_1 \^ \alpha_2 = \alpha} (\star \alpha_1) \o \alpha_2] \cdot \beta = \sum_{\alpha_1 \^ \alpha_2 = \alpha}  (\star \alpha_1 \cdot \beta) \alpha_2$$

(This is a sum over 'coproduct slices' of $$\alpha$$, in one sense. This kind of sum is called 'Sweedler Notation' in the literature.) This is non-zero only if $$\beta$$ contains all of the basis vectors _not_ in $$\alpha$$. It makes more sense on an example:

$$\begin{aligned}
(\b{x \^ y}) \vee (\b{y} \^ \b{z}) &= \star_1  (\b{x \^ y}) \cdot (\b{y} \^ \b{z})  \\
&= (\b{y \^ z}) \o \b{y} - (\b{z \^ x}) \o \b{y}) \cdot (\b{y \^ z}) \\
&= \b{y}
\end{aligned}$$

In index notation:

$$(\alpha \vee \beta)_K = \alpha_{IJ} \e^{IK} \beta_{}$$

Or we can directly translate $$(\star \alpha) \vee (\star \beta) = \star(\alpha \^ \beta)$$:

$$(\star \alpha \vee \star \beta)^K = (\e_{IJ} \alpha^I) (\e_{JK} \beta^J) \e^{JKL}$$

Note: I got exhausted trying to verify the signs on this, so they might be wrong. At some point I'll come back and fix them.

Note 2: remember that $$\star^{-1} = (-1)^{k(n-k)} \star \neq \star$$ in some dimensions, so you need to be careful about applying the duality to compute $$\vee$$: $$\alpha \vee \beta = \star(\star^{-1} \alpha \^ \star^{-1} \beta)$$. Also note that, since $$\vee$$ is defined in terms of $$\star$$, it is explicitly dependent on the choice of $$\omega$$.

As mentioned above, the symbols for join and meet are definitely _swapped_ in a way that's going to be really hard to fix now. It should be meet = $$\^$$, join = $$\vee$$, so it matches usages everywhere else, as well as usages of $$\cup$$ and $$\cap$$ from set / boolean algebras. 

Since $$\vee V$$ is part of another complete exterior algebra, it also has all of the other operations, including a 'dual interior product' $$\alpha \cdot_{\vee} \beta$$. I have never actually seen it used, but it exists.

-----------

## 9. Relative $$\vee_\mu$$, $$\^_\mu$$, and $$\star_\mu$$, 

We saw that $$\star$$ and by extension are $$\vee$$ defined relative to a choice of pseudoscalar $$\omega$$. What if we choose differently? It turns out that this is actually occasionally useful -- I saw it used in _Oriented Projective Geometry_ by Jorge Stolfi, which develops basically all of exterior algebra under an entirely different set of names. We write $$\star_{\mu}$$ and $$\vee_{\mu}$$ for the star / meet operations relative to a 'universe' multivector $$\mu$$:

$$\star_{\mu} \alpha = \alpha \cdot \mu$$

$$(\star_\mu \alpha) \vee_{\mu} (\star_\mu \beta) = \star_{\mu} (\alpha \^ \beta)$$

The regular definitions set $$\mu = \omega$$. The resulting exterior algebra shows us that any subset of the basis vectors of a space form an exterior algebra themselves. In case this seeems like pointless abstraction, I'll note that it does come up, particularly when dealing with projective geometry. If $$\b{w}$$ is a projective coordinate, we can write the projective $$\star_{\b{wxyz}}$$ in terms of $$\star_{\b{xyz}}$$:

$$\star_{\b{wxyz}}( w \b{w} + x \b{x} + y \b{y} + z \b{z}) = \b{w} \^ \star_{\b{xyz}}(x\b{x} + y\b{y} +z \b{z}) + w (\b{x \^ y \^ z})$$

There is also a way to define $$\^$$ relative to a 'basis' multivector, $$\^_{\nu}$$. The behavior is to join two multivectors ignoring their component along $$\nu$$:

$$(\nu \^ \alpha) \^_{\nu} (\nu \^ \beta) = \nu \^ (\alpha \^ \beta)$$

For unit $$\nu$$, this can be implemented as:

$$\alpha \^_{\nu} \beta = \nu \^ (\nu \cdot \alpha) \^ (\nu \cdot \beta))$$

It's neat that for choices of $$\nu, \mu$$, we can produce another exterior double algebra embedded within $$(\^, \v, V)$$:

$$(\^_{\nu}, \v_{\mu}, \nu, \mu, V)$$

Our regular choice of exterior algebra on the whole space is then given by:

$$(\^, \v, V) = (\^_1, \v_\omega, 1, \omega, V)$$


------

## 10. The Geometric Product $$\alpha\beta$$

There is much to say about [Geometric algebra](https://en.wikipedia.org/wiki/Geometric_algebra) and the 'geometric product'. (Other names: "Clifford Algebra", "Clifford Product".)

GA is how I got into this stuff in the first place, but I avoid using the name for the most part because there is some social and mathematical baggage that comes with it. But its proponents deserve credit for popularizing the ideas of multivectors in the first place -- I'm pretty sure we all agree that multivectors, as a concept, should be used and taught everywhere.

The social baggage is: the field, while perfectly credible in theory, tends to attract an unusual rate of cranks (many of them ex-physics students who want to 'figure it all out' -- like myself! I might be a crank. I'm not sure.). The mathematical baggage is the proliferation of notations that are hard to use and not very useful.

The geometric product is a generalization of complex- and quaternion-multiplication to multivectors of any grade. The inputs and outputs are linear combinations of multivectors of any grade. It's generally defined as another quotient of the tensor algebra: instead of just $$x \o x \sim 0$$, as defined the exterior algebra, we use $$x \o y \sim - y \o x \sim 0$$ (so we can still exchange positions of elements in a tensor) but $$x \o x \sim 1$$. This means duplicate tensor terms are just replaced with $$1$$ in tensor products, rather than annihilating the whole thing, like this:

$$x \o x \o y \o x \o y \sim (x \o x) \o y \o (-y) \o x \sim -x$$

The geometric product is the action of $$\o$$ under this equivalence relation. In geometric algebra texts it is written with juxtaposition, since it generalizes scalar / complex multiplication that are written that way. I'll do that for this section.

$$(\b{xy})(\b{xyz}) = (\b{xy}) (-\b{yxz}) = (\b{x})(\b{xz}) = -\b{z}$$

It's associative, but not commutative or anticommutative in general.

The primary reason to use this operation is that its implementations on $$\bb{R}^2$$, $$\bb{R}^3$$, and $$\bb{R}^{3,1}$$ are already used:

* The geometric product on even-graded elements of $$\bb{R}^2$$ implements complex multiplication.
* The geometric product on even-graded elements of $$\bb{R}^3$$ implements quaternion multiplication.
* The geometric product on four elements $$(\b{t, x, y, z})$$ with the $$x^2 = y^2 = z^2 = -1$$ is implemented by the [gamma matrices](https://en.wikipedia.org/wiki/Gamma_matrices) $$\gamma^{\mu}$$  which are used in quantum mechanics.
	* (I won't discuss the alternate metric in this article, but it's done by using $$x \o x \sim Q(x,x)$$ in the quotient construction of the algebra, where $$Q$$ is the symmetric bilinear form that's providing a metric.)

Geometric algebra tends to treat the geometric product as fundamental, and then produce the operations from it. For vectors:

$$\< \b{a}, \b{b} \> = \frac{1}{2}(\b{ab + ba})$$

$$\b{a} \^ \b{b} = \frac{1}{2}(\b{ab - ba})$$

We could also define things the other way:

$$\b{ab} = \frac{1}{2}(\b{a \cdot b} + \b{a \^ b})$$

Multivector basis elements are just written by juxtaposing the relevant basis vectors, since $$\b{xy} = \b{x \^ y}$$. I like this notation and should start using it even if I avoid the geometric product; it would save a lot of $$\^$$s.

To define the geometric product in terms of the other operations on this page, we need to define the **reversion** operator, which inverts the order of the components in a geometric product:

$$(abcde)^{\dag} = edcba = (-1)^{k(k-1)/2} (abcde)$$

This generalizes complex conjugation, since it takes $$\b{xy} \ra -\b{xy}$$ in $$\bb{R}^2$$ and $$\bb{R}^3$$. It allows us to compute geometric products, which contracts elements from innermost to outermost, using the operations already defined on this page, which I have defined as contracting left-to-right in every case. The general algorithm for producing geometric products out of previously-mentioned operations then is to try projecting the onto _every_ basis multivector:

$$\alpha \beta = \sum_{\gamma \in \^^ V} (\gamma \cdot \alpha^\dag) \^ (\gamma \cdot \beta)$$

This translates into index notation as:

$$\alpha \beta = \sum_{\gamma \in \^^ V} (-1)^{k(k-1)/2} \gamma_I  \gamma_K \alpha^{I}_{[J}\beta^{K}_{L]}$$

I think we can agree that's pretty awkward. My overall opinion on the geometric product is this:

* I _tentatively_ think that it is mis-defined to use inner-to-outer contraction, because of the awkward signs and conjugation operations that result.
	* I suspect the appeal of defining contraction this way was to make $$\b{xy}^2 = -1$$, in order to produce something analogous to $$i^2 = -1$$. But imo it's really much more elegant if all basis elements have $$\alpha^2 = 1$$.
	* If we want to preserve the existing of a multiplication operation with $$\alpha^2 = -1$$, we can _define_ the geometric product as $$\alpha \beta = \alpha^{\dag} \cdot \beta$$ or something like that. Maybe.
* However, it works suspiciously well for complex numbers, quaternions, and gamma matrices.
* And it works suspiciously well for producing something that acts like a multiplicative inverse (see below).
* But I know of almost zero cases where mixed-grade multivectors are useful, except for sums of "scalars plus one grade of multivector".
* I can't find any general geometric intuition for the product in general.
* So I think my internal jury is still out, and I try to reverse judgment on the subject overall.

I often find myself wondering if the interior product and dual vectors in general could be considered as "negative-grade" multivectors, which also operate with $$\^$$ but subtract grades instead of adding them. I suspect they can, and I think the geometric product strikes close to, but not exactly, on this more general calculus for multivectors, and that's why it occasionally works well. But I'm not sure! Please let me know if you have this figured out.

-----------

**Other operations of geometric algebra**

Unfortunately geometric algebra is afflicted by way too many definitions of unintuitive operations. Most of what I've listed above have definitions in terms of the geometric product. Plus there are a bunch of extras. Here's most of them:

1. **Grade projection**: $$\< \alpha \>_k = \sum_{\gamma \in \^^k V} (\gamma \cdot \alpha) \o \gamma$$ extracts the $$k$$-graded terms of $$\alpha$$.
2. **Reversion**: $$(abcde)^{\dag} = edcba = (-1)^{r(r-1)/2} (abcde)$$. Generalizes complex conjugation.
3. **Exterior product**: same operation as above, but now defined $$A \^ B = \sum_{r,s} \< \< A \>_r \< B \>_s \>_{r + s}$$
4. **Commutator product**: $$A \times B = \frac{1}{2}(AB - BA)$$. I don't know what the point of this is.
5. **Meet**: same as above, but now defined $$A \vee B = I(AI^{-1}) \^ (BI^{-1})$$. GA writes the pseudoscalar as $$I$$ and $$AI^{-1} = \star^{-1} A$$.
6. **Interior product**: for some reason there are a bunch of ways of doing this.
	* **Left contraction**: $$A ⌋ B =  \sum_{r,s} \< \< A \>_r \< B \>_s \>_{r - s}$$
	* **Right contraction**: $$A ⌊ B =  \sum_{r,s} \< \< A \>_r \< B \>_s \>_{s - r}$$
	* **Scalar product**: $$A * B =  \sum_{r,s} \< \< A \>_r \< B \>_s \>_{0}$$
	* **Dot product**: $$A \cdot B = \sum_{r,s} \< \< A \>_r \< B \>_s \>_{\| s - r \|}$$
7. There are a few other weird 'conjugation' operations (see [here](https://en.wikipedia.org/wiki/Paravector)) but I think they're thankfully fading out of usage.

--------

## 12. Multivector division $$\alpha^{-1}$$

Ideally division of multivectors would produce a multivector $$\alpha^{-1}$$ that inverts $$\^$$:

$$\frac{\alpha \^ \beta}{\alpha} = \beta$$

There are several problems with this, though. One is that $$\alpha \^ \beta$$ may be $$0$$. Another is that $$\^$$ isn't commutative, so presumably $$\alpha^{-1} (\alpha \^ \beta) $$ and $$(\alpha \^ \beta) \alpha^{-1}$$ are different. Another is that $$\beta + K \alpha$$ is also a solution for any $$K$$:

$$\alpha \^ (\beta + K \alpha) = \alpha \^ \beta$$

Or for any multivector $$\gamma$$ with $$\gamma \^ \alpha = 0$$:

$$\alpha \^ (\beta + \gamma) = \alpha \^ \beta$$

So there are at least a few ways to define this.

**Multivector division 1**: Use the interior product and divide out the magnitude:

$$\alpha^{-1} \beta = \frac{\alpha}{\| \alpha \|^2} \cdot \beta$$

This gives up on trying to find _all_ inverses, and just identifies one of them. It sorta inverts the wedge product, except it extracts only the orthogonal component in the result:

$$\b{a}^{-1} (\b{a} \^ \b{b}) = \frac{\b{a}}{\| \b{a} \|^2} \cdot (\b{a} \^ \b{b}) = \b{b} - \frac{\b{a} (\b{a} \cdot \b{b})}{\| \b{a} \|^2} = \b{b} - \b{b}_{\parallel \b{a}} = \b{b}_{\perp \b{a}}$$

The result is the 'rejection' of $$\b{b}$$ off of $$\b{a}$$. It doesn't quite 'invert' $$\^$$, but it's a pretty sensible result. It is commutative due to our definition of the two sided interior product (both terms on contract left-to-right either way). If $$\b{a \^ b} = 0$$ in the first place, then this rightfully says that $$\b{b}_{\perp \b{a}} = 0$$ as well, which is nice.

**Multivector division 2**: Allow the result to be some sort of general object, not a single-value:

$$\alpha^{-1} \beta = \frac{\alpha}{\| \alpha \|^2} \cdot \beta + K$$

where $$K$$ is "the space of all multivectors $$\gamma$$ with $$\alpha \^ \gamma = 0$$". This operation produces the true preimage of multiplication via $$\^$$, at the loss of an easy way to represent the result. But I suspect this definition is good and meaningful and is sometimes necessary to get the 'correct' answer.

**Multivector division 3**: Use the geometric product.

The geometric product produces something that actually _is_ division on GA's versions of complex numbers and quaternions (even-graded elements of $$\^ \bb{R}^2$$ and $$\^ \bb{R}^3$$):

$$a^{-1} b = \frac{ab}{aa} = \frac{ab}{\| a \|^2}$$

This is only defined for $$\| a \| \neq 0$$ (remember, since GA has elements with $$\alpha^2 = -1$$, you can have $$\| 1 + i \|^2 = 1^2 + i^2 = 0$$). You can read a lot about this inverse online, such as how to use it to reflect and rotate vectors.

--------

Cut for lack of time or knowledge:

* Exterior derivative and codifferential 
* [Cup and cap product](https://en.wikipedia.org/wiki/Cap_product) from algebraic topology. As far as I can tell these essentially implement $$\^$$ and $$\vee$$ on co-chains, which are more-or-less isomorphic to multivectors.

{% include ea.html %}
