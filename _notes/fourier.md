---
layout: article
title: "The Physicist's Fourier Transform Reference"
math: true
footnotes: true
tag: math
---

[Wikipedia's reference](https://en.wikipedia.org/wiki/Fourier_transform#Tables_of_important_Fourier_transforms) is inadequate:

* It's really hard to read because everything is full of $$\Gamma$$ terms
* It's not perfectly happy with everything being a distribution
* It doesn't provide worked integrals to remind you how to do them.
* It doesn't include a lot of >1d integrals, especially involving $$r$$.
* It emphasizes $$\F$$ instead of $$\F^{-1}$$, but we usually need the inverse to solve Green's function problems.
* It includes all the different kinds of Fourier transforms, but we only care about the non-unitary transforms in $$\b{k}$$.
* It emphasizes $$\bb{R}^1$$ when we usually want generalizations to $$\bb{R}^n$$.
* It takes a while to load that giant page.

Fourier Transforms in general are distributions, and I suspect we ought to be perfectly happy with them also being operator-valued as well. In some cases, such as $$\frac{1}{x}$$, they're not even that. $$\frac{1}{x}$$ terms require using $$\P$$, the principal value. Note that assigning a value to $$\P$$ is erroneous: the result is a distribution without a value.

I'll be writing $$\delta (\b{x})$$ for what is sometimes called $$\delta^d (\b{x}) = \delta(x) \delta(y) \delta(z) \ldots$$. I don't see a good reason to include the exponent, and it takes up the same spot in which it can be useful to write a derivative like $$\delta^{(n)}$$. Also note that $$\delta$$ takes different forms in curved coordinates. This is clear from the requirement that $$\int \delta^3 (r, \theta, \phi) \, r^2 \sin \theta \, dr \, d\theta \, d\phi = 1$$ must be true. As such $$\delta^3(r, \theta, \phi) = \delta^3 (x, y, z) / (r^2 \sin \theta)$$, etc.


---------

# 1. Basics

Transform in $$\bb{R}^d$$ space:

$$\hat{f}(\b{k}) = \F(f(\b{x})) = \int f(\b{x}) e^{-i \b{x} \cdot \b{k}} d^d \b{x}$$

Inverse transform:

$$f(\b{x}) = \F^{-1} (\hat{f}(\b{k})) = \frac{1}{(2\pi)^d} \int \hat{f}(\b{k}) e^{i \b{x} \cdot \b{k}} d^d \b{k}$$

Below I'm going to list all of the inverse transforms as well, but generally they are only a sign change + constant change away from the original transforms:

$$\begin{aligned}
\F(\hat{f}(\b{x})) &= \int \hat{f}(\b{x}) e^{- i \b{k} \cdot \b{x}} d^d \b{x} \\
&= (2\pi)^d [ \frac{1}{(2 \pi)^d} \int \hat{f}(\b{x}) e^{i (-\b{k}) \cdot \b{x}} d^d \b{x}] \\
&= (2 \pi)^d [\F^{-1}[\hat{f}](-\b{k})] \\
&= (2 \pi)^d f(-\b{k}) \\
\F^{-1}(f(\b{k})) &= \frac{1}{(2 \pi)^d} \int f(\b{k}) e^{i \b{x} \cdot \b{k}} d^d \b{k} \\
&= \frac{1}{(2 \pi)^d} \F[f](-\b{x}) \\
&= \frac{1}{(2 \pi)^d} \hat{f}(-\b{x})
\end{aligned}$$

    TODO: figure out basic rules for boundedness, existence, convergence of approximations and cite them here.

Delta Function identities:

$$\begin{aligned}
\boxed{ \F (1) } &= 2 \pi \delta(k) \\
\boxed{ \F(1)_{n > 1}} &=(2 \pi)^d \delta(\b{k}) \\
\boxed{ \F^{-1} (1) } &= \delta(x) \\
\boxed{ \F^{-1}(1)_{n > 1}} &= \delta (\b{x}) \\
\end{aligned}$$

----------

# 2. Translations, Convolutions

Exponents become translations:

$$\begin{aligned}
\boxed{\F(e^{i \b{a} \cdot \b{x}})} &= \int e^{i b{a} \cdot \b{x}} e^{-i \b{k} \cdot \b{x}} d^d \b{x} \\
&= \int e^{-i\b{x}(\b{k} - \b{a})} d^d \b{x}\\
&= (2 \pi)^d \delta (\b{k} - \b{a}) \\
\boxed{\F^{-1} e^{-i \b{k} \cdot \b{a}}} &= \delta (\b{x} - \b{a}) \\
\boxed{ \F(e^{i \b{a} \cdot \b{x}} f(\b{x}))} &= \int e^{i \b{a} \cdot \b{x}} f(\b{x}) e^{-i \b{k} \cdot \b{x}} d^d \b{x} \\
&= \int f(\b{x}) e^{-i \b{x}(\b{k} - \b{a})} d^d \b{x} \\
&= \hat{f}(\b{k} - \b{a}) \\
\boxed{ \F^{-1}(e^{i \b{k} \cdot \b{a}} \hat{f}(\b{k}))} &= f(\b{x} - \b{a}) \\
\end{aligned}$$

Translations become exponentials (via substitution $$\b{y} = \b{x} - \b{a}$$):

$$\begin{aligned}
\boxed{\F(f(\b{x} - \b{a}))} &= \int f(\b{x} - \b{a}) e^{-i \b{k} \cdot \b{x}} d^d \b{x} \\
&= e^{- i \b{k} \cdot \b{a}} \int f(\b{y}) e^{-i \b{k} \cdot \b{y}} d^d \b{y} \\
&= e^{- i \b{k} \cdot \b{a}}  \hat{f}(\b{k}) \\
\boxed{\F^{-1}(\hat{f}(\b{k} - \b{a}))} &= \frac{1}{(2\pi)^d} \int \hat{f}(\b{k} - \b{a}) e^{i \b{k} \cdot \b{x}} d^d \b{k} \\
&= e^{i \b{a} \cdot \b{x}} f(\b{x})
\end{aligned}$$

Convolution $$f \ast g$$ becomes multiplication in Fourier space (the trick is changing variables $$\b{y} = \b{x} - \b{x}'$$):

$$\begin{aligned}
\boxed{\F(f \ast g)} &= \F (\int f(\b{x} - \b{x}') g(\b{x}') d^d \b{x}') \\
&=\int [ \int f(\b{x} - \b{x}') g(\b{x}') d^3 \b{x}'] e^{-i \b{k} \cdot \b{x}} d^d \b{x}  \\
&= \int g(\b{x}') [ \int f(\b{y}) e^{-i \b{k} \cdot (\b{y} + \b{x}')} d^d \b{y}] d^d \b{x}' \\
&= \hat{f}(\b{k}) [\int g(\b{x}')e^{-i \b{x}' \cdot \b{k}} d^d \b{x}'] \\
&= \hat{f}(\b{k}) \hat{g}(\b{k})
\end{aligned}$$


----------


# 3. Polynomials

In these $$n$$ is a positive integer; the $$n < 0$$ cases will be dealt with in a later section as they are much more finicky. Most of these will be listed in a $$1$$d form and then a general $$\bb{R}^d$$ form for convenience.

$$
\begin{aligned}
\boxed{\F (\p_x)} &= \int \p_x e^{-ikx} dx \\
&= (-ik) \F(1) \\
 &= (ik) (2\pi \delta(k)) \\
\boxed{\F (\p_x^n)} &= (-ik)^n (2 \pi \delta(k)) \\
\boxed{\F (\p_\b{x}^n)} &= (-i\b{k})^{\o n} ((2 \pi)^d \delta(\b{k})) \\
\boxed{ \F^{-1} (\p_k)} &= (ix) \delta(x) \\
\boxed{ \F^{-1} (\p^n_k)} &= (ix)^n \delta(x) \\
\boxed{ \F^{-1} (\p^n_\b{k})} &= (i\b{x})^{\o n} \delta(\b{x}) \\
\boxed{ \F(x) } &= \int x e^{-ikx} dx  \\
&= \int (i \p_k) e^{-ikx} dx \\
&= (i \p_k) (2\pi \delta(k)) \\
\boxed{ \F(x^{n}) } &= (i \p_k)^n (2 \pi \delta(k)) \\
\boxed{ \F(\b{x}^{\o n})} &= (i \p_\b{k})^{\p n} ((2 \pi)^d \delta (\b{k})) \\
\boxed{ \F^{-1}(k) } &= (-i \p_x) \delta(x) \\
\boxed{ \F^{-1}(k^n) } &= (-i \p_x)^n \delta(x) \\
\boxed{ \F^{-1}(\b{k}^{\o n})} &= (-i \p_\b{x})^{\p n} (\delta (\b{x})) \\

\end{aligned}$$

If you're careful about the ordering of $$x$$ and $$\p_x$$:

$$\boxed{ \F (f(\b{x}, \p_\b{x})) = f(i \p_\b{k}, -i\b{k}) (2 \pi)^d \delta(\b{k}) }$$

Inverse:

$$\boxed{ \F^{-1} (f(\b{k}, \p_\b{k})) = f(-i \p_\b{x}, i \b{x}) \delta (\b{x}) }$$

Note that $$\delta^{(n)}(x)$$ can "pass" its derivatives to another function in an integral, but it picks up a minus sign each time via integration by parts:

$$\int \delta^{(n)}(x) f(x) dx = - \int \delta^{(n-1)}(x) f'(x) dx = \ldots = (-1)^n f^{(n)}(0)$$

As such we could write $$\F^{-1}(k) = (-i \overrightarrow{\p}_x) \delta(x) = (i \overleftarrow{\p}_x) \delta(x)$$ instead, where the "over left arrow" means the derivative applies to everything _else_ under whatever integral it is found in. I don't intend to start doing that unless it's needed for clarity, though.

--------


------

# 4. Distributions: $$x^{-n}$$, step functions, absolute values, $$\sgn$$, $$\P$$.

# 5. Radial Functions and other weird stuff.

# 6. Breadcrumbs

* Spherical Fourier
* Spherical Harmonics
* Fourier Transform on groups
* Discrete Fourier
* Plancherel Theorem + related