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

In general relativity, by the way, I seem to recall that we run into $$\sqrt{-g}$$ factors in integrals. This is because an integral $$\int d^4 x$$ in flat space, when a transformation $$A$$ is applied, it undices the transformation $$d^4 x \ra d^4 (Ax) = A^{\^4} d^4 x$$. Since $$g^{\^4} = \det g = \det A^T A = (\det A)^2$$, then $$d^4 x \ra \sqrt{- g}$$ [tbh I don't know where the minus sign comes from; I assume it means that $$g = -A^T A$$ is the actually correct equation].

Then if you integrate over $$dx \^ dy \^ dz$$, you are left with only a $$dt$$ term, but you might still have the $$\sqrt{-g}$$ term, depending on how you do it (unsure on this).


## 3. Integration

A comment about how integration works

Argument: in fully generality, integration (a) pairs a 1-vector with a 1-form at each point on the path of integration and (b) sums them up over the whole path. (The fact that we do this at an infitesimal level is unimportant.) It is essentially a giant dot product. For instance an integral $$I = \int_{\gamma} f(x) dx$$, if for some reason the path just had to be evaluated at finite points, then:

$$I = f(c_1) dx \cdot \p \gamma \| _{c_1}  + f(c_2) dx \cdot \p \gamma \|_{c_2}  + f(c_3) dx \cdot \p \gamma \|_{c_3} + \ldots $$

Each $$\p \gamma \|_{c_i} $$ term is a (weird) way of writing "a tangent vector at $$c_i$$". It says: okay, at this point the curve is going in a certain direction, so contract $$f(c_i) dx$$ with that direction to find out how the form changes along that path. But the whole thing is a _giant dot product_ at every point along the curve, and we could easily write it like this:

$$I = (f(c_1), f(c_2), \ldots) \cdot (\gamma(c_1), \gamma(c_2), \ldots) = \sum_i f(c_i) \cdot \gamma(c_i)$$

Where every component is itself a vector (_not_ a form) in whatever space they live in. The only purpose of the use of a 1-form is to formally specify that it is "a thing which takes a vector to a scalar", which is what makes this whole sum work out to $$I \in \bb{R}$$ (or whatever scalar space we want to end up in). But we could in theory come up with a notation that treats both sides of the integral as vectors, and defines the $$f(c_1) \cdot \gamma_{c_1}$$ in such a way that it has the right transformation properties (ie uses the metric internally).

Note that if we use $$g = A^T A$$ as in our previous section, then our integral can be modeled as either

$$\sum_i (g_{\mu \nu} f^{\mu}(c_i)) \cdot (\gamma^{\nu}(c_i))$$

_or_ as

$$\sum_i (A_{\mu \nu} f^\mu(c_i)) \cdot (A^T)^{\nu \rho}\gamma_{\rho} (c_i))$$

And these necessarily give the same results. Various other ways of writing this using the glossary at the top also work. The point is that integration is _many applications of a dot product, added up_, and any way of computing or notating the dot product is equally valid.

## 4. Line Integrals

What's going on when we integrate $$\sqrt{ds^2} = ds$$? (note "$$= ds"$$ should be understood to be sketchy here).

Let me just say that, after the previous section, I think it's clear that line integrals are sorta cheating.

$$\int f ds$$ appears to have a 1-component 1-form $$ds$$, despite the fact that it is integrating in $$n$$-dimensional space. How does it pull off this trick?

The answer is that there is a simplification that has already been performed: that the path of integration and the integrated form are _parallel_ (when regarded as vectors). Here is a 'full' line integral:

$$\int df = \int f_{x^\mu} dx^{\mu}$$

Suppose at some point the tangent vector for the path is $$\vec{v} = v^{\sigma} \p_{\sigma}$$. Then in general the contribution to the integral at this point will of course be

$$df(\p_{\vec{v}})= v^{\sigma} \p_{\sigma} f_{x^\mu} dx^{\mu} = v^{\sigma} f_{x^\sigma} = v^0 f_{x^0} - v^1 f_{x^1} - \ldots$$

This is the _actual_ line integral under consideration. If we happen to know that $$df(\vec{v}) = \| df \| \| v \|$$ -- ie, the two objects, when treated by vectors, are parallel -- then we can just write this directly. Normally this would only happen if $$df = h(s) (\vec{v}^*)$$, where $$h(s)$$ is some scalar function of the arc length, and $$\vec{v}^* = g_{\sigma \nu} v^{\sigma}$$ is the dual vector to $$\vec{v}$$.

But! we can cheat. If we know that we're only going to integrate $$df$$ along a particular curve, then we can just 'chop off' all of its other components, guaranteeing that $$df \parallel \vec{v}$$. A very simple place where this happens is if you started with a function that's a function of the arc length anyway, such as the length of a curve. If $$L = \int ds$$ along a curve, then of course $$\p_s L$$ will only ever be evaluated along the curve -- it's not even defined anywhere else.

