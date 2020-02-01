---
layout: article
title: "Note on Covariance and Lagrangians"
math: true
aside: true
footnotes: true
---

## 1. Regarding 4-vectors.

Let's clear up some confusion about 4-vectors, indices, and forms. Consider a Lorentz scalar given by the contraction of two 4-vectors, $$s = a \cdot b$$. The following notations for this are all equivalent (with $$g_{\mu \nu} = \eta_{\mu \nu}$$ when necessary):

$$\begin{aligned}
a \cdot b &= a^\mu b_{\mu}  \\
&= a_{\mu} b^{\mu}\\
&= a_0 b_0 - a_1 b_1 - a_2 b_2 - a_3 b_3 \\
&= g(a,b) \\
&= g \cdot (a, b) \\
&= g_{\mu \nu} a^{\mu} b^{\nu} \\
&= g^{\mu \nu} a_{\mu} b_{\nu} \\
&= g_{\mu}^{\nu} a^{\mu} b_{\nu} \\
&= (a_0 \; a_1 \; a_2 \; a_3) \, [G] \,  (b_0 \; b_1 \; b_2 \; b_3)^T \\
&= (a_\mu dx^{\mu}) \cdot (b^{\nu} \p_{\nu}) \\
&= a_{\mu} b^{\nu} dx^{\mu} \cdot \p_{\nu} \\
&= (ds^2) \cdot (a^{\mu} \p_{\nu} , b^{\nu} \p_{\nu}) \\
&= (ds^2) \cdot (a^{\mu} \p_{\nu} \o b^{\nu} \p_{\nu}) \\
&= (g_{\sigma \rho} dx^\sigma dx^{\rho}) \cdot (a^{\mu} \p_{\nu} , b^{\nu} \p_{\nu}) \\
&= g_{\sigma \rho}a^{\mu} b^{\nu}  (dx^\sigma \cdot \p_{\mu} ) (dx^{\rho} \cdot \p_{\nu})\\
&= g_{\sigma \rho}a^{\mu} b^{\nu} g^{\sigma}_{\mu} g^{\rho}_{\nu} \\
&= g_{\mu \nu}a^{\mu} b^{\nu} \\

\end{aligned}$$

Notes: $$[G]$$ refers to the matrix representation of $$g$$. "$$\cdot$$" refers to the operation of a form acting on a vector (recall that forms are defined as mappings from vectors to scalars). $$g(a,b)$$ is how this is usually written, so I included that also.

In summary I claim that $$ds^2$$ _is_ the metric tensor, written in a funny way.

## 2. The Metric

Recall that $$g$$ is a symmetric matrix. Do you know why? I have a hunch that it's symmetric becasue it misrepresents the actual field.

In exterior algebra I have found it very useful to emphasize that a linear transformation $$A$$ gives rise to a whole family of linear transformations $$\^k A \equiv A^{\^k}$$ -- defined by, for instance, $$A^{\^ 2} (x \^ y) = (Ax \^ Ay)$$. I think a good name for this is an 'induced transformation', so $$A$$ induces the transformation $$A^{\^2}$$ on $$\^^2 V$$.

Well, there is also an induced transformation on scalar products: $$A$$ turns $$\< u, v\>$$ to $$\< A u, Av \>$$. As matrices, this is $$u^T A^T A v$$. $$A^T A$$ is a symmetric matrix, so we can also write this as $$g = A^T A$$ being the matrix which takes a vector to its dual. But this is silly: what's really going on is that _all_ vectors should have $$A$$ applied, rather than dual vectors having $$A^T A$$ applied.

Of course, $$g = A^T A$$ has only $${ n+1 \choose 2} = 10$$ components, while $$A$$ has 16 -- so maybe $$g$$ is the 'real' value and $$A$$ would overspecify it. But I'm more inclined to believe that (a) dual vectors are silly and (b) in some way, the other 6 components of $$A$$ matter, we just haven't figured out where. Dual vectors are so tedious that I have trouble believing reality cares about them.

## 3. Integration

A comment about how integration works

Argument: in fully generality, integration (a) pairs a 1-vector with a 1-form at each point on the path of integration and (b) sums them up over the whole path. (The fact that we do this at an infitesimal level is unimportant.) It is essentially a giant dot product. For instance an integral $$I = \int_{\gamma} f(x) dx$$, if for some reason the path just had to be evaluated at finite points, then:

