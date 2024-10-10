---
layout: blog
title: "Notations for Vector Division"
tags: math
math: true
footnotes: true
aside: true
---

While there are four standard ways of multiplying vectors and each has its own notation ($$\cdot$$, $$\times$$, $$\^$$, $$\o$$), there is no generally-agreed-upon definition or notation for dividing vectors. That's mostly because it's not a thing. But there are times when I wish it was a thing. Or rather, there are too many times where a notion of division _would_ be useful to ignore. There's an operation which acts a lot _like_ division, and which comes up more often than you might notice if you weren't looking for it. And it does, in a sense, generalize scalar division. So why not?

This article describes what I would kinda like the notation $$\b{b} / \b{a}$$ should mean. I'm writing it out primarily because I keep wanting to refer to it in other articles; this way I have something to link to instead of defining it inline each time. I don't mean to claim that this "is" vector division. Rather it's a thing that is sufficiently common that it makes sense to generalize the notation of division for.

<!--more-->


My definition writes division $$\b{b}/\b{a}$$ as a shorthand for the [matrix pseudoinverse](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse), which allows dividing by a list of $$k$$ vectors at once, in a certain sense. Vector division is the $$k=1$$ case. The matrix inverse is the $$k=n$$ case. Scalar division is the $$k=n=1$$ case. The pseudoinverse is not really obscure, and writing it as an inverse is not that weird. Most of the text is about the update you have to make to your intuition about what division is, in order to use the pseudoinverse like an inverse in this way.

As always take this with a heaping pile of grains of salt, 'cause it's still just the semi-informed opinions of some guy on the internet.

---------

# 1. TLDR

For vectors, the inverse notation will creates the pseudoinverse with respect to the dot product, which is just the vector divided by its magnitude squared. The fraction notation implies a dot product between the numerator and denominator:

$$
\begin{aligned}
\frac{1}{\b{a}} &\equiv \b{a}^{-1} \equiv \frac{\b{a}}{\| \b{a} \|^2} \\
\frac{\b{b}}{\b{a}} &\equiv \b{b} \cdot \frac{1}{\b{a}} \equiv \frac{\b{b} \cdot \b{a}}{\| \b{a} \|^2}
\end{aligned}
$$

It's not a true inverse, but it's still a useful thing: $$(\b{b}/\b{a}) \b{a} = \b{b}_a = \proj_{\b{a}}(\b{b})$$ gives the vector projection of $$\b{b}$$ onto $$\b{a}$$. There are various other things that the division notation could mean, but I think this is the most useful one.

For matrices $$A = (\b{a}_1, \b{a}_2, \ldots)$$, where the vectors $$\{ \b{a}_i \}$$ are linearly independent, division means

$$\frac{\b{b}}{A} \equiv A^{+} (\b{b}) = \begin{pmatrix} b_1 \\ b_2 \\ \vdots \end{pmatrix}$$

$$A^{+}$$ is the Moore-Penrose pseudoinverse of $$A$$, which equals the actual matrix inverse when $$A$$ is invertible. This gives the components of the expansion of $$\b{b}_A$$, the projection of $$\b{b}$$ onto $$\text{col}(A)$$, in terms of the vectors of $$A$$:

$$A (\b{b}/A) = \b{b}_A = b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots$$

We don't bother to extend division for the case where the vectors of $$A$$ are not linearly independent, just like we disallow dividing by zero for scalars. It is possible to talk about the pseudoinverse of a non-linearly-independent matrix as well, and it's interesting, but... less interesting, for our purposes.

We think of the division operation as fundamentally meaning "expanding a vector into components in a basis." In $$\bb{R}^1$$ there's only one direction so the only component is the result of regular scalar division:

$$\frac{b \b{x}}{a \b{x}} = \frac{b}{a}$$

Which tells you how many copies of $$a \b{x}$$ you need to make $$b \b{x}$$:

$$\frac{b \b{x}}{a \b{x}} (a \b{x}) = b \b{x}$$

In $$\bb{R}^{>1}$$ dividing by a list of vectors $$A = \{ \b{a}_i \}$$ gives $$b_A= \b{b}/A = \{ b_{a_1}, b_{a_2}, \ldots \}^T$$, which tells you how to reconstruct as much of $$\b{b}$$ as possible in the basis $$A$$:

$$\b{b}_A = A b_A = A (\b{b}/A)= b_{a_1} \b{a}_1 + b_{a_2} \b{a}_2 + \ldots\, $$

This is particularly nice because a change of basis to another basis $$B = \{ \b{b}_j \}$$ is given by cancelling out a fraction:

$$
\begin{aligned}
\b{x}_A &= A x_A \\
\b{x}_B &= B x_B \\
&= A (\frac{B}{A} x_A) \\
x_B &= \frac{B}{A} x_A
\end{aligned}
$$

When the matrices are invertible then this is just generic linear algebra. When they're not, it produces various projection operations, so $$\b{x}_A = A x_A$$ and $$\b{x}_B = B x_B$$ are not necessarily the same vector.

All of this is discussed to death below. At the end we also compare this sense of division to the division in Clifford Algebras and tensor algebras. I hope I didn't mess anything up. My brain hurts.

---------

# 2. Exposition

Here is a longer expository version of the stuff in the TLDR. It is basically be a bunch of material from introductory linear algebra presented in an upside-down way.

### Vectors

We define the multiplicative inverse of a vector to be

$$\frac{1}{\b{a}} \equiv \b{a}^{-1} \equiv \frac{\b{a}}{\| \b{a} \|^2}$$

