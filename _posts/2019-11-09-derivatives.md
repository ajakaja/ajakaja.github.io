---
layout: blog
title: "A brief note about derivatives"
footnotes: true
math: true
aside: true
tags: notes
---

A [blog post](https://xorshammer.com) led me to a [paper](https://arxiv.org/pdf/1801.09553.pdf), "Extending the Algebraic Manipulability of Differentials", which makes a useful point about the notation we use for derivatives. This is a brief summary so I don't forget it.

(The paper itself has a bit of a sketchy pseudo-academic quality to it, spending a lot of time explaining things that every mathematician should know -- but a good point is a good point, and I like any effort to improve notation.)

Observation: the notation $$df$$ used for derivatives is really $$d(f)$$, the derivative operator applied to a function. We can interpret the _derivative_ operator $$\frac{d}{dx}$$ as two steps: applying $$d$$ and dividing by $$d(x)$$. In this notation, expressions like $$\frac{d(x)}{dx} = \frac{x_t dt}{dx} \neq 1$$ make sense. The product rule for derivatives applies to differentials as well, so $$d(x dx) = (dx)^2 = (d(x))^2 + x d(d(x)) = dx^2 + x d^2x$$.[^exterior]

<!--more-->

[^exterior]: note that this is not the same use of $$d$$ as is used in exterior algebra, with $$d^2 = 0$$. That requires additionally quotienting by relations like $$dx dy \sim dy dx$$.

This is only a slight change of notation, but it's more useful than I realized. For instance the meticulous notation for a second derivative is $$\frac{d^2 y}{dx^2} = \frac{d(dy/dx)}{dx} = \frac{d^2 y}{dx^2} -  \frac{dy}{dx} \frac{d^2 x}{dx^2}$$. (Keep in mind that $$\frac{d^2 x}{dx^2} \neq 0$$ here if $$x$$ is a function of something else.) Among other things, this leads to the correct rule for calculating the 2nd-derivative version of the chain rule ([Faà di Bruno's formula](https://en.wikipedia.org/wiki/Fa%C3%A0_di_Bruno%27s_formula)) without much thought:

$$\begin{aligned}
\frac{df}{dt} &= \frac{f_x dx}{dt} = f_x \frac{dx}{dt} \\
\frac{d}{dt} \big( \frac{df}{dt} \big) &=  \frac{d (f_x dx)}{(dt)^2} \\
&= \frac{(f_x dx) dx + f_{x} d(d(x))}{(dt)^2} \\
&= f_{xx} \big( \frac{dx}{dt} \big)^2 + f_{x} \frac{d^2 x}{dt^2}
\end{aligned}$$

Seems useful.

The paper also uses this notation to show a succinct derivation of a formula for inverting second derivatives (in slightly different notation):

$$ \frac{d^2 y}{dx^2} = - \frac{d^2 x}{dy^2} \big( \frac{dy}{dx} \big)^3$$

The authors say that they and their reviewers initially thought this might have been a new discovery. In fact it can be found on [Wikipedia](https://en.wikipedia.org/wiki/Inverse_functions_and_differentiation#Higher_derivatives). But it's definitely not that well-known!

