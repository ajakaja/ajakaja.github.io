---
layout: article
title: "Notes on Taylor Series"
footnotes: true
math: true
aside: true
---

## 1. Taylor Series

A Taylor series for an analytic function in $$\bb{R}$$ looks like this:

$$
\begin{aligned} f(x + \e) &= f(x) + f'(x) \e + f''(x) \frac{\e^2}{2} + \ldots \\
&= \sum f^{(n)} \frac{\e^n}{n!}
\end{aligned}$$

It's useful to write this as one big operator acting on $$f(x)$$:

$$f(x + \e) = \big[ \sum \frac{D^n_x \e^n}{n!} \big] f(x)$$

(That operator may be written more succinctly as $$e^{\e D_x}$$, which is commonly done in physics, and pretty magical the first time you see it.)

A _multivariate_ Taylor series looks messier at first. Let's look at it in two variables, with $$f_x \equiv \p_x f(\b{x})$$ and $$\b{e} = (e_x, e_y)$$, to get it into a more usable form:

$$\begin{aligned} 
f(\b x + \b e) &= f(\b x) + [f_x e_x + f_y e_y] + \frac{1}{2!} [f_{xx} e_x^2 + 2 f_{xy} e_x e_y + f_{yy} e_y^2] \\
&+ \frac{1}{3!} [f_{xxx} e_x^3 + 3 f_{xxy} e_x^2 e_y + 3 f_{xyy} e_x e_y^2 + f_{yyy} e_y^3] + \ldots
\end{aligned} $$

