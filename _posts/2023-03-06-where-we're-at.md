---
layout: blog
title: "Exterior Algebra: Where we're at"
footnotes: true
math: true
---

We've quit another job. Now there's more time for writing, which is to say more time for trudging in the direction of spiritual fulfillment via mathematical clarity.

The main project, which I woke up with one day, has been to stare at all the concepts which are near the same orbit as the wedge product $$\^$$ and hope that they will one day make sense. So far I have just assumed this is possible. The approach which briefly worked a few years ago -- the last time I was underemployed -- was to try only to prove known formulas using this strange algebra, a task which one can actually make and show progress on, in hopes that it would illuminate things. It did illuminate a few things, to me at least, I guess.

At the time I wrote many words (many more than I've uploaded here), most of which embarrass me now, and which I've come to doubt the accuracy of either way. I am unfortunately not a very good mathematician, at least when it comes to proofs and rigor and whatnot. I just very much like understanding stuff, and it didn't seem possible to keep understanding the physics I want to know without understanding this math first.

So that's where we're at. I need to remember what I was working on, and what any of it meant, and probably take a step back and put it all in context because it's already way too much to handle. There is no way that the Gods of Math intended or required this many silly operations, with this many negative signs, to say what they wished. These will be obsolete at the end, somehow. What are we missing?

I'll try to revise what I've got to be a bit more usable to get back into things...

<!--more-->

---------

## The Story So Far

There is an algebra on basis vectors in a vector space which seems to bestow clarity on all kinds of otherwise opaque mathematics. We suspect it can be massaged to bestow much _more_ clarity than it already does, but we're not sure how to do it. We are also fighting through decades of notational and conceptual baggage that makes it harder to see clearly.

The basic operation is the wedge product, $$\^$$, which combines basis vectors together into new basis vectors. So $$\^ \bb{R}^3$$ is is a vector space consisting of all of the wedge products of stuff in $$\bb{R}^3$$:

$$\^ \bb{R}^3 = \span(1, \b{x}, \b{y}, \b{z}, \b{xy}, \b{yz}, \b{zx}, \b{xyz})$$ 

It is very handy for unifying things. In particular, a matrix on a vector space $$V$$ can operate on any of the basis multivectors as well; the components of its representation on the multivectors are given by its minors. The determinant $$\det M$$ is the action on the pseudoscalar space (e.g. $$\^^n \bb{R}^n$$).

Unfortunately the notation is a mistake: $$\^$$ should be written $$\v$$ for symmetry with lattice theory and boolean algebra, because is more of a 'union' $$\cup$$ than an 'intersection' $$\cap$$. **From now on I am going to switch the notations to be correct**. Perhaps I'll regret it later.

The other notational change that I'm already doing is omitting $$\^$$ (old), $$\v$$ (new), or $$\o$$ terms in between basis vectors, so $$\b{xy}$$ means $$\b{x \o y}$$ or $$\b{x \v y}$$ depending on the context. It really makes the formulas a lot more readable.

Anyeay there are [many more operations]({{ site.baseurl }}{% post_url 2020-10-15-ea-operations %}), which I will quickly list here. We'll recap $$\v$$ first so that the list has everything.

-----

## All the operations, recapped in the new notation

$$\v$$ is the **wedge product**, also called the 'join', 'progressive product', or 'exterior product', now written $$\v$$ instead of $$\^$$. It 'adds' lists of basis vectors: up to a sign, you can think of it as just appending lists of vectors together, e.g. $$(\b{x}) \v (\b{y}) = (\b{x}, \b{y})$$. But if two of the basis vectors are the same, the result is $$0$$: $$\b{x} \v \b{x} = 0$$.

$$\alpha \cdot \beta$$ when used on two terms of equal grades is the **inner product**. We _define_ the inner product (and the interior product) such that e.g. $$\b{xy} \cdot \b{xy} = 1$$, that is, all basis multivectors have unit magnitude. Some sources which treat basis multivectors as "actually being antisymmetrized tensors", e.g. $$\b{xy} \rightarrow \b{x \o y} - \b{y \o x}$$, which would imply they have magnitude $$n!$$ in the tensor algebra, but I don't like that.

$$\alpha \cdot \beta$$ when used on two terms of _different_ grades is **interior product**, also written $$\iota_{\alpha} \beta$$. It 'subtracts' lists of basis vectors. We'd write $$\b{x} \cdot (\b{xy}) = \b{y}$$ but you should think of it is $$(\b{x}, \b{y}) - (\b{x}) = (\b{y})$$. Its notation is quite awkward because it's not symmetric: most sources expect the left term to be lower grade than the right, but you can easily define it the opposite way and some people also do that. What we would really like is a symmetric version -- maybe that can be figured out later.

$$\omega$$ is a symbol used generically to refer to the oriented pseudoscalar in whatever space we're in. There's always different ways to choose this but by default we assume it's the basis vectors in lexicographic order, e.g. $$\omega = \b{xyz}$$ in $$\bb{R}^3$$.

$$\star$$ is the **Hodge Star** operation, which gives the 'dual' multivector for a multivector. This is really just the interior product with $$\omega$$: $$\star \alpha = \alpha \cdot \omega$$.

$$\^$$ is the **meet**, the 'dual' to the wedge product under the duality of $$\star$$. That literally means $$ \star \alpha \^ \star \beta = \star(\alpha \v \beta)$$ but who wants to work that out. It is very unintuitive: it takes the basis vectors _missing_ from both arguments and joins them together. For instance $$\b{xy} \^ \b{yz} = \star(\b{z} \v \b{x}) = \b{y}$$, but $$\b{x} \^ \b{y} = \star(\b{yz} \v \b{zx}) = \star 0= 0$$.

There is a way to make smaller 'internal' exterior algebras inside of larger ones. We can think of an exterior algebra with all of the above operations as being defined by a vector space $$V$$, a 'bottom' element $$1$$, a 'top' element $$\omega$$, a 'join' operation $$\v$$, and a 'meet' operation $$\^$$, so the standard exterior algebra on $$V$$ is $$V, \v, \^, 1, \omega$$. There is a way to define "relative" operations of $$\v_{\nu}$$ and $$\^_{\mu}$$ which only operate on the parts of their arguments that aren't $$\nu$$ or $$\mu$$. Then $$(V, \nu, \mu, \v_{\nu}, \^_{\mu}$$ defines an exterior algebra as well, which only contains elements that contain $$\nu$$ and are contained in $$\mu$$.. The 'standard' exterior algebra is then given by $$(V, 1, \omega, \v_1, \^_\omega)$$.

I don't want to list any of the weird operations of geometric algebra here because they feel unaesthetic which means they're probably not going to stick around.

There are some other hacky operations which _are_ going to stick around, involving contraction and tracing. There's clearly a use for some kind of 'partial interior product' between two multivectors, eg. $$(\b{xy}) \cdot_1 \b{xy}) = -\b{x \o x} - \b{y \o y}$$, because it allows implementation of rotation matrices via exterior products, but I'm not sure how to make it elegant yet. And there is also this 'coproduct slice' operation that interchanges wedge and tensor products: $$\p_{2,1} (\b{x \^ y \^ z}) = (\b{x \^ y}) \o \b{z} + (\b{y \^ z}) \o \b{x} + (\b{z \^ x}) \o \b{y}$$. See also the [Jacobi Identity](https://en.wikipedia.org/wiki/Jacobi_identity): $$\b{a} \cdot (\b{b \v c}) + \b{c} \cdot (\b{a \v b}) + \b{b} \cdot (\b{c \v a}) = 0$$. Between these there's clearly a need to make the wedge and tensor products 'play well' together, but I'm not sure how these pieces fit well yet.

------

## Where to go

I have a bunch of draft articles that summarize more stuff that was interesting, which I'd like to finish, but it really feels like there's some big thing hiding here in plain sight that I haven't been able to see yet. Why does it keep feeling like $$\b{x \v x}$$ should not equal $$0$$? Or that you should have negative wedge powers? Is that the same thing as vector space duality? And, is this just one among many types of non-commutative algebra, and the whole problem should really be solved in generality? Maybe that lets it involve exterior derivatives correctly. And what's the relationship to graded algebras and superalgebras? Why is geometric algebra so awkward, yet able to be associative, while these are not?

I hope to report on anything I discover towards those questions, but no promises. I'm not particulary good at this. Just rather dedicated, and newly in possession of a lot of free time.