And we define that a fraction of two vectors means a dot product:

$$\frac{\b{b}}{\b{a}} = \b{b} \cdot \frac{1}{\b{a}} = \frac{\b{b} \cdot \b{a}}{\| \b{a} \|^2}$$

The notation makes some sense because

$$\b{a} \cdot \frac{1}{\b{a}} = 1$$

But it is certainly not a _true_ inverse, in the sense of $$f(f^{-1}) = I$$, the identity of a group / multiplicative unit in a ring. There are a few reasons:

One is that we're not talking about a single algebra with a single multiplication operation. Were there only one way to multiply vectors, we could ask if it has an inverse (probably not, in the group/ring sense). But instead we're just talking about vectors as a concept, with all of their operations. 

That said, roughly speaking this is trying to "undo" the tensor product, because $$\b{a} \cdot (\frac{1}{\b{a}} \o \b{b}) = \b{b}$$ holds. It's just that it doesn't actually multiply using the tensor product again---it's not like a group where $$a^{-1} a b = b$$ is three instances of the same group operation. Instead our notion of division uses a separate operation, the dot product / trace.

When we define $$\b{b}/\b{a} = \b{b} \cdot \frac{1}{\b{a}}$$, we are in a sense "prematurely" tracing over the tensor product in $$\frac{1}{\b{a}} \o \b{b}$$, which causes it to _not_ be an inverse. The result is that we get a scalar that's a "pseudoinverse" (potentially losing information) instead of a rank-2 tensor which inclues all of the information in $$\b{a}^{-1} \o \b{a}$$. But I think this is worth doing, and worthy of the notation. You can always write $$\b{b} \o \frac{1}{\b{a}}$$ if you want to use the more general object.

The other reason it's not an inverse is that inverses are supposed to be unique, and this is not: $$1/\b{a} + \b{c}$$ has the same property for any $$\b{c}$$ which has $$\b{c} \cdot \b{a} = 0$$, because $$\b{a} \cdot (1/\b{a} + \b{c}) = 1$$. This is general property of pseudoinverses that we have to live with. They select _some_ element that pseudo-inverts the operation, rather than _the_ element that totally inverts it.

One reason to think that this is still a good generalization of scalar division is that it does work like scalar division _if_ both arguments are parallel:

$$(b \b{x}) \cdot \frac{1}{a \b{x}} = \frac{b}{a}$$

If they're not parallel, then it only acts like an inverse on the parallel component of $$\b{b}$$, in the following sense. Factor $$\b{b}$$ as

$$\b{b} = \b{b}_a + \b{b}_{\perp a} = b_a \b{a} + \b{b}_{\perp a}$$

Where 

