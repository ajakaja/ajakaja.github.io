---
layout: blog
title: "The Essence of Lagrange Multipliers"
tags: math
math: true
footnotes: true
aside: true
---

In which we attempt to better understand multivariable calculus optimization problems.

<!--more-->

[Lagrange Multipliers](https://en.wikipedia.org/wiki/Lagrange_multiplier) are what you get when you try to solve a simple-sounding math problem in multivariable calculus:

> Maximize $$f(\b{x})$$
> Subject to the constraint that $$g(\b{x}) = c$$

In single-variable calculus you study maximization (/minimization/extremization/whatever) problems like "maximize $$f(x)$$". It was simple, at least in principle: set $$f'(x) = 0$$ and solve for $$x$$, if you can, and then check each solution to see if it is a maximum or a minimum or just a stationary point. But in multivariable you get trickier problems, because you can say things like "make sure the solution obeys a certain equation $$g(x) = c$$ at the same time", and it turns out that Lagrange multipliers are the trick to solving those. The trick is to instead maximize $$L = f(\b{x}) + \lambda (g(\b{x}) - c)$$ for both variables $$(x, \lambda)$$, by solving $$\del L = \p_{\lambda} L = 0 $$. Equivalently, "notice that the solution will obey $$\del f \propto \del g$$, rather than $$\del f = 0$$". 

I'm told that Lagrange multipliers show up all over mathematics and are a widely used technique for solving real-world problems. Couldn't tell you much about that. But I care about them for three reasons:

One, the explanation for how to solve them that you get in undergraduate calculus is very... philosophically unsatisfying. I don't like techniques that arising from "noticing" something; I would also rather the insight somehow emerge from a natural calculation. Depending on your background noticing this might be easier or difficult, but in either case it's not satisfying for a problem to be solved by a trick.

Two, I am very interested in the concept of "generalized inverses", of which Lagrange multipliers include several great examples (to be demonstrated shortly). The algebra of these is a bit unfamiliar so it's helpful to play with some examples.

Three, various applications of Lagrange multipliers in physics (QFT, statmech, Lagrangian mechanics) imply that Lagrange multipliers are an incredibly deep and important concept, far beyond their initial impression, and I want to understand how and why.

-------

# 1. Lagrange Multipliers as inverting a projection

Here is what I think is the most intuitive explanation of Lagrange multipliers. It is somewhat more complex than the standard explanations, but it's worth it because it's "natural" in a way that most explanations are not. I hope that someday it will be not be viewed as more complex.

We wish to find the maximum value of $$f(\b{x})$$ subject to the constraint that $$g(\b{x}) = c$$. We'll assume that $$f$$ and $$g$$ are both well-behaved smooth functions.

In 1d calculus we would look for the maximum of a smooth function $$f$$ at points that have $$\frac{df}{dx} = 0$$. Maybe they're a maximum, or a minimum, or otherwise just a stationary point (we'd have to check the second derivative to know), and if they're a maximum, maybe they're global maximum or maybe not, but in any case, those are the points that we're interested in.

Similarly, for a multivariable function in the absence of a constraint, we would search for a maximum by looking for points that have $$\del f = (f_x, f_y, f_z) = \b{0}$$, and we'd test if they're a max by looking at the signs of the eigenvalues of the second derivative. All negative means it's a maximum because the function decreases in every direction.

When we limit to points on the surface $$G = \{ \b{x} \, \| \, g(\b{x}) = c \}$$, we are not necessarily interested in global maxima of the whole function $$f$$ anymore. A global maximum point of $$f$$ would still be a maximum if it happened to be on the surface, but if it did not lie on $$G$$ then we would not care. Meanwhile the maximum that's on $$G$$ may not have $$\del f = \b{0}$$.

Example: suppose $$G$$ is the surface $$g(x,y) = x^2 + y^2 = R^2$$, a circle of radius $$R$$ around the origin. Say the function we are maximizing is just $$x$$, the $$x$$ coordinate. There is no global maximum ($$f$$ increases as you head in the $$+x$$ direction forever), but the maximum on $$G$$ is clearly the point $$(x,y) = (R, 0)$$, the most $$x$$-ward point on the circle. Yet the gradient at that point is $$\del f = (1,0)$$, which is certainly not zero. It is, however, parallel to the gradient of $$g$$, which is $$(2x, 2y) = (2R, 0)$$.

The reason that $$\del f = \b{0}$$ is no longer condition for a maximum is that that we are really interested in only $$f$$'s derivative _when $$f$$ is restricted to_ $$G$$. As we move in directions that _are_ on $$G$$, how does $$f$$ change? If it's constant, then we are at a local stationary point of $$f$$. In the circle example: at $$(x,y) = (R, 0)$$, the gradient is $$(2R, 0)$$, but the circle is going in the $$\pm \hat{y}$$ direction, so the gradient along $$y$$ _is_ $$0$$.

