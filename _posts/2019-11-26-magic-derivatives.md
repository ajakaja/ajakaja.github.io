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

tldr: the Fourier transform of $$f(x)$$ is $$2 \pi f(i \p_x) \delta(x)$$. Er, what?

<!--more-->

-----

## 1. What the Fourier Transform does

I already know of an example of evaluating a function at a derivative. In physics it is common to write a 'translation operator' like this:

$$f(x + a) = e^{a \p_x} f(x)$$

It looks weird, but in practice we just take it as a proof that the Taylor series matches:

$$f(x + a) = (\sum \frac{a^n \p_x^n}{n!}) f(x) = e^{a \p_x} f(x)$$

We say that $$\p_x$$ is the 'generator of translations'.

It's easiest to interpret $$e^{a \p_x}$$ through its Taylor series, but another way we could do it is by guessing at an expansion of $$f$$ in terms of another basis where the action of $$e^{a \p_x}$$ is predictable -- for instance, the Fourier basis $$e^{k x}$$.

Let's use these as our Fourier transform convention:

$$\hat{f}(k) = \F{f(x)} = \hat{f}(k) = \int f(x) e^{- ik x} dx$$

$$f(x) = \mathcal{F}^{-1}[\hat{f}(k)] = \frac{1}{2 \pi} \int \hat{f}(k) e^{ ik x} dk$$

_If_ $$f(x)$$ is well-behaved under Fourier transforms, then it's easy to see what $$e^{a \p_x}$$ must be doing:

$$\begin{aligned}
e^{a \p_x} f(x) &= f(x+a) \\
&= \frac{1}{2 \pi} \int \hat{f}(k) e^{ ik (x + a)} dk \\

&= \mathcal{F}^{-1} [ e^{ika} \hat{f}(k) ]\\
\end{aligned}$$

So applying $$e^{a \p_x}$$ to $$f(x)$$ is multiplication by $$e^{iak}$$ on the other side of a Fourier transform. This isn't that surprising if we remember the table of Fourier transforms: $$\p_x f(x) \ra (ik) \hat{f}(k)$$. But it is compelling that it's basically a mindless substitution: take any derivative operators you want and then take the Fourier transform, and they turn into factors of $$ik$$ on the other side, even if they're inside an exponent or whatever.

It turns out that we can do a lot more substituting this way. In fact it works like a rotation, in the $$(x, i \p_x)$$ plane. A Fourier transform from $$x$$ to $$k$$ coordinates:

$$\begin{aligned}
\F{\p_x} &= i k \\
\F{x} &= i \p_k \\
\end{aligned}$$

is a rotation in the $$(x, i \p_x)$$ plane, plus a re-labeling of variables $$x \ra k$$:

$$\begin{aligned}
R(x) &= i \p_x \\
R(i \p_x) &= x \\
\end{aligned}$$

--------

### 1.2

This means that we should be able to guess that $$\F{x} = i \p_k$$. This isn't _quite_ true, in fact. What's true is that $$\F{x f(x)} = i \p_k \hat{f}(k)$$. But the operator we 'rotate' needs something to act on. It all works out as expected if we let it act in $$1$$, which has Fourier transform $$\F{1} = 2 \pi \delta(k)$$:

$$\F{x^n} = (i \p_k)^n 2 \pi \delta(k)$$

Where $$\delta(k)$$ is a delta function. So, for any function which is equal to its Taylor series, we can write:

$$\F{f(x)} = 2 \pi f(i \p_k) \delta(k)$$

-------

### 1.3

To round things out, we should also handle $$\F{x^{-n}}$$ and $$\F{\p_x^{-n}}$$.

It's not exactly clear what $$\p_x^{-n}$$ should be -- some sort of repeated integral. Suppose we define it as $$\p_x^{-1} f = \int_0^x f(x') dx'$$. Then 

$$\p_x^{-n} (1) = \frac{x^n}{n!}$$

We already know how to take the transform of that -- it's 

$$\F{\frac{x^n}{n!}} = \frac{(i\p_k^n)}{n!} 2 \pi \delta(k)$$

A quirk of delta functions is that their derivative acts like division: $$\p_x \delta(x) = - \frac{\delta(x)}{x}$$. This is because delta functions are defined through what they do inside an integral, and inside an integral $$- x \delta'(x)$$ and $$\delta(x)$$ work the same way:

