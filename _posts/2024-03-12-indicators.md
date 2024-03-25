---
layout: blog
title: "Delta Functions via Inverse Differentials"
tags: math
math: true
footnotes: true
aside: true
---

Here's a dubious idea I had while playing with using delta functions to perform surface integrals. Also includes a bunch of cool tricks with delta functions, plus some exterior algebra tricks that I'm about 70% sure about. Please do not expect anything approaching rigor.

<!--more-->

-------

But first, some notations.

### Notations

I like to omit the arguments for functions and distributions when it's clear from context, so $$f$$ means $$f(x)$$ unless otherwise stated. When the argument is of the form $$(x-a)$$ we can also omit the arguments if we move the $$a$$ into a subscript, writing $$\delta_a = \delta(x-a)$$. This is particularly nice for distributions because it's fruitful to think of $$\delta(x-a)$$ as "the delta for the point $$(a)$$", which holds in any coodinate system, not just for a particular displacement $$x-a$$. In practice sometimes this will be written $$\delta_{(a)}$$ instead to make it clear that $$a$$ refers to a point.

$$
\begin{aligned}
\delta(x-a) &\equiv \delta_a \equiv \delta_{(a)} \\
\theta(x-a) &\equiv \theta_a \equiv \theta_{(a)} \\
\end{aligned}
$$

An indicator function $$1_{P}$$ is equal to $$1$$ anywhere that the predicate $$P$$ is true. For instance $$1_{x = a}$$ is $$1$$ if $$x=a$$ and $$0$$ otherwise. We'll write this with a subscript as well, but allow the subscript to be any sort of surface: a point $$a$$, an interval $$(a,b)$$, or an generic surface $$A$$.

$$
\begin{aligned}
1_{(a,b)} &\equiv 1_{x \in (a,b)} \\
1_a &\equiv 1_{(a)} \equiv 1_{x = a} \\
1_A &\equiv 1_{x \in A}
\end{aligned}
$$

The generic surface is written with a capital letter to distinguish it from a point. Intervals $$(a,b)$$ are assumed to have $$a < b$$ unless otherwise stated.

In each case we also allow the subscript to include a linear combination of surfaces. When we write linear combinations of points, we write the points with parens, as $$(a) + (b)$$, so it doesn't look like we're adding the points as vectors $$a + b$$. We also allow using linear combinations of points or surfaces in the subscripts of interval. In every case these operations simply distribute over the sums.

$$
\begin{aligned}
1_{(a) + (b)} &\equiv 1_a + 1_b \\
1_{(b) - (a)} &\equiv 1_b - 1_a \\
\delta_{(b) - (a)} &\equiv \delta_b - \delta_a \\
\theta_{(b) - (a)} &\equiv \theta_b - \theta_a \\
\end{aligned}
$$

It is also helpful in some cases to use this notation for integrals:

$$\int_{A - B} df \equiv \int_A \d f - \int_B \d f$$



----------

# 1. Intro

In $$\bb{R}^1$$, an integral over a range $$(a,b)$$ can be written as integration over all of $$\bb{R}$$ against an indicator function $$1_{(a,b)}$$ for that range:

$$\int_a^b f' \d x  = \int_{\bb{R}} 1_{(a,b)} f' \d x = f(b) - f(a)$$

We can write that indicator function as a sum of two step functions:

$$1_{(a,b)} = \theta_a - \theta_b$$

Naturally integrating against both does the same thing:

$$
\begin{aligned}
\int_{\bb{R}} 1_{(a,b)} f' \d x  &= \int (\theta_b - \theta_a) f' \d x \\
&= \int_a^b f' \d x \\
&= f(b) - f(a)
\end{aligned}
$$

We can also use integration by parts to move the derivative onto the indicator function.[^boundary] The $$f' = \p_x f$$ passes its derivative over to $$(-\p_x) 1_{(a,b)}$$ while the boundary terms vanish because $$1_{(a,b)}$$ is $$0$$ at $$\pm \infty$$. The result is a pair of delta functions defined on the boundary of the underlying oriented surface $$\p(a,b) = (b) - (a)$$:

[^boundary]: A good intuition for why distributions require $$-\p$$ instead of $$+\p$$: for a function like $$\delta_a$$ or $$\theta_a$$, the point $$a$$ enters with a negative sign. So if you wanted to take a derivative "with regard to the point $$a$$, you would have to write $$\p_a \delta_a$$. It just happens that $$\p_a \delta_a = (-\p_x) \delta_a$$, so the negative derivative serves the same purpose, in the particular representation of a point that is signified by $$\delta_a$$.

$$
\begin{aligned}
\int_{\bb{R}} 1_{(a,b)} [\p_x f] \d x &= \cancel{1_{(a,b)} f \|_a^b} - \int_{\bb{R}} [\p_x  1_{(a,b)}] f \d x \\
&=\int_{\bb{R}} [(-\p_x) (\theta_a - \theta_b)] f \d x \\
&= \int_{\bb{R}} (\delta_b - \delta_a) f \d x \\
&= f(b) - f(a) \\
\end{aligned}
$$

