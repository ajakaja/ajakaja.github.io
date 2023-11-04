---
layout: article
title: "Notes on Newton Iteration"
math: true
aside: true
footnotes: true
tag: math
---

re: [this paper](https://sci-hub.ru/https://doi.org/10.1137/S106482750037617X) which contains a section on [Newton-Raphson](https://en.wikipedia.org/wiki/Newton%27s_method) iteration.

Problem statement:

1. Given an implicit surface $$f(\b{x}) = 0$$,
2. Find the point on the surface which is closest to a particular lattice point $$\b{x}_0$$

As far as I can tell the algorithm in the paper is 2d and is using the symbol $$\b{k}$$ to refer to the $$\b{z}$$ axis. That's pretty confusing. In fact there is, I think, no reason the algorithm shouldn't work in 3d? 


First I thought I would try to write it out in a more cogent form.

# 0. Notations

Here I'm using two notations I like to clean things up:

The vector inverse is given by a vector over its magnitude squared:

$$\frac{1}{\b{v}} = \frac{\b{v}}{\| \b{v} \|^2}$$

Which can be used like this:

$$\frac{\b{a}}{\b{v}} = \frac{\b{a} \cdot \b{v}}{\| \b{v} \|^2}$$

The projection onto another vector is given by a subscripted "coordinate" for that vector:

$$\b{a}_{\b{b}} = [\b{a} \cdot \frac{\b{b}}{\| \b{b} \|} ]\frac{\b{b}}{\| \b{b} \|} = \frac{\b{a} \cdot \b{b}}{\b{b}}$$

------------

# 1. Newton iteration

Gotta remind myself how this works. The idea is that, at the point $$x_k$$, the linear approximation to $$f$$ is

$$f(x_k + \D x) \approx f(x_k) + f'(x_k) \D x + O(\D x^2)$$

The $$x$$-intercept of that linear approximation is:

$$\begin{aligned} 
0 &= f(x_k) + f'(x_k) (x - x_k) \\
x &= x_k - \frac{f(x_k)}{f'(x_k)}
\end{aligned}$$

And there's some proof that for well-behaved fns this is quadratically closer to the root, great. Sometimes it overshoots and sometimes it undershoots. You can tell which it's going to do by the relative signs of $$f(x_k)$$ and $$f''(x_k)$$: if they have the same sign, then you're going to undershoot the root; if they have opposite signs you're going to overshoot it. You could, in theory, use a quadratic approximation to constrain this. I worked it out on paper but it didn't seem very interesting.

Notably, though, you don't have to actually rescale by $$\frac{f(x_k)}{f'(x_k)}$$. It just tells you which direction to go. You could move by less than if you wanted and you'd still be going in the right way.

-------

# 2. Lagrange Multiplier stuff

Anyway, there should be $$\bb{R}^n$$ approximation to this. $$f(x)$$ is now $$f(\b{x})$$, a function $$\bb{R}^n \ra \bb{R}$$, and we want to find its closest zero to a point $$\b{x}_k$$. Call the actual zero $$\b{y}$$.

The gradient $$\del f(\b{x}_k)$$ is the orthogonal direction to the level sets at $$f(\b{x})$$ at the point $$\b{x}_k$$. This will get us closer to the implicit surface $$f(\b{x}) = 0$$ (maybe overshooting it, maybe not), but it won't actually get us closer to the _minimum_ point on the level set -- just to the level set at all.

The actual problem we're solving is


1. Minimize $$\| \b{x} - \b{x}_0 \|$$
2. Subject to the constraint $$f(\b{x}) = 0$$

Which is a Lagrange multiplier problem with Lagrangian:

$$L = \| \b{x} - \b{x}_0 \| - \lambda f(\b{x})$$

The solution is the choices $$(\b{x}, \lambda)$$ where

$$\begin{aligned}
0 = L_{\b{x}} &= \del  \| \b{x} - \b{x}_0 \| - \lambda \del f(\b{x}) \\
&= \del \sqrt{ \| \b{x} - \b{x}_0 \| ^2 } - \lambda \del f(\b{x}) \\
0 &= \frac{\b{x} - \b{x}_0}{\| \b{x} - \b{x}_0 \|} - \lambda \del f(\b{x}) \\
\end{aligned}$$

The denominator can be absorbed into $$\lambda$$, giving:

$$\b{x} - \b{x}_0 - \lambda \del f(\b{x}) = 0 $$

Which isn't very helpful. It just says what we already knew: that the vector $$\b{x} - \b{x}_0$$ ought to be parallel to $$\del f(\b{x})$$. 

We can simplify this into a constraint (by cross producing the equation with $$\del f(\b{x})$$):

$$\del f(\b{x}) \times (\b{x}_0 - \b{x}) = 0$$

--------

# 3 

Okay, now I'm trying to figure out what's going on in that second step of the Newton iteration in the paper.

The first step of Newton iteration only moved closer to the implicit surface, not closer to the zero on the surface. They need a second step (in 2d) that moves orthogonal to the first, to move towards a point of minimum distance. After all, the solution to the multiplier problem is a point at which 

To do this they are looking for roots of the function

$$g_2(t) = \b{k} \cdot [\del f(\b{x}_k) \times (\b{x}_0 - \b{x}_k - t (\b{k} \times \del f(\b{x}_k)))]$$

IMO the use of $$\b{k}$$ is unnecessary and only works in $$\bb{R}^2$$, because $$\b{k} \times (a,b, 0) = (0,0,1) \times (a,b,0) = (-b, a, 0)$$. I'll just write it like this: $$R \b{v} = \b{k} \times \b{v}$$.

The thing they're writing with a cross product can instead of written with a dot product, so that we don't have to use $$\b{k}$$ to extract a scalar afterwards: $$\b{k} \cdot (\b{u} \times \b{v})= (-R \b{u}) \cdot \b{v}$$. Proof: $$(u_x, u_y, 0) \times (v_x, v_y, 0) = (0, 0, u_x v_y - u_y v_x)$$, whereas $$(R\b{u}) \cdot \b{v} = (-u_y, u_x) \cdot (v_x, v_y) = - u_x v_y - u_y v_x$$.

So I would write this as 

$$g_2(t) = [- R \del f(\b{x})_k] \cdot [(\b{x}_0 - \b{x}_k) - t (R\del f(\b{x}_k))]$$

Which is, I think, a bit easier to make sense of. But I can't quite figure out why they chose _this_ equation. Wouldn't this have also worked using $$\| (\b{x}_0 - \b{x}_k) - t (R\del f(\b{x}_k)) \|^2$$? Why'd they pick this one?

The argument they give is: varying $$t$$ moves along the level set of $$f$$ (to first order) and gets you closer to the actual minimum value on the level set. Fair enough. Still, it seems like you should be able to do these two steps at once.

Also, it's not clear that two interleaved Newton iterators will actually converge to the right value, just because each one separately optimizes its individual value. Suppose $$\b{x}_k$$ was on the implicit surface $$f(\b{x}) = 0$$ but at a sharply curved point. Then the second "orthogonal" step could overshoot the root due to a second derivative, moving _off_ of the implicit surface, and then we'd have to move back onto it and potentially end up on the other side of the root and repeat the process.

I dunno, maybe there's a proof that the error is bounded quadratically or something, but... I'm skeptical. It seems like it would fail if the surface was the graph of $$y = x^2$$ if $$\b{x}_0 = (0 - \e, 1)$$ and $$\b{x}_k$$ was just to the right of $$(0, 0)$$, for instance $$(\e, \e^2)$$ --- it would fly off to the left, right?

Their Newton steps are given by:

$$\begin{aligned}
\b{x}_{k + 1/2} &= \b{x}_k - \frac{f(\b{x}_k)}{\del f(\b{x}_k)} \\
\b{x}_{k+1} &= \b{x}_{k + \frac{1}{2}} + [\b{x}_0 - \b{x}_k] - (\b{x}_0 - \b{x}_k)_{\del f(\b{x}_k)}
\end{aligned}
$$

So their Newton step is using:

$$\frac{g_2(t)}{g'_2(t)} = \frac{[R \del f(\b{x})_k] \cdot [(\b{x}_0 - \b{x}_k) - t (R\del f(\b{x}_k))]}{\| R \del f(\b{x})_k^2 \| } = \frac{[(\b{x}_0 - \b{x}_k) - t (R\del f(\b{x}_k))]}{R \del f(\b{x}_k)}$$

I _guess_ that they're treating $$t= 0$$ as the current point, giving (keep in mind the notation for vector division):

$$\frac{g_2(0)}{g'_2(0)}  =  \frac{\b{x}_0 - \b{x}_k }{R \del f(\b{x}_k)}$$

Is the paper wrong? or are we wrong?

Now I'm _really_ confused. If we directly apply this, the Newton step should be $$\b{x}_k -  \frac{\b{x}_0 - \b{x}_k }{R \del f(\b{x}_k)}$$

My first thought was the paper is wrong: they left the $$R$$ out. But now I'm not so sure! Because check this out:

$$\b{a}_{R \b{b}} = \b{a} - \b{a}_{\b{b}}$$

That is, the "rejection" of $$\b{b}$$ from $$\b{a}$$ is the same thing $$\b{a}$$ minus the _projection_ onto $$\b{b}$$. So what's happening is that they _didn't show a step_:

$$\frac{\b{x}_0 - \b{x}_k }{R \del f(\b{x}_k)} = (\b{x}_0 - \b{x}_k) - \frac{\b{x}_0 - \b{x}_k }{\del f(\b{x}_k)}$$

and _that's_ what's in the paper. **I think**. I'm pretty unsure of myself at this point.

So this is the actual iteration formula:

$$\begin{aligned}
\b{x}_{k + 1/2} &= \b{x}_k - \frac{f(\b{x}_k)}{\del f(\b{x}_k)} \\
\b{x}_{k+1} &= \b{x}_{k + \frac{1}{2}} - (\b{x}_0 - \b{x}_k)_{R \del f(\b{x}_k)}
&= \b{x}_{k + \frac{1}{2}} + [\b{x}_0 - \b{x}_k] - (\b{x}_0 - \b{x}_k)_{\del f(\b{x}_k)}
\end{aligned}
$$

Guess what? This equation should work in $$3d$$ also. Their $$g_2(t)$$ is bizarre and doesn't work in $$\bb{R}^3$$, but the iteration they got _does_ work in $$\bb{R}^3$$ also because it doesn't privilege $$\b{k}$$.

I'm pretty sure I can write down an equivalent $$g_2(t)$$ for 3d but need to think about it a bit. TODO for later.


--------

# 4 TODO: figure out how to actually do Newton iteration + constraint minimization at the same time.

Idea:

minimize a function that is only zero when $$\del f \times (\b{x} - \b{x}_0)$$ and $$f(\b{x}) = 0$$ _at the same time_. I guess that could be:

$$g(\b{x}) = \| f(\b{x}) \| + \| \del f \times (\b{x} - \b{x}_0) \|$$

That's pretty awkward. A better choice might be a function that has these two minimization problems as separate coordinates:

$$h(\b{x}) = (f(\b{x}, \| | \del f \times (\b{x} - \b{x}_0) \| \|))$$

That way there's no janky absolute values in the derivatives.. NB: $$h(\b{x})$$ lives in a weird space that's like $$\bb{R} \oplius \bb{R}$$, no relation to the $$\bb{R}^3$$ we're working in. 

There's probably a whole theory of multivariable optimization problems that is better at this though.

_presumably_ the two equations they're using to do two steps of iteration at once are really _one_ equation, projected onto two different bases. I want to figure out what the one equation is but GTG for now.

----------

# 5. TODO: figure out what the bicubic interpolation formula is and see if there's a closed form from the minimial surface that skips this step entirely.


