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

Our equations will involve lots of distributions, particularly $$\delta$$ (the Dirac delta function), $$\theta$$ (the Heaviside step function), and $$I$$ (the indicator function). These get quite verbose if you write them all out with their arguments like $$\delta(x-a)$$, so I will be using some shorthands to make things easier to read:

We will omit the arguments for functions and distributions when the meaning is clear from context: $$f$$ will be written instead of $$f(x)$$ when there it is obvious that the argument is in the variable $$x$$.

$$f(x) \equiv f$$

(I will be using $$\equiv$$ to mean that something is defined as being equal to something else, as opposed to $$=$$ which means they are algebraically equal.)

We'd often like to also be able to omit an argument when it's of the form $$(x-a)$$ as well, since this case is very common for distributions. We do this by moving the $$a$$ into a subscript,  writing $$\delta_a$$ for $$\delta(x-a)$$. In practice we'll sometimes write this as $$\delta_{(a)}$$ instead, to make it clear that $$a$$ refers to a point.

$$
\begin{aligned}
\delta(x-a) &\equiv \delta_a \equiv \delta_{(a)} \\
\theta(x-a) &\equiv \theta_a \equiv \theta_{(a)} \\
\end{aligned}
$$

An indicator function $$1_{P}(x)$$ is equal to $$1$$ anywhere that the predicate $$P(x)$$ is true, even if we omit the $$(x)$$. For instance $$1_{x = a}$$ is $$1$$ if $$x=a$$ and $$0$$ otherwise. We'll also omit the $$x$$ in the predicate and just write this as $$1_a$$ to mean the indicator for the point $$x=a$$. We also generalize this and allow the subscript to be other types of surfaces, like a generic surface $$A$$

$$
\begin{aligned}
1_a &\equiv 1_{(a)} \equiv 1_{x = a} \\
\end{aligned}
$$

Sometimes it is useful to talk about an indicator function for an interval $$(a,b)$$. But when dealing with integration it is nicer if the indicator function respected the orientation of the range, such that the range $$(a,b)$$ was the negative of $$(b,a)$$. It would be weird to write $$1_{(a,b)}$$ for this, but we can do it easily with step functions:

$$\theta_{(a,b)} = \theta_a - \theta_b = 
\begin{cases} 1 & a < x < b \\ -1 & b < x < a \\ 0 & \text{otherwise} \end{cases}$$

We can also talk about the indicator function for a generic surface, which is written with a capital letter to distinguish it from a point:

$$1_A \equiv 1_{x \in A}$$

The generic surface is written with a capital letter to distinguish it from a point. We'll also write integrals over an interval or a surface with capital letter when the details of the surface don't matter, like $$\int_I \d f$$. Then the result of the integral is to evaluate $$f$$ on the boundary of $$I$$, which is written $$\p I$$. If $$I$$ is the interval $$(a,b)$$ then $$\p I$$ is the pair of points $$(b) - (a)$$.

We can take the subscript notation further by also allowing a subscript to contain a linear combination of surfaces, like $$1_{A + B} = 1_A + 1_B$$.  In every case the linear combination simply distributes over the function, so $$\delta_{A+B-C} = \delta_A + \delta_B - \delta_C$$, etc. When we write linear combinations of points, we write the points with parentheses, as $$(a) + (b)$$, so that it doesn't look like we're adding the points as vectors $$a + b$$.

$$
\begin{aligned}
1_{(a) + (b)} &\equiv 1_a + 1_b \\
1_{(b) - (a)} &\equiv 1_b - 1_a \\
\delta_{(b) - (a)} &\equiv \delta_b - \delta_a \\
\theta_{(b) - (a)} &\equiv \theta_b - \theta_a \\
\end{aligned}
$$

It's occasionally nice to also permit this notation for integrals. If $$A$$ and $$B$$ are two surfaces, then

$$\int_{A - B} df \equiv \int_A \d f - \int_B \d f$$

Finally, know that I am going to be using the words "function" and "distribution" interchangeably without concern for their usual technical differences.


----------

# 1. Integrating with Distributions

