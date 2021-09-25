---
layout: blog
title: "The essence of complex analysis"
footnotes: true
math: true
aside: true
tags: notes
---

Rapid-fire intuitions for calculus on complex numbers, with little rigor.

Not an introduction to the subject.

<!--more-->

Contents:

* TOC
{:toc}


---------

## 1. The complex plane

Most of calculus on $$\bb{C}$$ is actually just calculus on $$\bb{R}^2$$, under the substitutions:

$$\begin{aligned}
i &\lra R \\
x + iy & \lra (x + R y) \hat{x}
\end{aligned}$$

Where $$R$$ is a "rotation operator". The identity $$\cos \theta + i \sin \theta = e^{i \theta}$$ follows from applying the [exponential map](https://en.wikipedia.org/wiki/Exponential_map) to $$R$$ as the generator of rotations. If I had my way we would not use complex numbers ever and would just learn the subject as 'calculus using rotation operators' to avoid a proliferation of things that seem like magic.

$$\bb{R}^2$$ is a two-dimensional space, though, while $$\bb{C}$$ appears to have one 'complex' dimension. This is a bit strange, but for the most part you can just treat $$z, \bar{z}$$ like any other two dimensional space. The tangent basis forms are:


$$\begin{aligned}
dz &= dx + i dy \\
d\bar{z} &= dx - i dy
\end{aligned}$$

The partial derivatives are for some reason given the name [Wirtinger derivatives](https://en.wikipedia.org/wiki/Wirtinger_derivatives):

$$\begin{aligned}
\p_z &= \frac{1}{2}(\p_x - i \p_y) \\
\p_{\bar{z}} &= \frac{1}{2}(\p_x + i \p_y)
\end{aligned}$$

The $$\frac{1}{2}$$ factors and the swapping of signs is required such that $$\p_z (z) = \p_{\bar{z}} (\bar{z}) = 1$$. In an alternate universe both sides might have had $$\frac{1}{\sqrt{2}}$$ factors.

Note that any function that explicitly uses $$r$$ or $$\theta$$ has a $$\bar{z}$$ dependency unless they cancel it out somehow (like $$z = re^{i \theta}$$ does): 

$$\begin{aligned}
r &= \sqrt{z \bar{z}} \\
\theta &= - \frac{i}{2} \log \frac{z}{\bar{z}}
\end{aligned}$$

-------

## 2. Holomorphic functions

The [Cauchy-Riemann equations](https://en.wikipedia.org/wiki/Cauchy%E2%80%93Riemann_equations) tell you when a complex function $$f(z) = u(x+iy) + i v(x + iy)$$ is complex-differentiable:

$$\begin{aligned}
u_x = v_y\\
u_y = - v_x 
\end{aligned}$$

Being complex differentiable means that $$f(z)$$ has a derivative that is itself a complex number: $$(f_x, f_y) \in \bb{C}$$ when regarded as part of $$\bb{R}^2$$. In fact, the equations express the idea that $$f$$ has no derivative with respect to $$\bar{z}$$:

$$\begin{aligned}
\p_{\bar{z}} f(z)
&= \frac{1}{2} (f_x + i f_y) \\
&\propto u_x + i v_x + i u_y - v_y \\
&= (u_x - v_y) + i (v_x + u_y) \\
&= 0 + i 0
\end{aligned}$$

As long as $$f$$ is continuous and this condition is true in a region $$D$$, operations on $$f(z)$$ essentially work like they would for one-variable functions in $$z$$. For instance $$\p_z (z^n) = n z^{n-1}$$.

While $$z$$ seems like a 2-dimensional variable, there's only one 'degree of freedom' in the derivative of a complex function. $$f'(z)$$ has to be a simple complex number, which rotates and scales tangent vectors uniformly (a [conformal map](https://en.wikipedia.org/wiki/Conformal_map)):

$$f(z + dz) \approx f(z) + f'(z) dz = f(z) + re^{i\theta} dz$$

Functions which are complex-differential at every point within a region are called [holomorphic](https://en.wikipedia.org/wiki/Holomorphic_function) in that region for some reason. A function $$f(z)$$ that is holomorphic (or 'regular'?) in a region $$D$$ is _extremely_ well-behaved:

* $$f$$ is _infinitely_ complex-differentiable
* and $$f$$ is 'complex analytic', ie equal to its Taylor series in $$z$$ throughout $$D$$. The series around any particular point converges within the largest circular disk that stays within $$D$$.
* and $$f$$ is locally invertible, ie $$f^{-1}(w + dw) \approx z + 1/f'(z) dw$$ exists and is holomorphic in the neighborhood of $$z = f(w)$$.
* its antiderivatives exist, and its integrals along any closed contour vanishes: $$\oint_C f(z) dz = 0$$.
* the data of $$f$$ in $$D$$ is fully determined by its values on the boundary of the region, or on any one-dimensional curve within $$D$$, or on some nontrivial subregion of $$D$$.

The general theme is that holomorphic/analytic functions generally act like one-dimensional functions and all of the calculus is really easy on them. This tends to be true much more than it is for 1d calculus.

If two analytic functions defined on different regions _agree_ on an overlapping region, they are in a sense the 'same function'. This lets you [analytically continue](https://en.wikipedia.org/wiki/Analytic_continuation) a function by finding other functions which agree on a particular line or region. An easy case is to 'glue together' Taylor expansions around different points to go around a divergence.

Most 1d functions like $$e^x$$ and $$\sin x$$ have holomorphic complex versions like $$e^z$$ and $$\sin z$$ that are analytic everywhere. Discontinuous functions like $$\|z\|$$ or $$\log z = i \theta \ln r  $$, or functions that include an explicit or implicity $$\bar{z}$$ dependency, fail to be analytic somewhere.

Complex differentiability fails at singularities. We categorize the types:

* _poles_ of order $$n$$, around which $$f(z) \sim 1/z^n$$, which are 'well-behaved' singularities. Around these there's a region where $$1/f$$ is analytic. 'Zeros' and 'poles' are dual in the sense that $$f \sim z^n$$ at zeroes and $$f \sim 1/z^n$$ at poles.
* _removable singularities_: singularities that can be removed by redefinition, probably because they're an indeterminate form. The canonical example is $$\sin(z)/z$$ which is repaired by defining $$\sin(0)/0 = 1$$. In a sense these are not singularities at all.
* _essential singularities_: singularities which oscillate infinitely rapidly near a point, such that they are in a sense too complicated to handle. $$\sin(1/z)$$ or $$e^{1/z}$$ are the canonical examples. They all look like this, oscillating infinitely: [Great Picard's Theorem](https://en.wikipedia.org/wiki/Picard_theorem) (what a name) says that near an essential singularity the function takes every value infinitely times, except possibly one.

Poles are much more interesting than the other two.

------

## 3. Residues


No one would really care about complex analysis except for, well, _analysts_, were it not for one suspicious fact about the complex derivative:

$$\p_{\bar{z}} \frac{1}{z} \neq 0$$

Make sure you see that that's a $$\bar{z}$$-derivative. For some reason, $$z^n$$ for only $$n=-1$$ has a certain kind of divergence at $$z=0$$. It looks like a 2d [delta <strike>function</strike> distribution](https://en.wikipedia.org/wiki/Dirac_delta_function):

$$\p_{\bar{z}} \frac{1}{z} = 2 \pi i \delta (z, \bar{z})$$

This is intrinsically related to the fact that we're doing calculus in 2d. In 3d a similar property holds for $$1/z^2$$, and in 1d it's $$\p_x \log x = \frac{1}{x} + i \pi \delta(x)$$ that has the delta term.

This is equivalent to saying that the contour integral (integral on a closed path) of $$1/z$$ around the origin is non-zero:

$$\begin{aligned}
\oint \frac{1}{z} dz &= \oint \frac{e^{i \theta} dr +  ir e^{i\theta} d \theta }{r e^{i \theta}} \\
 &= \oint \frac{dr}{r} + i d \theta \\
&= 2 \pi i
\end{aligned}$$

It's clear why this non-zero contour only holds for $$z^{-1}$$: for any other $$z^n$$, the $$d \theta$$ term is still a non-constant function of $$\theta$$, so its values on each end cancel out. For $$n=-1$$, though, the $$d \theta$$ just counts the total change in angle.

The delta-function version folllows from Stoke's theorem. Since the contour integral gives the same value on any path as long as it circles $$z=0$$, the divergence must be fully located at that point:

$$\begin{aligned}
\oint_{\p D} \frac{1}{z} dz &= \iint_D d(\frac{dz}{z}) \\
2\pi i &= \iint_D \p_{\bar{z}} \frac{1}{z} d \bar{z} \^ dz \\
\p_{\bar{z}} \frac{1}{z} &\equiv 2 \pi i \delta(z, \bar{z})
\end{aligned}$$

A function that is holomorphic except at a set of poles is called _meromorphic_ ('mero-' is [Greek](https://www.etymonline.com/search?q=mero-), meaning 'part' or 'fraction'). If we integrate a meromorphic function around a region $$D$$ the result only contains contributions from the $$\frac{1}{z}$$ terms. Around each order-1 pole at $$z_k$$, $$f(z_k) \sim f_{-1} \frac{1}{z_k} + f^{*}(z_k)$$ where $$f^{*}$$ has no $$z^{-1}$$ term. The $$f_{-1}$$ values at each pole are for some reason called [residues](https://en.wikipedia.org/wiki/Residue_theorem), and:

$$\int_{\p D} f(z) dz = 2 \pi i \sum_{z_k}  I(\p D, z_k) \text{Res} (f, z_k)$$

Where $$I(\p D, z_k)$$ gives the [winding number](https://en.wikipedia.org/wiki/Winding_number) around the order-1 pole (+1 for single positive rotation, -1 for a single negative rotation, etc).

This makes integration of analytic functions around closed contours _really easy_; you can often just eyeball them:

$$\oint_{\p D} \frac{1}{z-a} dz = 2\pi i 1_{a \in D}$$

Multiplying and dividing powers of $$(z-a)$$ and then integrating around a curve containing $$a$$ allows you to extract any term in the Taylor series of $$f(z)$$ around $$a$$:

$$f_n = f^{(n)}(z)_{z=a} =  \frac{n!}{2 \pi i} \oint f(z) (z-a)^{n-1} dz$$

This is called [Cauchy's Integral Theorem](https://en.wikipedia.org/wiki/Cauchy%27s_integral_formula). When negative terms are present the Taylor series is instead called a [Laurent Series](https://en.wikipedia.org/wiki/Laurent_series).

$$\begin{aligned}
f(z) &\approx \sum f_n \frac{(z-a)^n}{n!} \\
&= \ldots + \frac{f_{-1}}{z} + f_0 + f_{1} z + f_2 \frac{z^2}{2!} + \ldots
\end{aligned}$$

In particular the value at $$z=a$$ is fully determined by the contour integral with $$(z-a)^{- 1}$$:

$$f(a) = f_0 = \frac{1}{2 \pi i} \oint \frac{f(z)}{z-a} dz$$

You can, of course, formulate this whole thing in terms of $$f(\bar{z})$$ and $$\frac{dz}{\bar{z}}$$ instead. If a function isn't holomorphic in either $$z$$ or $$\bar{z}$$, you can still do regular $$\bb{R}^2$$ calculus in two variables $$f(z, \bar{z})$$, although I'm not sure how you would deal with poles.

There is a duality between zeroes and poles of meromorphic functions -- in the region of a pole of a function $$f$$, the function behaves like $$\frac{1}{g}$$ where $$g$$ is an analytic function. In general a meromorphic function can be written as $$f= \frac{h}{g}$$ where $$g,h$$ are analytic, with the zeroes of $$g$$ corresponding to the poles of $$f$$.

-------------

## 4. Integral tricks

Laurent series and the 'calculus of Residues' gives rise to a whole slew of integration tricks.

Closed integrals of a function with a Laurent series can be eyeballed using the Cauchy integral formula:

$$\begin{aligned}
\oint_{r=1} \frac{1}{z(z-2)} dz &= \frac{1}{2} \oint_{r=1}  \frac{1}{z-2} - \frac{1}{z} dz \\
&= 2 \pi i \frac{1}{2} (-1) \\
&= - \pi i
\end{aligned}$$

Integrals along the real line $$\int_{-\infty}^{\infty}$$ can often be computed by 'closing the contour' at $$+ r \infty$$. This is especially easy if the integrand vanishes at $$r=\infty$$, but also helps if it's just easier to integrate there.

$$\begin{aligned}
\int_{-\infty}^{\infty} \frac{1}{1 + x^2} dx &= \int_{r = -\infty}^{r = \infty} \frac{dz}{1 + z^2} + \int_{\theta=0, \, r=\infty}^{\theta=\pi, \, r=\infty} \frac{dz}{1 + z^2} \\
&= \oint \frac{1}{z - i} \frac{1}{z + i} dz \\
&= 2 \pi i \text{Res}(z=i, \frac{1}{z - i} \frac{1}{z + i}) \\
&= 2\pi i \frac{1}{2i} \\
&= \pi
\end{aligned}$$

Here we closed the contour around the upper-half plane, upon which the integrand is $$0$$ due to the $$r^2 \ra \infty$$. One pole is the upper-half plane and one is in the lower. The winding number around the upper is $$+1$$ and the residue is $$\frac{1}{z+i}$$ evaluated at $$z=i$$, or $$1/2i$$. If we had used the lower half-plane the winding number would have been $$-1$$ and the residue $$-1/2i$$, so the result is independent of how we closed the contour. This method gives the answer very directly without having to remember that $$\int \frac{dx}{1 + x^2} = \tan^{-1} x$$ or anything like that.

Note that this wouldn't work if the pole was _on_ the path of integration, as in $$\int_{-\infty}^{+\infty} \frac{1}{x} dx$$. This integral is the [Cauchy Principal Value](https://en.wikipedia.org/wiki/Cauchy_principal_value) and is in a sense an indefinite form like $$0/0$$ whose value depends on the context. More on that another time.

Many other integrals are solvable by choosing contours that are amenable to integration. Often choices that keep $$r$$ or $$\theta$$ constant are easiest. See Wikipedia on [contour integration](https://en.wikipedia.org/wiki/Contour_integration) for many examples.

-----------

## 5. Topological concerns

There are some tedious things you have to account for when considering functions of $$z$$.

First, the $$\theta$$ variable is discontinuous, since $$\theta = 0$$ and $$\theta = 2\pi$$ refer to the same point. This means that inverting a function of $$\theta$$ will produce a [multi-valued function](https://en.wikipedia.org/wiki/Multivalued_function):

$$\log e^{i \theta} = i \theta + 2 \pi i k_{\in \bb{Z}}$$

Smoothly varying $$\theta = \int d \theta$$ of course will just continue to tick up: $$2\pi, 4\pi, 6\pi$$, etc. But the $$\log$$ function itself appears to have a discontinuity of $$2\pi i$$ at $$\theta = 0$$.

When dealing with these multi-valued functions you can consider $$\theta = 0$$ as a 'branch point' -- a place where the function becomes multi-valued. But to be honest the whole theory of branch points isn't very interesting if you aren't a mathematician. I prefer to just think of all math being done modulo $$2 \pi$$, or, if you need the discontinuity to count because you're doing contour integrals, just get over the idea that functions can't have multiple path-dependent values and don't demand it have a unique inverse.

Another topological interest in $$\bb{C}$$: if you 'join together' the points at infinity in every direction by defining a symbol $$\infty$$ such that $$1/0 = \infty$$, you get the "extended complex plane" or the [Riemann sphere](https://en.wikipedia.org/wiki/Riemann_sphere), since it is topologically shaped like a sphere. Most of the things that seem like they should be true involving $$\infty$$ are true in this case. For example, the asymptotes of $$\frac{1}{z}$$ on either size of $$\| z \| = 0$$ really _do_ connect at infinity and come back on the other side.

The Riemann sphere is topologically like a sphere, but acts like a _projective_ plane, which is a bit unintuitive. (This corresponds rather to a half sphere where antipodal points are considered equivalent). Particularly, it kinda seems like $$+r$$ and $$-r$$ should be different points, rather than the 'same' infinity. There is probably a resolution to this using [oriented projective geometry](https://en.wikipedia.org/wiki/Oriented_projective_geometry), defining the back half of the sphere as a second copy of $$\bb{C}$$ and conjoining the two at $$\infty e^{i \theta} \lra -\infty e^{i\theta}$$, but that's not worth pursuing further here.

Complex analytic functions map the Riemann sphere to itself in some way. For instance, $$z \mapsto \frac{1}{z}$$ swaps $$0$$ and $$\infty$$ and the rest of the sphere comes along for a ride. Powers of $$z$$ cause the mapping to be $$m:n$$ -- so $$z^2$$ maps two copies of the sphere to one copy, while $$z^{1/2}$$ maps one copy to two copies, hence becoming multi-valued. The [möbius transformations](https://en.wikipedia.org/wiki/M%C3%B6bius_transformation), functions of the form $$\frac{az + b}{cz + d}$$ with $$ad-bc \neq 0$$, are the invertible holomorphic transformations of the Riemann sphere. They comprise dilations, rotations, reflections, and inversaion of $$\bb{C}$$.


------

## 6. Convergence concerns

Although Laurent series capture the properties of complex analytic functions well, they still only work within a definite radius of convergence, given by the distance to the closest pole. Sometimes we can expand around other points to work around this. A common choice is expanding around $$z=\infty$$, by creating a series in $$1/z$$ instead:

$$\frac{1}{1-z} = \begin{cases} 
1 + z + z^2 + \ldots & \| z \| < 1 \\
-\frac{1}{z} - \frac{1}{z^2} - \frac{1}{z^3} - \ldots & \| z \| > 1 
\end{cases} $$

Amusingly, you can keep changing the point you expand around to 'go around' a pole, producing an analytic continuation outside the radius of the initial Taylor series.

Complex Taylor series diverge for the same reasons that real ones do, but the choices of radius make a lot more sense in complex analysis than they do in real analysis: they are the distance to the closest singularity (for instance, $$\frac{1}{1 + x^2}$$ around $$x=0$$ has radius of convergence $$r=1$$ since there are poles at $$\pm i$$).

The simpelst way to show that a series converges is to show that the series still converges if $$z$$ is replaced with $$r = \|z\|$$, since 

$$f(z) = a_0 + a_1 z + a_2 z^2 + \ldots \leq f(r) = a_0 + a_1 r + a_2 r^2 + \ldots $$

After all, the phases of the $$z$$ terms can only serve to reduce the sums of the magnitudes.

We know that geometric series $$1 + x + x^2 + \ldots$$ converge only if $$x < 1$$. This means that $$\sum a_n r^n$$ definitely converges if the terms look like $$\sqrt[n]{\| a_n r^n \|} = \sqrt[n]{\| a_n \| } r \lt 1$$, which gives the [root test](https://en.wikipedia.org/wiki/Root_test) for convergence:

$$R = \frac{1}{\lim_{n \ra \infty} \sup \sqrt[n]{\| a_n \| }} > 0$$

If $$R = 0$$ the series still might converge (depending on what the phases of $$a_n$$ do!); if $$r > R$$ it definitely doesn't. If $$R = \infty$$ then the series converges for all finite $$\|z\|$$ and is called an 'entire' function, which is a weird name.

The root test is the most powerful of the simple convergence tests, because it hits exactly on the property that $$\sum \| a_n \| r^n$$ converges if it's less than a geometric sum $$\sum x^n$$. Other tests 'undershoot' this property; for instance the ratio test says that 

$$\| \frac{a_n r^n }{a_{n+1} r^{n+1}} \| = \| \frac{a_n}{a_{n+1}} \| \frac{1}{r} < \| \frac{x^n}{x^{n+1}} \| = 1$$

This captures the idea that the series does converge if its successive ratios are less than that of a geometric series, but fails if the terms look like $$x + x + x^2 + x^2 + x^3 + x^3 + \ldots$$ or something.

----

## 7. Global Laurent Series

This is my own idea for making divergence of Laurent series more intuitive.

Laurent series coefficients are derivatives of the function evaluated at a particularly point, like $$f^{(n)}(z=0)$$, such that a whole Laurent series is 

$$f(z) = \ldots + f^{(-2)}(0) \frac{2! }{z^2}  - f^{(-1)}(0) \frac{1!}{z}  + f(0) + f^{(1)} z + f^{(2)}(0) \frac{z^2}{2!} + \ldots$$

Suppose that for some reason the Cauchy forms of computing derivatives and 'inverse' derivatives are the 'correct' way to compute these values:


$$\begin{aligned}
f(0) &= \frac{1}{2\pi i} \oint_{C} \frac{f(z) dz}{z} \\
\frac{f^{(n)}(0)}{n!} &= \frac{1}{2\pi i} \oint_{C} \frac{f(z) dz}{z^{n+1}} \\
(-1)^n n! f^{(-n)}(0) &= \frac{1}{2\pi i}\oint_{C}  z^{n-1} f(z) dz \\
\end{aligned}$$

Where $$C$$ is a circle of radius $$R$$ around $$z=0$$. Then some handwaving leads to an alternate characterization of divergent series. For most calculations $$\p_z f(0)$$ is independent of the choice of $$C$$, but for a function with a pole away from the origin, they are not. Consider $$f(z) = \frac{1}{1-z}$$, and let $$C$$ be the positively oriented circle of fixed radius $$R$$. Then:

$$\begin{aligned}
f_R(0) &= \frac{1}{2\pi i}\oint_{C} \frac{1}{(z)(1-z)} dz \\
&= \frac{1}{2\pi i}\oint_{C} \frac{1}{z} + \frac{1}{1-z} dz \\
&=\text{Res}_C (z=0, \frac{1}{z} - \frac{1}{z-1}) + \text{Res}_C (z=1, \frac{1}{z} - \frac{1}{z-1}) \\
&= 1 - H(R-1) \\
\end{aligned}$$

Where $$H$$ is a [step function](https://en.wikipedia.org/wiki/Heaviside_step_function) $$H(x) = 1_{x > 0}$$. The value of $$f(0)$$ changes depending on the radius we 'measure' it at. The derivative and integral terms show the same effect, after computing some partial fractions:

$$\begin{aligned}
f_R'(0) &= \frac{1}{2\pi i}\oint_{C} \frac{1}{(z^2)(1-z)} dz \\
&= \frac{1}{2\pi i}\oint_{C} \frac{1}{z} + \frac{1}{z^2} - \frac{1}{z-1} dz \\
&= 1 - H(R-1) \\
f^{(-1)}_R(0) &= \frac{1}{2\pi i}\oint_{C}\frac{- 1}{z-1} dz \\
&=-H(R-1)
\end{aligned}$$

In total we get, using $$H(x) = 1 - H(-x)$$:

$$f^{(n)}_R(0) = \begin{cases} 
H(1-R) & n \geq 0 \\
- H(R-1) & n < 0
\end{cases}$$

Which gives the 'real' Laurent series as:

$$\frac{1}{1-z} = - (\; \ldots + z^{-2} + z^{-1}) H(\|z\| - 1) + (1 + z + z^2 + \ldots) H(1 - \|z\|)$$

The usual entirely-local calculations of $$f'(z)$$, etc miss the 'global' property: that the derivative calculations fail to be valid beyond $$R=1$$, and a whole different set of terms become non-zero, which correspond to expansion around $$z=\infty$$.

Which if you ask me is very elegant, and very clearly shows why the radius of convergence of the conventional expansion around $$z=0$$ is the distance to the closest pole. Of course it is a bit circular, because to get this we had to choose to use circles $$C$$ to measure derivatives, but that's ok.

--------

In summary: don't use complex numbers. Please use $$\bb{R}^2$$ if you can.