This is all just pretty neat. Intuitive if you think about it, but not something I thought about at first when I learned about $$\delta$$. It turns out that all of the properties of integrals we learned can be ported "into the integral" by writing them as distributions. We'll be doing a lot more of that in a minute.

The resulting object $$\delta_{(b) - (a)}$$ looks like a description of the boundary $$(b) - (a)$$, which makes $$(-\p_x )$$ look like an expression of the boundary operator, implemented on the distribution representation of $$(a,b)$$ which is given by $$1_{(a,b)}$$. But that's not quite right: the appropriate "description of the boundary" should probably be an indicator, $$1_{(b) - (a)}$$, which is not $$\delta_{(b) - (a)}$$, simply because indicators have value $$1$$ at their nonzero points, while $$\delta_{(b) - (a)}$$ has value $$\infty$$-ish (delta functions do not really "have" a nonzero value but you know what I mean).Meanwhile, $$\delta_{(b) - (a)}$$ is something you can actually integrate against, while $$1_{(b) - (a)}$$ has measure zero, so integrating against would give zero:

$$\int 1_{(b) - (a)} f \d x \stackrel{!}{=} 0$$


-----------

# 2. Inverse Differentials

So what _is_ the relationship between these two objects?

$$1_{\p(a,b)} = 1_{(b) - (a)} \stackrel{?}{\approx} (-\p) 1_{(a,b)} = \delta_b - \delta_a$$

Or just these two?

$$1_{(a)} \stackrel{?}{\approx} \delta_a$$

I think the most intuitive answer is that the delta function may be regarded as an indicator function divided by the absolute value of a differential:

$$\boxed{\delta_a \? \frac{1_a}{\| d x \|}}$$

The $$1_{(a)}$$ is a normal indicator function. The object $$\| dx \|$$ is basically "the magnitude of $$dx$$". Unlike $$dx$$, it is always positive when evaluated on a tangent vector. And it is in a denominator for some reason, which we will have to get used to. 

