---
layout: blog
title: "A brief note about derivatives"
footnotes: true
math: true
aside: true
tags: notes
---

A [blog post](https://xorshammer.com) led me to a [paper](https://arxiv.org/pdf/1801.09553.pdf), "Extending the Algebraic Manipulability of Differentials", which makes a useful point about the notation we use for derivatives. This is a brief summary so I don't forget it.

Observation: the derivative operator $$\frac{d}{dx}$$ can be decomposed into two steps: applying the differential operator $$d$$ to the target, _then_ dividing by $$dx$$. It is useful to think of this as occuring in two separate steps because it removes ambiguity in certain notations and allows algebraic manipulations like $$\frac{dy}{dx} \frac{dx}{dt} = \frac{dy}{dt}$$ to work on higher derivatives.

Being precise about what $$d$$ acts on, we compute the expansion of $$\frac{d^2 y}{dx^2}$$:

$$\frac{d^2 y}{dx^2} = \frac{d( y_x dx )}{dx^2} = \frac{ y_{xx} dx^2 + y_x d^2 x}{dx^2} = y_{xx} + y_x \frac{d^2 x}{dx^2} \tag{1}$$

<!--more-->

$$\frac{d^2 x}{dx^2}$$ isn't $$0$$ here. It's just the division of two objects, $$d^2 x = d(d(x))$$ and $$(dx)^2$$. Keeping it around allows chain rule-like algebraic manipulations to actually work on higher derivatives:

$$\frac{d^2 y}{dt^2} = \frac{d^2 y}{dx^2} \frac{dx^2}{dt^2}  = y_{xx} \frac{dx^2}{dt^2} + y_x \frac{d^2 x }{dt^2} $$

Seems useful. You can also just expand the numerator as $$d^2 y = d(dy) = d (y_x dx) = y_{xx} dx^2 + y_x d^2 x$$ to get the same result.

Compare (1) to $$(\frac{d}{dx})^2 y$$, which is the 'complete' second derivative, applying the derivative operator to the whole thing twice:

$$\begin{aligned}
(\frac{d}{dx})^2 y &= \frac{d(\frac{dy}{dx})}{dx} \\
&= \frac{\frac{d^2y}{dx} - dy \frac{d^2 x}{dx}}{dx} \\
&= \frac{d^2 y}{dx^2} - y_x \frac{d^2 x}{dx^2} \\
&=  [y_{xx} + y_x \frac{d^2 x}{dx^2}] - y_x \frac{d^2 x}{dx^2} \\
&= y_{xx}
\end{aligned}$$

Distinguishing between $$(\frac{d}{dx})^2 y $$ and $$\frac{d^2 y}{dx^2} $$ keeps you out of trouble here.

The paper also uses this notation to show a succinct derivation of a formula for inverting second derivatives (in slightly different notation):

$$ \frac{d^2 y}{dx^2} = - \frac{d^2 x}{dy^2} \big( \frac{dy}{dx} \big)^3$$

The authors say that they and their reviewers initially thought this might have been a new discovery. In fact it can be found on [Wikipedia](https://en.wikipedia.org/wiki/Inverse_functions_and_differentiation#Higher_derivatives), but it's definitely not that well-known! (Edit: they corrected themselves in a later version of the paper, I think, as it doesn't seem to say that anymore.)

