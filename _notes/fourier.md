---
layout: article
title: "Reference: The Physicist's Fourier Transform (WIP)"
math: true
footnotes: true
tag: math
aside: true
---

[Wikipedia's reference](https://en.wikipedia.org/wiki/Fourier_transform#Tables_of_important_Fourier_transforms) is inadequate:

* It's really hard to read because everything is full of $$\Gamma$$ terms and other special functions.
* It's not perfectly happy with everything being a distribution
* It doesn't provide worked integrals to remind you how to do them.
* It doesn't include a lot of >1d integrals, especially involving $$r$$.
* It emphasizes $$\F$$ instead of $$\F^{-1}$$, but I want to look up inverses a lot more often because they're used in Green's function problems.
* It includes all the different kinds of Fourier transforms, but we only care about the non-unitary transforms in $$\b{k}$$.
* It emphasizes $$\bb{R}^1$$ when we usually want generalizations to $$\bb{R}^n$$.
* It takes a while to load that giant page.

Also, of course, it's rigorous, and I don't want to be. So I thought I would write my own.

In general Fourier transforms act on distributions and return distributions. I tend to just call them both "functions" because I don't care about the difference (there's a good argument to be made that physics should only ever care about distributions and ignore the mathematicians' concept of "functions"). In some cases it seems to make sense for a Fourier transform to be operator-valued as well; for instance, it feels reasonable to write $$\F(f(x)) = \partial_k$$ for some choice of $$f$$. 

I'll try to to include single- and multi-variable versions of everything. Also for each identity I'll try to include at least an illustrative integral to produce it. 

Many of these integrals aren't rigorous, but the fact that the identities _sorta_ work means that, _if_ there's a right answer, it has to be the same as the one we get (at least I think it does?). It's just that many of them have to be interpreted as distributions or operators to be meaningful. In general transforms of functions that don't involve $$\frac{1}{x}$$ are pretty manageable, and functions that involve $$\frac{1}{x}$$ get weird and often get into weird distribution stuff like the principal value $$\P$$. More on that later.

If not indicated, integrals are over the whole real line (or the whole $$\bb{R}^d$$ space if they're multivariable).


---------

# 1. Basics

The basic definition of the Fourier transform in $$\bb{R}^d$$ space:

$$\hat{f}(\b{k}) = \F(f(\b{x})) = \int f(\b{x}) e^{-i \b{x} \cdot \b{k}} d^d \b{x}$$

The inverse transform:

$$f(\b{x}) = \F^{-1} (\hat{f}(\b{k})) = \frac{1}{(2\pi)^d} \int \hat{f}(\b{k}) e^{i \b{x} \cdot \b{k}} d^d \b{k}$$

In this reference I'll list both the $$x \ra k$$ and $$k \ra x$$ versions of each transform for convenience, but generally they are only a sign change + constant change away from the original transforms:

$$\begin{aligned}
\F(\hat{f}(\b{x})) &= \int \hat{f}(\b{x}) e^{- i \b{k} \cdot \b{x}} d^d \b{x} \\
&= (2\pi)^d [ \frac{1}{(2 \pi)^d} \int \hat{f}(\b{x}) e^{i (-\b{k}) \cdot \b{x}} d^d \b{x}] \\
&= (2 \pi)^d [\F^{-1}[\hat{f}](-\b{k})] \\
&= (2 \pi)^d f(-\b{k}) \\
\F^{-1}(f(\b{k})) &= \frac{1}{(2 \pi)^d} \hat{f}(-\b{x})
\end{aligned}$$

The basic interpretation of the Fourier transform is that: functions $$f(x)$$ are better thought of as abstract geometric objects which are being written in the $$x$$ basis; the Fourier transform is a change-of-basis operation that rewrites the function in the $$k$$ basis, whose basis elements are constant-frequency rotations $$e^{ikx}$$ instead of positions.

There are proofs in functional analysis about when the Fourier transform of a function exists and when it's invertible, but I don't know what they are. I would like to learn them later, if only to be able to quantify the discrepancy, maybe as an additional term that can't be transformed. After all, there's no reason to think that the $$k$$ bases can _fully_ express all functional forms, particularly when they do weird things near infinity.

Convolution $$f \ast g$$ becomes multiplication in Fourier space (the trick is changing variables $$\b{y} = \b{x} - \b{x}'$$):

$$\begin{aligned}
\boxed{\F(f \ast g)} &= \F (\int f(\b{x} - \b{x}') g(\b{x}') d^d \b{x}') \\
&=\int [ \int f(\b{x} - \b{x}') g(\b{x}') d^3 \b{x}'] e^{-i \b{k} \cdot \b{x}} d^d \b{x}  \\
&= \int g(\b{x}') [ \int f(\b{y}) e^{-i \b{k} \cdot (\b{y} + \b{x}')} d^d \b{y}] d^d \b{x}' \\
&= \hat{f}(\b{k}) [\int g(\b{x}')e^{-i \b{x}' \cdot \b{k}} d^d \b{x}'] \\
&= \hat{f}(\b{k}) \hat{g}(\b{k})
\end{aligned}$$

And multiplication becomes convolution:

$$\begin{aligned}
\boxed{\F(f(x) g(x))} &= \hat{f} \ast \hat{g} = \int \hat{f}(k') \hat{g}(k - k') dk' \\
\end{aligned}$$


------------

# 2. Derivatives and Polynomials

In these $$n$$ is a positive integer; the $$n < 0$$ cases will be dealt with in a later section as they are much more finicky. Most of these will be listed in a $$1$$d form and then a general $$\bb{R}^d$$ form for convenience.

The most basic Fourier transform rules are that constants become delta functions. 

Constants:

$$\begin{aligned}
\boxed{ \F (1) } &= 2 \pi \delta(k) \\
\boxed{ \F(1)_{d > 1}} &=(2 \pi)^d \delta(\b{k}) \\
\boxed{ \F^{-1} (1) } &= \delta(x) \\
\boxed{ \F^{-1}(1)_{d > 1}} &= \delta (\b{x}) \\
\end{aligned}$$

$$\p_x$$ turns into a scalar $$ik$$. This is most easily seen through integration by parts. To be rigorous this integration by parts has to give a vanishing boundary term which will look like $$f(x) e^{-ikx} \|_{-\infty}^{\infty}$$. In standard Fourier analysis this term has to vanish for these integrals to be valid, which is easiest if $$f(\pm \infty) = 0$$. Maybe it's still workable in some cases if that condition doesn't hold; I don't really know.

Transforms of derivatives:

$$
\begin{aligned}
\boxed{\F (\p_x f(x))} &= \int (\p_x f) e^{-ikx} dx \\
&= \int f(x) (-\p_x e^{-ikx}) dx \\
&= (ik) \hat{f}(k) \\
\boxed{\F (\p_x^n f(x))} &= (ik)^n \hat{f}(k) \\
\boxed{\F (\p_\b{x}^n) f(\b{x})} &= (i\b{k})^{\o n} \hat{f}(\b{k}) \\
\end{aligned}
$$

Inverse transforms of derivatives:

$$\begin{aligned}
\boxed{ \F^{-1} (\p_k \hat{f}(k))} &= (-ix) f(x) \\
\boxed{ \F^{-1} (\p^n_k \hat{f}(k) ) } &= (-ix)^n f(x) \\
\boxed{ \F^{-1} (\p^n_\b{k} \hat{f}(\b{k})) } &= (-i \b{x})^{\o n} f(\b{x}) \\
\end{aligned}$$

------

By a similar argument $$x$$ always turns into a partial derivative operator $$i \p_k$$ acting on a delta function $$2 \pi \delta(k)$$

Transforms of polynomials:

$$\begin{aligned}
\boxed{ \F(x) } &= \int x e^{-ikx} dx  \\
&= \int (i \p_k) e^{-ikx} dx \\
&= (i \p_k) (2\pi \delta(k)) \\
\boxed{ \F(x^{n}) } &= (i \p_k)^n (2 \pi \delta(k)) \\
\boxed{ \F(\b{x}^{\o n})} &= (i \p_\b{k})^{\p n} ((2 \pi)^d \delta (\b{k})) \\
\boxed{ \F^{-1}(k) } &= (-i \p_x) \delta(x) \\
\boxed{ \F^{-1}(k^n) } &= (-i \p_x)^n \delta(x) \\
\boxed{ \F^{-1}(\b{k}^{\o n})} &= (-i \p_\b{x})^{\o n} (\delta (\b{x})) \\
\end{aligned}$$

<aside class="toggleable" id="delta" placeholder="<b>Aside</b>: Miscellanea on Delta Functions"> 

(1) It's possible to interpret these Fourier transforms as being "operator-valued" as well. Since $$\int f(x) \delta'(x) dx = - \int f'(x) \delta(x)$$, the derivative operator can "pass" to the rest of the function body at the cost of a minus sign. So we might write $$\ora{\p_k}$$ for a "bound" derivative (acting on its argument to the right) and $$\ola{\p_k}$$ for an "unbound" derivative (which acts on whatever it is put next to in an integral). Therefore:

$$\F(x^n) = (i \ora{p_k})^n (2 \pi \delta(k))$$

is the same as 

$$(-i \ola{p_k})^n$$

_not_ acting on a delta function. To actually "use" this object you have to combine it with some other object, which will take care of producing the $$2 \pi \delta(k)$$ term.[^suspect]

[^suspect]: I suspect that this is the "best" interpretation of the Fourier transform, that it maps polynomials and derivatives to each other, but what do I know.


(2) There are funny rules for multiplying $$x$$ and $$\delta(x)$$. It turns out that, as distributions, $$x \delta'(x) = \delta(x)$$. In fact if you compare $$\F(\p_x (x^n))$$ and $$\F(n x^{n-1})$$ it is clear that the actual rule is:

$$\begin{aligned}
(ik) (i \p_k)^n \delta &= n (i \p_x)^{n-1} \delta \\
(-k) \delta^{(n)} &= n \delta^{(n-1)}
\end{aligned}$$

So $$-k$$ acts on derivatives of a delta function in exactly the same way that $$\p$$ acts on a polynomial. Something to keep in mind.

(3) In all, the fact that $$x \ra i \p_k$$ and $$\p_x \ra ik$$ means that we can write a lot of Fourier transforms like this:

$$\F [f(x, \p_x)] = \hat{f}(k) = f(i \p_k, ik) (2 \pi \delta(k))$$

Here $$f(x, \p_x)$$ is a term with entirely _bound_ $$\p_x$$ operators which act on other terms in the function, which can be transferred to the $$e^{-ikx}$$ Fourier coefficient via integration by parts. Unbound terms would have translate as $$\p_x \ra -ik$$ instead. (I think? Be careful with this, it's dark magic. Also see [here](https://arxiv.org/abs/1610.09702).)

In fact this works for $$\frac{1}{x}$$ terms and the like too, if you're careful. We'll talk about those later.

</aside>

----------


# 3. Exponentials, Translations, Gaussians

Exponents become translations:

$$\begin{aligned}
\boxed{\F(e^{i \b{a} \cdot \b{x}})} &= \int e^{i b{a} \cdot \b{x}} e^{-i \b{k} \cdot \b{x}} d^d \b{x} \\
&= \int e^{-i\b{x}(\b{k} - \b{a})} d^d \b{x}\\
&= (2 \pi)^d \delta (\b{k} - \b{a}) \\
\boxed{\F^{-1} (e^{-i \b{k} \cdot \b{a}}}) &= \delta (\b{x} - \b{a}) \\
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

Gaussians become Gaussians (for $$\text{Re}(a) > 0$$):

$$\begin{aligned}
\boxed{\F(e^{-ax^2})} 
&= \int e^{-ax^2} e^{-ikx} dx \\
&= e^{-\frac{k}{(2a)^2}} \int e^{-a (x + i \frac{k}{2a})^2} dx \\
&= e^{-\frac{k}{(2a)^2}} \int e^{-ax^2} dx \\
&= \sqrt{\frac{\pi}{a}} e^{-k / (2a)^2}
\end{aligned}$$

Argument for removing the $$i \frac{k}{2a}$$ term in the exponential: consider the contour integral of $$e^{-ax^2}$$ along (a) the real line, (b) a little segment at $$\infty$$ going up to $$ik/2a$$, (c) back along the line at $$\text{Im}(z) = ik/2a$$, (d) back down a little segment at $$-\infty$$. $$e^{-ax^2}$$ has no poles so the integral is zero, and the two snippets at infinity at made infinitesimal by the real part of the integral so don't contribute. Therefore the (negative of the) integral on the imaginary contour has be the same value as the integral along the real line.

Sines and Cosines are just found using $$\cos x = (e^{ix} + e^{-ix})/2$$ and $$\sin x = (e^{ix} - e^{-ix})/(2i)$$.

$$\begin{aligned}
\boxed{\F[\cos (ax)]} = 2 \pi \frac{\delta(k - a) + \delta(k + a)}{2} \\
\boxed{\F[\sin (ax)]} = 2 \pi \frac{\delta(k - a) - \delta(k + a)}{2i} \\

\end{aligned}$$

  todo: 3d Gaussians, QFT Gaussians

------

# 4. Distributions: $$x^{-n}$$, step functions, absolute values, $$\sgn$$

aka "the fun ones"

All of these are related to each other:

1. The step function $$\theta(x) = \begin{cases} 0 & x < 0 \\ 1 & x > 0 \end{cases}$$ is the integral of the delta function with zero integration constant, $$\int_{-\infty}^{x} \delta(x)$$.
2. The $$\sgn$$ function $$\sgn(x) = \begin{cases}  -1 & x < 0  \\ 0 & x = 0 \\ 1 & x > 0 \end{cases}\,\,$$ is a rescaled version of $$\theta$$, given by $$\sgn(x) = 2 \theta(x) - 1$$.
3. The absolute value function $$\| x \| = \begin{cases} -x & x < 0 \\ x & x > 0 \end{cases}\;$$ is the same as $$x \,\sgn(x)$$, and $$\sgn(x) = \frac{\| x \|}{x}$$. Alternatively, $$\|x \|$$ can be implemented as $$\int_0^x \sgn(x) dx$$, so $$\sgn(x) = \p_x \| x \|$$.
4. An integral with non-infinite bounds can be implemented as a step function: 

$$\int_a^b f(x) \, dx = \int_{-\infty}^\infty (\theta(b) - \theta(a)) f(x) \, dx$$

As such, if we can do the Fourier transform of an integral, we can do the Fourier transform of all of these.

Now we saw earlier that a derivative $$\p_x$$ becomes a polynomial $$ik$$ in Fourier space. It stands to reason... sorta... that an integral, that is, $$\p_x^{-1}$$, should become division $$\frac{1}{ik}$$ in Fourier space, and vice-versa, division $$\frac{1}{x}$$ will become $$\p_k^{-1}$$, that is, integration in Fourier space.

And indeed they do, but it's a bit tricky.

----------

### Step Functions and $$\sgn$$

The Fourier transform of the step function is a reciprocal:

$$\begin{aligned}
\F(\p_x \theta(x)) &= \F(\delta(x)) \\
(ik) \F (\theta(x)) &= 1 \\
\F(\theta(x)) &= \P (\frac{1}{ik}) + \lambda \delta(k)
\end{aligned}$$

I don't have a great argument for the presence of $$\P$$. It is just "what you do" when dividing-by-$$k$$ in distribution land.

The value of $$\lambda$$ must be determined: it's the value of $$\F(\theta(x))(k)$$ at $$k=0$$. The actual value is $$\pi$$.

One argument for this is that $$\hat{\theta}(0)$$ ought to be the "DC component", or average value, of $$\theta(x)$$, which is $$\frac{1}{2}$$, which then has $$\F(\frac{1}{2}) = \pi \delta(k)$$. But why is the value of $$\hat{f}(k=0)$$ equal to $$\bar{f} = \lim_{L \ra \infty} \frac{1}{2L} \int_{-L}^L f(x) dx$$, the average value of the $$f(x)$$? That sounds wrong at first glance, because $$\hat{f}(0) = \int f(x) dx$$, which is just a sum over the whole real line, not an average. But the idea is that it is an infinite value _localized at $$k=0$$_, and the precise nature of the localization is to add a delta function term $$2\pi \delta(k)$$ to it. Put differently, $$\hat{f}(0) -  (2 \pi \delta(k)) \bar{f} = \F(f(x) - \bar{f})$$ would equal $$0$$ at $$k=0$$, therefore it's the right value.

I don't like derivations that involve "one weird trick" arguments like that. A better argument is that $$\theta(x) = \lim_{a \ra 0} e^{-ax}$$, and $$\lim_{a \ra 0} \F(e^{-ax}) = \P (\frac{1}{ik}) + \pi \delta(k)$$. You can see the derivation [here](https://math.stackexchange.com/questions/73922/fourier-transform-of-unit-step). Also take a look at [_The Fourier transform of the Heaviside function: a tragedy_](https://www.cs.uaf.edu/~bueler/M611heaviside.pdf).

(I also don't like roundabout derivations that are limits of other actually-manageable derivations. It seems like there should be a way to _directly_ produce the $$\pi \delta(k)$$ term by fixing our method of doing algebra.)

Alternatively, we could just declare that $$\theta(0) = \frac{1}{2}$$ and there you go. This feels like cheating, though, given that there's really no reason it should equal that; distributions don't really have to have values at points.

$$\begin{aligned}
\boxed{\F(\theta(x))} &= \P (\frac{1}{ik}) + \pi \delta(k) \\
\boxed{\F^{-1}(\theta(k))} &= - \frac{1}{2 \pi} \P (\frac{1}{ix}) + \frac{1}{2} \delta(x) \\
\end{aligned}$$

The Fourier transform of the $$\sgn$$ function is basically the same, but it's cleaner because the average value of $$\sgn$$ is $$0$$:

$$\begin{aligned}
\boxed{\F(\sgn(x))} &= \F(2 \theta(x) - 1)  \\
&= 2 (\P (\frac{1}{ik}) + \pi \delta(k)) - 2 \pi \delta(k) \\
&= \frac{2}{ik} \\
\boxed{\F^{-1}(\sgn(k))} &= \frac{i}{\pi} \P(\frac{1}{x}) \\
\end{aligned}$$

Analysts would be annoyed by these computations. They prefer to _define_ properties of distributions in terms of their behavior when integrated against well-behaved "test functions" (which are infinitely differentiable and have compact support, i.e. are zero outside a finite interval). The integration is written as $$\<T, \phi \> = \int T \phi dx$$. So the Fourier transform of a distribution $$T$$ is defined as:

$$\< \hat{T}, \phi \> = \< T, \hat{\phi} \>$$

Since $$\sgn$$ is a distribution we can treat it this way. You can see the gorey details of the distribution done this way [here](https://math.stackexchange.com/questions/3726611/fourier-transform-of-signum-function). Among other things it is a good justification for why it has to be a $$\P$$.

------

### Inverses, $$x^{-n}$$

Evidently we can do $$\frac{1}{x}$$ now without working out an integral:

$$\begin{aligned}
\boxed{\F(\frac{1}{x})} &= -\pi i \, \sgn(k) \\
&= - 2 \pi i [  \theta(k) - \frac{1}{2} ] \\
\boxed{\F^{-1}(\frac{1}{k})} &= \frac{i}{2} \sgn(x) \\
&= i (\theta(x) - \frac{1}{2})
\end{aligned}$$

But if we did want to work out an integral, there are a few ways to do it. One way is as a limit of [some other computable integral](https://math.stackexchange.com/questions/1033870/does-the-fourier-transform-exist-for-ft-1-t). Another is as a contour integral, but we have to use a bunch of the techniques from QFT's "bag of tricks" and there's no way anyone will remember it unless they really want to:

1. Rewrite the integral as a limit $$\lim_{\e \ra 0} \int \frac{1}{x + i \e} e^{-ikx} dx$$, thus moving the pole into the upper or lower half-planes.
2. Apply the [Sokhotski–Plemelj theorem](https://en.wikipedia.org/wiki/Sokhotski%E2%80%93Plemelj_theorem) to get $$\lim_{\e \ra 0^{\pm}} \frac{1}{x + i \e} = \mp i \pi \delta(x) + \P (\frac{1}{x}) $$.
3. Observe that if $$k < 0$$ then the integral goes to zero in the upper half plane at $$\infty$$, whereas if $$k > 0$$ then it goes to zero in the lower half plane. Hence we have to choose $$\e > 0$$ if $$k > 0$$ in order to keep the pole inside the contour, and $$\e < 0$$ if $$k < 0$$, so $$\sgn(\e) = \sgn(k)$$.
4. Finally evaluate $$\lim_{\e \ra 0} \int \frac{e^{-ikx}}{1 + i \e} dx = \int - i \pi \sgn(k) \delta(k) e^{-ik(x)} dx + \P \int \frac{e^{-ikx}}{x} dx$$. The $$\P$$ term drops out because there are no other poles and the integral is symmetric around $$0$$, giving $$-i \pi \sgn(k)$$.

That is all very silly, though. If you're gonna do the contour integral version, the good way is like this:

1. The integrand goes _right through the middle of that pole_. It cuts the pole in half. Therefore the winding number (I'm [not kidding](https://www.hindawi.com/journals/jmath/2019/6130464/)) is $$\frac{1}{2}$$ times the orientation of the contour which is $$-\sgn(k)$$ by the same argument as before.
2. The residue is $$1$$.
3. Giving $$\F(\frac{1}{x}) = - \frac{1}{2}\sgn(k) (2 \pi i) = -i \pi \sgn(k) $$.[^frac]

[^frac]: Yes, fractional winding numbers are a thing. I have no idea how to compute them unless the fraction is $$\frac{1}{2}$$, but go read that paper, it's fun.

Guess what, I have one more stupid way to do it. The "real simple" way, which is analytically dubious, is like this:

$$\begin{aligned}
\F(\frac{1}{x}) &= \int \frac{1}{x} e^{-ikx} dx \\
&=\int dx [-i \int  e^{-ikx} dk ] \\
&= -i \int dk \int  e^{-ikx} dx \\
&= -2 \pi i \int  \delta(k) \, dk \\
&= - 2 \pi i (\theta(k) - \frac{1}{2}) \\
&= - \pi i \, \sgn(k)
\end{aligned}$$

Exchanging the $$dx$$ and $$dk$$ integrals is probably justifiable, I don't know, who am I kidding.

(Here we've used the fact that the DC component is the average value of the integral, $$0$$, when selecting the integration constant for $$\int \delta(k) dk = \theta(k) + C$$. I do wish I had a better argument for that, though. For the time being we'll just assume that, when doing Fourier transforms, it's always correct for $$\int \delta(x) dx$$ to equal $$\theta(x) - \frac{1}{2}$$, because we don't want to introduce any DC components by accident. I guess?)

    todo $$x^{-n}$$

--------

### Absolute Values, $$\| x \|^n$$

Let's finish out our step-function-y things.

The transform of absolute value:

$$\begin{aligned}
\boxed{\F(\| x \|)} 
&= \F(x \, \sgn(x)) \\
&= (i \p_k) \frac{2}{ik} \\
&= - \frac{2}{k^2} \\
\boxed{\F^{-1} (\| k \|)} &= - \frac{1}{\pi x^2} \\
\end{aligned}$$





    todo: integrals
    todo: abs and powers
    todo: x^{-n}
    todo: x^{-1/2}
    todo: P.V.

-----------



# 5. Multivariable

In this section, we'll be working in $$d$$ dimensions. This means that scalar $$x$$ and $$k$$ denote $$\| \b{x} \|$$ and $$\| \b{k} \|$$. I'll still use $$r$$ when possible for clarity, and it will always refer to the radius in the $$\b{x}$$ coordinates.

The usual approach to Fourier-transform functions of $$x$$ is to change the integral into spherical coordinates, but a particular choice of spherical coordinates: one that aligns $$\b{k}$$ with the azimuthal angle in $$\b{x}$$. This causes the three-term dot product $$\b{x} \cdot \b{k}$$ to reduce to a single term: $$r k \cos \theta$$. Note that standard spherical coordinates put $$\theta = 0$$ on the north pole and $$\theta = \frac{\pi}{2}$$ on the azimuth; this choice instead puts $$\theta = 0 $$ on the azimuth, for the simple reason that it makes integrating in $$\theta$$ trivial.

$$\begin{aligned}
\F(\frac{1}{r^2}) &= 
\int \frac{1}{r^2} e^{-i \b{k} \cdot \b{x}} d^d \b{x} \\
&= \int_0^{\infty} \int_0^{2 \pi} \int_0^\pi \frac{1}{r^2} e^{-i r k \cos \theta} (k^2 \sin \theta) \, d \theta \, d \phi \, dk \\
&= 2 \pi \int_0^\infty \int_{-1}^1 e^{-i r k \cos \theta} d (\cos \theta) \, dk \\
&= 2 \pi \int_0^{\infty} \frac{1}{-i r k} [ e^{-i r k \cos \theta}]_{\cos \theta = -1}^{\cos \theta = 1} dk \\
&= 2 \pi \int_0^{\infty} \frac{2i}{-i r k} [ - \frac{e^{irk} - e^{-irk}}{2 i} ]dk \\
&= \frac{4 \pi}{r} \int_0^{\infty} \sin (rk) dk \\
\end{aligned}$$

sheesh

# 6. Breadcrumbs

* Spherical Fourier
* Spherical Harmonics
* Fourier Transform on groups
* Discrete Fourier
* Plancherel Theorem + related