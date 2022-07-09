---
layout: blog
title: "The essence of complex analysis"
footnotes: true
math: true
aside: true
tags: notes
---

Rapid-fire non-rigorous intuitions for calculus on complex numbers. Not an introduction, but if you find/found the subject hopelessly confusing, this should help.

<!--more-->

Contents:

* TOC
{:toc}


---------

## 1. The complex plane

Calculus on $$\bb{C}$$ is more-or-less just calculus on $$\bb{R}^2$$, under the substitutions:

$$\begin{aligned}
i &\lra R \\
a + bi & \lra (a + R b) \hat{x} = a \hat{x} + b \hat{y}
\end{aligned}$$

Where $$R$$ is the "rotation operator". Yes, it is strange that you can do calculus with a rotation operator, but keep an open mind.

It is also possible to consider complex numbers as 2x2 matrices, using $$i = R = \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}$$. Then in general

$$a + bi = \begin{pmatrix} a & -b \\ b & a \end{pmatrix}$$

The identity $$\cos \theta + i \sin \theta = e^{i \theta}$$ follows from applying the [exponential map](https://en.wikipedia.org/wiki/Exponential_map) to $$R$$. If I had my way we would not use complex numbers ever and would just learn the subject as 'calculus using rotation operators' to avoid a proliferation of things that seem like magic, although a bit of work is needed to make it pedagogically sound. Certainly the words "complex" and "imaginary" aren't doing anybody any favors.

The one way that $$\bb{C}$$ is more interesting than plain $$\bb{R}^2$$ is that there is a definition of multiplying two vectors: 

$$(a + b i) (c + d i) = (ac - bd) + (ad + bc) i$$

The best way I know to interpret this is like so: the correspondence $$a + bi \Ra (a + R b) \hat{x}$$ suggests that we interpret a complex number as an operator that is understood to 'act on' the $$\hat{x}$$ basis vector. In this sense both adding and multiplying complex numbers are natural operations: adding them applies both operations to $$\hat{x}$$ and adds the result; multiplying them applies them sequentially. 

$$[(a + b R) \circ (c + d R) ](\hat{x})  = [(ac - bd) + (ad + bc) R] (\hat{x})$$

This model is especially appealing because it is easy to extend to higher dimensions. (This generalizes to 'geometric algebra' which works in every dimension, _not_ quaternions, which only work in $$\bb{R}^3$$.)

So we want to do calculus on these operators on $$\bb{R}^2$$. We start by identifying derivatives and differential forms. The differentials of the coordinate vectors are:


$$\begin{aligned}
dz &= dx + i dy \\
d\bar{z} &= dx - i dy
\end{aligned}$$

The partial derivatives are for some reason called "[Wirtinger derivatives](https://en.wikipedia.org/wiki/Wirtinger_derivatives)":

$$\begin{aligned}
\p_z &= \frac{1}{2}(\p_x - i \p_y) \\
\p_{\bar{z}} &= \frac{1}{2}(\p_x + i \p_y)
\end{aligned}$$

Note that the signs are swapped, compared to the forms, and factors of $$\frac{1}{2}$$ have appeared. These are necessary because of the requirement that that $$\p_z (z) = \p_{\bar{z}} (\bar{z}) = 1$$. In an alternate universe both sides might be given $$\frac{1}{\sqrt{2}}$$ factors instead, but they weren't.

There are other parameterizations of $$\{ z, \bar{z} \}$$ in terms of $$\bb{R}^2$$ coordinates. The most common choice is polar coordinates: $$z = re^{i \theta}$$ and $$\bar{z} = r e^{-i \theta}$$. Then the forms are:

$$\begin{aligned}
dz &= e^{i \theta} (dr + i r d \theta) \\
d\bar{z} &= e^{-i \theta} (dr - i r d \theta)
\end{aligned}$$

Then the partial derivatives would be:

$$\begin{aligned}
\p_z &= \frac{e^{-i \theta}}{2} (\p_r - \frac{i}{r} \p_\theta) \\
\p_{\bar{z}} &= \frac{e^{i \theta}}{2} (\p_r + \frac{i}{r} \p_\theta)
\end{aligned}$$

Although these don't come up very much. Note that any function that explicitly uses $$r$$ or $$\theta$$ has a $$\bar{z}$$ dependency unless they cancel it out somehow, since both $$r$$ and $$\theta$$ do:

$$\begin{aligned}
r &= \sqrt{z \bar{z}} \\
\theta &= - \frac{i}{2} \log \frac{z}{\bar{z}}
\end{aligned}$$

-------

## 2. Holomorphic functions

Complex analysis is mostly concerned with doing calculus on functions in $$\bb{C}$$, so we are interested in differentiable functions of $$z$$. Being complex differentiable means that $$f(z)$$ has a derivative that is itself a complex number (when regarded as part of $$\bb{R}^2$$): $$(f_x, f_y) \in \bb{C}$$. 

The [Cauchy-Riemann equations](https://en.wikipedia.org/wiki/Cauchy%E2%80%93Riemann_equations) tell you when a complex function $$f(z) = u(x+iy) + i v(x + iy)$$ is complex-differentiable:

$$\begin{aligned}
u_x = v_y\\
u_y = - v_x 
\end{aligned}$$

This really just expresses the idea that $$f$$ has no derivative with respect to $$\bar{z}$$:

$$\begin{aligned}
\p_{\bar{z}} f(z)
&= \frac{1}{2} (f_x + i f_y) \\
&= u_x + i v_x + i u_y - v_y \\
&= (u_x - v_y) + i (v_x + u_y) \\
&= 0 + i 0
\end{aligned}$$

($$\p_{\bar{z}} f(z) = 0$$ is a much better way to write this. The Cauchy-Riemann version should be deprecated.)

As long as $$f$$ is continuous and this condition is true in a region $$D$$, operations on $$f(z)$$ essentially work like they would for one-variable functions in $$z$$. For instance $$\p_z (z^n) = n z^{n-1}$$.

While $$z$$ seems like a 2-dimensional variable, there's only one 'degree of freedom' in the derivative of a complex function. $$f'(z)$$ has to be a simple complex number, which rotates and scales tangent vectors uniformly (a [conformal map](https://en.wikipedia.org/wiki/Conformal_map)):

$$f(z + dz) \approx f(z) + f'(z) dz = f(z) + re^{i\theta} dz$$

Functions which are complex-differential at every point within a region are called [holomorphic](https://en.wikipedia.org/wiki/Holomorphic_function) ('holo' is Greek for 'whole') or regular in that region for some reason. A function $$f(z)$$ that is holomorphic in a region $$D$$ is extremely well-behaved in that region:

* $$f$$ is _infinitely_ complex-differentiable in $$D$$
* and $$f$$ is 'complex analytic', ie equal to its Taylor series in $$z$$ throughout $$D$$. The series around any particular point converges within the largest circular disk that stays within $$D$$.
* and $$f$$ is locally invertible, ie $$f^{-1}(w + dw) \approx z + (f'(z))^{-1} dw$$ exists and is holomorphic in the neighborhood of $$w = f(z)$$.
* its antiderivatives exist, and its integrals along any closed contour $$C$$ inside $$D$$ vanishes: $$\oint_C f(z) dz = 0$$.
* the data of $$f$$ in $$D$$ is fully determined by its values on the boundary of the region, or on any one-dimensional curve within $$D$$, or on any nontrivial subregion of $$D$$, in the sense that its Taylor series can be computed on a subset of the space and then will give the correct value throughout $$D$$ (possibly via [analytic continuation]((https://en.wikipedia.org/wiki/Analytic_continuation))).

The general theme is that holomorphic/analytic functions generally act like one-dimensional functions and all of the calculus is really easy on them. This tends to be true much more than it is for 1d calculus.

If two analytic functions defined on _different_ regions nonetheless agree on an overlapping region, they are in a sense the 'same function'. This means that you can "analytically continue" a function by finding other functions which agree on an overlapping line or region. A simple use of this is to 'glue together' Taylor expansions around different points to go around a divergence. The [Riemann Zeta function](https://en.wikipedia.org/wiki/Riemann_zeta_function) is a famous example of a function which has an interesting analytic continuation: the function is easily defined on the positive real axis where $$x>1$$, but the famous [Riemann Hypothesis](https://en.wikipedia.org/wiki/Riemann_hypothesis) concerns zeroes of its analytic continuation elsewhere on $$\bb{C}$$.

Most 1d functions like $$e^x$$ and $$\sin x$$ have holomorphic complex versions like $$e^z$$ and $$\sin z$$ that are analytic everywhere. Discontinuous functions like $$\|z\|$$ or $$\log z = i \theta \ln r  $$, or functions that include an explicit or implicit $$\bar{z}$$ dependency, fail to be analytic somewhere.

Complex differentiability fails at singularities. We categorize the types:

* _poles_ of order $$n$$, around which $$f(z) \sim 1/z^n$$, which are 'well-behaved' singularities. Around these there's a region where $$1/f$$ is analytic. 'Zeros' and 'poles' are dual in the sense that $$f \sim z^n$$ at zeroes and $$f \sim 1/z^n$$ at poles.
* _removable singularities_: singularities that can be removed by redefinition, probably because they're an indeterminate form. The canonical example is $$\sin(z)/z$$ which is repaired by defining $$\sin(0)/0 = 1$$. In a sense these are not singularities at all, they're just poorly handle by our notation.
* _essential singularities_: singularities which oscillate infinitely rapidly near a point, such that they are in a sense too complicated to handle by normal methods. $$\sin(1/z)$$ or $$e^{1/z}$$ are the canonical examples. They all look like this, oscillating infinitely: [Great Picard's Theorem](https://en.wikipedia.org/wiki/Picard_theorem) (what a name) says that near an essential singularity the function takes every value infinitely times, except possibly one.

Poles are much more interesting than the other two.

------

## 3. Residues


No one would really care about complex analysis except for, well, analysts, were it not for one suspicious fact about the complex derivatives:

$$\p_{\bar{z}} \frac{1}{z} \neq 0$$

(Make sure you see that that's a $$\bar{z}$$-derivative.)

For some reason, for _only_ $$n=-1$$, $$z^n$$  has a certain kind of divergence at $$z=0$$. It looks like a 2d [delta <strike>function</strike> distribution](https://en.wikipedia.org/wiki/Dirac_delta_function):

$$\p_{\bar{z}} \frac{1}{z} = 2 \pi i \delta (z)$$

Meaning tha $$\p_{\bar{z}} \frac{1}{z} = 0$$ unless $$z = 0$$, in which case it has the value $$2 \pi i$$.

[By the way, this is intrinsically related to the fact that we're doing calculus in 2d. It is really a skew way of writing the more fundamental fact that $$\oint d \theta = 2 \pi$$ if you integrate around the origin, combined with the fact that $$\frac{1}{z} dz$$ cancels out its own $$\theta$$ dependence. It's related to the 1-dimensional formula $$\p_x \log x = \frac{1}{x} + i \pi \delta(x)$$, and there are versions in higher dimensions as well. Physicists are familiar with the 3d case without always realizing it: the Maxwell equation $$\nabla \cdot E = \rho$$ applied to a point charge only works if $$\nabla \cdot \frac{\hat{r}}{r^2} = 4 \pi \delta(r)$$. More on that another time, I hope.]

This is equivalent to saying that the contour integral (integral on a closed path) of $$1/z$$ around the origin is non-zero:

$$\begin{aligned}
\oint \frac{1}{z} dz &= \oint \frac{e^{i \theta} dr +  ir e^{i\theta} d \theta }{r e^{i \theta}} \\
 &= \oint \frac{dr}{r} + i d \theta \\
&= 2 \pi i
\end{aligned}$$

It's clear why this non-zero contour only holds for $$z^{-1}$$: for any other $$z^n$$, the $$d \theta$$ term is still a non-constant function of $$\theta$$, so its values on each end cancel out. For $$n=-1$$, though, the $$d \theta$$ just counts the total change in angle.

The delta-function version follows from Stoke's theorem. Since the contour integral gives the same value on any path as long as it circles $$z=0$$, the divergence must be fully located at that point:

$$\begin{aligned}
\oint_{\p D} \frac{1}{z} dz &= \iint_D d(\frac{dz}{z}) \\
2\pi i &= \iint_D \p_{\bar{z}} \frac{1}{z} d \bar{z} \^ dz \\
2 \pi i \iint_D \delta(z, \bar{z}) d\bar{z} \^ dz &= \iint_D \p_{\bar{z}} \frac{1}{z} d \bar{z} \^ dz \\

\p_{\bar{z}} \frac{1}{z} &\equiv 2 \pi i \delta(z, \bar{z})
\end{aligned}$$

---------

A function that is holomorphic except at a set of poles is called _meromorphic_ ('mero-' is [Greek](https://www.etymonline.com/search?q=mero-), meaning 'part' or 'fraction'). If we integrate a meromorphic function around a region $$D$$ the result only contains contributions from the $$\frac{1}{z}$$ terms. Around each order-1 pole at $$z_k$$, $$f(z_k)$$ has a series expansion that looks like $$f(z_k) \sim f_{-1} \frac{1}{z_k} + f^{*}(z_k)$$ where $$f^{*}(z_k)$$ has no $$z^{-1}$$ term. A clever calculist then realizes that a contour integral around a region can be computed _only_ from the values of the $$z_{-1}$$ terms at each pole.

The $$f_{-1}$$ series coefficients at each pole $$z_k$$ are for some reason called [residues](https://en.wikipedia.org/wiki/Residue_theorem) and are written as $$\text{Res}(f, z_k)$$. Thus we can transform a contour integral like this:

$$\int_{\p D} f(z) dz = 2 \pi i \sum_{z_k}  I(\p D, z_k) \text{Res} (f, z_k)$$

Where $$I(\p D, z_k)$$ gives the [winding number](https://en.wikipedia.org/wiki/Winding_number) around the order-1 pole (+1 for single positive rotation, -1 for a single negative rotation, etc).

This makes integration of analytic functions around closed contours _really easy_. You can often just eyeball them:

$$\oint_{\p D} \frac{1}{z-a} dz = (2\pi i) 1_{a \in D}$$

($$1_{a \in D}$$ is an [indicator function](https://en.wikipedia.org/wiki/Indicator_function) which equals $$1$$ if $$a \in D$$ and $$0$$ otherwise.)

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

By the way, there is a remarkable duality between zeroes and poles. In the region of a pole of a function $$f$$, the function behaves like $$\frac{1}{g}$$ where $$g$$ is an analytic function. In general a meromorphic function can be written as $$f= \frac{h}{g}$$ where $$g,h$$ are analytic, with the zeroes of $$g$$ corresponding to the poles of $$f$$.

-------------

## 4. Integral tricks

If you stare at the "calculus of residues" long enough you'll realize that, although they deal complex-valued functions, you can pull some tricks that allow them to be used to solve real-valued integrals. Even if you never look at complex analysis again, you'll still occasionally see complex analytic trickery come up in solving [otherwise annoying integrals](https://math.stackexchange.com/questions/562694/integral-int-11-frac1x-sqrt-frac1x1-x-ln-left-frac2-x22-x1/563063).

For starters, note that closed integrals of a function with a Laurent series can be eyeballed using the Cauchy integral formula:

$$\begin{aligned}
\oint_{r=1} \frac{1}{z(z-3)} dz &=  \oint_{r=1} \frac{1}{3} \frac{1}{z-3} - \frac{1}{3}\frac{1}{z} dz \\
&= 2 \pi i \frac{1}{3} (-1) \\
&= - \frac{2}{3} \pi i
\end{aligned}$$

Now how can we apply that to an integral in $$\bb{R}$$?

Integrals along the real line $$\int_{-\infty}^{\infty}$$ can often be computed by 'closing the contour' at $$r = \infty$$. This is especially easy if the integrand vanishes at $$r=\infty$$, because the whole term just drops out, but it's also enough if it's just easy to compute there.

For instance, in this integral we deduce that the integral from $$(-\infty, \infty)$$ equals the integral on the closed contour that adds in a section from $$r = +\infty$$ to $$r = -\infty$$ by varying $$\theta \in (0, \pi)$$, because the integrand is $$0$$ on that whole arc:

$$\begin{aligned}
\int_{-\infty}^{\infty} \frac{1}{1 + x^2} dx &= \int_{r = -\infty}^{r = \infty} \frac{dz}{1 + z^2} + \int_{\theta=0, \, r=\infty}^{\theta=\pi, \, r=\infty} \frac{dz}{1 + z^2} \\
&= \oint \frac{1}{z - i} \frac{1}{z + i} dz \\
&= (2 \pi i) \text{Res}(z=i, \frac{1}{z - i} \frac{1}{z + i}) \\
&= 2\pi i \frac{1}{2i} \\
&= \pi
\end{aligned}$$

Here we closed the contour around the upper-half plane, upon which the integrand is $$0$$ due to the $$r^2 \ra \infty$$. One pole is the upper-half plane and one is in the lower. The winding number around the upper is $$+1$$ and the residue is $$\frac{1}{z+i}$$ evaluated at $$z=i$$, or $$1/2i$$. If we had used the lower half-plane the winding number would have been $$-1$$ and the residue $$-1/2i$$, so the result is independent of how we closed the contour. This method gives the answer very directly without having to remember that $$\int \frac{dx}{1 + x^2} = \tan^{-1} x$$ or anything like that.

(Note that this wouldn't work if the pole was _on_ the path of integration, as in $$\int_{-\infty}^{+\infty} \frac{1}{x} dx$$. This integral is the [Cauchy Principal Value](https://en.wikipedia.org/wiki/Cauchy_principal_value) and is in a sense an indefinite form like $$0/0$$ whose value depends on the context. More on that another time.)

Many other integrals are solvable by choosing contours that are amenable to integration. Often choices that keep $$r$$ or $$\theta$$ constant are easiest. See Wikipedia on [contour integration](https://en.wikipedia.org/wiki/Contour_integration) for many examples.

-----------

## 5. Topological concerns

There are some tedious things you have to account for when considering functions of $$z$$.

First, the $$\theta$$ variable is discontinuous, since $$\theta = 0$$ and $$\theta = 2\pi$$ refer to the same point. This means that inverting a function of $$\theta$$ will produce a [multi-valued function](https://en.wikipedia.org/wiki/Multivalued_function):

$$\log e^{i \theta} = i \theta + 2 \pi i k_{\in \bb{Z}}$$

Smoothly varying $$\theta = \int d \theta$$ of course will just continue to tick up based on the path of integration: $$2\pi, 4\pi, 6\pi$$, etc. But the $$\log$$ function itself appears to have a discontinuity of $$2\pi i$$ at $$\theta = 0$$.

When dealing with these multi-valued functions you can consider $$\theta = 0$$ as a 'branch point' --- a place where the function becomes multi-valued. But to be honest the whole theory of branch points isn't very interesting. I prefer to just think of all math being done modulo $$2 \pi$$, that is, the type of the value $$\log \theta$$ is topogically a circle, rather than a number on the real line.

Another topological interest in $$\bb{C}$$: if you 'join together' the points at infinity in every direction by defining a symbol $$\infty$$ such that $$1/0 = \infty$$, you get the "extended complex plane" or the [Riemann sphere](https://en.wikipedia.org/wiki/Riemann_sphere), since it is topologically shaped like a sphere. Most of the things that seem like they should be true involving $$\infty$$ are true in this case. For example, the asymptotes of $$\frac{1}{z}$$ on either size of $$\| z \| = 0$$ really _do_ connect at infinity and come back on the other side.

The Riemann sphere is topologically like a sphere, but acts like a _projective_ plane, which is a bit unintuitive. (It turns out to corresponds rather to a half sphere where antipodal points are considered equivalent). Particularly, it kinda seems like $$+r$$ and $$-r$$ should be different points, rather than the 'same' infinity. There is probably a resolution to this using [oriented projective geometry](https://en.wikipedia.org/wiki/Oriented_projective_geometry), defining the back half of the sphere as a second copy of $$\bb{C}$$ and conjoining the two at $$\infty e^{i \theta} \lra -\infty e^{i\theta}$$, but that's not worth discussing further here, and it's usually not mentioned in complex-analysis treatments.

Complex analytic functions map the Riemann sphere to itself in some way. For instance, $$z \mapsto \frac{1}{z}$$ swaps $$0$$ and $$\infty$$ and the rest of the sphere comes along for the ride. Powers of $$z$$ cause the mapping to be $$m:n$$ --- so $$z^2$$ maps two copies of the sphere to one copy, while $$z^{1/2}$$ maps one copy to two copies, hence becoming multi-valued. The [möbius transformations](https://en.wikipedia.org/wiki/M%C3%B6bius_transformation), functions of the form $$\frac{az + b}{cz + d}$$ with $$ad-bc \neq 0$$, are the invertible holomorphic transformations of the Riemann sphere; they comprise dilations, rotations, reflections, and inversions of $$\bb{C}$$.


------

## 6. Convergence concerns

Just like in real-variable calculus, Taylor series in $$\bb{C}$$ do not always converge, and the region of convergence is determined by the distance to the closest pole. Unlike real-variable calculus, this makes a lot more sense --- since in $$\bb{R}$$ you still had to account for convergence failures due to poles that were on the complex part of the plane! Many of the 'convergence tests' that are learned in intro calculus make a lot more sense in $$\bb{C}$ as well.

In short, a series $$f(z-a) \approx f_0 + f_1 (z-a) + f_2 \frac{(z-a)^2}{2!} + \ldots$$ only converges within circles around $$a$$ that do not contain any poles, and thus what we call the 'radius of convergence' is the distance to the nearest pole in $$\bb{C}$$. For instance, $$\frac{1}{1 + x^2}$$ around $$x=0$$ has radius of convergence $$r=1$$ since there are poles at $$\pm i$$.

Sometimes we can expand a series around different points to work around this. Amusingly, you can keep changing the point you expand around to 'go around' a pole, producing an analytic continuation outside the radius of the initial Taylor series.

It is occasionally useful to expand a function as a Taylor series around $$z=\infty$$, by creating a series in $$1/z$$ instead:

$$\frac{1}{1-z} = \begin{cases} 
1 + z + z^2 + \ldots & \| z \| < 1 \\
-\frac{1}{z} - \frac{1}{z^2} - \frac{1}{z^3} - \ldots & \| z \| > 1 
\end{cases} $$

The simplest way to show that a series converges is to show that the series still converges if $$z$$ is replaced with $$r = \|z\|$$, since 

$$f(z) = a_0 + a_1 z + a_2 z^2 + \ldots \leq f(r) = a_0 + a_1 r + a_2 r^2 + \ldots $$

After all, the phases of the $$z$$ terms can only serve to reduce the sums of the magnitudes.

We know that geometric series $$1 + x + x^2 + \ldots$$ converge if and only if $$x < 1$$. This lets us quickly concoct the 'best' of the convergence tests: a series converges in regions where the magnitudes of its terms converge like a geometric series. That is, $$\sum a_n r^n$$ definitely converges if the terms look like $$\sqrt[n]{\| a_n r^n \|} = \sqrt[n]{\| a_n \| } r \lt 1$$. This gives the [root test](https://en.wikipedia.org/wiki/Root_test) for convergence:

$$R = \frac{1}{\lim_{n \ra \infty} \sup \sqrt[n]{\| a_n \| }} > 0$$

If $$R = 0$$ the series still might converge, depending on what the phases of $$a_n$$ do! --- if they all point the same way it doesn't, but if they point every which way it might. If $$r > R$$ it definitely doesn't. If $$R = \infty$$ then the series converges for all finite $$\|z\|$$ and is called an 'entire' function, which is a weird name but there you go.

The root test is the most powerful of the simple convergence tests, because it hits _exactly_ on the property that $$\sum \| a_n \| r^n$$ converges if its magnitudes are a convergent geometric sum like $$\sum x^n$$. The other tests that you might have heard of all 'undershoot' this property: for instance the "ratio test" says that 

$$\| \frac{a_n r^n }{a_{n+1} r^{n+1}} \| = \| \frac{a_n}{a_{n+1}} \| \frac{1}{r} < \| \frac{x^n}{x^{n+1}} \| = 1$$

This captures the idea that the series does converge if its successive ratios are less than that of a geometric series, but for example it it fails if the terms look like $$x + x + x^2 + x^2 + x^3 + x^3 + \ldots$$ or something.

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

Anyway, in summary, please use $$\bb{R}^2$$ instead of $$\bb{C}$$ if you can. Thanks.