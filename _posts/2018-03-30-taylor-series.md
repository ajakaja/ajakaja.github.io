---
layout: blog
title: "Meditation on Taylor Series"
math: true
footnotes: true
tags: math
---

Some thoughts on Taylor series.

## 1

We can often write a differentiable function $$f(x)$$ as a [Taylor series](https://en.wikipedia.org/wiki/Taylor_series) around a point $$x$$, approximating it in terms of its derivatives at that point:

$$f(x+a) = \sum_{0}^{\infty} \frac{a^{n} f^{(n)}(x) }{n!}$$

And, under certain conditions, this series will converge exactly to the values of the function at nearby points.

<!--more-->

(Sometimes this is  $$f(x) = \sum \frac{(x - x_0)^{n} f^{(n)}(x_0)}{n!}$$. They're equivalent, of course, but for our purposes it will be cleaner to write out it as an approximation for a displacement $$a$$ from a point $$x$$, rather than having to write the displacement as $$(x - x_0)$$. Also, it may be that there is a certain radius of convergence around $$x$$ in which this approximation is valid. For the remainder of this page, assume we're dealing with $$f$$ and $$x$$ such that $$f$$ has a series which is convergent around $$x$$ and we're staying close enough for that to be valid.

This can be written in a cleaner notation if we let ourselves treat the derivative operator $$\p_{x}$$ as a variable, and then treat the whole summation as an operator acting on $$f$$:

$$f(x+a) = [\sum \frac{(a \p_{x})^{n}}{n!}]f(x)$$

(Seomtimes we'll omit the subscript and just write $$\p$$ to keep things uncluttered.)

And it's cleaner still if we recognize the summation as the Taylor series for $$e^{x}$$ (neglecting, perhaps, to define this rigorously):

$$f(x+a) = e^{a\p_{x}} f(x)$$

This shows that $$e^{\p_x}$$ implements the [translation operator](https://en.wikipedia.org/wiki/Shift_operator) acting on functions, and $$\p_x$$ acts like a "generator of translations" in the sense of generators of [Lie Groups](https://en.wikipedia.org/wiki/Lie_group).

This form is especially nice because it lets us translate by one variable at a time when working with multivariate functions:

$$f(x+a, y) = e^{a\p_{x}} f(x,y)$$

Or translate by complex variables, using $$\p_{z} = \frac{1}{2}(\p_{x} - i \p_{y})$$.

$$f(z + a) = e^{a \p_{z}} f(z)$$

(The $$\frac{1}{2}$$ and the negative sign are required so that $$\p_{z} \cdot z = $$ $$\p_{z} \cdot (dx + i dy) = 1$$.) 

Or calculate higher-dimensional Taylor series, using $$\nabla = \p_{x} + \p_{y}$$:

$$f(\b{x} + \b{v}) = e^{\mathbf{v} \cdot \nabla} f(\mathbf{x}) = \Big[ \sum \frac{(v_{x} \p_{x} + v_{y} \p_{y})^{n}}{n!} \Big] f(x,y)$$

Or write out multiple translations in a row:

$$f(x + a + b) = e^{b\p_{x}} e^{a\p_{x}} f(x) \? e^{(b + a)\p_{x}} f(x)$$

Whether $$e^{a\p_{x}}e^{b\p_{y}} = e^{b\p_{y}}e^{a\p_{x}}$$ is true depends on whether the (underlying coordinate system has any curvature. If it does then the LHS $$f(x + a + b)$$ doesn't make sense as you would need to specify the path of each translation, rather than just a displacement from $$x$$.)

----

## 2

Assume $$F(x) = \int f(x) \d x$$ exists, and consider antidifferentiation as a left inverse of the differentation operator:

$$\p^{-1} f(x) = \int_{0}^{x} f(x') dx' = F(x) - F(0)$$

(It's a left inverse because $$(\p \circ \p^{-1}) f(x) = f$$, but $$(\p^{-1} \circ \p) f = f + c$$ is only equal up to a constant.)

What can we do with $$\p^{-1}$$? Well, we can produce the $$a^n/ n!$$ term in our Taylor expansion:

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

Really, since $$\p_{a}$$ refers to a different variable, it will just treat $$\p_{x} f(x)$$ as a constant, so we can just write:

$$f(x+a)= \Big[ \sum (\p^{-1}_{a} \p_{x})^{n} \Big] f(x) $$

Which has a nice symmetry to it. It reminds me of a change of basis, which makes sense, because in some sense it is one. It basically means: project $$f(x)$$ onto the basis spanned by each polynomial order $$\frac{x^{n}}{n!}$$, and then write it in terms of those basis vectors using $$\frac{a^{n}}{n!}$$. If (1) $$f$$ is truly entirely constructible entirely from polynomials, and (2) the resulting sum converges, this should be equivalent to $$f(x+a)$$. It is similar to writing $$\b{v} = v_x \b{x} + v_y \b{y} + \ldots$$.

----

## 3. Misc

in differential geometry one things about about $$f(x)$$ as a sort of abstract object $$f$$ that doesn't know about any coordinate systems yet. Before you have coordinates, it's just a map between two spaces, for instance $$f: A \mapsto B$$. To get a coordinate representation there needs to be another mapping $$\hat{x}: \bb{R}^n \mapsto A$$ which locates points on $$A$$ according to some Euclidean coordinate system (or a subset of it, or whatever). We can write this as

$$f(x) = f \circ \hat{x} : \bb{R}^n \ra B$$

Although it's nice to treat $$\hat{x}$$ as an operator acting on $$f$$: the "evaluate at $$x$$ operator":

$$\hat{x} f \equiv f \circ \hat{x} = f(x)$$

Translating by a vector $$\vec{a}$$ in $$\bb{R^n}$$ is then written as the operation of addition when it takes place in $$\bb{R}^n$$, although I guess we can be weird and write it as function that is applied like this:

$$
\begin{aligned}
(+ \vec{a})(\hat{x}) &= \hat{x} \circ (+ \vec{a}) \equiv \hat{x} + \vec{a} \\ 
(\hat{x} + \vec{a}) f &= f \circ [\hat{x} \circ (+ \vec{a})] = f(x + \vec{a})
\end{aligned}
$$

We can also write it as an operator that acts on $$f$$:

$$\hat{x} (T_{\vec{a}} f) = (\hat{x} + \vec{a}) f = f(x + \vec{a})$$

All of this is pretty messy in math notation; it makes more sense by just writing out the whole chain:

$$x \ra x + \vec{a} \ra f(x+\vec{a})$$

And then you get a differently named object depending on where you put the parentheses.

Anyway, I find it interesting that the Taylor series operators from earlier give ways of writing these various things (for certain classes of functions, etc):

$$
\begin{aligned}
(\hat{x} + \vec{a}) f &=  \hat{x} (T_{\vec{a}} f) = \Big[ \sum (\p^{-1}_{a} \p_{x})^{n} \Big] [ \hat{x} f] \\
\end{aligned}
$$

I dunno. Guess that's a bit interesting.

-------------

For posterity, the other way of doing this is:

Since the derivative operator gives the value of $$f(x + \e) \approx f(x) + \e f'(x)$$, at a point slightly displaced from $$x$$, we can in principle do this infinitely many times to move a finite distance $$a$$:

$$f(x + a) = \lim_{\D x \ra 0} f(x) +  f'(x)\D x +  f'(x + \D x)\D x + \ldots$$
	
Which corresponds to just integrating the derivative of $$f$$:

$$ f(x + a) = f(x) + \int_{0}^{a} f'(x + y) \d y$$

Alternatively we may write this as applying an infinitesimal translation operator $$T_{\e}$$ infinitely many times, which just leads back to the exponential expression:

$$f(x + a) = \lim_{\e \ra 0} T^{\frac{a}{\e}}_{\e} f(x) = \lim_{\e \ra 0} (1 + (T_{\e} - 1))^{\frac{a}{\e}} f(x) $$

$$ = \lim_{\e \ra 0} (1 + T_{\e})^{\frac{a}{\e}} f(x) = e^{a \p_{x}} f(x)$$

----

## 4

I don't know, maybe this will be useful to someone, someday. I needed to write it down to keep various thoughts bundled together for later.