$$I = f(c_1) dx \cdot \p \gamma \| _{c_1}  + f(c_2) dx \cdot \p \gamma \|_{c_2}  + f(c_3) dx \cdot \p \gamma \|_{c_3} + \ldots $$

Each $$\p \gamma \|_{c_i} $$ term is a (weird) way of writing "a tangent vector at $$c_i$$". It says: okay, at this point the curve is going in a certain direction, so contract $$f(c_i) dx$$ with that direction to find out how the form changes along that path. But the whole thing is a _giant dot product_ at every point along the curve, and we could easily write it like this:

$$I = (f(c_1), f(c_2), \ldots) \cdot (\gamma(c_1), \gamma(c_2), \ldots) = \sum_i f(c_i) \cdot \gamma(c_i)$$

Where every component is itself a vector (_not_ a form) in whatever space they live in. The only purpose of the use of a 1-form is to formally specify that it is "a thing which takes a vector to a scalar", which is what makes this whole sum work out to $$I \in \bb{R}$$ (or whatever scalar space we want to end up in). But we could in theory come up with a notation that treats both sides of the integral as vectors, and defines the $$f(c_1) \cdot \gamma_{c_1}$$ in such a way that it has the right transformation properties (ie uses the metric internally).

Note that if we use $$g = A^T A$$ as in our previous section, then our integral can be modeled as either

$$\sum_i (g_{\mu \nu} f^{\mu}(c_i)) \cdot \gamma(c_i)$$

_or_ as

$$\sum_i (A_{\mu \nu} f^\mu(c_i)) \cdot (A_{\mu \nu}\gamma^{\nu} (c_i))$$

And these necessarily give the same results. Various other ways of writing this using the glossary at the top also work. The point is that integration is _many applications of a dot product, added up_, and any way of computing or notating the dot product is equally valid.

## 4. Line Integrals

What's going on when we integrate $$\sqrt{ds^2} = ds$$? (note "$$= ds"$$ should be understood to be sketchy here).

Let me just say that, after the previous section, I think it's clear that line integrals are sorta cheating.

$$\int f ds$$ appears to have a 1-component 1-form $$ds$$, despite the fact that it is integrating in $$n$$-dimensional space. How does it pull off this trick?

The answer is that there is a simplification that has already been performed: that the path of integration and the integrated form are _parallel_ (when regarded as vectors). Here is a 'full' line integral:

$$\int df = \int f_{\mu} dx^{\mu}$$

Suppose at some point the tangent vector for the path is $$\vec{v} = v^{\sigma} \p_{\sigma}$$. Then in general the contribution to the integral at this point will of course be

$$\vec{v} \cdot df = df(\vec{v})= v^{\sigma} \p_{\sigma} f_{\mu} dx^{\mu} = v^{\sigma} f_{\sigma} = v^0 f_0 - v^1 f_1 - \ldots$$

This is the _actual_ line integral under consideration. If we happen to know that $$df(\vec{v}) = \| df \| \| v \|$$ -- ie, the two objects, when treated by vectors, are parallel -- then we can just write this directly. Normally this would only happen if $$df = h(s) (\vec{v}^*)$$, where $$h(s)$$ is some scalar function of the arc length, and $$\vec{v}^* = g_{\sigma \nu} v^{\sigma}$$ is the dual vector to $$\vec{v}$$.

But! we can cheat. If we know that we're only going to integrate $$df$$ along a particular curve, then we can just 'chop off' all of its other components, guaranteeing that $$df \parallel \vec{v}$$. A very simple place where this happens is if you started with a function that's a function of the arc length anyway, such as the length of a curve. If $$L = \int ds$$ along a curve, then of course $$\p_s L$$ will only ever be evaluated along the curve -- it's not even defined anywhere else.

This is what's going on inside the relativistic line integral $$\int \sqrt{ds^2} = \int ds$$. $$ds$$ is defined as the length of the curve anyway, so we can treat it as a 1-component 1-form integrated along a 1-dimensional path rather than a 4-component 1-form integrated along a 4-component path. You absolutely could write $$\p_s L(s) = (L_t t_s, L_x x_s, L_y y_s, L_z z_s)$$. But why bother, when you're just going to integrate it in one dimension anyway?