How do we express the derivative of $$f$$, but restricted to $$G$$, as an equation? What we are looking for is called the [covariant derivative](https://en.wikipedia.org/wiki/Covariant_derivative) of $$f$$, with respect to the surface $$G$$, and the condition for the maxima of $$f$$ is that the covariant derivative is zero:

$$\del_G f = \b{0}$$

It is the regular derivative $$\del f$$, but with the components that do not lie on the surface $$G$$ removed.

$$\del_G f = \proj_G \del f $$

One might think $$\proj_G$$ as a generic operator, but it's easier to work with as a matrix. Recall that $$\del g$$ points in the direction orthogonal to $$G$$, because it the only direction in which $$g$$ changes. Therefore to project onto $$G$$, we just have to remove the projection onto $$\del g$$:

$$(I - \proj_{\del g}) \cdot \del f(x) = \b{0}$$

Here $$I$$ is an identity matrix. $$\proj_{\del g}$$ is a matrix constructed from the vector $$\del g$$, defined by $$\proj_{\del g} (\b{v}) = \frac{\del g}{\| \del g \|} [ \frac{\del g}{\| \del g \|}  \cdot \b{v}]$$. Since each $$\del g / \| \del g \|$$ is the unit vector version of $$\del g$$, the projection $$\proj_{\del g}$$ is created by (a) dotting with $$\del g$$'s unit vector to find the component along that direction and (b) multiplying by it again to turn it into a vector along that direction. Another way to write it is as a tensor product:

$$(I -  \frac{\del g}{\| \del g \|} \o \frac{\del g}{\| \del g \|}) \cdot \del f = \b{0}$$


All of these are ways of writing the surface derivative of $$f$$ with respect to $$G$$. It doesn't matter which one you use. The important part is: this is the constraint that is obeyed by $$f$$ at its stationary points on $$G$$.

Here is one more version. Suppose we happen to have a coordinate system $$(u,v)$$ on $$G = g^{-1}(c)$$. Then locally there is a frame of unit vectors $$(\b{u}, \b{v}, \b{n})$$, with $$\b{n} = \frac{\del g}{\| \del g \|}$$. The identity matrix is $$I = \b{uu} + \b{vv} + \b{nn}$$ (using [dyadic notation](https://en.wikipedia.org/wiki/Dyadics) in which $$\b{nn} = \b{n} \o \b{n}$$), that is, it's $$\text{diag}(1,1,1)$$ in the $$(u,v,n)$$ coordinate system. Then we can write $$I - \b{nn} = \b{uu} + \b{vv} = \text{diag}(1,1,0)$$. That is, there is a basis in which these are true:

$$\proj_G = I - \b{nn} = \b{uu} + \b{vv} = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 0 \end{pmatrix}$$

Which is so simple that it felt worth mentioning. After all this is all a projection is: if it removes one dimension from a vector, of course there's a basis in which it preserves the other two dimensions but gets rid of one, why not? It is often helpful to imagine coordinates like this to make the algebra more concrete. But we'll go back to the $$I - \proj_{\del g}$$ version for the rest of the discussion.

-------

So the condition on points on $$G$$ which maximize $$f$$ is that

$$\del_G f = \proj_G \del f = \b{0}$$

This doesn't require that $$\del f = \b{0}$$ itself. Yes, $$\del f$$'s components in the $$(n-1)$$ directions on the surface $$G$$ are zero, but there's one more direction besides those, the direction $$\del g$$, along which it can be whatever it wants. Therefore at the solutions $$\del f$$ has to be proportional to $$\del g$$:

$$\del f = \lambda \del g$$

$$\lambda$$ the Lagrange Multiplier. When we solve the equation we'll come up with both a point $$\b{x}^*$$ and a value of $$\lambda^*$$ as the solution. It has an interesting interpretation which we'll talk about later, but for now just notice that its value doesn't matter for the argument. Note that if $$\del g$$ happens to be $$\b{0}$$, meaning that $$g(\b{x})$$ is locally constant, then $$\del f$$ has to equal $$\b{0}$$ as well: it once again has $$n$$ constraints instead of $$n-1$$, and there's no free parameter; it has to be an actual stationary point of $$\del f$$ on its own.

There is a very simple way to produce this form. We had written $$\proj_{G} \cdot \del f = \b{0}$$. Well, the projection operator has a simple "generalized inverse": since it takes one dimension, the direction $$\del g$$, to $$0$$, then the preimage of $$\b{0}$$ can have any component along $$\del g$$. We write this as a free parameter $$\lambda$$:

$$
\begin{aligned}
\proj_G \del f &= \b{0} \\
\del f &= \proj_G^{-1}(\b{0}) \\ 
&= \lambda \del g \\
\end{aligned}
$$

I like how that makes the free $$\lambda$$ parameter show up through rote algebra instead of any sort of trick. Invert a projection, get a free parameter. Easy.

So far $$\del_G f = \b{0}$$ was a condition that we expected to be fulfilled at certain points, the maxima $$\b{x}^*$$. _At_ those points we'll write $$f^* = f(\b{x}^*)$$ and $$g^* = g(\b{x}^*) = c$$. We'll also write $$\del f^* = \del f(\b{x}^*)$$ and $$\del g^* = \del g(\b{x}^*)$$. Then the relation at the solution(s) is

$$\del f^* = \lambda^* \del g^*$$

We can just solve for $$\lambda^*$$:

$$\lambda^* = \frac{\del f^*}{\del g^*}$$

(This uses the unorthodox notation of division by a vector. It's defined as $$\b{a}/\b{b} = (\b{a} \cdot \b{b})/\| \b{b} \|^2$$, so this says that $$\lambda^* = (\del f^* \cdot \del g^*) / \| \del g^* \|^2$$.) 

So that's the value of $$\lambda^*$$: it's the ratio of the derivatives of $$f$$ and $$g$$. We'll talk about why later. First let's do this again with more than one constraint because it gets interesting.

--------

# 2. Handling Multiple Constraints with the Pseudoinverse

Suppose we have $$k$$ constraints $$\{g_i(\b{x}) = g_i^*\}$$. Each constraint defines a surface $$G_i = g_i^{-1}(g^*_i)$$, and then we define the intersections of those surfaces as $$G = G_1 \cap G_2 \cap \ldots = g_1^{-1}(g^*_1) \cap g_2^{-1}(g^*_2) \cap \ldots$$.

We'll assume that the surfaces defined by the constraints actually do all intersect. Each surface is $$(n-1)$$ dimension ("codimension $$1$$") The intersection is in general somewhere between $$(n-k)$$ and $$(n-1)$$-dimensional depending on whether the constraints are redundant with each other (two copies of the same constraint is no different than one); we'll assume that they're not redundant.

Write $$G_{\perp} = (g_1, g_2, \ldots, g_k)$$ for the list of constraints as a vector, and then $$G_{\perp}^* = (g_1^*, g_2^*, \ldots, g_k^*)$$ will be the vector of the values we're looking for each constraint to take. The surface $$G$$ is the solution to $$G_{\perp}(\b{x}) = G_{\perp}^*$$, that is, $$G = G_{\perp}^{-1}(G_{\perp}^*)$$. We'll also write $$\del G_{\perp} = \{ \del g_1, \del g_2, \ldots \}$$ then will be the $$n \times k$$ matrix that is the gradient of all the constraints.

The reason for writing the list of constraints as $$G_{\perp}$$ is that $$\del G_{\perp}$$ is the list of vectors _orthogonal_ to the surface $$G$$, so we probably shouldn't write it as $$\del G$$. Also, it kinda makes sense: except at the solution values $$G_{\perp}^*$$, the constraints describe points that _aren't_ on the surface. Points on the surface would be described by some coordinates for it that we don't have access to.

The stationary points of $$f$$, subject to all the constraints $$G_{\perp} = G_{\perp}^*$$, are still given by setting the covariant derivative with respect to this surface $$G$$ to zero

$$\del_G f = \proj_G \cdot \del f = \b{0}$$

for exactly the same reason as before: a point at which $$f$$ is maximized has no direction on $$G$$ in which you can move to increase it, hence its covariant derivative _on $$G$$_ is zero.

Also as before, we can in principle solve this by inverting the projection:

$$
\begin{aligned}
\del_G f &= \b{0} \\
\proj_G \del f &= \b{0}\\
\del f &= \proj_G^{-1}(\b{0}) 
\end{aligned}
$$

And as before the solution is going to be a bunch of free parameters, one for each direction in $$\perp G$$. We happen to have those directions: they're $$\del G_{\perp}$$. $$\del f$$ is therefore a linear combination of the vectors in $$G_{\perp} = \text{span}(\del G_{\perp})$$:

$$
\begin{aligned}
\del f &= \proj_G^{-1}(\b{0}) \\
&= \lambda_1 \del g_1 + \lambda_2 \del g_2 + \ldots \\ 
&= \vec{\lambda} \cdot (\del G_{\perp})
\end{aligned}
$$

Which are our Lagrange multipliers.

There is a more interesting way to solve this. Instead of just inverting $$\proj_G$$ and reasoning that it ought to be in $$\text{span}(\del G_{\perp})$$, we can manipulate the equation like this:

$$
\begin{aligned}
(I - \proj_{\perp G}) \del f &= \b{0} \\ 
\del f &= \proj_{\perp G} \del f 
\end{aligned}
$$

This too is the "condition on $$f$$ at the max", equivalent to $$\proj_G^{-1}(\b{0})$$. It is better to write it in terms of $$\proj_{\perp G}$$ because $$\perp G$$ is, in fact, something we can write out algebraically. But it's not as simple as $$(I - \proj_{\del g_1} - \proj_{\del g_2} \ldots)$$ or anything like that: the problem is that all the constraints may be generally non-orthogonal, so we'd be projecting off the same components twice if we did that. Instead we need to use something that acts like the inverse of a matrix: the [pseudoinverse](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse). Using the pseudoinverse we can write

$$\proj_{\perp G} \del f = \frac{\del f}{\del G_{\perp}} \del G_{\perp}$$

The meaning of $$1/\del G_{\perp}$$ is that it is the pseudoinverse, which I am just writing as a fraction to be weird[^indices]. The pseudoinverse is exactly the matrix which projects $$\del f$$ onto the basis $$\del G_{\perp}$$. It's not a true inverse because $$\del G_{\perp}$$ is not square (it's $$k \times n$$), and so $$1/\del G_{\perp}$$ just deletes any components of $$\del f$$ that aren't in $$\text{span}(\del G_{\perp})$$.

[^indices]: To be precise we'd want to notate which indices of the matrices are contracted with each other, but let's not. Anyway there is really only one sensible way to do it.

The operation $$\frac{\del f}{\del G_{\perp}} \del f$$ has the form $$\frac{\b{b}}{A} A$$.
It's a generalization of the single-vector projection $$\frac{\b{b}}{\b{a}} \b{a} = \frac{\b{b} \cdot \b{a}}{\| \b{a} \|^2} \b{a}$$. If $$A = (\b{a}_1, \b{a}_2, \ldots)$$, then what this does is:

1. Suppose we are trying to find $$\proj_{A} \b{b} = b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots$$, perhaps we are trying to do our best to solve $$A \b{x} = \b{b}$$ for a non-square $$A$$.
2. $$\b{b} / A$$ produces the vector $$(b_1, b_2, \ldots)$$. (In practice by a process that looks like $$b_1 = \frac{\b{b} \^ \b{a}_2 \^ \b{a}_3 \ldots}{\b{a}_1 \^ \b{a}_2 \^ \b{a}_3 \ldots}$$, which gives the actual matrix inverse if $$A$$ is $$n \times n$$.)
3. $$(\b{b}/A) A$$ expands those components again to produce $$ b_1 \b{a}_1 + b_2 \b{a}_2 + \ldots = \proj_{A} \b{b}$$
4. Which, when $$\b{b} \in \text{span}(A)$$, is just $$\b{b}$$ again.

Another way of looking at this is that $$1/A$$ is the matrix form of the [dual basis](https://en.wikipedia.org/wiki/Dual_basis) of $$A$$: it produces basis vectors that have $$\tilde{\b{a}}_i \cdot \b{a}^{j} = \delta_i^j$$. The fact that it is a projection but only onto the vectors in $$A$$ corresponds to the defining identity for a pseudoinverse: instead of $$A^{-1} A = I$$ it obeys $$A^{-1} A = I_A = \proj_A$$ and $$A A^{-1} A = A$$. Often people write it as $$A^+$$ since it's not a true inverse, but IMO it's pretty close, so why not. I'm also happy to write it as $$A^{-1}$$. 

Note that all of this only works as written if the vectors in $$A$$ are all linearly independent. Otherwise there would be multiple choices for the $$b_i$$, because e.g. $$\b{b} = b_1 \b{a}_1 + b_2 \b{a}_2$$ could be written in multiple ways if $$\b{b}_1$$ and $$\b{b}_2$$ are parallel. If this happened we could still express the answer in terms of the full _generalized_ inverse of $$A$$, which solves $$A \b{x} = \b{b}$$ with $$\b{x} = A^{-1} (\b{b}) + (I - A^{-1} A) \cdot \vec{\alpha}$$ for even more free parameters $$\vec{\alpha}$$; the matrix $$ (I - A^{-1} A)$$ is the projection $$\proj_{\perp A}$$. But I don't want to deal with that so we'll assume it's not the case.

(By the way, this is the solution to a pretty common confusion in calculus. We write $$\frac{df}{dx}$$ as the derivative of a function, but we are careful to point out that $$\frac{1}{dx}$$ is not "actually" an inverse, because multiplying by $$dx$$ does not give $$df$$ again. Of course it's not, but it _is_ a pseudoinverse. Since $$df = f_x dx + f_{\perp x} d x_{\perp}$$, we have:

$$
\begin{aligned}
\frac{df}{dx} &= df \cdot \frac{1}{dx} \\ 
&= (f_x dx + f_{\perp x} d x_{\perp}) \cdot \frac{1}{dx} \\ 
&= f_x \\
\frac{df}{dx} dx &= f_x dx \\
&= \proj_x df
\end{aligned}
$$

(Use your imagination to interpret the dot product, or, if you like differential forms, imagine that $$\frac{1}{dx} = \p_x$$, a tangent vector.) And we can "solve" $$\frac{df}{dx} = 0$$ with the generalized inverse version, which produces free parameters $$f_{\perp x}$$:

$$
\begin{aligned}
\frac{df}{dx} &= 0 \\ 
df &= (\frac{1}{dx})^{-1} (0) \\ 
&= f_{\perp x} d x_{\perp}
\end{aligned}
$$

Above we have just done this for $$df/dG = 0$$, where $$G$$ are implied to be unspecified coordinates on the surface $$G$$.)

--------

So anyway! I like to write the stationary point condition, the solution to $$\del_G f = \b{0}$$ like this:

$$\del f = \proj_{\perp G} \del f = \frac{\del f}{\del G_{\perp}} \del G_{\perp}$$

There are no free parameters. After all this is the only way the composition of $$\del f$$ into $$\del G_{\perp}$$ could happen. At most points it will not be true: $$\del f$$ will have other components that don't show up in the RHS. When it is true we have a stationary point and we write

$$\vec{\lambda}^* = \frac{\del f^*}{\del G^*_{\perp}}$$

So the Lagrange multupliers $$\vec{\lambda}^* = \del f^* / \del G^*_{\perp}$$ give the coordinates for the projection of $$\del f^*$$ onto $$\del G^*_{\perp}$$. It is simply the multivariable equivalent of what $$\lambda^* = \del f^* / \del g^*$$ was for a single constriant.

-----


# 3. The Meaning of $$L$$, part 1

One of things you always see in Lagrange multiplier problems is this bizarre trick:

Instead of maximizing $$f(\b{x})$$ on the surface $$g(\b{x}) = g^*$$ over all values of $$x$$, construct a new function called a "Lagrangian":

$$L(\b{x}, \lambda) = f(\b{x}) - \lambda (g(\b{x}) - g^*)$$

or with multiple constraints:

$$L(\b{x}, \vec{\lambda}) = f(\b{x}) - \vec{\lambda} \cdot (G_{\perp}(\b{x}) - G_{\perp}^*)$$

and maximize that instead, with respect to both variables $$\b{x}$$ and $$\lambda$$. The condition $$\del_{\b{x}, \lambda} L = 0$$ becomes:

$$\begin{cases}
\del_{\b{x}} L = \del f - \lambda \del g &= 0 \\
\del_\lambda L = g(\b{x}) - g^* &= 0 \\
\end{cases}$$

The second clause just encodes the original constraint again, while the first is the Lagrange multiplier constraint. Cute? But... in what world is this a good way to do this? It just seems like a hack pulled out of thin air. And indeed, even after learning a _lot_ more about Lagrangians in physics, I _still_ feel like it's a hack pulled out of thin air. What is going on?[^confuse]

[^confuse]: I am not the [only one](https://math.stackexchange.com/questions/1392280/lagrange-multiplier-method-why-is-the-langragian-function-defined-as-fx-y-l) confused by this, and as often happens, all the repliers on that question are confused by the fact that the questioner is confused about it. But I agree with the questioner: "noticing" you can write $$L = f - \lambda g$$ and optimize $$\del L = 0$$ instead is just weird. There needs to be some sort of elegant reason for why that works.

With the understanding of the Lagrange multipliers as inverting a covariant derivative, we can do a bit better.

---------

First let's fix the notation a bit. So far we've been writing $$\del f$$ everywhere. It will be nice to just write these as differentials:

$$
\begin{aligned}
d_G f &= \proj_G d f \\
&= (I - \proj_{\perp G}) df \\ 
&= d f - \frac{df}{dG_{\perp}} d G_{\perp} \\
\end{aligned}
$$

(Recall that $$df = \del f \cdot d \b{x}$$, e.g. $$df = f_x dx + f_y dy + \ldots$$ Well, $$d_G f = \del_G f \cdot d \b{x}$$. Same thing. This notation makes it clear that the derivatives are coordinate-independent and could happen in whatever coordinate system you like: they care only about the _surface_ $$G$$, not the specific implementation of the functions $$G_{\perp}$$ in particular coordinates.)

So, $$d_G f$$ is the covariant derivative of $$f$$: the part of $$f$$'s derivative that lives on the surface $$G$$. We can define it everywhere, of course; it's only at stationary points where $$d_G f = \b{0}$$ matters.

An interesting thing we can do is attempt to linearly approximate it. We start with the expansion of $$d_G f$$

$$
\begin{aligned}
0 &= d_G f \\
&= df - \frac{df}{dG_{\perp}} dG_{\perp} \\
\end{aligned}
$$

But fix the value of $$\frac{df}{dG_{\perp}}$$ to be a constant $$\vec{\lambda}$$. Then approximate $$f$$ to first-order around the point $$\b{x} = \b{x}^*$$:

$$
\begin{aligned}
f(\b{x}) &= f(\b{x}^*) + \int_{\b{x}^*}^{\b{x}} d_G f \\ 
&= f(\b{x}^*) + \int_{\b{x}^*}^{\b{x}} df - \frac{df}{dG_{\perp}} dG_{\perp}  \\
&\approx f(\b{x}^*) + \int_{\b{x}^*}^{\b{x}} df - \vec{\lambda} \, dG_{\perp} \\
&= f(\b{x}) - \vec{\lambda} (G_{\perp}  - G_{\perp}^*) \\
&= L(\b{x}, \vec{\lambda}) \\
\end{aligned}
$$

This feels close to the true meaning of $$L$$: with the substitution, $$L(\b{x}, \frac{df}{dG_{\perp}})$$ is $$f$$ with its change along $$G_{\perp}$$ removed.  I imagine writing this as $$\proj_G f$$, the projection of a function onto a surface rather than a vector field. It's "the local approximation to $$f$$, but only the part on $$G$$". As if somebody had said:

> instead of solving $$\del_G f = \b{0}$$
> define $$L$$ such that $$\del L = \del_g f$$ around the solution, and set $$\del L = \b{0}$$ instead

Another way of thinking about this: we can approximate a point $$\b{x}$$ near $$\b{x}^*$$ as

$$\b{x} \approx \b{x}^* + \b{x}_G  (G - G^*) + \b{x}_{G_{\perp}} (G_{\perp} - G_{\perp}^*)$$

Where we've written the point in $$G$$ coordinates (imaginary coordinates on the surface $$G$$) and $$G_{\perp}$$ coordinates (which we have, they're the values of the constraints). The $$\b{x}_G$$ are derivatives of the coordinate changes (Jacobians, if you want; hate that name). Naturally $$f$$ can be expanded in terms of these:

$$
\begin{aligned}
f(\b{x}) 
&\approx f(\b{x}^* + \b{x}_G  (G - G^*) + \b{x}_{G_{\perp}}  (G_{\perp} - G_{\perp}^*)) \\
&\approx f(\b{x}^*) + (\del f) \b{x}_G  (G - G^*) + (\del f) \b{x}_{G_{\perp}}  (G_{\perp} - G_{\perp}^*) \\
&= f(\b{x}^*) + \frac{df}{dG} (G - G^*) + \frac{df}{dG_{\perp}}  (G_{\perp} - G_{\perp}^*)
\end{aligned}
$$

Then $$L(\b{x}, \frac{df}{dG_{\perp}})$$ is:

$$
\begin{aligned}
L &= f(\b{x}) - \frac{df}{dG_{\perp}}  (G_{\perp} - G_{\perp}^*) \\
&= f(\b{x}^*) + \frac{df}{dG_{\perp}} (G - G^*)
\end{aligned}
$$

It is as if there was a coordinate system $$(G, G_{\perp})$$ on space, where the $$k$$ constraints give coordinates on all the level sets and the other $$G$$ variables are unspecified. Then $$L(\b{x}, \frac{df}{dG_{\perp}})$$ is $$f$$, expanded only in terms of the $$G$$ coordinates.

-------

# 4. The meaning of $$L$$, part 2: the Envelope Theorem and Legendre Transforms

But this can't be the full story, because $$L$$ is a function of $$\vec{\lambda}$$ in general, and we have to solve for that also: the solution is given by both $$L_{\b{x}} = \b{0}$$ and $$L_{\vec{\lambda}} = \b{0}$$. Why?

I don't know that I understand the full reason, but here are some observations.

First, it seems to be meaningful to do calculations directly on $$L$$, with $$\vec{\lambda}$$ unspecified, due to the weird way that maximizing functions interacts with calculus. There is a thing called the [envelope theorem](https://en.m.wikipedia.org/wiki/Envelope_theorem) which is mostly used by economists. It says: suppose you want to know how the optimal value $$f(\b{x}^*)$$ depends on some parameter $$\alpha$$, where all the parts of the system can be changed by changing $$\alpha$$ (which could be vectorial). So we are solving $$f(\b{x}, \alpha)$$ subject to the constraint $$G_{\perp}(\b{x}, \alpha) = 0$$ (we'll fold the $$G_{\perp}^*$$ term into the $$\alpha$$). Then the derivative $$d f^*/d\alpha$$ is given by taking a partial derivative of $$L^*$$ instead:

$$\frac{df^*}{d \alpha} = \frac{\p L^*}{\p \alpha} = \frac{\p f(\b{x}^*, \alpha)}{\p \alpha} - \vec{\lambda} \cdot \frac{\p G_{\perp}(\b{x}^*, \alpha)}{\p \alpha}$$

The solution point $$\b{x}^*$$ is a function of $$\alpha$$ also, at least in principle, but the Envelope Theorem's statement is that this doesn't matter. The argument goes like this: we'll compute how $$f^* = f(\b{x}^*(\alpha), \alpha)$$ change as we change $$\alpha$$, given that the constraint $$G_{\perp} (\b{x}, \alpha) = 0$$ always holds. We find that:

$$
\begin{aligned}
\frac{d f^*}{d \alpha} &= \frac{\p f}{\p \alpha} + \frac{\p f}{\p \b{x}} \frac{d \b{x}^*}{d \alpha} \\ 
&= \frac{\p f}{\p \alpha} + \vec{\lambda} \cdot \frac{\p G_{\perp}}{\p \b{x}} \frac{d \b{x}^*}{d \alpha} \\
&= \frac{\p f}{\p \alpha} + \vec{\lambda} \cdot  [\cancel{\frac{d G_{\perp}}{d \alpha}} - \frac{\p G_{\perp}}{\p \alpha}] \\
\frac{\p L^*}{\p \alpha} &= \frac{\p f}{\p \alpha} - \vec{\lambda} \cdot  \frac{\p G_{\perp}}{\p \alpha} \\
\end{aligned}
$$

(Where we have used the fact that $$\frac{d G_{\perp}}{d \alpha} = \frac{\p G_{\perp}}{\p \b{x}} \frac{d\b{x}^*}{d \alpha} + \frac{\p G_{\perp}}{\p \alpha} = 0$$. Also I've written $$ \frac{\p f}{\p \b{x}}$$ for $$\del_{\b{x}}$$ for consistency.) The surprising part is that the $$d \b{x} / d \alpha$$ terms cancel out, as a result of enforcing that we keep $$G_{\perp}(\b{x}(\alpha), \alpha) = 0$$. And also that it doesn't matter what the value of $$\vec{\lambda}$$ is.

I _think_ the reason this works is that, even before we know $$\vec{\lambda}$$, we know that it's going to be a fixed value $$\vec{\lambda}^*$$ when we find the optimum point. That means that it's okay to treat it as a fixed value ahead of time, and then we can do calculus on $$L^*$$ without worrying about it having its own partial derivatives.

So I guess that is a pretty compelling reason to use $$L$$: it's a version of $$f$$ that you can do correct calculus on. By _assuming_ that we can remove the projection onto $$G_{\perp}$$ by finding some appropriate value of $$\vec{\lambda}$$, we can do calculus, even before we know the value of $$\vec{\lambda}$$.

(Incidentally, I find this kind of calculation really confusing. Even after writing it out I'm not sure I really get it. It is like there is a secret rule of calculus for commuting $$\frac{d}{d \alpha}$$ and $$\text{max}_{\b{x} \in G_{\perp}(\alpha)^{-1}(0)}$$ that I don't really understand.)

-------

Another thought on $$\vec{\lambda}$$ as an indeterminate. When we go to solve $$d_G f = 0$$ by solving $$d L = 0$$, we end up solving a system of equations:

$$
\begin{aligned}
\del_{\b{x}} L &= 0 \\
\del_{\vec{\lambda}} L &= 0 \\
\end{aligned}
$$

And the solution is given by the intersection of the two solutions. The first equation is all the points that have $$d_G f = 0$$ on _any_ level set. The second equation is all the points that solve the constraint with the actual values we were looking for, $$G_{\perp} = G_{\perp}^*$$. It Well, it is probably quite convenient that the resulting equation is symmetric in $$\b{x}$$ and $$\vec{\lambda}$$. The solution is the intersection of two surfaces, and that operation doesn't care which one is a position coordinate and which one is a derivative $$\frac{df}{dG_{\perp}}$$. 

Earlier we saw that the $$G_{\perp}$$ constraints can be regarded as coordinates themselves, which parameterize points in space in terms of the constraints values $$G_{\perp}$$ instead of the positions $$\b{x}$$, and we imagine writing

$$f(\b{x}) = f(G, G_{\perp})$$ 

as a way of factoring $$f$$ into $$k$$ variables that specify which level set we're on, plus $$(n-k)$$ variables that say where on it to go. Well, when we write $$L(\b{x}, \vec{\lambda})$$, we have in a sense changed the $$G_{\perp}$$ variables out for a new set of variables $$\vec{\lambda}$$. So in a way we have switched to solving solving for a new set of $$n$$ variables:

* $$k$$ values of $$\vec{\lambda}$$ which tell you not which $$G_{\perp}$$ to end up on but what the derivatives should be when you get there.
* $$n-k$$ values of $$\b{x}$$ restricted to the surface $$G$$ which tell you where on the surface to go.

Of course you do not actually know how to turn the $$n$$ values of $$\b{x}$$ into the $$n-k$$ values of the imaginary coordinates on $$G$$, but at least in principle there are only $$n-k$$ degrees of freedom there.

In this perspective the Lagrangian looks like a [Legendre Transform](https://en.wikipedia.org/wiki/Legendre_transformation) in the $$G_{\perp}$$ variables. For a function of two variables $$f(x,y)$$, doing a Legendre transform in the $$y$$ variable looks like

$$\tilde{f}(x, p) = p y - f(x, y) \|_{y = (f_y)^{-1}(p)}$$

Where $$p = \frac{df}{dy}$$ is a value of the derivative. The resulting function $$\tilde{f}(x, p)$$ is like $$f$$ but parameterized by $$(x, p) = (x, \frac{\p f }{\p y})$$ rather than $$(x,y)$$.

For our optimization problem, we imagine writing the function $$f$$ out in the $$(G, G_{\perp})$$ coordinate system. Then $$L$$ is something like the Legendre transform of the $$G_{\perp}$$ variables only, although with the sign flipped (which I guess is arbitrary), and in particular the transform happens with regard to the offset variable $$\Delta G_{\perp} = G_{\perp} - G_{\perp}^*$$ instead of just $$G_{\perp}$$ (which is just to make the notation match up, and shouldn't make a difference):

$$L(G, \vec{\lambda}) = f(G, G_{\perp}) - \vec{\lambda} \cdot \Delta G_{\perp} \|_{\Delta G_{\perp} - G_\perp^* = \del (\Delta G_{\perp})^{-1}(\vec{\lambda})}$$

Then we switch back to the $$\b{x}$$ variables.

$$L(\b{x}, \vec{\lambda}) = f(\b{x}) - \vec{\lambda} \cdot (G_{\perp}(\b{x}) - G_{\perp}^*)$$

This is pretty sketchy (particularly assuming that $$\b{x}$$ is effectively $$(n-k)$$ dimensional), and I've glossed over all the boring analytical details of Legendre transforms also. Nor is it really useful for intuition since Legendre transforms are just weird. But I think it is useful to see the connection: that the Lagrangian of Lagrange multipliers is, in a sense, the Legendre transform of the function into some new $$\vec{\lambda}$$ variables. Each time you Legendre transform a variable, some new variables show up and some of the old ones become redundant. Hence how the new function $$L$$ is in $$(\b{x}, \vec{\lambda})$$ which looks like $$n + k$$ degrees of freedom, but $$k$$ of the components in the $$\b{x}$$ aren't actually free to vary.

In particular this might be interesting if you are also looking at the Legendre transforms of analytical mechanics. Mechanics also uses a notion of the Lagrangian which is _more or less_ the same thing as the one from Lagrange multipliers. Constraints on motion enter as literal Lagrange multiplier terms, where the multiplier is the value of the normal force that holds you to the constraint. Meanwhile the exchange of energy between potentials and velocity becomes another constraint that gives the $$L = T - V$$ form. (...I think. That's for another day..)

Anyway, in mechanics one takes the Legendre transform in all of the velocity variables in $$L$$ to produce the [Hamiltonian](https://en.wikipedia.org/wiki/Hamiltonian_(control_theory)) ("energy function") $$H = L_{\dot{x}} \dot{x} - L$$ (or in some of the variables, to produce the [Routhian](https://en.wikipedia.org/wiki/Routhian_mechanics), yikes).[^control] There is a [way](https://physics.stackexchange.com/questions/790569/derivation-of-hamiltonian-by-constraining-lq-v-t-with-v-dotq) of looking at the Hamiltonian as what happens when you enforce the constraint that $$\dot{x} = v$$: the momentum $$p$$ becomes a Lagrange multiplier which tells you how $$L$$ changes as you change the value of $$v$$ and then require that $$\dot{x} - v = 0$$ is true.

[^control]: There is also a whole separate version of this in [control theory](https://en.wikipedia.org/wiki/Hamiltonian_(control_theory))

I find this perspective helpful: that maybe all the Lagrangian _ever_ was was the Legendre transform of something else. There was in the first place an optimization problem, which in physics was "maximize action", that is, maximize $$dS = -m \d \tau = - (T \d t - p \cdot d \b{x}) = - T \d t + 2 T \d t = T \d t$$. But we had constraints, so we add them in, and each one takes the form of a Legendre transform term. $$F = ma$$ as a constraint has multiplier $$\frac{dS}{dF} = d \b{x}$$ giving $$- V_x d \b{x}$$ which we write as $$- V$$. A constraint $$g(\b{x}) = 0$$ gives $$- F \cdot g$$. And $$\dot{x} = v$$ rewrites the whole thing in terms of $$p = L_{\dot{x}}$$. 

Something like that. I guess there's a lot more to figure out. Oh well.

In summary:

1. $$L$$ is a meaningful function, not just a bookkeeping trick. In particular it is like a linearization of $$f$$ but only on $$G$$, such that it is forced to obey the constraint. 
2. $$L$$ acts like a Legendre transform of $$f$$ with respect to the $$G_{\perp}$$ variables. We can think of space as being parameterized by $$(G, G_{\perp})$$ and then using $$L$$ we write $$f$$ as a function of $$(G, \frac{df}{dG_{\perp}})$$ instead.

-------

# 5. The Meaning of $$\vec{\lambda}$$


In practice, the values of $$\lambda^* = \frac{df^*}{dG^*}$$ are meaningful and interesting. After all these constraint problems are about imposing some condition on a system and then trying to optimize it. Well, the derivatives $$\frac{df}{dG}$$ tell you how the system's value changes when you vary the constraint values, and the optimum value $$\lambda^* = \frac{df^*}{dG^*}$$ tells you how it will happen at the maximum. 

Here are some examples:

In economics, if the function being maximized is something like "profit" and the constraint is some condition on the business that forces $$g = g^*$$, then the multiplier $$\lambda^*$$ tells you how much more profit you will get if you can change that condition, and the highest multiplier tells you which change gives the highest marginal returns. (Wikipedia tells me that $$\lambda$$ is called the [marginal cost](https://en.wikipedia.org/wiki/Marginal_cost) or [shadow price](https://en.wikipedia.org/wiki/Shadow_price))

In physics, if a system is constrained to follow a certain surface in space given by $$g = g^*$$, then the Lagrange multiplier for that system is the normal fore which holds the system to that surface. Also there is a sense, alluded to above but which I'll have to work out some other day, in which $$L = T - V$$ is the Lagrange multipler form of $$F = ma$$: you can move in the potential, but there's a cost, and the multiplier is a force $$F$$.

Also in physics, if two systems are in thermodynamic equilibrium, then they are modeled as maximizing entropy subject to their total energy being constant. You find that the Lagrange multiplier $$\frac{dS}{dE} = \frac{1}{T}$$, that is, inverse temperature is the multiplier for energy. Many of the other variables which characterize various types of exchanges of entropy between two systems can be modeled as multipliers: pressure $$P$$ is the multiplier for changes in volume $$V$$, chemical potential is the multiplier for changes in particle ratio; presumably there are many others.

In each case the multiplier acts like a "force" or "pressure" or "marginal utility". It tells you how the maximum value changes when you change some parameter of a system. There's a very general way of looking at it:

1. Suppose there is a system that optimizes some quantity. For thermodynamics, it's $$S$$, the entropy.
2. If you split the system in two parts that exchange some conserved quantity $$E = E_1 + E_2$$, then the individual systems still maximize $$S = S_1 + S_2$$. They do _not_ maximize their $$S_i$$ because they should have to give away some $$S$$ if it makes the other system's $$S$$ go up by more.
3. Therefore at their maximum, there's a balance between the two values of $$\frac{dS}{dE}$$, and the two systems end up maximizing $$S_i - \frac{dS_i}{dE_i} (E_i)$$ instead. The quantity $$\lambda = \frac{dS_i}{dE_i}$$ is the Lagrange multiplier. For thermodynamics it turns out to be the the inverse temperature, $$\frac{1}{T}$$, so the maximized value for each subsystem is $$S - \frac{1}{T} E$$ or $$TS - E$$ instead (the negative[ Helmholtz free energy](https://en.wikipedia.org/wiki/Helmholtz_free_energy)).
4. When the multiplier $$\lambda$$ is treated as a free variable, then you are leaving the rate of exchange with other systems open to vary: for instance, you solve for a system which is maximizing $$S$$ while held to some temperature $$T$$. Probably it is connected to a much-larger reservoir that can take or give it energy if its value of $$T$$ ever changes. As far as the system is concerned, its job is to maximize $$TS - E$$ for fixed $$T$$ and variable $$E$$.
5. Something like this holds for _any_ number of systems that can exchange _any_ quantity while optimizing for something else. In thermo there are versions of this for every choice of quantities that might you fix versus vary; for instance [Gibbs Free Energy](https://en.wikipedia.org/wiki/Gibbs_free_energy) is the maximized quantity if temperature and pressure are fixed but volume and energy are allowed to vary.

So for any coupled set of systems that optimize a variable $$S$$ there is some quantity $$\lambda$$ which measures the "marginal value of giving up a unit of $$S$$ to someone else". If another system can get more optimum out of a quantity such as a unit of energy, the system we're looking at would rather give up a unit to the other system than use it itself. The only way the whole system ends up at a maximum is if everyone's values of $$\lambda$$ equilibrate: otherwise, there is still an improvement to be made.

This argument is _super_ general. Even in the abstract optimization problem that we've been considering, it's there: $$\lambda$$ tells us how the system _could_ change, were we allowed to change the value of $$G_{\perp}^*$$. Give me another system to get values of $$G_{\perp}^*$$ from and I can use it to get more value out of $$f$$. That is why we care about the value of $$\lambda$$ even though it gets cancelled out in $$L$$: because in every situation in practice, there _are_ externalities and constraints that might be changed, and $$\lambda$$ tells us how it works.

Suppose you are a strangely calculating, rational person, and you're trying to make a decision in your life, like picking a job and place to live that optimizes your happiness $$H$$. Maybe your job could be improved and your housing could be improved. Well, there is a multiplier: if taking a worse house makes your job better by _more_ than that, you should switch houses to get the better job. Or vice-versa. Or, since you know the value of $$\lambda = \frac{dH}{dC}$$, the return on happiness from making those changes, you should look for other places to make changes that get a better return: change your relationships, get a new hobby, start a rebellion, whatever it takes. Maybe you get a certain negative return on happiness from even _thinking_ about the problem for a time $$t$$ due to some rate of stress $$S = \frac{dH}{dt}$$. Now you shouldn't be thinking about optimizing $$H$$ at all, but rather $$H - S t$$: make your decisions, but don't spend your whole life stressing about them either because you'll eat into the reward that way.

That's right. Lagrange Multipliers are everywhere. They're basically a moral philosophy, hiding under a not-very-compelling pile of poorly-understood calculus hacks. Sheesh.



