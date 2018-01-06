---
layout: article
title: "Miscellaneous Observations on Calculus"
math: true
category: notes
---

I keep noticing patterns in calculus that feel like there's more structure hiding behind them. And I keep noticing "simplifying intuitions" that, I feel, aren't widely known or at least widely shared. But I'm not not sure what to do with it, or if explanations hide deep in analysis somewhere. For now I'll just write things down.

These are at no particular level of sophistication. The first one is very elementary. The rest are about random things I know about.


## 0) Simple identities

It's surprisingly uncommon to, rather than memorizing integration by parts $$\int_{B} u dv = uv \vert_{B} - \int_{B} v du$$, just compute it from the product rule:

$$d(uv) = u dv + v du$$

$$uv \vert_{B} = \int_{B} d(uv) = \int_{B} u dv + \int_{B} v du$$

$$\int_{B} u dv = uv \vert_{B} - \int_{B} v du$$

Same with, rather than memorizing the 'quotient rule' $$d \frac{u}{v} = \frac{(du)v - u(dv)}{v^{2}}$$, deriving it:

$$d(u v^{-1}) = (du) v^{-1} + u (d v^{-1}) $$

$$= (du) v^{-1} + -u (dv) v^{-2} = \frac{(du) v - u (dv)}{v^{2}}$$

## 1) Leibniz rule for Derivatives

Differentials $$Df$$ in physics seem to always have the 'product rule' / 'Leibniz rule' as their 'defining' property:

$$D(uv) = (Du) v + u (Dv)$$

Or, sometimes, the commutator:

$$[D, x] = Dx - xD = 1$$

Or sometimes as a commutation relation:

$$D x = x D + D(x)$$

Which are essentially restatements of the Leibniz rule. The commutator properties, by the way, only makes sense in the context of 'application on a function', and are intended to expand to expressions like:

$$[D, x] f = D (xf) - x D(f) = f + x D(f) - x D(f) = f = If$$

So in $$[D, x] = 1$$, the $$1$$ is the 'identity operator on functions', $$1f = f$$, rather than the constant value $$1$$. And in $$xD + D(x)$$, the first term is multiplication while the second is $$D$$ actually *applied to $$x$$*. And the multiplication operation that's implied in $$Dx - xD = 1$$ is 'right-binding operator application' multiplications, so $$X$$ is the operator that 'multiplies by x':

$$f \circ X = X(f) = xf$$

So it's best to think of $$Dx$$ as $$Dx := \overrightarrow{D}\overrightarrow{x}$$, so $$Dxf = D(x(f))$$. It's confusing stuff.

*Anyway*.

I think both of these properties are bad, because the *actual* defining property is this:

$$D f(x,y) = f_{x} dx + f_{y} dy = (f_{x}, f_{y}) \cdot (dx, dy)$$

Which gives the product rule trivially:

$$D(uv) = (uv)_{u} du + (uv)_{v} dv = v (du) + u (dv)$$

And, among other things, gives rules like $$D(uvabcde)$$ more trivially than if you don't know it. I guess. More importantly, it seems closer to the 'fundamental' property: that differentials vary their argument in each of its dimensions individually.

It doesn't matter that it's a 2 dimensional argument, of course. It's really, if $$f: M \mapsto N$$:

$$Df(m) = \nabla f \cdot dm$$

(There must be a cleaner way to write that.) What's important is that, if $$f: M\mapsto N$$, then $$Df: T_{M} \mapsto T_{N}$$ and is a linear transformation between those two vector spaces, and the product rule follows naturally.

## 2) Polynomial bases and functions of partial derivatives

(todo: recheck identities here. I changed notations on the fly.)

