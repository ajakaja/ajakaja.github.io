---
layout: blog
title: "Fourier Transforms via magic"
footnotes: true
math: true
aside: true
tags: notes
---

$$\gdef\F#1{\mathcal{F}[#1]}$$

A while ago I found a series of papers which do some weird stuff with derivative operators:

1. [New Dirac Delta function based methods with applications to perturbative expansions in quantum field theory](https://arxiv.org/abs/1404.0747) by Kempf/Jackson/Morales, 2014
2. [How to (Path-) Integrate by Differentiating](https://arxiv.org/abs/1507.04348) also by Kempf/Jackson/Morales, 2015
3. [Integration by differentiation: new proofs, methods and examples](https://arxiv.org/abs/1610.09702) by Jia/Tang/Kempf, 2016

The general theme is: evaluating functions on derivative operators $$f(\p)$$, and applying this to delta functions $$f(\p_x) \delta(x)$$, is occasionally useful and can give weird alternate characterizations of the Fourier transform and can be used to efficiently solve integrals.

The authors are physicists, unsurprisingly, and I'm sure there are a bunch of reasons why these results are either not that surprising or surprising-yet-not-useful, but I found them remarkable. But the whole thing is confusing and hard to make sense of. Here's a... totally different take, in which I rederive the main result by poking around.

tldr: the Fourier transform of $$f(x, \p_x)$$ is $$f(i \p_k, -ik) 2 \pi  \delta(k)$$, whatever that means.

<!--more-->

-----

## 1.

First let's fix a Fourier transform convention:

$$\hat{f}(k) = \F{f(x)} = \hat{f}(k) = \int f(x) e^{- ik x} dx$$

$$f(x) = \mathcal{F}^{-1}[\hat{f}(k)] = \frac{1}{2 \pi} \int \hat{f}(k) e^{ ik x} dk$$

I prefer not to use the ones that put $$2 \pi$$ in the exponent because it's distracting.

Here are a few common Fourier transform formulas in this convention, for reference:

$$\begin{aligned}
\F{1} &= 2 \pi \delta(k)\\ 
\F{\delta(x)} &= 1 \\
\F{\p_x^n f(x)} &= (ik)^n \hat{f}(k) \\
\F{x^n f(x)} &= (i \p_k)^n \hat{f}(k)
\end{aligned}$$


------

## 2

It is common to take Fourier transforms of operators acting on functions, like $$\F{\p_x f(x)} = ik \hat{f}(k)$$, in order to solve differential equations. This can be computed using integration by parts inside the transform:

$$\F{\p_x f(x)} = \int \p_x f(x) e^{-ikx} dx = - \int f(x) \p_x e^{-ikx} dx = (ik) \F{f(x)}$$

It seems plausible to use the same argument to Fourier-transform a "freestanding" derivative operator, like $$\p_x$$:

$$\F{\p_x} = \int \p_x e^{-ikx} dx = (-ik) \F{1} = (-ik) 2 \pi \delta(k)$$

I find this compelling, because it seems to work. Note that the minus sign is related to integration by parts. We might rewrite $$\p_x f(x)$$ as an operator $$- f(x) \p_x$$. These are different in general, but under an integral where the boundary vanishes they are the same, which is an assumption we'll make liberally.

We can also find $$\F{x}$$ by rewriting it as a derivative in $$k$$:

$$\F{x} = \int x e^{-ikx} dx = \int (i \p_k) e^{-ikx} dx = (i \p_k) \F{1} = 2 \pi i \delta'(k)$$

Armed with these, we may transform any function in $$\p_x$$ or $$x$$ which has a Taylor series:

$$\begin{aligned} \F{f(\p_x)} &= \int f(\p_x) e^{-ikx} dx = \int f(-ik) e^{-ikx} dx = f(-ik) (2 \pi \delta(k)) \\
\F{f(x)} &= \int f(x) e^{-ikx} dx = \int f(i \p_k) e^{-ikx} dx = f(i \p_k) (2 \pi \delta(k)) \end{aligned}$$

Or even both at once, as long as we are careful with what all of the operators act on:

$$\F{f(x, \p_x)} = f(i \p_k, -ik) 2 \pi \delta(k)$$

In this expression, the $$\p_x$$ and $$\p_k$$s are acting to the right, _not_ on internal members of the expression. If they act on an internal member they pick up a minus sign, like we saw above: 

$$\F{\p_x f(x)} = \F{- f(x) \p_x} = f(i \p_k) (ik)$$

-------

All of this mostly seems to work if we allow negative powers of $$x$$ and $$\p_x$$ also, but there is some funny business around integration bounds.

$$\begin{aligned}
\F{1/x} &= \int \frac{1}{x} e^{-ikx} dx \\
&= \int (i \p_k)^{-1} e^{-ikx} dx \\
&= (i \p_k)^{-1} \int e^{-ikx} dx \\
&= (i \p_k)^{-1} 2 \pi \delta(k) \\
&= -2 \pi i (\theta(k) + c)
\end{aligned}$$

What value of $$c$$ should be used? To get the same value as Wikipedia's table of Fourier transforms it should be $$c = \frac{1}{2}$$. This makes $$\theta(k) + \frac{1}{2}$$ an odd function, which means it is a choice that $$\frac{1}{x} \vert_{x=0} = 0$$. This seems somewhat arbitrary, and I suspect that one could get away with just not choosing at all. If we do use $$c = \frac{1}{2}$$, we get:

$$\F{1/x} = -2 \pi i (\theta(k) + \frac{1}{2}) = - i \pi \sgn(k)$$

The other direction is simpler:

$$\F{\p_x^{-1}} = \int \p_x^{-1} e^{-ikx} dx = \frac{1}{ik} \F{1} = \frac{1}{ik}2 \pi \delta(k)$$

In summary we have a rough hand-waving method for -- well, maybe not for rigorously deriving Fourier transforms, but at least for guessing at them, for derivative operators can be written as Laurent series (Taylor series with negative powers). Just swap $$f(x, \p_x) \ra f(i \p_k, - ik)$$.

In a sense this is a quarter rotation in the $$(x, \p_x)$$ plane, followed by multiplying by $$i$$ and relabeling $$x \ra k$$. That is:

$$\begin{pmatrix} k \\ \p_k \end{pmatrix}  = i R \begin{pmatrix} x \\ \p_x \end{pmatrix} $$

I don't now what it means to rotate in the $$(x, \p_x)$$ plane, but it turns out that you can do [other](https://en.m.wikipedia.org/wiki/Linear_canonical_transformation) linear transformations in this plane as well -- fractional rotations, or arbitrary matrices. Incidentally, the Laplace transform is $$(t, \p_t) \ra (-\p_s, -s)$$, although the two-sided transform is better behaved than the more common one-sided transform. The one-sided version produces a bunch of integration bounds $$f(0)$$ and such in the process, which is useful because it's used for signals that turn 'on' at $$t=0$$, but not too helpful for understanding as a rotation.

----

## 3. An integration technique

These are the main results of the papers mentioned above, I guess because papers have to justify their existence.

Recall that the integral of a function over the real line is equal to its Fourier transform evaluated at $$0$$:

$$\int_{-\infty}^{\infty} g(x) dx = \hat{g}(0)$$

Using our form of $$\hat{g}$$ this is:

$$\hat{g}(0) = 2 \pi g(- i \p_k) \delta(k) \vert_{k = 0}$$

This is readily computable:

$$\begin{aligned}
\int_{-\infty}^{\infty} \frac{\sin x}{x} dx &= 2 \pi \frac{e^{-\p_x} - e^{\p_x}}{2 i} \frac{1}{i \p_x} \delta(x) \vert_{x =0} \\
&= \pi [e^{\p_x} - e^{- \p_x}] \theta(x) \vert_{x = 0} \\
&= \pi [ \theta(x + 1) + c - \theta(x-1) - c]_{x  = 0} \\
&= \pi [ \theta(x + 1)  - \theta(x-1) ]_{x = 0} \\
&= \pi
\end{aligned}$$

This is so much easier and more _algebraic_ than doing a limit and taking the principal value or whatever you normally have to do. As a bonus you get to see the Fourier transform as an intermediate step (it's $$\pi [ \theta(x + 1) - \theta(x-1)]$$)

There are also versions for integrating over finite intervals, doing Laplace transforms, and a bunch of other stuff. I'll probably write more about them later. There are more tricks -- solving bounded integrals, for instance, amounts to evaluating $$\int (\theta(b) - \theta(a)) f(x) dx$$, and using the fact that we know the Fourier transform of $$\theta(x)$$. Although it is messy: $$\sgn(x)$$ has a clean transform, $$\F{\sgn(x)} = \frac{1}{ik}$$. Then you solve for $$\theta(x) = \frac{1}{2}(\sgn(x) - 1)$$.

Anyway, I wanted to write this up so I don't forget about it or how to understand it. Hope it's useful to somebody else.