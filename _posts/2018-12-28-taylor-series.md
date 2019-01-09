---
layout: article
title: "All About Taylor Series"
footnotes: true
math: true
aside: true
tags: notes
---

Here is a survey of understandings on each of the main types of Taylor series:

1. single-variable
2. multivariable $$\bb{R}^n \ra \bb{R}$$
3. multivariable $$\bb{R}^n \ra \bb{R}^m$$
4. complex $$\bb{C} \ra \bb{C}$$
5. on a curved space (not yet written)

I thought it would be useful to have everything I know about these written down in one place.

These notes are not pedagogical; they're for crystallizing everything when you already have a partial understanding of what's going on. Particularly, I don't want to have to remember the difference between all the different flavors of Taylor series, so I find it helpful to just cast them all into the same form, which is possible because they're all the same thing (seriously why aren't they taught this way?).

In these notes I am going to ignore discussions of convergence so that more ground can be covered. Generally it's important to address convergence in order to, well, not be wrong. And I'm certain that I've made statements which are wrong below. But I am just trying to make sure I understand what happens when everything works, because in my interests (physics) it usually does.

<!--more-->

------

## 1. Single Variable

A Taylor series for a function in $$\bb{R}$$ looks like this:

$$
\begin{aligned} f(x + \e) &= f(x) + f'(x) \e + f''(x) \frac{\e^2}{2} + \ldots \\
&= \sum_n f^{(n)} \frac{\e^n}{n!}
\end{aligned}$$

It's useful to write this as one big operator acting on $$f(x)$$:

$$\boxed{f(x + \e) = \big[ \sum_{n=0}^\infty \frac{\p^n_x \e^n}{n!} \big] f(x)} \tag{Single-Variable}$$

Or even as a single exponentiation of the derivative operator, which is commonly done in physics, but you probably shouldn't think too hard about what it [mmeans](https://en.wikipedia.org/wiki/Exponential_map_(Lie_theory)):

$$f(x + \e) = e^{\e \p_x} f(x)$$

I also think it's useful to interpret the Taylor series equation as resulting from repeated integration:

$$\begin{aligned}
f(x) &= f(0) + \int_0^x dx_1 f'(x_1) \\
&= f(0) + \int_0^x dx_1 [ f'(0) + \int_0^{x_1} dx_2 f''(x_2) ]] \\
&= f(0) + \int f'(0) + \iint f''(0) + \iiint f'''(0) + \ldots \\
&= f(0) + x f'(0) + \frac{x^2}{2} f''(0) + \frac{x^3}{3!} f'''(0) + \ldots
\end{aligned}$$

This basically makes sense as soon as you understand integration, plus it makes obvious that the series only works when all of the integrals are actually equal to the values of the previous function (so you can't take a series of $$\frac{1}{1-x}$$ which passes $$x=1$$, because you can't exactly integrate past it (though there are tricks))

... plus it makes sense in pretty much any space you can integrate over.

... _plus_ it makes it obvious how to truncate the series, how to create the remainder term, and it even shows you how you could -- if you were so inclined -- have each derivative be evaluated at a different point, such as $$f(x) = f(0) + \int_1^x f'(x_1) dx_1 =f(0) + (x-1) f'(1)  + \frac{(x-1)(x-2)}{2} f''(2) + \ldots$$, which I've never even seen done before (except for [here?](https://en.wikipedia.org/wiki/Finite_difference#Newton's_series)), though good luck with figuring out convergence if you do that.

-----