For some reason there is a complete correspondence between "how polynomials $$x^{k}$$ act under derivatives/integrals" and "how inverse polynomials $$x^{-k}$$ act under integrals/derivatives". (It's not hard to see this; it just feels like there's hidden meaning to it I haven't understood.)

Define a 'polynomial basis':

$$e_{n}(x) = \frac{x^{n}}{n!}$$

So:

$$\p e_{n}(x) = e_{n-1}(x) \text{ } (n > 0)$$

$$\p^{-1} e_{n}(x) = \int_{0}^{x} e_{n}(x) dx = e_{n+1}$$

$$e^{ax} = \sum_{0}^{\infty} e_{n}(ax)$$

Now define analogously an 'inverse polynomial basis'

$$e^{*}_{n}(x) = \frac{1}{x} \frac{n!}{(-x)^{n}}$$

So that:

$$\p^{-1} e^{*}_{n}(x) = e^{*}_{n-1}(x) \text{ } (n > 0)$$

$$\p e^{*}_{n}(x) = \int_{0}^{x} e^{*}_{n}(x) dx = e^{*}_{n+1}(x)$$

And calculus... pretty much works the same. Except I have no idea what $$\sum_{0}^{\infty} e^{*}_{n}$$ means; Taylor series never have the factorial on top of the fractions.  And whereas $$\p e_{0} = 0$$, $$\p^{-1} e^{*}_{0} = \ln x$$.

Also, in complex analysis, since $$\oint \frac{z^{n}}dz = 0$$ unless $$n=-1$$, in which case $$\oint \frac{dz}{z} = 2 \pi i$$, (integrated on a contour around the origin), we can define an 'inner product':

$$\langle f, g \rangle = \frac{1}{2 \pi i} \oint f(z) g(z) dz$$

With the properties that:

$$\langle e^{*}_{i} , e_{j} \rangle = \d_{ij}$$


And, if you write $$f,g$$ as Laurent: series in $$e_{n}, e^{*}_{n}$$:

$$\langle \p^{n} f, g \rangle = \langle f, \p^{n} g \rangle$$


### 2b) Dirac Delta basis

Recall the Dirac Delta 'distribution', which (with some analytic disclaimers), has $$\int \d(x) f(x) = f(0)$$. 

Its 'distributional derivatives' end up being, curiously: 

$$\p \d(x) = \frac{-\d(x)}{x} = e^{*}_{0} \d(x)$$

$$\p^{2} \d(x) = \frac{\d(x)}{x^{2}} = e^{*}_{1} \d(x)$$

$$\p^{n} \d(x) = e^{*}_{n-1} \d(x)$$

(in *a sense*. Has to be under an integral, for starters.)

Meanwhile, the integrals of $$\d(x)$$ are defined by the Heaviside step function $$\theta(x)$$:

$$\theta(x) = 1 [x > 0]$$

$$\p^{-1} \d(x) = \theta(x) = 1 \theta = e_{0} \theta(x)$$

$$\p^{-2} \d(x) =  x\theta(x) = e_{1} \theta(x) $$

$$\p^{-3} \d(x) = \frac{x^{2}}{2} \theta(x) = e_{2} \theta(x)$$

$$\p^{-n} \d(x) = e_{n-1} \theta(x)$$

So multiplying everything by $$\d(x)$$ lets us 'bridge' the gap between $$x^{-n}$$ and $$x^{n}$$, creating a sequence: 

$$\ldots, e^{*}_{n}\d(x), \d(x), \theta(x), e_{n} \theta(x), \ldots$$

It's not *quite* comfortably indexable by integers: both $$\d(x)$$ and $$\theta(x)$$ are $$\propto x^{0}$$. So perhaps we keep them as 'dual bases'? The best way to index them, if you had to, I think, is to keep the negative ones offset from the positive by 1 (as before), so $$\frac{1}{x} \leftrightarrow 1$$, and then $$f_{0} = \d(x)$$, $$f_{1} = \theta(x)$$, $$f_{-1} = \frac{\d(x)}{x}$$, etc.

But it does seem like things work quite nicely.

I feel like there's some kind of "simple function space" lurking here that could make a lot of relationships much simpler.

(Note also: if you take $$x \mapsto e^{i\omega}$$, this looks a lot more like a Fourier basis.)

## 3) Complex Analysis

### 3a) Complex Differentiability

Speaking of contour integrals... complex analysis is a nightmare, and most of its 'revelations' are actually pretty simple.

Complex analysis is obviously something like 'calculus on a 2d space'. But for some reason you only get 1 variable, $$z$$. What does that mean?

I'm 99% sure it means: instead of decomposition $$\bb{R}^{2}$$ into two distinct variables $$x,y$$, you decompose it into two variables $$z, \bar{z}$$, which are '2d variables', but are distinguished by *parity* instead of *direction*. That is, $$z = re^{i\theta}$$ and $$\bar{z} = re^{-i \theta}$$ means that a function written in terms of $$z$$ only is guaranteed to have 'positive' parity... whatever that means. [**todo**]

What exactly it means to have a '2d variable' is still mystifying, but complex analysis tends to care even less about that, and just handwave "look, complex numbers, magic, it works".

The parity thing is more obvious if you think about "what it means to have a derivative $$f'(z)$$ vs $$f'(\bar{z})$$. Since, where defined:

$$f(z + dz, \bar{z} + d\bar{z}) \approx f(z, \bar{z}) + f_{z} dz + f_{\bar{z}} d\bar{z} + o(dz^{2} + d\bar{z}^{2} + dz d\bar{z})$$

To say that the function's derivative is a function of $$z$$ *only*, and *not* $$\bar{z}$$, is to say that the local linear map $$df(z)$$, which gives a single complex number at a given coordinate *z*:

* rotates vectors in either a positive or negative direction, by $$\theta = \arg(z)$$ and
* scales vectors by $$r = \vert z \vert$$.
* rotates $$\bar{z}$$ by the opposite direction in the same amount, and scales it by the same amount.

But if its derivative $$f_{\bar{z}}$$ exists, then it can have a different behavior on negative-parity displacements $$\bar{z}$$ compared to positive ones (eg it might extract the magnitude by multiplying $$z \bar{z}$$).

*Anyway*:

To be complex-differentiable at a point $$z_{0}$$ is just to say that $$f_{\bar{z}} = \p_{\bar{z}} f(z_{0}) = 0$$

The partial derivatives with respect to complex variables are defined in terms of $$x,y$$ easily enough (the *Wirtinger derivatives*):

$$\p_{z} = \frac{1}{2} (\p_{x} - i \p_{y})$$

$$\p_{\bar{z}} = \frac{1}{2} (\p_{x} + i \p_{y})$$

The reason the signs are opposite from $$z = x + iy$$, and the reason for the factors of $$\frac{1}{2}$$, is that the defining relation to be useful is that $$\p_{z} dz = \p_{z} (dx + i dy) = 1$$ and $$\p_{z} d\bar{z} = 0$$ (and vice versa).

It is trivial to derive the Cauchy Riemann equations from these. They just say: the derivative of $$f(z) = (u(z), v(z))$$ at a point is a complex number, not a complex conjugate. That is, $$\p_{\bar{z}} f(z) = 0$$.

A simple example: suppose

$$f(z) = z^{2} = (x + iy)^{2} = x^{2} + 2 (x) (iy) - y^{2}$$

Then (bear with me):

$$f(z + d\bar{z}) = f(z) + f_{\bar{z}} \bar{z} $$

$$= (x + dx + i y - i dy)^{2}$$

$$= f(z) + 2( x dx -  i x dy +  i y dx + i y dy) + o(d^{2})$$

Now, what the heck is that? Well -- if we define (see later) $$ i dy = dx$$ and $$i dx = - dy$$, then that's:

$$= f(z) + 2 (0) + o(d^{2})$$

Which is quite clean. (Why would we define those things? Because $$i = y \wedge x$$ in a very literal sense. Later section.) 

($$i$$ would be the more sensible $$x \wedge y$$ if we did left-multiplication instead of right. Whoops? When acting as an operator on vectors $$\in (x,y)$$, $$-i$$ is the more 'reasonable' object.)

(By the way, $$d \bar{z} = \bar{dz}$$. I just prefer the former to emphasize that $$\bar{z}$$ acts like its own variable.)

**If I were writing the complex analysis textbook**, I would banish 'discovering' the Cauchy-Riemann equations from insisting that functions have derivatives, and start with it as a premise (after figuring out what '2d' variables and parity mean a little better.)

### 3b) Taylor Series

Similarly, the 'full' Taylor series of $$f(z)$$ is a series in both $$z$$ and $$\bar{z}$$:

$$f(z + a) = \sum \binom{n}{k} \frac{1}{n!} a^{k} \bar{a}^{n-k} \p_{z}^{k} \p_{\bar{z}}^{n-k} f(z)$$

or something like that. A better notation:

$$f(z + a) = \sum \frac{ (a \p_{z} + \bar{a} \p_{\bar{z}})^{n}}{n!} f(z) = \sum \frac{(a\nabla)^{n}}{n!} f(z) = e^{a \nabla} f(z)$$

Ah, it's so nice. (nb haven't checked that's right but it makes so much sense!)

Laurent series, I'm sure, can be handled similarly.


### 3c) Normalization

By the way: the factor of $$\frac{1}{2}$$ in $$\p_{z}$$ could have been spread amount $$dz$$ and $$\p_{z}$$ by making it a factor of $$\frac{1}{\sqrt{2}}$$ on each. Because it's not, in the $$x,y$$ basis $$\vert z \vert = 2$$. Which seems weird, and might make random $$2$$s appear in other place. Oh well. I don't know which is preferable.

### 3d) Contour Integrals

Almost all of the funny business about Contour integrals follows from the observations that:

* Complex analytic functions can be written as Laurent series, in $$z^{n}$$ for $$n \in \bb{Z}$$, and

* $$\oint_{C} \frac{1}{z^{n}} dz = 2 \pi i$$ if $$n=1$$ and 0 otherwise (for a contour around the origin).

* Everything else follows from this.

It's probably worth adding: "you can also make a Laurent series around infinity via $$z \mapsto \frac{1}{z}$$".

Point is, the 'full mystery' is in the mysterious behavior of $$\oint \frac{1}{z} dz$$. It's then easy to show that for analytic-inside-*C* $$f(z)$$, $$\oint_{C} \frac{f(z)}{z-a} dz = 2 \pi i f(a)$$ and the like.

(That's also how our above polynomial basis inner product $$\langle f, g \rangle = \frac{1}{2 \pi i} \oint f g dz$$ worked. Because $$e_{i}e^{*}_{i} = \frac{1}{z}$$.)

That reduces 'a large number of mysteries' to a single one.

How we do justify this?:

$$\oint_{C} \frac{1}{z} dz = 2 \pi i$$

Answer: with another, simpler observation: that (in some sense):

$$\p_{\bar{z}} \frac{1}{z} = -\pi \d(z)$$

while:

$$\p_{\bar{z}} \frac{1}{z^{n \neq 1}} = 0$$

That is, the Dirac delta function appears as a $$\bar{z}$$ derivative, for some reason. And then by Stokes' Theorem:

$$\oint_{\p D} \frac{1}{z} dz = \int_{D} \partial_{\bar{z}} (\frac{1}{z}) \frac{dz \wedge d\bar{z}}{2 i}$$

(Note that $$dz \wedge d\bar{z} = (dx + i dy) \wedge (dx - i dy) = - 2 i dx \wedge dy$$.)

so that extra factor just appears because we're mechanically using the $$\bb{R}^{2}$$ version of Stokes' theorem, instead of deriving some kind of complex-analysis analog.

**Explanation:**

The reason that $$\frac{1}{z}$$ has the delta-function divergence comes from an argument commonly used in physics. It's usually done in 3d so I'll do that first:

Consider the surface integral around an inverse-square field:

$$\b{F} = \frac{\hat{\b{r}}}{r^{2}} = \frac{\b{r}}{r^{3}} = -\nabla \frac{1}{r}$$

(using the convention that non-boldface $$r = \vert \b{r} \vert$$, not a vector), evaluated on a spherical shell with radius $$r=R$$:

$$\iint_{r=R} \frac{\b{r}}{r^{3}} \cdot d\b{S}$$

(Note that $$d\b{S}$$, the outward-facing normal at radius $$R$$, is parallel to $$\b{\hat{r}}$$, though it's technically a 2-form instead of a vector, but also $$\b{F}$$ is technically a 2-vector and we're ignoring that too). The Divergence Theorem (aka Stokes' theorem applied to 2-vectors), meanwhile, says that 

$$\iiint \nabla\cdot \b{F} dV = \iint \b{F} \cdot d\b{S}$$

But it's easy to see that the right integral is equal to $$4 \pi R^{2}$$; it just computes the angular area of the sphere. (via $$d\b{S} \propto r^{2} \sin \theta$$, so eveything cancels and you're integrating $$1$$.) And that's independent of radius, so it remains true the $$R \rightarrow 0$$. That means that in some sense the entire contribution to $$\iiint \nabla \b{F} dV$$ comes from the origin. So we find:

$$\nabla \cdot \frac{\b{r}}{r^{3}} = 4 \pi \d^{3}(\b{r})$$

(Note: this is not actually allowed by the Divergence theorem. That requires the functions in question to be differentiable everywhere inside the integral. But, this is still the usual derivation.)

The definition of $$\d$$ only makes sense 'under an integral sign', so you can't just use it anywhere. But as far as volume integrals go, this works fine and gives the right answer and preserves Stokes' theorem. Also, note that the coefficient of that divergence is the area of a unit $$3$$-sphere. It seems likely that in *n* dimensions, $$\nabla \frac{\b{r}}{r^{n}} = area(S_{N-1}) \d^{n}(\b{r})$$. 

For our complex analysis case, we do the same construction in 2d:

$$\iint_{D} d\big( \frac{1}{z} \big) \wedge dz = \int_{\p D} \frac{1}{z} dz = 2 \pi i$$

$$d\big( \frac{1}{z} \big) = (\partial_{z} \frac{1}{z} dz + \partial_{\bar{z}}  \frac{1}{z} d\bar{z} ) \wedge dz$$

$$ = - \partial_{\bar{z}} \big( \frac{1}{z} \big) dz \wedge d\bar{z}$$

Leaving:

$$- \iint_{D} \p_{\bar{z}} \frac{1}{z} dz \wedge d\bar{z} = 2 \pi i$$ 

... for *any* domain $$D$$ containing the origin. Meaning that the left side acts like a $$\d(z)$$ at the origin. Recalling that $$dz \wedge d\bar{z} = - 2 i dx \wedge dy$$, we have:

$$2 i \iint_{D} \p_{\bar{z}} \frac{1}{z} dA = 2 \pi i$$

$$ \p_{\bar{z}} \frac{1}{z} = - \pi \d^{2}(z)$$

(Note: it would be the area of a unit 1-sphere, $$=2 \pi \d(z)$$, but the factor of 2 is lost because $$\p_{\bar{z}} = \frac{1}{2}(\p_{x} + i \p_{y})$$.)

So, for whatever reason, that one factor of Laurent series diverges, and thus you get lots of strange behavior in contour integrals.

By the way, Wikipedia tells me you can generalize Cauchy's integral formula to the Cauchy-Pompeii formula, which is basically just Stokes' theorem in 2d, but pretending to be on complex numbers:

$$f(a) = \frac{1}{2 \pi i} \oint_{\partial D} \frac{f(z)}{z - a} dz - \frac{1}{\pi} \iint_{D} \frac{\partial_{\bar{z}} f}{z-a} dz \wedge d\bar{z}$$

That seems pretty obvious to me after this discussion. This holds for a more general class of functions than complex analytic (just smooth, I think).



### 3e) Cauchy Principal Value

### 3f) Divergence of Polar Coordinates

## 5) Taylor Series; Functions of Partial Derivatives
## 6) L'Hopitals

