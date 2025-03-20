---
layout: blog
title: "Triple Products and Dual Bases"
footnotes: true
math: true
aside: true
tags: notes
---

I came across [this](https://johncarlosbaez.wordpress.com/2021/09/13/the-cyclic-identity-for-partial-derivatives/) article, about the following counterintuitive partial derivative identity for a function $$u(v,w)$$:

$$
\begin{aligned}
(\frac{\p u}{\p v} \|_w) (\frac{\p v}{\p w} \|_u) (\frac{\p w}{\p u} \|_v) = -1
\end{aligned}
$$

(Each term is assumed to be non-zero.) More succinctly:

$$\frac{\p u}{\p v} \frac{\p v}{\p w} \frac{\p w}{\p u} = -1$$

Or, with $$u_v = \p u(v, w)/\p v$$, as:

$$u_v v_w w_u = -1$$

It can be found on Wikipedia under the name [Triple Product Rule](https://en.wikipedia.org/wiki/Triple_product_rule).

The reason to care about this (besides that it's sometimes useful in calculations) is that it seems a bit perplexing that the minus sign is there. Shouldn't these fractions sorta cancel? Yes, we all learned that derivatives aren't really fractions... but they definitely act like fractions a _bit_, certainly more often than they _don't_ act like fractions, and it's odd that in this case they seem to act like the opposite of fractions. We'd like to repair our intuition somehow.

Although Baez's article does justify this identity in a few different ways, there's still something puzzling there; the answers are not quite satisfactory. I don't like when there's some fact of basic calculus which does immediately correspond to intuition (without clearly being an artifact of the formalism). So I thought I would try to get to the bottom of things. 

<!--more-->

----------

# 1. A Proof

The easiest way to see that it's true, IMO, is not any of the pseudo-proofs in Baez's article. Instead it's the following simpler pseudo-proof:

If $$u$$ is a function of $$v$$ and $$w$$ then we can write out the relationship between the three values as some function $$f(u,v,w)$$, where $$u$$ is the $$u$$ "variable" while capital $$U(v,w)$$ is the former functional relationship that produces it from $$v$$ and $$w$$:

$$f(u,v,w) = u - U(v, w) = 0$$

This implicit function holds for all valid values of $$(u,v,w)$$, meaning that in general the three variables form an implicit $$2$$-surface in $$\bb{R}^3$$.

The differential $$df$$ is

$$df = f_u du + f_v dv + f_w dw = 0$$

$$df$$ tells us how $$f$$ changes as we vary $$(u,v,w)$$, but in order for the relationship between them to keep holding, it's required that $$f$$ does _not_ change. We can rearrange this and solve for, say, $$du$$ (we are still assuming that none of the partials are zero).

$$
\begin{aligned}
du &= - \frac{f_v}{f_u} dv - \frac{f_w}{f_u} dw \\
\end{aligned}
$$

Those coefficients are just the values of $$\p u / \p v$$ and $$\p u / \p w$$:

$$
\begin{aligned}
(- \frac{f_v}{f_u}) dv + (- \frac{f_w}{f_u}) dw =  u_v dv + u_w dw
\end{aligned}
$$

Note the minus signs. This tells us how the constraint $$f(u,v,w) = 0$$ requires $$u$$ to change as we vary $$v$$ and $$w$$, and it's ultimately where the minus signs come from. They're _not_ from some relationship between generic partial derivatives, but from the constraint that has to hold between them between them. 

Hence $$u_v = -f_v/f_u$$ and $$u_w = -f_w/f_u$$. Solving for $$dv$$ ad $$dw$$ gives $$v_w = - f_w / f_u$$ and $$w_u = -f_u/f_w$$, and so

$$
\begin{aligned}
(u_v) (v_w) (w_u) &= (- \frac{f_v}{f_u}) (- \frac{f_w}{f_u}) (- \frac{f_u}{f_w}) \\
&= (-1)^3 (\cancel{\frac{f_v}{f_v}}) (\cancel{\frac{f_w}{f_w}}) (\cancel{\frac{f_u}{f_u}}) \\
&= -1
\end{aligned}
$$

Where now that everything is a fraction it's very clear that you can cancel all the terms out (still using the fact that none of the partials are zero). Note that it does turn out to be the case that $$u_v = 1/v_u$$.

That's pretty simple, I think. I like this explanation because it seems to involve exactly as much machinery as is required and no more. And as much as I love wedge products, the wedge-product-based approach in Baez's article seems like overkill to me. But anyway, there is more to say, because it's still not that obvious what is going on.

----------

Before we go on: just for fun here's how you extend this identity to more variables. Suppose there are $$4$$ variables which are interrelated, so $$f(u,v,w,x) = 0$$. Then 

$$df = f_u du + f_v dv + f_w dw + f_x dx = 0$$

and

$$du = -\frac{f_v}{f_u} dv - \frac{f_w}{f_u} dw - \frac{f_x}{f_u} dx$$

And likewise for the other variables. So it's still the case that $$u_v = - f_v/f_u$$ with no reference to the others. To make a similar identity is some combination of these partials that works out to be $$1$$ or $$-1$$ we just find some product that cancels everything out:

$$
\begin{aligned}
(u_v) (v_w) (w_x) (x_u) = (-\frac{f_v}{f_u} )(-\frac{f_w}{f_v})( -\frac{f_x}{f_w}) (-\frac{f_u}{f_x}) = 1
\end{aligned}
$$

Clearly the general case for $$n$$ variables in any order and with $$x^{n+1}$$ wrapped to mean $$x^1$$ again, is

$$\prod_{i=1}^{n} (- \frac{\p x^{i+1}}{\p x^i}) = (-1)^n$$

So that's fun.

-------

# 2. Vectors

It turns out that this identity has nothing to do with partial derivatives. In fact it happens for regular vectors as well.

Suppose we have three vectors $$\b{a}$$, $$\b{b}$$, and $$\b{c}$$, which add to zero:

$$\b{a} + \b{b} + \b{c} = 0$$

Naturally we can write each as the negative of the other two:

$$\b{a} = - \b{b} - \b{c}$$

And then we can ask for the "$$\b{b}$$-component of $$\b{a}$$", which we call $$a_b$$. In this case it equals $$-1$$:

$$\b{a} = \underbrace{a_b}_{=-1} \b{b} + a_c \b{c}$$

And likewise for $$\b{b}$$, $$\b{c}$$. So we can take these three components

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

More generally we might have three vectors whose relationship is that some linear combination of them sum to zero:

$$f = f_a \b{a} + f_b \b{b} + f_c \b{c} = 0$$

So we would find that, as long as $$f_a$$ is not zero:

$$\b{a} = -\frac{f_b}{f_a} \b{b} - \frac{f_c}{f_a} \b{c}$$

If none of the coefficients are zero then

$$(a_b) (b_c) (c_a) = (-\frac{f_b}{f_a})(-\frac{f_c}{f_b})(- \frac{f_a}{f_c}) = -1$$

Which is _exactly_ the same thing as the derivative case. So there is really nothing to do with derivatives here---what we're dealing with is a property of vectors that derivatives happen to implement.

-----------

# 3. Derivatives as Dual Basis Vectors

For some reason this is not that well-known:

The operation that partial derivatives implement,

$$
\begin{aligned}
du = u_v \d v + u_w \d w
\end{aligned}
$$

is _exactly_ the same as the operation of decomposing a vector into a _non-necessarily-orthogonal_ basis:

$$\b{a} = a_b \b{b} + a_c \b{c}$$

In the partial derivative case, the "vector" $$du$$ is being factored into a non-orthogonal basis of $$(dv, dw)$$. These two directions are of course the directions that $$u(v,w)$$ changes when you vary $$(v,w)$$. The partial derivative $$u_v$$ tells you how $$u$$ changes when you vary _only_ $$v$$, hence it is the coefficient of $$dv$$ in $$du$$.

The general way of doing this is by using a [dual basis](https://en.wikipedia.org/wiki/Dual_basis) for $$\{ \b{b}, \b{c} \}$$, which in this case is a pair of vectors $$\b{b}^*$$ and $$\b{c}^*$$ such that

$$
\begin{aligned}
\b{b}^* \cdot \b{b} &= 1 \\
\b{b}^* \cdot \b{c} &= 0 \\
\b{c}^* \cdot \b{b} &= 0 \\
\b{c}^* \cdot \b{c} &= 1 \\
\end{aligned}
$$

You are free to assume that this exists as long as $$\b{b}$$ and $$\b{c}$$ are linearly independent. There are also procedures for constructing them, which will go into a box because they're verbose:


<aside class="toggleable" id="Projections" placeholder="<b>Aside</b>: Dual basis constructions <em>(click to expand)</em>">

Suppose we want to extract the $$a_b$$ comonent in 

$$\b{a} = a_b \b{b} + a_c \b{c}$$

If $$\b{b}$$ and $$\b{c}$$ were orthogonal then we would use the trusty vector projection onto $$\b{b}$$ and be done:

$$a_b = \proj_{\b{b}} \b{a} = \b{a} \cdot \frac{\b{b}}{\| \b{b} \|^2} \b{b}$$

If they are not, we can do the same thing but with the vector "$$\b{b}$$, but with $$\b{c}$$ removed", which is

$$\b{b}_{\perp \b{c}} = \b{b} - \proj_{\b{c}}(\b{b}) = \b{b} - \frac{\b{b} \cdot \b{c}}{\| \b{c} \|^2} \b{c}$$

which has $$\b{b}_{\perp \b{c}} \cdot \b{b} \neq 0$$ and $$\b{b}_{\perp \b{c}} \cdot \b{c} = 0$$. Therefore:

$$
\begin{aligned}
a_b &= \frac{\b{a} \cdot \b{b}_{\perp \b{c}}}{\b{b} \cdot \b{b}_{\perp \b{c}}} 
= \frac{(a_b \b{b} + a_c\b{c}) \cdot \b{b}_{\perp \b{c}}}{\b{b} \cdot \b{b}_{\perp \b{c}}} 
= \frac{a_b \b{b} \cdot \b{b}_{\perp \b{c}}}{\b{b} \cdot \b{b}_{\perp \b{c}}}
= a_b \\ 
a_c &= \frac{\b{a} \cdot \b{c}_{\perp \b{b}}}{\b{c} \cdot \b{c}_{\perp \b{b}}}
= \frac{(a_b \b{b} + a_c \b{c}) \cdot \b{c}_{\perp \b{b}}}{\b{b} \cdot \b{b}_{\perp \b{c}}} 
= \frac{a_c\b{c} \cdot \b{c}_{\perp \b{b}}}{\b{b} \cdot \b{c}_{\perp \b{b}}}
= a_c \\ 
\end{aligned}
$$

Or you can use the wedge product trick from Baez's article:

$$
\begin{aligned}
a_b &= \frac{\b{a} \^ \b{c}}{\b{b} \^ \b{c}} \\
a_c &= \frac{\b{a} \^ \b{b}}{\b{c} \^ \b{b}}
\end{aligned}
$$

The division here is justified by the fact that all the vectors live in the same 1-dimensional subspace and therefore can be divided like scalars. Or you can project them all onto the scalar space first if you want.

The wedge product version and the dot product version are equivalent. In particular $$\| \b{c} \|^2 \b{b}_{\perp \b{c}} = \b{b} (\b{c} \cdot \b{c}) - \b{c} (\b{b} \cdot \b{c}) = \b{b} \cdot (\b{b} \^ \b{c})$$, and you can see the former as starting from the latter and multiplying through by $$(\b{b} \^ \b{c}) / \| \b{c} \|^2$$. Probably there's a more profound way to think about it but I'm not sure what it is.

-------

Anyway the dual basis vectors are given by normalizing the $$\b{b}_{\perp \b{c}}$$ vectors.

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

Such that 

$$\b{b}^* \cdot \b{b} = \frac{\b{b}_{\perp \b{c}}}{\| \b{b}_{\perp \b{c}} \|^2} \cdot (\b{b}_{\perp \b{c}} + \b{b}_{\parallel \b{c}}) = 1$$

Another way to write these is using my [vector division]({% post_url 2024-09-11-vector-division %}) notation (that article talks about a lot of this by the way) is

$$
\begin{aligned}
\b{b}^* &= \frac{- \b{c} \cdot (\b{b} \^ \b{c})}{\| \b{b} \^ \b{c} \|^2}\\ 
\b{c}^* &= \frac{+\b{b} \cdot (\b{b} \^ \b{c})}{\| \b{b} \^ \b{c} \|^2}
\end{aligned}
$$

Note that $$\b{b} \cdot \b{b}^* = 1$$ and $$\b{c} \cdot \b{b}^* = 0$$. One way to show this is by using the identity for repeated interior products, which is that $$\b{v} \cdot (\b{u} \cdot \alpha) = (\b{u} \^ \b{v}) \cdot \alpha$$:

$$
\begin{aligned}
\b{b} \cdot \b{b}^* = \b{b} \cdot \frac{ (- \b{c} \cdot (\b{b} \^ \b{c}))}{\| \b{b} \^ \b{c} \|^2} 
&= \frac{(-\b{c} \^ \b{b}) \cdot (\b{b} \^ \b{c})}{\| \b{b} \^ \b{c} \|^2} 
= \frac{\| \b{b} \^ \b{c} \|^2}{\| \b{b} \^ \b{c} \|^2} = 1 \\ 
\b{c} \cdot \b{b}^* = \b{c} \cdot \frac{ (- \b{c} \cdot (\b{b} \^ \b{c}))}{\| \b{b} \^ \b{c} \|^2} 
&= \frac{(-\b{c} \^ \b{c}) \cdot (\b{b} \^ \b{c})}{\| \b{b} \^ \b{c} \|^2} 
= 0
\end{aligned}
$$

</aside>

We use these to extract the coefficients:

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

Here the vector space is the one $$du$$ lives in. $$du$$ is an operator that takes a change $$\D V$$ in $$v$$ and a change $$\D w$$ in $$w$$ and returns a linear approximation to $$du(\D v, \D w) \approx u(v + \D v, w + \D w) - u(v, w)$$; the projection on the right writes this as a sum of $$u_v dv$$ and $$u_w dw$$ which act on changes in $$v$$ and $$w$$ individually. We can write this as:

$$d = dv \o \p_v + dw \o \p_w = \proj_{\{du, dv\}}$$

It is a bit hard to interpret $$du$$ as living in a _subspace_ of the space that $$u$$ lives in, like with the vectors, such that $$d = dv \o \p_v + dw \o \p_w$$ is a projection. But I suppose if you were, then you would think of $$u(v,w)$$ as also being a function $$(\D v, \D w) \ra \bb{R}$$, given by $$u(v,w)(\D v, \D w) = u(v + \D v, w + \D w) - u(v,w)$$; then the operator is a projection from the space of "all possible functions at this point" down to the "linear functions at this point".

In any case you can see that the role of the $$\p_v$$ and $$\p_w$$ symbols is the same as the dual basis dot products $$\b{b}^* \cdot$$ and $$\b{c}^* \cdot$$ acting on $$\b{a}$$: they project out the behaviors along the $$dv$$ and $$dw$$ directions. So in that sense they are serving the role of dual basis "vectors", and the overall $$d$$ symbol is acting like a projection onto that whole subspace

Probably this interpretation isn't perfect and could be improved upon. Still, I think it is fair to say that the $$\p_v$$ and $$\p_w$$ are playing the same role for the differentials that the dual basis vectors played for the vectors. Hence $$(u_v) (v_w) (w_u) = -1$$ identity is the same as the $$(a_b) (b_c) (c_a) = -1$$ identity for vectors that obey $$\b{a} + \b{b} + \b{c} = 0$$ or $$f_a \b{a} + f_b \b{b} + f_c \b{c} = 0$$.

--------

That's all; that's the point I wanted to make. This stuff is basically well-understood but I haven't seen it in this notation and terminology before; I find it useful to rewrite it in terms of the other things I've been investigating. 

Now that we've thought of $$d$$ like this, though, I am eager to transmute the rest of exterior calculus to be in terms of the same ideas. But that's enough for today.

-----------
