---
layout: blog
title: "Fourier Transforms via magic"
footnotes: true
math: true
aside: true
tags: notes
---

A while ago I found a series of papers which do some wild magic with derivative operators:

1. [New Dirac Delta function based methods with applications to perturbative expansions in quantum field theory](https://arxiv.org/abs/1404.0747) by Kempf/Jackson/Morales, 2014
2. [How to (Path-) Integrate by Differentiating](https://arxiv.org/abs/1507.04348) also by Kempf/Jackson/Morales, 2015
3. [Integration by differentiation: new proofs, methods and examples](https://arxiv.org/abs/1610.09702) by Jia/Tang/Kempf, 2016

The general theme is that evaluating functions on derivative operators $$f(\p)$$, and applying this to delta functions $$f(\p_x) \delta(x)$$, is occasionally useful and gives weird alternate characterizations of the Fourier transform and stuff like that.

The authors are physicists, unsurprisingly, and I'm sure there are a bunch of reasons why these results are either not that surprising or surprising-yet-not-useful, but I found them useful. However, when I revisited them trying to understand the ideas more closely, I found myself kinda overwhelmed and confused. So here's a... totally different take, rederiving the main result by poking around.

tldr: the Fourier transform of $$f(x)$$ is $$2 \pi f(i \p_k) \delta(k)$$. Wait, what?

<!--more-->

-----

## 1

Consider the formula

$$f(x + a) = e^{a \p_x} f(x)$$

which can be understood as the [exponential map](https://en.wikipedia.org/wiki/Exponential_map), but in practice we just figure that the Taylor series matches, $$f(x + a) = (\sum \frac{a^n \p_x^n}{n!}) f(x) = e^{a \p_x} f(x)$$, and take that as a proof. This is commonly used in physics, but deserves to be more wildly-known -- I remember it blowing my mind a bit when I first saw it.

Now, the Fourier transform of $$\p^n_x f(x) = f^{(n)}(x)$$ is given by[^convention]

[^convention]: Let's agree to use the convention $$\F[f(x)] = \hat{f}(k) = \int f(x) e^{- ik x} dx$$, with the $$\frac{1}{2 \pi}$$ on the inverse transform.

$$\F[f^{(n)}(x)] = (i k)^n \hat{f}(k)$$

So it seems like we can write this, by matching up the Taylor series term-by-term

$$\F[f(x + a)] = \F[e^{a \p_x} f(x)] = e^{ika} \hat{f}(k)$$

Is that correct? Sure, no problem: if a function is a sum of exponentials $$e^{i k x}$$, then of course $$f(x+a)$$ is a sum of exponentials $$e^{i k a} e^{i k x} $$, and the first factor just passes through the transform untouched because it has no $$x$$-dependence (and also Wikipedia says so). But it also just seems that we simply swapped $$ik$$ for $$\p_x$$. I wonder if we can do just insert $$\p_x \ra i k$$ to Fourier-transform any other functions with no work? 

-------

## 2

Let's try polynomials. We can write an integral as a a sort of inverse derivative: let's say that $$\p_x^{-1} f(x)$$ means to $$\int_0^x f(x') dx'$$. Then we can write a polynomial $$x^n$$ as

$$x^n = n! \p_x^{-n} (1)$$

Mindless substitution $$\p_x \ra ik$$ (with $$\F(1) = 2\pi \delta(k)$$, with $$\delta$$ the [delta function](https://en.wikipedia.org/wiki/Dirac_delta_function)) gives the Fourier transform as

$$\F{x^n} = \F[n! \p_x^{-n} (1)] = 2 \pi \delta(k)  \frac{n!}{(ik)^n} $$

Wikipedia says that the transform should actually be $$2\pi i^n \delta^{(n)}$$. Are those the same? Yeah, turns out they are:

<aside class="toggleable" id="delta" placeholder="<b>Aside</b>: Derivation <em>(click to expand)</em>">

The delta function's 'derivatives' are found by integrating by parts, like this:

$$\int \delta'(x) f(x) dx = - \int \delta(x) f'(x) dx$$

So we might say that $$\delta'(x) = - \delta(x) \p_x$$. But it is also true in a sense that $$x \delta'(x) = - \delta(x)$$, because of another integration by parts:

$$\int \delta'(x) x f(x) dx = - \int \delta(x) (f(x) + x f'(x)) dx = - \int \delta(x) f(x) dx + \cancel{0 f'(0)} $$

So it's plausible to write $$\delta'(x) = - \frac{\delta(x)}{x}$$ in a vague distributional only-valid-under-integrals sense. The higher derivatives produce factorial terms:

$$\begin{aligned}
\int \delta^{(n)} x^n f(x) dx &= - \int \delta^{(n-1)} (n x^{n-1} f(x) + \cancel{x^n f'(x)}) dx \\
&\Ra (-1)^n n! \int \delta(x) f(x) dx + \cancel{\delta(x) x (\ldots)} \\
&= (-1)^n n! f(0)
\end{aligned}$$

(The remaining terms cancel out because they will all have at least one factor of $$x$$ in them, as long as $$f(x)$$ doesn't have any compensating factors of $$\frac{1}{x}$$. Something like that.) 

So we can say $$ \delta^{(n)}(k) = (-1)^n n! \frac{\delta(k)}{k^n}$$, and our formula is correct:

$$\F[x^n] = \F[n! \p_x^{-n} (1)] = 2 \pi (-i)^n n! \frac{\delta(k)}{k^n} = 2 \pi i^n \delta^{(n)}(k)$$

</aside>

So we have[^sign]

[^sign]: I have a different sign here than the Kempf/Jackson/Morales paper and I'm not sure why, since we're using the same Fourier convention.

$$\F[x^n]  = 2 \pi (i\p_k)^n \delta(k)$$

----

## 3

If that's true, then the Fourier series of any function that has a Taylor series is going to be something like

$$\F[f(x)]  = 2 \pi f(i \p_k) \delta(k)$$

Since we like to write $$\delta'(x) = - \delta(x) \p_x$$ we can write that as:

$$\F[x^n]  = 2 \pi  \delta(k) (-i\p_k)^n$$

This kinda suggests that $$\F[f(x)]$$ should just be $$2 \pi \delta(k) f(-i \p_k)$$ for any function that has a Taylor series.

The derivative here acts the right, not on the delta function. If we don't like leaving our Fourier transforms as derivative operators $$f(-i \p_k)$$, we can sometimes rewrite the derivatives in terms of delta functions: $$\delta(k) \p_k g(k) = - \delta'(k) g(k)$$. For instance here is the polynomial formula from before, done another way:

$$\F[x^n] = 2 \pi \delta(k) (-i \p_k)^n= 2 \pi i^n \delta^{(n)}(k)$$

What can we make of $$f(-i \p_k)$$? Well, if $$f$$ has a Taylor series and we operate this on an exponential, it turns into a form of substitution: $$f(-i a\p_k) e^{i a k} = \hat{f}(a) e^{i a k}$$. So $$(-i a \p_k)$$ is an operator whose eigenvalues, I guess, are $$f(a)$$, when acting on each exponential. That makes a certain amount of sense. It feels a lot like quantum mechanicical operators pulling out eigenvalues... but it's purely mathematical! Weird.


----

## 4

What about $$\F[1/x]$$? Apparently it should be:

$$\F[1/x] = 2\pi \delta(k)  \frac{1}{-i \p_k}  = - 2 \pi i \p_k^{-1} \delta(k) = - 2 i \pi (\theta(x) + c)$$

I kept the $$c$$ around because Wikipedia says this should be $$- i \pi \sgn(x)$$, which would mean $$c = - \frac{1}{2}$$. I'm not sure where you get that from, but I think it's possible the constant is arbitrary. This integral is normally evaluted using the [Cauchy Principal Value](https://en.m.wikipedia.org/wiki/Cauchy_principal_value), which is not very well-behaved anyway, so I dunno[^principalvalue].

[^principalvalue]: The principal value, a technique for integrating $$\int \frac{dx}{x}$$, is problematic. It takes the integral by adding $$\lim_{e \ra 0} \int^{-\e} \frac{1}{x} dx$$ and $$\int_\e \frac{1}{x} dx$$, which seems good at first, but the value ends up depending on how $$\e$$ approaches 0, which can change depending on your choice of coordinate system.

------


## 5

A quick example of how this is useful for evaluating integrals. Using $$\int_{-\infty}^{\infty} g(x) dx = \hat{g}(0)$$ we get this odd formula:

$$\begin{aligned}
\int_{-\infty}^{\infty} g(x) dx &= 2\pi  g(i \p_x) \delta(x) \vert_{x = 0} 
\end{aligned}$$

Check this out:

$$\begin{aligned}
\int_{-\infty}^{\infty} \frac{\sin x}{x} dx &= 2 \pi \frac{e^{-\p_x} - e^{\p_x}}{2 i} \frac{1}{i \p_x} \delta(x) \vert_{x =0} \\
&= \pi [e^{\p_x} - e^{- \p_x}] \theta(x) \vert_{x = 0} \\
&= \pi [ \theta(x + 1) + c - \theta(x-1) - c] \\
&= \pi [ \theta(x + 1)  - \theta(x-1) ] \\
&= \pi
\end{aligned}$$

This is so much easier and more... algebraic than doing a limit and taking the principal value or whatever you normally have to do. As a bonus you get to see the Fourier transform as an intermediate step (it's $$\pi [ \theta(x + 1) - \theta(x-1)]$$)

There are also versions for integrating over finite intervals, doing Laplace transforms, and a bunch of other stuff. I'll probably write more about them later.

--------

## 6

In summary it _appears_ to be true, in some numerological and intuitive sense, that when a function $$f(x)$$ has a Taylor series its Fourier transform might be given by[^series]

[^series]: Where should the Taylor series be defined / convergent? No idea. But it seems to work algebraically.

$$\F[f] =  \int f(x) e^{-ikx} dx \equiv 2 \pi \delta(k) f(- i \p_k)  = 2\pi f(i \p_k) \delta(k) $$

And more generally if we write $$f$$ as a function of $$x$$ and $$\p_x$$, then:

$$\F[f(x, \p_x)] \equiv 2 \pi \delta(k) f(i k, -i \p_k) $$

At least since this works for Taylor series it seems like it will work for a nice class of well-behaved functions. From playing with it I've decided that it 'rings true' to me, because it has so far appeared to be consistent with a bunch of the Fourier transforms I've checked, so I suspect that it will be more-or-less consistent with the rest. 

Returning to the papers in the introduction, this is equation (6) in the first Kempf/Jackson/Morales paper above, up to differences in notation. If anything they undersell it: they mostly present this mostly as a novel way of defining the delta function and of computing integrals, rather of an unusual perspective on the Fourier transform itself. Perhaps it is not wise to be philosophical in papers.

So it appears that, if we consider a function $$f(x, \p_x)$$ as being defined on a two-dimensional space spanned by $$\< x, \p_x \>$$, this amounts to a sort of change-of-basis to $$(-i \p_x, i x)$$, perhaps representable as

$$\begin{pmatrix} k \\ \p_k \end{pmatrix} = 2 \pi i \begin{pmatrix} 0 & 1 \\ -1 & 0 \end{pmatrix} \begin{pmatrix} x \\ \p_x \end{pmatrix}$$

But unlike a usual change of basis our coordinate bases don't commute, since $$[ \p_x, x ] = 1$$ (cf [Weyl Algebra](https://en.wikipedia.org/wiki/Weyl_algebra)), and I have no idea what complexity that that leads to. Anyway, that immediately suggests we should try other transformations. There apparently are already generalizations of the Fourier transform which rotate [fractionally](https://en.wikipedia.org/wiki/Fractional_Fourier_transform) between position and frequency space, or generalize this to [arbitrary](https://en.wikipedia.org/wiki/Linear_canonical_transformation) 2x2 matrices. I expect there are versions of all of these using terms like $$f(-i \p_x)$$ as well.

So that's fascinating. It works too well to not be real. But... evaluating functions at derivative operators is meaningful? Who ordered that?