[L'Hôpital's rule](https://en.wikipedia.org/wiki/L%27H%C3%B4pital%27s_rule) about evaluating limits which give indeterminate forms follows naturally if the functions are both expressible as Taylor series. If $$f(x) = g(x) = 0$$, then:

$$\begin{aligned}
\lim_{\e \ra 0} \frac{f(x + \e)}{g(x + \e)} &= \lim_{\e \ra 0} \frac{ f(x) + \e f'(x + \e) + O(\e^2)} {g(x) + \e g'(x + \e) + O(\e^2)} \\
&= \lim_{\e \ra 0}\frac{f'(x+\e) + O(\e) }{g'(x+\e) + O(\e)} \\
&= \lim_{\e \ra 0} \frac{f'(x+\e)}{g'(x + \e)} 
\end{aligned}$$

Which equals $$\frac{f'(x)}{g'(x)}$$ if the limit exists, and otherwise might be solvable by applying the rule recursively. None of this works of course if limit doesn't exist. If $$f(x) = g(x) = \infty$$, evaluate $$\lim \frac{1/g(x)}{1/f(x)}$$ instead. If the indeterminate form is $$\infty - \infty$$, evaluate $$\lim f(x) - g(x)$$ instead.

------

## 2. Multivariable -> Scalar

The multivariable Taylor series looks messier at first, so let's start with only two variables, writing $$f_x \equiv \p_x f(\b{x})$$ and $$\b{v} = (v_x, v_y)$$, and we'll work it into a more usable form.

$$\begin{aligned} 
f(\b x + \b v) &= f(\b x) + [f_x v_x + f_y v_y] + \frac{1}{2!} [f_{xx} v_x^2 + 2 f_{xy} v_x v_y + f_{yy} v_y^2] \\
&+ \frac{1}{3!} [f_{xxx} v_x^3 + 3 f_{xxy} v_x^2 v_y + 3 f_{xyy} v_x v_y^2 + f_{yyy} v_y^3] + \ldots
\end{aligned} $$

(The strangeness of the terms like $$2 f_{xy} v_x v_y$$ and $$3 f_{xxy} v_x^2 v_y$$ is because these are really sums of multiple terms; because of the [commutativity of partial derivatives](https://en.wikipedia.org/wiki/Symmetry_of_second_derivatives) on analytic functions, $$f_{xy} = f_{yx}$$, we can write $$f_{xy} v_x v_y + f_{yx} v_y v_x = 2 f_{xy} v_x v_y$$.)

The first few terms are often arranged like this:

$$f(\b x + \b v) = f(\b x) + \b{v} \cdot \nabla f(\b{x}) + \b{v}^T \begin{pmatrix} f_{xx} & f_{xy} \\ f_{yx} & f_{yy} \end{pmatrix} \b{v} + O(v_3)$$

$$\nabla f(\b{x}) $$ is the gradient of $$f$$ (the vector of partial derivatives like $$(f_x, f_y)$$. The matrix $$H = \begin{pmatrix} f_{xx} & f_{xy} \\ f_{yx} & f_{yy} \end{pmatrix} $$ is the "Hessian matrix" for $$f$$, and represents its second derivative.

... But we can do better. In fact, every order of derivative of $$f$$ in the total series has the same form, as powers of $$\b{v} \cdot \vec{\nabla}$$, which I prefer to write as $$\vec{\p}$$, because it represents a 'vector of partial derivatives' $$\vec{\p} = (\p_x, \p_y)$$:

$$\begin{aligned} 
f(\b x + \b v) &= f(\b x) + (v_x \p_x + v_y \p_y) f(\b x) + \frac{(v_x \p_x + v_y \p_y)^2}{2!} f(\b x) + \ldots  \\
&= \big[ \sum_n \frac{(v_x \p_x + v_y \p_y)^n}{n!} \big] f(\b x) \\
&= \boxed{  \big[ \sum_{n=0}^\infty \frac{(\b{v} \cdot \vec{\p})^n}{n!} \big] f(\b x) } \end{aligned}
\tag{Scalar Field}
$$

(This can also be written as a sum over every individual term using [multi-index notation](https://en.wikipedia.org/wiki/Multi-index_notation).)

So that looks pretty good. And it can still be written as $$e^{ \b{v} \cdot \vec{\p}} f(\b{x})$$. The same formula -- now that we've hidden all the actual indexes -- happily continues to work for dimension $$> 2$$, as well.

... Actually, this is not as surprising a formula as it might look. The multivariate Taylor series of $$f(\b{x})$$ is _really_ just a bunch of single-variable series multiplied together:

$$\begin{aligned}
f(x+ v_x, y + v_y) &= e^{v_x \p_x} f(x, y + v_y) \\
&= e^{v_x \p_x}e^{v_y \p_y} f(x,y) \\
&= e^{v_x \p_x + v_y \p_y} f(x,y) \\
&= e^{\b{v} \cdot \vec{\p}} f(\b{x}) \end{aligned} $$

I mention all this because it's useful to have a solid idea of what a scalar function is before we move to _vector_ functions.

-------

L'Hôpital's rule is more subtle for multivariable functions. In general the limit of a function may be different depending on what direction you approach from, so an expression like $$\lim_{\b{x} \ra 0} \frac{f(\b{x})}{g(\b{x})}$$ is not necessarily defined, even if both $$f$$ and $$g$$ have Taylor expansions. On the other hand, if we choose a path for $$\b{x} \ra 0$$, such as $$\b{x}(t) = (x(t), y(t))$$ then this just becomes a one-dimensional limit, and the regular rule applies again. So, for instance, while $$\lim_{\b x \ra 0} \frac{f(\b{x})}{g(\b x)}$$ may not be defined, $$\lim_{\e \ra 0} \frac{f(\e \b{v})}{g(\e \b{v})}$$ is.

And the path we take to approach $$0$$ doesn't even matter -- only the gradients when we're infinitesimally close to $$0$$. For example, suppose we $$f(0,0) = g(0,0) = 0$$ and we're taking the limit on the path given by $$y = x^2$$:

$$\lim_{\e \ra 0} \frac{f(\e,\e^2)}{g(\e,\e^2)} = \lim_{ \e \ra 0 } \frac{ f_x(0,0) \e +  O(\e^2) }{ g_x(0,0) \e + O(\e^2)} = \lim_{\e \ra 0} \frac{f(\e,0)}{g(\e,0)}$$

The $$f_y$$ and $$g_y$$ terms are of order $$\e^2$$ and so drop out, leaving a limit taken only on the $$x$$-axis -- corresponding to the fact that the tangent to $$(x,x^2)$$ at 0 is $$(1,0)$$.

In fact, this problem basically exists in 1D also, except that limits can only come from two directions: $$x^+$$ and $$x^-$$, so lots of functions get away without a problem (but you can also [abuse this](https://en.wikipedia.org/wiki/Cauchy_principal_value)). L'Hôpital's rule only needs that the functions be expandable as a Taylor series on the side the limit comes from.

I think that the concept of a limit that _doesn't_ specify a direction of approach is more common than it should be, because it's really quite problematic in practice. I'm not quite sure I fully understand the complexity of solving it in $$N > 1$$ dimension -- but clearly if you just reduce to a 1-dimensional limit, you sweep the difficulties under the rug anyway. But see, perhaps, [this](https://arxiv.org/pdf/1209.0363.pdf) pre-print for a lot more information.

-----

## 3. Vector Fields

There are several types of vector-valued functions -- curves like $$\gamma: \bb{R} \ra \bb{R}^n$$, or maps between manifolds like $$\b{f}: \bb{R}^m \ra \bb{R}^n$$ (including from a space to itself). In each case there is something like a Taylor series that can be defined. It's not commonly written out, but I think it _should be_, so let's try.

Let's imagine our function maps spaces $$X \ra Y$$, where $$X$$ has $$m$$ coordinates and $$Y$$ has $$n$$ coordinates, and $$m$$ might be 1 in the case of a curve. Then along any _particular_ coordinate in $$Y$$ out of the $$n$$ -- call it $$y_i$$ -- the Taylor series expression from above holds, because $$f_i = \b{f} \cdot y_i$$ is just a scalar function.

$$f(\b{x} + \b{v})_i = e^{\b{v} \cdot \vec{\p}} [f(\b{x})_i]$$

But of course this holds in every $$i$$ at once, so it holds for the whole function:

$$\b{f}(\b{x} + \b{v}) = e^{\b{v} \cdot \vec{\p}} \b{f}(\b{x})$$

The subtlety here is that the partial derivatives $$\p$$ are now being taken _termwise_ -- once for each component of $$\b{f}$$. For example, consider the first few terms when $$X$$ and $$Y$$ are 2D:

$$\begin{aligned}
\b{f}(\b{x} + \b{v}) &= \b{f}(\b{x}) + (v_{x_1} \p_{x_1} + v_{x_2} \p_{x_2}) \b{f} + \frac{(v_{x_1} \p_{x_1} + v_{x_2} \p_{x_2})^2}{2!} \b{f} + \ldots\\
&= \b{f} + \begin{pmatrix} \p_{x_1} \b{f}_{y_1} & \p_{x_2} \b{f}_{y_1} \\ \p_{x_1} \b{f}_{y_2} & \p_{x_2} \b{f}_{y_2} \end{pmatrix} \begin{pmatrix} v_{x_1} \\ v_{x_2} \end{pmatrix} + \ldots \\ 
&= \b{f} +(\p_{x_1}, \p_{x_2}) \o \begin{pmatrix}\b{f}_{y_1} \\ \b{f}_{y_2} \end{pmatrix} \cdot \begin{pmatrix} v_{x_1} \\ v_{x_2} \end{pmatrix}  + \ldots
\end{aligned}$$

That matrix term, the $$n=1$$ term in the series, is the [Jacobian Matrix](https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant) of $$f$$, sometimes written $$J_f$$, and is much more succinctly written as $$\vec{\p}_{x_i} \b{f}_{y_j}$$, or just $$\vec{\p}_i \b{f}_j$$.

$$J_f = \p_i f_j$$

The Jacobian matrix is the 'first derivative' of a vector field, and it includes every term which can possibly matter to compute how the function changes to first-order. In the same way that a single-variable function is locally linear ($$f(x + \e) \approx f(x) + \e f'(x)$$), a multi-variable function is locally a linear transformation: $$\b{f}(\b{x + v}) \approx \b{f}(\b{x}) + J_f \b{v}$$.

------

Higher-order terms in the vector field Taylor series generalize 'second' and 'third' derivatives, etc, but they are generally _tensors_ rather than matrices. They look like $$(\p \o \p) \b{f}$$, $$(\p \o \p \o \p) \b{f}$$, or $$\p^{\o n} \b{f}$$ in general, and they act on $$n$$ copies of $$\b{v}$$, ie, $$\b{v}^{\o n}$$.

The full expansion (for $$X,Y$$ of any number of coordinates) is written like this:

$$\begin{aligned} \b{f}(\b{x} + \b{v}) &= \b{f} + \p_i \b{f} \cdot v_i + \frac{1}{2!}(\p_i \p_j \b{f}) \cdot v_i v_j + \frac{1}{3!} (\p_i \p_j \p_k \b{f}) \cdot v_i v_j v_k + \ldots \\ 
&= \b{f} + \p_i \b{f} \cdot v_i + \frac{1}{2!}(\p_i \p_j) \b{f} \cdot (v_i v_j) + \ldots \\
&= \b{f} +(\b{v} \cdot \vec{\p}) \b{f} + \frac{(\b{v} \cdot \vec{\p})^2}{2!} \b{f} + \ldots \\
\b{f}(\b{x} + \b{v}) &= \boxed{ \big[ \sum_{n=0}^\infty \frac{(\b{v} \cdot \vec{\p})^n}{n!} \big] \b{f}(\b{x}) }
\tag{Vector Field}
\end{aligned}$$

We write the numerator in the summation as $$(\b{v} \cdot \vec{\p})^{n}$$, which expands to $$(\sum_i v_i \p_i) (\sum_j v_j \p_j) \ldots$$, and then we can still group things into exponentials, only now we have to understand that all of these terms have derivative operators on them that need to be applied to $$\b{f}$$ to be meaningful:

$$\b{f}(\b{x + v}) = e^{\b{v} \cdot \vec{\p}} \b{f}(\b{x})$$

We could have included indexes on $$\b{f}$$ also:

$$\begin{aligned} 
f_k(\b{x} + \b{v}) &= \b{f}_k + \p_i \b{f}_k \cdot \b{v}_i + \frac{1}{2!}(\p_i \p_j) \b{f}_k \cdot (\b{v}_i \b{v}_j) + \ldots \\
&= \big[ \sum_{n} \frac{(\b{v} \cdot \vec{\p})^n}{n!} \big] f_k(\b{x}) \end{aligned}$$

It seems evident that this should work any other sort of differentiable object also. What about matrices?

$$M_{ij}(\b{x} + \b{v})= \big[ \sum_{n} \frac{(\b{v} \cdot \vec{\p})^n}{n!} \big] M_{ij}(\b{x}) $$

I don't want to talk about curl and divergence here, because it brings in a lot more concepts and I don't know the best understanding of it, but it's worth noting that both are formed from components of $$J_f$$, appropriately arranged.

--------

## 4. Complex Analytic

The complex plane $$\bb{C}$$ is a sort of change-of-basis of $$\bb{R}^2$$, via $$(z,\bar{z}) = (x + iy, x - iy)$$:

$$z \lra x\b{x} + y\b{y}$$

$$\bar{z} \lra x\b{x} - y\b{y}$$

Therefore we can write it as a Taylor series in these two variables:

$$f(z + \D z, \bar{z} + \D \bar{z}) = \big[ \sum_{n=0}^\infty \frac{(\D z \p + \D \bar{z} \p_{\bar{z}})^n}{n!} \big] f(z, \bar{z})$$

One subtlety: it should always be true that $$\p_{x_i} \b{x}^j = 1_{i = j}$$ when changing variables. Because $$z$$ and $$\bar{z}$$, when considered as vectors in $$\bb{R}^2$$, are not _unit_ vectors, there is a normalization factor required on the partial derivatives. Also, for $$\bb{C}$$ the factors of $$i$$ cause the signs to swap:

$$\begin{aligned}
\p_z &\underset{\bb{C}}{=} \frac{1}{2}(\p_x - i \p_y) \underset{\bb{R}^2}{=} \frac{1}{2}(\p_{\b{x}} + \p_{\b{y}}) \\
\p_{\bar{z}} &\underset{\bb{C}}{=} \frac{1}{2}(\p_x + i \p_y) \underset{\bb{R}^2}{=} \frac{1}{2}(\p_{\b{x}} - \p_{\b{y}})
\end{aligned}$$

In complex analysis, for some reason, $$\bar{z}$$ is not treated as a true variable, and we only consider a function as 'complex differentiable' when it has derivatives with respect to $$z$$ alone. Notably, $$\p_z \bar{z}$$ does not exist -- the value of $$\lim_{(x,y) \ra (0,0)} \frac{x + iy}{x - i y}$$ is different depending on the path you take towards the origin. Thesee statements turn out to be _almost_ equivalent:

* $$f(z)$$ is a function of only $$z$$ in a region
* $$\p_{\bar{z}} f(z) = 0$$ in a region
* $$f(z)$$ is complex-analytic in a region
* $$f(z)$$ has a Taylor series as a function of $$z$$ in a region

So when we discuss Taylor series of functions $$\bb{C} \ra \bb{C}$$, we usually mean this:

$$\boxed{f(z + \D z) =  \big[ \sum_{n=0}^\infty \frac{(\D z \p_z)^n}{n!} \big] f(z)} \tag{Complex-Analytic}$$

If we write $$f(z(x,y)) = u(x,y) + i v(x,y)$$, the requirement that $$\p_{\bar{z}} f(z) = \frac{1}{2}(\p_x + i \p_y) f(z) = 0$$ becomes the [Cauchy-Riemann Equations](https://en.wikipedia.org/wiki/Cauchy%E2%80%93Riemann_equations) by matching real and complex parts:

$$\begin{aligned}
u_x &= v_y \\
u_y &= - v_x
\end{aligned}$$

-------

There is one important case where a function $$f(z, \bar{z})$$ is a function of only $$z$$, yet it is _not_ analytic and $$\p_{\bar{z}} f(z) \neq 0$$, and it is solely responsible for almost all of the interesting parts of complex analysis. It's the fact that:

$$\p_{\bar{z}} \frac{1}{z} = 2 \pi i \delta(z, \bar{z})$$

I find this to be quite surprising. Here's an aside on why it's true:

<aside class="toggleable" id="complex" placeholder="<b>Aside</b>: Conjugate derivatives <em>(click to expand)</em>">

The explanation I've seen comes in a few forms, and is usually done in $$3D$$ regarding the divergence of $$\frac{1}{r^2}$$. One version for $$\bb{C}$$ goes like this: 

Let $$C$$ be a circle of radius $$R$$ around the origin, and integrate $$\frac{1}{z}$$ in polar coordinates, using the fact that $$dz = d(re^{i \theta}) = dr e^{i \theta} + ire^{i \theta} d\theta$$.

$$\begin{aligned}
\oint_C \frac{1}{z} dz &= \oint_C \frac{e^{i \theta} dr + ir e^{i \theta} d\theta}{r e^{i \theta}} \\
&= \oint_C \frac{dr}{r} + \oint_C i d\theta \\
&= 0 + 2 \pi i
\end{aligned}$$

Now apply Stokes' theorem to the integral (using the notations of [differential forms](https://en.wikipedia.org/wiki/Differential_form)):

$$\begin{aligned}
2 \pi i  &= \iint_D d(\frac{1}{z} dz) \\
&= \iint_D  (\p_{\bar{z}} \frac{1}{z}) d\bar{z} \^ dz \end{aligned}$$


Because we only really know how to deal with delta-functions in $$(x,y)$$ coordinates, change variables, using $$d\bar{z} \^ dz = (dx - i dy) \^ (dx + i dy) = 2i dx \^ dy$$:

$$\begin{aligned}
2 \pi i &=  \iint_D  (\p_{\bar{z}} \frac{1}{z}) d\bar{z} \^ dz \\
2 \pi i&= 2i \iint_D (\p_{\bar{z}} \frac{1}{z}) dx \^ dy \\
\pi &= \iint_D (\p_{\bar{z}} \frac{1}{z}) dx \^ dy
\end{aligned}$$

Because this is true on _any_ circle around the origin, the term in the integral is behaving like a delta distribution:

$$ \p_{\bar{z}}\frac{1}{z} \equiv \pi \delta(x,y)$$

If we want to express this as a delta function on $$\bb{C}$$, we need $$2 \pi i = \iint_D  \p_{\bar{z}} (\frac{1}{z}) d \bar{z} \^ dz$$ to be true, so this should hold when considered as an equality of distributions:

$$ \p_{\bar{z}} \frac{1}{z} \equiv  2 \pi i \delta(z, \bar{z})$$

If nothing else this argument convinces me that delta functions should be dealt with in introductory multivariable calculus, and that complex analysis is pointlessly confusing.

One final comment: what does it _mean_ for $$\p_{\bar{z}} \frac{1}{z} = 2 \pi i \delta(z, \bar{z})$$ to be true? Well, it turns out that this effect exists even in one dimension, except that it's exhibited by $$\ln x$$ instead of $$\frac{1}{x}$$ (and it's by $$\frac{1}{x^2}$$ in 3 dimensions, etc).

Any negative real number has a logarithm like $$\ln (-1) = i \pi$$, due to the fact that $$e^{i \pi} = -1$$. This means that $$\lim_{x \ra 0^-} \ln x = i \pi$$, while $$\lim_{x \ra 0^+} \ln x = 0$$. This means that it should be true that $$\frac{d}{dx} \ln x = \frac{1}{x} + i \pi \delta(x)$$, at least when it appears under an integral. I suppose that the delta-function derivative of $$\frac{1}{z}$$ amounts to the same effect in 2D, but I'm not sure of a good way to intuit the details.

</aside>

Importantly, $$\p_{\bar{z}} z^n \neq 0 $$ is _only_ true for $$n = -1$$. This property gives rise to the entire method of [residues](https://en.wikipedia.org/wiki/Residue_theorem), because if $$f(z) = \frac{f_{-1}(0) }{z} + f^*(z)$$, where $$f^*(z)$$ has no terms of order $$\frac{1}{z}$$, then integrating a contour $$C$$ around a region $$D$$ which contains $$0$$ gives, via Stokes' theorem:

$$\begin{aligned}
\oint_C f(z) dz &= \iint_D \p_{\bar{z}} \big[ \frac{f_{-1}(0) }{z} + f^*(z) \big] \; d\bar{z} \^ dz \\
&= 2 \pi i \iint_D \delta(z, \bar{z}) f_{-1}(0) \; d\bar{z} \^ dz \\
&= 2 \pi i f_{-1}(0)
\end{aligned}$$

(If the $$\bar{z}$$ derivative isn't $$0$$, you get the [Cauchy-Pompeiu formula](https://en.wikipedia.org/wiki/Cauchy%27s_integral_formula#Smooth_functions) for contour integrals immediately.)

By the way: Fourier series are closely related to contour integrals, and thus to complex Taylor series. You can change variables to write $$ \frac{1}{2 \pi i} \oint_C \frac{F(z)}{z^{k+1}} dz$$ as $$\frac{1}{2 \pi} \oint_C F(re^{i \theta})e^{-ik\theta} d\theta$$, which is clearly a Fourier transform for suitable $$F$$.


<aside class="toggleable" id="fourier" placeholder="<b>Aside</b>: Contour Integrals as Fourier Transforms <em>(click to expand)</em>">

Here's a heuristic argument, skipping all the analytical details because I don't know or care about them.

If a function $$f(x)$$ on the real axis has a Fourier series in the finite interval $$(0,2 \pi )$$, then it can be written as a series of oscillators with different frequencies:

$$f(x) = \sum F(k) e^{i k x}$$

The Fourier transform extracts these $$F(k)$$ coefficents:

$$F(k) = \frac{1}{2 \pi} \int_0^{2 \pi} e^{-ikx} f(x) dx$$

Now we change variables: $$z = e^{ix}$$, $$x = \frac{1}{i} \ln z$$ and $$dx = \frac{dz}{ i z}$$. This turns the integral on a line segment $$(0, 2\pi)$$ into a _contour integral_ around the origin (obviously this is why I used the range $$(0, 2\pi)$$ in the first place).

$$f(\frac{1}{i} \ln z) = \sum_k F(k) z^k$$

$$\begin{aligned}
F(k) &= \frac{1}{2 \pi}  \oint_C z^{-k} f(x) \frac{dz}{iz} \\
&= \frac{1}{2 \pi i} \oint_C \frac{1}{ z^{k+1}} \sum_{k'} F(k') z^{k'} dz \\
&= \frac{1}{2 \pi i} \oint_C \sum_{k'}  \frac{F(k')}{ z^{k - k' + 1}} dz \\
&= \sum_{k'}  \delta(k - k') F(k') \\
&= F(k)
\end{aligned}$$

This generally works for functions defined on any finite range; we can modify the variables appropriately to move the contour bounds to a single loop. 

This logic shows that the 'orthogonalization' property of Fourier transforms is basically the same thing as the ability of contour integrals to pull out $$f_{-1}$$ coefficients. Actually, if anything, I think the Fourier transform is more fundamental. A contour integral of a function $$\oint_C \frac{f(z) dz}{z}$$, when written in polar coordinates, is clearly related to a Fourier transform:

$$\begin{aligned}
\oint_C \frac{f(z) dz}{z^{k+1}} &= 
\oint_C \frac{f(re^{i \theta}) e^{i\theta} dr}{re^{(k+1)i \theta}} + 
\oint_C \frac{f(re^{i \theta}) ire^{i\theta} d\theta}{re^{(k+1)i \theta}} \\
&= 
i \oint_C f(re^{i \theta})e^{-ik\theta} d\theta
\end{aligned}$$

The first integral term vanishes because $$r$$ is the same on both ends of the contour. The second integral is, or is massageable into (if the contour takes a funny path), a Fourier transform.

I like this realization. Of the two concepts, I feel like Fourier transforms deal with the more tangible concept -- of breaking a function down into its frequency components. The contour integral turns out to measure which components of $$F$$ are rotating in such a way as to exactly cancel out the rotating path around the pole at $$\frac{1}{z}$$. Though I'm not sure how to reconcile the fact that contour integrals can count paths around multiple poles at the same time -- that seems equivalent to taking Fourier transforms in multiple frequencies in a single integral, and I'm not sure why you would want to do that.

</aside>

---------

## 5 Curved space

I'm not ready to write this section yet.