$$\begin{aligned}
- \int x \delta'(x) f(x) dx &= \int \delta(x) (x f(x))' dx \\
&= \int \delta(x) (f(x) - x f'(x)) \\
&= f(0) - 0 f'(0) \\
&= f(0) \\
&= \int \delta(x) f(x) dx
\end{aligned}$$

So if you accept that (which, I suppose, is only true if $$f$$ is well-behaved; particularly, $$f'(0)$$ should be finite) then it seems to say that $$ - x \delta'(x) = \delta(x)$$, which sort-of means that $$\delta'(x) = - \frac{\delta(x)}{x}$$. When iterated, this gives $$\frac{n!}{(-x)^n}$$.

Anyway, this means that we can write $$\F{\frac{x^n}{n!}}$$ as

$$\F{\p_x^{-n} (1)} = \frac{n!}{n! (ik)^n} 2 \pi \delta(k) = \frac{1}{(ik)^n} 2 \pi \delta(k)$$ 

So once again the Method of Mindless Substution $$x \ra ik$$ gives the 'right answer'.

One more case: $$x^{-n}$$. Mindless substitution gives:

$$\F{x^{-n}} = (i \p_k)^{-n} (2 \pi \delta(k))$$ 

This _almost_ works as well, but there's one caveat. When you integrate $$\int \delta(k) dk = \theta(k) + c$$, you have to pick $$c = \frac{1}{2}$$. This gives:

$$\F{\frac{1}{x}} = \frac{1}{i \p_k} 2 \pi \delta(k) = -2 \pi i (\theta(k) + \frac{1}{2}) = - i \pi \sgn(k)$$

I am not sure if this is necessary, or if that's $$c$$ is arbitrary and so an arbitrary choice has already been made in the standard table of Fourier transforms (Wikipedia mentions that you have to use the Cauchy Principal Value to get this anyway, whic makes sense, cause it's kinda sketchy as-is).

----

### 1.4

Okay, summary time. 

We have seen that, with a lot of hand-waving, you can take Fourier transforms by substitution:

$$\F{f(x, \p_x)} = f(i \p_k, ik) 2 \pi \delta(k)$$ 

This seems to work in most cases where $$f$$ has a series expansion in $$x$$ and $$\p_x$$. I'm sure there are some analytical details but it's useful to me even to be able to guess. Actually, it's not too hard to see how this works: $$x$$ and $$\p_x$$ can both be thought of as operators acting on the Fourier modes, like this:

$$
\begin{aligned}
\F{f(x, \p_x)} &= \int [f(x, \p_x) \circ 1] e^{ikx} dx \\
&= \int f(x, - i p_x) \circ e^{ikx} dx \\
&= \int f(- i p_k, ik) \circ e^{ikx} dx \\
&= \int [f(i \p_k, ik) \circ 1] e^{ikx} dx \\
&= f(i \p_k, ik) \circ  \int 1 e^{ikx} dx \\
&= f(i \p_k, ik) \circ (2 \pi \delta(k))
\end{aligned}$$

Here I've written $$\circ$$ to indicate what the derivative operators inside $$f$$ is acting on. We integrate by parts to move them to acting on $$e^{i k x}$$, pulling out $$(-i \p_x) e^{ikx} = k$$, then un-integrate by parts.

Besides being super interesting, the papers in the intro show several ways that this is _useful_.

----

## 2. Integration Techniques

First, the integral of a function over the real line is equal to its Fourier transform evaluated at $$0$$:

$$\int_{-\infty}^{\infty} g(x) dx = \hat{g}(0)$$

Using our form of $$\hat{g}$$ this is:

$$\hat{g}(0) = 2 \pi g(i \p_k) \delta(k) \vert_{k = 0}$$

This is readily computable:

$$\begin{aligned}
\int_{-\infty}^{\infty} \frac{\sin x}{x} dx &= 2 \pi \frac{e^{-\p_x} - e^{\p_x}}{2 i} \frac{1}{i \p_x} \delta(x) \vert_{x =0} \\
&= \pi [e^{\p_x} - e^{- \p_x}] \theta(x) \vert_{x = 0} \\
&= \pi [ \theta(x + 1) + c - \theta(x-1) - c]_{x  = 0} \\
&= \pi [ \theta(x + 1)  - \theta(x-1) ]_{x = 0} \\
&= \pi
\end{aligned}$$

This is so much easier and more _algebraic_ than doing a limit and taking the principal value or whatever you normally have to do. As a bonus you get to see the Fourier transform as an intermediate step (it's $$\pi [ \theta(x + 1) - \theta(x-1)]$$)


There are also versions for integrating over finite intervals, doing Laplace transforms, and a bunch of other stuff. I'll probably write more about them later.
