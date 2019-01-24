---
layout: blog
title: "EA Notes #3: The Interior Product"
footnotes: true
math: true
aside: true
---

*Previously: [matrices]({{ site.baseurl }}{% post_url 2018-10-08-exterior-1 %}) and [inner products]({{ site.baseurl }}{% post_url 2018-10-09-exterior-2 %}) on exterior algebras.*

*Vector spaces are assumed to be finite-dimensional and over $$\bb{R}$$. The grade of a multivector $$\alpha$$ will be written $$\| \alpha \|$$, while its magnitude will be written $$\Vert \alpha \Vert$$. Bold letters like $$\b{u}$$ will refer to (grade-1) vectors, while Greek letters like $$\alpha$$ refer to arbitrary multivectors with grade $$\| \alpha \|$$.*

------

Previously we looked at how the inner product on an exterior power of a vector space $$\^^k V$$ gave rise to some common identities. The inner product was computed by insisting that the basis multivectors $$\b{x}_1 \^ \b{x}_2 \^ \ldots \b{x}_k \in \^^k V$$ be orthonormal, giving:

$$\< \b{u} , \b{v} \> \equiv \sum_{\^ I \in \^^k V} u^{\^I} v_{\^ I}$$

In practice this is easily computed by taking two lists of wedge products and antisymmetrizing one of them (I usually choose the right), then contracting term-by-term:

$$\begin{aligned}
\< \b{a \^ b }, \b{c \^ d} \>_\^ &= \< \b{a \o b}, \b{c \o d} - \b{d \o c} \>_{\o} \\
&= \< \b{a , c} \>_V \< \b{b, d } \>_V - \< \b{a , d} \>_V \< \b{b, c } \>_V
\end{aligned}$$


In this article we cover the two other common operations of exterior algebra: a far-reaching generalization of the inner product called the **interior product** and the **Hodge Star** (which I prefer to call the **complement**).

<!--more-->

----------

## 1. The Interior Product

