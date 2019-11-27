---
layout: blog
title: "Meditation on Taylor Series"
math: true
footnotes: true
---

*(Notes. Definitely not interesting unless, at minimum, you really really liked calculus.)*

---

## 1

We can often write a differentiable function $$f(x)$$ as a [Taylor series](https://en.wikipedia.org/wiki/Taylor_series) around a point $$x$$, approximating it in terms of its derivatives at that point:

$$f(x+a) = \sum_{0}^{\infty} \frac{a^{n} f^{(n)}(x) }{n!}$$

And, under certain conditions, this series will converge exactly to the values of the function at nearby points.

<!--more-->

<small>(It may be that there is a certain radius of convergence around $$x$$ in which this approximation is valid. For the remainder of this page, assume we're dealing with $$f$$ and $$x$$ such that $$f$$ has a series which is convergent around $$x$$ and we're staying close enough for that to be valid.)</small>

<small>(You may be more used to seeing this as $$f(x) = \sum \frac{(x - x_0)^{n} f^{(n)}(x_0)}{n!}$$. They're equivalent, of course, but for our purposes it will be cleaner to write out it as an approximation for a displacement $$a$$ from a point $$x$$, rather than having to write the displacement as $$(x - x_0)$$.)</small>

This can be written in a cleaner notation if we let ourselves treat the derivative operator $$\p_{x}$$ as a variable (sometimes we will omit the subscript $$x$$ to keep things uncluttered) and then treat the whole summation as an operator acting on *f*:

$$f(x+a) = [\sum \frac{(a \p_{x})^{n}}{n!}]f(x)$$

And it's cleaner still if we recognize the summation as the Taylor series for $$e^{x}$$ (neglecting, perhaps, to define this rigorously):

$$f(x+a) = e^{a\p_{x}} f(x)$$

<small>(In physics we look at this and say that $$\p_{x}$$ is the 'generator of translations', in the sense of generators of [Lie Groups](https://en.wikipedia.org/wiki/Lie_group), and that $$e^{a \p_{x}}$$ is the [translation operator](https://en.wikipedia.org/wiki/Shift_operator).)</small>

This form is especially nice because it lets us translate by one variable at a time when working with multivariate functions:

$$f(x+a, y) = e^{a\p_{x}} f(x,y)$$

Or translate by complex variables, using $$\p_{z} = \frac{1}{2}(\p_{x} - i \p_{y})$$:[^negative]

[^negative]: The $$\frac{1}{2}$$ and the negative sign are required so that $$\p_{z} \cdot dz = $$ $$\p_{z} \cdot (dx + i dy) = 1$$.

$$f(z + a) = e^{a \p_{z}} f(z)$$

Or calculate higher-dimensional Taylor series, using $$\nabla = \p_{x} + \p_{y}$$:

$$f(\b{x} + \b{v}) = e^{\mathbf{v} \cdot \nabla} f(\mathbf{x}) = \Big[ \sum \frac{(v_{x} \p_{x} + v_{y} \p_{y})^{n}}{n!} \Big] f(x,y)$$

Or write out multiple translations in a row:[^curvature]

[^curvature]: Whether $$e^{a\p_{x}}e^{b\p_{y}} = e^{b\p_{y}}e^{a\p_{x}}$$ gets into whether the underlying manifold has any curvature.

$$f(x + a + b) = e^{b\p_{x}} e^{a\p_{x}} f(x) = e^{(b + a)\p_{x}} f(x)$$

Or implement a time-translation operator for wave functions in (non-relativistic) quantum mechanics to compute how systems evolve in time while preserving total probability by construction[^schrodinger]:

[^schrodinger]: Given [Schrödinger's equation](https://en.wikipedia.org/wiki/Schr%C3%B6dinger_equation) $$H\psi = i \hbar \p_{t} \psi$$, expand $$e^{t \p_{t}} \psi$$ term-by-term, substitute, and unexpand.

$$\psi(x, t) = e^{t \p_{t}} \psi(x, 0) =  e^{- \frac{i t}{\hbar} H} \psi(x, 0) $$

So it's just all really great, when it works and the series converge and everything commutes the way you expect, and you can take integrals and derivatives term-by-term and everything's somehow peachy. 

<small>(In physics we tend to, instead of carefully proving things converge, just do the calculations and *see* if they match what they should be afterwards, and then wave our hands and conclude that it works, because it's easier that way and because (I suspect) getting a coherent calculus of operators is an analytical nightmare, and definitely not in immediate reach of the curious undergraduate.)</small>

----

## 2

Assume $$F(x) = \int f(x) dx$$ exists, and consider antidifferentiation as a left inverse of the differentation operator:

$$\p^{-1} f(x) = \int_{0}^{x} f(x') dx' = F(x) - F(0)$$

<small>(Why left? because $$(\p \circ \p^{-1}) f(x) = f$$, but $$(\p^{-1} \circ \p) f = f + c$$ is only equal up to a constant.)</small>

What can we do with $$\p^{-1}$$? Well, we can produce the $$\frac{a^{n}}{n!}$$ term in our Taylor expansion:

$$\begin{aligned}
\p^{-1} (1) &= x \\
\p^{-2} (1) &= \frac{x^{2}}{2} \\
\p^{-n} (1) &= \frac{x^{n}}{n!} \\
\p_{a}^{-n} (1) = \p^{-n} (1) \Big|_{x = a} &= \frac{a^{n}}{n!} \\
\end{aligned}
$$

(That's a derivative with respect to $$a$$ instead of $$x$$. They're just symbols, after all.)

And therefore:

$$e^{x} = \Big[ \sum_{n = 0}^{\infty} \p^{-n} \Big] 1 = 1 + x + \frac{x^{2}}{2!} + \ldots$$

$$e^{a\p_{x}} = \sum \p_{a}^{-n} (1) \p_{x}^{n} = 1 + a \p + \frac{a^{2}}{2!} \p^{2} + \ldots$$

$$f(x+a) = e^{a \p_{x}} f(x) = \Big[ \sum \p_{a}^{-n}(1) \p_{x}^{n} \Big] f(x) $$

Really, since $$\p_{a}$$ refers to a different variable, it will just treat $$\p_{x} f(x)$$ as a constant -- so we can just write:

$$f(x+a)= \Big[ \sum (\p^{-1}_{a} \p_{x})^{n} \Big] f(x) $$

Which has a nice symmetry to it. It reminds me of a change of basis, which, in some sense, it is.

It basically means: project $$f(x)$$ onto its behavior at each polynomial order $$\frac{x^{n}}{n!}$$, and then write it literally in terms of those polynomial orders using $$\frac{a^{n}}{n!}$$. If (1) $$f$$ is truly entirely constructible entirely from polynomials, and (2) the resulting sum converges, this should be equivalent to $$f(x+a)$$.

----

## 3 Misc

If we consider $$f$$ as an abstract function object which only takes on a value $$f(x)$$ when composed with a point $$\hat{x} \circ f = f(x)$$, then we can write a suggestive (but probably not too meaningful) equations like:

$$(\hat{x} + \vec{a}) \circ f = \hat{x} \circ \Big[ \sum (\p^{-1}_{a} \p_{x})^{n} \Big] \circ f$$

$$(\hat{x} + \vec{a})  = \hat{x} \circ \sum (\p^{-1}_{a} \p_{x})^{n}  $$

$$\hat{x} \circ (+a)  = \hat{x} \circ \sum (\p^{-1}_{a} \p_{x})^{n} $$

This says, approximately, that $$T_{\vec{a}}$$, translation by $$\vec{a}$$, is associative, and can be implemented in either x-space or 'operators on functions'-space.

$$(\hat{x} \circ T_{\vec{a}}) \circ f = \hat{x} \circ (T_{\vec{a}} \circ f)$$

Of course it's associative even if you can't write $$f$$ as a Taylor series, but, this gives a sort of 'implementation' for it, when it is.

There are other ways to conceptually 'implement' $$T_{\vec{a}} f$$:

Since the derivative operator gives the value of $$f(x + \e) \approx f(x) + \e f'(x)$$, at a point slightly displaced from $$x$$, we can presumably in principle do this infinitely many times to move a finite distance $$a$$:

$$f(x + a) = \lim_{\D x \ra 0} f(x) +  f'(x)\D x +  f'(x + \D x)\D x + \ldots$$
	
Which of course corresponds to just integrating the derivative of $$f$$:

$$ f(x + a) = f(x) + \int_{0}^{a} f'(x + y) dy$$

Alternatively we may write this as applying an infinitesimal translation operator $$T_{\e}$$ infinitely many times, which just leads back to the exponential expression:

$$f(x + a) = \lim_{\e \ra 0} T^{\frac{a}{\e}}_{\e} f(x) = \lim_{\e \ra 0} (1 + (T_{\e} - 1))^{\frac{a}{\e}} f(x) $$

$$ = \lim_{\e \ra 0} (1 + \D_{\e})^{\frac{a}{\e}} f(x) = e^{a \p_{x}} f(x)$$

----

## 4

I don't know, maybe this will be useful to someone, someday. I needed to write it down to keep various thoughts bundled together for later.