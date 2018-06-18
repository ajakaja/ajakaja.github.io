---
layout: blog
title: "How to invert a matrix"
footnotes: true
math: true
---

*[if you're fancy, or if you want to be]*

-------

So you've got a square matrix, like this one:

$$A = \begin{pmatrix} A_{xx} & A_{xy} & A_{xz} \\ A_{yx} & A_{yy} & A_{yz} \\ A_{zx} & A_{zy} & A_{zz}\end{pmatrix} $$

Which looks a lot sharper as a row-vector of column-vectors:

$$A = \begin{pmatrix} A_\b{x} & A_{\b{y}} & A_{\b{z}} \end{pmatrix}$$

Each column is what $$A$$ maps the corresponding basis vector to:

$$ A \b{v} = A (v_x \b{x} + v_y \b{y} + v_z \b{z}) = v_x A_\b{x} + v_y A_{\b{y}} + v_z A_{\b{z}}$$

So when we multiply two matrices we may write one as rows and one as columns, and then:

$$\begin{aligned}
BA &= \begin{pmatrix} B_{\b{x}} \\ B_{\b{y}} \\ B_{\b{z}} \end{pmatrix} \begin{pmatrix} A_\b{x} & A_{\b{y}} & A_{\b{z}} \end{pmatrix} \\
&= \begin{pmatrix}B_\b{x} \cdot A_\b{x} & B_\b{x} \cdot A_{\b{y}} & B_\b{x} \cdot A_{\b{z}} \\
B_\b{y} \cdot A_\b{x} & B_\b{y} \cdot A_{\b{y}} & B_\b{y} \cdot A_{\b{z}} \\
B_\b{z} \cdot A_\b{x} & B_\b{z} \cdot A_{\b{y}} & B_\b{z} \cdot A_{\b{z}} \end{pmatrix} \\
&= \begin{pmatrix} B A_\b{x} & B A_{\b{y}} & B A_{\b{z}} \end{pmatrix} \\
&= B_{}
\end{aligned}$$

This picture is generally useful for intuitively understanding matrix multiplication.

<br/>

Ok, now suppose we'd like to invert $$A$$, ie to find a matrix $$A^{-1}$$ such that $$A^{-1} A = I$$.

Recalling that for any two vectors, $$\b{a} \times \b{b}$$ produces a vector orthogonal to _both_, I claim that this is the inverse (if $$\det A \neq 0$$):

$$B = \frac{1}{\det A} \begin{pmatrix} A_\b{y} \times A_{\b{z}} \\  A_\b{z} \times A_{\b{x}} \\  A_\b{x} \times A_{\b{y}} \end{pmatrix}^T$$

Because $$\det A = (A_{\b{y}}\times A_{\b{z}}) \cdot A_{\b{x}} = (A_{\b{z}}\times A_{\b{x}}) \cdot A_{\b{y}} = (A_{\b{x}}\times A_{\b{y}}) \cdot A_{\b{z}} $$, and therefore:

$$\begin{aligned} BA &= \frac{1}{\det A} \begin{pmatrix} A_\b{y} \times A_{\b{z}} \\  A_\b{z} \times A_{\b{x}} \\  A_\b{x} \times A_{\b{y}} \end{pmatrix}^T \begin{pmatrix} A_\b{x} & A_{\b{y}} & A_{\b{z}} \end{pmatrix} \\
&= \frac{1}{\det A} \begin{pmatrix} (A_{\b{y}}\times A_{\b{z}}) \cdot A_{\b{x}} & 0 & 0 \\ 
0 & (A_{\b{z}}\times A_{\b{x}}) \cdot A_{\b{y}} & 0 \\
0 & 0 & (A_{\b{x}}\times A_{\b{y}}) \cdot A_{\b{z}} \end{pmatrix} \\&= \begin{pmatrix} 1&0&0\\0&1&0\\0&0&1\end{pmatrix} \end{aligned}$$

This formula makes _way_ more sense than the crap that I learned in my college linear algebra class.

-----


<!--more-->

If you're lucky, you might already know about the [*wedge product*](https://en.wikipedia.org/wiki/Exterior_algebra), which is what you should have learned when you learned about the cross product.

In brief: the wedge product $$\wedge$$ treats vectors as members of a larger class called _multivectors_, and is a multiplication-like operation on these spaces. In our 3D example there are 1-D, 2-D, and 3-D multivectors, called vectors, bivectors, and (signed) volumes. In general the wedge product of two multivectors produces "a multivector that represents the area/volume/N-volume/etc created by its arguments". 

So far that sounds like hand-wavey gibberish, so let's be more specific. 

The wedge product $$\wedge$$ is a multiplication operator on multivectors. It is:
* associative (so $$(\b{a} \wedge \b{b}) \wedge \b{c} = \b{a} \wedge (\b{b} \wedge \b{c})$$), and
* distributive (so $$(\b{a} + \b{b}) \wedge (\b{c} + \b{d}) = \b{a} \wedge \b{b} + \b{a} \wedge \b{d} + \b{b} \wedge \b{c} + \b{b} \wedge \b{d}$$), and
* antisymmetric (so $$\b{a} \wedge \b{b} = - \b{b} \wedge \b{a}$$).

In 3D we can list all of the types of wedge products explicitly:

The wedge product of two vectors gives a bivector pointing out of the plane they lay in. A bivector is, essentially, an 'area vector'. It's not a vector -- it looks like $$a \b{y} \wedge \b{z} + b \b{z} \wedge \b{x} + c \b{x} \wedge \b{y}$$ -- but in 3d we can _treat it_ as a vector, by turning that into $$a \b{x} + b \b{y} + c \b{z}$$. We label the [operation](https://en.wikipedia.org/wiki/Hodge_star_operator) of treating a bivector as a vector (or vice versa) with $$\star$$:

$$\star(a \b{y} \wedge \b{z} + b \b{z} \wedge \b{x} + c \b{x} \wedge \b{y}) = a \b{x} + b \b{y} + c \b{z}$$

$$\star(\b{x}) = \b{y} \wedge \b{z}$$

The wedge product of two vectors gives a bivector, and when we treat that as a vector, it is exactly the cross-product:

$$\b{u} \times \b{v} \equiv \star(\b{u} \wedge \b{v})$$

The resulting vector is orthogonal to both inputs (so $$\b{u} \cdot \star(\b{u} \wedge \b{v}) = 0$$). Its magnitude is the area of the parallelogram created by the arguments. Its orientation depends on whether the arguments were given in the positively oriented order (conventionally, this is 'the direction radians go in', so counterclockwise). 

The wedge product between a vector and a bivector gives the volume of the figure they outline, another type of scalar. If we pretend the bivector is a vector, this is the same as the vector dot product $$\cdot$$:

$$\b{u} \cdot \b{v} \equiv \b{u} \wedge \star(\b{v})$$

The wedge product of three vectors together therefore may be seen as a dot product and a cross product:

$$\b{u} \wedge \b{v} \wedge \b{w} \equiv \b{u} \cdot (\b{v} \times \b{w}) \equiv (\b{u} \times \b{v}) \cdot \b{w}$$

You may recognize this as the [*scalar triple product*](https://en.wikipedia.org/wiki/Triple_product). It gives the volume of the parallelepiped spanned by the three vectors.
 
However, if we wedge together three vectors that don't form an actual polyhedron -- say, if they lay in the same plane -- then the result is 0.

So far this might sound like, well, more notation to do the same things. But -- I promise -- it turns out to be fantastic for intuition. 

Particularly, the wedge product is well-defined in any number of dimensions, while (as you may have heard) the cross-product only really makes sense in 3d. In $$N > 3$$, we can't treat _every_ multivector as either a scalar or a vector. Since in the wedge of $$k$$ vectors, each basis has $$k$$ wedged-together components, there are $$\binom{N}{k}$$ ways this can be done. For instance, in $$N=4$$, the basis vectors for $$\b{u} \wedge \b{v}$$ are $$\b{w \wedge x}, \b{w \wedge y}, \b{w \wedge z}, \b{x \wedge y}, \b{x \wedge z}, \b{y \wedge z}$$.

By the way, our matrix $$A$$ consists of three vectors in 3d, so it may be said to have a 'volume', which is called its determinant:

$$A_{\b{x}} \wedge A_{\b{y}} \wedge A_{\b{z}} = \det A$$

Explicitly, this volume is the volume of the unit cube after mapping its sides by $$A$$; the unit cube's volume is the coefficient of $$\b{x} \wedge \b{y} \wedge \b{z}$$, and after the action of $$A$$ the volume becomes:

$$A\b{x} \wedge A \b{y} \wedge A \b{z} = A_\b{x} \wedge A_\b{y} \wedge A_\b{z} = (\det A) \; \b{x} \wedge \b{y} \wedge \b{z}$$

Therefore if $$\det A = 0$$ that means $$A$$ maps the unit cube to something with $$0$$ volume -- a plane or a line or a point. It has therefore destroyed a dimension and there's no way we're going to be able to invert it to get that back. So, inverting a matrix will require that $$\det A \neq 0$$.

-----------

Back to computing $$A^{-1}$$.

What we need is, for each column of $$A$$, to produce a row vector that will be annihilated when dot-producted by every _other_ column. For instance, for (say) $$A_\b{x}$$ we need to produce a vector $$\b{v}$$ which will eliminate the other two columns: $$\b{v} \cdot A_{\b{y}} = \b{v} \cdot A_{\b{z}} = 0$$, and has $$\b{v} \cdot A_{\b{x}} = 1$$. Look closely at the matrix multiplication of $$A$$ and $$A^{-1}$$ to see how this works:

$$A^{-1} \cdot A = \begin{pmatrix} \ldots & A^{-1}_{\b{x}} & \ldots \\ \ldots & A^{-1}_{\b{y}} & \ldots \\ \ldots & A^{-1}_{\b{z}} & \ldots \end{pmatrix} \begin{pmatrix} \vdots & \vdots & \vdots \\ A_\b{x} & A_{\b{y}} & A_{\b{z}}  \\ \vdots & \vdots & \vdots \end{pmatrix} \stackrel{?}{=} \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1\end{pmatrix}$$

But this is easy: just set $$\b{v} = \star(A_{\b{y}} \wedge A_{\b{z}})$$, and treat that bivector as a vector using $$\star$$. We already said that wedge products produce something orthogonal to all their arguments, so it immediately works. Meanwhile, $$A_{\b{x}} \cdot \b{v} = \det A$$, because it's all three columns wedged together.

Repeating this idea, here's a matrix that will invert $$A$$:[^row]

[^row]: The notation implies that $$A_{\b{y}} \wedge A_{\b{z}}$$ and the like produce row vectors instead of column vectors. Really they produce bivectors anyway, which we may as well write as rows if we want to. But if you want bivectors to columns also, just take transposes here.

$$A^{-1} = \frac{1}{\det A} \begin{pmatrix}
\star(A_{\b{y}} \wedge A_{\b{z}}) \\
\star(A_{\b{z}} \wedge A_{\b{x}}) \\
\star(A_{\b{x}} \wedge A_{\b{y}})
\end{pmatrix}$$

Remembering that $$\star(\b{a} \wedge \b{b}) \cdot \b{c} = \b{a} \wedge \b{b} \wedge \b{c}$$:

$$\begin{aligned} A^{-1} A &= \frac{1}{\det A} \begin{pmatrix}
\star(A_{\b{y}} \wedge A_{\b{z}}) \\
\star(A_{\b{z}} \wedge A_{\b{x}}) \\
\star(A_{\b{x}} \wedge A_{\b{y}})
\end{pmatrix} \begin{pmatrix} A_\b{x} & A_{\b{y}} & A_{\b{z}} \end{pmatrix}\\
&= \frac{1}{\det A} \begin{pmatrix} A_{\b{y}} \wedge A_{\b{z}} \wedge A_{\b{x}} & 0 & 0 \\
0 & A_{\b{z}} \wedge A_{\b{x}} \wedge A_{\b{y}} & 0 \\
0 & 0 & A_{\b{x}} \wedge A_{\b{y}} \wedge A_{\b{z}} \end{pmatrix} \\

&=\frac{1}{\det A} \begin{pmatrix} \det A & 0 & 0 \\
0 & \det A & 0 \\
0 & 0 & \det A \end{pmatrix} \\
&= I \; \checkmark
\end{aligned}$$

If you don't want to think about wedge products, though, feel free to write this as:

$$A^{-1} = \frac{1}{\det A} \begin{pmatrix}
A_{\b{y}} \times A_{\b{z}} \\
A_{\b{z}} \times A_{\b{x}} \\
A_{\b{x}} \times A_{\b{y}}
\end{pmatrix}$$

---------

We have to be more careful to generalize this to $$N\neq 3$$.

The catch is that, in general $$u\wedge v = - v \wedge u$$, so if we are not precise the diagonal may turn out to have unwanted negative signs. This is because each term is a cyclic product like $$b \wedge c \wedge d \wedge a$$, and the out-of-place terms have to move past the others to their correct positions, gaining a negative sign each time:  $$b \wedge c \wedge d \wedge a = - a \wedge b \wedge c \wedge d$$

To be precise, in $$N$$ dimensions, the $$i$$'th diagonal entry will have $$i$$ terms out of place, which each have to move past $$N-1$$ other terms, giving a factor of $$(-1)^{(N-1)i}$$. Therefore the $$i$$'th _row_ of $$A^{-1}$$ in $$\bb{R}^{N}$$ is:

$$A^{-1}\:_{\b{x}_i} = \frac{(-1)^{(N-1)i}}{\det A} \star  \bigwedge_{j \neq i} A_{\b{x}_j}$$

Clearly for odd $$N$$ the exponent is always even and in even dimensions it alternates along the diagonal, starting with $$-1$$.

Also, we have to be careful when applying this construction in $$2D$$. When inverting a matrix like

$$A = \begin{pmatrix} a & b \\ c & d \end{pmatrix}$$

the 'wedge products of every other column' are just... _the other column_, as a vector. In this case the $$\star$$ does all the work, because $$\star(x,y) = (-y, x)$$. 

$$A^{-1} = \frac{1}{\det A} \begin{pmatrix} (-1) \star (b,d) \\  \star (a,c) \end{pmatrix} = \frac{1}{ad - bc}\begin{pmatrix} d & -b \\ -c & a \end{pmatrix} $$

---------

This generalization is clunky, but I'm pretty sure it's clunky because of my way of 'omitting' a vector from the wedge product isn't perfect. I think it suffices for intuition, though. 

There is, I think, a better way to do it, using the [interior product](https://en.wikipedia.org/wiki/Interior_product), but I don't want to introduce any more machinery here.

--------

The matrix $$A^{-1}$$ without the determinant factor ($$= (\det A) A^{-1}$$) is called the [*adjugate matrix*](https://en.wikipedia.org/wiki/Adjugate_matrix) and can be written as $$\wedge^{N-1} A$$ (the matrix of wedges of $$N-1$$ columns of $$A$$). Its transpose is called the _cofactor matrix_. 

In $$N$$ dimensions, most of the multivectors cannot be written as regular vectors because they have different numbers of components than $$N$$ (specifically $$\binom{N}{k}$$). The rows of the adjugate matrix always can be, though. They are wedge products of $$N-1$$ vectors (called *pseudovectors*) and they can be mapped back to vectors because $$\binom{N}{N-1} = N$$.

-----

I am far from the only person saying that determinants and inverses should be taught with wedge products. I just wanted to write a (relatively) simple, link-able resource.