This is what's going on inside the relativistic line integral $$\int \sqrt{ds^2} = \int ds$$. $$ds$$ is defined as the length of the curve anyway, so we can treat it as a 1-component 1-form integrated along a 1-dimensional path rather than a 4-component 1-form integrated along a 4-component path. You absolutely could write $$\p_s L(s) = (L_t t_s, L_x x_s, L_y y_s, L_z z_s)$$. But why bother, when you're just going to integrate it in one dimension anyway?

--------

## 5. Lagrangians

Which brings us to the Lagrangian.

We agree that the free particle action $$S = \int -m d \tau$$, and so $$L = dS/d \tau = -m$$ in the reference frame and $$\int -m \gamma^{-1} dt$$ in general.

First, I am pretty sure sure this is true: 

$$\begin{aligned}
S &= \int -m \gamma^{-1} dt \\
&= -\int m \frac{1 - v^2}{\sqrt{1 - v^2}} dt \\
&= - \int m \frac{dt - v dx}{\sqrt{1 - v^2}} \\
&= - \int m \gamma (dt - v dx) \\
&= - \int p_{x^\mu} dx^\mu
\end{aligned}$$

But I'm a little unsure because it seems too easy.

A few things that are definitely true:

$$dS/dt = L$$ in any reference frame.

$$L$$ is _not_ a Lorentz scalar (clearly, because it changes under coordinate transformations). Nor is $$L dt$$ it a Lorentz covector, because it is only a time component in every frame.

$$dS/d \tau = -m$$, on the other hand, is a Lorentz scalar. To be explicit, it is the exterior derivative of the 0-form $$S$$, $$dS = S_{\tau} + (\text{ other terms})$$, which is a Lorentz 1-form, acting on the Lorentz vector vector $$\p_{\tau}$$: $$-m = dS(\p_{\tau}) = \p_{\tau} S$$.

$$dS$$ is a Lorentz 1-form, which tranforms appropriately in every reference frame.

$$\p_{\tau}$$ is a Lorentz vector, which transforms appropriately in every reference frame.

$$dS$$, if defined as a function of space, might have four components in the rest frame: $$(S_{\tau}, S_x, S_y, S_z)$$. The other three _do not_ factor into the line integral, so they are normally completely ignored

If we boost a particle with velocity $$v$$, then it is now traveling on a trajectory which is still parallel to the $$\p_{\tau}$$ vector. _This is important_. The line integral we will use for the action is _parallel to the motion_. That means we can use the trick from the last section, and turn a 4-dimensional integral into a 1-dimensional one. Normally, the transform of a 1-form has 4 components in general. But the transform of the _equation- $$df(\p_{\tau})$$ -- the contraction of a one-form and a _particular_ vector -- can get many forms, as long as it gives the right answer. Namely: $$(f_{\tau}, f_{anything}) \cdot (1, 0,0,0)$$ is the same result.

Anyway here are a bunch of equivalent forms of the action using the chain rule in various ways:

$$\begin{aligned}
S &= \int dS \\
&= \int S_{\tau} d \tau \\
&= -m \int d \tau \\
&= \int S_t dt - S_{\vec{x}} d\vec{x}\\
&= \int S_t t_{\tau} d\tau - S_{\vec{x}} \vec{x}_t t_{\tau} d \tau \\
&= \int (S_t - S_{\vec{x}} \vec{x}_t) t_{\tau} d \tau \\
&= \int (S_t - S_{\vec{x}} \cdot \vec{v}) \gamma^{-1}(v) d \tau \\
\end{aligned}$$

But the normal one for the Lagrangian is:

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

Okay, if you believe me so far, then you believe me $$S = \int L dt = \int -m d \tau$$. The one-form we're integrating here is $$(-m, 0, 0, 0) = -m d \tau$$. But, recalling that $$p^\mu = (m, 0, 0, 0)$$ is the 4-momentum vector in the rest frame, this appears to be the (negative) _dual_ four-momentum $$-p_{\mu}$$. So I claim that 

$$S = - \int dp$$

is the 'true' form of the action: the momentum is the derivative of the action! Kinda neat.

By the way, notice that if our path is one with a constant velocity, then this can be written $$S = - p_\mu \int dx^\mu = - p_{\mu} x^\mu$$, which is the reason that the fundamental modes for a free particle are expanded in terms of this:

$$\psi = e^{i S /\hbar} = e^{- i p_{\mu} x^{\mu}/\hbar}$$

So I'm not just making this up; we already use it. (The Klein-Gordon equation $$(\hbar^2 \p^2 + m^2) \psi = 0$$ simply says that $$\| p \| = -m$$, so it restricts which modes comprise the particle by one dimension.) (I'm being a little reckless with signs here.)


## 6. Potentials

Suppose we know that $$L = T - V$$. But we also know that $$m d \tau = -m \gamma^{-1} dt \approx (-m + \frac{1}{2} m v^2) dt$$. Let's write thi as $$m d\tau = K dt$$, where $$K$$ will mean the full relativistic momentum term. The $$m$$ term is usually missing here, but is, I suppose, important if we care about the actual phase instead of just relative differences. This means that the usual classical Lagrangian is

