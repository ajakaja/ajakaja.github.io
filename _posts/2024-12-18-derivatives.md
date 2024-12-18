---
layout: blog
title: "The Triple Product Rule and Dual Bases"
footnotes: true
math: true
aside: true
tags: notes
---

The other day I came back across [this](https://johncarlosbaez.wordpress.com/2021/09/13/the-cyclic-identity-for-partial-derivatives/) article by John Baez, about the following counterintuitive partial derivative identity for a function $$u(v,w)$$:

$$
\begin{aligned}
(\frac{\p u}{\p v} \|_w) (\frac{\p v}{\p w} \|_u) (\frac{\p w}{\p u} \|_v) = -1
\end{aligned}
$$

(which can be found on Wikipedia under the name [Triple Product Rule](https://en.wikipedia.org/wiki/Triple_product_rule)).

The main reason to care about this, besides that it's sometimes useful for calculating things, is that it seems a bit perplexing that the minus sign is there. Shouldn't these fractions "sorta" cancel? Yes, we all know that derivatives aren't really fractions, but they definitely act like fractions more often than they _don't_ act like fractions, and it's odd that in this case they're so very much not like fractions. We'd like to repair our intuition somehow.

Although Baez's article does explain this identity in a few different ways, there's still something puzzling about it. It's always perturbing to me when there's some fact of basic calculus which is not an artifact of our formalism but nevertheless does not immediately correspond to intuition. So this time I thought I would try to get to the bottom of things. 

<!--more-->

----------

# 1. A Proof

For brevity from now I'm going to omit the constant $$\|_w$$ symbol because of course it's constant---that's how partial derivatives usually work---and I'm going to write $$u_v$$ for $$\p u / \p v$$. So what we are looking for is the intuition behind

$$(u_v)(v_w)(w_u) = -1$$

The easiest way to see that it's true, IMO, is not any of the pseudo-proofs in Baez's article. Instead it's as follows---also a pseudo-proof, but simpler, I think.

If $$u$$ is a function of $$v$$ and $$w$$ then we can write out the relationship between the three values as some function $$f$$, where $$u$$ is the $$u$$ "variable" and $$U$$ is the functional relationship that produces it from $$v$$ and $$w$$:

$$f(u,v,w) = u - U(v, w) = 0$$

This implicit function holds for all valid values of $$(u,v,w)$$, meaning that in general the three variables form an implicit $$2$$-surface in $$\bb{R}^3$$ (we won't think about degeneracies or singularities in this discussion).

The differential $$df$$ is

$$df = f_u du + f_v dv + f_w dw = 0$$

$$df$$ tells us how $$f$$ changes as we vary $$(u,v,w)$$, but in order for the relationship between them to keep holding, it's required that $$f$$ does _not_ change. We can rearrange this and solve for, say, $$du$$ (let's assume that $$f_u$$, $$f_v$$, and $$f_w$$ are $$\neq 0$$. If say $$f_u$$ is zero then we cannot solve for $$du$$ at that point, and changing $$u$$ doesn't affect the values of $$v$$ or $$w$$ at that point.):

$$
\begin{aligned}
du &= - \frac{f_v}{f_u} dv - \frac{f_w}{f_u} dw \\
\end{aligned}
$$

This tells us how the constraint $$f(u,v,w) = 0$$ requires $$u$$ to change as we vary $$v$$ and $$w$$. It's ultimately where the minus signs come from, so it's _not_ from some relationship between generic partial derivatives: it comes from the constraint between them. 

Those coefficients are just the values of $$\p u / \p v$$ and $$\p u / \p w$$:

$$
\begin{aligned}
du &= u_v dv + u_w dw \\
&= (- \frac{f_v}{f_u}) dv + (- \frac{f_w}{f_u}) dw
\end{aligned}
$$

Hence $$u_v = -f_v/f_u$$ and $$u_w = -f_w/f_u$$. Similar arguments find that $$v_w = - f_w / f_u$$ and $$w_u = -f_u/f_w$$ (so yes, it turns out that $$u_w = 1/w_u$$), which gives

$$
\begin{aligned}
(u_v) (v_w) (w_u) &= (- \frac{f_v}{f_u}) (- \frac{f_w}{f_u}) (- \frac{f_u}{f_w}) \\
&= (-1)^3 (\cancel{\frac{f_v}{f_v}}) (\cancel{\frac{f_w}{f_w}}) (\cancel{\frac{f_u}{f_u}}) \\
&= -1
\end{aligned}
$$

Where now that everything is a fraction it's very clear that you can cancel all the terms out (all of this is still assuming that the $$f_u$$, $$f_v$$ and $$f_w$$ are $$\neq 0$$, of course).

So that's pretty simple, I think. I like this explanation because it seems to involve exactly as much machinery as is required and no more;. As much as I love wedge products, the wedge-product-based approach in Baez's article seems like overkill to me. But anyway, there is more to say, because it's still not that obvious what is going on.

----------

Before we go on, just for fun, here's how you extend this identity to more variables. Suppose there are $$4$$ variables which are interrelated, so $$f(u,v,w,x) = 0$$. Then 

$$df = f_u du + f_v dv + f_w dw + f_x dx = 0$$

and

$$du = -\frac{f_v}{f_u} dv - \frac{f_w}{f_u} dw - \frac{f_x}{f_u} dx$$

And likewise for the other variables. Well, all we need to make a similar identity is some combination of these partials that works out to be $$1$$ or $$-1$$. How about:

$$
\begin{aligned}
(u_v) (v_w) (w_x) (x_u) = (-\frac{f_v}{f_u} )(-\frac{f_w}{f_v})( -\frac{f_x}{f_w}) (-\frac{f_u}{f_x}) = 1
\end{aligned}
$$

Clearly the general case for $$n$$ variables in any order and with $$x^{n+1}$$ wrapped to mean $$x^1$$ again, is

$$\prod_{i=1}^{n} (- \frac{\p x^{i+1}}{\p x^i}) = (-1)^n$$

So that's fun.

-------

# 2. Derivatives as Dual Basis Vectors

It turns out that this identity has nothing to do with partial derivatives. In fact it happens for regular vectors as well.

Suppose we have three vectors $$\b{a}$$, $$\b{b}$$, and $$\b{c}$$, which add to zero:

$$\b{a} + \b{b} + \b{c} = 0$$

Naturally we can write each as the negative of the other two:

$$\b{a} = - \b{b} - \b{c}$$

And then we can ask for the "$$\b{b}$$-component of $$\b{a}$$", which we call $$a_b$$. 

$$\b{a} = \underbrace{a_b}_{=-1} \b{b} + a_c \b{c}$$

Clearly $$ a_b = -1$$, but it's a bit hard to extract it from $$\b{a}$$ directly. There are a few normal ways to do it. The details don't matter for our topic, so they're in a box:

<aside class="toggleable" id="Projections" placeholder="<b>Aside</b>: Projections <em>(click to expand)</em>">


One way is by dotting with a certain vector $$\b{b}_{\perp c} = \b{b} - \proj_{\b{c}}(\b{b}) = \b{b} - \b{b} \cdot \b{c}/\| \b{c} \|^2 \b{c}$$, which has $$\b{b}_{\perp c} \cdot \b{c} = 0$$:

$$
\begin{aligned}
a_b &= \frac{\b{a} \cdot \b{b}_{\perp \b{c}}}{\b{b} \cdot \b{b}_{\perp \b{c}}} 
= \frac{(- \b{b} - \b{c}) \cdot \b{b}_{\perp \b{c}}}{\b{b} \cdot \b{b}_{\perp \b{c}}} 
= \frac{-\b{b} \cdot \b{b}_{\perp \b{c}}}{\b{b} \cdot \b{b}_{\perp \b{c}}}
= -1 \\ 
a_c &= \frac{\b{a} \cdot \b{c}_{\perp \b{b}}}{\b{c} \cdot \b{c}_{\perp \b{b}}}
= \frac{(- \b{b} - \b{c}) \cdot \b{c}_{\perp \b{b}}}{\b{b} \cdot \b{b}_{\perp \b{c}}} 
= \frac{-\b{b} \cdot \b{c}_{\perp \b{b}}}{\b{b} \cdot \b{c}_{\perp \b{b}}}
= -1 \\ 
\end{aligned}
$$

Another is the wedge product trick from Baez's article:

$$
\begin{aligned}
a_b &= \frac{\b{a} \^ \b{c}}{\b{b} \^ \b{c}} = -1 \\
a_c &= \frac{\b{a} \^ \b{b}}{\b{c} \^ \b{b}} = -1
\end{aligned}
$$

Where the division is justified by the fact that all the vectors live in the same 1-dimensional subspace and therefore can be divided like scalars.

</aside>

In any case what we're looking for is these three components:

$$
\begin{aligned}
\b{a} &= \boxed{a_b} \, \b{b} + a_c \b{c} \\ 
\b{b} &= \boxed{b_c} \, \b{c} + b_a \b{a} \\ 
\b{c} &= \boxed{c_a} \, \b{a} + c_b \b{b} \\ 
\end{aligned}
$$

And all three are $$-1$$, hence

$$
\begin{aligned}
(a_b) (b_c) (c_a) = (-1)(-1)(-1) = -1
\end{aligned}
$$

Naturally this will also work with a more general linear combination of vectors, such as $$f_a \b{a} + f_b \b{b} + f_c \b{c} = 0$$, in which case you get

$$(a_b) (b_c) (c_a) = (-\frac{f_b}{f_a})(-\frac{f_c}{f_b})(- \frac{f_a}{f_c}) = -1$$

In which case you're doing _exactly_ the same thing as the derivative case. So there is really nothing to do with derivatives here---what we're dealing with is a property of vector projections that derivatives happen to implement.

--------

I want to emphasize this because it is for some reason not that well-known:

The operation that partial derivatives implement:

$$
\begin{aligned}
du = u_v \d v + u_w \d w
\end{aligned}
$$

is _exactly_ the same as the operation of decomposing a vector into a _non-necessarily-orthogonal_ basis:

$$\b{a} = a_b \b{b} + a_c \b{c}$$

In the partial derivative case, the "vector" $$du$$ is being factored into a non-orthogonal basis of $$(dv, dw)$$. These two directions are of course the directions that $$u(v,w)$$ changes when you vary $$(v,w)$$. The partial derivative $$u_v$$ tells you how $$u$$ changes when you vary _only_ $$v$$, hence it is the coefficient of $$dv$$.

The general way of doing this is by constructing a [dual basis](https://en.wikipedia.org/wiki/Dual_basis) for $$\{ \b{b}, \b{c} \}$$, which in this case is a pair of vectors $$\b{b}^*$$ and $$\b{c}^*$$ such that

$$
\begin{aligned}
\b{b}^* \cdot \b{b} &= 1 \\
\b{b}^* \cdot \b{c} &= 0 \\
\b{c}^* \cdot \b{b} &= 0 \\
\b{c}^* \cdot \b{c} &= 1 \\
\end{aligned}
$$

There are ways to construct them, which also get to go into their own box:

<aside class="toggleable" id="dual" placeholder="<b>Aside</b>: Dual basis vectors <em>(click to expand)</em>">

Using the $$\b{b}_{\perp c}$$ and $$\b{c}_{\perp b}$$ vectors from the previous box:

$$
\begin{aligned}
\b{b}^* 
&= \frac{\b{b}_{\perp c}}{\| \b{b}_{\perp c} \|^2} 
= \frac{\b{b} - \frac{\b{b} \cdot \b{c}}{\| \b{c} \|^2} \b{c}}{\|\b{b} - \frac{\b{b} \cdot \b{c}}{\| \b{c} \|^2} \b{c} \|^2} 
= \frac{\b{b}\| \b{c} \|^2 - (\b{b} \cdot \b{c}) \b{c}}{\| \b{b} \|^2 \| \b{c} \|^2 - (\b{b} \cdot \b{c})^2} \\ 

\b{c}^* &= \frac{\b{c}_{\perp b}}{\| \b{c}_{\perp b} \|^2} 
= \frac{\b{c} - \frac{\b{b} \cdot \b{c}}{\| \b{b} \|^2} \b{c}}{\|\b{c} - \frac{\b{b} \cdot \b{c}}{\| \b{b} \|^2} \b{b}\|^2} 
= \frac{\b{c}\| \b{b} \|^2 - (\b{b} \cdot \b{c}) \b{b}}{\| \b{b} \|^2 \| \b{c} \|^2 - (\b{b} \cdot \b{c})^2}
\end{aligned}
$$

Although a better way to write them is using my hokey [vector division]({% post_url 2024-09-11-vector-division %}) notation (that article talks about a lot of this by the way) is

$$
\begin{aligned}
\b{b}^* &= \frac{- \b{c} \cdot (\b{b} \^ \b{c})}{\| \b{b} \^ \b{c} \|^2}\\ 
\b{c}^* &= \frac{+\b{b} \cdot (\b{b} \^ \b{c})}{\| \b{b} \^ \b{c} \|^2}
\end{aligned}
$$

Note that $$\b{b} \cdot \b{b}^* = 1$$ and $$\b{c} \cdot \b{b}^* = 0$$. An easy way to see this is by using the identity for repeated interior products, which is that $$\b{v} \cdot (\b{u} \cdot \alpha) = (\b{u} \^ \b{v}) \cdot \alpha$$:

$$
\begin{aligned}
\b{b} \cdot \frac{ (- \b{c} \cdot (\b{b} \^ \b{c}))}{\| \b{b} \^ \b{c} \|^2} 
&= \frac{(-\b{c} \^ \b{b}) \cdot (\b{b} \^ \b{c})}{\| \b{b} \^ \b{c} \|^2} 
= \frac{\| \b{b} \^ \b{c} \|^2}{\| \b{b} \^ \b{c} \|^2} = 1 \\ 
\b{c} \cdot \frac{ (- \b{c} \cdot (\b{b} \^ \b{c}))}{\| \b{b} \^ \b{c} \|^2} 
&= \frac{(-\b{c} \^ \b{c}) \cdot (\b{b} \^ \b{c})}{\| \b{b} \^ \b{c} \|^2} 
= 0
\end{aligned}
$$

</aside>

We use these to easily extract the coefficients:

$$
\begin{aligned}
\b{b}^* \cdot \b{a} &= \b{b}^* \cdot (a_b \b{b} + a_c \b{c}) \\
&= a_b (1) + a_c (0) \\
&= a_b \\
\b{c}^* \cdot \b{a} &= \b{c}^* \cdot (a_b \b{b} + a_c \b{c}) \\
&= a_b (0) + a_c (1) \\ 
&= a_c \\
\end{aligned}
$$

Now, in the differential version we're trying to extract the coefficients from 

$$du = u_v dv + u_w dw$$

where $$u_v$$ tells us how $$u$$ changes when we change _only_ $$v$$ and $$u_w$$ tells us $$u$$ changes when we change _only_ $$w$$. But it's just the same problem, and there's a dual basis that handles it. I guess we would call it $$\{ dv^*, dw^*\}$$? But we don't have to; there's a better symbol. The dual basis can be sorta identified with the partial derivative operators themselves:

$$
\begin{aligned}
\p_v &\sim dv^* \\ 
\p_w &\sim dw^* \\
\end{aligned}
$$

That seems weird but it turns out to be pretty logical. Note that we can write the factorization of $$\b{a}$$ as an operator acting on $$\b{a}$$:

$$\b{a} = b_a \b{b} + b_c \b{b} = (\b{b} \o \b{b}^* + \b{c} \o \b{c}^*) \cdot (\b{a})$$

In this case we know ahead of time that $$\b{a} \in \span(\b{b}, \b{c})$$, but if it did not, this would instead of a projection onto that plane:

$$\b{a}_{bc} = b_a \b{b} + b_c \b{b} = (\b{b} \o \b{b}^* + \b{c} \o \b{c}^*) \cdot (\b{a})$$

The equivalent expression for the differentials is

$$du = u_v dv + u_w dw = (dv \o \p_v + dw \o \p_w) u$$

The object on the left acts like a projection of $$u$$ onto some "subspace" of possible functions, namely, the linear ones. Well, sorta. You have to squint a bit to interpret $$du(v,w)$$ as living in a linear subspace of $$u(v,w)$$. I think the right interpretation is that $$du$$ happesn to be written in a different basis than $$u$$: although it _means_ that it is a linearization of $$u$$ at some point $$(v_0, w_0)$$,

$$du(u,v) \equiv u_v \|_{(v_0, w_0)} (v - v_0) + u_w \|_{(v_0, w_0)} (w - w_0)$$

we happen to writing it in a form that has to be algebraically applied in a different way.

In any case you can see that the role of the $$\p_v$$ and $$\p_w$$ symbols is the same as the dual basis dot products $$\b{b}^* \cdot$$ and $$\b{c}^* \cdot$$ acting on $$\b{a}$$: they project out the behaviors along the $$dv$$ and $$dw$$ directions. So in that sense they are serving the role of dual basis "vectors", and the overall $$d$$ symbol is acting like a projection onto that whole subspace

$$d = dv \o \p_v + dw \o \p_w = \proj_{\{du, dv\}}$$

(at some point $$(u_0, v_0)$$, that is)

Probably this interpretation isn't perfect and could be improved upon. Still, I think it is fair to say that the $$\p_v$$ and $$\p_w$$ are playing the same role for the differentials that the dual basis vectors played for the vectors. Hence $$(u_v) (v_w) (w_u) = -1$$ identity is the same as the $$(a_b) (b_c) (c_a) = -1$$ identity for vectors that obey $$\b{a} + \b{b} + \b{c} = 0$$ or $$f_a \b{a} + f_b \b{b} + f_c \b{c} = 0$$.

--------

That's all; that's the point I wanted to make. This stuff is basically well-understood but I haven't seen it in this notation and terminology before; I find it useful to rewrite it in terms of the other things I've been investigating. 

Now that we've thought of $$d$$ like this, though, I am eager to transmute the rest of exterior calculus to be in terms of the same ideas. But that's enough for today.

-----------
