---
layout: blog
title: "Notations for vectors and matrices"
footnotes: true
math: true
aside: true
tags: math
---

I keep confusing myself when trying to keep track of the upper and lower indexes in matrices when using [Einstein Notation](Einstein_notation). So here's my reference.

<!--more-->

## Vectors

We'll use index notation here for vectors, so summations are implicit.

$$u^i v_i \equiv \sum_i u^i v_i$$

We use a physicist's notation for vectors, which treats the vector as a geometric object, independent of basis, which happens to have a particular expansion in any particular basis. The basis vectors (written, as physicists do, in boldface) are $$\b{x}_i$$, written with lower indexes -- lower because subscripts are the 'default', and so are used for basis vectors. Lower indexes are used for things which co-vary with the basis vectors (elements of a vector space $$V$$); upper indexes will be used for things which contra-vary (elements of a dual vector space $$V^*$$).

A vector $$\b{a}$$ expands as a linear combination of basis elements, written:

$$\b{a} = a^i \b{x}_i = \begin{pmatrix} a^1 \\ a^2 \\ \vdots \\ a^{\| V \|} \end{pmatrix} $$

Confusingly, this means that the components of a vector are contravariant and written with upper indexes. Upper indexes in general correspond to varying rows when we write vectors out as matrices.

And a dual vector $$\b{b}^T \in V^*$$ can be written as a sum over the dual basis $$\{ \b{x}^i \}$$, and its components get lower indexes and identify columns:

$$\b{b}^T = b_i \b{x}^i = ( b_1 , b_2, \ldots, b_{\| V \|})$$

A dot product requires one of each, and when we write it with two vectors we are implicitly taking the transpose of its _left_ argument, resulting in a matrix multiplication.

$$\b{b} \cdot \b{a} \equiv  \b{b}^T \b{a} = (b_1, \ldots, b_n) \begin{pmatrix} a^1 \\ \vdots \\ a^n \end{pmatrix} = b_i a^i$$

It's convenient to define that, if one of the arguments in the dot product is already a dual vector, we'll skip the transposes, so $$\b{b}^T \cdot \b{a} = \b{b} \cdot \b{a}^T = b^i a_i$$. At least, it's not usually not that confusing?

The dot product may be seen as letting the basis components of each vector cancel out, with the effect of settings $$i=j$$:

$$\b{b} \cdot \b{a} = (b^i \b{x}_i)^T (a^j \b{x}_j) = b_i a^j (\b{x}^i \cdot \b{x}_j) = b_i a^i$$

---------

## Matrices

So: a subscript index labels a vector component and a column, and a superscript index labels a covector component and a row. A matrix has one of each.

A matrix $$A: U \ra V$$ can be written as a vector in the tensor product space $$U^* \otimes V$$, and gets a lower index for its $$U^*$$ component and an upper index for its $$V$$ component:

$$A = A^j_i \b{u}^i \o \b{v}_j = 
\begin{pmatrix} 
A^1_1 & \cdots & A^1_i & \cdots & A^1_{\|U\|} \\ 
\vdots &  & \vdots & & \vdots \\
A^j_1 & \cdots & A^j_i & \cdots & A^j_{\|U\|} \\
\vdots && \vdots && \vdots \\
 A^{\|V\|}_1 & \cdots & A^{\|V\|}_i & \cdots & A^{\|V\|}_{\|U\|} 
 \end{pmatrix}$$

$$A^j_i$$ is $$i$$'th column and the $$j$$'th row, and it's the scalar value given by $$A_i^j = \b{v}^j A \b{u}_i$$.

Since we tend to write matrix multiplication with the $$U$$ on the right side of $$A$$, and the $$V$$ on the left, it's tempting to write this as $$A = \b{v}_j A_i^j \b{u}^i$$.

It's useful to refer to particular rows and columns of a matrix in isolation, by omitting one of the indexes. When we do this I like to write a vector symbol, $$\vec{A}$$, to remind ourselves that we're dealing with a vector. (Unfortunately it's not common to write a vertical vector arrow, but that seems like it would be appropriate to distinguish column- vs row- vectors.) A lower index only, $$A_i$$, means the $$i$$'th column vector; an upper index only, $$A^j$$, means the $$j$$'th row vector. Therefore:

$$A = ( \vec{A}_1 \;  \cdots \; \vec{A}_i \; \cdots \;  \vec{A}_{\|U\|} ) = \begin{pmatrix} \vec{A}^1 \\ \vdots \\ \vec{A}^j \\ \vdots \\ \vec{A}^{\|V \|} \end{pmatrix}$$

We can think of a particular column of a matrix like $$\vec{A}^1$$ as its action on a particular basis vector from $$U$$: $$\vec{A}_1 = A(\b{u}_1) = A_1^j \b{v}_j $$. Similarly a particular row is given by the action of $$A$$ on a particular basis covector from $$V^*$$: $$\vec{A}^1 = (\b{v}^1)^T A = A_i^1 \b{u}^i$$.

-----

## A shorthand

I find it helpful to use $$a^x$$ as the _scalar_ value of a vector $$\b{a}$$'s $$\b{x}$$ component, and to use $$\b{a}^x$$ as a vector value, as

$$\b{a}^x = a^x \b{x} = (a \cdot x) \b{x}$$

and, in $$\bb{R}_3$$:

$$\b{a} = \b{a}^x + \b{a}^y + \b{a}^z$$

Although I usually am not too concerned with upper and lower indexes and would just write $$\b{a}_x$$.