$$S = \int S_t dt - S_{\vec{x}} d\vec{x} = \int (S_t - S_{\vec{x}} \cdot \vec{v}) dt = \int (K - V) dt$$

We expect that we should be able to rework $$- V dt$$ to be a full four-component one-form. Suppose that we knew it had components $$u_t dt - u_{\vec{x}} \cdot d\vec{x}$$ [these are not partial derivatives -- yet]. Then

$$-V dt = (u_t - u_{\vec{x}} \cdot \vec{v}) dt$$

For a time-independent potential, this gives $$V dt = (u_{\vec{x}} \cdot \vec{v}) dt = u_{\vec{x}} \cdot d \vec{x}$$, which looks a lot like the _work_ done due a potential $$u$$.

Suppose that these $$u_{\mu}$$ were actually partial derivatives $$U_{\mu}$$ of a scalar field $$U$$. Then 

$$\int U_{\mu} dx^{\mu} = \int (U_t - U_{\vec{x}} \cdot \vec{v}) dt$$

would give the change in $$U$$ along a path. If we write $$V(\vec{x}) = U_{\vec{x}} \cdot \vec{v}$$ for a time-independent potential, or $$V(x, t) = U_{\vec{x}} \cdot \vec{v} - U_t$$ for a time-dependent potential, then we get things that act like normal potentials in classical mechanics?

Of course there is no reason to believe that a potential may be integrated this way in general. I believe what is happening is that $$\int V dt$$ is standing in for doing this: regardless of what local form of the potential is, this integral represents the phase change due to it. In some cases we might be able to write it as a scalar function, but even if we can't it still gives the correct dynamics.

Anyway it seems nice to think that these are all the same thing:

$$S = P + U = \int dP + dU = \int (K - V) dt = \int L dt$$


## 7. Euler-Lagrange - WIP

We should be clear about something: there are three different velocities. 

1. There's the $$v$$ of the reference frame, which tells us how to turn $$S_{\tau} d\tau = S_t dt - S_{\vec{x}} \cdot d \vec{x}$$. 
2. There's the $$v$$ of the path of integration, which tells us how $$S_{\vec{x}} \cdot d\vec{x} = (S_{\vec{x}} \cdot \vec{v}) dt$$. 
3. And there's the $$v$$ of the particle motion itself (when we're solving for in classical mechanics).

When we are solving for a particle's motion in classical mechanics, we are identifying (2) and (3), and trying to find a path of integration that conserves momentum at each point (d'Alembert's principle). In any case, these are _not_ the same as the $$v$$ of the reference frame, I think.

todo: figure out how this works.


## 8. E&M - WIP

We don't really think that the E&M field (our usual potential) is a scalar field. Its classical Lagrangian is $$L_{EM} = - \frac{1}{2} \| dA \|^2 - A_{\mu} J^{\mu}$$.[^squared]

[^squared]: Justification of $$\| dA \|^2$$: $$dA$$ is a 4x4 antisymmetric tensor with components given by $$A_{\mu \^ \nu}$$. We know that $$dA_{i \^ 0} = \vec{E}_i$$ and $$dA_{i \^ j} = \vec{B}_{i \^ j}$$ [note: either of these might have minus signs; not sure]. Regardless of signs, $$\| dA \|^2 = \| \vec{E} \|^2 - \| \vec{B} \|^2$$. Compare to $$F_{\mu \nu} F^{\mu \nu} = 2(E^2 - B^2)$$. The factor of $$\frac{1}{2}$$ comes from the fact that if you contract $$dA$$ as a tensor, you get two copies of each component compared to if you treat it as a bivector, because $$x \o y$$ and $$y \o x$$ are different basis elements in the tensor formulation.

The field-theory Lagrangian improves the second term to $$\bar{\psi} (q A_{\mu} \gamma^{\mu}) \psi$$, but this basically expresses the same thing. The gamma matrix only serves to convert into the funky basis of $$\psi$$; it is essentially $$A_{\mu} (q \| \psi \|^2)^{\mu}$$. More on this later (?). Basically, $$A$$ couples to an electron via its decomposition as a (bi)-spinor.

The classical and probably first-order version of the coupling, separating free- and bound- currents is given as:

$$L = \frac{1}{2} (dA)^2 - A_0 \rho + \vec{A} \cdot \vec{J} + \vec{E} \cdot \vec{P} + \vec{B} \cdot \vec{M}$$

Where $$\vec{P}$$ is the electric polarization (electric dipole moment) and $$\vec{M}$$ is the magnetization (magnetic dipole moment). We can do better:[^EM]

$$L = \frac{1}{2} (dA)^2 - A \cdot J + dA \cdot dJ$$

[^EM]: the first term, $$\frac{1}{2} (dA)^2$$, is really part of the last term. The vacuum itself has a polarization $$dJ$$, and apparently couples to itself, just like any other polarized object.

I write it this way because a spin is a magnetic dipole moment (rather than a net current), and so couples to the derivative of $$A$$ and fits into the second term here: $$dA \cdot S$$.