The [Interior Product](https://en.wikipedia.org/wiki/Interior_product), also called the _contraction_ or _insertion_ operator, is most efficiently defined as the _adjoint_ of the wedge product with respect to the inner product, meaning that an interior product on one side of an inner product is the same as a wedge on the other. I will write with a dot product $$\cdot$$ symbol.

$$\begin{aligned}
\< \b{x} \^ \alpha, \beta \> &= \< \alpha, \b{x} \cdot \beta \> \\
\< \gamma \^ \alpha, \beta \> &= \< \alpha, \gamma \cdot \beta \> 
\tag{1}
\end{aligned}$$

This fully defines the product, and, in particular, shows that the interior product of two $$k$$-vectors with each other is just their inner product (recalling that the wedge product with a scalar is defined to just be scalar multiplication):

$$\<\un{\^^k}{\alpha}, \un{\^^k}{\beta}\> = \< \alpha \^ 1, \beta \> = \< 1, \alpha \cdot \beta \> = \alpha \cdot \beta \in \bb{R}$$

Inspection of the adjoint relationship above reveals that the interior product _subtracts_ grades, and specifically it subtracts the _left_ argument from the _right_ argument[^contraction], so $$\alpha \cdot \beta \in \^^{\|\beta\|-\|\alpha\|}$$ (in symmetry with how the wedge product adds grades). The rough intuition for the two operations, side by side, is:

[^contraction]:Why left from right? It's basically arbitrary, and it would be reasonable to define another operation which does right-from-left (sometimes these are called left-contraction and right-contraction, respectively). And in fact, we could define a version which works both ways: $$\cancel{\b{x}} \cdot (\cancel{\b{x}} \^ \b{y}) = \b{y} = (\cancel{\b{x}} \^ \b{y}) \cdot \cancel{\b{x}} $$, canceling out as many common terms are as available. This gets a bit weird, though, because because it is useful for there to be a symmetry with the way that the wedge product gives $$\alpha \^ \beta = 0$$ if $$\| \alpha \| + \| \beta \| > n$$. When we define $$\cdot$$ as left-from-right only we have $$\alpha \cdot \beta = 0$$ if $$\| \beta \| - \| \alpha \| < 0$$, and some of the useful identities require this.

1. The exterior (wedge) product $$\alpha \^ \beta$$ creates the subspace spanned by its two arguments, or $$0$$ if have any overlap.
2. The interior product $$\alpha \cdot \beta$$ removes the subspace $$\alpha$$ from $$\beta$$, or gives $$0$$ if $$\alpha$$ is entirely overlapped by $$\beta$$.

Later we will discuss how these operations are related to operations on sets, which makes this all seem more coherent. In the meantime here are some examples:

$$\begin{aligned}
\b{x} \cdot (\b{x \^ y}) &= \b{y} \\
\b{x} \cdot (\b{y \^ z}) &= 0 \\
(\b{x \^ y}) \cdot (\b{x \^ y}) &= 1 \\
(\b{x \^ y}) \cdot (\b{y \^ x}) &= -1 \\
(\b{x \^ y}) \cdot (\b{y \^ z}) &= 0 \\
(\b{x \^ y}) \cdot (\b{x \^ y \^ z}) &= \b{z}  
\end{aligned}$$


In general, you can compute interior products via a similar to method as that for inner products:

1. Write the right side (which has the higher grade) as an antisymmetric tensor product using $$\text{Alt}$$.
2. Contract term-by-term until you run out of terms.

For example:

$$\begin{aligned}
\b{a } \cdot (\b{b \^ c}) &= \b{a} \cdot \text{Alt}(\b{b \o c}) \\
&= \b{a} \cdot (\b{b \o c} - \b{c \o b}) \\
&= (\b{a \cdot b}) \b{c} - (\b{a \cdot c}) \b{b}
\end{aligned}$$

Applying this to a general product of multivectors shows that the interior product distributes over the wedge product like this:

$$\b{x} \cdot (\alpha \^ \beta) = (\b{x} \cdot \alpha) \^ \beta + (-1)^{|\alpha|} \alpha \^ (\b{x} \cdot \beta)$$

This property makes it a _graded antiderivation_, in the language of abstract algebras, which is probably important to someone other than me. (So called because the above is a generalization of the product rule for derivatives.)


-----------

### Properties of the Interior Product

The interior product is so named for symmetry with the 'exterior' product, which would be the right name for the wedge product except that it has too many syllables.[^interiorsource]

I've defined it in terms of the inner product, but it would have totally been possible to define the interior product first and then just define the inner product as the case where both arguments have the same grade. This way just seemed easier to me.

On Wikipedia the product is written as $$\iota_{\b{x}}$$ (that's an 'iota'), but I prefer to just use a dot product (which is also how I usually write the inner product) because things are a lot more compact that way. Also, a lot of sources insist that the interior product have as its left argument an element of $$\^(V^*)$$, the "exterior algebra over the dual space of $$V$$", writing $$\b{x}^* \cdot \b{x} = 1$$ or $$\iota_{\b{x}^*}\b{x} = 1$$. As long as we're in a Euclidean space with $$\b{x}_i \cdot \b{x}_j = 1_{i=j}$$, this distinction is unnecessary and distracting, so I'm not doing that.

Because the interior product is translatable via adjointness into a wedge product, it is independent of choice of coordinate system (for free!), and it obeys very similar properties. Let $$\iota_{\alpha}(\beta) \equiv \alpha \cdot \beta$$ and $$L_{\alpha}(\beta) \equiv \alpha \^ \beta$$ (this is the only time that the $$\iota$$ notation is useful). Then:

[^interiorsource]: A helpful source for this section: "Linear Algebra via Exterior Products" by Sergei Winitzki.

$$\begin{aligned}
L_{\alpha} &: \^^k V \ra \^^{k + |\alpha|} V \\
L_{c} \alpha &= c \alpha \\
L_{\b{u}} \circ L_{\b{v}} &= - L_{\b{v}} \circ L_{\b{u}} \\
L_{\b{u}} \circ L_{\b{u}} &= 0 \\
L_{\alpha \^ \beta} = L_{\alpha} \circ L_{\beta} &= (-1)^{|\alpha| |\beta|} L_{\beta} \circ L_{\alpha} \\
&\\
\iota_{\alpha} &: \^^k V \ra \^^{k - |\alpha|} V \\
\iota_{c} \alpha &= c \alpha \\
\iota_{\b{u}} \circ \iota_{\b{v}} &= -  \iota_{\b{v}} \circ \iota_{\b{u}} \\
\iota_{\b{u}} \circ \iota_{\b{u}} &= 0 \\
\iota_{\beta \^ \alpha} = \iota_{\alpha} \circ \iota_{\beta} &= (-1)^{|\alpha| |\beta|}  \iota_{\beta} \circ \iota_{\alpha} \\
\end{aligned}$$

Clearly the two operations have very similar structure. The one difference is in how they decompose into component operations -- the interior product reverses the order of its factors (which you can check via the adjoint relationship):

$$\begin{aligned}
(\alpha \^ \beta) \^ \gamma &= L_{\alpha \^ \beta} (\gamma) \\
&= L_{\alpha} L_{\beta} (\gamma) \\
&= \alpha \^ (\beta \^ \gamma) \\
(\alpha \^ \beta) \cdot \gamma &= \iota_{\alpha \^ \beta} (\gamma) \\
&\stackrel{!!}{=} \iota_{\beta} \iota_{\alpha} (\gamma) \\
&= \beta \cdot (\alpha \cdot \gamma)
\end{aligned}$$

It is tempting to try to combine the two operations into one. We would need to define a "negative" vector $$\b{x}^*$$ which behaves via the wedge product as an element of grade $$-1$$, such that $$\b{x}^* \^ \alpha \equiv \b{x} \cdot \alpha$$. But this would immediately break the associativity of $$\^$$: $$\b{x} \cdot (\b{x} \^ \b{x}) = 0 \neq (\b{x} \cdot \b{x}) \^ \b{x} = \b{x}$$, and I'm not sure how to go about repairing that.

------

### Example: Projections and Rejections

We have seen that $$\b{a} \cdot (\b{u \^ v})$$ somehow 'removes' the $$\b{a}$$ part of $$\b{u \^ v}$$. How is that useful?

One example is to implement a sort of _division_ operation. In an ideal world where there's division everywhere, something like $$\frac{\b{a \^ b}}{\b{a}}$$ would make sense. We can't quite get this, partly because our concept of multiplication isn't commutative, but we can do something similar. I claim that $$\frac{\b{a}}{\Vert \b{a} \Vert^2}$$ acts sort-of like vector division, in the following sense (for $$\b{a} \neq 0$$):

$$\begin{aligned}
\frac{\b{a}}{\Vert \b{a} \Vert^2} \cdot (\b{a \^ b}) &= \frac{1}{\Vert \b{a} \Vert^2} ((\b{a \cdot a}) \b{b} - (\b{a \cdot b}) \b{a}) \\
&= \b{b} - \frac{\b{a \cdot b}}{\b{a \cdot a}} \b{a} \\
&= \b{b} - \b{b}_{\parallel \b{a}} \\
&= \b{b}_{\perp \b{a}}
\end{aligned}$$

Here $$\b{b}_{\parallel \b{a}}$$ refers to the _projection_ of $$\b{b}$$ onto $$\b{a}$$, and $$\b{b}_{\perp \b{a}}$$ to the remainder, which is sometimes called the _rejection_. This is also easily seen from writing $$\b{b}$$ this way in the initial product:

$$\begin{aligned}

\b{a}  \cdot (\b{a \^ b}) &= \b{a} \cdot (\b{a} \^ (\b{b}_{\perp \b{a}} + \b{b}_{\parallel \b{a}} )) \\
&= \b{a} \cdot (\b{a} \^ \b{b}_{\perp \b{a}} ) \\
&= \Vert \b{a} \Vert^2 \b{b}_{\perp \b{a}}
\end{aligned}$$

You can see how this is 'sort of' a division operation: in $$\frac{\b{c}}{\b{a}}$$, factor $$\b{c}$$ into parallel- and perpendicular- components, and the division removes the perpendicular part, in essence 'dividing out the factor of $$\b{a}$$'.

This projections continue to work for higher-dimensional objects. In the same way that we can factor, say, a vector $$\b{a}$$ into $$a_x$$ and $$a_y$$ components, we can factor a trivector $$\b{a \^ b \^ c}$$ into its projection onto a line or plane. The same intuition suggests that we interpret the volume of an object as its 'projection onto a point'.

---------

## 2. The Complement (Hodge Star)

Let $$\omega \in \^^n V$$ be a unit pseudoscalar in $$\^ V$$.[^integral] For examples we'll use $$\omega = \b{x \^ y \^ z} \in \^^3 \bb{R}^3$$. The selection of $$\omega$$ (particularly, the order of its factors) determines a global orientation on $$V$$. Once we have an $$\omega$$, we define the **Complement** or [Hodge Star](https://en.wikipedia.org/wiki/Hodge_star_operator) or _Hodge Dual_ operation as the interior product with $$\omega$$:

[^integral]: In some texts, particularly those of Gian-Carlo Rota, this is called the _Integral_. I think that's a terrible name. He also calls multivectors 'extensors'. See for instance his "On the Exterior Calculus of Invariant Theory", which is very useful except for all the notations being bad.

$$\star \alpha \equiv \alpha \cdot \omega\tag{2}$$

I personally prefer the name 'complement', for reasons that will become clear, but the name "Hodge Star" is much more common. And I would prefer the overbar notation $$\bar{\alpha}$$, but I have to concede that it's often very useful to write it as a prefix operator when it has complicated arguments. So I guess we're sticking with using the star notation at least. Some people also write $$\ast$$ or $$\vert$$ or even $$\text{\textasciitilde}$$ instead of $$\star$$.

The complement operation takes a wedge product of basis vectors to the wedge product of all the _other_ basis vectors, with an appropriate sign such that $$\alpha \^ \star \alpha = \omega$$, and extended linearly to all multivectors.

Examples in $$\bb{R}^3$$:

$$\begin{aligned}
\star 1 &= \b{x \^ y \^ z} \\
\star \b{x} &= \b{y \^ z} \\
\star \b{y} &= \b{z \^ x} \\
\star \b{z} &= \b{x \^ y} \\
\star (\b{x \^ y}) &= \b{z} \\
\star (\b{y \^ x}) &= -\b{z} \\
\star^2 &= I
\end{aligned}$$

Examples in $$\bb{R}^2$$:

$$\begin{aligned}
\star \b{x} &= \b{y} \\
\star \b{y} &= -\b{x} \\
\star^2 &= -I
\end{aligned}$$

$$\star^2$$ can be computed by considering how many terms each element of $$\star^2 \alpha$$ must move past to be rearranged into the starting order. The general form turns out to be:

$$\star^2 \alpha = (-1)^{|\alpha|(n-|\alpha|)} \alpha$$

And so also:

$$\star^{-1} \alpha = (-1)^{|\alpha|(n-|\alpha|)} (\star \alpha)$$

Clearly $$\star^2 = I$$ is always true for $$n$$ odd, and for $$n$$ even is true if $$k$$ is also even. Mostly I like to try to define things without minus signs everywhere, but this one is, unfortunately, unavoidable.

Because $$\star$$ is the complement _with respect to $$\omega$$_, it is specifically _not_ basis-independent, but if a linear transformation $$A$$ doesn't change $$\omega$$ (ie $$\det (A) = 1$$, ie it is orthogonal) then $$\star$$ is also unchanged. We think of a choice of $$\omega$$ not as a basis-dependent object but as a _geometric_ object, akin to saying "this is the scale I am using to measure volume", which then transforms according to whatever basis we are working in. It would probably be more correct to say that $$\omega$$ has a scalar coefficient $$c$$ in front of it which gets carried around, and that $$\star^2 = c^2 (-1)^{k(n-k)}$$, but let's not for now, and assume that the the pseudoscalar is standard in whatever basis we're working with. (Anyway, if we allow non-orthogonal basis changes our inner products would be changing also and everything would be a mess.)

------

### A few identities

The inner product and complement operations can be defined in terms of each other, because of the following relationship for $$\alpha, \beta$$ of the same grade:

$$\un{k}{\alpha} \^ (\star \un{k}{\beta}) = \< \alpha, \beta \> \omega$$

Written differently:

$$\un{k}{\alpha} \cdot \un{k}{\beta} = \star (\alpha \^ (\star \beta))$$

This makes sense: if $$\< \alpha, \beta\> \neq 0$$, then they are 'parallel' multivectors, and thus $$\star \beta$$ and $$\alpha$$ have no overlap. That the signs and scalar factors work out is indicative of the usefulness of the $$\star$$ operation.

From this we can derive that the inner product of complements:

$$\begin{aligned} \star \un{k}{\alpha} \cdot \star \un{k}{\beta}  &= \star ((\star \alpha) \^ \star^2 \beta) \\
&= (-1)^{k(n-k)}  \star ((\star \alpha) \^ \beta) \\
&= \star(\beta \^ (\star \alpha)) \\
&= \star((\beta \cdot \alpha) \omega) \\
&= \alpha \cdot \beta
\end{aligned}$$

Which gives this handy identity:

$$\< \star \alpha, \star \beta \> = \< \alpha, \beta \> \tag{3}$$

Also, it will be useful to have identities for the complements of arbitrary wedge and dot products. It turns out that, in general:

$$\begin{aligned} 
\star (\alpha \cdot \beta) &= (\star \beta) \^ \alpha \\
&= (-1)^{|\alpha||\star \beta|} \alpha \^ (\star \beta) \\
= \star(\beta \cdot \alpha) &= (\star \alpha) \^ \beta \\
&= (-1)^{|\star \alpha|| \beta|} \beta \^ (\star \alpha) \tag{4} 
\end{aligned}$$

This is mostly easily computed by considering the action when vector has already been shuffled into the correct order, decomposing the space into $$\omega = \b{x}_{ab} \^ \b{x}_{\bar{a}b} \^ \b{x}_{\bar{a}\bar{b}}$$. (If there is a $$\b{x}_{a \bar{b}}$$ term, the whole thing is $$0$$ anyway.)

And the same for wedges (these ones are much more easily derived using $$\iota_{\alpha \^ \beta} = \iota_{\beta} \circ \iota_{\alpha}$$ from earlier):

$$\begin{aligned} 
\star(\alpha \^ \beta) &= \beta \cdot (\star \alpha) \\
&= (-1)^{|\alpha| |\beta| } {\star(\beta \^ \alpha)} \\
&= (-1)^{|\alpha| |\beta| } \alpha \cdot (\star \beta) \\ \tag{5}
\end{aligned}$$

(these expressions are valid unless one side is $$0$$)

There are many more identities that can be made by combining $$\^$$, $$\cdot$$, and $$\star$$, but they get really confusing really fast. The next article will go over them all. Promise. For now, let's prove some new stuff, because that's fun.

-------

## 3. The Cross Product

In $$\bb{R}^3$$, the familiar vector cross product can be defined as:

$$\b{a \times b} = \star(\b{a \^ b})$$

As we saw last time:

$$\begin{aligned}
\< \b{a \times b}, \b{c \times d} \> &= \< \star (\b{a \^ b}), \star (\b{c \^ d}) \> \\
&= \< \b{a \^ b}, \b{c \^ d} \> \\
&= (\b{a} \cdot \b{c}) (\b{b \cdot d}) - (\b{a \cdot d}) (\b{b \cdot c})
\end{aligned}$$

But now that we have better tools, we can do the more complicated ones: 

Here's the [scalar triple product](https://en.wikipedia.org/wiki/Triple_product#Scalar_triple_product), using identity (5):

$$\begin{aligned}
\b{a \cdot (b \times c)} &=  \b{a} \cdot \star (\b{b \^ c}) \\
&= \star(\b{b \^ c \^ a}) \\
&= \star(\b{a \^ b \^ c})
\end{aligned}$$

The [vector triple product](https://en.wikipedia.org/wiki/Triple_product#Vector_triple_product), using (5):

$$\begin{aligned}
\b{a \times (b \times c)} &= \star(\b{a} \^ \star(\b{b \^ c})) \\
&= (-1)^{| \b{a}| |\star(\b{b \^ c})|}  \b{a} \cdot \star^2 (\b{b \^ c}) \\
&= - \b{a} \cdot (\b{b \^ c}) \\
&= (\b{a} \cdot \b{c}) \b{b} - (\b{a} \cdot \b{b}) \b{c}
\end{aligned}$$

The [quadruple product](https://en.wikipedia.org/wiki/Quadruple_product), via the previous two:

$$\begin{aligned}
(\b{a \times b}) \times (\b{c \times d}) &= ((\b{a \times b}) \cdot \b{d}) \b{c} - ((\b{a \times b}) \cdot \b{c}) \b{d} \\
&= \star(\b{a \^ b \^ d}) \b{c} - \star(\b{a \^ b \^ c}) \b{d}
\end{aligned}$$

The [Jacobi Identity](https://en.wikipedia.org/wiki/Jacobi_identity):

$$\begin{aligned}
0 &= \b{a \times (b \times c)} + \b{b \times (c \times a)} + \b{c \times (a \times b)} \\

&= -\star( \b{a} \cdot (\b{b \^ c}) + \b{b} \cdot (\b{c \^ a}) + \b{c} \cdot (\b{a \^ b})) \\
&= -\star( (\b{a \cdot b} - \b{b \cdot a}) \b{c} + (\b{b \cdot c - c \cdot b}) \b{a} + (\b{c \cdot a - a \cdot c}) \b{b}) \\
&= 0
\end{aligned}$$

The Jacobi Identity can also be rearranged into the following intriguing form, which we will contend with in a future article:

$$\begin{aligned}
\b{a} \cdot (\b{b \^ c}) &= (\b{b \cdot a}) \b{c} - (\b{c \cdot a}) \b{b}
 \\
 &\stackrel{??}{=} \b{b} \cdot (\b{a \^ c}) - \b{c} \cdot (\b{a \^ b}) \\
\end{aligned}$$

---------

## 4. Application: Matrix Inversion

I mentioned that you can define the complement and the inner product in terms of each other, via:

$$\un{k}{\alpha} \cdot \un{k}{\beta} = \star(\alpha \^ \star \beta)$$

This works because the wedge product between grade-$$1$$ and grade-$$(n-1)$$ vectors looks like a dot product:

$$(a_x \b{x} + a_y \b{y} + a_z \b{z}) \^ (b_x \b{y \^ z} + b_y \b{z \^ x} + b_z \b{x \^ y}) = (a_x b_x + a_y b_y + a_z b_z) \omega$$

And in fact, there's a pretty good argument that this is the more natural definition, because it's the only good way to invert matrices.

Let $$A$$ be a invertible ($$\det(A) = \tr A^{\^n} \neq 0$$) square matrix on $$\bb{R}^n$$. For each column $$A_i$$, the wedge product of all the other columns $$A^{\^ n-1}_i =  A_1 \^ A_2 \^ \ldots A_{\check{i}} \ldots A_n$$ will have :

$$A^{\^ n-1}_i \^ A_j = \det(A) 1_{i = j}$$

$$A^{\^ n-1}_i$$ is an element of $$\^^{n-1} \bb{R}^n$$, but we can write wedge product can be written as a dot product:

$$(\star A^{\^ n-1}_i) \cdot A_j = A_i \cdot (\star A^{\^ n-1}_i) = \det(A) 1_{i=j}$$

Therefore (transposing so that the $$\cdot$$ becomes matrix multiplication):

$$(\star A^{\^ n-1})^T A = A (\star A^{\^ n-1})^T = \det(A) I$$

We recognize $$(\star A^{\^ n-1})^T$$ as the adjugate matrix of $$A$$. The inverse is, as usual:

$$A^{-1} = \frac{1}{\det(A)} (\star A^{\^ n-1})^T = \frac{\text{adj}(A)}{\det(A)} $$

This has been an economical derivation. It can be done without working with components with a few more definitions, but this article has been long enough.