In general relativity, by the way, I seem to recall that we run into $$\sqrt{-g}$$ factors in integrals. This is because an integral $$\int d^4 x$$ in flat space, when a transformation $$A$$ is applied, it undices the transformation $$d^4 x \ra d^4 (Ax) = A^{\^4} d^4 x$$. Since $$g^{\^4} = \det g = \det A^T A = (\det A)^2$$, then $$d^4 x \ra \sqrt{- g}$$ [tbh I don't know where the minus sign comes from; I assume it means that $$g = -A^T A$$ is the actually correct equation].

Then if you do the trick above, and cut 3 dimensions, for instance if you integrate over $$dx \^ dy \^ dz$$, you are left with only a $$dt$$ term, but you might still have the $$\sqrt{-g}$$ term, depending on how you do it (unsure on this).

--------

## 5. Lagrangians

Which brings us to the Lagrangian.

We agree that $$S = \int -m d \tau$$, and so $$L = dS/d \tau = -m$$ in the reference frame. 

A few things that are true:

$$dS/dt = L$$ in any reference frame.

$$L$$ is _not_ a Lorentz scalar (clearly, because it transforms under coordinate transformations). Nor is it a Lorentz vector, because it is only a time component in every frame.

$$dS/d \tau = -m$$, on the other hand, is a Lorentz scalar. To be explicit, it is the exterior derivative of the 0-form $$S$$, $$dS = S_{\tau} + (\text{ other terms})$$, acting on the (frame-independent) vector $$\p_{\tau}$$: $$-m = dS(\p_{\tau}) = \p_{\tau} S$$.

$$dS$$ is a Lorentz 1-form, which tranforms appropriately in every reference frame.

$$\p_{\tau}$$ is a Lorentz vector, which transforms appropriately in every reference frame.

If we boost a particle with velocity $$v$$, then it is now traveling on a trajectory which is parallel to the $$\p_{\tau}$$ vector. _This is important_. The line integral we will use for the action is _parallel to the motion_. That means we can use the trick from the last section, and turn a 4-dimensional integral into a 1-dimensional one. 

Thus here are a bunch of equivalent forms of the action using the chain rule in various ways:

$$\begin{aligned}
S &= \int dS \\
&= \int S_{\tau} d \tau \\
&= -m \int d \tau \\
&= \int S_t dt - S_{\vec{x}} d\vec{x}\\
&= \int S_t t_{\tau} d\tau - S_{\vec{x}} \vec{x}_t t_{\tau} d \tau \\
&= \int (S_t - S_{\vec{x}} \vec{x}_t) t_{\tau} d \tau \\
&= \int (S_t - S_{\vec{x}} \cdot \vec{v}) \gamma^{-1}(v) d \tau \\
\end{aligned}$$

But the most important one is:

$$\begin{aligned}
S &= -m \int d\tau \\
&= -m \int \frac{d \tau}{dt} dt \\
&= -m \int \gamma(v)^{-1} dt \\
&= \int L dt
\end{aligned}$$

The point is that this is just one of many ways to write a 1-d integral in 4-dimensions. You are only ever going to integrate this form along the direction of motion! If you don't like using one component or the other, just chain rule it away.

Here we have chain ruled it away like this (kinda cheating with $$x/t = v$$, but it's true for a flat path!):

$$\begin{aligned}
\tau &= \sqrt{t^2 - x^2} \\
d \tau &= \frac{t dt - x dx}{\sqrt{t^2 - x^2}} = \frac{dt - x/t (v dt)}{\sqrt{1 - x^2 / t^2}} \\
&=  \frac{1 - v^2}{\sqrt{1 - v^2}} dt \\
&=  \gamma^{-1} dt\\
S &= -m \int \gamma(v)^{-1} dt \\
\end{aligned}$$

But heck here's $$S$$ as an integral in $$\vec{x}$$:

$$\begin{aligned}
d \tau &= \frac{t dt - x dx}{\sqrt{t^2 - x^2}} \\
&= \frac{dx/v - v dx}{\sqrt{1 - x^2 / t^2}} \\
&= \frac{1/v (1-v^2)}{\sqrt{1 - x^2 / t^2}} dx \\
&= \gamma^{-1}/v dx \\
S &= -m \int \gamma^{-1}/\vec{v} \cdot d\vec{x}
\end{aligned}$$

(yeah okay this is just $$dt = d\vec{x}/\vec{v}$$ or something)

(presumably $$\vec{v}^{-1}$$ may be interpeted as one of those 'inverse basis vectors', $$\iota_{\vec{v}}/\| \vec{v} \|^2$$. Not sure. But this would work if we just used one component of $$v$$ also.)

The point is that $$S = \int L dt$$ is really sweeping a lot under the rug. $$dS = S_t dt - S_x dx$$ is the _interesting_ quantity. The action integral really conceals that.