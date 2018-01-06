---
layout: article
title: "Integration by Differentiation"
math: true
footnotes: true
category: notes
---

I found this [paper](https://arxiv.org/pdf/1610.09702.pdf), entitled "Integration by differentiation: new proofs, methods and examples", by Jia, Tang, and Kempf.

They present new formulas for solving integrals by converting them into curious functions of partial derivative operators: $$f(\partial_{x})$$, that sort of thing. For exmaple:

$$\int_{0}^{\infty} f(x) dx = \lim_{y \rightarrow 0^{+}} f(-\partial_{y}) \frac{1}{y}$$

And this form of the Laplace transform:

$$\mathcal{L}(f)(y) = \int_{0}^{\infty} f(x)e^{xy} dx = f(-\partial_{y}) \frac{1}{y}$$

Or the Fourier transform:

$$\mathcal{F}(f)(y) = \int_{-\infty}^{\infty} f(x)e^{ixy} dx = 2 \pi f(-i \partial_{y}) \delta(y)$$

And despite their explanation it still baffles me that $$f(\partial_{y})$$ means... anything useful to solving integrals. So I went looking for an explanation and I think I found one. It seems to be a method of solving integrals that involves only rote mechanical procedures? And it works on the examples I've tried (though sometimes you end up with a Taylor series and you have to figure out how to turn it back into a known function...).

## A Method

(That I haven't seen before, except in that paper, but this is a very different explanation of why it works...)

Let $$\partial = \partial_{x}$$ unless otherwise specified.

Let $$\partial^{-1} f = \int_{0}^{x} f(y) dy$$ be the antiderivation operator. So:

$$\partial^{-1} \frac{x^{n}}{n!} = \frac{x^{n+1}}{(n+1)!}$$

This obviously inverts $$\partial$$, since $$\partial \frac{x^{n+1}}{(n+1)!} = \frac{x^{n}}{n!}$$.

Let's refer to series of polynomials this creates (the Taylor series terms of $$e^{x}$$), as $$a_{n}$$:

$$a_{n} = \frac{x^{n}}{n!} = \partial^{-n} 1$$

Clearly:

$$\partial a_{n} = a_{n-1}$$

$$\partial^{-1} a_{n} = a_{n+1}$$

And let's talk about a function $$f(x)$$ that by assumption has a Taylor series:

$$\sum f_{n} \frac{x^{k}}{k!} = \sum f_{n}a_{n}$$

Therefore, up to a constant of integration:

$$\int_{0}^{x} f(y) dy = \partial^{-1} f(x) = \sum f_{n}a_{n+1}$$

A weird idea: we can think of a function $$f$$ as an operator, like this:

$$f(x) = (\sum f_{n} \partial^{-n}) 1$$

And (up to a constant)

$$\int_{0}^{x} f(y) dy = \partial^{-1} f(x) = (\sum f_{n} \partial^{-(n+1)}) 1$$

-----

The derivative $$\partial$$ and integration $$\partial^{-1}$$ operators flip roles when acting on $$\frac{1}{x}$$ with an extra negative sign:

$$(-\partial)^{n} \frac{1}{x} = \frac{n!}{x^{n+1}}$$

and (if $$n > 0$$):

$$(-\partial)^{-1} \frac{n!}{x^{n}} = \frac{(n-1)!}{x^{n}}$$

Let's label these similar to how we did. for $$a_{n}$$, as:

$$b_{n} = \frac{n!}{x^{n+1}} = \partial^{n}\frac{1}{x}$$

Clearly we have:

$$b_{n} = \frac{1}{a_{n}} \frac{1}{x}$$

So, if we want to integrate a function easily, how about we find a way to invert the operator so that $$\partial_{-x} \leftrightarrow (-\partial_{x})$$? Derivative operators, after all, are easy to apply symbolically. Our goal is compute $$\partial^{-1}f = \sum f_{n} \frac{x^{n+1}}{(n+1)!}$$. 

If we write $$f(x)$$ in a different 'basis':

$$f(-\partial) \frac{1}{x} = (\sum f_{n} \frac{(-\partial)^{n}}{n!} ) \frac{1}{x} = (\sum \frac{f_{n}}{n!} \frac{n!}{x^{n}}) \frac{1}{x} = \sum f_{n} \frac{1}{x^{n}} \frac{1}{x} = F(x) \frac{1}{x}$$

then our new goal is, instead of $$\frac{x^{n}}{n!} \rightarrow \frac{x^{n+1}}{(n+1)}!$$, to just take $$\frac{1}{x^{n}} \rightarrow \frac{1}{x^{n+1}}$$, which is already done. it's just $$\frac{F(x)}{x}$$. Now if we can invert this transformation, we're done.

(We think of $$F(x)$$ as '$$f(x)$$ written in a different basis', where functions-as-operators act on $$\frac{1}{x}$$ instead of $$1$$. According to that paper above it's just the Laplace transform. But this is a very different view of it?)

------

Let's label:

$$G(x) = \frac{F(x)}{x} = f(-\partial) \frac{1}{x}$$

How do we convert $$x^{-k} \rightarrow a_{k} = \frac{x^{k}}{k!}$$? By substituting $$\partial^{-1}$$ back in, like we did up above.

$$G(\partial) 1 = (\sum f_{n} \partial^{-(n+1)}) 1 = \sum f_{n} \frac{x^{n+1}}{(n+1)!} = \int_{0}^{x} f(y) dy$$

## Examples

**1**

A super simple one:

$$f(x) = 2x^{2} + 1$$

$$\int_{0}^{x} f(y) dy = ??$$

$$G(x) = f(-\partial) \frac{1}{x} = (2\partial^{2} + 1) \frac{1}{x} $$

$$G(x) = \frac{4}{x^{3}} + \frac{1}{x}$$

$$G(\partial) = (4 \partial^{-3} + \partial^{-1}) 1 = \frac{2}{3} x^{3} + x = \int_{0}^{x} f(y) dy \checkmark$$

**2**

A more complicated one:

$$f(x) = \frac{1}{x^{2} + 1}$$

Trying to solve $$\int_{0}^{x} f(y) dy$$:

$$G(x) = f(-\partial) \frac{1}{x} = \frac{1}{\partial^{2} + 1} \frac{1}{x}$$

What does that equal? Well, I have no idea how to invert that operator correctly, but what if we try to use the Taylor series for $$\frac{1}{1 + x}$$?

$$= 1 - \partial^{2} + \partial^{4} - \ldots = \sum (-\partial^{2})^{n} \frac{1}{x}$$

$$G(x) = \sum (-1)^{n}\frac{(2n)!}{x^{2n+1}}$$

$$G(\partial) = (\sum (-1)^{n} \frac{(2n)!}{\partial^{2n+1}}) 1 $$

$$= \sum (-1)^{n} \frac{(2n)!}{(2n+1)!} x^{2n+1} = \sum (-1)^{n} \frac{x^{2n+1}}{2n+1} = x - \frac{x^{3}}{3} + \frac{x^{3}}{5} + \ldots$$

$$ = \tan(x)$$

(If you happen to know the Taylor series for $$\tan x$$... it's that.)

---------

**Commentary**

Okay, 1) this isn't that interesting, we're just manipulating Taylor series, and 2) we totally cheated with our method of inverting $$\frac{1}{\partial^{2} + 1}$$, right?

1. Agreed.

2. BUT: we can do a better job of inverting a derivative operator using Green's functions, like they do in the paper, and then it's a lot more legitimate.

	1. Don't believe me? Well, instead of doing all of it acting on $$\frac{1}{x}$$, do $$G(x) = \frac{1}{x} f(-\partial) \delta(x)$$. It's the same result, except that everything has a factor of $$\delta(x)$$ in it, but now you're calculating terms like $$\frac{1}{\partial^{2} + 1} \delta(x)$$ which is the definition of a Green's function. And all the derivatives are the same... $$\partial^{n} \delta(x) = b_{n-1}\delta(x)$$. More or less. At least when it's applicable.

	2. I like this version better because it doesn't feel quite so much like it requires the things $$\delta(x)$$ requires. It's 'pure' series manipulation, but if you had a way to invert a differential operator, it's way *easier*.

3. I have no idea if that infinite series rep is right. Oh well. We can still reduce solving integrals of functions to inverting differential operators, which... might... be easier? And, hell, it might work in the other direction to solve differential equations too.

4. Note that any terms of $$e^{a\partial} \frac{1}{x}$$ that show up, or any trig functions, are trivial: $$e^{a \partial} \frac{1}{x} = \frac{1}{x+a}$$.

**TODO**: consider Fourier, reread that paper to get the analytic ideas, etc

Anyway, it's fascinating.
