---
layout: article
title: "The Reverse Triangle Inequality"
footnotes: true
math: true
---

The [triangle inequality](https://en.wikipedia.org/wiki/Triangle_inequality) for a vector space says that for vectors $$u, v$$:

$$\Vert u + v \Vert \leq \Vert u \Vert + \Vert v \Vert$$

Which, in the simplest case of a literal triangle, just says that the length of each side is less than the length of the other two, added. In the more general case of a metric space, which doesn't have (necessarily) a concept of 'vectors' but still has 'distances between points', this is:

$$d(x,z) \leq d(x,y) + d(y,z)$$

-------

This always comes packaged with the [Reverse triangle inequality](https://en.wikipedia.org/wiki/Triangle_inequality#Reverse_triangle_inequality), which flips things around:

$$ \Vert u - v \Vert \geq \big| \Vert u \Vert - \Vert v \Vert \big|$$

That is: the length of each side of a triangle is _greater than_ the difference of the lengths of the other two sides.

Or for metric spaces:

$$d(y,z) \geq | d(y,x) - d(x,z) |$$

And despite being both of the reverse versions being almost trivial to derive, I find them surprisingly unintuitive. Why does the vector version involve vector subtraction, but the metric one doesnt't!? Why is there an absolute value?

I don't like when basic facts are unintuitive. It virtually guarantees that more complicated ones will be. So, here aresome notes on this one.

<!--more-->

## 1. Proof

For the three vectors $$(u, v, u+v)$$ we actually get three triangle inequalities, by comparing each side to the other two:[^norm]

[^norm]: Forgive me for not using $$\Vert u \Vert$$ for the rest of the vector norms. I prefer $$\|$$. $$\Vert$$ is useful when you're taking absolute values and norms in the same line, though.

$$\begin{aligned}
| u + v | &\leq | u | + | v | \\
| u | &\leq | v | + | u + v | \\
| v | &\leq | u | + | u + v |
\end{aligned}$$

But for some reason let's instead consider the same three statements for the triangle formed by $$(u, -v, u - v)$$:

$$\begin{aligned}
| u - v | &\leq | u | + | {-v} | \\
| u | &\leq | {-v} | + | u - v | \\
| {-v} | &\leq | u | + | u - v |
\end{aligned}$$

The second and third rearrange into the two sides of the absolute value:

$$\begin{aligned}
|u|-|v| &\leq | u - v | \\
|v|-|u| &\leq | u - v |
\end{aligned}$$

Which combine to form the result.

----------

But... there's no reason that the concept of 'vector subtraction' should exist on an arbitrary metric space, so how does this convert to $$d(y,z) \geq \| d(x,y) - d(x,z)\|$$ and the like? For $$(x,y,z)$$ in a metric space, there are again actually three triangle inequalities:

$$\begin{aligned}
d(x,z) &\leq d(x,y) + d(y,z) \\
d(x,y) &\leq d(x,z) + d(z,y) \\
d(y,z) &\leq d(y,x) + d(x,z)
\end{aligned}$$

The first two rearrange into:

$$\begin{aligned}
d(x,z) - d(x,y) &\leq d(y,z) \\
d(x,y) - d(x,z) &\leq d(z,y) \\
\end{aligned}$$

Which combine into:

$$d(y,z) \geq | d(x,z) - d(x,y)) |$$

## Discussion: Naturalness

The metric version's derivation still looks different from the vector one. Why does the vector _difference_ $$\| u - v \|$$ enter at all into the vector version? 

I think the metric space version is the _real_ 'reverse triangle inequality', and the vector identity that people write down is a separate identity entirely, and calling it the same thing is silly.

The _equivalent_ statement for the vectors would be mapping terms like this:

$$(|u|, |u+v|, |v|) \mapsto (d(x,y), d(y,z), d(x,z))$$

Making:

$$|u+v| \geq  \big| |u| - |v| \big|$$

Which is maybe what we expect without the surprise vector subtraction $$u-v$$:

$$\begin{aligned} 
|u + v| &\geq |v| - |u| \\
|u + v| &\geq |u| - |v|
\end{aligned}$$

So why does $$u-v$$ ever get involved?

A: I don't know. Since $$u,v$$ are arbitrary, $$u-v$$ and $$u+v$$ are the same expression up to redefined with $$v\mapsto -v$$. It just should just be written in terms of $$u+v$$ in the first place.


## Mention: Quasimetrics

It is possible to define a concept that works like a metric but is _not_ symmetric, so $$d(x,y) \neq d(y,x)$$. This is called a **quasiametric**, a "metric on a non-directed graph" -- ie, edges can have different costs going each direction. 

An example from Wikipedia is the graph of the amount of time it takes to walk somewhere, including the fact that it's faster to go downhill than up.

But even if we're not interested in quasi-metric spaces, it can be instructive to be forced to keep track what 'directions' our measurements go; maybe it will reveal some geometric intuition.

This means the axioms of a quasimetric are:

$$\begin{aligned}
d(x,y) &\geq 0 \\
d(x,y) &= 0 \Lra x = y \\
d(x,z) &\leq d(x,y) + d(y,z)
\end{aligned}$$

So the triangle inequality remains, but now we have to be careful to distinguish between $$d(x,y)$$ and $$d(y,x)$$. The reverse inequality still holds, but I have to be more careful with the ordering of arguments:

$$\begin{aligned}
d(x,y) &\leq d(x,z) + d(z,y) \\
d(y,z) &\leq d(y,x) + d(x,z) \\
d(z,x) &\leq d(z,y) + d(y,x) \\
&\\
d(x,z) &\leq d(x,y) + d(y,z) \\
d(z,y) &\leq d(z,x) + d(x,y) \\
d(y,x) &\leq d(y,z) + d(z,x) \\

\end{aligned}$$

Which is a lot. Group the inequalities that include any one term to get something like:

$$\begin{aligned}
d(x,y) &\leq d(x,z) + d(z,y) \\
&\geq d(x,z) - d(y,z) \\
&\geq d(z,y) - d(z,x)
\end{aligned}$$

But now we can't join the second and third into one inequality, because the arguments are switched!

There is a bit of interesting symmetry here:

$$d_{xz} - d_{yz} \leq d_{xy} \leq d_{xz} + d_{zy}$$

## Mention: Ternary relations

I think the triangle inequalities are confusingly written because, fundamentally, they are a relation between three values that is symmetric under any permutation of the values, but our inequality operator only lets us write a relation between _two_ sides, so we can't write it down in a completely symmetric away. Evidently the 'true' triangle inequality is a ternary operator:

$$T(a,b,c) \equiv R(a,b,c) \And R(c,a,b) \And R(b, c, a)$$

And it's worth noting that it is entirely possible for a set of three values to obey $$R(a,b,c)$$ but _not_ $$R(c,a,b,)$$ or $$R(b,c,a)$$. Just think of three side lengths that can't make a triangle, like $$(1,2,4)$$. 

Or, put another way: if you pick $$(a, b) \geq 0$$ arbitrarily, then the allowed values of $$c$$ to make a triangle are:

$$| a - b | \leq c \leq a + b$$

(Which basically says: the shortest and longest $$c$$'s come from making $$a$$ and $$b$$ parallel or antiparallel, and everything else falls somewhere in-between.)

One way to make this more a bit symmetric is to square both sides and then move a few terms:

$$-2ab  \leq c^2 - a^2 - b^2 \leq 2 ab$$

I guess if we really wanted symmetry we could always write it as a completely-symmetric multiplication of step functions:

$$\mu_{c - b - a} \cdot \mu_{b - a - c} \cdot \mu_{a - c - b} > 0$$

But that doesn't feel much better. Feels like something is missing.

If we want to write a triangle as three vectors, we get a fully-symmetric equation for free:

$$a + b + c = 0$$

(So the triangle from earlier is actually $$(u, v, -u-v)$$.)

This means that:

$$|a+b+c|^2 = |a|^2 + |b|^2 + |c|^2 + 2(a\cdot b + b\cdot c + c \cdot a) = 0$$

Evidently $$a\cdot b + b\cdot c + c \cdot a$$ is negative and cancels out the sum of the squared side lengths.


## Afterthought

I know I'm not arguing with anyone about this. Anyone who knows the triangle inequality knows or can immediately derive the reverse version. It's just that the form it's presented in (say) what I was reading earlier today is not useful to me.

