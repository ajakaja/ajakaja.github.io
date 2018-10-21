---
layout: article
title: "Suggestive Notations"
footnotes: true
math: true
---

... of multilinear algebra.

Most examples will assume $$\bb{R}^3$$ space spanned by $$\{\hat{x}, \hat{y}, \hat{z}\}$$.

## 1 vectors

Dot products and subscripts are the same thing, so:

$$v_x = \hat{x} \cdot \vec{v}$$

This is probably the correct interpretation of the dot product: $$L \cdot R = R_L$$ is asking for the "coordinate of $$L$$ along $$R$$".

We can also write $$v_{\hat{x}}$$, though it is usually not ambiguous. When the subscript is a single symbol we're okay with omitting the $$\hat{x}$$.

We can subscript with arbitrary vectors, and now the hats seem necessary to avoid awkwardness:

$$v_{\hat{x} + 2\hat{y} + \hat{x}} = v_x + 2v_y + v_z$$

If your scalar coefficients are in $$\bb{C}$$, you might have to remember to complex-conjugate:

$$v_{ax} = \bar{a} v_x$$

We can ask for the 'coordinate of $$\vec{v}$$ along another vector $$\vec{u}$$':

$$v_{\vec{u}} = \vec{u} \cdot \vec{v}$$

In this case the vector symbol $$\vec{u}$$ instead of just $$u$$ is preferred, so that $$u$$ doesn't look like a coordinate directiona.

-------

We include the over-arrow vector symbol on $$\vec{v}$$ to denote a vector, rather than scalar, value:


$$\vec{v}_{\hat{x}} = v_x \hat{x}$$

We could just write $$\vec{v}_x$$ instead of $$\vec{\hat{x}}$$; it's not ambiguous -- but it seems more elegant to write a vector symbol if we care about the subscript's vector composition. For instance, it looks a lot better in:

$$\vec{v}_{\hat{x} + \hat{y}} = v_x \hat{x} + v_y \hat{y}$$

Since it would not make sense to write $$x + y$$ in the subscript.

We can also write the projection of a vector along another vector:

$$\vec{v}_{\vec{u}} = \text{proj}_{\vec{u}} \vec{v} = (\frac{\vec{u} \vec{u}}{| \vec{u} | | \vec{u} |} \cdot \vec{v})$$

It's also a bit convenient to write $$\hat{u} = \frac{\vec{u}}{\| \vec{u} \|}$$ without explanation for the unit-vector of $$\vec{u}$$ and to write $$\vec{a} \vec{b}$$ for the outer product $$\vec{a} \otimes \vec{b}$$, when the meaning is unambiguous. These give:

$$\vec{v}_{\vec{u}} = (\hat{u} \hat{u}) \cdot \vec{v} = (\hat{u}) (\hat{u} \cdot \vec{v})$$


-------

If $$\vec{v}_x$$ is the coordinate of $$\vec{v}$$ along $$x$$, then $$\vec{v}_{\perp x}$$ is coordinates of $$\vec{v}$$ along directions perpendicular to $$x$$. So, say:

$$\vec{v}_{\perp x} = v_y \hat{y} + v_z \hat{z}$$

We can also write vector subscripts as comma-separated lists when we want to:

$$\vec{v}_{(1,0,1)} = \vec{v}_{\hat{x} + \hat{z}} = v_x \hat{x} + v_z \hat{z}$$

We can also just write:

$$\vec{v}_{xy} = v_x \hat{x} + v_y \hat{y}$$

This is a big more ambiguous, because '$$xy$$' is not a mathematical object, just a label -- but it makes sense to think of it as the "$$xy$$" coordinate of $$\vec{v}$$. Particularly, we like being able to write this:

$$\vec{v} = \vec{v}_{xy} + \vec{v}_z = (v_x, v_y) \cdot (\hat{x}, \hat{y}) + v_z \hat{z}$$

such that our decomposition of $$\vec{v}$$ is not strictly limited to the basis vectors we know about. $$(v_x, v_y)$$ should then be seen as the "coefficient" (no longer a scalar) of the "basis vector" $$(\hat{x}, \hat{y})$$.

One reason to allow this is, if $$\vec{w}$$ is an element of some large-dimensional space, we could write:

$$\vec{w} = \vec{w}_x + \vec{w}_{\text{rest}} = \vec{w}_x + \vec{w}_{\perp x}$$

...without knowing how large the space is.

## 2 derivatives

Those notations already exist for partial derivatives, by the way. 

These are some different ways of writing the same thing:

$$\begin{aligned} \p_{\vec{v}} f &= (\vec{v} \cdot \p) f \\
&= (v_x \p_x + v_y \p_y + v_z \p_z) f \\
&= v_x f_x + v_y f_y + v_z f_z \\
&= df \cdot \vec{v} \\
&= df(\vec{v}) \end{aligned}$$

($$df \cdot \vec{v}$$ treats $$df$$ as a 1-form and $$\vec{v}$$ as a tangent vector using a defined inner product. $$df(\vec{v}))$$ just writes this as a linear map acting on a vector.)

That means this is valid:

$$\p_{a x + by} = a \p_x + b \p_y$$

(Once again remember that it might be necessary to complex-conjugate the subscript if working over $$\bb{C}$$.)

Depending on context these symbols may be used for derivatives:

$$\p_{\vec{v}} f = d_{\vec{v}} = D_{\vec{v}} = \nabla_{\vec{v}} = f_{\vec{v}} $$

I don't have a preference. Though $$D$$ and $$\nabla$$ are the only ones used for covariant derivatives, normally. $$\p$$ is useful because it ends up behaving 'vectorially', in expressions like $$\p_{\vec{v}} = v_x \p_x + v_y \p_y + v_z \p_z$$, which looks a lot like $$\vec{v} \cdot \vec{\p}$$.

-------

The same notations work with integrals, which is not a coincidence.

$$\int_{2(a,b) + 3(b,c)} df = 2 \int_a^b df + 3 \int_b^c df = 2\int_a^c df + \int_b^c df$$

Note that what scalar multiplication and addition mean in the subscript on an integral probably depends on what convention you're using to define the curves of integration. The general idea is curves are something like _chain complexes_, I think, which are formal linear combinations of simplexes, which are combinations of oriented line segments / triangles / tetrahedrons/etc times scalar coefficients from a scalar field. Actually, I assume the coefficients could be elements of pretty exotic spaces, in the general case, and that might be interesting.

At least when the coefficients are in a familiar number-like space, $$2C$$ means the same thing an oriented path which traverses the curve $$C$$ twice (doubling the integral), and $$-C$$ means the same thing as traversing $$C$$ backwards (multiplying the integral by $$-1$$). It's not clear what $$\frac{1}{2}C$$ would mean other than just a formal scalar coefficient, but what's wrong with that?

Remember that $$\int_a^b$$ means "integrate along a curve from $$a$$ to $$b$$"; this is only unambiguous because in $$\bb{R}$$ there is only one curve (up to homotopy) between them, and $$df$$ does not not care if you double back or go in circles or something. For contour integrals in 2D along curves you could certainly write:

$$\int_{2C_1 + C_2} df = 2 \int_{C_1} df+ \int_{C_2} df$$

It's a bit odd, but there might even be occasion to write that as $$(2 \int_{C_1} + \int_{C_2}) df$$.

(Once again remember that if you're unfortunately in $$\bb{C}$$ you'll still want complex conjugation to make inner products well-behaved: $$\int_{aC_1} df  \stackrel{?}{=} \bar{a} \int_{C_1} df$$.)

It is maybe interesting that derivatives take coordinate-vector subscripts, like $$\p_{\vec{v}}$$ while integrals take simplex-vector subscripts, like $$\int_{aC + bD}$$. That is: their subscripts live in drastically different spaces. (If you wanted a version of derivation that takes simplex-vector subscripts, maybe you would want something like parallel transport along a curve in space? And, perhaps vector-valued version of an integral is an antiderivative?)


## 3 multi-indices

Let's revisit 

$$\vec{v} = \vec{v}_{xy} + \vec{v}_z = (v_x, v_y) \cdot (\hat{x}, \hat{y}) + v_z \hat{z}$$

So far we have imagined that $$\vec{v} \in V \simeq \bb{R}^3 = \bb{R}_x \oplus \bb{R}_y \oplus \bb{R}_z$$ (the subscripts are just for convenience: they provide the label for the basis vector of each space, which is otherwise arbitrary). This says that elements of $$V$$ are direct sums of elements of three copies of $$\bb{R}$$: $$\vec{v} = (v_x, v_y, v_z)$$. (Compare to the space $$\bb{R} \otimes \bb{R} \otimes \bb{R}$$, which has one basis vector $$\hat{x} \otimes \hat{y} \otimes \hat{z}$$).

If we loosen the requirements, we can do more with this notation. Let's say that:

* a vector's coefficients do not all have to be from the same field, or even from a field at all.

... etc

* block vectors, block matrices

## 4 trace

## 5 wedges