(Maybe this is a bad idea for a reason I haven't thought of! Or maybe it is already a thing somewhere and I just haven't come across it.[^source] But, well, the reason I've written this article about it is that after playing with it for a while it keeps making more and more sense to me.)

[^source]: Actually I first heard this idea in a book called "Burn Math Class" by Jason Wilkes, although his version omits the absolute value which I am pretty sure needs to be there. Then I forgot about it for a while before rediscovering it and thinking I had come up with it. Ah well.

This is how it works in an integral:

$$
\begin{aligned}
\int_I \delta_a f(x) \d x &= \int_I \frac{1_a}{\| d x \|} f(x) \d x  \\
&= \int_I 1_a f(x) \frac{d x}{\| d x \|} \\
&= \int_I 1_a f(x) \widehat{dx} \\
&= f(a) \sgn(I) \\
\end{aligned}
$$

The idea is that $$\frac{dx}{\| dx \|}$$ cancels out the magnitude of $$dx$$, leaving only the sign of the differential which we write as a "unit differential" $$\widehat{dx}$$ (which is a notation I have invented for this purpose). We claim, because it seems to make sense, that the integral of a unit differential is trivial: it is simply $$\pm 1$$ depending on the orientation of the range of integration. The resulting sign $$\sgn(I)$$ is determined by whether the range of integration $$I$$ was over a positively-oriented range, such as $$(-\infty, \infty)$$, versus a negatively oriented range like $$(\infty, -\infty)$$ (we assume that $$a \in I$$ though).[^sign] Typically we just assume that all 1d integrals are over positively-oriented ranges unless otherwise specified, in which case we could simply omit the sign and write $$f(a)$$, but I'm trying to be careful now because it will help in higher dimensions.

The unit differential is necessary for this object to act like a delta function: because an integral against a delta function gives $$\int_I \delta(x) \d x = \pm 1$$ depending on the orientation of $$I$$, we cannot fully cancel out the value of $$dx$$; we have to keep its sign. So we needed to invent something which cancels out its magnitude but leaves the direction.


[^sign]: A slightly more sophisticated object would be something like $$\sgn_a(I)$$ which measures "the sign of $$a$$ in $$I$$" (which I have also [seen written]({% post_url 2019-02-23-exterior-6 %}) as $$a \diamond I$$). The difference is that this would be $$0$$ if $$a \notin I$$. But I figure it's probably not necessary to include that additional complexity here.

The actual integration step is supposed to be easy once the integrand is proportional to $$1_a \widehat{dx}$$. The $$1_a$$ reduces the integral to a single point, while the $$\widehat{dx}$$ integrates out to give the sign of the integration range at that point. I guess we just trust that that is how it works rule:

$$\int_{\bb{R}} 1_a f(x) \widehat{dx} = f(a)$$

Here's some pseudo-theoretical justification:[^lebesgue]

[^lebesgue]: Fyi, I'm aware of Lebesgue integration and Gauge integration, but am not concerned with them here. This is all heuristic anyway.

Often we implement integration with Riemann summation, which decomposes the integration range into a bunch of oriented cells, each of which is described by a tangent vector $$\b{v}_i$$ (which in 1d is often simplified to $$x_{i+1} - x_i$$). Then we evaluate $$f \d x$$ on each of those tangent vectors and add up the result. Under a limit this converges (for a certain class of functions) to a definition value of the integral. We write this as $$\int_I f \d x = \lim \sum_{i \in I} f(x) \d x (\b{v}_i)$$, where the limit takes the number of partitions to infinity. 

In my scheme $$\| dx \|$$ is an object that has $$\| d x \| (\b{v}) = \| d x(\b{v}) \|$$ (similar to the integration measure in an arc-length integral), and $$\widehat{dx}$$ is the object that has $$\widehat{dx} (\b{v}) =\frac{d \b{x} (\b{v})}{\| d \b{x} (\b{v}) \|}$$, which in $$\bb{R}^1$$ is simply $$ \sgn (dx(\b{v}))$$. (In higher dimensions it will include a direction. In $$\bb{R}^1$$ there are only two possible directions, corresponding to $$\pm 1$$.)

Normally what allows the summation's limit to converge to the integral is that $$dx(\b{v}_i) \propto \| \b{v}_i \|$$, so as the integration partitions' size goes to zero with their total magnitude bounded by the length of the range, the sum of $$dx(\b{v}_i)$$ is held proportional to that length. When using $$\widehat{dx}$$ the value is $$\pm 1$$, so obviously we can't add up a bunch of these. Instead the only reason the integral "converges" is that the indicator $$1_a$$ has limited the range to a single point, or a sum of points, instead.

...maybe. If I haven't missed anything. But I find it intuitive: each point in the indicator $$1_{(a) + (b) + \ldots}$$ selects a point at which the integrand is evaluated, and then at that point the resulting contribution to the integral is $$\widehat{dx}$$ times the orientation of the range at that point, giving $$f(a) + f(b) + \ldots$$.

----------

This construction is nice because it makes some of the common disclaimers that normally have to be made about $$\delta(x)$$ really trivial:

1. You can't evaluate $$\delta(x)$$ outside of an integral for the exact same reason that you can't evaluate $$f(x) \d x$$ outside of an integral: because it uses the symbol $$d x$$ whose value comes from the integral. Yet you can do algebra with it, as long as you keep track of the $$d x$$s and $$\| dx \|$s appropriately.
2. $$\delta(x)$$ doesn't have a value at $$x=0$$ because it depends on an invisible variable, $$1/\| dx \|$$. The value is not exactly infinite: it's "whatever is required to cancel out a $$dx$$ and leave only its sign".
3. You can't multiply two delta functions in the same variable by each other, like $$\delta(x) \delta(x) = \frac{1_{x=0} 1_{x=0}}{\| dx \|^2 }$$, because the two copies of $$\| dx \|$$ aren't going to cancel out a single $$dx$$ in the numerator and will leave an overall factor of $$1/\| dx \|$$ that you have no way to integrate.

Also, compare my construction to a typical "nascent delta function" constructions. Delta functions are often defined as the limit of a series of smooth functions whose properties integrals go, in the limit, to the behavior of a delta function. Usually the smooth functions are a Gaussian, square cutoffs, or some other $$\e \eta(x/\e)$$ for an integrable $$\eta$$ that has $$\int \eta \d x = 1$$. But these, I think, are trying to express exactly the idea of $$\frac{1_a}{\| dx \|}$$. They want to make something whose (1) integral, in the limit, converges to being nonzero at exactly a single point, and which (2) perfectly cancels out the value of $$dx$$ at that point, except for its sign, integrating to $$\pm 1$$. Well why not just write that directly? (Well, it does not solve for the main reason you might be using nascent delta constructions, which is that you are demanding things be rigorously constructed out of classical functions for some reason. But I'm not concerned about that.)

Also, it makes $$\delta$$'s change-of-variable rules obvious. For instance $$\delta(-(x-a)) = \delta(x-a)$$ is

$$\delta(-x) = \frac{1_{-x=-a}}{\|{-dx} \|} = \frac{1_{x=a}}{\| dx \|} = \delta(x)$$

And

$$\delta(ax) = \frac{1_a}{\| a \d x \|} = \frac{1_a}{\|a \| \| d x \|} = \frac{\delta_a}{\| a \|}$$

And more generally:

$$
\begin{aligned}
\delta(g(x)) &= \frac{1_{g(x) = 0}}{\|d  g(x) \|} \\
&= \sum_{x_0 \in g^{-1}(0)} \frac{1_{x_0}}{\| g'(x_0) \d x \| } \\
&= \sum_{x_0 \in g^{-1}(0)}  \frac{1_{x_0}}{\|  g'(x_0)  \| \, \|\d x \|} \\
&= \sum_{x_0 \in g^{-1}(0)}  \frac{\delta(x-x_0)}{\|  g'(x_0)  \| }
\end{aligned}
$$

So that's neat.

Anyway, I don't find the use of an extra $$dx$$ in an integrand _that_ strange. We are used to integrating integrands of the form $$dF = f(x) \d x$$. But in full philosophical generality an integrand is more like $$dF = f(x, dx) = F(x + dx) - F(x)$$ (in the sense that that object _perfectly_ expresses the derivative of $$F$$, rather than approximates it). It just so happens that in most cases this is written as a linear function in $$dx$$, $$F(x + dx) - F(x) = f(x) \d x$$, and then we can do calculus. But in some cases, such as when dealing with the derivative of a step function $$\theta(x)$$, the value of $$F(x + dx) - F(x)$$ depends not linearly on $$dx$$ but on some other condition, such as whether $$0 \in (x, x + dx)$$. In that case you end up with an integrand that is not proportional to $$dx$$ but depends on it in some other way. Fine with me!

----------

# 3. The Multivariable Case

In the more dimensions this notation gives a lot of results for free, but there is a very important and weird caveat.

At first it seems like a product of two delta functions should be turn into a product of two 1d inverse differentials:

$$\delta(x) \delta(y) \? \frac{1_{x=0}}{\| dx \|} \frac{1_{y = 0}}{\| dy \|}$$

But this doesn't work! The problem is, what if we have a product of two delta functions that overlap in direction, like this?

$$\int \delta(x) \delta(x+y) f(x) \d x \d y$$

In an integrand this should evaluate at the point that satisfies $$x=0$$ and $$x+y=0$$, meaning that $$x=y=0$$ and the result is $$f(0, 0)$$. But because $$\| d(x+y) \| = \sqrt{2}$$, in the indicator notation we would get $$f(0, 0)/\sqrt(2)$$ if we naively divide through by $$\| dx \| \| dx + dy \|$$. So it is very important that the denominator is this new notation be a _wedge product_ of all the terms in the delta functions:

$$\delta(x) \delta(x + y) \stackrel{!}{=} \frac{1_{x=0} 1_{y=0}}{\| dx \^ dy \|}$$

Which means that its behavior in an integral is this:

$$
\begin{aligned}
\int_{\bb{R}^3} \delta(x) \delta(x + y) f(x,y) dx \^ dy &= \int_{\bb{R}^3} 1_{x=x+y=0} f(x,y) \, \frac{dx \^ dy}{\| dx \^ dy \|} \\
&=\int_{\bb{R}^3} 1_{x=y=0} f(x,y) \widehat{dx \^ dy} \\
&= f(0, 0) \\
&\neq \int_{\bb{R}^3} 1_{x=y=0} f(x,y) \, \widehat{dx} \^ \widehat{dy} \; \; \text{     (wrong!)}
\end{aligned}
$$

Weird, but as far as I can tell necessary? Basically, $$\delta(x) \delta(x+y)$$ needs to cancel out the magnitudes of $$dx \^ d(x+y) = dx \^ dy$$. Since the numerator combines with a wedge product, the denominator has to also. In general, since $$\int \delta(f) \delta(g) \d f \^ d g$$ ought to equal $$\pm 1$$, the delta functions need to be proportional to $$\frac{1}{df \^ dg}$$, even if $$df$$ and $$dg$$ are not orthogonal (although they cannot be parallel or we'd end up dividing by zero).[^cross]

[^cross]: The difference is the same as the difference between $$\frac{\b{a} \^ \b{b}}{\| \b{a} \^ \b{b} \|}$$ and $$\frac{\b{a}}{\| \b{a} \|} \^ \frac{\b{b}}{\| \b{b} \|}$$, by the way. The former has magnitude $$\frac{ab \sin \theta}{ab \sin \theta} = 1$$ while the latter has magnitude $$\frac{ab \sin \theta}{ab} = \sin \theta$$, where $$\theta$$ is the angle between them. 

This will take some getting used to. Evidently the denominators are not just scalars: they are actually something like "differential forms" as well. Maybe they are "negative-grade absolute differential forms"? Or maybe the object $$\delta(x) \delta(y)$$ should be regarded as $$\delta^2(x,y)$$ and therefore its denominator is a compound object $$\| d^2(x,y) \|$$ from the start, and factoring it into $$\delta(x) \delta(y)$$ only "works" when those terms are orthogonal directions? Or maybe delta functions really act like measures and it's even more not okay to regard them as functions? Not sure.

In case you need more convincing, note that it is well-known (although somewhat hard to find) that the change-of-variables formula for a multivariable delta function is

$$\delta(\b{u}(\b{x})) = \frac{\delta(\b{x} - \b{u}^{-1}(0))}{\| \det (\p\b{u} / \p\b{x}) \|}$$

That is, the denominator is the determinant of the Jacobian (hate that name) of $$\b{u}$$, $$\p\b{u} / \p\b{x}$$, and a determinant is _not_ the product of all the individual magnitudes. That is basically what we're dealing with here as well, only we've factored $$\delta(x, x+y)$$ as $$\delta(x) \delta(x+y)$$, which makes this combining-with-$$\^$$ behavior look more strange.

Anyway, we will have to live with this.

(Hopefully it goes without saying that I'm rather unsure of all this. But whatever, let's see what happens.)

------

Here's what happens in an integral:

$$
\begin{aligned}
\int_V \delta^3(\b{x} - \b{a}) f(\b{x}) \d^3 \b{x} &= \int_V 1_{\b{a}} f(\b{x}) \frac{d^3 \b{x}}{\| d^3 \b{x} \|} \\
&=  \int_V 1_{\b{a}} f(\b{x}) \, \widehat{d^3 \b{x}} \\
&= \sgn(V) f(\b{a})
\end{aligned}
$$

The $$\sgn(V)$$ comes from whether the integration is performed over a positively- or negatively-oriented volume. (Note that $$d^3 \b{x} $$ is just a shorthand for $$dx \^ dy \^ dz$$. I prefer to not write this as $$dV$$ because it can be useful to reserve $$V$$ as the label of a _specific_ volume, like we've done here, rather than all of space, since $$V$$ may in general be oriented differently than $$d^3 \b{x}$$ is.)

We can also integrate a 2d delta function in $$\bb{R}^3$$. These turn some, but not all, of the terms in the differential into a unit differential.

$$
\begin{aligned}
\int_V \delta(x) \delta(y) f(\b{x}) \d^3 \b{x} &= \int_V 1_{x=y=0} f(\b{x}) \, \frac{dx \^ dy \^ dz}{\| dx \^ dy \|} \\
&= \int_V 1_{x=y=0} f(\b{x}) \, \widehat{dx \^ dy} \^ dz \\
&= \sgn(V_{xy}) \int_{V_z} f(0, 0, z) \, dz\\
\end{aligned}
$$

The sign is strange. There's not really a canonical way to choose it. We need the overall integral when the $$z$$ coordinate is completed to have the right sign, but really we could _either_ take out a factor of $$\sgn(V)$$ _or_ change the orientation of the $$z$$ integral. Consider the simplest case, where $$V$$ is the product of three ranges, like $$V = [-\infty, \infty]^{3}$$. Then we imagine "factoring" it into two parts, as $$V = V_{xy} \times V_z$$, and we imagine that this factorization preserves its orientation. Then it is clear that we can either extract the overall sign of $$V$$ in the first integral, or we can extract whatever sign we want for the $$V_{xy}$$ integral so long as $$\sgn(V_{xy}) \times \sgn(V_z) = \sgn(V)$$. Above I've allowed myself to assume that $$V_z$$ is positively oriented afterwards, so all of the sign of $$V$$ is captured in the $$V_{xy}$$, but I admit that this is all pretty sketchy. And of course this will be weird when $$V$$ is not a cuboid. But it's a decent mental model anyway.

And here's a single delta:

$$
\begin{aligned}
\int_V \delta(x) f(\b{x}) \d^3 \b{x} &= \int_V 1_{x=y=0} f(\b{x}) \, \frac{dx \^ dy \^ dz}{\| dx \|} \\
&= \int_V 1_{x=0} f(\b{x}) \, \widehat{dx} \^ dy \^ dz \\
&= \sgn(V_x) \int_{ V_{yz} } f(0, y, z) \d y \^ dz\\
\end{aligned}
$$

Same deal with the signs again.

--------

# 4. Implicit Surfaces

These examples are pretty trivial. Let's get some more complicated examples to validate this idea better.

A single delta composed with a function $$\delta(g(\b{x}))$$ becomes an integral over a 2d implicit surface, the level set $$g(\b{x}) = 0$$ (subject to some assumptions on the form of $$g$$, like requiring it to not have a $$0$$ derivative anywhere).

$$
\begin{aligned}
\int_V \delta(g(\b{x})) f(\b{x}) \d^3 \b{x} &= \int_V \frac{1_{g(\b{x}) = 0}}{\| d g(\b{x}) \|} f(\b{x}) \d^3 \b{x} \\
\end{aligned}
$$

The easiest way to solve this is going to be if we can write the numerator as $$d^3 \b{x} = dg \^ d^2 \b{w}$$, where $$\b{w} = (w_1, w_2)$$ becomes a pair of coordinates on the level set of $$g^{-1}(0)$$. We don't really have these coordinates, though. For now there is one thing we can do. We know from exterior algebra that 

$$\star dg = dg \cdot d^3 \b{x}$$

And

$$dg \^ \star dg = \Vert dg \Vert^2 d^3 \b{x} = \| \del g \|^2 d^3 \b{x}$$

(I will be using the double-barred vertical lines $$\Vert dg \Vert$$ when I want to _actually_ take the magnitude of a differential, regarded as a vector, which in this case is $$\Vert dg \Vert = \| \del g \|$$.) If those seem strange, recall that $$\star dx = dy \^ dz$$ and so $$dx \^ \star dx = d^3 \b{x}$$. Also $$(a \d x) \^ \star (a \d x) = a^2 d^3 \b{x}$$.

So we can write

$$
\begin{aligned}
\int_V \delta(g(\b{x})) f(\b{x}) \d^3 \b{x} &= \int_V 1_{g = 0} f \, \frac{dg \^ \star dg}{\| \del g \|^2 \| dg \|} \\
&= \int_V 1_{g = 0} f \, \frac{\widehat{dg} \^ \star \widehat{dg}}{\| \del g \|} \\
&= \sgn(V_g) \int_{g^{-1}(0)} f \frac{\star \widehat{dg}}{\| \del g\|}
\end{aligned}
$$

Where $$\star \widehat{dg}$$ is the two-form which is the Hodge dual of $$\widehat{dg}$$.

I have no idea how to do that integral in general, but we can try it out on an easy surface that we know the parameterization for. $$\delta(r-R)$$ describes the surface of a sphere in $$\bb{R}^3$$. Then $$dr$$ is the differential for that surface, and $$\star dr = d \Omega = r^2 \sin \theta \d\theta \^ d \phi$$, because $$dr \^ d \Omega = d^3 \b{x}$$. Helpfully, $$\Vert dr \Vert = \| \del r \| = 1$$. Therefore:

$$
\begin{aligned}
\int_V \delta(r-R) f \d^3 \b{x} &= \int_V \frac{1_{r=R}}{\| dr \|} f \d r \^ d\Omega \\
&= \int_V 1_{r=R} f \, \widehat{dr} \^ d\Omega \\
&= \sgn(V) \int_{r=R} f(0, \theta, \phi) \d\Omega
\end{aligned}
$$


Since the $$\Omega$$ coordinates are always oriented in a standard way, I've let the overall sign of $$V$$ get handled by this integral.

What happens if we use a different implicit function for the sphere? After all $$\delta(r^2 - R^2)$$ or $$\delta(\sqrt{r^2 - R^2})$$ also describe spheres. For the first $$d(r^2 - R^2) = 2r \d r$$, so we get $$\delta(r^2 - R^2) = \delta(r - \pm R)/(2 \| r \|)$$, which gives an extra factor of $$1/2\| r \|$$ in the integral (the second zero should be canceled because when we integrate over $$d^3 \b{x}$$ we will not be translating that to $$(r, \Omega)$$ in such a way that it includes $$-R$$). For the second, $$d(\sqrt{r^2 - R^2}) = \frac{r \d r}{\sqrt{r^2 - R^2}}$$. In each case, to use these would we need to factor the integrand appropriately: e.g. $$d^3 \b{x} = \frac{d(r^2)}{\| d(r^2)\| } \^ d \Omega$$ instead of $$dr \^ d \Omega$$. Everything works out, with an extra factor due to the delta function form:

$$
\begin{aligned}
\int_V \delta(r^2-R^2) f \d^3 \b{x} &= \int_V \frac{1_{r=R}}{\| d(r^2) \|} f \frac{d(r^2)}{2 r} \^ d\Omega \\
 &= \int_V \frac{1_{r=\pm R}}{2 r \| dr \| } f \frac{2 r \d r}{2 r} \^ d\Omega \\
&= \int_V 1_{r=\pm R}f \frac{\widehat{dr}}{2 r} \^ d\Omega \\
&= \sgn(V) \int_{r=R} \frac{1}{2R} f(0, \theta, \phi) \d\Omega
\end{aligned}
$$

Of course the easier way to do this is to just write $$\delta(r^2 - R^2) = \delta(r-R) / 2 r$$.

The sphere calculation also works if we write $$\delta(r-R)$$ in rectilinear coordinates, $$\delta(\sqrt{x^2 + r^2 + z^2} - R)$$, with $$dr = (x \d x + y \d y + z \d z)/r$$. This is tedious but I figure it's useful to demonstrate how everything works:

$$
\begin{aligned}
\iiint_V \delta(r-R) f \d^3 \b{x} &= \iiint_V 1_{r=R} f \frac{d^3 \b{x}}{\| x \d x + y \d y + z \d z \|/r} \\
&= \iiint_V 1_{r=R} f \frac{dx \^ dy \^ dz}{\| x \d x + y \d y + z \d z \|/r} \\
&= \iiint_V 1_{r=R} f \frac{[x \d x + y \d y + z \d z] \^ [x \d y \^ dz + y \d z \^ dx + z \d x \^ dy]}{r \| x \d x + y \d y + z \d z \|} \\
&= \iiint_V 1_{r=R} f [\widehat{x \d x + y \d y + z \d z}] \^ \frac{x \d y \^ dz + y \d z \^ dx + z \d x \^ dy}{r} \\

&= \sgn(V) \oiint_{r=R} f \; \frac{x \d y \^ dz + y \d z \^ dx + z \d x \^ dy}{R} \\
&= \sgn(V) \oiint_{r=R} f \d \Omega
\end{aligned}
$$

(That $$(x,y,z)$$ expression [does](https://math.stackexchange.com/questions/3843421/spheres-surface-area-element-using-differential-forms) in fact, equal $$d \Omega$$. I hadn't seen it written out before.)

---------

There's a simple objection to all this, which is: why bother? All of this works without any special formulas for delta functions. When you have an integral $$\int \delta(g(\b{x})) f \d^3 \b{x}$$, it was always possible to factor it as $$\int \delta(g(\b{x})) f \frac{dg \^ \star \d g}{\| dg \|^2} = \int_{g =0} f [\star dg]/\|\del g \|^2$$, or to apply a delta identity to $$\delta(g(\b{x}))$$ to factor it first.

And, yeah, I suppose that works. I guess I prefer the longer version because it "hints at what's going on in" better. It seems like there is a more intuitive calculus hiding inside the calculus of delta functions, and breaking the deltas down into their constituent parts makes it easier to follow what's going on. But eh, if you don't like it, that's fine too. I am just enjoying seeing how it works (although I would be concerned if it led to any false conclusions---but I haven't found any yet).

---------

What about products of more than one implicit function?

$$
\begin{aligned}
\int_V \delta(f(\b{x})) \delta(g(\b{x})) f \d^3 \b{x} &= \int \frac{1_{f = g = 0}}{\| df \^ dg \|} f \d^3 \b{x} \\
&= \int 1_{f=g=0} \, f \, \frac{\widehat{df \^ dg} \^ \star(df \^ dg)}{\| \del f \^ \del g \|^2} \\
&= \sgn(V) \int_{f=g=0} f \frac{\star(df \^ dg)}{\| \del f \^ \del g \|^2}
\end{aligned}
$$

The result is over the intersection of the zero level sets $$f$$ and $$g$$, assuming that $$df \^ dg \neq 0$$ everywhere. (Once again I have to used the fact that $$(df \^ dg) \^ \star(df \^ dg) = \Vert df \^ dg \Vert^2 d^3 \b{x} = \| \del f \^ \del g \|^2 \d^3 \b{x}$$.) The sign term $$\sgn(V)$$ assumes that the resulting 1-integral is chosen to be over a positively oriented range.

Well, it is easy enough to produce a differential for the surface (via $$\star (df \^ dg)$$ times a normalization factor). But as usual I have no idea how you would actually use it, because in general you will not have any sort of coordinates available for the surface.

The one case where it is easy(ish) to use is when you have enough implicit equations that their intersection is a $$0$$-surface, i.e. a point-set.[^pm] In that case you can find the $$0$$-set of the functions $$\{f(x), g(x)\, \ldots \}$$ by whatever algebraic method you like, and then compute the integral that way. [Here](https://math.stackexchange.com/questions/619083/dirac-delta-function-of-non-linear-multivariable-arguments) is an example problem (albeit in 2d) that I found on StackExchange:

$$
\begin{aligned}
& \int_{\bb{R}^2} \delta(x^2 + y^2 - 4) \delta((x-1)^2 + y^2 - 4) f(x,y) \d x \d y \\
&=\int \frac{1_{x^2 + y^2 - 4 = 0} 1_{(x-1)^2 + y^2 - 4}}{\| 2 x \d x + 2 y \d y\| \^ \| 2 x \d x - 2 \d x + 2 y \d y \|} f(x,y) \d x \^ d y \\
&= \int \frac{1_{(x,y) = (\frac{1}{2}, \pm \frac{\sqrt{15}}{2})}}{\| 4 y \d x \^ \d y \|} f(x,y) \d x \^ d y \\
&= \int \frac{1_{(x,y) = (\frac{1}{2}, \pm \frac{\sqrt{15}}{2})}}{\| 4 y\|} f(x,y) \widehat{\d x \^ d y} \\
&= \frac{1}{2\sqrt{15}} \big( f(\frac{1}{2},\frac{\sqrt{15}}{2}) + f(\frac{1}{2}, -\frac{\sqrt{15}}{2}) \big)
\end{aligned}
$$

Which is the right answer. Of course this is not much different from using the well-known delta function identity $$\delta(g(\b{x})) = \sum_{x_0 \in g^{-1}(0)} \frac{\delta(x-x_0)}{\| \del g(x_0) \|}$$. But IMO it is at least easier to think about?

[^pm]: Aside: it is good to think of the $$\pm$$ symbol (or any discrete index, such as those created by $$\sqrt[n]{x}$$) as referring to coordinates on a $$0$$-surface. $$x^2 = 4$$ is a "one-dimensional constraint in one dimension"; the resulting surface is zero-dimensional and consists of two points.

I suppose that the general problem of "finding the solution to systems of arbitrary equations" is a prerequisite to parameterizing them and integrating over them, and that is basically the field of algebraic geometry. So I'll have to stop there and stick with just wondering about it for now.

-------

# 5. Stokes' Theorem

We can also do Stokes' Theorem. Suppose $$g(\b{x})$$ is a well-behaved implicit function that describes a volume $$V$$, and let's establish that $$g$$ **is positive on the interior** of a closed 2-surface and negative on the exterior. Write $$\b{n} = \frac{\del g}{\| \del g \|}$$ for the outward-pointing normal vector. We can describe the interior with a step function $$\theta(g(\b{x}))$$:

$$(-\del) \theta(g(\b{x})) = (\del g) \delta(g(\b{x}))$$

Note that $$\del g$$ on its own points in the direction of $$-\b{n}$$, into the surface, because $$g$$ increases as you go into the surface, so the $$-\del$$ flips this around to give $$+\b{n}$$.

We'll do the Divergence Theorem version of Stokes first because it is easiest to think about.

$$\int_{\sigma} \del \cdot F \d V = \oint_{\p \sigma} (F \cdot \b{n}) \d A$$

$$F$$ here is a vector field (which is probably better thought of as a bivector field). Its exterior derivative is $$dF = (\p_x F_{x} + \p_y F_{y} + \p_z F_{z}) d^3 \b{x} = (\del \cdot F) d^3 \b{x}$$.

Then:

$$
\begin{aligned}
\int_{g > 0} (\del \cdot F) \d V &= \int \theta(g(\b{x})) (\del \cdot F) \d^3 \b{x} \\
&= \int [-\del \theta(g(\b{x}))] \cdot F \d^3 \b{x} \\
&= \int  \delta(g(\b{x})) [-\del g \cdot F] \frac{dg \^ \star dg}{\| \del g \|^2} \\
&=  \int 1_{g=0} (\b{n} \cdot F) \frac{dg \^ \star dg}{\| \del g \|^2} \\
&=  \int 1_{g=0} (\b{n} \cdot F) \frac{\widehat{dg} \^ \star dg}{\| \del g \|} \\
&= \oint_{g=0} (\b{n} \cdot F )\frac{\star dg}{\| \del g \|} \\
\end{aligned}
$$

Which (as far as I can tell) should be the correct area element on the surface. As always, not very helpful but I thought it was cool that it works. (In there I used the fact that integration by parts works with a scalar function times a vector field: $$G (\del \cdot F) = -\del G \cdot F$$ so long as $$GF$$ is zero at infinity, which it is because $$\theta(g) = 0$$ outside the surface.) Note that if $$\| \del g\| = 1$$, for instance if $$g$$ is a radial coordinate or a signed distance field, then this reduces to

$$\int_{g > 0} (\del \cdot F) \d V = \oint_{g=0} (\b{n} \cdot F ) [\star dg] $$

That's the classical version. The exterior calculus version is somewhat more elegant. In this, we treat $$F$$ as a bivector field rather than a vector field, and we're trying to get

$$\int_{g > 0} dF = \int_{g =0} F$$

We can imagine expanding $$F$$ in a fictitious $$(g, u, v)$$ coordinate system that parameterizes the $$g> 0 $$ region, and regard $$F$$ as a bivector field $$F = F_{uv} d u \^ dv + F_{vg} d v \^ dg + F_{gu} d g \^ du$$. (If starting from a vector field, this is $$\star F$$.[^spherical]) So the divergence is:

[^spherical]: It is somewhat non-trivial to see how this corresponds to the usual definition of divergence in curved coordinates. The important bit is to note that by writing the vector field as a bivector field we've already picked up some extra factors. For instance, in spherical coordinates, we have $$d^3 \b{x} = r^2 \sin \theta \d r \^ d \theta \^ d\phi$$, and so $$F_{\theta \phi}$$ is given by $$\star F_r (\b{r}) = (r^2 \sin \theta) F_r$$. The total radial term ends up being $$\frac{1}{r^2 \sin \theta} \p_r [r^2 \sin \theta F_r] = \frac{1}{r^2} \p_r (r^2 F_r)$$.

$$dF = (\p_g F_{uv} + \p_u F_{vg}  + \p_v F_{gu}) (dg \^ du \^ dv)$$

Where the volume element $$d^3(g, u, v)$$ is not necessarily of magnitude $$1$$ in $$\b{x}$$ coordinates. Fortunately, keeping track of all the "types" like this tells us exactly how to change coordinates if we need to.

When we integrate in parts in these coordinates, both the $$\p_u$$ and $$\p_v$$ derivatives will vanish because $$\theta = \theta(g)$$ only. Also, there's no extra $$\del g$$ term because $$\p_g \theta(g) = \delta(g)$$. It looks like this:

$$
\begin{aligned}
\int_{g > 0} dF &= \int \theta(g) [\p_g F_{uv} + \cancel{\p_u F_{vg} + \p_v F_{gu}}] \d g \^ du \^ dv \\
&= \int (-\p_g) \theta(g) F_{uv} \d g \^ du \^ dv \\
&= - \int \delta(g) F_{uv} \d g \^ du \^ dv  \\
&= - \int 1_{g = 0} \, F_{uv} \widehat{\d g} \^ du \^ dv \\
&= \oint_{g = 0} F_{uv} \d u \^ dv \\
&= \oint_{g =0} F
\end{aligned}
$$

(Where'd the negative sign go? Well, $$dg$$ points into the surface, not out of it, so I removed it when integrating over $$\widehat{dg}$$ for consistency with the assumed orientation of $$du \^ dv$$.)

Although to be honest I get really lost in some these exterior calculus computations so I wouldn't vouch too heavily for this. But I do think this trick of "inventing coordinates for a surface, then writing down delta and step functions for it" is suspiciously powerful.

Incidentally, this type of integration is discussed on the Wikipedia page [Laplacian of the Indicator](https://en.wikipedia.org/wiki/Laplacian_of_the_indicator). It turns out that in some contexts it's useful to take further derivatives of $$\delta(g)$$ to produce $$\delta'(g)$$ functions on surfaces.

----------

The same basic derivation should work for the other types of Stokes' theorem, such as $$\int \del \times F \d A = \oint F \d \ell$$ and $$\int_C \del F d \ell = \int_{\p C} F$$. But I'm running out of steam so I'll leave that for a later article.

------------

# 6. Summary

Although my goal was to justify the funny-looking formula $$\delta(x) = \frac{1_a}{\| dx \|}$$, but I ended up getting somewhat sidetracked playing around with using it to manipulate integrals in 3d. I guess the point is to just show that everywhere I've tried to use that notation, it is has proven rather natural and intuitive, so long as you remember that funny rule: that the differentials in the denominator combine with the wedge product, and are used to turn differentials in the numerator into "unit" differentials like $$\widehat{dg}$$.

No idea if there's any rigorous basis for any of it, of course. But I'm just glad to know how to produce some of the delta function identities more quickly now.