* $$\b{b}_a$$ is [vector projection](https://en.wikipedia.org/wiki/Vector_projection) of $$\b{b}$$ onto $$\b{a}$$ (often written $$\proj_{\b{a}} \b{b}$$)
* $$b_a$$ is the coefficient of $$\b{a}$$, the '$$a$$'-component of $$\b{b}$$, such that $$\b{b}_a = b_a \b{a}$$.
  * Note that $$b_a$$ is _not_ the same as the normal [scalar projection](https://en.wikipedia.org/wiki/Scalar_projection) of $$\b{b}$$ onto $$\b{a}$$, which is given by $$s = \b{b} \cdot \hat{\b{a}} = \| \b{b} \| \cos \theta_{ab} = b_a \| \b{a} \|$$. The difference is that $$s \hat{\b{a}} = b_a \b{a} = \b{b}_a$$.
* $$\b{b}_{\perp a}$$ is vector "rejection", the remainder term which is orthogonal to $$\b{a}$$.

Then dividing and multiplying again by $$\b{a}$$ restores only the projection component, and erases the $$\b{a}_{\perp a}$$ component:

$$
\begin{aligned}
(\frac{\b{b}}{\b{a}}) \cdot \b{a} &= \b{b}_a \\
\end{aligned}
$$

I like to think of the component notation $$b_a$$ as _meaning_ $$\b{b}/\b{a}$$, and the notation $$\b{b}_a$$ as meaning $$(\b{b}/\b{a}) \b{a}$$.[^floor]

[^floor]: Aside: this operation acts kinda like the "integer division" operation you see in some programming languages, e.g. `b // a = ⌊b/a⌋`. With vectors the remainder that gets chopped off is orthogonal to the divisor, rather than a fraction of it.

There are many ways you could define vector division, and various versions of algebra work on them depending on how you do it. I will talk about some of the other options at the end. But the above is the simplest and, imo, most useful. It's a handy way of writing $$\proj_{\b{a}} \b{b}$$, and, more importantly, it generalizes well. Specifically it generalizes well to projecting onto more than one vector at the same time---that is, onto a frame. 

--------

### Frames


The word "frame" refers to a list of $$k \leq n$$ vectors, such as 

$$A = (\b{a}_1, \b{a}_2, \ldots, \b{a}_k)$$

Picture a two or three vectors emerging from a single point in space which rotate and transform as a unit.

Okay, fine, a frame is basically a matrix. But I prefer the word "frame" when it's being thought of as a list of vectors rather than as a linear transformation. A frame can be written as a matrix in the same way that a vector can be written as a matrix: neither _are_ matrices, but matrices are one convenient representation for them. In my opinion many equations that involve matrices are better thought of as involving frames because they have a more explicit and visualizable geometric meaning: they're a group of vectors that move around and transform together.[^frame]

[^frame]: This notion of a frame is essentially the same notion as a [moving frame](https://en.wikipedia.org/wiki/Moving_frame) in differential geometry. You can also have frame fields (e.g. [tetrads](https://en.wikipedia.org/wiki/Tetrad_formalism)) and frame-valued functions and things like that; there's a whole (somewhat-obscure) theory about it. It is not quite the same as [this other notion](https://en.wikipedia.org/wiki/Frame_(linear_algebra)) of a frame, which refers to a generalization of a basis for a vector space that is allowed to be linearly dependent. (That article is unfortunately titled "Frame (linear algebra)" as though it is fundamental or something. The moving-frame concept is actually fundamental, IMO, while the linearly-dependent-basis concept is comparatively niche. Hmph.)

Nevertheless we'll operate on $$A$$ using matrix multiplication notation. Right-multiplication becomes a dot product with the list index of the frame, as though we are taking a dot product between the "vector" $$A$$ and the vector $$\vec{x}$$:

$$A \vec{x} =  (\b{a}_1 \; \b{a}_2 \; \ldots) \begin{pmatrix} x_1 \\ x_2 \\ \vdots \end{pmatrix} = x_1 \b{a}_1 + x_2 \b{a}_2 + \ldots$$

Left-multiplication becomes an "internal" dot product which happens elementwise:

$$\b{y}^T A = 
(y_1 \; y_2 \; \ldots) (\b{a}_1 \; \b{a}_2 \; \ldots) =
(\b{y} \cdot \b{a}_1 \;\; \b{y} \cdot \b{a}_2 \; \; \ldots)$$

I don't actually like the matrix multiplication notation so I'm kind of annoyed to be using it, but I had previously written all of this without it and it was, admittedly, more confusing. Oh well.

Note that a frame $$A$$ has its two indices that always live in different spaces: the individual elements of "geometric" vectors in space, while the $$k$$ tuple indices are a sort of abstract "list" index that has no geometric meaning. I prefer to write geometric vectors in bold, like $$\b{a}_i$$, while I write list vectors with an overarrow like $$\vec{x}$$, to distinguish between the two. This makes it a little easier to keep track of which space they live in. We could also write $$\vec{\b{A}}$$ instead of $$A$$, I guess, since a frame is both... but I don't think it's necessary.


----------

The definition of division by a frame 

$$\vec{x} = \frac{\b{b}}{A}$$ 

Is that it is _almost_ the vector $$\vec{x}$$ which gives the coefficients of $$\b{b}$$ in terms of the vectors in the frame:

$$\b{b} \? x_1 \b{a}_1 + x_2 \b{a}_2 + \ldots$$

That is, we would like it to be the solution to the normal linear system of equations

$$A \vec{x} = \b{b}$$

But this is not generally possible, for several reasons. One is that $$\b{b}$$ may not be in $$\text{\span}(\{ \b{a}_i \})$$, that is, the column space $$\text{col}(A)$$. Another is that if the vectors in $$A$$ are not linearly independent, then there may be more than one way to do it. 

For now now let's ignore the second problem: we'll assume that the $$A$$ is linearly-independent and we'll address the case where it is not later.

For the first problem, since $$\b{b} \in \text{col}(A)$$ is not guaranteed, the best we can do is solve 

$$A \vec{x} = \b{b}_A$$

Where $$\b{b}_A = \proj_{A} \b{b}$$, the projection of $$\b{b}$$ into the column space of $$A$$. (You could also write that as $$\proj_{\text{col}(A)} \b{b}$$, but I prefer the more succinct notation.) This equation always has a solution, by definition: the part of $$\b{b}$$ that's in the column space of $$A$$ is always writeable as a sum of columns of $$A$$ because that's what a column space is. So the definition of the division notation is instead that it gives the components of $$\b{b}_A$$, written $$b_A$$:

$$
\begin{aligned}
\frac{\b{b}}{A} &= b_A = (b_1, b_2, \ldots)
\end{aligned}
$$

And multiplying by $$A$$ again produces the projection

$$
\begin{aligned}
A \frac{\b{b}}{A} &= \b{b}_A \\
&= b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots \\
&= \b{b} - \b{b}_{\perp A}
\end{aligned}
$$

Which is exactly what happened with the vector division in the previous section - well, it had to be, because it's the $$k=1$$ case of this. Note that now that $$b_A$$ is not a scalar, we have to be careful to left-multiply by $$A$$. Matrix multiplication notation is kinda annoying.

Now we'll construct some frame inverses.

----------

### Orthogonal frames

In the simpelst case where the vectors of $$A$$ are mutually orthogonal, that is ,where $$\b{a}_i \cdot \b{a}_j = 1_{i = j}$$, then division happens componentwise:

$$
\begin{aligned}
\frac{\b{b}}{A} &= \frac{\b{b}}{(\b{a}_1, \b{a}_2, \ldots)} \\ 
&= (\frac{\b{b}}{\b{a}_1}, \frac{\b{b}}{\b{a}_2}, \ldots) \\
&= (\frac{\b{b} \cdot \b{a}_1}{\| \b{a}_1 \|^2}, \frac{\b{b} \cdot \b{a}_2}{\| \b{a}_2 \|^2}, \ldots)
\end{aligned}
$$

It is nice to think of this as what's going on any time you write out a vector in an orthogonal coordinate system. For instance when we write out a vector in the standard $$(\b{x}, \b{y}, \b{z})$$ basis of $$\bb{R}^3$$, then we're "really" doing

$$
\begin{aligned}
\b{b}_{(\b{x}, \b{y}, \b{z})} &= \frac{\b{b}}{(\b{x}, \b{y}, \b{z})}\cdot(\b{x}, \b{y}, \b{z}) \\
&= \frac{\b{b}}{\b{x}} \b{x} +  \frac{\b{b}}{\b{y}} \b{y} +  \frac{\b{b}}{\b{z}} \b{z}  \\
&= b_x \b{x} + b_y \b{y} + b_z \b{z}
\end{aligned}
$$

The fact that there's a division step inside each coefficient helps one keep track of the correct coordinate-variance of the components. Under a coordinate change where e.g. $$\b{z} \mapsto 2 \b{z}$$, the coefficient $$b_z$$ becomes $$b_z/2$$, simply due to the fact that it's given by $$b_z = \b{b}/(2\b{z})$$, so it has the $$2$$ in the denominator instead of the numerator. More on this later.

It is also nice to view the tuple $$(b_x, b_y, b_z)$$ as being the "$$xyz$$" component of $$\b{b}$$ (and also let's write the frame more succintly, without commas):

$$\b{b} = \frac{\b{b}}{(\b{xyz})}\cdot(\b{xyz}) =  b_{xyz} (\b{xyz})$$

Just for fun you could also have some kind of "mixed" basis, like the $$(\b{x}, \b{yz})$$ basis:

$$\b{b} = b_x \b{x} + b_{yz} (\b{yz})$$

This suggests viewing a basis vector as a frame of one element and then in general vectors are summed over basis frames, rather than basis vectors. (It is also interesting to think about matrices and tensors which are expressed in a mixed basis like this; it's what a [block matrix](https://en.wikipedia.org/wiki/Block_matrix) is, but maybe you can do algebra with it using the same rules? More on that some other time.)
 
Anyway, the case where a frame's vectors are orthogonal is easiest to think about, but it works when they aren't, and that's where this idea of division is most useful.

--------

### Non-orthogonal frames

Again let

$$A = (\b{a}_1, \b{a}_2, \ldots)$$

If $$A$$ is linearly independent, but not mutually orthogonal, then a division operation is still definable. To expand $$\b{b}$$ in this frame, that is, to solve

$$A \b{x} = \b{b}_A$$

we can still "divide through" by $$A$$, but it's no longer the case that the division factors componentwise:

$$\frac{\b{b}}{A} \neq (\frac{\b{b}}{\b{a}_1}, \frac{\b{b}}{\b{a}_2}, \ldots)$$

The problem is easily illustrated with the frame $$A = (\b{a}_1, \b{a}_2) = (\b{x}, \b{x} + \b{y})$$ and the vector $$\b{b} = \b{x} + \b{y}$$. Its component along $$\b{a}_1$$ is _not_ $$1$$, even though it contains one factor of $$\b{a}_1$$, because its component along $$\b{a}_2$$ has to be $$1$$ instead; the correct expansion is $$\b{b} = 0 \b{a}_1 + 1 \b{a}_2$$. We need each of the componentwise divisions to somehow divide only by a direction that is _totally unique to $$\b{a}_i$$_.

The simplest way to think about this is that we want what's called a [dual basis](https://en.wikipedia.org/wiki/Dual_basis) to the vectors of $$A$$, which is a separate frame of vectors $$A^+ = \{ \b{a}_i^* \}$$ which are all $$\in \text{col}(A)$$ and have[^plus]

[^plus]: The fact that the standard symbol for this is $$A^+$$ is irritating, because it doesn't invoke "division" at all. Meh. I guess I can use it for now. I'd prefer to write it as $$A^*$$, honestly, but the Hermitian conjugate is too well-known to overload also.

$$\b{a}_i^* \cdot \b{a}_j = 1_{i=j}$$

Then we use this to select the coefficients

$$
\begin{aligned}
\b{b} \cdot \b{a}_1^* &= (b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots + \b{b}_{\perp A}) \cdot \b{a}_1^* \\
&= b_1 (\b{a}_1 \cdot \b{a}_1^*) + b_2 (\cancel{\b{a}_2 \cdot \b{a}_1^*}) + \ldots + (\cancel{\b{b}_{\perp A} \cdot \b{a}_1^*})\\
&= b_1 \\
\b{b} \cdot \b{a}_i^* &= b_i
\end{aligned}
$$

The dual basis is defined so that everything cancels out perfectly.

For the preceding example, the dual basis is

$$A^+ = (\b{a}_1^*, \b{a}_2^*) = (\b{x} - \b{y}, \b{y})$$

Because 

$$
\begin{aligned}
\b{b} \cdot \b{a}_1^* \, &= (\b{x} + \b{y}) \cdot (\b{x} - \b{y}) &= 0 \\
\b{b} \cdot \b{a}_2^* \, &= (\b{x} + \b{y}) \cdot \b{y} &= 1 \\
\end{aligned}
$$

With the orthogonal frames in the previous section, it _was_ the case that $$A^+ = (1/\b{a}_1, 1/\b{a}_2, \ldots)$$, which is why things worked out so simply. But in the general case they are not. Note that while $$A^+$$ is the inverse of $$A$$ as a frame, the individual vectors $$\b{a}_i^*$$ can't be interpreted as the inverses of the $$\b{a}_i$$ as individual vectors, so we don't want to write them as $$\b{a}_i^{-1}$$ or $$\b{a}_i^+$$. They are only meaningful as the components of the larger division of $$A$$.

However we obtain $$A^+$$, we can use it to solve $$A \b{x} = \b{b}_A$$. The whole expansion is given by $$A^+ (\b{b})$$. Note that we need to transpose $$A^+$$ as a matrix for this to work out I don't want to write $$(A^+)^T$$ everywhere, though, so I'm going to let it be implied: a dual frame is considered to be innately transposed when written as a matrix. (Privately, my solution to this is to just not use matrix multipication notation at all.)

Therefore this is the definition of division for non-orthogonal frames:

$$
\begin{aligned}
\frac{\b{b}}{A} &= A^+ (\b{b}) \\ 
&= \begin{pmatrix} \b{a}_1^* \\ \b{a}_2^* \\ \vdots \end{pmatrix} (b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots + \b{a}_{\perp A}) \\ 
&= \begin{pmatrix} b_1 \\ b_2 \\ \vdots \end{pmatrix} \\
\end{aligned}
$$

Dividing and multiplying again gives the same projection as before:

$$
\begin{aligned}
A \frac{\b{b}}{A} &= (\b{a}_1, \b{a}_2, \ldots) \begin{pmatrix} b_1 \\ b_2 \\ \vdots \end{pmatrix} \\
&= b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots \\
&= \b{b}_A
\end{aligned}
$$

Now, where do we get $$A^+$$?

If $$A$$ is $$n \times n$$, then it is invertible, because we have already assumed the rows are linearly independent, which is equivalent to $$\det A \neq 0$$. Then the dual basis is given by the elements of $$A^{-1}$$, and the dual basis condition $$\b{a}_i^* \cdot \b{a}_j = 1_{i=j}$$ simply says that $$A^{-1} A = I$$. 

But a dual basis also exists for non-square matrices. In that case it is given by the rows of the [pseudoinverse](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse), which instead of $$A^{-1} A = A A^{-1} = I$$ has $$A A^+ = I_{A}$$, the identity on the column space of $$A$$ and $$ A^+ A = I_{A^T}$$, the identity on the rowspace. The latter is easier to see, because it's the identity in the basis given by the $$\b{a}_i$$s:

$$
\begin{pmatrix}
\b{a}_1^* \\ 
\b{a}_2^* \\ 
\vdots 
\end{pmatrix}
\begin{pmatrix} \b{a}_1 & \b{a}_2 & \ldots \end{pmatrix} 
=
\underbrace{\begin{pmatrix} 1 & 0 & \cdots & 0 \\ 
0 & 1 & \cdots & 0  \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \cdots & 1 \end{pmatrix}}_{k \times k}
$$

For the former, we could talk about the rows of $$A$$ and the columns of $$A^+$$, but it gets confusing. It's better to change basis into an orthogonal basis spanned by $$A$$ and another $$n-k$$ vectors that span the space. We can call it $$P = \{ \b{a}_1, \b{a}_2, \ldots \b{a}_k, \underbrace{A_{\perp}}_{n-k \text{ terms}} \}$$. Then

$$
\begin{aligned}
A^{} A^+ = P \begin{pmatrix} 
I_k &  \\ & 0_{n-k}
\end{pmatrix} P^{-1} = P \begin{pmatrix} 
1 & \cdots & 0 & & &  \\
\vdots & \ddots & \vdots & & &  \\ 
0 & \cdots & 1 & & &  \\
& & & 0 & \cdots & 0 \\
& & & \vdots & \ddots & \vdots \\ 
& & & 0 & \cdots & 0 
\end{pmatrix} P^{-1}
\end{aligned}
$$

(This is a special case of the SVD; it's simpler because of the assumption that $$A$$ is linearly independent.)

That is, they are the identity but only on the column space of $$A$$. The effect is a projection $$I_A \b{b} = \b{b}_A$$. This property means that solves the equation when you substitute in $$\b{x} = A^+(\b{b})$$

$$
\begin{aligned}
A \b{x} &= \b{b}_A \\ 
A (A^+ \b{b}) &= \b{b}_A \\
\underbrace{A A^+}_{\text{identity on }A} \b{b} &= \b{b}_A \\
\b{b}_A &= \b{b}_A
\end{aligned}
$$

I will leave a discussion of actually computing the pseudoinverse and dual basis in generality for later because it is less interesting and kind of messy. For now I just want to establish that the meaning of

$$\frac{\b{b}}{A} = A^+ (\b{b})$$

Is that it lets us expand a vector like this:

$$\b{b} = A \frac{\b{b}}{A} + \b{b}_{\perp A}$$

Which I like a lot.

That's all for actually defining this division notation. But here are a couple other neat things which are a bit more advanced that I also want to mention.

-------

### Coordinate changes

You can even divide a frame by another frame, which is a reinterpretation of matrix multiplication. You can take one basis to another by operating componentwise. If $$A = (\b{a}_1, \b{a}_2)$$ and $$B = (\b{b}_1, \b{b}_2)$$

$$
\begin{aligned}
B_A &= \frac{B}{A} A \\
&= \frac{(\b{b}_1, \b{b}_2)}{(\b{a}_1, \b{a}_2)} (\b{a}_1, \b{a}_2) \\
&= ( \frac{\b{b}_1}{(\b{a}_1, \b{a}_2)} (\b{a}_1, \b{a}_2), \frac{\b{b}_2}{(\b{a}_1, \b{a}_2)} (\b{a}_1, \b{a}_2))) \\
&= ( (\b{b}_1)_{A}A, (\b{b}_2)_{A} A) \\
\end{aligned}
$$

That is, we have written the vectors of $$B$$ as much as possible in terms of the vectors of $$A$$. This immplements coordinate change from $$B \ra A$$, because a vector $$\b{x}$$ written in the basis $$B$$ is given by $$\b{x} = \vec{x} \cdot B = (x_1, x+2) \cdot (\b{b}_1, \b{b}_2) = x_1 \b{b}_1 + x_2 \b{b}_2$$, which in terms of the $$A$$ basis is

$$\b{x}_A = \frac{\b{x}}{A} A = \vec{x} \cdot (\frac{B}{A} A) = x_1 (\b{b}_1)_{A}A + x_2 (\b{b}_2)_{A} A$$

$$B/A$$ is the change-of-basis matrix between the two bases but expressed in a way that makes it actually kinda work like that. I haven't really figure out how this works if the bases don't span the same subspaces, and probably the notation could be improved a bit, but it's still a neat way of thinking about it.

This might be more familiar in multivariable calculus:

If you change coordinate systems from $$X = (\b{x}_1, \b{x}_2, \b{x}_3)$$ to $$Y = (\b{y}_1, \b{y}_2, \b{y}_3)(\b{x}_1, \b{x}_2, \b{x}_3)$$, the first derivative (unfortunately called the Jaobian) is a matrix that's better interpreted as the division of two frames, $$dY$$ and $$dX$$:

$$\frac{dY}{dX} = \frac{\p (\b{y}_1, \b{y}_2, \b{y}_3)}{\p (\b{x}_1, \b{x}_2, \b{x}_3)} = \begin{pmatrix} \frac{\p y_1}{\p x_1} & \frac{\p y_2}{\p x_1} & \ldots \\ \vdots & \vdots & \ddots \end{pmatrix}$$

This is the matrix that's used to change variables inside the integrand of a surface integral: a line element $$a_1 d\b{x}_1 + a_2 d \b{x}_2 + a_3 d \b{x}_3 = \vec{a} \cdot dX$$ is just a vector in the $$X$$ frame, and it transforms to 

$$\vec{x} \cdot dX = \vec{a} \cdot \frac{dX}{dY} dY$$

and a volume element $$v_{123} d \b{x}_1 \^ d \b{x}_2 \^ d \b{x}_3 = \vec{v} \cdot dX^{\^3}$$ transforms to 

$$\vec{v} \cdot dX^{\^3} = \vec{v} \cdot (\frac{dX}{dY})^{\^3} dY^{\^3}$$

And this all works if the coordinate systems have different numbers of coordinates. I haven't figured out all the notations exactly, but this is one of the big reasons I like frame division as a concept: because dealing with differential forms is annoying.

Incidentally it also makes it pretty obvious why differential forms deal with covariance and contravariance the way they do: because some of the elements are _in denominators_, and naturally transform contravariantly, according to the inverse of a coordinate change:

$$
\begin{aligned}
\b{a} = \vec{a} \cdot X &= \vec{a} \cdot \frac{X}{Y} Y \\ 
\b{a}^* = \vec{a}^* \cdot \frac{1}{X} &= \vec{a}^* \cdot \frac{Y}{X} \frac{1}{Y} \\
\end{aligned}
$$

Compare to the normal presentation in differential geometry. A vector $$\b{v} = v_i \b{x}^j$$ transforms in new coordinates into $$\b{v} = v_j' \b{x}'^j$$, where

$$
\begin{aligned}
\b{x}'^j &\mapsto A^j_{\,i} \b{x}^i \\
v_j' &\mapsto A{\,j}^k v_k \\
\end{aligned}
$$

Although the notation obfscuates a bit, the matrix $$A{\,j}^i$$ is the inverse of the matrix $$A^j_{\,i}$$, because $$v_j' \b{x}'^j = (A{\,j}^k v_k) (A^j_{\,i} \b{x}^i) = v_i \b{x}^i$$, which in matrix notation says 

$$\vec{v}' \cdot \vec{\b{x}}' = (\vec{v}^T A^{-1}) (A \vec{\b{x}}) = \vec{v} \cdot \vec{\b{x}}$$

Therefore they describe the same geometrical vector, the thing I write in boldface $$\b{v}$$. The components of $$\b{v}$$ had to transform transform with an inverse matrix compared to the basis elements, hence we say that they contra-vary with the coordinate system. It is all much easier to see like this:

$$\b{v} = \vec{v} \cdot X = \frac{\vec{v}}{A} AX$$

Although I'm definitely taking some shortcuts with the notation here. 

In the case where you use the metric tensor to raise and lower indexes, what you are doing is talking about a matrix $$g^{ij} = X^i \cdot X^j$$ for some frame $$X$$, which if you allow the components to just be implied, looks like $$g = X \cdot X$$. Well: Naturally you can also write

$$\frac{X}{X \cdot X} \cdot X = I$$

$$X^{-1} = \frac{X}{X \cdot X}$$ is simply the dual frame for $$X$$, in the case where $$X$$ is a non-orthonormal frame with a non-trivial dot product. (Er... at least I'm pretty sure it is. I haven't done GR in a decade but it at least looks right.)

So this way of looking at linear algebra seems to me to dispel a lot of the issues that have always bugged me in multivariable calculus and differential geometry. I'm not confident that it's all sound, yet, and it hurts my head to think about making it rigorous. But it... feels right? And as far as I can tell seems to work.

The reason I have found myself writing this article at all is that I _so often_ have felt like there is a simple way to do a lot of the otherwise-arduous algebra of differential geometry, if only you had the right calculus for it, and dividing by frames keeps seeming like it's one of the tools that you need.

-------

### Multivectors

I should mention how this works on multivectors briefly, since I just used it without explanation in the previous section.

(Note: I use "multivector" to refer to a single-grade element of some $$\^^k V \in \^ V$$; I'm _not_ talking about mixed-grade multivectors like Geometric Algebra uses.)

For a regular multivector it is the same as on a vector. After all they are both vectors, just in different vector spaces.

$$\frac{1}{\alpha} = \frac{\alpha}{\| \alpha \|^2}$$

For a frame, you can take wedge products of the frame, which do not have to be zero. For $$A = (\b{a}_1, \b{a}_2, \b{a}_3)$$, the wedge powers are

$$
\begin{aligned}
A^{\^2} &= (\b{a}_2 \^ \b{a}_3, \b{a}_3 \^ \b{a}_1, \b{a}_1 \^ \b{a}_2) \\ 
A^{\^3} &= (\b{a}_1 \^ \b{a}_2 \^ \b{a}_3) \\
\end{aligned}
$$

Which is what is called the exterior power of $$A$$ as a matrix. Note that the ordering we write the terms in doesn't matter, as long as we're consistent when we let it interact with any other vectors; it amounts to choosing an ordering of the basis of $$\^^2 V$$.

I think intuitively what's going on is: we have treated $$A$$ like a vector of vectors, but unlike a vector of scalars, the components themselves do not commute, so $$A^{\^2} \neq 0$$ like it would be for a vector $$\b{b} \^ \b{b} = 0$$. I suppose there is probably a lot written out there about the exterior algebra over non-commutative algebras, but I haven't found anything that I'm capable of understanding yet...

Anyway, the inverse of an exterior power of a frame seems to be the operation that produces the pseudoinverse, like this:

$$A^{\^-1} \equiv \frac{A^{\^ k-1}}{A^{\^k}} \equiv \frac{A^{\^k-1} \cdot A^{\^k}}{\| A^{\^k} \|^2}$$

As far as I have found it's basically impossible to find a notation actually shows how this matches up all the indexes and stuff. Let's just say that this is all heuristic. But it is easy to see what it does in an example:

$$A^{\^-1} = \frac{A^{\^2}}{A^{\^3}} = \frac{(\b{a}_2 \^ \b{a}_3, \b{a}_3 \^ \b{a}_1, \b{a}_1 \^ \b{a}_2)}{\b{a}_1 \^ \b{a}_2 \^ \b{a}_3}$$

The important bit is that if you wedge this with $$A$$ again, it acts exactly like the dual basis, the elements of $$A^+$$:

$$
\begin{aligned}
A \^ A^{\^-1} &= (\b{a}_1 , \b{a}_2, \b{a}_3) \^ \frac{((\b{a}_2 \^ \b{a}_3), (\b{a}_3 \^ \b{a}_1), (\b{a}_1 \^ \b{a}_2))}{\b{a}_1 \^ \b{a}_2 \^ \b{a}_3} \\
&= \frac{1}{\b{a}_1 \^ \b{a}_2 \^ \b{a}_3} \begin{pmatrix} \b{a}_1 \^ \b{a}_2 \^ \b{a}_3 & 0 & 0 \\ 0 & \b{a}_1 \^ \b{a}_2 \^ \b{a}_3 & 0 \\ 0 & 0 & \b{a}_1 \^ \b{a}_2 \^ \b{a}_3 \end{pmatrix} \\
&= \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{pmatrix}
\end{aligned}
$$

So when we talk about a matrix that $$A$$ _dots_ with to create $$I$$, we are talking about $$(A^{\^-1})^T$$, in which we treat each element of $$A^{\^-1}$$ as a $$1$$-vector that interacts with a dot product, rather than as as a "dual" vector that interacts with the wedge product. Basically

$$(A^{\^-1})^T = A^+$$

And in the case where $$k=n$$,

$$(A^{\^-1})^T = A^{-1}$$

(Some version of this still works for linearly-dependent $$A$$, but it's a lot messier, and I don't want to think about it right now.)

Incidentally, I strongly suspect that it's productive to view the elements of $$A^{\^{-1}}$$ as grade-$$(-1)$$ vectors, but I haven't found a great way to justify it that anyone else would believe yet. But doesn't it just _look_ right? Yeah, it does.

--------

# 3. Reasons to do it this way

There is a lot to debate about vector division. It gets messy because there are multiple kinds of multiplication, multiple interpretations of division that you might want to generalize, and multiple properties of division that you might want to relax in order to allow a particular generalization to work. 

Above I have relaxed the idea of being a true inverse, and I've generalized in the direction of "dividing by multiple vectors at once". The reason I prefer _that_ generalization is:

(1) Having a shorthand for projection is really handy. $$\proj_{\b{a}}(\b{b}) = \frac{\b{a} \cdot \b{b}}{\| \b{a} \|^2} \b{a}$$ always bugged me. It has a suspicious form. People normally think of it like this: 

$$\proj_{\b{a}}(\b{b}) = \b{a} \cdot (\hat{\b{a}} \o \hat{\b{a}}) = \b{a} \cdot (\frac{\b{a}}{\| \b{a} \|} \o \frac{\b{a}}{\| \b{a} \|})$$

That is, you extract the component along the unit vector $$\hat{\b{a}}$$, then return the vector. But I've always found it more compelling like this:

$$\proj_{\b{a}}(\b{b}) = \b{b} \cdot (\frac{\b{a}}{\| \b{a} \|^2} \o \b{a})$$

To me it looks like "dividing by $$\b{a}$$, then multiplying again". I find this more agreeable. Unit vectors are sort of strange objects, anyway. Geometry doesn't really care per se about the length of your vectors: it doesn't really care what $$1$$ is; if you change the units of length which vectors are units would change, but it wouldn't matter. So an equation that happens to use a unit vector is really sort of unnatural. I'd much rather use an equation like that one, which talks about a vector and its "dual".

(2) The pseudoinverse is essentially what is going on with differential forms and covariant/contravariant vectors. It really makes that stuff easier. See the "coordinate change" section above.

(3) The fact that you can decompose vectors into "hybrid" bases is very appealing:

$$\b{b} = b_x \b{x} + b_{yz} \b{yz}$$

Since this is just a different notation for the same thing, math has to work the same way when you do it. But if you can wrap up multiple basis elements into one and then _treat them_ like a single basis element... what does that mean? What parts of vector algebra work the same way, and which ones don't? Is it possible that some of the vector spaces we're using in physics are already doing this, secretly? Maybe something like this is why time enters with a minus sign in Minkowski space? Maybe something else?

It's also just nice to use. If ever you want to factor a vector into two important parts, just do it. For instance in my Lagrange Multipliers essay it was very useful to split the differential of a function into two parts, one that lays on the a surface and one which is in its orthogonal complement:

$$df = d_G f + d_{\perp G} f = \frac{df}{dG} dG + \frac{df}{d G_{\perp}} dG_{\perp}$$

This... basically... has to work, just by virtue of the fact that vectors work this way and a differential is a vector. (Okay, I'm gonna look silly if it turns out not to. But anyway, it feels right. It's a vibe okay?)

-----

# 4. Other Ways to do it

There are various other things you could do besides this definition. Examples that come to mind are:

If you treat the tensor product as "the" way to multiply vectors, then it actually _is_ invertible:

$$\b{a} \cdot (\frac{\b{a}}{\| \b{a} \|^2} \o \b{b}) = \b{b}$$

In a sense the projection above is prematurely contracting over the $$\o$$ symbol there, leading to 

$$\b{a} \cdot (\frac{\b{a}}{\| \b{a} \|^2} \cdot \b{b}) = \b{b}_A$$

The missing part would be given by the wedge product:

$$\b{a} \cdot (\frac{\b{a}}{\| \b{a} \|^2} \^ \b{b}) = \b{b} - \b{b}_A = \b{b}_{\perp A}$$

So the tensor product version is kinda the "true" inverse, and the two components of it are just parts of it that are missing the other part. I guess you could decide that the fraction notation, then, should refer to $$\frac{\b{b}}{\b{a}} = \frac{\b{a}}{\| \b{a} \|^2} \o \b{b}$$. But I just don't want to. It doesn't seem that useful. Most of the time what you want to deal with is not actually a tensor product.

Clifford/Geometric Algebra, meanwhile, combines the two parts back together, but in the least intuitive way: it adds the two terms even though they're of different grades. I'll use $$\b{a} \ast \b{b}$$ to denote the Clifford Product (cause $$\b{a} \b{b}$$ is silly)

$$\b{a} \ast \b{b} = \b{a} \cdot \b{b} + \b{a} \^ \b{b}$$

Then

$$
\begin{aligned}
\b{a} \ast (\b{a}^{-1} \ast \b{b}) &= \b{a}^{-1} \ast \b{b} + \b{a}^{-1} \^ \b{b} \\ 
&= \b{b}_A + \b{b}_{\perp A} \\
&= \b{b}
\end{aligned}
$$

So that actually is an inverse also, and I suspect that in a sense it's the "minimal" inverse: it prefers only the information in $$\b{a}^{-1} \o \b{b}$$ required to produce $$\b{b}$$ again. Actually I suspect that this _is_ the reason that the geometric product works and why so many operations do seem to work from it. But I don't feel ready to make that argument in detail right now. I'm too tired.

Anyway, the Clifford product produces a certain type of "actual" division, but what you lose in the process is an object that has a useful interpretation. A scalar plus a bivector is a... what? 

Well, it represents two operations: something that acts like the identity on a matrix, and something that acts like a rotation / rescaling. In the case where you are trying to produce "exact" inverses of vectors (or the operations that they represent), this is going to be useful. But it's all very muddled inside the math: it's hard to see exactly what's going on or why it works. And even if you have that notion of division, you _still_ want this one, the frame division, because it's clearly also useful for coordinates and the like. I suspect that the most cogent version of linear algebra includes both inside a larger common language. But I don't see how to do it yet.

Besides these types of division, there is also a separate axis on which you can talk about division. Suppose you are dividing a vector by another vector. Is there _one_ answer? Or many? In the cases above, we defined $$\b{a}^{-1}$$ such that $$\b{a}^{-1} \cdot \b{a} = 1$$. But of course there are many possibilities for that; any term $$\b{a}_{\perp}$$ can be added to it without changing the result (which is why it's not a "true" inverse, anyway.) 

Should we keep track of all of those? Probably in some cases, yes. I imagine that there's a way that you view every inverse as returning the full preimage of the relevant operation, which I call "generalized inverse". I have mused about it a bit [here]({% post_url 2023-09-25-inverses %}). But I think that's just a separate operation that, while important, doesn't need to be the meaning of the fraction $$\b{b}/\b{a}$$. We get to pick what that means, and we may as well make it into the most useful object possible. Hopefully my various examples above have made the case that the projection interpretation is pretty useful.