(The strangeness of the terms like $$2 f_{xy} e_x e_y$$ and $$3 f_{xxy} e_x^2 e_y$$ is because these are really sums of multiple terms; because of the [commutativity of partial derivatives](https://en.wikipedia.org/wiki/Symmetry_of_second_derivatives) on analytic functions, $$f_{xy} = f_{yx}$$, we can write $$f_{xy} e_x e_y + f_{yx} e_y e_x = 2 f_{xy} e_x e_y$$.)

...Which looks messy. We can make it a little easier by recognizing and consolidating the things that look like powers of $$(e_x \p_x + e_y \p_y)^n$$:

$$\begin{aligned} 
f(\b x + \b e) &= f(\b x) + (e_x \p_x + e_y \p_y) f(\b x) + \frac{(e_x \p_x + e_y \p_y)^2}{2!} f(\b x) + \ldots  \\
&= \big[ \sum_n \frac{(e_x \p_x + e_y \p_y)^n}{n!} \big] f(\b x) \\
&= \big[ \sum_n \frac{(\b{e} \cdot \vec{\p})^n}{n!} \big] f(\b x) 
\end{aligned} $$

($$\vec{\p}$$ is the 'vector of partial derivatives' $$\vec{\p} = (\p_x, \p_y)$$. It is often written as $$\nabla$$.)

(This can also be written as a sum over every individual term using [multi-index notation](https://en.wikipedia.org/wiki/Multi-index_notation).)

So that looks pretty good. And it can still be written as $$e^{\p \cdot \b{e}} f(\b{x})$$. The same formula -- now that we've hidden all the actual indexes -- happily continues to work for dimension $$> 2$$, as well.

... Actually, this is not as surprising a formula as it might look. What the multivariate Taylor series of $$f(\b{x})$$ _really_ is a bunch of single-variable ones multiplied together:

$$\begin{aligned}
f(x+ e_x, y + e_y) &= e^{e_x \p_x} f(x, y + e_y) \\
&= e^{e_x \p_x}e^{e_y \p_y} f(x,y) \\
&= e^{e_x \p_x + e_y \p_y} f(x,y) \\
&= e^{\b{e} \cdot \vec{\p}} f(\b{x}) \end{aligned} $$

I mention all this because it's useful to have a solid idea of what a scalar function is before we move to _vector_ functions.

-------

## 2 Vector Functions

There are several types of vector-valued functions -- curves like $$\gamma: \bb{R} \ra \bb{R}^n$$, or maps between manifolds like $$\b{f}: \bb{R}^m \ra \bb{R}^n$$ (including from a space to itself). In each case there is something like a Taylor series that can be defined. It's not commonly seen written out, but I think it _should be_, so let's try.

Let's imagine our function maps spaces $$X \ra Y$$, where $$X$$ has $$m$$ coordinates and $$Y$$ has $$n$$ coordinates, and $$m$$ might be 1 in the case of a curve. Then along any _particular_ coordinate in $$Y$$ out of the $$n$$ -- call it $$y_i$$ -- the Taylor series expression from above holds, because $$\b{f}_i = \b{f} \cdot y_i$$ is just a scalar function.

$$\b{f}(\b{x} + \b{e})_i = e^{\b{e} \cdot \vec{\p}} [\b{f}(\b{x})_i]$$

But of course this holds in every $$i$$ at once, so it holds for the whole function:

$$\b{f}(\b{x} + \b{e}) = e^{\b{e} \cdot \vec{\p}} \b{f}(\b{x})$$

The only subtlety here is that the partial derivatives $$\p$$ are now being taken _termwise_ -- once for each component of $$\b{f}$$. For example, consider the first few terms when $$X$$ and $$Y$$ are 2D:

$$\begin{aligned}
\b{f}(\b{x} + \b{e}) &= \b{f}(\b{x}) + (e_{x_1} \p_{x_1} + e_{x_2} \p_{x_2}) \b{f} + \frac{(e_{x_1} \p_{x_1} + e_{x_2} \p_{x_2})^2}{2!} \b{f} + \ldots\\
&= \b{f} + \begin{pmatrix} \p_{x_1} \b{f}_{y_1} & \p_{x_2} \b{f}_{y_1} \\ \p_{x_1} \b{f}_{y_2} & \p_{x_2} \b{f}_{y_2} \end{pmatrix} \begin{pmatrix} e_{x_1} \\ e_{x_2} \end{pmatrix} + \ldots \\
\end{aligned}$$

That second matrix term, $$n=1$$ in the series, is the _Jacobian_ of $$f$$, and is much more succinctly written as $$\p_{x_i} \b{f}_{y_j}$$, or even as $$\vec{\p} \o \b{f}$$ (I think -- that notation is a bit iffy, since $$\p$$ should be an operator acting on $$\b{f}$$!) The Jacobian matrix is, in essence, the 'first derivative' of a vector field, and it includes every term which can possibly matter.

Higher-order terms in the same position generalize 'second' and 'third' derivatives, etc. They are $$(\p \o \p) \b{f}$$, $$(\p \o \p \o \p) \b{f}$$, or $$\p^{\o n} \b{f}$$ in general, and they act on $$n$$ copies $$n$$ copies of $$(e_{x_1}, e_{x_2})$$, ie, $$\b{e}^{\o n}$$.

The full expansion in any dimensionality might be written like this:

$$\begin{aligned} \b{f}(\b{x} + \b{e}) &= \b{f} + \p_i \b{f} \cdot \b{e}^i + \frac{1}{2!}(\p_i \p_j \b{f}) \cdot \b{e}^i \b{e}^j + \frac{1}{3!} (\p_i \p_j \p_k \b{f}) \cdot \b{e}^i \b{e}^j \b{e}^k + \ldots \\ 
&= \b{f} + \p_i \b{f} \cdot \b{e}^i + \frac{1}{2!}(\p_i \o \p_j) \b{f} \cdot (\b{e}^i \o \b{e}^j) + \ldots \\
&=  \big[ \sum_{n} \frac{\b{e}^{\o n} \cdot \vec{\p}^{\o n}}{n!} \big] \b{f}(\b{x})
\end{aligned}$$

(And I guess we could probably just write the numerator as $$(\b{e} \cdot \vec{\p})^{\o n}$$, only I'm not sure that's ever done?)

We could have included indexes on $$\b{f}$$ also, throughout, by writing 

$$f(\b{x} + \b{e})_k = \big[ \sum_{n} \frac{\b{e}^{\o n} \cdot \vec{\p}^n}{n!} \big] f(\b{x})_k $$

This happily generalizes to functions which produce matrices or, like, any other object we care about.

$$M(\b{x} + \b{e})_{ij}= \big[ \sum_{n} \frac{\b{e}^{\o n} \cdot \vec{\p}^n}{n!} \big] M(\b{x})_{ij} $$


--------

## 3 Complex Taylor Series

In general, $$(z,\bar{z}) = (x + iy, x - iy)$$ is just a change of basis for $$\bb{R}^2$$:

$$z = \b{x} + \b{y}$$

$$\bar{z} = \b{x} - \b{y}$$


$$i$$ can be thought of as a 'rotation by $$\frac{\pi}{2}$$ operator' $$R$$. Hence $$i^2 = -1$$, because two quarter rotations is a reflection. Hence $$i \b{x} = y$$ and $$i \b{y} = -x$$. (nb: as described, the operator only acts to its _right_; if $$R\b{x} = y$$ then we should have $$\b{x} R = -y$$).

Then a complex number $$z = x + iy$$ may be understood as a single coefficient, like this:

$$\b{z} = (x + y R) \b{x} = x \b{x} + y \b{y}$$

If we want to do calculus on complex numbers, we also need derivatives. Because it should be true that $$\p_z z = \p_{\bar{z}} \bar{z} = 1$$ and $$\p_z \bar{z} = \p_{\bar{z}} z = 0$$, this requires that:

$$\p_z = \frac{1}{2} (\p_x - i \p_y) = \frac{1}{2}(\p_{\b{x}} - \p_{\b{y}})$$

$$\p_{\bar{z}} = \frac{1}{2} (\p_x + i \p_y) = \frac{1}{2}(\p_{\b{x}} + \p_{\b{y}})$$

Which is a little weird at first but you get used to it. In fact, most of complex analysis makes a lot more sense if you just do it in $$\bb{R}^2$$, in my opinion. This also leads to the fact that, in changing integration variables, $$dz \^ d\bar{z} = \frac{1}{2i} dx \^ dy$$.

Another way of representing complex numbers is as $$2 \times 2$$ matrices:

$$z = x + iy = x \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix} + y \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}$$

It's easy enough to check that the multiplication still holds.

-------

A function $$f: \bb{C} \ra \bb{C}$$ is _complex-analytic_ if it can be written as a Taylor series in $$z$$, and, importantly, _not_ in $$\bar{z}$$, the complex conjugate of $$z$$.

In general, the term 'analytic' means 'having a Taylor series'. When we're doing single or multivariate calculus, that means having one at all. In $$\bb{C}$$, that means having a series which is only a function of $$z$$. 

It's not enough that $$f(z)$$ not have an explicit dependence on $$\bar{z}$$, though. What's needed is that $$\p_{\bar{z}} f(z) = 0$$. This is because it turns out that a function can have a $$\bar{z}$$ derivative without depending on $$\bar{z}$$, because:

$$\p_{\bar{z}} \frac{1}{z} = \pi \delta(z)$$

Where the right side is the Delta Function. I think this is surprising. It makes more sense when computed with $$x + iy$$, writing $$\frac{1}{z} = \frac{1}{x + iy} = \frac{x - iy}{x^2 + y^2}$$, like this:

$$\begin{aligned}
\p_{\bar{z}} \frac{1}{z} &= \frac{1}{2}(\p_x + i \p_y) \frac{x - iy}{x^2 + y^2}  \\
&= \frac{1}{2} \big[ \frac{1}{x^2 + y^2} + \frac{(-2x)(x-iy)}{(x^2 + y^2)^2} + \frac{1}{x^2 + y^2} + \frac{i(-2y)(x-iy)}{(x^2 + y^2)^2} \big] \\
&= \frac{1}{x^2 + y^2} + \frac{-x^2 - y^2}{(x^2 + y^2)^2} \\
&= 0
\end{aligned}$$

... unless $$x = y = 0$$, in which case it's not because simplifying involves multiplying or dividing by $$\frac{0}{0}$$. I think.

I don't have a good quick explanation as to why the value would be, _specifically_, $$= \pi \delta(z)$$, because Delta functions are confusing. There are some proofs via Stoke's theorem, and we could work it out as a limit, probably) But not worth it right now.

Anyway, $$\p_{\bar{z}} f(z) = 0$$ means that if $$f(z) = (u(x, y) + i v(x, y))$$, then $$u_x = v_y$$ and $$u_y = - v_x$$, which are the _Cauchy-Riemann Equations_ for determining whether a function is holomorphic / complex-analytic.

-------

In general a function $$f(z, \bar{z})$$ is just another way of writing a function $$f(x,y)$$, and so can of course be expresses as a Taylor series in the two composite variables $$z, \bar{z}$$:

$$f(z + \D z, \bar{z} + \D \bar{z}) = \big[ \sum \frac{(\D z \p_z + \D \bar{z} \p_{\bar{z}})^n}{n!} \big] f(z, \bar{z})$$

Specifically in the case where $$\p_{\bar{z}} f(z) = 0$$, then we can write it as a Taylor series in $$z$$ alone, just because the rest of the terms are $$z$$:

$$f(z + \D z) =  \big[ \sum \frac{(\D z \p_z)^n}{n!} \big] f(z)$$

(The commutativity of partial derivatives guarantees that none of the $$z$$-derivatives of $$f(z)$$ will themselves have non-zero $$\bar{z}$$-derivatives.)

(Caveat: I'm never quite sure whether my intuitions about calculus are correct in the presence of Delta functions, so it might turn out the above statement is wrong? For instance what if $$f(z) = \log z$$; then $$\p_{\bar{z}} \p_z f(z) \stackrel{?}{=} \p_{\bar{z}} \frac{1}{z}$$? But perhaps $$\p_{\bar{z}} \log z \neq 0$$ anyway?)

## 4. Fourier Series