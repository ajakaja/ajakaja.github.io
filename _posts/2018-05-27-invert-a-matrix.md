---
layout: blog
title: "How to invert a matrix"
footnotes: true
math: true
---

*[in case you haven't heard and... would like to]*

-------

So you've got a matrix, like this one:

$$A = \begin{pmatrix} A_{xx} & A_{xy} & A_{xz} \\ A_{yx} & A_{yy} & A_{yz} \\ A_{zx} & A_{zy} & A_{zz}\end{pmatrix} $$

Which looks a lot sharper as a row-vector of column-vectors:

$$A = \begin{pmatrix} A_\b{x} & A_{\b{y}} & A_{\b{z}} \end{pmatrix}$$

Each column is what $$A$$ maps the corresponding basis vector to:

$$ A \b{v} = A (v_x \b{x} + v_y \b{y} + v_z \b{z}) = v_x A_\b{x} + v_y A_{\b{y}} + v_z A_{\b{z}}$$

And suppose we'd like to invert $$A$$, ie, to find $$A^{-1}$$ such that $$A^{-1} A = I$$.

-----

If you're lucky, you know about [wedge products](https://en.wikipedia.org/wiki/Exterior_algebra). 

In brief: the wedge product $$\wedge$$ combines vectors to make larger geometric shapes, called _multivectors_. In our 3D example there are 1-D, 2-D, and 3-D multivectors, called vectors, bivectors, and (signed) volumes. In general the wedge product produces "a multivector that represents the area/volume/N-volume/etc created by its arguments". 

The wedge product of two vectors gives a bivector pointing out of the plane they lay in. If we treat this as a vector itself, then this is the same as the cross product $$\times$$, and is orthogonal to both inputs. Its magnitude is the area of the parallelogram created by the arguments. Its orientation depends on whether the arguments were given in the positively oriented order (conventionally, this is 'the direction radians go in', so counterclockwise). 

The wedge product between a vector and a bivector gives the volume of the figure they outline, another type of scalar. If we pretend the bivector is a vector, this is the same as the vector dot product $$\cdot$$. Or we may think of it as wedging three vectors together (two inside the bivector), in which case the result is the volume of the parallelepipd with those vectors as sides. 

If we wedge together three vectors that don't form a volume -- say, if they lay in the same plane -- then the result is 0.

In the wedge product of three vectors $$\b{a} \wedge \b{b} \wedge \b{c}$$, if we identify one pair as a cross product (producing a bivector) and the other as a dot product (producing a volume), we may recognize this as the recognize as the 'scalar triple product': $$\b{a} \wedge \b{b} \wedge \b{c} \Lra \b{a} \cdot (\b{b} \times \b{c})$$.
 
Our matrix $$A$$ consists of three vectors in 3d, so it may be said to have a 'volume', which is called its determinant:

$$A_{\b{x}} \wedge A_{\b{y}} \wedge A_{\b{z}} = \det A$$

Explicitly, this volume is the volume of the unit cube after mapping its sides by $$A$$; the unit cube's volume is the coefficient of $$\b{x} \wedge \b{y} \wedge \b{z}$$, and after the action of $$A$$ the volume becomes:

$$A\b{x} \wedge A \b{y} \wedge A \b{z} = A_\b{x} \wedge A_\b{y} \wedge A_\b{z} = (\det A) \; \b{x} \wedge \b{y} \wedge \b{z}$$

-----------

Back to computing $$A^{-1}$$.

Firstly, this is clearly impossible if $$\det A = 0$$, because that means $$A$$ maps the unit cube to something with $$0$$ volume -- a 2-(or less)-dimensional figure. It has therefore destroyed a dimension and there's no way you can invert it to get that back (because you've mapped three degrees of freedom down to two or less!) So we require that $$\det A \neq 0$$.

