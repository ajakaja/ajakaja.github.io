---
layout: blog
title: "A brief note about derivatives"
footnotes: true
math: true
aside: true
tags: notes
---

A [blog post](https://xorshammer.com) led me to a [paper](https://arxiv.org/pdf/1801.09553.pdf), "Extending the Algebraic Manipulability of Differentials", which makes a useful point about the notation we use for derivatives. This is a brief summary so I don't forget it.[^sketch]

[^sketch]: The paper itself has a bit of a sketchy pseudo-academic quality to it, spending a lot of time explaining things that every mathematician should know -- but a good point is a good point, and I like any effort to improve notation.

Observation: the derivative operator $$\frac{d}{dx}$$ can be decomposed into two steps: applying the differential operator $$d$$ to the target, then dividing by $$dx$$. It is useful to think of this as occuring in two steps, because it removes confusion in certain notations. Particularly, we will identify these two ways of writing the second derivative as meaning slightly different things:[^exterior]

[^exterior]: note that this is not the same use of $$d$$ as is used in exterior algebra, with $$d^2 = 0$$. That one requires additionally quotienting by relations like $$dx dy \sim dy dx$$.

$$(\frac{d}{dx})^2 y = \frac{d}{dx} (\frac{dy}{dx})= \frac{d^2 y}{dx^2} -  \frac{dy}{dx} \frac{d^2 x}{dx^2}$$

vs

$$\frac{d^2 y}{dx^2} = \frac{d( y_x dx )}{dx^2} = \frac{ y_{xx} dx^2 + y_x d^2 x}{dx^2} = y_{xx} + y_x \frac{d^2 x}{dx^2}$$

<!--more-->

In this notation $$(\frac{d}{dx})^2 y$$ is not the same thing as $$\frac{d^2 y}{dx^2}$$, so $$\frac{d^2 x}{dx^2}$$ is not necesarily equal to $$0$$. We find by substituting the second into the first that $$\frac{d(dy/dx)}{dx} = y_{xx}$$, as expected. In general $$\frac{d^2 y}{dx^2} = y_{xx}$$ may not be true if $$x$$ is a function of another variable $$x(t)$$, because then $$\frac{d^2 x}{dx^2} = \frac{x_{tt} dt^2 + x_t d^2 t}{dx^2}$$.

Why bother with this? Because it lets expression with higher derivatives be manipulated algebraically without going astray. Here is the second-derivative version of the chain rule ([Faà di Bruno's formula](https://en.wikipedia.org/wiki/Fa%C3%A0_di_Bruno%27s_formula)) without much thought:

$$\begin{aligned}
\frac{d}{dt} \big( \frac{df}{dt} \big) &=  \frac{d (f_x dx)}{(dt)^2} \\
&= \frac{(f_{xx} dx) dx + f_{x} d(d(x))}{(dt)^2} \\
&= f_{xx} \big( \frac{dx}{dt} \big)^2 + f_{x} (\frac{d^2 x}{dt^2})
\end{aligned}$$

Seems useful. The paper also uses this notation to show a succinct derivation of a formula for inverting second derivatives (in slightly different notation):

$$ \frac{d^2 y}{dx^2} = - \frac{d^2 x}{dy^2} \big( \frac{dy}{dx} \big)^3$$

The authors say that they and their reviewers initially thought this might have been a new discovery. In fact it can be found on [Wikipedia](https://en.wikipedia.org/wiki/Inverse_functions_and_differentiation#Higher_derivatives), but it's definitely not that well-known!

