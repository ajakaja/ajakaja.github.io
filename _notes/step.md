---
layout: article
title: "The Step-Function Calculus, So Far"
math: true
aside: true
footnotes: true
---

I am not enough of an expert at analysis to develop the $true theory of step functions, but I can tell what intuitively _should_ be true.

As far as I can tell, the unifying idea here is: we develop a form of calculus where all the $$\lim$$ operations are hidden and _implicit_, with the understanding that the exact _implementation_ of functions like $$\delta$$ should not change the outcome of equations.

(Of course some will protest that none of these things are 'functions'. To me that's a strange point; I think this all just shows that the existing scope of the word 'function' is inadequate. But when we need to distinguish between the two types, we'll call these non-functions 'generalized functions'.)

<!--more-->

## 1. Step Functions

The [step function](https://en.wikipedia.org/wiki/Heaviside_step_function) $$\mu = \mu(x) = \1_{x > 0}$$ is our starting point, where $$\1_{b}$$ is the indicator function for a boolean expression $$b$$.

We don't want to use the convention that $$\mu(0) = \frac{1}{2}$$. It quickly becomes apparent that we will need to be careful about the concept of these functions having values 'at' points, and that 'when approached from the left or right' is often the more useful concept (in $$\bb{R}^{1}$$). Anyway, when under an integral the value at exactly 0 does not normally contribute.


(I also prefer not to use the symbol $$H$$ here, because it is a routine enough operation that it seems like overkill to constantly attribute it to Heaviside.)

There are several ways to implement the step function as a limit on the Wikipedia article, like:

$$\mu(x) = \lim_{k \ra \infty} \frac{1}{1 + e^{-2kx}}$$

This works because if $$k \ra \infty$$, then the sign of $$x$$ determines whether $$e^{-2 k x}$$ goes to $$\infty$$ or $$0$$. This representation does not seem to care what the value at 0 is (you can modify it by changing how the relative speeds of the $$k$$ and $$x$$ limits!). I'm not sure how to define a version that is $$0$$ or $$1$$ at 0 as a limit.

$$\mu(x - c)$$ gives the same function, but with the $$0\ra1$$ transition happening at $$x = c$$. We can also define things like $$\mu(2x)$$ or $$\mu(f(x))$$ for any $$f(x)$$, and they should behave as expected (if $$f(x)$$ has multiply roots, $$\mu(f(x))$$ goes up or down by 1 each time it crosses the x-axis, except that the arguments may 'emerge' when we start taking derivatives of it later...)

Starting from the step function we can define these variants:

$$\begin{aligned}
1 - \mu &= \1_{x \leq 0}\\
\mu(-x) = \mu_{-} &= \1_{x < 0}\\
1 - \mu_{-} &= \1_{x \geq 0}
\end{aligned}
$$

I will often write $$\mu_{+} = \mu(+x)$$ for symmetry with $$\mu_{-}$$.

And the 'zero function' $$\bf{0} = \1_{x = 0}$$:

$$\begin{aligned}
\bf{0} &= \1_{x \geq 0} - \1_{x > 0} \\
&= 1 + \mu_{+} - \mu_{-} \end{aligned}$$

## 2. Delta Functions

The [delta function](https://en.wikipedia.org/wiki/Dirac_delta_function) $$\delta(x)$$ (omitting the name 'Dirac' because this should be commonplace) is thought of as the derivative of the step function:

$$\delta = \mu'$$

Note the intuition that comes with this: the integral, performed over $$(-\infty, c)$$, is 0 until the origin is passed, when it suddenly becomes 1 -- a finite, instead of infinitesimal, displacement, contributed by a single point instead of the usual method (wherein the value contributed by a displacement $$(x, x + \D x)$$ is proportional to the width of $$\D x$$ times the function's average value on that area.)

(I happen to think the symbol $$\delta$$ and the name 'delta' are both bad choices, because they overload with derivatives / variations / displacements in calculus, but won't try to change them now. $$\omega$$, 'omega', would probably be a good choice, because of the association with infinity.)

The delta function gives an infinitely-tall and infinitely-thin spike at the origin (or, using $$\delta(x-y)$$, at any point $$y$$), with the height- and width- set so that the integral is exactly 1:

$$\int \delta(x) dx = 1$$

Which has the effect of 'pulling out' the value of an arbitrary (regular, not generalized) function at the origin (as long as the integral range includes the origin):

$$\int f(x) \delta(x) dx = f(0)$$

Or at any point, if the integral range includes it:

$$\int f(x) \delta(x-y) dx = f(y)$$

And in fact sometimes I think it's appropriate to _define_ function evaluation in this way: $$f(y) := \int f(x) \delta(x-y) dx$$. Sometimes. More on this later.

I will often omit the argument to $$\delta(x) = \delta$$, and use a subscript to indicate which point is pulls out:

$$\delta_{y} := \delta(x - y)$$

The delta function is most easily defined using a pair of step functions (though this just defers to the analytic problems there, so a better solution usually involves an infinitely thin Gaussian):

$$\delta = \lim_{\e \ra 0} \frac{1}{2\e} (1 + \mu_{+} - \mu_{-})$$

But at that point we may as well just write:

$$\delta = \lim_{\e \ra 0} \frac{1}{2\e} \bf{0}$$

* **TODO**: composition with function; $$\delta(ax)$$, ..., higher dimensions

## 3. Derivatives and Infinities

Since we already defined $$\mu' = \delta$$, we can now seemingly take another derivative:

$$\delta' = \lim_{\e \ra 0} \frac{1}{2\e} (\delta_{+} - \delta_{-})$$

What does this mean?

First, let's look at the simpler expression for $$\bf{0}'$$:

$$\bf{0}' = D_{x} (\mu_{+} - \mu_{-}) = (\delta_{+} - \delta_{-})$$


The $$\delta_{\pm}$$ is necessary in some sense because it's important that the $$\delta_{+}$$ come _first_, because, after all, the value of $$\bb(0)$$ is $$+1$$ -- it has to go up before it can come down.

But more generally, the same way that there are limits on each side of a point on the real line, there can always be two different derivatives on each side, corresponding to each limit:

$$D_{+} f = \lim_{\D x \ra 0^{+}} \frac{f(x + \D x) - f(x)}{\D x}$$

$$D_{-} f = \lim_{\D x \ra 0^{-}} \frac{ f(x + \D x) - f(x) }{\D x}$$

And when we're allowing point discontinuities in our 'functions', these can clearly be different. This distinction is especially obvious when defining [discrete derivatives](https://en.wikipedia.org/wiki/Finite_difference), where the 'forward' and 'backward' differences are always distinguished.

We may think, therefore, of the total derivative $$D$$ mapping to a tuple $$(D_{-}, D_{+})$$, and using a single-valued result as a notational convenience: $$Df = (D_-, D_+) f = (f'_-, f'_+) \stackrel{?}{=} f'$$. (Presumably in higher dimensions we may need as much as a whole _surface_ of derivatives. More on this later!)

In this view we actually have:

$$\bb{0}' = (\delta, -\delta)$$

$$\delta' = \lim_{\e \ra 0} \frac{1}{2 \e} (\delta, -\delta)$$

Alternatively we may view these as another limit, where we take the two functions and press them close together:

$$(\delta, -\delta) = \lim_{\e \ra 0} ( \delta_{-\e} + -\delta_{\e}) $$

This is probably the more precise 'limit' implementation of the above.

When used in this way, the delta function should extract the one-sided values of $$f$$, which are added together by the integral,

$$\int (\delta, \delta) f dx = f(+0) + f(-0)$$


------

Now, what can we do about that $$\lim_{\e \ra 0} \frac{1}{2 \e}$$? We did much of this to not have to write every equation under a limit, but we still need one here!

If we are going to write symbols in the place of limits, though, we may as well just write $$\frac{1}{\e} = \frac{1}{+0} = \infty$$ (so, also, $$\frac{1}{-\e} = \frac{1}{-0} = -\infty$$). (Sometimes we'll omit the $$+$$ and $$-$$ when it's obvious.) These versions of $$0$$ and $$\infty$$ do _not_ annihilate constant factors, and can be even written in polynomials!

Watch, here's l'Hopital's rule with 0:

$$\lim_{x \ra 0} \frac{\sin{2x}}{x} = \frac{\sin(2 \cdot 0)}{0} = \frac{2 \cdot 0 + O(0^{3})}{0} \approx \frac{2 \cdot 0}{0} = 2$$

They do, however, cancel each other out: 

$$0 \cdot \infty = 1$$.

With this notation we now have:

$$\delta = \frac{1}{2 \cdot 0} (1 + \mu_+ - \mu_-)$$

$$\delta' = \frac{1}{2 \cdot 0} (\delta, -\delta)$$

----

$$\delta'$$, when acting on a function under an integral, extracts the negative derivative:

$$\int f(x) \delta'(x) dx = -f'(0)$$

This can be shown with (analytically questionable) integration by parts:

$$\int_{\sigma} f(x) \delta'(x) dx = f \delta \vert_{\p \sigma} - \int_{\sigma} f'(x) \delta(x) dx = 0 - f'(0)$$

Or directly from our just-computed definition:

$$\int f(x) \delta' dx = \int f \frac{1}{2 \cdot 0} (\delta, -\delta) dx$$

$$ = \frac{1}{2 \cdot 0}(f(-0) - f(+0))$$

For $$-0$$ very close to 'actual' 0, $$f(-0) \approx f(0) - f'(0) \cdot 0 + O(0^{2})$$, and similar for $$f(+0)$$, so this gives:

$$ = \frac{-2 f'(0) \cdot 0}{2 \cdot 0} = - f'(0)$$

Which is not a kind of arithmetic I've ever seen before, but it... seems to... work.

Intuitively, what this corresponds to: the first delta function spikes the value of the integral (adding a constant, as in $$\int (f \delta) dx = f(0)$$), but the second one immediately _un_-spikes it, leaving no total contribution from the $$f(0) - f(0)$$. In the meantime, the value has changed slightly, $$\propto 2f'(0)$$, and then the $$\frac{1}{2 \cdot 0} = 2 \cdot \infty$$ blows this up to a macroscopic value.

## 4. 