What we need is, for each column of $$A$$, something that will eliminate when multiplied by every other column. For instance, for $$A_\b{x}$$, we need a vector $$\b{v}$$ which will eliminate the other two columns: $$\b{v} \cdot A_{\b{y}} = \b{v} \cdot A_{\b{z}} = 0$$.

But this is easy: just set $$\b{v} = A_{\b{y}} \wedge A_{\b{z}}$$, and treat that bivector as a vector. We already said that wedge products produce something orthogonal to all their arguments, so it immediately works. Meanwhile, $$A_{\b{x}} \cdot \b{v} = \det A$$. 

Repeating this idea, here's a matrix that will invert $$A$$:[^row]

[^row]: The notation implies that $$A_{\b{y}} \wedge A_{\b{z}}$$ and the like produce row vectors instead of column vectors. Really they produce bivectors anyway, which we may as well write as rows if we want to. But if you want bivectors to columns also, just take transposes here.

$$A^{-1} = \frac{1}{\det A} \begin{pmatrix}
A_{\b{y}} \wedge A_{\b{z}} \\
A_{\b{z}} \wedge A_{\b{x}} \\
A_{\b{x}} \wedge A_{\b{y}}
\end{pmatrix}$$

Like so:

$$\begin{aligned} A^{-1} A &= \frac{1}{\det A} \begin{pmatrix}
A_{\b{y}} \wedge A_{\b{z}} \\
A_{\b{z}} \wedge A_{\b{x}} \\
A_{\b{x}} \wedge A_{\b{y}}
\end{pmatrix} \begin{pmatrix} A_\b{x} & A_{\b{y}} & A_{\b{z}} \end{pmatrix}\\
&= \frac{1}{\det A} \begin{pmatrix} A_{\b{y}} \wedge A_{\b{z}} \wedge A_{\b{x}} & 0 & 0 \\
0 & A_{\b{z}} \wedge A_{\b{x}} \wedge A_{\b{y}} & 0 \\
0 & 0 & A_{\b{x}} \wedge A_{\b{y}} \wedge A_{\b{z}} \end{pmatrix} \\

&=\frac{1}{\det A} \begin{pmatrix} \det A & 0 & 0 \\
0 & \det A & 0 \\
0 & 0 & \det A \end{pmatrix} \\
&= I \; \checkmark
\end{aligned}$$

---------

This is almost but not quite trivial to generalize to higher dimensions. The only catch is that, in general $$u\wedge v = - v \wedge u$$, so the diagonal may have alternating negative signs. This is because each term is a cyclic product like $$b \wedge c \wedge d \wedge a$$, and the out-of-place terms have to move past the others to their correct positions, gaining a negative sign each time:  $$b \wedge c \wedge d \wedge a = - a \wedge b \wedge c \wedge d$$

To be precise, in $$N$$ dimensions, the $$i$$'th diagonal entry will have $$i$$ terms out of place, which each have to move past $$N-1$$ other terms, giving a factor of $$(-1)^{(N-1)i}$$. Clearly for odd $$N$$ the exponent is always even and in even dimensions it alternates along the diagonal.

The matrix $$A^{-1}$$ without the determinant factor ($$= (\det A) A^{-1}$$) is called the [adjugate matrix](https://en.wikipedia.org/wiki/Adjugate_matrix) and can be written as $$\wedge^{N-1} A$$ (the matrix of wedges of $$N-1$$ columns of $$A$$). Its transpose is called the _cofactor matrix_. 

In $$N$$ dimensions, most of the multivectors cannot be written as regular vectors because they have different numbers of components than $$N$$ (specifically $$\binom{N}{k}$$). The rows of the adjugate matrix always can, though. They are wedge products of $$N-1$$ vectors and $$\binom{N}{N-1} = N$$. $$\wedge^{N-1}$$ elements are called _pseudovectors_.

----------

I remember the unpleasantness of learning how to invert a matrix in a linear algebra course in college, via pulling the cofactor matrix construction out of thin air. This version is so much simpler to understand.

