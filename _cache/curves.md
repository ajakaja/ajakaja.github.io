---
layout: article
title: "A brief-ish note on derivatives and wedge products"
footnotes: true
math: true
aside: true
---

First, let me remind you about the classic formulation of the differential geometry of curves in 3D.

Start with a curve parameterized by arc-length: $$\b{q}(s) = (x(s), y(s), z(s))$$, with $$\| \b{q}'(s) \| = 1$$. We are going to construct an orthogonal basis of unit vectors $$\{ \b{T}, \b{N}, \b{B} \}$$ which moves along with the curve, called the [Frenet frame](https://en.wikipedia.org/wiki/Frenet%E2%80%93Serret_formulas).

$$\b{T}$$ is the **unit tangent vector**, which is just the derivative because we are parameterizing by arc-length:

$$\b{T}(s) = \b{q}'(s)$$

$$\b{N}$$ is the **unit normal vector**. The tangent vector, being a unit vector, has a derivative which only rotates, and is purely orthogonal to it ($$d(T \cdot T) = 2 T' \cdot T = d(1) = 0$$, so $$T' \perp T$$). Its derivative is the _curvature vector_, the magnitude is the _curvature_, and the unit vector is the _normal vector_:

$$\b{T}'(s) = \kappa(s) \b{N}(s)$$

If a curve rotates in a plane, it has a non-zero curvature. $$\frac{1}{\kappa(s)}$$ is the **radius of curvature**, which is the radius of the **osculating circle**, which is the circle that could be fit into the curve at that point. _Osculating_ is from the Latin word for _kissing_. The plane spanned by $$\{ \b{T}, \b{N} \}$$ is the **osculating plane**. Note that straight lines have curvature 0, so they appear to have an infinite radius of curvature, but there's no way to pick $$\b{N}$$ to construct a particular plane.

Since we have two orthogonal vectors, $$\b{T}$$ and $$\b{N}$$, we can construct a third (at least wherever $$\kappa(s) \neq 0$$). $$\b{B} = \b{T} \^ \b{N}$$ is the **unit binormal vector**. It's actually a bivector, and does transform like one under coordinate changes. 

If a curve is 'spiraling', the binormal rotates around the curve. Because $$\b{B}' = (\b{T} \^ \b{N})' = \b{T}' \^ \b{N} + \b{T} \^ \b{N}' = \b{N} \^ \b{N} + \b{T} \^ \b{N}' = 0 + \b{T} \^ \b{N}$$, it is always orthogonal to $$\b{T}$$ and parallel to $$\b{N}$$. Since it spirals around the curve and its magnitude represents the speed of spiraling, $$\b{B}'$$ is called the **torsion vector**, and its magnitude is the torsion:

$$\b{B}'(s) = \tau(s) \b{N}(s)$$

When $$\kappa(s)$$ doesn't stay at 0 ever, then $$\kappa(s)$$ and $$\tau(s)$$ fully describe the curve up to translations / rotations (basically: pick a starting frame and then integrate them).

Finally, we can pick through these formulas to get $$\b{N}'(s) = -\kappa(s) \b{T}(s) - \tau(s) \b{N}(s)$$.

Okay, that's all. There's clearly some weirdness in this description, especially when bivectors are brought in. And it's interesting that torsion doesn't exist on straight lines. Actually, you could imagine a straight line having a frame which spins around it (perhaps a tiny spiraling frame which is too small to see?) -- but there's no way to express that in terms of derivatives of a curve $$\b{q}(s)$$!

This is not what I actually wanted to talk about, it's just what I was thinking about when I got to thinking about the next section.

---------

## 1 Bivectors and derivatives

$$\b{T}$$ is a unit vector, so its derivative purely rotates. It should be describable as a _bivector_, right? But above it was a vector:

$$\b{T}(s + \D s) = \b{T}(s) + \D s \b{T}'(s) + O(\D s^2) \\
= \b{T}(s) + \D s (\kappa(s) \b{N}(s)) + O(\D s^2)$$

I thought about this for a bit and decided that the way it's written as a bivector is when you try to express it as an operator acting on $$T$$:

$$\b{T}(s + \D s) = \b{T}(s) + \D s \kappa(s) (\b{T} \^ \b{N})[\b{T}]$$

$$(\b{T} \^ \b{N})[\b{T}]$$ is what I'm talking about. In the $$(\b{T}, \b{N})$$ plane, we can write that bivector as an antisymmetric matrix, like this:

$$\begin{pmatrix} 0 & -\e \\ \e & 0 \end{pmatrix} \begin{pmatrix} t \\ n \end{pmatrix} = \begin{pmatrix} t - \e n \\ n + \e t \end{pmatrix} $$

In the 1st-order series above, it just translates in the $$\D N$$ direction (because the tangent vector of a circle at $$(1,0)$$ is $$(0,1)$$).

$$\b{T}(s + \D s) = \begin{pmatrix} 1 \\ \D s \kappa(s) \end{pmatrix}$$

We could also write this as: 

$$\b{T}(s + \D s) = \big[ \b{I} + \D s \kappa(s) (\b{T} \^ \b{N}) \big] \b{T}(s)$$

Where $$\b{I}$$ is the identity operator and I'm still treating $$\b{T} \^ \b{N}$$ as an antisymmetric matrix. I guess I think it's interesting that:

1. the derivative of $$\b{T}$$ is $$\kappa(s) \b{N}$$
2. $$\b{T} \^ \b{T}' = \b{T} \^ \kappa(s)  \b{N} = \kappa(s) \b{B} $$ is the operator which _acts on_ $$\b{T}$$ to create its derivative
3. We might think of $$\kappa(s) \b{B}(s) $$ as a sort of 'operator derivative' of $$\b{T}$$: what operator applies to $$\b{T}$$ to creates its derivative? Or maybe it's $$\big[ \b{I} + \kappa(s) \b{B}(s) \big]$$ that does that.
4. The second-derivative $$\b{B}'(s) = \tau(s) \b{N}$$ is also necessary to describe the path completely.

The derivatives of all three together can be written like this (nb: I am using the opposite sign for $$\tau$$ compared to Wikipedia here, cause my book does):

$$\begin{pmatrix} \b{T}' \\ \b{N}' \\ \b{B}' \end{pmatrix} = 
\begin{pmatrix} 0 & \kappa & 0 \\ -\kappa & 0 & -\tau \\ 0 & \tau & 0 \end{pmatrix} 
\begin{pmatrix} \b{T} \\ \b{N} \\ \b{B} \end{pmatrix} $$

Which is antisymmetric and might be written as a bivector, via $$= - \kappa (\b{T} \^ \b{N}) + \tau(\b{N} \^ \b{B})$$.

This lets you express the derivative of an entire matrix of vectors at the same time. if $$\b{M} = (\b{T}, \b{N}, \b{B})^T$$, then:

$$\b{M}(s + \D s) = \big[\b{I} + \D s (- \kappa (\b{T} \^ \b{N}) + \tau(\b{N} \^ \b{B}))\big] \b{M}(s)$$

-----

## 2

I wonder about this stuff because it seems like there is some deep connection between wedge products and derivaties, and this doesn't feel like it but it's suggestive, I guess.

Should I be thinking about $$f(s + \D s) - f(s) = O[f(s)]$$ as a sort of 'derivative operator'? Or maybe we should say:

$$f'(s) = O[f(s)]$$

Or even:

$$f'(s) \circ [f(s)]^{-1} = O$$

... Whatever that means. Inverting operators is messy business.

When dealing with vector functions like $$\b{q}(s)$$, this suggests that we can split the derivative into a rotation- and scaling- parts, akin to how complex-analytic functions have derivatives $$f'(z) = re^{i \theta}$$. But in $$N>2$$, we could scale or rotate each component separately:

$$\begin{aligned}
\b{q}(s + \D s) &= \b{q} + \D s \frac{\b{q}'}{\b{q}} \circ \b{q} \\
&\approx \b{r} e^{\b{i} \theta} \b{q}
\end{aligned}$$