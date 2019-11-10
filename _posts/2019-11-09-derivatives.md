---
layout: blog
title: "A brief note about derivatives"
footnotes: true
math: true
aside: true
tags: notes
---

A [blog I follow](https://xorshammer.com) led me to a [paper](https://arxiv.org/pdf/1801.09553.pdf), "Extending the Algebraic Manipulability of Differentials", which makes a useful point about the notation we use for derivatives.  I'm repeating it here to remind myself of it.

(The paper itself has a bit of a sketchy pseudo-academic quality to it, spending a lot of time explaining things that every mathematician should know -- but a good point is a good point, and I like any effort to fix notation.)

Observation: the notation $$dx$$ used for derivatives is really $$d(x)$$, the derivative operator applied to a function (which happens to just be $$x$$). Therefore the notation $$\frac{d^2 f}{dx^2}$$ for a second derivative of a function should be understood as $$\frac{d(d(f))}{(dx)^2}$$.

 This is not new, but it's slightly more useful than I realized. For instance it determines when the plausible-seeming operation of treating derivatives as fractions is valid. $$\frac{d(y)}{dx} \frac{d(x)}{dy}$$ is cancellable _only_ if $$d(x) = dx$$ and $$d(y) = dy$$, which is only true if each are _single_-variable functions of the other.

<!--more-->

The second derivative version of this is to write $$\frac{d^2 y}{dx^2} $$ as $$\frac{d(dy/dx)}{dx} = \frac{d^2 y}{dx^2} -  \frac{dy}{dx} \frac{d^2 x}{dx^2}$$. (In this notation, note that $$\frac{d^2 x}{dx^2} = \frac{d(d(x))}{(dx)(dx)} \neq 0$$ if $$x$$ is a function of something else). This is useful because, among other things, it leads to the correct rule for calculating the 2nd-derivative version of the chain rule ([Faà di Bruno's formula](https://en.wikipedia.org/wiki/Fa%C3%A0_di_Bruno%27s_formula)) without much thought:

$$\begin{aligned}
\frac{df}{dt} &= \frac{f_x dx}{dt} = f_x \frac{dx}{dt} \\
\frac{d}{dt} \big( \frac{df}{dt} \big) &=  \frac{d (f_x dx)}{(dt)^2} \\
&= \frac{(f_x dx) dx + f_{x} d(d(x))}{(dt)^2} \\
&= f_{xx} \big( \frac{dx}{dt} \big)^2 + f_{x} \frac{d^2 x}{dt^2}
\end{aligned}$$

Seems useful.

The paper also uses this notation to show a succinct derivation of a formula for inverting second derivatives:

$$ - \frac{d^2 y}{dx^2} \big[ \frac{1}{dy/dx}\big]^3 = \frac{d^2 x}{dy^2}$$

The authors say that they and their reviewers initially thought this might have been a new discovery. In fact it can be found on [Wikipedia](https://en.wikipedia.org/wiki/Inverse_functions_and_differentiation), in the notation $$g''(x) = \frac{f''(g(x))}{[f'(g(x))]^3}$$. But they're not wrong that it's not well-known!