You are probably aware that a delta function can be "used" to evaluate a function at a point:

$$\int_{\bb{R}} \delta_a f \d x \equiv \int_{\bb{R}} \delta(x-a) f(x) \d x = f(a)$$

It turns out that a lot of other operations can be converted into integrals against distributions. For instance, an integral over a finite range $$(a,b)$$ can be written as integration against the indicator function for that range:

$$\int_a^b f' \d x  = \int_{\bb{R}} \theta_{(a,b)} f' \d x = f(b) - f(a)$$

Integrating against either form gives the same result:

$$
\begin{aligned}
\int_{\bb{R}} \theta_{(a,b)} f' \d x  &= \int (\theta_a - \theta_b) f' \d x \\
&= \int_a^\infty f' \d x - \int_b^\infty f' \d x \\
&= [\int_a^b f' \d x + \cancel{\int_b^\infty f' \d x}] - \cancel{\int_b^\infty f' \d x}\\
&= \int_a^b f' \d x \\
&= f(b) - f(a)
\end{aligned}
$$

This only works using the "oriented" indicator function that's given by $$\theta_{(a,b)}$$; $$1_{(a,b)}$$ would be incorrect because it doesn't respect the sign of the interval.

Another way of getting the result is by moving the derivative over onto the indicator function with integration-by-parts.

Recall that $$\int_I u v' \d x = (u v) \|_{\p I} - \int_I u' v \d x$$. Here $$I = \bb{R}$$, so $$\p I = (-\infty, + \infty)$$, and the boundary terms vanish because $$\theta_{(a,b)}$$ is $$0$$ at $$\pm \infty$$.

$$
\begin{aligned}
\int_{\bb{R}} \theta_{(a,b)} [\p_x f] \d x &= \cancel{\theta_{(a,b)} f \|_a^b} - \int_{\bb{R}} [\p_x  \theta_{(a,b)}] f \d x \\
&=\int_{\bb{R}} [(-\p_x) (\theta_a - \theta_b)] f \d x \\
&= \int_{\bb{R}} (\delta_b - \delta_a) f \d x \\
&= f(b) - f(a) \\
\end{aligned}
$$

The $$f' = \p_x f$$ passes its derivative over to $$(-\p_x) \theta_{(a,b)}$$, and the boundary terms vanish because $$\theta_{(a,b)}$$ is $$0$$ at $$\pm \infty$$. The result is a pair of delta functions defined on the boundary of the underlying oriented surface $$\p(a,b) = (b) - (a)$$. Note that the order of $$b$$ and $$a$$ switch because of the negative sign from the integration-by-parts: $$(-\p)(\theta_b - \theta_a) = \delta_a - \delta_b$$.[^boundary]

[^boundary]: It seems like the distribution for the range $$(a,b)$$ is $$\theta_a - \theta_b$$, and the distribution for the boundary is $$\delta_b - \delta_a$$, created by the $$-\p$$ operator, rather than $$+\p$$ as you might guess. Why? I think it's because, for a function like $$\delta_a$$ or $$\theta_a$$, the point $$a$$ actually enters with a negative sign, in $$\theta(x-a)$$. So if you wanted to take a derivative "with regard to the point $$a$$", you would really want the object $$\p_a \theta_a$$. It just happens that $$\p_a \theta_a = (-\p_x) \theta_a$$, so the negative derivative $$-\p_x$$ does the same thing as the positive derivative $$+\p_a$$.

This is all pretty neat to me. It's intuitive if you think about it, but I didn't notice it for a long time after I learned about $$\delta$$. It turns out that a lot of properties of integration can be moved into the integrand itself by writing them as distributions. We'll be doing a lot more of that in a minute.

First, though, consider how the resulting object $$\delta_{(b) - (a)}$$ looks like a description of the boundary $$(b) - (a)$$, which makes $$(-\p_x )$$ look like an expression of the boundary operator, implemented on the distribution representation of $$(a,b)$$ that is given by $$1_{(a,b)}$$. But it's not _quite_ right. The appropriate description of the boundary $$\p(a,b) = (b) - (a)$$ should probably also be an indicator like $$1_{(b) - (a)}$$, which is _not_ the same thing as $$\delta_{(b) - (a)}$$. Indicators have value $$1$$ at their nonzero points, while $$\delta_{(b) - (a)}$$ has value $$\infty$$-ish (delta functions do not really "have" a nonzero value but you know what I mean). Meanwhile, $$\delta_{(b) - (a)}$$ is something you can actually integrate against, while $$1_{(b) - (a)}$$ has measure zero, so integrating against it would give zero:

$$\int 1_{(b) - (a)} f \d x \stackrel{!}{=} 0$$

So what's going on? What _is_ the relationship between these two objects?

$$
\begin{aligned}
1_{\p(a,b)} &= 1_{(b) - (a)} \\
&\stackrel{?}{\equiv} \\
 (-\p) 1_{(a,b)} &= \delta_b - \delta_a
\end{aligned}
$$

Or even these two?

$$1_{(a)} \stackrel{?}{\equiv} \delta_a$$

What is the difference between an indicator for a point and a delta function for a point?

-----------

# 2. Integration with Inverse Differentials

I think that a good way of thinking about it is this. We know that in some sense a delta function is a derivative of a step function:

$$\delta_a = \frac{d \theta_a}{dx}$$

If it were a normal derivative, it would be that $$d \theta_a$$ has a linear approximation $$d \theta_a \approx \theta_a' dx$$, and then the $$dx$$s cancel, leaving the derivative. $$\theta_a$$ doesn't have such an approximation, so when write $$\theta'_a = \delta_a$$ we are just pretending it does. But really it works a lot better if we don't pretend: instead we just leave it in that form, and let the $$dx$$s cancel out:

$$\int \delta_a f \d x = \int \frac{d \theta_a}{\cancel{dx}} f \, \cancel{d x} = \int d \theta_a f$$

Then $$d \theta_a$$ is a differential that is only nonzero on a single partition of the integral, given by

$$
\begin{aligned}
d \theta_a = \theta(x-a + dx) - \theta(x-a) = \begin{cases} + 1 & x < a, x + dx > a \\
-1 & x > a, x + dx < a \\
0 & \text{otherwise}
\end{cases}
\end{aligned}
$$

When integrating it extracts only the value at that single point, but _not_ times any $$dx$$ term, because that canceled out---which is why it gives a finite answer instead of something vanishly small. 

$$\int_\bb{R} f \d \theta_a = f(a)$$

So $$\frac{d \theta_a}{dx}$$ makes perfect sense if you don't to replace it with $$\delta(x)$$ and just leave it as is. But $$d \theta_a$$ is still a bit awkward. It's an indicator function except it has a plus or minus sign? We can arrange it into this form:

$$\delta_a = \frac{1_a}{\| dx \|}$$

That's the relationship between a delta function and an indicator for the same point: a delta function is the indicator divided by the absolute value of a differential. 

The idea is that when integrating against the delta function, the only term that is left is the "sign" of the differential:

$$\int \delta_a f \d x = \int \frac{1_a}{\| dx \|} f \d x = \int 1_a f \frac{dx}{\| dx \|} = \int \delta_a \widehat{dx}$$

$$\widehat{dx}$$ is an object which evaluates to $$\pm 1$$ depending on whether the integration direction is positive or negative, like the unit vector version of a differential. $$d \theta_a = 1_a \widehat{dx}$$ together become the "oriented" indicator function: $$+1$$ if the integration crosses $$x=a$$ in the positive direction, $$-1$$ if crossing in the negative direction, and $$0$$ everywhere else. Since it is only nonzero on a single partition, the sum converges.

Of the two forms $$d \theta_a/dx$$ and $$1_a/\| dx \|$$, I find the latter easier to think about, so I'll usually use that.

Regardless of whether you use the $$1_a/\| dx \|$$ form or the $$ d\theta_a/dx$$ form, I find it really helpful to think about delta functions in these ways: they're _exact_ representations of the thing that you can use in algebra. What we're saying is that in general a differential $$df$$ is a function of _two_ arguments, $$df(x, x + dx)$$, which _might_ have a linear approximation, but might not. When we perform an integral on a bunch of sufficiently-small partitions, maybe it will be useful to be able to replace $$df(x, x + dx)$$ with $$f'(x) dx$$, or maybe not. For distributions like $$\theta$$, it is not: just leave it as $$d \theta/ dx$$; it _doesn't need_ to be approximated as a derivative. It works a lot better that way.

For example, this construction makes some of the common disclaimers about $$\delta(x)$$ really trivial:

1. You can't evaluate $$\delta(x)$$ outside of an integral for the exact same reason that you can't evaluate $$f(x) \d x$$ outside of an integral: because it uses the symbol $$d x$$ whose value comes from the integral. Yet you can do algebra with it, as long as you keep track of the $$d x$$s appropriately. It should be written, or at least thought of, as really being $$\delta(x, dx)$$, a non-trivial function of both arguments.
2. $$\delta(x)$$ doesn't have a value at $$x=0$$ because it depends on that invisible variable, $$1/dx$$. The value is not exactly infinite: it's "whatever is required to cancel out a $$dx$$".
3. You can't multiply two delta functions in the same variable by each other, like $$\delta(x) \delta(x) = \frac{1_{x=0} 1_{x=0}}{\| dx \|^2 }$$, because the two copies of $$\| dx \|$$ aren't going to cancel out a single $$dx$$ in the numerator and will leave an overall factor of $$1/\| dx \|$$ that you have no way to integrate.

Also, compare this construction to a typical "nascent delta function" construction. Delta functions are often defined as the limit of a series of smooth functions whose properties integrals go, in the limit, to the behavior of a delta function. Usually the smooth functions are a Gaussian, square cutoffs, or some other $$\e \eta(x/\e)$$ for an integrable $$\eta$$ that has $$\int \eta \d x = 1$$. But these, I think, are trying to express exactly the idea of $$\frac{1_a}{\| dx \|}$$. They want to make something whose (1) integral, in the limit, converges to being nonzero at exactly a single point, and which (2) perfectly cancels out the value of $$dx$$ at that point, except for its sign, integrating to $$\pm 1$$. Well why not just write that directly? (Well, it does not solve for the main reason you might be using nascent delta constructions, which is that you are demanding things be rigorously constructed out of classical functions for some reason. But I'm not concerned about that.)

Also, it makes $$\delta$$'s change-of-variable rules obvious. For instance $$\delta(-(x-a)) = \delta(x-a)$$ is given by

$$\delta(-(x-a)) = \frac{1_{-x=-a}}{\|{-dx} \|} = \frac{1_{x=a}}{\| dx \|} = \frac{1_{x=a}}{\| d(x-a) \|} = \delta(x-a)$$

And $$\delta(ax) = \delta(x)/\|a \|$$ is given by

$$\delta(ax) = \frac{1_{ax = 0}}{\| a \d x \|} = \frac{1_{x=0}}{\|a \| \| d x \|} = \frac{\delta(x)}{\| a \|}$$

And in general:

$$
\begin{aligned}
\delta(g(x)) &= \frac{1_{g(x) = 0}}{\|d  g(x) \|} \\
&= \sum_{x_0 \in g^{-1}(0)} \frac{1_{x_0}}{\| g'(x_0) \d x \| } \\
&= \sum_{x_0 \in g^{-1}(0)}  \frac{1_{x_0}}{\|  g'(x_0)  \| \, \|\d x \|} \\
&= \sum_{x_0 \in g^{-1}(0)}  \frac{\delta(x-x_0)}{\|  g'(x_0)  \| }
\end{aligned}
$$

Now they follow from rote algebra instead of being weird facts that you memorize.[^wheeler]

[^wheeler]: Another way of seeing these may be found in a paper 'Simplified Production of Direc Delta Function Identities" by Nicholas Wheeler, which can be found [here](https://www.reed.edu/physics/faculty/wheeler/documents/Miscellaneous%20Math/Delta%20Functions/Simplified%20Dirac%20Delta.pdf). Basically note that $$\theta(ax) = \sgn(a) \theta(x)$$ and then  $$\delta(ax) = d \theta(ax)/d (ax) = d \theta / \| a \| dx$$.

----------

# 3. The Multivariable Case

In the more dimensions this interpretation gives a lot more results for free, but there is a very important caveat.

At first it seems like a product of two delta functions, which are each an inverse differential, should be turn into a product of two inverse differentials:

$$\delta(x) \delta(y) \? \frac{1_{x=0}}{\| dx \|} \frac{1_{y = 0}}{\| dy \|}$$

But this doesn't work! The problem is, what if we have a product of two delta functions that overlap in direction, like this?

$$\int \delta(x) \delta(x+y) f(x) \d x \d y$$

In an integrand this should evaluate at the point that satisfies $$x=0$$ and $$x+y=0$$, meaning that $$x=y=0$$ and the result is $$f(0, 0)$$. But because $$\| d(x+y) \| = \sqrt{2}$$, in the indicator notation we would get $$f(0, 0)/\sqrt(2)$$ if we naively divide through by $$\| dx \| \| dx + dy \|$$. That doesn't work. The problem is that the denominator of $$\delta(x) \delta(x + y)$$ should cancel out the magnitude of a $$dx \^ d(x+y) = dx \^ dy$$ in the numerator. So it is very important that the denominator is this new notation become a _wedge product_ of all the terms in the delta functions:

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

Weird, but as far as I can tell necessary? Basically, $$\delta(x) \delta(x+y)$$ needs to cancel out the magnitudes of $$dx \^ d(x+y) = dx \^ dy$$. Since the numerator combines with a wedge product, the denominator has to also. In general, since $$\int \delta(f) \delta(g) \d f \^ d g$$ ought to equal $$\pm 1$$, the delta functions need to be proportional to $$\frac{1}{df \^ dg}$$, even if $$df$$ and $$dg$$ are not orthogonal (although they cannot be parallel or we'd end up dividing by zero).

This will take some getting used to. Evidently the denominators are not just scalars: they are actually something like "differential forms" as well. 

In case you need more convincing, note that it is well-known (although somewhat hard to find) that the change-of-variables formula for a multivariable delta function with argument $$\b{u}(\b{x}): \bb{R}^n \ra \bb{R}^n$$ is

$$\delta(\b{u}(\b{x})) = \frac{\delta(\b{x} - \b{u}^{-1}(0))}{\| \det (\p\b{u} / \p\b{x}) \|}$$

That is, the denominator is the determinant of the Jacobian (hate that name) of $$\b{u}$$, $$\p\b{u} / \p\b{x}$$, and a determinant is _not_ the product of all the individual magnitudes. That is basically what we're dealing with here as well, only we've factored $$\delta(x, x+y)$$ as $$\delta(x) \delta(x+y)$$, which makes this combining-with-$$\^$$ behavior look more strange.

I think what's going on is roughly this. If you write each of the delta functions as a derivative of a step function

$$\int \frac{d \theta(x)}{dx} \frac{d \theta(x + y)}{d(x+y)} f \, dx \^ dy$$

Then each does cancel out with the $$dx \^ dy$$, but they do it using the interior product of differential forms. So

$$
\begin{aligned}
\frac{1}{dx} \frac{1}{dx + dy} dx \^ dy &\? \iota_{dx + dy} \iota_{dx} (dx \^ dy) \\
&= \iota_{dx + dy} dy \\
&= 1
\end{aligned}
$$

I don't exactly see _why_ it works this way, but it seems to be how it works. 

September 2024 edit: It is a lot like the [vector division]({% post_url 2024-09-11-vector-division %}) that I play with sometimes, actually, and that's probably what it is. Well, I wrote that afterwards, partly based on this, but may as well have a forward link anyway. This kinda tells me how division on multivectors ought to work, if it's going to work:

The confusing part is that you can't divide through by the magnitudes _individually_. It's _not_ this

$$
\begin{aligned}
\frac{1}{(a \d x)} \frac{1}{(b \d x + c \d y)} (dx \^ dy) &\stackrel{!}{\neq}\frac{\iota_{dx + dy}}{\sqrt{b^2 + c^2}}  \frac{\iota_{dx}}{a} (dx \^ dy)
\end{aligned}
$$

Instead it has to be this:

$$
\begin{aligned}
\frac{1}{(a \d x)} \frac{1}{(b \d x + c \d y)} (dx \^ dy) &= \frac{1}{a dx \^ c d y} (dx \^ dy)\\
&= \frac{\iota_{dx \^ dy}}{ac} (dx \^ dy) \\
&= \frac{\iota_{dy} \iota_{dx}}{ac} (dx \^ dy) \\
\end{aligned}
$$

This makes the idea that $$\frac{1}{a \d x} \equiv \frac{\iota_dx}{a}$$ a bit suspect. I _do_ really like the idea that interior produts (and inner products in general) are kinda like division, because very often they _seem_ more like division. But it's weird that you can't divide the terms one at a time; you have to actually multiply the denominators together first, then divide by them. Ick.

Anyway, where were we?

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

The sign is strange. There's not really a canonical way to choose it. We need the overall integral when the $$z$$ coordinate is completed to have the right sign, but really we could _either_ take out a factor of $$\sgn(V)$$ _or_ change the orientation of the $$z$$ integral. Consider the simplest case, where $$V$$ is the product of three ranges, like $$V = [-\infty, \infty]^{3}$$. Then we imagine "factoring" it into two parts, as $$V = V_{xy} \times V_z$$, and we imagine that this factorization preserves its orientation. Then it is clear that we can either extract the overall sign of $$V$$ in the first integral, or we can extract whatever sign we want for the $$V_{xy}$$ integral so long as $$\sgn(V_{xy}) \times \sgn(V_z) = \sgn(V)$$. Above I've allowed myself to assume that $$V_z$$ is positively oriented afterwards, so all of the sign of $$V$$ is captured in the $$V_{xy}$$, but I admit that this is all pretty sketchy. And of course this will be weird when $$V$$ is not a cuboid (that is, a rectangular prism). But it's a decent mental model anyway.

And here's a single delta:

$$
\begin{aligned}
\int_V \delta(x) f(\b{x}) \d^3 \b{x} &= \int_V 1_{x=y=0} f(\b{x}) \, \frac{dx \^ dy \^ dz}{\| dx \|} \\
&= \int_V 1_{x=0} f(\b{x}) \, \widehat{dx} \^ dy \^ dz \\
&= \sgn(V_x) \int_{ V_{yz} } f(0, y, z) \d y \^ dz\\
\end{aligned}
$$

Same deal with the signs again. There's not a canonical way to do it; we have to pick the integration bounds of the result such that the overall orientation of $$V_x \times V_{yz}$$ matches $$V$$.

--------

# 4. Implicit Surfaces

This gets more interesting when we deal with delta functions of generic surfaces.

A single delta composed with a function $$\delta(g(\b{x}))$$ becomes an integral over a 2d implicit surface, the level set $$g(\b{x}) = 0$$. We assume that $$g$$ defines a regular surface, so $$\| dg \| \neq 0$$ anywhere.

$$
\begin{aligned}
\int_V \delta(g(\b{x})) f(\b{x}) \d^3 \b{x} &= \int_V \frac{1_{g(\b{x}) = 0}}{\| d g(\b{x}) \|} f(\b{x}) \d^3 \b{x} \\
\end{aligned}
$$

The easiest way to solve this is going to be if we can write the numerator as $$d^3 \b{x} = dg \^ d^2 \b{w}$$, where $$\b{w} = (w_1, w_2)$$ becomes a pair of coordinates on the level set of $$g^{-1}(0)$$. But in general we don't have these coordinates. What can we do?

Well, we can cheat a bit. We know from exterior algebra that 

$$\star dg = dg \cdot d^3 \b{x}$$

And, defining $$\Vert dg \Vert = \| \del g \|$$ as the _actual_ magnitude of a differential (that is, the scalar value, not a weird type of differential form):

$$dg \^ \star dg = \Vert dg \Vert^2 d^3 \b{x} = \| \del g \|^2 d^3 \b{x}$$

Example of these: $$\star dx = dy \^ dz$$, so $$dx \^ \star dx = d^3 \b{x}$$ and $$(a \d x) \^ \star (a \d x) = a^2 d^3 \b{x}$$.

So we can write

$$
\begin{aligned}
\int_V \delta(g(\b{x})) f(\b{x}) \d^3 \b{x} &= \int_V 1_{g = 0} f \, \frac{dg \^ \star dg}{\| \del g \|^2 \| dg \|} \\
&= \int_V 1_{g = 0} f \, \frac{\widehat{dg} \^ \star \widehat{dg}}{\| \del g \|} \\
&= \sgn(V_g) \int_{g^{-1}(0)} f \frac{\star \widehat{dg}}{\| \del g\|}
\end{aligned}
$$

Where $$\star \widehat{dg}$$ is the two-form which is the Hodge dual of $$\widehat{dg}$$.

I have no idea how to do that integral in general, but we can try it out on an easy surface that we know the parameterization for. $$\delta(r-R)$$ describes the surface of a sphere in $$\bb{R}^3$$. Then $$dr$$ is the differential for that surface, and $$\star dr = d \Omega = r^2 \sin \theta \d\theta \^ d \phi$$, because $$dr \^ d \Omega = d^3 \b{x}$$. Helpfully, $$\Vert dr \Vert = \| \del r \| = 1$$ (I had to double-check). Therefore:

$$
\begin{aligned}
\int_V \delta(r-R) f \d^3 \b{x} &= \int_V \frac{1_{r=R}}{\| dr \|} f \d r \^ d\Omega \\
&= \int_V 1_{r=R} f \, \widehat{dr} \^ d\Omega \\
&= \sgn(V) \int_{r=R} f(0, \theta, \phi) \d\Omega
\end{aligned}
$$


Since the $$\Omega$$ coordinates are always oriented in a standard way, I've let the overall sign of $$V$$ get handled by this one integral. This calculation also works out if we use a different implicit function for the sphere, e.g. $$\delta(r^2 - R^2)$$ or $$\delta(\sqrt{r^2 - R^2})$$, although keep in mind that $$\delta(r^2 - R^2) = \delta(r - \pm R)/(2 R)$$ if you work it out.

We could also have written $$\delta(r-R)$$ out in rectilinear coordinates, $$\delta(\sqrt{x^2 + r^2 + z^2} - R)$$, with $$dr = (x \d x + y \d y + z \d z)/r$$. Then we get the same answer, after a tedious but perhaps useful calculation:

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

(It [turns out](https://math.stackexchange.com/questions/3843421/spheres-surface-area-element-using-differential-forms) that $$(x \d y \^ dz + y \d z \^ dx + z \d x \^ dy) / R$$ does equal $$d \Omega$$. I had no idea.)

---------

There's a simple objection to all this, which is: why bother? All of this works without any special formulas for delta functions. When you have an integral $$\int \delta(g(\b{x})) f \d^3 \b{x}$$, it was always possible to factor it as $$\int \delta(g(\b{x})) f \frac{dg \^ \star \d g}{\| dg \|^2} = \int_{g =0} f [\star dg]/\|\del g \|^2$$, or to apply a delta identity to $$\delta(g(\b{x}))$$ to factor it first.

And, yeah, I suppose that works. I guess I prefer the new version because it boils the somewhat ad-hoc calculus of delta functions down into simpler objects, which better capture "what's really going on". But eh, if you don't like it, that's fine too. I am just enjoying seeing how it works (although I would be concerned if it led to any false conclusions---but I haven't found any yet).

---------

Okay, what about products of more than one implicit function?

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

We can also do Stokes' Theorem. We'll do the Divergence Theorem version of Stokes first because it is easiest to think about.


Suppose $$g(\b{x})$$ is a well-behaved implicit function which is positive on the interior of a closed region $$V$$. Write $$\b{n} = - \frac{\del g}{\| \del g \|}$$ for the outward-pointing normal vector of $$V$$. We can describe the $$3$$-surface $$V$$ by a step function $$\theta(g(\b{x}))$$

$$\theta(g(\b{x})) = \begin{cases} 1 & \b{x} \in V \\
0 & \text{ otherwise}\end{cases}$$

And we can describe the $$2$$-surface $$\p V$$ by its negative derivative

$$(-\del) \theta(g(\b{x})) = - (\del g) \delta(g(\b{x})) = \| \del g \| \b{n} \,  \delta(g(\b{x}))$$

The divergence theorem says

$$\int_{V} \del \cdot \b{F} \d V = \oint_{\p V} (\b{F} \cdot \b{n}) \d A$$

Where $$\b{F}$$ here is a vector field. Its divergence is $$d \b{F} = (\p_x F_{x} + \p_y F_{y} + \p_z F_{z}) d^3 \b{x} = (\del \cdot \b{F}) d^3 \b{x}$$.

Then

$$
\begin{aligned}
\int_{g > 0} (\del \cdot \b{F}) \d V &= \int_{\bb{R}^3} \theta(g(\b{x})) (\del \cdot \b{F}) \d^3 \b{x} \\
&= \cancel{\int_{\p \bb{R}^3} \del(\theta \b{F}) \d^3 \b{x}} - \int [\del \theta(g(\b{x}))] \cdot F \d^3 \b{x} \\
&= \int  \delta(g(\b{x})) [-\del g \cdot \b{F}] \frac{dg \^ \star dg}{\| \del g \|^2} \\
&=  \int 1_{g=0} (\b{n} \cdot \b{F}) \frac{dg \^ \star dg}{\| \del g \|^2} \\
&=  \int 1_{g=0} (\b{n} \cdot \b{F}) \; \widehat{dg} \^ \star \widehat{dg}\\
&= \oint_{g=0} (\b{n} \cdot \b{F} ) \; {\star \widehat{dg}} \\
\end{aligned}
$$

Which (as far as I can tell? this stuff is tricky) should be the correct area element on the surface. As always, not very helpful but I thought it was cool that it works. (I used the fact that integration by parts works with a scalar function times a vector field: $$G (\del \cdot F) = -\del G \cdot F$$ so long as $$\del(GF)$$ is zero at infinity, which it is because $$\theta(g) = 0$$ outside of $$V$$.)

That's the classical version. The exterior calculus version is somewhat more elegant. In this, we treat $$F$$ as a bivector field rather than a vector field, and we're trying to get

$$\int_{g > 0} dF = \int_{g =0} F$$

We can imagine expanding $$F$$ in a fictitious $$(g, u, v)$$ coordinate system that parameterizes the $$g> 0 $$ region, and regard $$F$$ as a bivector field $$F = F_{uv} d u \^ dv + F_{vg} d v \^ dg + F_{gu} d g \^ du$$. (If starting from a vector field, this is $$\star F$$.[^spherical]) So the divergence is:

[^spherical]: It is somewhat non-trivial to see how this corresponds to the usual definition of divergence in curved coordinates. The important bit is to note that by writing the vector field as a bivector field we've already picked up some extra factors. For instance, in spherical coordinates, we have $$d^3 \b{x} = r^2 \sin \theta \d r \^ d \theta \^ d\phi$$, and so $$F_{\theta \phi}$$ is given by $$\star F_r (\b{r}) = (r^2 \sin \theta) F_r$$. The total radial term ends up being $$\frac{1}{r^2 \sin \theta} \p_r [r^2 \sin \theta F_r] = \frac{1}{r^2} \p_r (r^2 F_r)$$.

$$dF = (\p_g F_{uv} + \p_u F_{vg}  + \p_v F_{gu}) (dg \^ du \^ dv)$$

The volume element $$d^3(g, u, v)$$ is not necessarily of magnitude $$1$$ in the ambient coordinates. Keeping track of all the "types" like this tells us exactly how to change coordinates if we need to.

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