---
layout: blog
title: "The Essence of Lagrange Multipliers"
tags: math
math: true
footnotes: true
aside: true
---

In which we attempt to better understand the classic multivariable calculus optimization problem.

<!--more-->

[Lagrange Multipliers](https://en.wikipedia.org/wiki/Lagrange_multiplier) are what you get when you try to solve a simple-sounding problem in multivariable calculus:

> Maximize $$f(\b{x})$$
> Subject to the constraint that $$g(\b{x}) = c$$

Lagrange multipliers are a trick to solving this. The trick is to instead maximize $$L = f(\b{x}) + \lambda (g(\b{x}) - c)$$ for both $$\b{x}$$ and a made-up variable $$\lambda$$, by solving $$\del L = \p_{\lambda} L = 0$$ instead. Equivalently, "notice that the solution will obey $$\del f \propto \del g$$, rather than $$\del f = 0$$ like it would if there was no constraint, and then invent $$L$$ to enforce this."

I'm told that Lagrange multipliers show up all over mathematics and are a widely used technique for solving real-world problems. Couldn't tell you much about that. But I care about them for three reasons:

One, the explanation for how to solve them that you get in undergraduate calculus is very philosophically unsatisfying. I don't like techniques that arising from "noticing" something and then proving it works. Depending on your background noticing it might be easier or difficult, but in either case it's not satisfying for a problem to be solved by a trick. Instead the insight should somehow emerge from a natural calculation.

Two, I am very interested in the concept of "generalized inverses", of which Lagrange multipliers include several great examples (to be demonstrated shortly). The algebra of these is a bit unfamiliar so it's helpful to play with some examples. More generally I think there are a few concepts (generalized inverses, pseudoinverses, dual bases, vector division, frames) that ought to be more widely used, and I intend for this to be an example of why.

Three, various applications of Lagrange multipliers in physics (Lagrangian mechanics, QFT, statmech) seem to imply that Lagrange multipliers are an incredibly deep and important concept, far beyond their initial impression, and I want to understand how and why.

Disclaimer: this is _not_ a pedagogical treatment of the subject. It's me doing it in a weird way to get a chance to play with generalized inverses and some other weird ideas. Consider yourself warned.

-------

# 1. Lagrange Multipliers as inverting a projection

Here is what I think is the most intuitive explanation of Lagrange multipliers. It is somewhat more complex than the standard explanations, but worth it because it's "natural" in a way that most explanations are not. Maybe someday it will be not be viewed as more complex when everyone's used to doing this kind of math. For the sake of being legible to a broader range of backgrounds, I'll start with some exposition about multivariable functions and how to think about the optimization problem.

Okay. We wish to find the maximum value of $$f(\b{x}): \bb{R}^n \ra R$$ subject to the constraint that $$g(\b{x}) = c$$. (In general we'll be working with functions on $$\bb{R}^n$$, but when writing out examples I'm just going to act like they're in $$\bb{R}^3$$ to save on notation.)

We'll assume that $$f$$ and $$g$$ are both well-behaved smooth functions and that $$\del g \neq 0$$ anywhere, so it defines a [regular surface](https://en.wikipedia.org/wiki/Regular_surface_(differential_geometry)), which we'll call $$G$$. Being regular basically means that it doesn't have sharp corners or, like, glitches, anywhere. Picture a nice smooth shape, like a sphere.


$$G = g^{-1}(c) = \{ \b{x} \, \| \, g(\b{x}) = c \}$$

Since $$G$$ is defined by the solutions to a single constraint $$g$$, it has a single tangent vector $$\del g$$. The change of $$g$$ along a vector $$\b{v}$$ given by its directional derivative, which is the dot product with $$\del g$$: $$dg(\b{v}) = \del g \cdot \b{v}$$. Hence $$\del g$$ is the _only_ direction along which the value of $$g$$ changes. Along the other $$(n-1)$$ dimensions it does not change value, so if $$g(\b{x}) = c$$ at some point there are $$(n-1)$$ directions you can move along which it _stays_ at $$c.$$ Hence $$G$$ is an $$(n-1)$$-dimensional surface. For instance, a circle or line in $$\bb{R}^2$$, or a sphere or plane in $$\bb{R}^3$$. Most of this argument will work for $$G$$ of any dimension, and in the next section we'll repeat this for more constraints, which makes $$G$$ lower-dimensional. But the algebra gets more complicated. Better to start with one constraint and $$(n-1)$$-dimensional $$G$$.

We wish to find the maximum of $$f$$ on $$G$$. How?

In 1d calculus we would look for the maximum of $$f$$ at points that have $$\frac{df}{dx} = 0$$. Maybe those points are a maximum, or a minimum, or otherwise just a stationary point where it becomes flat for a while but keeps going the same way afterwards (we'd have to check the second derivative to know). And if they're a maximum, maybe they're the global maximum or maybe not, we'd have to check. In any case, those would be the points that we're interested in.

Similarly, for a multivariable function in the absence of a constraint, we would search for a maximum by looking for points that have gradient $$\del f = (f_x, f_y, f_z) = 0$$, and we'd test if they're a local maximum by looking at the signs of the eigenvalues of the second derivative. All negative means it's a maximum, because the function decreases in every direction (equivalently: along any 1d slice it has negative second derivative). And of course we'd have to compare all the points we found and see which one is the global max, etc.

When we limit to points on the surface $$G$$, we are not necessarily interested in the local or global maxima of the whole function $$f$$ anymore. A global maximum point of $$f$$ would still be a maximum if it _happened_ to be on $$G$$, but if it did not lie on $$G$$ then we would not care about it at all. Meanwhile the maximum that's on $$G$$ may not have $$\del f = 0$$ at all; it could just be some random value in the middle of $$f$$'s range.

Example: suppose $$G$$ is the surface $$g(x,y) = x^2 + y^2 = R^2 = c$$, a circle of radius $$R$$ around the origin, and suppose $$f$$ the function we are maximizing is just $$f(x) = x$$, the $$x$$ coordinate. There is no global maximum ($$f$$ increases as you head in the $$+x$$ direction forever), but the maximum on $$G$$ is clearly the point $$(x,y) = (R, 0)$$, since it's the most $$x$$-ward point on the circle. Yet the gradient at that point is $$\del f = (1,0)$$, which is certainly not zero.

The reason that $$\del f = 0$$ is no longer condition for a maximum is that that we are really interested in only $$f$$'s derivative _when $$f$$ is restricted to_ $$G$$. As we move in directions that _are_ on $$G$$, how does $$f$$ change? If it's constant, then we are at a local stationary point of $$f$$. In the circle example: at the solution point $$(x,y) = (R, 0)$$, the gradient of $$f$$ is $$\del f = (1,0)$$, but the circle is going in the $$\pm \hat{y} = (0, \pm 1)$$ direction, so the gradient of $$f$$ _along_ $$G$$ is $$0$$.

How do we express the derivative of $$f$$, but restricted to $$G$$, as an equation? What we are looking for might be called the "surface derivative" of $$f$$, with respect to the surface $$G$$, written $$\del_G f$$.[^covariant] It's simply the regular derivative but projected onto the surface, which chops off any change that isn't along $$G$$:

$$\del_G f = \proj_G \del f$$

And the condition for the maxima of $$f$$ is that the surface derivative is zero:

$$\boxed{\del_G f = 0}$$

[^covariant]: This is closely related to the [covariant derivative](https://en.wikipedia.org/wiki/Covariant_derivative), but it's a bit simpler because it's the derivative of a scalar instead of a vector. Normallyone talks about the covariant derivative of a tensor field, whereupon it does two things: (a) it restricts the full derivative to the surface you're on, and (b) it includes a number of additional terms which account for how the basis vectors change in space as well. But it's totally valid to define a covariant derivative of a _scalar_ field, in which case it's only the first part, the projection onto the surface.
    
    The covariant derivatives that you see in GR or in abstract Differential Geometry are usually doing this for a surface that's _not_ embedded in space, by deriving the covariant derivative from the metric or a connection. But this version is the "classical" version, which is quite a bit simpler and easier to think about.

I'm using $$\proj_G$$ to mean the [vector projection](https://en.wikipedia.org/wiki/Vector_projection) operator, which takes a vector to another vector (not to be confused with the [scalar projection](https://en.wikipedia.org/wiki/Scalar_projection), which just gives the _components_ of the vector projection). It lops off components that don't lay in the surface. For instance we could project a vector $$\b{v} = (v_x, v_y, v_z)$$ onto the $$xy$$ plane, which would be given by $$\proj_{xy}(\b{v}) = (v_x, v_y, 0)$$.

For some reason people usually think of projections like $$\proj_G$$ as abstract "operators", basically functions on vectors. But it is representable as a matrix, and is easier to think about in that form. When we're thinking of it as a matrix I'll write a dot product symbol instead, as $$\proj_G \cdot \del f$$.

So what's the matrix form of $$\proj_G$$? Well, the information we have about $$G$$ is that $$\del g$$ points in the direction orthogonal to $$G$$. Therefore to get only the parts of a vector that lay _on_ the surface $$G$$, we just have to remove the parts that _aren't_ on $$G$$, which is the projection onto $$\del g$$

$$\proj_G \del f = (I - \proj_{\del g}) \cdot \del f$$

(With $$I$$ as the identity matrix.) The projection onto the gradient $$\proj_{\del g}$$ is another matrix, which we can write down more easily. What it does to vectors is perhaps familiar from multivariable calculus: 

$$\proj_{\del g} (\b{v}) = \frac{\del g \cdot \b{v}}{\| \del g \|^2} \del g$$

Although I prefer to write it in this more symmetric way:

$$\proj_{\del g}(\b{v}) = \frac{\del g}{\| \del g \|} [ \frac{\del g}{\| \del g \|}  \cdot \b{v}]$$

With $$\b{n} = \frac{\del g}{\| \del g \|}$$ it's

$$\proj_{\del g}(\b{v}) = (\b{n} \cdot \b{v}) \b{n}$$

A more sophisticated to write this, without having to specify the vector $$\b{v}$$, is with a tensor product:

$$\proj_{\del g} = \frac{\del g}{\| \del g \|} \o \frac{\del g}{\| \del g \|} = \b{n} \o \b{n}$$

And it is cleaner if we also adopt [dyadic notation](https://en.wikipedia.org/wiki/Dyadics), in which we shorten $$\b{n} \o \b{n}$$ to $$\b{nn}$$:

$$\proj_{\del g} = \b{nn}$$

All of these are ways of writing the projection $$\proj_{\del g}$$ onto the vector $$\del g$$. It doesn't matter which one you use. The important part is that they express $$\proj_{\del g}$$ as a matrix, and then

$$\proj_G \del f = (I - \proj_{\del g}) \del f = 0$$

Is the constraint obeyed by $$\del f$$ at its stationary points on $$G$$.

Here is one more version. Suppose we happen to have a coordinate system $$(u,v)$$ on the surface $$G$$; don't ask me how we got it. Then locally there is a frame of unit vectors $$(\b{u}, \b{v}, \b{n})$$ with $$\b{n} = \frac{\del g}{\| \del g \|}$$ as before. The identity matrix is then $$I = \b{uu} + \b{vv} + \b{nn}$$, which is equivalent to writing $$\text{diag}(1,1,1)$$ in the $$(u,v,n)$$ coordinate system. Then we can write $$I - \b{nn} = \b{uu} + \b{vv} = \text{diag}(1,1,0)$$. That is, there is a basis $$(\b{u}, \b{v}, \b{n})$$ in which these are true:

$$
\begin{aligned}
\proj_G &= I - \b{nn} \\
&= (\b{uu} + \b{vv} + \b{nn}) - \b{nn} \\
&= \b{uu} + \b{vv} \\
&= \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 0 \end{pmatrix}
\end{aligned}
$$

Which is so simple that it felt worth mentioning. After all this is all a projection is: if it removes one dimension from a vector, of course there's a basis in which it preserves the other two dimensions but gets rid of one, right? It is often helpful to imagine coordinates like this to make the algebra more concrete (much more on this some other day...). But mostly we will not use this form.

-------

So the condition on points on $$G$$ which maximize $$f$$ is that

$$\del_G f = \proj_G \del f = 0$$

This doesn't require that $$\del f = 0$$ itself. Yes, $$\del f$$'s components in the $$(n-1)$$ directions on the surface $$G$$ are zero, but there's one more direction besides those, the direction $$\del g$$, along which it can be whatever it wants. Therefore at the solutions $$\del f$$ only has to be proportional to that remaining direction, $$\del g$$:

$$\del f \propto \del g$$

The proportionality constant $$\lambda$$ is an unspecified variable, called the Lagrange Multiplier.

$$\del f = \lambda \del g$$

When we solve the equation we'll come up with both a point $$\b{x}^*$$ and a value of $$\lambda^*$$ as the solution. $$\lambda^*$$ has an interesting interpretation which we'll talk about later, but for now just notice that its value doesn't matter for this to be a solution. It just shows up a side effect of setting all the other components of $$\del f$$ to zero.[^zero]

[^zero]: Note that if $$\del g$$ happened to be $$0$$, meaning that $$g(\b{x})$$ is locally constant, then $$\del f$$ has to equal $$0$$ as well: it once again has $$n$$ constraints instead of $$n-1$$, and there's no free parameter; it has to be an actual stationary point of $$\del f$$ on its own. We're not dealing with this case, as we've assumed that $$\del g \neq 0$$. But it's worth thinking about. If it was zero anyway then $$G$$ would switch from being $$(n-1)$$-dimensional to $$(n)$$-dimensional, so a volume instead of a plane in $$\bb{R}^3$$.

There is a nicer way to come up with $$\del f = \lambda \del g$$:

We had written $$\proj_{G} \cdot \del f = 0$$. Well, the projection operator has a simple [generalized inverse](https://en.wikipedia.org/wiki/Generalized_inverse):[^gen] since it takes one dimension, the direction $$\del g$$, to $$0$$, then the preimage of $$0$$ can have any component along $$\del g$$. We write this as a free parameter $$\lambda$$:

[^gen]: I use "generalized inverse" to refer to the preimage of an operation, but written as an algebraic object that includes free parameters as necessary to be correct. For instance the generalized inverse of $$0 \times a = 0$$ is $$a = \lambda$$, meaning any real number. See also [this other post]({% post_url 2023-09-25-inverses %}).

$$
\begin{aligned}
\proj_G \del f &= 0 \\
\del f &= \proj_G^{-1}(0) \\ 
&= \lambda \del g \\
\end{aligned}
$$

This is the same as just "noticing it", except that it treats dividing through by $$\proj_G$$ as an explicit algebraic operation. To me that's a big improvement. I like how that makes the free $$\lambda$$ parameter show up through what could be rote algebra instead of any sort of trick. Invert a projection, get a free parameter. Easy. Also it's easy to see how it generalizes: if, for instance, $$\proj_G$$ projected out two dimensions instead, we'd get two free parameters. More on that in a second.

So far $$\del_G f = 0$$ was a condition that we expected to be fulfilled at certain points, the maxima $$\b{x}^*$$. _At_ those points we'll write everything with asterixes: $$f^* = f(\b{x}^*)$$, $$g^* = g(\b{x}^*) = c$$, $$\del f^* = \del f(\b{x}^*)$$, $$\del g^* = \del g(\b{x}^*)$$. Then the relation at a solution is

$$\del f^* = \lambda^* \del g^*$$

We can just solve for $$\lambda^*$$:

$$\lambda^* = \frac{\del f^*}{\del g^*}$$

Yes, that's division by a vector. It's an unorthodox notation that I like. The meaning is that $$\b{a}/\b{b} = (\b{a} \cdot \b{b})/\| \b{b} \|^2$$, so this really says that:

$$\lambda^* = \frac{\del f^* \cdot \del g^*}{\| \del g^* \|^2}$$

Note that had we included one more factor of $$\del g^*$$, it would turn this back into the expected projection:

$$\lambda^* \del g^* = \frac{\del f^* \cdot \del g^*}{\| \del g^* \|^2} \del g^* = \proj_{\del g^*} \del f^*$$

This tends to happen when you extend division to vectors and matrices: $$\frac{\b{b}}{\b{a}} \b{a} = \proj_{\b{a}} \b{b}$$. We'll see a lot more of it in a moment.

So that's the value of $$\lambda^*$$: it's the ratio of the derivatives of $$f$$ and $$g$$. We'll talk about what it means later. First let's do this again with more than one constraint because it gets more interesting.

--------

# 2. Handling Multiple Constraints with the Pseudoinverse

Now suppose we have $$k$$ constraints $$\{\, g_i(\b{x}) = c_i^* \, \}$$ instead of just one, and we're trying to solve:

> maximize $$f(\b{x})$$
> subject to all of the $$g_i(\b{x}) = c_i$$ at once.

Each constraint defines a surface $$g_i^{-1}(c_i)$$, and the intersection of all those surfaces is the surface $$G$$ that we want $$f$$ to live on:

$$G = g_1^{-1}(c_1) \cap g_2^{-1}(c_2) \cap \ldots$$

We'll need a few assumptions. We assume that the surfaces defined by the constraints actually _do_ all intersect, and that at the points where they intersect, they're not parallel to each other (this would happen, for instance, with two spheres that touch at a point). Equivalently, the set $$\{ \del g_i \}$$ is linearly independent and $$\text{\span}(\{ \del g_i \})$$ is a $$k$$-dimensional subspace of $$\bb{R}^n$$. This second assumption is not critical but it makes the math easier for now. 

Each constraint defines an $$(n-1)$$ dimensional surface, e.g. the surface of a sphere in $$\bb{R}^3$$. In general the intersection of two such surfaces can have various dimensions: $$(n-2)$$, such as two spheres intersecting in a circle, or $$(n-1)$$ again, such as the _same_ sphere intersected with itself, or they could only intersect in a point ($$0$$-dimensional?) or not at all (...no idea what to call that). But by our assumptions that they do intersect and they're not parallel when they do, we get to assume the intersection of the $$k$$ constraints is $$(n-k)$$-dimensional as well.

The stationary points of $$f$$ on $$G$$, are still given by setting the surface derivative with respect to this surface $$G$$ to zero:

$$\del_G f = \proj_G \del f = 0$$

For exactly the same reason as before: a point at which $$f$$ is maximized has no direction on $$G$$ in which you can move to increase it, hence its derivative _on $$G$$_ is zero.

Also as before, we can in principle solve this by inverting the projection:

$$
\begin{aligned}
\del_G f &= 0 \\
\proj_G \del f &= 0\\
\del f &= \proj_G^{-1}(0) 
\end{aligned}
$$

And again the solution is going to be a bunch of free parameters, one for each direction that the projetion erases. These directions form $$G_{\perp}$$, the orthogonal complement to $$G$$, which is spanned by gradients of the constraints: $$G_{\perp} = \text{\span}(\{ \del g_i \})$$. So $$\del f$$ is therefore a linear combination of the vectors in $$G_{\perp} = \text{span}(\del g_1, \del g_2, \ldots)$$:

$$
\begin{aligned}
\del f &= \proj_G^{-1}(0) \\
&= \lambda_1 \del g_1 + \lambda_2 \del g_2 + \ldots \\ 
\end{aligned}
$$

Where the $$\{ \lambda_i \}$$ are our Lagrange multipliers. Easy. I still like the generalized inverse. But last time we came up an explicit form for $$\lambda^*$$: it was $$\lambda^* = \del f^*/\del g^*$$. How would we do that here?

First, some more notations. We'll write the list of constraints and list of constraint values as vectors:

$$
\begin{aligned}
G_{\perp} &= (g_1, g_2, \ldots, g_k) \\
G_{\perp}^* &= (g_1^*, g_2^*, \ldots, g_k^*) \\
&= (c_1, c_2, \ldots, c_k)
\end{aligned}
$$

And the gradients become a $$n \times k$$ matrix (or is it $$k \times n$$? Eh, doesn't matter):

$$\del G_{\perp} = \{ \del g_1, \del g_2, \ldots \}$$

The reason for writing the list of constraints as $$G_{\perp}$$ instead of $$G$$ is that $$\del G_{\perp}$$ is the list of vectors _orthogonal_ to the surface $$G$$, which span the _subspace_ $$G_{\perp}$$, so we probably shouldn't write them as $$\del G$$. Also, it kinda makes sense: except at the solution values $$G_{\perp}^*$$, the constraints describe points that _aren't_ on the surface $$G$$.

In this notation the solution from before can be written as

$$
\begin{aligned}
\del f &= \proj_G^{-1}(0) \\
&= \lambda_1 \del g_1 + \lambda_2 \del g_2 + \ldots \\ 
&= \vec{\lambda} \cdot \del G_{\perp}
\end{aligned}
$$

This makes it clear that it is a linear equation of the form $$A \b{x} = \b{b}$$, albeit for non-square $$A$$. Here's another way to write it. Starting from $$\proj_G \del f = 0$$, instead of just inverting $$\proj_G$$ and reasoning that it ought to be in $$\text{span}(\del G_{\perp})$$, we could use $$\proj_G = I - \proj_{\perp G}$$ and rearrange the terms:

$$
\begin{aligned}
(I - \proj_{\perp G}) \del f &= 0 \\ 
\del f &= \proj_{\perp G} \del f 
\end{aligned}
$$

This is another way to write the condition on $$f$$ at the solution, which is equivalent to saying that $$\del f \in \proj_G^{-1}(0) = \vec{\lambda} \cdot \del G_{\perp}$$.

---------

We'd like an algebraic version of both of these: a way of writing $$\proj_{\perp G} \del f $$ that explicitly gives the values of $$\vec{\lambda}$$ in $$\vec{\lambda} \cdot \del G_{\perp}$$. But it is not so obvious how to write down $$\proj_{\perp G}$$. Maybe you'd guess something like $$(I - \proj_{\del g_1} - \proj_{\del g_2} \ldots)$$, but no. The problem is that all the constraints may be generally non-orthogonal, so we'd be projecting off the same components twice if we did that.

Example: consider if there are just two gradients $$(\del g_1, \del g_2)$$. The value we want for $$\proj_{\perp G}$$ is something like "remove the projection onto $$\del g_1$$, and then remove the projection onto $$\del g_2$$ but only the part of it that we didn't already remove along $$\del g_1$$". If $$\del g_1 = \b{x}$$ and $$\del g_2 = \b{x} + \b{y}$$ then $$\proj_{\perp G}$$ should be $$I - \b{xx} - \b{yy} = \b{zz}$$. We could write it generically as:[^gs] $$\proj_{\perp G} = I - \proj_{\del g_1} - [\proj_{\del g_2 - \proj_{\del g_1} \del g_2}]$$, but that's pretty hard to use. What's the general form?

[^gs]: Incidentally the projections $$(\del g_1, \del g_2 - \proj_{\del g_1} \del g_2, \ldots)$$ here would, after you normalize them, form a [Gram-Schmidt basis](https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process) for $$(\del g_1, \del g_2)$$. But that's not the best way to do it.

The answer is that we need to use something that acts like the inverse of the matrix $$\del G_{\perp}$$, called the [pseudoinverse](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse). I tend to write it as $$\frac{1}{\del G_{\perp}}$$ or $$(\del G_{\perp})^{-1}$$ without making a distinction from the regular inverse, although most people use a different symbol such as $$(\del G_{\perp})^+$$. If $$\del G_{\perp}$$ is $$k \times n$$ then $$1/\del G_{\perp}$$ is $$n \times k$$. Using the pseudoinverse we can simply "divide through" by $$\del G_{\perp}$$:[^indices]

[^indices]: To be precise we'd want to notate which indices of the matrices are contracted with each other, but let's not. Anyway there is really only one sensible way to do it.

$$
\begin{aligned}
\del f &= \vec{\lambda} \cdot \del G_{\perp} \\ 
&\Ra \\
\vec{\lambda} &= \frac{\del f}{\del G_{\perp}}
\end{aligned}
$$

Here is a blurb about it.

<aside id="pseudoinverse">

**The Pseudoinverse**

We are trying to solve the equation

$$\del f = \vec{\lambda} \cdot \del G_{\perp}$$

for $$\vec{\lambda}$$. This has the form

$$A \b{x} = \b{b}$$

Where $$A = \del G_{\perp}$$, $$\b{x} = \vec{\lambda}$$, and $$\b{b} = \del f$$. But $$A$$ is not square (it's $$k \times n$$), much less invertible, so we can't just solve it by writing $$\b{x} = A^{-1}(\b{b})$$. Or can we?

Consider what $$A \b{x} = \b{b}$$ means. Suppose $$A = (\b{a}_1, \b{a}_2, \ldots)$$ and that all of the $$\b{a}$$ are linearly independent. Then we are searching a set of coefficients $$\b{x} = (b_1, b_2, \ldots)$$ such that we can write

$$\b{b} = A \b{x} = b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots \tag{maybe works}$$

This isn't always possible, because maybe $$\b{b}$$ is _not_ a sum of the columns of $$A$$ (that is, maybe $$\b{b} \notin \text{col}(A)$$, the column space of $$A$$). What we can _always_ do, though, is project $$\b{b}$$ onto the column space of $$A$$, which we'll write as:

$$\proj_A \b{b} = b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots \tag{always works}$$

The coefficients $$(b_1, b_2, \ldots)$$ always exist, and will be given by the pseudoinverse of $$A$$:

$$(b_1, b_2, \ldots) = \frac{\b{b}}{A}$$

Normally people do not write the pseudoinverse like this; they like to write something like $$A^+(\b{b})$$. They are reluctant to write something that's not a true inverse as $$A^{-1}$$. But I think this is the better meaning of the symbol: it's much more general and reduces to the usual meaning in simple cases. So I'm going to write $$A^{-1}$$ or $$1/A$$ anyway.

Once we have those components we can multiply by $$A$$ again to reconstruct $$\proj_A \b{b}$$:

$$\proj_A \b{b} = \frac{\b{b}}{A} \cdot A =  b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots $$

Which, when $$\b{b} \in \text{span}(A)$$, is just $$\b{b}$$ again. Generally speaking multiplying by $$A^{-1}$$ and then $$A$$ again becomes the projection onto $$A$$. In fact this is the defining quality of the pseudoinverse: that although $$A^{-1} A \neq I$$ like a regular inverse, it does have $$A^{-1} A = \proj_A$$ and $$A A^{-1} A = A$$ again. 

(If you're curious: the actual construction of the pseudoinverse uses the wedge product: $$b_1 = \frac{\b{b} \^ \b{a}_2 \^ \b{a}_3 \ldots}{\b{a}_1 \^ \b{a}_2 \^ \b{a}_3 \ldots}$$, $$b_2 = \frac{\b{a}_1 \^ \b{b} \^ \b{a}_2 \^ \ldots}{\b{a}_1 \^ \b{a}_2 \^ \b{a}_3 \ldots}$$, etc, and then you recast it as a matrix. When $$k = n$$ this becomes the matrix inverse exactly; the numerator is $$\text{adj}(A)$$ and the denominator is $$\det(A)$$. Another (simpler but less-insightful) way to construct it is as $$A^{-1} = (A^T A)^{-1} A^T$$.)

By the way, another way of looking at $$1/A$$ is that it is the matrix form of the [dual basis](https://en.wikipedia.org/wiki/Dual_basis) of the columns of $$A$$: its columns are "dual basis vectors" $$\{ \b{a}^*_i \}$$ that have $$\b{a}^*_i \cdot \b{a}_{j} = \delta_i^j$$. Then each component is just given by a dot product with a dual basis vector: 

$$
\begin{aligned}
\b{a}^*_i \cdot \b{b} &= \b{a}^*_i \cdot (b_1 \b{a}_1 + b_2 \b{a}_2) + \ldots \\
&= b_1 (\b{a}^*_i \cdot \b{a}_1 )+ b_2 (\cancel{\b{a}^*_i \cdot \b{a}_2}) + \ldots \\ 
&= b_1 \\
\frac{\b{b}}{A} &= (\b{a}^*_1 \cdot \b{b}, \b{a}^*_2 \cdot \b{b}, \ldots) \\ 
&=(b_1, b_2, \ldots) \\
\end{aligned}
$$

Which makes the algebraic behavior nice and clear.

Note that all of this only works as written if the vectors in $$A$$ are all linearly independent. Otherwise there would be multiple choices for the $$b_i$$. For instance if $$A = (\b{a}_1, 2 \b{a}_1)$$ then $$\proj_A \b{b} = b_1 \b{a}_1 + 2 b_2 \b{a}_1 = (b_1 + 2 b_2) \b{a}_1$$ and there's more than one way to select $$b_1$$ and $$b_2$$ to get the same result. If this happened we could still express the answer in terms of the full _generalized inverse_ of $$A$$: there would be even more free parameters to tell us _which_ of the equivalent representations to use, something like $$(b_1, b_2) = (\lambda, \frac{1 - \lambda}{2})$$. But I'd rather not think about that.

The terms "pseudoinverse" and "generalized inverse" are not exactly standardized, but I've settled on a way of using them. A pseudoinverse inverts only the parts of $$A$$ that are not projections, and produces a single value. A generalized inverse inverts all of $$A$$, including the parts that are projections, and therefore produces free parameters. The general relationship between the pseudoinverse and the generalized inverse of a matrix $$A$$ is that

$$
\begin{aligned}
A_{\text{generalized}}^{-1}(\b{b}) &=  A_{\text{pseudo}}^{-1}(\b{b}) + (I - A_{\text{pseudo}}^{-1} A) \cdot \vec{\lambda}\\
&= A_{\text{pseudo}}^{-1}(\b{b}) + \proj_{\perp A} \cdot \vec{\lambda} \\
\end{aligned}
$$

For some vector of free parameters $$\vec{\lambda}$$. Since $$A_{\text{pseudo}}^{-1} A = \proj_A$$, the remainder $$I - A_{\text{pseudo}}^{-1} A = \proj_{\perp A}$$ is the projection onto the nullspace of $$A$$. (Sometimes you will see $$\proj_{\perp A}$$ written as $$I_{\perp A}$$.)

(Hm, it does seem like it would be nice have different notations for $$A_{\text{generalized}}^{-1}$$ and $$ A^{-1}_{\text{pseudo}}$$. But the only thing I can think of is the $$A^+$$ notation for the pseudoinverse, and I dislike that too much to use it.)

Note that the the vector projection that I wrote earlier using vector division is jsut the $$k=1$$ case of the matrix pseudoinverse:

$$\frac{\b{b}}{\b{a}} \b{a} = \frac{\b{b} \cdot \b{a}}{\| \b{a} \|^2} \b{a} = \proj_{\b{a}} \b{b}$$

The general form is:

$$\frac{\b{b}}{A} A = \proj_A \b{b}$$

</aside>

To summarize: we can write the projection onto the list of vectors $$\del G_{\perp} $$ like this, using the pseudoinverse $$1/\del G_{\perp}$$:

$$\proj_{\del G_{\perp}} \del f = \frac{\del f}{\del G_{\perp}} \cdot \del G_{\perp}$$

Which is equivalent to the Lagrange multiplier form, with $$\vec{\lambda} = \frac{\del f}{\del G_{\perp}}$$:

$$\proj_{\del G_{\perp}} \del f = \vec{\lambda} \cdot \del G_{\perp}$$

And the condition satisfied by $$f$$ at the maximum on $$G$$, which was that $$\del_G f = 0$$, is equivalent to saying that $$\del f$$ is its projection onto $$\del G_{\perp}$$:

$$\del f = \vec{\lambda} \cdot \del G_{\perp}$$

When the condition holds we have a stationary point $$\b{x}^*$$, and we write

$$\vec{\lambda}^* = \frac{\del f^*}{\del G^*_{\perp}}$$

Which is the multi-constraint equivalent of what $$\lambda^* = \del f^* / \del g^*$$ was for a single constraint.

-----


# 3. The Meaning of $$L$$, part 1

So that is what's going on with the Lagrange multiplier solution. Now let's move on to some of the other issues. In particular, what is going on with that bizarre trick where you write $$L = f - \lambda g$$ and compute $$\del L = 0$$ instead?

Specifically the technique is this:

Instead of maximizing $$f(\b{x})$$ on the surface $$g(\b{x}) = g^*$$ over all values of $$x$$, construct a new function called a "Lagrangian":

$$L(\b{x}, \lambda) = f(\b{x}) - \lambda (g(\b{x}) - g^*)$$

or with multiple constraints:

$$L(\b{x}, \vec{\lambda}) = f(\b{x}) - \vec{\lambda} \cdot (G_{\perp}(\b{x}) - G_{\perp}^*)$$

and maximize that instead, with respect to both variables $$\b{x}$$ and $$\lambda$$. The condition $$\del_{\b{x}, \lambda} L = 0$$ becomes:

$$\begin{cases}
\del_{\b{x}} L = \del f - \lambda \del g &= 0 \\
\del_\lambda L = g(\b{x}) - g^* &= 0 \\
\end{cases}$$

The second clause just encodes the original constraint again, while the first is the Lagrange multiplier constraint. Cute? But... why? It just seems like a hack pulled out of thin air. What is going on?[^confuse]

[^confuse]: I am far from the [only one](https://math.stackexchange.com/questions/1392280/lagrange-multiplier-method-why-is-the-langragian-function-defined-as-fx-y-l) confused by this, and as often happens, all the repliers on that question are confused by the fact that the questioner is confused about it. But I agree with the questioner: "noticing" you can write $$L = f - \lambda g$$ and optimize $$\del L = 0$$ instead is just weird. There needs to be some sort of elegant reason for why that works.

Perhaps we can do better.

---------

First let's adjust the notations a bit. So far I've been writing $$\del f$$ everywhere. It will be nicer to write these as differentials instead of derivatives:

$$
\begin{aligned}
d_G f &= \proj_G d f \\
&= df - d_{\perp G} f \\
&= (I - \proj_{\perp G}) df \\ 
&= d f - \frac{d f}{d G_{\perp}} d G_{\perp} \\
\end{aligned}
$$

As a reminder the differential notation works like this, for $$d \b{x} = (dx, dy, dz)$$:

$$df = \del f \cdot d \b{x} = \frac{\p f}{\p \b{x}} \cdot d \b{x} = f_x d x + f_y d y + f_z d z$$

If we had some coordinates $$(u,v)$$ on $$G$$ and $$(n)$$ on $$G_{\perp}$$, then we could write $$d_G f = f_u d u + f_v d v$$ and $$d_{\perp G} = f_n d n$$. We are just splitting the differential into a part parallel and perpendicular to $$G$$. A generic way to write this for any dimension is

$$df = d_G f + d_{\perp G} f = \frac{\p f}{\p G} dG + \frac{\p f}{\p G_{\perp}} dG_{\perp}$$

Where $$\frac{\p f}{\p G} dG = \frac{\p f}{\p (u, v)} \cdot (d u, d v) = f_u \d u + f_v \d v$$ and $$\frac{\p f}{\p G_{\perp}} dG_{\perp} = f_n dn$$.[^frame]

[^frame]: The matrices $$d G$$ and $$d G_{\perp}$$ can be thought of as [frames](https://en.wikipedia.org/wiki/Frame_of_a_vector_space), which are like bags of arbitrary numbers of vectors, and their pseudoinverses $$\frac{1}{d G}$$ and $$\frac{1}{d G_{\perp}}$$ are their dual frames.

These notations work even if we don't _know_ the $$(u,v)$$ coordinate system. This is why differentials are nicer: they make it clear that the derivatives are actually coordinate-independent and could happen in whatever coordinate system you like: they care only about the _surface_ $$G$$, not the specific implementation of $$G$$ in particular coordinates.

So, $$d_G f$$ is the differential version of $$\del_G f$$, which we might call the surface differential. It's the part of $$f$$'s differential that lives on the surface $$G$$.

An interesting thing we can do is attempt to linearly approximate $$f$$ in terms of its surface differential. We start with the expansion of $$d_G f$$:

$$
\begin{aligned}
0 &= d_G f \\
&= df - \frac{d f}{d G_{\perp}} dG_{\perp} \\
\end{aligned}
$$

We then fix the value of $$\frac{d f}{d G_{\perp}}$$ to be a _constant_ value, called $$\vec{\lambda}$$. Then we approximate $$f$$ to first-order around the point $$\b{x} = \b{x}^*$$, exactly as if we were approximating $$f(x) = f(x^*) + f'(x^*) \int_{x^*}^x dx = f(x^*) + f'(x^*) (x - x^*)$$ in 1d:

$$
\begin{aligned}
f(\b{x}) &= f(\b{x}^*) + \int_{\b{x}^*}^{\b{x}} d_G f \\ 
&= f(\b{x}^*) + \int_{\b{x}^*}^{\b{x}} df - \frac{d f}{d G_{\perp}} dG_{\perp}  \\
&\approx f(\b{x}^*) + \int_{\b{x}^*}^{\b{x}} df - \vec{\lambda} \, dG_{\perp}\\
&= f(\b{x}) - \vec{\lambda} (G_{\perp}  - G_{\perp}^*) \\
&= L(\b{x}, \vec{\lambda}) \\
\end{aligned}
$$

This feels close to the true meaning of $$L$$: with the substitution, $$L(\b{x}, \frac{d f}{d G_{\perp}})$$ is $$f$$ with its change along $$G_{\perp}$$ removed.  I imagine writing this as $$\proj_G f$$, the projection of a function onto a surface rather than a vector field. It's "the local approximation to $$f$$, but only the part on $$G$$". As if somebody had said:

> instead of solving $$\del_G f = 0$$
> define $$L$$ such that $$\del L = \del_g f$$ around the solution, and set $$\del L = 0$$ instead

Another way of thinking about this: we can approximate a point $$\b{x}$$ near $$\b{x}^*$$ as

$$\b{x} \approx \b{x}^* + \b{x}_G (G - G^*) + \b{x}_{G_{\perp}}  (G_{\perp} - G_{\perp}^*)$$

Where again we've written the point in some imaginary $$G$$ coordinates (like the $$(u,v)$$ above) and $$G_{\perp}$$ coordinates (which we have, they're the values of the constraints). The $$\b{x}_G  = \frac{d \b{x}}{d G}$$ are the derivatives of the coordinate changes (Jacobians, if you want; hate that name). Naturally $$f$$ can be expanded in terms of these:

$$
\begin{aligned}
f(\b{x}) 
&\approx f(\b{x}^* + \b{x}_G  (G - G^*) + \b{x}_{G_{\perp}}  (G_{\perp} - G_{\perp}^*)) \\
&\approx f(\b{x}^*) + (\del f) \frac{d \b{x}}{d G}  (G - G^*) + (\del f) \frac{d \b{x}}{d G_{\perp}} (G_{\perp} - G_{\perp}^*) \\
&= f(\b{x}^*) + \frac{d f}{d G} (G - G^*) + \frac{d f}{d G_{\perp}}  (G_{\perp} - G_{\perp}^*)
\end{aligned}
$$

Where we have used $$(\del f) \b{x}_G  = \frac{d f}{d \b{x}} \frac{d \b{x}}{d G} = \frac{d f}{d G}$$. Then $$L(\b{x}, \frac{d f}{d G_{\perp}})$$ is:

$$
\begin{aligned}
L &= f(\b{x}) - \frac{df}{dG_{\perp}}  (G_{\perp} - G_{\perp}^*) \\
&= f(\b{x}^*) + \frac{df}{dG_{\perp}} (G - G^*)
\end{aligned}
$$

It is as if there was a coordinate system $$(G, G_{\perp})$$ on space, where the $$k$$ constraints give coordinates on all the level sets and the other $$G$$ variables are unspecified. Then $$L(\b{x}, \frac{df}{dG_{\perp}})$$ is $$f$$, expanded only in terms of the $$G$$ coordinates.

-------

# 4. The meaning of $$L$$, part 2: the Envelope Theorem

But this can't be the full story, because $$L$$ is a function of $$\vec{\lambda}$$ in general, and we have to solve for that also: the solution is given by both $$L_{\b{x}} = 0$$ and $$L_{\vec{\lambda}} = 0$$. Why?

I don't know that I understand the full reason, but here are some observations.

First, it seems to be meaningful to do calculations directly on $$L$$, with $$\vec{\lambda}$$ unspecified, due to the weird way that maximizing functions interacts with calculus. 

There is a thing called the [envelope theorem](https://en.m.wikipedia.org/wiki/Envelope_theorem) which is mostly used by economists. It says: suppose you want to know how the optimal value $$f(\b{x}^*)$$ depends on some parameter $$\alpha$$, where all the parts of the system can be changed by changing $$\alpha$$ (which could be a scalar parameter or a vector of parameters). So we are solving $$f(\b{x}, \alpha)$$ subject to the constraint $$G_{\perp}(\b{x}, \alpha) = 0$$ (we'll fold the $$G_{\perp}^*$$ term into the $$\alpha$$ now). Then the derivative $$d f^*/d\alpha$$ is given by taking a partial derivative of $$L^*$$ instead:

$$\frac{df^*(\alpha)}{d \alpha} = \frac{\p L(\b{x}^*, \alpha)}{\p \alpha} = \frac{\p f(\b{x}^*, \alpha)}{\p \alpha} - \vec{\lambda} \cdot \frac{\p G_{\perp}(\b{x}^*, \alpha)}{\p \alpha}$$

Note that this is kinda _weird_. "The way that the _optimal_ value changes as you vary the parameters is given by how $$L$$ changes, _not_ how $$f$$ changes", as you vary $$\alpha$$. In particular, although the maximum value $$\b{x}^*$$ is really a function $$\b{x}^*(\alpha)$$ as well, it _doesn't matter_; that's the content of the Envelope Theorem. The argument goes like this: we'll compute how $$f^* = f(\b{x}^*(\alpha), \alpha)$$ changes as we vary $$\alpha$$, given that the constraint $$G_{\perp} (\b{x}(\alpha), \alpha) = 0$$ always holds. We find:

$$
\begin{aligned}
\frac{d f^*}{d \alpha} &= \frac{\p f}{\p \alpha} + \frac{\p f}{\p \b{x}} \frac{d \b{x}^*}{d \alpha} \\ 
&= \frac{\p f}{\p \alpha} + \vec{\lambda} \cdot \frac{\p G_{\perp}}{\p \b{x}} \frac{d \b{x}^*}{d \alpha} \\
&= \frac{\p f}{\p \alpha} + \vec{\lambda} \cdot  [\cancel{\frac{d G_{\perp}}{d \alpha}} - \frac{\p G_{\perp}}{\p \alpha}] \\
&= \frac{\p f}{\p \alpha} - \vec{\lambda} \cdot  \frac{\p G_{\perp}}{\p \alpha} \\
&= \frac{\p L^*}{\p \alpha}
\end{aligned}
$$

(Where we have used the facts that $$\frac{\p f}{\p \b{x}} = \vec{\lambda} \cdot \frac{\p G_{\perp}}{\p \b{x}} $$ and $$\frac{d G_{\perp}}{d \alpha} = \frac{\p G_{\perp}}{\p \b{x}} \frac{d\b{x}^*}{d \alpha} + \frac{\p G_{\perp}}{\p \alpha} = 0$$. Also I'm writing $$\del_{\b{x}} f$$ as $$ \frac{\p f}{\p \b{x}}$$ for consistency.) 

The surprising part is that the $$d \b{x}^* / d \alpha$$ terms cancel out, as a result of enforcing that we keep $$G_{\perp}(\b{x}(\alpha), \alpha) = 0$$. And also that it doesn't matter what the value of $$\vec{\lambda}$$ is: even though strictly speaking $$\vec{\lambda}$$ is a function of $$\alpha$$ also, it never gets its derivative taken, so we can just treat it as a constant. (I think? I'm a but unclear about this.)

So I guess that is a pretty compelling reason to use $$L$$: it's like a version of $$f$$ that pre-encodes the constraint that you stay on the surface $$G$$. By _assuming_ that we can remove the projection onto $$G_{\perp}$$ by finding some appropriate value of $$\vec{\lambda}$$, we can do calculus, even before we know the value of $$\vec{\lambda}$$.

(Incidentally, I find this kind of calculation really confusing. Even after writing it out I'm not sure I really get it. It is like there is a secret rule of calculus for commuting $$\frac{d}{d \alpha}$$ and $$\text{max}_{\b{x} \in G_{\perp}(\alpha)^{-1}(0)}$$ that I don't really understand.)

-------

# 5. The meaning of $$L$$, part 3: the Legendre Transform

Here's another perspective on what is going on when we treat $$\vec{\lambda}$$ as a free variable even though it has a definite value (that is, $$\frac{df}{dG_{\perp}}$$).

When we go to solve $$d_G f = 0$$ by solving $$d L = 0$$, we end up solving a system of equations:

$$
\begin{aligned}
\del_{\b{x}} L &= 0 \\
\del_{\vec{\lambda}} L &= 0 \\
\end{aligned}
$$

And the solution is given by the intersection of the two solutions. The first equation is all the points that have $$d_G f = 0$$ on _any_ level set. The second equation is all the points that solve the constraint with the actual values we were looking for, $$G_{\perp} = G_{\perp}^*$$. The intersection of the two is the actual solution to the optimization problem.

Well, it is probably quite convenient that the resulting equation treats the variables $$\b{x}$$ and $$\vec{\lambda}$$ symmetrically. The solution is the intersection of two surfaces, and that procedure _doesn't care_ which one is a position coordinate and which one is a derivative $$\frac{df}{dG_{\perp}}$$. 

Earlier we saw that the $$G_{\perp}$$ constraints can be regarded as coordinates themselves, which parameterize points in space in terms of the constraints values $$G_{\perp}$$ instead of the positions $$\b{x}$$, and we imagine writing

$$f(\b{x}) = f(G, G_{\perp})$$ 

as a way of factoring $$f$$ into $$k$$ variables that specify which level set we're on, plus $$(n-k)$$ variables that say where on it to go. (Recall the explicit example from the earlier where we wrote $$df = f_u d \b{u} + f_v d \b{v} + f_n d \b{n}$$. In that case $$(u,v)$$ are coordinates on $$G$$ and $$(n)$$ is a coordinate on $$G_{\perp}$$.)


Well, when we write $$L(\b{x}, \vec{\lambda})$$, we have in a sense changed the $$G_{\perp}$$ variables out for a new set of variables $$\vec{\lambda}$$. So in a way we have switched to solving solving for a new set of $$n$$ variables:

* $$n-k$$ values of $$\b{x}$$ restricted to the surface $$G$$ which tell you where on the surface to go.
* $$k$$ values of $$\vec{\lambda}$$ which tell you _not_ which $$G_{\perp}$$ to end up on but rather _what the derivatives should be when you get there_.

Of course you do not actually know how to turn the $$n$$ values of $$\b{x}$$ into the $$n-k$$ values of the imaginary coordinates on $$G$$. But at least in principle there are only $$n-k$$ degrees of freedom there.

In this perspective the Lagrangian looks like a [Legendre Transform](https://en.wikipedia.org/wiki/Legendre_transformation) in the $$G_{\perp}$$ variables. Here is how that works:

For a function of two variables $$f(x,y)$$, the Legendre transform of $$f$$ in the $$y$$ variable is given by

$$\tilde{f}(x, p) = p y - f(x, y) \|_{y = (f_y)^{-1}(p)}$$

Where $$p = \frac{df}{dy}$$ is a value of the derivative. The resulting function $$\tilde{f}(x, p)$$ is a lot like the original function $$f$$, except that now has a dependency on $$p = \frac{\p f}{\p y}$$ instead of $$y$$. Under certain conditions on $$f(x,y)$$---namely, for each value of $$(x, \frac{\p f}{\p y})$$ there is only only one value of $$(x,y)$$ that has that derivative---the resulting function $$\tilde{f}(x, p)$$ encodes the _same information as $$f(x,y)$$_.

Nobody really understands why you use Legendre transforms to do this (cf [here](https://blog.jessriedel.com/2017/06/28/legendre-transform/)), but it is widely used in optimization problems, most famously in transitioning from Lagrangian to Hamiltonian mechanics, where you Legendre transform the velocity $$\b{v}$$ into the momentum $$\b{p} = \frac{\p L}{\p \dot{\b{x}}}$$.[^Hamiltonian]

[^Hamiltonian]: Roughly speaking the reason you do this is that it turns the second-order system of equations for $$L$$ into a first-order system of equations for $$H = L_{\dot{\b{x}}} \dot{\b{x}} - L$$ that is especially well-behaved. In particular the equations for $$H$$ look like a rotation in $$(\b{x}, \b{p})$$ space, and therefore integrating them forward in time and talking about their geometric invariants is comparably simple. Incidentally there is also a thing called [Routhian]((https://en.wikipedia.org/wiki/Routhian_mechanics)) mechanics where you Legendre transform only _some_ of the variables. Yikes. 

    By the way, there is a [way](https://physics.stackexchange.com/questions/790569/derivation-of-hamiltonian-by-constraining-lq-v-t-with-v-dotq) of looking at the Hamiltonian as what happens when you enforce the constraint that $$\dot{\b{x}} = \b{v}$$: the momentum $$\b{p}$$ becomes a Lagrange multiplier which tells you how $$L$$ changes as you change the value of $$\b{v}$$ and then require that $$\dot{\b{x}} - \b{v} = 0$$ is true.

For our optimization problem, we imagine writing the function $$f$$ out in the $$(G, G_{\perp})$$ coordinate system. Then $$L$$ is something like the Legendre transform of the $$G_{\perp}$$ variables only, although with the sign flipped (which I guess is arbitrary), and in particular the transform happens with regard to the offset variable $$\Delta G_{\perp} = G_{\perp} - G_{\perp}^*$$ instead of just $$G_{\perp}$$ (which is just to make the notation match up, and shouldn't make a difference):

$$L(G, \vec{\lambda}) = f(G, G_{\perp}) - \vec{\lambda} \cdot \Delta G_{\perp} \|_{\Delta G_{\perp} - G_\perp^* = \del (\Delta G_{\perp})^{-1}(\vec{\lambda})}$$

Then we switch back to the $$\b{x}$$ variables.

$$L(\b{x}, \vec{\lambda}) = f(\b{x}) - \vec{\lambda} \cdot (G_{\perp}(\b{x}) - G_{\perp}^*)$$

I don't find this _super_ useful for intuition, since Legendre transforms are just weird and hard to understand. But I think it is useful to see the connections: that the Lagrangian of Lagrange multipliers is, in a sense, the Legendre transform of the function into some new $$\vec{\lambda}$$ variables. Each time you Legendre transform a variable, some new variables show up and some of the old ones become redundant. In our case, altough  the new function $$L$$ is in $$(\b{x}, \vec{\lambda})$$ which looks like $$n + k$$ degrees of freedom, $$k$$ of the components in the $$\b{x}$$ aren't actually free to vary becuase we have to pick points that are actually on $$G$$; they've been replaced with the $$k$$ components of $$\vec{\lambda}$$ instead.

This suggests to me also that the Lagrangian of mechanics is best seen as the Legendre Transfomr of something else. I mean to write a lot more about this another day, but roughly it goes like this. There was in the first place an optimization problem, like the one we've been talking about. The initial law of physics was "maximize action", that is, maximize $$dS = -m \d \tau = - (T \d t - p \cdot d \b{x}) = - T \d t + 2 T \d t = T \d t$$ (roughly speaking, action measures the negative proper time experienced by a system as it evolves; evidently proper time is _minimized_ by the solution path of a system). But we had constraints on the motion due to how all the parts of the system interacted with each other. Each one takes the form of a Legendre transform term which gives a Lagrange multiplier. $$F = ma$$ is a _constraint_, and the multiplier $$\frac{dS}{dF} = d \b{x}$$ gives a term $$- V_x d \b{x}$$, leading to $$L = T - V$$. A constraint $$g(\b{x}) = 0$$ gives a normal force term $$- \b{F} \cdot \del g$$. And $$\dot{\b{x}} = \b{v}$$ rewrites the whole thing in terms of $$\b{p} = L_{\dot{\b{x}}}$$, which is just another Lagrangian that we happen to call $$H$$.

Something like that. I guess there's still a lot that I don't understand. But I think it's close.

In summary:

1. $$L$$ is a meaningful function, not just a bookkeeping trick. In particular it is like a linearization of $$f$$ but only on $$G$$, such that it is forced to obey the constraint. By the envelope theorem, its derivatives tell you how the system can change such that the constraint is forced to hold throughout.
2. $$L$$ acts like a Legendre transform of $$f$$ with respect to the $$G_{\perp}$$ variables. We can think of space as being parameterized by $$(G, G_{\perp})$$ and then using $$L$$ we write $$f$$ as a function of $$(G, \frac{df}{dG_{\perp}})$$ instead.

-------

# 6. The True Meaning of $$\vec{\lambda}$$


In practice, the solution values of $$\lambda^* = \frac{df^*}{dG^*}$$ are always meaningful and interesting. After all, these constraint problems are about imposing some condition on a system and then trying to optimize it. The derivatives $$\frac{df}{dG}$$ tell you how the system's value changes _when you vary the constraint values_, and the optimum value $$\lambda^* = \frac{df^*}{dG^*}$$ tells you how it will happen at the maximum. 

Here are some examples:

In economics, if the function being maximized is something like "profit" and the constraint is some condition on the business that forces $$g = g^*$$, then the multiplier $$\lambda^*$$ tells you how much more profit you will get if you can change that condition, and the highest multiplier tells you which change gives the highest marginal returns. (Wikipedia tells me that $$\lambda$$ is called the [marginal cost](https://en.wikipedia.org/wiki/Marginal_cost) or [shadow price](https://en.wikipedia.org/wiki/Shadow_price))

In mechanics if a system is constrained to follow a certain surface in space given by $$g = g^*$$, then the Lagrange multiplier for that system is the normal fore which holds the system to that surface. Also there is a sense, alluded to above but which I'll have to work out some other day, in which $$L = T - V$$ is the Lagrange multipler form of $$F = ma$$: you can move in the potential, but there's a cost, and the multiplier is a force $$F$$.

In thermodynamics, if two systems are in thermodynamic equilibrium, then they are modeled as maximizing entropy subject to their total energy being constant. You find that the Lagrange multiplier $$\frac{dS}{dE} = \frac{1}{T}$$, that is, inverse temperature is the multiplier for energy. There are a bunch of other variables in thermodynamics which characterize how systems equilibrate when they're allowed to exchange different quantities. Pressure $$P$$ is the multiplier for changes in volume $$V$$, chemical potential $$\mu$$ is the multiplier for changes in particle ratio (that is, it's the thing that equilibrates under diffusion); etc.

In each case the multiplier acts like a "force" or "pressure" or "marginal return". It tells you how the maximum value changes when you change some parameter of a system. There's a very general way of looking at it:

1. Suppose there is a system that optimizes some quantity. For thermodynamics, it's $$S$$, the entropy.
2. If you split the system in two parts that exchange some conserved quantity $$E = E_1 + E_2$$, then the individual systems still maximize $$S = S_1 + S_2$$. They do _not_ maximize their $$S_i$$ because they should have to give away some $$S$$ if it makes the other system's $$S$$ go up by more.
3. Therefore at their maximum, there's a balance between the two values of $$\frac{dS}{dE}$$, and the two systems end up maximizing $$S_i - \frac{dS_i}{dE_i} (E_i)$$ instead. The quantity $$\lambda = \frac{dS_i}{dE_i}$$ is the Lagrange multiplier. For thermodynamics it turns out to be the the inverse temperature, $$\frac{1}{T}$$, so the maximized value for each subsystem is $$S - \frac{1}{T} E$$ or $$TS - E$$ instead (the negative[ Helmholtz free energy](https://en.wikipedia.org/wiki/Helmholtz_free_energy)).
4. When the multiplier $$\lambda$$ is treated as a free variable, then you are leaving the rate of exchange with other systems open to vary: for instance, you solve for a system which is maximizing $$S$$ while held to some temperature $$T$$. Probably it is connected to a much-larger reservoir that can take or give it energy if its value of $$T$$ ever changes. As far as the system is concerned, its job is to maximize $$TS - E$$ for fixed $$T$$ and variable $$E$$.
5. Something like this holds for _any_ number of systems that can exchange _any_ quantity while optimizing for something else. In thermo there are versions of this for every choice of quantities that might you fix versus vary; for instance [Gibbs Free Energy](https://en.wikipedia.org/wiki/Gibbs_free_energy) is the maximized quantity if temperature and pressure are fixed but volume and energy are allowed to vary.

So for any coupled set of systems that optimize a variable $$S$$ there is some quantity $$\lambda$$ which measures the "marginal value of giving up a unit of $$S$$ to someone else". If another system can get more optimum out of a quantity such as a unit of energy, the system we're looking at would rather give up a unit to the other system than use it itself. The only way the whole system ends up at a maximum is if everyone's values of $$\lambda$$ equilibrate: otherwise, there is still an improvement to be made.

This argument is _super_ general. Even in the abstract optimization problem that we've been considering, it's there: $$\lambda$$ tells us how the system _could_ change, were we allowed to change the value of $$G_{\perp}^*$$. Give me another system to get values of $$G_{\perp}^*$$ from and I can use it to get more value out of $$f$$. That is why we care about the value of $$\lambda$$ even though it is just a constant after you solve for $$\del_G f = 0$$: because in every situation that arises in practice, there _are_ externalities and constraints that might be changed, and $$\lambda$$ tells us how that works.

At some level I think that this perspective on Lagrange multipliers is like a secret truth underlying all of mathematics, which applies to _everything_, and properly understanding it is like glimpsing an aspect of the true nature of the existence. For example:

Suppose you are a strangely calculating, rational person, and you're trying to make a decision in your life, like picking a job and place to live that optimizes your happiness $$H$$. Maybe your job could be improved and your housing could be improved. Well, there is a multiplier: if taking a worse house makes your job better by _more_ than that, you should switch houses to get the better job. Or vice-versa. Or, since you know the value of $$\lambda = \frac{\p H}{\p C}$$, the return on happiness from making those changes, you should look for other places to make changes that get a better return: change your relationships, get a new hobby, start a revolution, whatever it takes. Maybe you get a certain negative return on happiness from even _thinking_ about the problem for a time $$t$$ due to some rate of stress $$S = \frac{\p H}{\p t}$$. Now you shouldn't be thinking about optimizing $$H$$ at all, but rather $$H - S t$$: make your decisions, but don't spend your whole life stressing about them either because you'll eat into the reward that way. Etc. Money can't buy happiness directly, but there _is_ a Lagrange multiplier $$\lambda = \p H/\p\$ $$ for it, and you might want to figure out what it is for you.

That's right. Lagrange Multipliers are everywhere. They're basically an all-encompassing moral philosophy hiding under an bewildering pile of calculus hacks.

Sheesh.



