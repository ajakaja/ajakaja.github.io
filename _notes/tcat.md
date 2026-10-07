---
layout: blog
title: "TCAT-A notes"
footnotes: true
math: true
aside: true
tags: math
---

Notes on the book on Thermodynamically Constrained Averaging Theory by Gray & Miller.

We start with Appendix A because the mathematical framework has to be understood first.

<!--more-->

$$\newcommand{\frakr}{\mathfrak{r}}$$
$$\newcommand{\odelta}{\overline{\delta}{}}$$

-------

# Appendix A - Variational Calculus


The notations for variational calculus used here are different than those in physics. However I don't particularly like the physics ones either, because really variational calculus is exactly the same as regular calculus (and it is literally the same if you discretize your functions, e.g. $$F[x(t)] = F[(x_0, x_1, x_2, \ldots, x_N)]$$ for $$N \ra \infty$$; the differences are mostly on the analytical side). So I will write things in my own notations as I go.

The general technique of variational calculus is taking differentials of functionals, that is, functions of other functions:

$$\delta F[\b{f}]$$

which most often come in the form of integrals:

$$F = \int f(\b{x}) \d V$$

Usually the purpose of this is to then set the differentials to zero, $$\delta F = 0$$, in order to find stationary points (maxima and minima). 

Really this is no different from the regular calculus version, of computing $$df = f_x dx + f_y dy + f_z dz = 0$$ to find the maxima/minima of $$f(x,y,z)$$, except that functions have effectively an infinite number of arguments instead of a finite number.  The other thing that shows up is that functionals can depend on derivative operators as well, like $$\delta F = \int \dot{f} dt$$, so you need a way to think about those. 

None of it is very hard, really, and all the results basically follow if you plug in a discrete approximation to $$f$$ and then take a limit to infinite resolution... however, the notations and terminology can be challenging to unpack. The short version is that "variation" means the same thing as "differential" and one just has to translate between all the two different ways of saying the same thing. In particular the chain rule works the same way:

$$\delta f(\b{u}, \b{x}, \e) = f_{\b{u}} \cdot \delta \b{u} + f_{\b{x}} \cdot \delta \b{x} + f_{\e} d \e$$

(where $$f_{\b{u}} = \p_{\b{u}} f = \del_{\b{u}} f$$, $$f_{\b{x}} = \del_{\b{x}} \b{f}$$, and $$f_{\e} = \p_{\e} f$$.)

So $$\delta$$ and $$d$$ really just mean the same thing everywhere. As far as I can tell the reason people use the separate $$\delta$$ symbol for variations is that expressions like $$d [\nfrac{d f(\b{x})}{dt}]$$ get very hard to parse otherwise.

--------

## 1. Classical Approach to Volume Integrals (A.2 through A.32)


These describe what is apaprently the "classical" approach to varying a integral. The integrel in question is something like $$F = \int_{\Omega(\b{x})} f(\b{u}(\b{x})) d\Omega$$, and the variation performed is varying the shape of the surface $$\Omega$$ itself. (I was not previously aware that you could vary an integration surface like this, but it's not that surprising---I suppose that, if you can describe a surface as a function, then you ought to be able to vary it.) The target theorem is

$$\delta F = \int_{\Omega} \odelta f(\b{u}) \, d \frakr + \int_{\Gamma} f(\b{u}) \b{n} \cdot \delta \b{x} \, d \frakr \tag{A.32}$$

Note that the derivation of this is also basically found on Wikipedia under [Reynolds Transport Theorem](https://en.wikipedia.org/wiki/Reynolds_transport_theorem), although in slightly less generality. The Wiki version is

$$
\begin{aligned}
\frac{dF}{dt} &= \frac{d}{dt} \int_{\Omega(t)} f dV \\
&= \int_{\Omega(t)} \p_t f dV + \int_{\p \Omega(t)} (\b{v}_b \cdot \b{n}) f dA 
\end{aligned}
\tag{Reynolds Transport Thm.}
$$

The difference is that the Reynolds theorem considers only the differential with respect to time, while the TCAT version considers a more general differential where the surface's form is varied independently of time. The Reynolds version is recovered by projecting the TCAT version onto $$dt$$. The point of generalizing beyond time derivatives is that you can ask questions like "what surface minimizes energy given a certain set of constraints", which asks for an optimum shape without reference to a time variable.

--------

TCAT develops their variations with a standard technique: of parameterizing the infinite-dimensional change in the functions $$\b{x}$$ and $$\b{u}$$ by a one-dimensional parameter $$\e$$ such that, for infiniteismal $$\e$$,


$$
\begin{aligned}
\delta \b{x} &= \b{X}(\b{x}, \e) - \b{X}(\b{x}, 0) \\
&\approx \p_{\e}\b{X} d \e \\
\delta \b{u} &= \b{U}(\b{X}, \e) - \b{u}^*(\b{X}, 0) \\
&\approx (\p_{\e} \b{U}) d \e + (\p_{\b{x}} \b{U}) \delta \b{x} \\
\end{aligned}
$$

They then write the $$\b{u}$$ variation as

$$
\begin{aligned}
\delta \b{u} = \odelta \b{u} + \del \b{U} \cdot \delta \b{x}
\end{aligned}
$$

which I find very hard to read. But the $$\odelta$$ notation is confusing. The meaning is that it is the 'independent' variation of an object _not_ due to the variation in $$\b{x}$$, that is, it's the $$\e$$ partial derivative rather than the part that depends on $$\e$$ only indirectly via an $$\x$$ derivative.

$$\odelta \b{u} = \p_{\e} \b{U}(\b{x}, \e)$$

The same operator can act on functions of $$\b{u}$$ as well:

$$\odelta f(\b{u}) = f_{\b{u}} \odelta\b{u}$$

I haven't seen this before, but it corresponds to the $$\b{f}_t$$ term in the Reynolds tranport theorem version: the derivative of $$\b{f}(\b{x}, t)$$ due to dependent variables other than $$\b{x}$$. I would prefer to write it as $$\delta_{\perp \b{x}}$$ instead, such that

$$\delta \b{u} = \delta_{\b{x}} \b{u} + \delta_{\perp \b{x}} \b{u} = \b{u}_{\b{x}} \delta \b{x} + \delta_{\perp \b{x}} \b{u}$$

-------

Next they derive (A.32) by expanding the variation $$\delta \int_{\Omega} f(\b{u}) d \frakr$$.

I found  this derivation hard to follow for a few reasons. One, I have not done these continuum mechanics calculations before. Two, anything involving Jacobians and determinants and their derivatives is always confusing. But three, it was hard to figure out what was going on with the $$\Omega^*$$ term, the variation applied to the integration bounds themselves---why did they change? What does that mean?

After staring at it for a while I realized I did not initially understand what $$\x$$ or $$\delta \b{x}$$ were really doing. Although they look like normal position variables that you would integrate over, they are really a (clever) way of describing the shape of the surface $$\Omega$$. Specifically, $$\Omega$$ is being parameterized by what's called [Lagrangian coordinates](https://en.wikipedia.org/wiki/Lagrangian_and_Eulerian_specification_of_the_flow_field), meaning that each point on the surface is parameterized by the point it _started_ at; that's the

$$\b{x}^* = \b{X}(\b{x}, \e)$$

at the start. So if you plug in a value of $$\b{x}$$ here, you find out where it ended up at later after the variation is increased to $$\e$$. When $$\e = 0$$ then $$\b{X}(\b{x}, 0) = \b{x}$$ and nothing is moved.

(Terminology note: I don't love the name "Lagrangian coordinates" because it doesn't really tell you what they mean. Also, it overloads the word "Lagrangian" which means a lot of other things already. It would be nice to have a different and more mundane word for it. The best one I could think of was "comoving coordinates", because they're co-moving (with the fluid). This term is also a bit overloaded because it also refers to comoving with a particular reference frame, but I think that's ok. In the same vein, I really prefer "ambient coordinates" to "Eulerian coordinates" for the fixed ambient frame ("background coordinates") would also work. But Lagrangian/Eulerian is extremely standard.)

Comoving/Lagrangian coordinates are _normally_ used to talk about the time-evolution of a fluid: you would write $$\b{x}(t) = \b{X}(\b{x}, t)$$ for the location that the particle which started at $$\b{x}$$ ended up. Then you compute an integral over the body at a time $$t$$ by instead integrating it over the body at time $$0$$, but regarding the motion $$\b{x} \ra \b{x}$$ as a "coordinate change" even though it is actually an active transformation (which is a neat trick I hadn't seen before):

$$\int_{\Omega(t)} f(\b{x}(t)) \, dV = \int_{\Omega_0} f(\b{X}(\b{x}, t)) J \d V_0$$

with $$J$$ the Jacobian of the transformation,

$$J = \det \frac{\p \b{X}}{\p \b{x}}$$

So the version in the TCAT paper is doing the same idea, but instead of the comoving evolution equation describing the evolution of the fluid in _time_, it's describing an arbitrary variation performed at a _fixed_ time. This is also why $$\b{u}$$ has its own variation: since we are not describing time evolution, we can vary more things than just the position of the surface.

The reason that $$\Omega^*$$ exists, then, is that when we vary the $$\b{x}$$ coordinates we are changing the position of $$\Omega$$ itself by changing the locations of all the $$\b{x}$$s. Varying the Lagrangian $$\b{x}$$ coordinates is a trick for varying the shape $$\Omega$$. 

Here's TCAT's derivation (with my notational modifications). We want to compute 

$$\delta \int_{\Omega} f(\b{u}) \d V = [\delta_{\perp \b{x}} + \delta_{\b{x}}] \int_{\Omega} f(\b{u}) \d V$$

The $$\b{x}_{\perp}$$ part is trivial, it's just $$=\int_{\Omega} \delta_{\perp \b{x}} f \d V$$.

TCAT handles the $$\delta \b{x}$$ part like this. First we expand the varied surface using the comoving coordinate thing. Then we approximate both $$f(\b{u}^*) \approx f(\b{u}) + f_{\x} \delta \b{x}$$ and $$J = \det [\frac{d (\b{x} + \delta \b{x})}{d\b{x}}] \approx I + \p_{\b{x}} \delta \b{x}$$ (more on this later), then integrate the resulting term by parts:

$$
\begin{aligned}
\delta_{\b{x}} \int_{\Omega} f(\b{u}) \d V &= \int_{\Omega^*} f(\b{u}^*) \d V^* - \int_{\Omega} f(\b{u}) \d V \\
&= \int_{\Omega} [f(\b{u}^*) J -  f(\b{u}) ] \d V \\
&= \int_{\Omega} [(f + f_{\b{x}} \delta \b{x} + \ldots ) (I + \p_{\b{x}} \delta \b{x} + \ldots) - f] \d V \\
&\approx \int_{\Omega} [ f_{\b{x}} \delta \b{x}  + f \, \p_{\b{x}} \delta \b{x}] \d V \\
&= \int_{\Omega} [ \cancel{f_{\b{x}} \delta \b{x}}  + \p_{\b{x}} (f \delta \b{x}) - \cancel{f_{\b{x}} \delta \b{x}}] \d V \\ 

&= \int_{\Omega} \p_{\b{x}} (f \delta \b{x}) \d V \\
&= \int_{\p \Omega} f(\b{u}) (\delta \b{x} \cdot d\b{A}) \\
&\equiv \int_{\p \Omega} f(\b{u}) (\b{n} \cdot \delta \b{x}) dA
\end{aligned}
$$

Such that

$$\delta \int_{\Omega} f(\b{u}) dV = \int_{\Omega} \delta_{\perp \b{x}} f(\b{u}) \d V + \int_{\p \Omega} f(\b{u}) (\b{n} \cdot \delta \b{x}) dA \tag{A.32}$$

-----

**A shorter version**

Here's a quicker (unrigorous?) way of thinking about the same calculation. Consider writing the variation of $$\Omega$$ out as addition even though it's a shape, not a function:

$$\Omega^* = \Omega + \delta \Omega$$

Here $$\delta \Omega$$ describes all of the changes in the resulting positions of points (in comoving coordinates). That is, given each point $$\b{x} \in \Omega$$, its resulting position after the variation is $$\b{x} + \delta \b{x}$$; the overall variation $$\delta \b{x}$$ describes an 'infinite' vector of these for every choice of $$\b{x}$$.

We can split $$\delta \Omega$$ into two parts.

$$\delta \Omega = \sigma(\Omega) + \delta \b{x} \cdot \p \Omega$$

The first part $$\sigma(\Omega)$$ consists of "rearrangements" of the positions within $$\Omega$$. Since we end up integrating over $$d V$$ we do not actually care if points "compress" in some locations and "expand" in others. We might write this as $$\sigma(\Omega)$$, implying that it's a permutation which "permutes" $$\Omega$$ without changing the overall set of points again. So as a set $$\Omega + \sigma(\Omega) = \Omega$$ again (as a set, I guess). (This term would not disappear if we were also concerned with the _density_ of the points of $$\Omega$$, since they could be rearranged in a way that packs them closer or looser together... but we're not, $$\Omega$$ is _just_ an integration region.)

The other part consists of how the actual boundary of $$\Omega$$ changes. Since each point on the boundary moves to a new point $$\b{x} \ra \b{x} + \delta \b{x}$$, each differential area element $$d \b{A} \in \p \Omega$$ is extended to give a new volume $$\delta \b{x} \cdot d \b{A}$$ (the area could move in any kind of strange way, but to first order the change in volume is given by projecting it along its normal $$\b{n} \propto d \b{A}$$). As a result we can write

$$\Omega + \delta \Omega = \Omega + \sigma(\Omega) + \delta \b{x} \cdot \p \Omega = \Omega + \delta \b{x} \cdot \p \Omega$$

Therefore:

$$
\begin{aligned}
\delta_{\b{x}} \int_{\Omega} f(\b{u}) \d V &= \int_{\Omega + \delta \Omega} f(\b{u}) \d V - \int_{\Omega} f(\b{u}) \d V \\
&= \int_{\Omega + \sigma (\Omega) + \delta \b{x} \cdot \p \Omega} f(\b{u}) \d V - \int_{\Omega} f(\b{u}) \d V \\
&= \int_{\delta \b{x} \cdot \p \Omega} f(\b{u}) \d V \\
&= \int_{\p \Omega} f(\b{u}) (\delta \b{x} \cdot \d A)
\end{aligned}
$$

And therefore

$$\delta \int_{\Omega} f \d V  = [\delta_{\perp \b{x}} + \delta_{\b{x}}]\int_{\Omega} f \d V  = \int_{\Omega} \delta_{\perp \b{x}} f \d V  + \int_{\p \Omega} f(\b{u}) (\delta \b{x} \cdot \d A) \tag{A.32}$$

This is a bit of a sketchy argument, but I think it's basically correct. I came to it by staring at the previous argument for a while and trying to make sense of what the integration-by-parts terms "means".  

Apparently, although there is a first-order variation in the value of $$f(\b{u}^*) \approx f(\b{u} + \delta \b{u}) \approx f(\b{u}) + f_{\b{x}} \delta \b{x}$$ throughout $$\Omega$$, it gets cancelled out by the term from the integration-by-parts because none of those contributions actually change the resulting $$\int_{\Omega}$$. In particular, if moving some points causes $$\int f(\b{u})$$ to change at a given point, then moving some _other_ points into the gap left behind will cause it to change by $$-\int f(\b{u})$$ to compensate---except at the changes in the boundary $$ \p \Omega$$, where points can be genuinely added or removed.

One thing I'm not clear about is why you can't also "introduce a boundary" on the interior of $$\Omega$$ when you start the variation, which would also contribute to the integral here. Maybe we're assuming that the variation is continuous. Or maybe that is accounted for here since then the $$\p \Omega$$ integral would include it. Not sure.

Before continuing, a few mathematical asides.

------

<aside class="toggleable" id="material" placeholder="<b>Aside</b>: Note on material derivatives <em>(click to expand)</em>">

In the process of understanding this I learned that the material derivative is quite simple.

The comoving coordinate formulation of a field $$f$$ is

$$f(\b{x}, t) = f(\b{X}(\b{x}, t), t)$$

Therefore its derivative is

$$d f = f_{\b{x}} d \b{X} + f_t dt$$

The total time derivative is

$$\frac{df}{dt} = f_{\b{x}} \frac{d \b{X}}{dt} + f_t$$

But $$\nfrac{d \b{X}}{dt}$$ is just the velocity $$\b{u}$$ of the fluid packet at position $$\b{x}$$ (which happened to start at position $$\b{x}$$, but that doesn't matter). Therefore

$$\frac{df}{dt} = f_{\b{x}} \cdot \b{u} + f_t$$

Which is more commonly written

$$\frac{df}{dt} = \b{u} \cdot \del f + \frac{\p f}{\p t}$$


</aside>

<aside class="toggleable" id="jacobian" placeholder="<b>Aside</b>: Note on Jacobians <em>(click to expand)</em>">


Earlier we have this coordinate change $$\b{x} = \b{X}(\b{x}, t)$$ and then we have a volume integral transformation

$$\int f \d V = \int f \, J \d V_0$$

The better way to write this is in terms of exterior algebra (with some of my own modifications). I will write it out even though this won't be sufficient to explain it. Note that this is related to the math of differential forms, but other than the fact that we're doing it in an integral it applies to vectors algebra in general.

First, note that $$d \b{x} = (dx, dy, dz)$$ is the "frame" of differentials. The volume element is given by the third exterior power:

$$dV = d^{\^3} \b{x} = dx \^ dy \^ dz$$

The notation $$d^{\^3} \b{x}$$ means that it is the third exterior power of the _frame_; the exterior product of a vector with itself is always zero, but the exterior power of a frame with itself is not zero; instead it contains only of products of unique terms in the frame.

The change of variables is in order to write this in terms of $$d V_0 = d^{\^3} \b{x} = dx_0 \^ dy_0 \^ dz_0$$. We do this by taking the third exterior power of the change of variables $$\b{X}$$:

$$
\begin{aligned}
dV &= d \b{x}^{\^3} \\
&= d \b{X}(\b{x}) ^{\^3}\\
&= \frac{d \b{X}^{\^3}}{d \b{x}^{\^3}} d\b{x}^{\^3} \\
&= (\frac{d \b{X}}{d \b{x}})^{\^ 3} d \b{x}^{\^3} \\
&= \det (J) d V_0
\end{aligned}
$$

Here $$J = \nfrac{d \b{X}}{d \b{x}}$$ is the Jacobian of the coordinate transformation (really, it's just the first derivative of $$\b{X}$$), and $$\det J =\frac{d  \b{X}^{\^3}}{d \b{x}^{\^3}}= (\frac{d \b{X}}{d \b{x}})^{\^ 3}$$ is the Jacobian determinant. (Note, I do not write this as $$\| J \|$$ because it can be negative if the coordinate change swaps orientations, yet the vertical bars visually imply that it's positive). This is generally a much better way to think about what a Jacobian is. The "general rule" here is that if a linear transformation $$Q$$ acts on each term of a $$k$$-wedge product $$\b{a} \^ \b{b} \^ \b{c}$$, you can factor it out into the $$k$$-exterior power:

$$(Q \b{a}) \^ (Q \b{b}) \^ (Q \b{c}) = Q^{\^ 3} (\b{a} \^ \b{b} \^ \b{c})$$

If $$Q$$ is $$n \times n$$ then $$Q^{\^ n} = \det Q$$.[^det]  This identity gives the above with $$Q = \nfrac{d \b{X}}{d \b{x}}$$ and $$\b{a} \^ \b{b} \^ \b{c} = dx_0 \^ dy_0 \^ dz_0 = \b{x}^{\^3}$$.

[^det]: Strictly speaking, if $$Q: V \ra W$$ then $$Q^{\^ n}$$ is a linear transformation $$\^^n V \ra \^^n W$$, so its only _component_ $$\det Q = \tr Q^{\^ n}$$ is the determinant, since the determinant has to be a scalar---but this detail rarely matters and people often fudge it.

The first-order approximation of the determinant can be seen as following from the fact that $$\^$$ is a linear operator on both arguments. So

$$
\begin{aligned}
d (a \^ b \^ c) &= \p_a (a \^ b \^ c) da + \p_b (a \^ b \^ c) db + \p_c (a \^ b \^ c) dc \\
&= (b \^ c) da + (c \^ a) db + (a \^ b) dc \\
&= (a,b,c)^{\^ 2} \^ (da, db, dc)
\end{aligned}
$$

Things are a bit more confusing in our case, because we're starting with $$J = \nfrac{d \b{x}^{\^ 3}}{d \b{x}^{\^3}}$$ and then taking the _variational_ derivative of that, for the small approximation $$\b{x} = \b{x} + \delta \b{x}$$. It looks like this:

$$
\begin{aligned}
\delta \frac{d \b{x}^{\^3}}{d\b{x}^{\^3}} &= \frac{d(\b{x} + \delta \b{x})^{\^3}}{d \b{x}^{\^3}} - \frac{d \b{x}^{\^3}}{d\b{x}^{\^3}} \\
&= \frac{d \b{x}^{\^2} \^ d \delta \b{x}}{d \b{x}^{\^3}} \\ 
&= \frac{\delta \b{x}}{d \b{x}} \\
&= \del \cdot \delta \b{x}
\end{aligned}
$$

I definitely can't claim this manipulation is rigorous without working it all out in indexes, but it makes some intuitive sense. (In particular, it's not at all clear that it's valid to cancel out two of the factors of $$d \b{x}^{\^2} / d \b{x}^{\^3} = 1/d \b{x}$$) I have some ideas for doing it symbolically and rigorously at the same time, but I haven't figured out all the details yet.

By the way, the general identity that $$d \det Q = \det Q \tr (Q^{-1} dQ)$$ is called [Jacobi's formula](https://en.wikipedia.org/wiki/Jacobi%27s_formula). You can see a vestigate of it in the above if you recognize $$Q^{\^2}$$, or more generally $$Q^{\^n-1}$$, as $$Q^{\^n-1} = (\det Q) Q^{-1}$$. It is a little hard to do the computation satisfactorily with just exterior powers though. (Or at least, I'm not happy with it.)

</aside>

<aside class="toggleable" id="variation" placeholder="<b>Aside</b>: Note on variational calculus <em>(click to expand)</em>">

For the most part, variational calculus is "exactly the same" as regular calculus. That is, the symbol $$\delta$$ literally means the same thing as the symbol $$d$$. I suspect that the only reason for using a different symbol is that sometimes $$\delta$$ acts on things which have $$d$$ in them already and it's hard to read if you use the same symbol for both.

$$\delta$$ is usually used for the differential of functionals, that is, functions-of-functions like $$F[q] = \int f(q(t)) dt$$, which can do things like take their derivatives and integrate them in addition to the usual operations of algebra.

The thing to keep in mind with variational calculus is that it is exactly equivalent to the case where you treat the function $$\b{q}$$ as an infinite vector of its data, like

$$q = (q_0, q_1, q_2, \ldots, q_N) = (q(t_0), q(t_1), q(t_2), \ldots, q(t_N))$$

and then let $$N \ra \infty$$ while the space of the points $$t_0 < t_1 < t_2 < \ldots$$ goes to zero. Derivative opeators are then

$$\dot{q} = \{ \frac{q_{i+1} - q_i}{t_{i+1} - t_i} \}$$

and integrals are 

$$\int q(t) dt = \sum q(t_i) (t_{i+1} - t_i)$$

All of the identities for variational calculus hold exactly if you work them out on this discrete approximation and then take all the limits. 

The one case that gets weird is that derivatives end up taking a dependency on the "boundaries" of the vector. Here $$\dot{q}$$ is defined at every point, but at $$t_N$$ the derivative is $$(q_{N+1} - q_N) / (t_{N+1} - t_N)$$ ... which is not even part of the $$q$$ vector at all. The same is kinda true at $$q_0$$, although not in the particular way I've written things here; I'm not sure how to justify it.

Point being, if a functional involves $$\dot{q}$$, then necessarily it has an (implicit) dependency on the values of $$\dot{q}(t_N)$$ and $$\dot{q}(t_0)$$ which are not part of the data of $$q$$ itself. This matters in physics; I don't know if it will matter here.

This perspective is useful for interpreting what is meant by $$\delta \b{x}$$. It is simply a giant vector of differentials, one for each point of $$\Omega$$:

$$\delta \b{x} \equiv (dx_1, dx_2, dx_3, \ldots)$$

In particular an absolutely minimal variation would be one that moves a single point and leaves all others unchanged, like $$\delta \b{x} = (0, 0, 0, \ldots, dx_i, \ldots, 0 0, \ldots)$$. Sometimes it is helpful to consider this as an example in making sense of expressions involving a variation.

(If you put some continuity requirements on it or something then it starts to be more complicated than this, but I don't think we're doing that here.)

</aside>

<aside class="toggleable" id="lagrangian" placeholder="<b>Aside</b>: Note on Lagrangian Coordinates <em>(click to expand)</em>">

One thing that was confusing for me is, how do you think about comoving/Lagrangian coordinates for the rest of space, the points which didn't start inside the fluid? I'm still not sure entirely. but here some thoughts.

One answer is that you just don't think about them as being defined at all---so the variable $$\b{x}$$ only spans over the region initially filled by the fluid. But various manipulations in this book clearly do not respect this. For example in a second we'll integrate 

$$\int 1_{\Omega}(\b{x}) f(\b{x}) \d V$$

over all space, where $$\b{x} = \b{X}(\b{x}, \e)$$ is a comoving coordinate for the fluid. This clearly needs to be defined everywhere, not just inside the fluid. Now you might argue that this is not a problem because you can reduce the integral to $$\int_{\Omega}$$ _before_ switching to comoving coordinates... but that feels like the wrong approach. You should be able to instead compute

$$\int 1_{\Omega}(\b{X}(\b{x}, \e)) f(\b{X}(\b{x}, \e)) \d V$$

without doing this. 

Some LLM-querying suggests that this is solved with what's called a "fictitious extension", but then it didn't really turn up anything about that.

Off the top of my head it seems like you can basically imagine that $$\b{x}$$ is extended to be defined everywhere, and remaps points as necessary to "stay out of the way" of the fluid, so that $$\b{X}$$ is bijective everywhere, not just on $$\Omega$$. I have no idea if this runs into theoretical problems but I don't see why it would. (I mean: you can have a fluid where everything starts spread out and then gets arbitrarily close together, or vice versa... but you can still have a bijection in each case). 

</aside>


-------

## 2. Indicators (A.33 through A.47)

I have been aware for some time that indicator functions and their differentials are a much more cogent way of doing calculus on complicated surfaces (see my article [Delta Functions via Inverse Differentials]({% post_url 2024-03-12-indicators %}), although it's hard to read and I can barely do the math now). I always meant to write a followup to that in which I figured out all this overlapping surface stuff, but I lost my mind instead, so I guess I have to do it now.

TCAT's notation for indicator functions is awful and I immediately hate it. Upsilon ($$\Upsilon$$)? Calligraphic $$\mathcal{J}$$? Seriously?

I will instead write

$$1_{\Omega}(\b{x}) = \begin{cases}
  1 & \b{x} \in \Omega \\ 
  0 & \text{otherwise}
\end{cases}$$

for the indicator for a generic surface $$\Omega$$ (of any dimension). Note that I do not want to define whether we consider the border as part of the region or not; it should not matter.

I will also not be writing $$w,n,s$$ for wetting/non-wetting/solid phases because (a) I have no idea what those mean and (b) all of this stuff is just generic math with no application to fluid mechanics and therefore it should not be written in porous-media-flow-specific-language

For the indicators for multiple surfaces at once we can conceptually just multiply them together. I'll write $$A,B,C, \ldots$$ for different surfaces. Then we can write

$$1_{AB} \stackrel{\text{means}}{=} 1_{A \cap B} = 1_A 1_B, 1_{ABC} = 1_A 1_B 1_C, \text{etc.}$$

The general point of indicator functions is that we can turn integrals over points/lines/surfaces/volumes  into integrals against indicator functions

$$\int_{\Omega} f \d \Omega = \int f 1_{\Omega} \d V \tag{A.38}$$

This is pretty straightforward in the case of volume integrals. (Note that I'm writing an integral without a boundary to mean an integral over all space, $$\int \equiv \int_{\bb{R}^3}$$). For surfaces, lines, and points we have to use other techniques involving delta functions, which will require some exposition. For some reason TCAT is apparently avoiding talking about delta functions explicitly, which is silly; I will be using them anyway. But I'll keep following the book first.

--------


TCAT first observes that the variation of an indicator for a surface should be zero:

$$\delta 1_k = 0 \tag{A.35}$$

This took a while to understand. The key insight is that the indicator for the surface _in comoving coordinates_ never actually changes at all:

$$\delta 1_k(\b{x}) \approx 1_k(\b{x} + \delta \b{x}, \e + d \e) - 1_k(\b{x}) = 0$$

Even though the indicator for the surface at any particular value of $$\e$$ in ambient/Eulerian coordinates is a different function, there is no change relative to the $$\x$$ coordinate system. That is, the indicator for a new surface $$\Omega^*$$ at some value of $$\e$$ is the same as the indicator for the initial $$\Omega$$ when expressed _as a function of initial_ $$\b{x}$$:

$$1_{\Omega^*}(\b{x}^*) = 1_{\Omega^*}(\b{X}(\b{x}, \e)) = 1_{\Omega} (\b{x})$$

in the sense that it is $$1$$ if a given point $$\b{x}$$ is inside $$\Omega$$ initially. So we are varying is the shape of $$\Omega$$ itself, but $$1_{\Omega}$$ incorporates this shape in two different ways, and they cancel out. Meanwhile the individual derivatives are not zero:

$$
\begin{aligned}
\delta 1_{\Omega} &= \delta_{\b{x}} 1_{\Omega} + \delta_{\perp \b{x}} 1_{\Omega} = \p_{\b{x}} 1_{\Omega} \cdot \delta \b{x} + \delta_{\perp \b{x}} 1_{\Omega} = 0\\
\end{aligned}
$$

Therefore:

$$\delta_{\perp \b{x}} 1_{\Omega} = - \p_{\b{x}} 1_{\Omega} \cdot \delta \b{x} \tag{A.36}$$

TCAT writes this as $$\odelta 1_{\Omega} = \delta \b{x} \cdot \del 1_{\Omega}$$, and if you write it out explicitly in terms of $$\e$$, then $$\odelta 1_{\Omega} = \p_{\e} 1_{\Omega} \d \e$$.

Note that the variation of a surface is not zero respect with ambient coordinates, but that's not an operation we have considered anywhere. For that matter it is not even clear what a variation with respect to ambient coordinates would mean: $$1_{\Omega^*}(\b{x}^*) = 1_{\Omega}(\b{x}^*, \e)$$ is a function of ambient coordinates in the $$\b{x}^*$$ coordinate, but it is _regular_ function of a single ($$\bb{R}^n$$-valued) coordinate, not of a functional, so we would just talk about the derivative with respect to ambient coordinates rather than the variation.

------


**An Example**

It is helpful to see an explicit $$1d$$ example. Suppose $$1_{(0, 1)}(x)$$ describes a fluid which is located in $$(0,1)$$, and our choice of variation is $$x^* = X(x, \e) = x + \e$$. This means that, at a particular value of $$\e$$, the fluid packet which started at $$x$$ is now at $$x^* = x + \e$$. The indicator for the new position of the fluid in ambient/Eulerian coordinates is

$$1_{\Omega^*}(x^*) = 1_{(\e, 1+\e)}(x^*) = 1_{(0, 1)}(x^*-\e)$$

But, when we parameterize $$x^*$$ by $$x$$, the two $$\e$$ cancel:

$$
\begin{aligned}
1_{\Omega^*}(x^*) &= 1_{(\e, 1+\e)}(x^*) \\
&= 1_{(0, 1)}(x^* - \e) \\
&= 1_{(0, 1)}(x + \e - \e) \\
&= 1_{(0, 1)}(x) \\
&= 1_{\Omega}(x)
\end{aligned}
$$

The 1d differential expanded:

$$
\begin{aligned}
d 1_{\Omega}(x^*, \e) &= d 1_{(0, 1)}(x^* - \e) \\
&= \p_{x} 1_{(0, 1)} dx^* - \p_{\e} 1_{(0, 1)} d \e \\
d_{\e} 1_{\Omega^*} &= \p_{x} 1_{(0, 1)} dx^*
\end{aligned}
$$

Which, upon dropping the $$*$$s and switching to variational notation, becomes

$$\delta_{\perp x} 1_{\Omega} = \p_{x} 1_{(0, 1)} \delta x$$

More generally it is the case that you can write an indicator for any volume in $$\bb{R}^n$$ as $$1_{\Omega} = 1_{n<0}(n)$$ for some choice of "normal coordinate" $$n$$ that is zero on the boundary of $$\Omega$$ (which you can pick to be the value of the [signed distance field](https://en.wikipedia.org/wiki/Signed_distance_function) for the surface, although it does not generally need to represent distance away from the surface for this argument to work). The level sets of $$n$$ are then parameterized by two additional orthogonal coordinates $$(u,v)$$, and the variation is $$\b{x}^* = \b{x} + \delta \b{x} = (n + \delta n, u + \delta u, v + \delta v)$$. The 1d example then applies at every individual point using just the $$n$$-coordinate:

$$1_{\Omega^*}(\b{x}^*) = 1_{n + \delta n < 0}(n + \delta n) = 1_{n<0}(n)$$

Which is one way of seeing why this holds in general.

For later I will mention that $$1_{n<0}(n)$$ can be written as $$\theta(-n)$$ as well, where $$\theta$$ is the unit step function.

--------

Now the rest of this section. As mentioned above, a volume integral converts into an integral against an indicator:

$$\int_{\Omega} f \d \Omega = \int 1_{\Omega} f \d V \tag{A.38}$$

TCAT discusses integrals over interfaces which are specifically the boundaries between two phases, like $$1_{\alpha \beta}$$, and then they write functions on this boundary as $$f_{\alpha \beta}$$, which is weird. I am interested in general surface integrals as well, but this is certainly an interesting special case.

Surface integrals can be expressed as integrals against 2d delta functions, but this requires the integration proceeding over a pre-existing surface that contains them, which is not very useful except in the case where your surface is already contained in a plane or something:

$$\int_{S} f \d S \? \int_{A \ni S} 1_{S} f \d A$$

This can be converted into a surface integral in two ways: either via the standard calc 3 surface integral, or via regarding the surface as the gradient of an indicator for the volume it touches. In the case where our surface of integration is the boundary between two surfaces $$\alpha, \beta$$, then we can write the delta function for the boundary as the gradient of the indicator for either surface:[^delta]

[^delta]: Sorry for re-using the $$\delta$$ symbol which is also used for variations. Really I don't like the fact that they're called delta functions at all because the symbol is too overloaded. When possible I will distinguish them by indicating that $$\delta_{\alpha}(\b{x})$$ arguments and so is a function, not a variation.

$$- \p_{\b{x}} 1_{\alpha} \cdot d \b{x}$$

Strangely, although this is the same object as from the variation $$\delta 1_{\alpha}$$ earlier, they're not actually referencing that derivation. Also strange is that they don't show how it is written as a delta function. (I think they are avoiding using delta functions? perhaps because they got picked on earlier in their careers for using them unrigorously, or something like that.)

Note that the negative sign is because the indicator goes from $$0$$ to $$1$$ as you pass _into_ $$\alpha$$, but usually we think of surfaces as having their normals pointed _outwards_, so we negate it to match that convention. (The fact that normals point outwards is just a convention and doesn't affect the math at all.)

TCAT claims that a surface integral can be written

$$\int_{\alpha \beta} f \d A \? \int f \, (- \b{n} \cdot \p_{\b{x}} 1_{\alpha}) 1_{\alpha \beta} \d V \tag{A.41}$$

But their explanation for this formula is completely missing; they just cite their other book for it. I will do things in more detail.

First, the relevant identity here is really

$$\delta_{\p \alpha}(\b{x}) \, \b{n} = - \p_{\b{x}} 1_{\alpha} $$

Even this is a bit hard to read because it's not clear what $$\delta_{\p \alpha}(\b{x})$$ means. To make sense of it, we can write things in a coordinate system where $$\b{x} = \b{0}$$ on the nearest point of the boundary. (Alternatively you can replace $$\b{x}$$ with $$(\b{x} - \b{x}_0)$$ everywhere in this calculation, for $$\b{x}_0$$ the nearest point on the boundary.) Then the delta function has the form

$$\delta_{\p \alpha}(\b{x}) \, \b{n} \approx \delta(\b{n} \cdot \b{x}) \, \b{n}$$

Which is because it's the derivative of the local representation of the step function:

$$- \p_{\b{x}} 1_{\alpha} \approx \p_{\b{x}} \theta(\b{n} \cdot \b{x}) = \delta(\b{n} \cdot \b{x}) \, \b{n}$$

Note that the $$\b{n}$$ does not have to be a unit vector here. There's a delta function identity $$\delta(a \b{x}) = \nfrac{\delta(\b{x})}{\| a \|}$$ which serves to cancel out the magnitude:

$$\delta(\b{n} \cdot  \b{x}) \, \b{n} = \frac{\delta(\hat{\b{n}} \cdot  \b{x})}{\| \b{n} \|} \b{n} = \delta(\hat{\b{n}} \cdot  \b{x}) \, \hat{\b{n}}$$

So we get the unit vector version for free. The dot product with $$\hat{\b{n}} = \b{n}_{\alpha}$$ then serves to cancel out this vector term:

$$- \hat{\b{n}} \cdot \p_{\b{x}} 1_{\alpha} = \hat{\b{n}}\cdot (\delta(\b{n} \cdot \b{x}) \, \b{n}) = \delta(\hat{\b{n}} \cdot \b{x})$$

We can go further and say that, if $$\b{x} = \b{0}$$ on the boundary, then locally it has the form $$\b{x} = n \hat{\b{n}} + u \hat{\b{u}} + v \hat{\b{v}}$$, so $$\hat{\b{n}} \cdot \b{x}$$ is just the $$n$$ coordinate (the signed distance field value):

$$-\b{n}_{\alpha} \cdot \p_{\b{x}} 1_{\alpha} =  \delta(n)$$

Which makes sense because a path integral $$\int_{\b{a}}^{\b{b}} d 1_{\alpha} = 1_{\alpha}(\b{x}) \mid_{\b{a}}^{\b{b}} = 1_{\alpha}(\b{b}) - 1_{\alpha}(\b{a})$$ changes value only if, in $$(n,u,v)$$ coordinates, the $$n$$ coordinate crosses over zero.

Therefore the surface integral of the boundary of $$\alpha$$ is really

$$\int_{\alpha} f \d A = \int f \, (- \b{n} \cdot \p_{\b{x}} 1_{\alpha}) 1_{\alpha} \d V = \int \delta(n)  f 1_{\alpha} \d V $$

The reason that the $$1_{\alpha}$$ is still in there is because we still have to limit ourselves to the extent of the actual two-dimensional surface that is the boundary of $$\alpha$$. If $$\alpha$$ is not closed then this will look like an indicator function in the $$(u,v)$$ coordinates alone, like $$1_{A}(u,v)$$ for $$A \sub \bb{R}^2$$. If $$\alpha$$ is closed then it has no boundary and the $$1_{\alpha}$$ can be omitted.

In the case where the surface of integration is over the intersection of two volumes $$\alpha, \beta$$ the same applies, except that we use $$1_{\alpha \beta}$$ instead. The term serves to restrict to the subsurface of the two-dimensional surface $$n=0$$ which we're actually trying to integrate over. In something closer to TCAT's notation:

$$\int_{\alpha \beta} f \d A = \int f \, (- \b{n} \cdot \p_{\b{x}} 1_{\alpha}) 1_{\alpha \beta} \d V = \int f \, \delta(n_{\alpha}) 1_{\alpha \beta} \d V \tag{A.42}$$

In the case where $$\alpha$$ is closed and $$\beta$$ touches the entire boundary of $$\alpha$$ the term can be dropped.

For intuition's sake we can simplify further by writing $$f$$ in those imaginary normal coordinates, $$f = f(n, u, v)$$, in which case it looks particularly simple

$$\int_{\p \alpha} f \d A = -\int \delta(n) f(n, u, v) 1_{\alpha} \d V = \int_{u, v} f(0, u, v) \d u \d v$$

Where the integration is over whatever $$(u,v)$$ surface parameterizes $$\p \alpha$$. Normal coordinates are maybe not that useful for computation since you aren't necessarily able to construct them, especially away from the surface, but I find them very useful for intuition. Here is the same calculation I just showed but with $$1_{\alpha} = 1_{n < 0}(n, u, v)$$ from the start:

$$
\begin{aligned}
\delta_{\p \alpha}(\b{x}) \b{n} \cdot d \b{x} &= - d1_{\alpha} \\
&= -\p_{\b{x}} 1_{\alpha} \cdot d \b{x} \\
&= -(\p_n dn + \p_u du + \p_v dv) 1_{\alpha} \\
&= -\p_n 1_{n < 0}(n,u,v) d n \\
&= -\p_n \theta(-n) \d n \\
&=  \delta(n) dn \\
\end{aligned}
$$

Note that all of this also works in 2d (or any other d for that matter), in which case the resulting integral is over a curve instead of a surface, and of course there is only a $$(u)$$ coordinate instead of a $$(u,v)$$ coordinate to parameterize the integration surface.

Comment: I'm not particularly happy with any of this in the form I've stated it here. I think there is a better way to think about all of this in terms of "inverse differentials", as I have written about [here](http://localhost:4000/2024/03/12/indicators.html). However, when I wrote that post I had not figured all the details out yet and I think there are a few mistakes in it. I am hoping that after I work through all this stuff I can write a followup which gets it correct.

------

For TCAT's integral over a common curve between three volumes $$\alpha, \beta, \gamma$$, we repeat the above but include delta functions for both boundaries. We can't just use $$\delta_{\p \alpha} \delta_{\p \beta}$$, however, because they may not necessarily be orthogonal, and you can't multiply delta functions which are not in orthogonal directions (more on this later...) Instead you need the first differential to be the normal between two of the surfaces, say $$\delta_{\alpha} \b{n}_{\alpha} = - \p_{\b{x}} 1_{\alpha}$$, and then the seond one is the normal of _that_ boundary, $$\delta_{\alpha \beta} \b{n}_{\alpha \beta} = -\p_{\b{x}} 1_{\alpha \beta}$$

So

$$
\begin{aligned}
\int 1_{\alpha \beta \gamma} f \d V &= \int 1_{\alpha \beta \gamma} \delta_{\alpha} \delta_{\alpha \beta} f \d V \\
&= \int 1_{\alpha \beta \gamma} (- \b{n}_{\alpha} \cdot \p_{\b{x}} 1_{\alpha}) (- \b{n}_{\alpha \beta} \cdot \p_{\b{x}} 1_{\alpha \beta}) f \d V
\end{aligned} \tag{A.47}
$$

In imaginary normal coordinates you can think of this as $$(n_{\alpha}, n_{\alpha \beta}, t)$$, where

* $$n_{\alpha}$$ parameterizes the distance from the boundary of $$\alpha$$ (with $$\beta$$)
* $$n_{\alpha \beta}$$ is basically the normal coordinate for the boundary region $$\alpha \beta$$ itself (so, for the $$(u,v)$$ coordinates that are left after you move to $$(n, u, v)$$ coordinates), and 
* $$t \in T$$ is an integration range that parameterizes the common curve between $$\alpha, \beta, \gamma$$. Then

$$\int 1_{\alpha \beta \gamma} f \d V = \int \delta(n_{\alpha}) \delta(n_{\alpha \beta}) 1_{t \in T} f \d V$$

This is not the most usable form, but it is easier for me to think about what the integral means when it's written this way.

--------

## A.4 - A.6 Variations of Integrals

### A.4 Variation of a Volume Integral

Now we proceed to vary the surfaces in the preceding integrals. The derivations get pretty messy but the results make a lot of sense, so I'm going to try to reach them by skipping as many steps as possible.

First we vary

$$F_{\alpha} = \int_{\alpha} f_{\alpha} \d V \tag{A.48}$$

Using $$\delta_{\perp \b{x}} 1_{\alpha} = - \p_{\b{x}} 1_{\alpha} \cdot \delta \b{x}$$

$$
\begin{aligned}
\delta F_{\alpha} &= \delta \int_{\alpha} f_{\alpha} \d V  \\
&= \delta \int f_{\alpha} 1_{\alpha} \d V  \\
&= \underbrace{\delta_{\perp \b{x}}}_{\text{??}}\int f_{\alpha} 1_{\alpha} \d V \\
&= \int \delta_{\perp \b{x}}(f_{\alpha} 1_{\alpha}) \d V \\
&= \int [\delta_{\perp \b{x}} f_{\alpha} 1_{\alpha} + f_{\alpha} \delta_{\perp \b{x}} 1_{\alpha}] \d V \\
&= \int_{\alpha} \delta_{\perp \b{x}} f_{\alpha} \d V + \int f_{\alpha} [ - \p_{\b{x}} 1_{\alpha} \cdot \delta \b{x}] \d V \\
&= \int_{\alpha} \delta_{\perp \b{x}} f_{\alpha} \d V + \underbrace{\int_{\p \alpha} f_{\alpha} \b{n} \cdot \delta \b{x} \d A}_{\text{??}}
\end{aligned} \tag{A.53}
$$

There are two confusing parts to this derivation which I have indicated with ??s.

First, the reason that we can convert $$\delta$$ to $$\delta_{\perp \b{x}}$$ between lines (2) and (3) is that the integral $$F_{\alpha} = \int_{\alpha} f_{\alpha} \d V$$ is not a function of $$\b{x}$$ _at all_. That is: although the integral proceeds over the $$\b{x}$$ variable internally, the variable ends up "integrated out" and so there is no functional dependency at the end. This is no different from how an integral $$\int_a^b f'(t) dt$$ has no $$t$$ dependency, but it's a bit harder to see due to the multivariable notations. It is somewhat easier to understand if we write the integral as

$$F_{\alpha} = \int_{\alpha} f_{\alpha}(\b{x}) d^{\^3} \b{x}$$

So we are integrated over the values of the $$\b{x}$$ variable. But the variable only depends on the integration _ranges_ of this variables, not the variable itself. When $$\delta \b{x}$$ shows up on the last line, it's because when we vary the shape $$\alpha$$, the variation can be written

$$\delta \alpha = \alpha + \p \alpha \cdot \delta \b{x}$$

(as I was using earlier to rederive (A.32)). Both $$\alpha$$ and $$\p \alpha$$ are fixed by the initial shape of $$\alpha$$, so the entire 'variation' is given by the values of $$\delta \b{x}$$ at each point (/differential area) on the boundary. It would probably be reasonable to write this as $$\delta (\p \alpha)$$ to remove the confusing $$x$$ variable entirely, in which case the final term could be written

$$\int_{\p \alpha} f_{\alpha} \b{n} \cdot \delta \b{x} \d A = \int_{\delta (\p \alpha)} f_{\alpha} d V$$

Speaking of the boundary integral term, the second glaring issue in the derivation of (A.53) is the unjustified transformation between the last two lines:

$$\int f_{\alpha} [ - \p_{\b{x}} 1_{\alpha} \cdot \delta \b{x}] \d V \? \int_{\p \alpha} f_{\alpha} \b{n} \cdot \delta \b{x} \d A$$

TCAT writes "The gradient of the indicator function in the second term is the directional delta function that converts this integral over a volume to an integral over the boundary of $$\Omega_{\alpha}$$.", which does not, in my opinion, actually suffice to justify this step. Not that it isn't correct; it doesn't really explain it adequately. Really it is the same justification that is missing for (A.41) which I already talked about for a while earlier. To recap:

The gradient of an indicator acts like a delta function in the normal direction:

$$
\begin{aligned}
- \p_{\b{x}} 1_{\alpha} &= \delta (\b{n} \cdot \b{x}) \b{n} \\
&= \delta(n) \b{n}
\end{aligned}
$$

 Which is why this was true:

$$ - \p_{\b{x}} 1_{\alpha} \cdot d \b{x} =  \delta(n) dn$$

(since $$d \b{x} = (dn, du, dv) = \b{n} \d n+ \b{u} \d u + \b{v} \d v$$ when written as a 'vector')

This time, however, we are contracting it with the variation $$\delta \b{x}$$ instead of the differential $$d \b{x}$$. Still, we can write $$\delta \b{x} = \b{n} \delta n + \b{u} \delta u + \b{v} \delta v$$ on the boundary, such that

$$- \p_{\b{x}} 1_{\alpha} \cdot \delta \b{x} = \delta(n) \delta n$$

(... so sorry for the two different meanings of $$\delta$$; that's supposed to be the delta function in $$n$$ times the variation of $$n$$)

Therefore 

$$\int f_{\alpha} [ - \p_{\b{x}} 1_{\alpha} \cdot \delta \b{x}] \d V = \int f_{\alpha} [\delta(n) \delta n] \d V = \int_{\p \alpha} f_{\alpha} (\delta n) \d A$$

which recovers their version when $$\delta n$$ is written as $$\b{n} \cdot \delta \b{x}$$ again, and the $$dn$$ component of $$dV = dn \^ du \^ dv$$ has been integrated out by the delta function.

I still think my version, writing $$\delta \alpha = \alpha + \p \alpha \cdot \delta \b{x}$$, gives a faster version of this. It is improved further by writing $$\p \alpha \cdot \delta \b{x} = (\p \alpha) (\delta n)$$, because that honestly makes a ton of sense---of course the boundary of alpha times a variation in the normal direction gives a volume.

$$\delta_{\alpha} \int_{\alpha} f_{\alpha} \d V = [\int_{\alpha + \p \alpha \delta n} - \int_{\alpha} ] f_{\alpha} \d V = \int_{(\p \alpha) \delta n} f_{\alpha} \d V = \int_{\p \alpha} f_{\alpha} \delta n \d A$$

Aside: I made a small improvement there of writing $$\delta_{\alpha}$$ instead of $$\delta_{\b{x}}$$, since properly we can't vary with respect to the $$\b{x}$$ variable... so really it makes the most sense to split the variation apart as

$$\delta = \delta_{\alpha} + \delta_{\perp \alpha}$$

(where $$ \delta_{\perp \alpha}$$ is the term TCAT writes as $$\odelta$$), rather than the $$\delta_{\b{x}} + \delta_{\perp \b{x}}$$ I was using before.

------

### A.5. Variation of a Surface Integral

TCAT considers the case where a surface $$\Omega_{\alpha \beta}$$ is defined as the boundary between the surfaces $$\Omega_{\alpha}$$ and $$\Omega_{\beta}$$. The derivation is somewhat long and therefore difficult to follow, but it is mostly methodical. However, it's not very satisfactory to have a long derivation that produces a short result, because there ought to be a less roundabout way to the same result that captures the intuition better. I will try to find it.


We ask: what terms should contribute to the variation of $$F_{\alpha \beta} = \int_{\alpha \beta} f_{\alpha \beta} \d A$$?

1. There's a term for the independent variation in $$f$$, $$=\int \odelta f \d A$$.
2. There's a term for "dilations" of the boundary, where more surface area shows up because of the boundary expanding, which I am not immediately sure how to write.
3. There's a term for expansion of the boundary _of_ the boundary, $$\delta \Omega_{\alpha \beta} \cdot \delta \b{x}$$, which looks like $$\b{n}_{\alpha \beta} \cdot \delta \b{x}$$ where $$\b{n}_{\alpha \beta}$$ is the normal of this boundary-of-boundary.

The formula they come up with is

$$
\begin{aligned}
\delta F_{\alpha \beta} &= \delta \int_{\Omega_{\alpha \beta}} f_{\alpha \beta} d \frakr \\
&= \underbrace{\int_{\Omega_{\alpha \beta}} \odelta' f_{\alpha \beta} \d \frakr}_{1} - \underbrace{\int_{\Omega_{\alpha \beta}} f_{\alpha \beta} \del'_{\alpha \beta} \cdot \b{I}'_{\alpha \beta} \cdot \delta \b{x} \d \frakr}_{2} + \underbrace{\int_{\Gamma_{\alpha \beta}} f_{\alpha \beta} \b{n}_{\alpha \beta} \cdot \delta \b{x} \ d \frakr}_{3}
\end{aligned} \tag{A.64}
$$

Our (3) shows up verbatim in the resulting formula (A.64), so it's fine. (1) is almost the same, but they have this $$\odelta' = \odelta + \delta \b{x} \cdot \b{n} \b{n} \cdot \del$$ object instead of just $$\odelta$$, which they call the "fixed point variation on the surface". And (2) requires some investigation because it's not obvious why it has the form it does.

So we need to investigate why (1) is a bit different and what (2) means.

First, TCAT uses the objects $$\del'_{\alpha \beta}$$ and $$\b{I}'_{\alpha \beta} = \b{I} - \b{n}_{\alpha} \b{n}_{\alpha}$$ to write the second term, which I think requires more explanation than they give. The prime symbol $$'$$ is being used to mean that an operator is of one dimension less than it would normally be, so this is a _surface_ derivative and a _surface_ projection operator rather than volumes. (Similarly $$\del''$$ and $$I''$$ are derivatives/projections for curves). I don't love this notation; the subscript should really already be telling us that.

Here is how I think about these projections:

$$I$$ is the identity tensor on vectors in the whole space. Given any orthonormal frame you can write this out as dyadics over each vector:

$$I = \b{xx} + \b{yy} + \b{zz} = \b{uu} + \b{vv} + \b{nn}$$

Subtracting off the projection onto a particular vector removes that direction from the identity. For the case of the boundary $$(\alpha \beta)$$, you can subtract off the normal $$\b{n}_{\alpha}$$ ($$=-\b{n}_{\beta}$$) to get 

$$\b{I}'_{\alpha \beta} = I - \b{n}_{\alpha} \b{n}_{\alpha}$$

I will usually just write the normal as $$\b{n}$$ and assume the existence of a $$(\b{u}, \b{v}, \b{n})$$ frame on the boundary. I also like to write $$I_{uv} = \b{uu} + \b{vv}$$ and $$I_n = \b{nn}$$ for the projections onto certain sets of directions. I also don't care about writing $$\b{I}$$ for $$I$$ since it's not really a vector anyway. So I would write their projection onto the surface as

$$\b{I}'_{\alpha \beta} = I - I_n = (\b{uu} + \b{vv} + \b{nn}) - (\b{nn}) = \b{uu} + \b{vv} = I_{uv}$$

Next, a primed derivative is a derivative composed with a projection operator. For example, the full gradient is

$$\del = \b{n} \p_n + \b{u} \p_u + \b{v} \p_v$$

and the primed / surface gradient is

$$\del'_{\alpha \beta} = I_{\alpha \beta} \del = (I - \b{nn}) \del =  \b{u} \p_u + \b{v} \p_v$$

Which we could write in $$(u,v)$$ coordinates as $$\del = (\p_n, \p_u, \p_v)$$ and $$\del'_{\alpha \beta} = (0, \p_u, \p_v)$$.

The primed _variation_ is a bit weirder. TCAT writes

$$\odelta' f = \odelta + \delta \b{x} \cdot \b{n} \b{n} \cdot \del f$$

To understand this, recall that

$$\delta f = (\delta_{\b{x}} f + \odelta f) =  \delta \b{x} \cdot \del_{\b{x}} f + \odelta f$$

Evidently they are factoring the first term as

$$\delta f =  \delta \b{x}  \cdot [\b{u} \p_u + \b{v} \p_v f + \b{n} \p_n f]+ \odelta f$$

and then consolidating the $$\b{n}$$ component into the second term:

$$\delta f= \delta \b{x} \cdot [\b{u} \p_u + \b{v} \p_v f] + [(\delta \b{x} \cdot \b{n}) \p_n f + \odelta f] = \delta \b{x} \cdot \del_{uv} f  + \odelta' f$$

I'm still kinda confused why these terms are being combined. I guess the justification is something like this:

1. When $$F_{\alpha \beta}$$ is varied, there are terms which change due to the way that $$f_{\alpha \beta}$$ changes the point it is evaluated at, and terms due to the way that the integration region itself changes in size/shape.
2. All of the terms due to $$f_{\alpha \beta}$$ changing are consolidated into $$\odelta' f$$. This means both changes due to $$\e$$ (the parameter for the variation; remember that $$f = f(\b{u}(\b{x}, \e))$$ ), and changes due to the surface moving in the $$\b{n}$$ direction and thereby evaluating $$f$$ at a new point, $$f(\b{x} + \delta \b{x}) \ra f + (\p_n f )(\delta n) = f + (\p_n f )(\b{n} \cdot \delta \b{x})$$

-----

For integral (2), we need to make sense of $$\del'_{\alpha \beta} \cdot I'_{\alpha\beta} \cdot \delta \b{x}$$. (This term turns out to be related to the [mean curvature](https://en.wikipedia.org/wiki/Mean_curvature) via $$J = 2H = \del \cdot \b{n}$$, but they don't talk about that in this section.)

Their derivation consists of moving the divergence of $$\b{n}$$ over to a divergence of $$I_{uv}$$:

$$
\begin{aligned}
(\del' \cdot \b{n})(\b{n} \cdot \delta \b{x}) &= (\del' \cdot \b{nn}) \cdot \delta \b{x} \\
&= \del' \cdot (I - I'_{\alpha \beta}) \cdot \delta \b{x} \\
&= - \del' \cdot I'_{\alpha \beta} \cdot \delta \b{x}
\end{aligned}
$$

Where $$\del' \cdot I = 0$$ because the global identity operator is constant everywhere.

I had a really hard time following this, mostly because I didn't understand what they mean by the divergence of a projection operator. So here are a ton of computations I did to check everything.

These calculations are easier to do in the orthonormal $$(u,v,n)$$ coordinate system. I like to write the projections and derivatives in terms of it as $$\del_{uv} = \del' = (\b{u} \p_u + \b{v} \p_v)$$ and $$I_{uv} = I' = \b{uu} + \b{vv}$$.

A general rule is that the derivatives of unit vectors are orthogonal to the original unit vectors. Since a unit vector $$\b{v}$$ always has length one, its derivative must move it to a nearby point on the unit sphere and therefore is tangent to that sphere. This means has $$(\p_{\b{a}} \b{v}) \cdot \b{v} = 0$$ along any choice of directional derivative $$\b{a}$$. You can see also from

$$0 = \del(1) = \del (\b{u} \cdot \b{u}) = (\del \b{u}) \cdot \b{u} + \b{u} \cdot (\del \b{u}) = 2 (\b{u} \cdot \del \b{u}) = 2 \del_u \b{u}$$
 
Next, a lot of this stuff is quite a bit easier to follow in index notation. In index notation we usually use the symbol $$\p$$ instead of $$\del$$, but they mean the same thing (I generally prefer the $$\p$$ symbol) The gradient of anything is written[^index]

[^index]: Normally I would write this all out with upper/lower indices, but they're not needed here because all the dot products are in Euclidean space.

$$\del \b{u} \equiv \p \b{u} = \p_i u_j$$

This object is the full gradient of $$\b{u}$$, which is a degree-2 tensor. A directional derivative is given by contracting it with another vector on the $$\p$$ index:

$$\del_{\b{a}} \b{u} \equiv \p_a \b{u} = (a_i \p_i) u_j$$

Meanwhile the fact that $$\b{u} \cdot \del \b{u} = 0$$ is expressed as

$$\p_i (u_j u_j) = 2 (\p_i u_j) u_j = 0$$

Note that the contraction here is with the $$\b{u}$$ index. This object is the gradient of the scalar $$\b{u} \cdot \b{u}$$, which is why it is zero. Naturally its directional derivative $$\b{a} \cdot \p(\b{u} \cdot \b{u}) = 2 a_i (\p_i u_j) u_j = 0$$ also.

Divergence is implemented by contracting the derivative index with the thing it is acting on:

$$\del \cdot \b{u} = \p_i u_i$$

When we take the divergence of a dyadic $$\b{ab}$$ it expands into two terms, but the derivative is contracted only with the left one (by convention). However there is still a product rule involving both:

$$\del \cdot (\b{ab}) = \p_i (a_i b_j) = (\p_i a_i) b_j + a_i (\p_i b_j) = (\del \cdot \b{a}) \b{b} + \del_a \b{b}$$

Another way to write this is as the trace of $$\del \b{u}$$, that is, double-contracting it with the identity $$I$$:

$$\del \cdot \b{u} = I_{ij} \p_i u_j$$

I mention that form because you kinda need it to handle the 'surface divergence'---the thing TCAT writes as $$\del'_{\alpha \beta}$$. I'll write it as $$\del_{uv}$$ because it is the divergence in the $$(uv)$$ plane. Basically we work out the ordinary divergence but using  the identity operator for that plane $$I_{uv} = \b{uu} + \b{vv}$$ instead:

$$\del_{uv} \cdot \b{u} = (I_{uv})_{ij} \p_i u_j = (u_i u_j + v_i v_j) \p_i u_j$$

So

$$\del_{uv} =  (u_i u_j + v_i v_j) \p_i = \b{u} \p_u + \b{v} \p_v$$

which is confused because when it acts on $$\del_{uv} \cdot \b{u}$$, the derivative applies _before_ the contractions with the vectors, which is why the only surviving term is the _second_ one:

$$
\begin{aligned}
\del_{uv} \cdot \b{u} &= (u_i u_j + v_i v_j) \p_i u_j \\
&= u_j \p_u u_j + v_j \p_v u_j \\
&= \cancel{\b{u} \cdot \p_u \b{u}} + \b{v} \cdot \p_v \b{u} \\
&= \b{v} \cdot \p_v \b{u} \\ 
\del_{uv} \cdot \b{v} &= \b{u} \cdot \p_u \b{v}
\end{aligned}
$$

------

Now we can work out the identities. The thing that really mystified me at first was: how are these two formulas the same?

$$(\del' \cdot \b{n})(\b{n} \cdot \delta \b{x}) = - \del' \cdot I' \cdot \delta \b{x}$$

Particularly because you can write it like this:

$$\del_{uv} \cdot \b{nn} \cdot \delta \b{x} = -\del_{uv} \cdot (\b{uu} + \b{vv}) \cdot \delta \b{x}$$

and I could not see how the RHS is also proportional to $$\b{n}$$ the way the left side apparently is. Which is why I've got this big digression figuring out how to work it out. So here's the computations in index notation.

$$
\begin{aligned}
\del_{uv} \cdot (\b{nn}) &= (u_i u_j \p_i + v_i v_j \p_i) (n_j n_k) \\
&= u_i u_j (\p_i n_j) n_k + u_i u_j n_j (\p_i n_k) + v_i v_j (\p_i n_j) n_k + v_i v_j n_j (\p_i n_k) \\
&= \b{u} \cdot (\p_u \b{n}) \b{n} + \cancel{(\b{u} \cdot \b{n})} \p_u \b{n} + \b{v} \cdot (\p_v \b{n})  \b{n}+ \cancel{(\b{v} \cdot \b{n}) \p_v \b{n}} \\
&= \b{u} \cdot (\p_u \b{n}) \b{n} + \b{v} \cdot (\p_v \b{n}) \b{n}
\end{aligned}
$$

where I've used the fact that $$(\b{u}, \b{v}, \b{n})$$ is an orthormal frame.

Now the same computation after the substitution $$\b{nn} = I - I_{uv}$$ and then noting that $$\del_{uv}(I) = 0$$, so the derivative is now acting on $$I_{uv} = (\b{uu} + \b{vv})$$. I'm going to do everything with indexes first, even though it's awful, and then repeat symbolically (I need the indices to make sure I don't do anything illegal).

$$
\begin{aligned}
\del_{uv} \cdot (\b{uu} + \b{vv}) &= (u_i u_j \p_i + v_i v_j \p_i) (u_j u_k + v_j v_k) \\ 
&= u_i u_j \p_i (u_j u_k) + u_i u_j \p_i (v_j v_k)+ v_i v_j \p_i  (u_j u_k)+ v_i v_j \p_i (v_j v_k) \\
&= \cancel{u_j \p_u (u_j) u_k} + u_j u_j \p_u (u_k) +  u_j \p_u (v_j) v_k + \cancel{u_j v_j \p_u ( v_k)} \\
& \,\,\,\,\, + v_j \p_v  (u_j)u_k  + \cancel{v_j u_j \p_v (u_k)} +  \cancel{v_j \p_v (v_j) v_k} +  v_j v_j \p_v ( v_k) \\
&= \p_u (u_k) + u_j \p_u (v_j) v_k + v_j \p_v  (u_j)u_k + \p_v ( v_k) \\
\end{aligned}
$$

Now we have $$\p(0) = \p(\b{u} \cdot \b{v}) = u_j \p(v_j) + v_j \p(u_j)$$, so

$$
\begin{aligned}
= [\p_u (u_k) - v_j \p_u (u_j) v_k] + [\p_v ( v_k) - u_j \p_v  (v_j) u_k]
\end{aligned}
$$

The derivatives $$\p_u (u_k)$$ expand as $$\p_u (u_k) = n_k n_j (\p_u u_j) + v_k v_j (\p_u u_j)$$ because  $$\p_u \b{u} = (\p_u \b{u}) \cdot (\b{uu} + \b{vv} + \b{nn}) $$, but the $$\b{u}$$ term is zero (and likewise for $$\b{v}$$). So the subtracted off terms are removing the $$\b{v}$$ and $$\b{u}$$ components of the $$\p_u \b{u}$$ and $$\b{v}$$ terms. This means

$$
\begin{aligned}
&= [n_k n_j (\p_u u_j) + v_k v_j (\p_u u_j) - v_j \p_u (u_j) v_k] + [n^k n_j (\p_v v_j) + u_k u_j (\p_v v_j) - u_j \p_v  (v_j) u_k] \\
&= n_k n_j (\p_u u_j) + n^k n_j (\p_v v_j) \\
&= (\b{n} \cdot \p_u \b{u} + \b{n} \cdot \p_v \b{v}) \b{n}
\end{aligned}
$$

Finally we have something proportional to $$\b{n}$$ (phew). Finally, we can plug in $$\b{n} \cdot \p_u \b{u} = - \b{u} \cdot \p_u \b{n}$$ to get

$$
\begin{aligned}
-(\del_{uv} \cdot (\b{uu} + \b{vv})) &= -((\b{n} \cdot \p_u \b{u} + \b{n} \cdot \p_v \b{v}) \b{n}) \\
&= -((-\b{u} \cdot \p_u \b{n} + -\b{v} \cdot \p_v \b{n}) \b{n}) \\
&= \b{u} \cdot (\p_u \b{n}) \b{n} + \b{v} \cdot (\p_v \b{n}) \b{n} \\
&= \del_{uv} \cdot (\b{nn}) 
&\checkmark
\end{aligned}
$$

I don't know why I did all that. Mostly to make sure I could.

The 'fast' way to do this symbolically is

$$
\begin{aligned}
(\del_{uv} \cdot \b{n}) \b{n} &= \del_{uv} \cdot (\b{nn}) - \cancel{(\b{n} \cdot \del_{uv}) \b{n}} \\
&= (\del_{uv}) \cdot (I - \b{uu} - \b{vv}) \\
&= -\del_{uv} \cdot I_{uv}
\end{aligned}
$$

I was hoping to find something illuminating in the longer version but ... not really. Something is missing here.

----

**Interlude: Curvature**

I wanted to also think about this in terms of curvature explicitly. With the index notation version as a guide here is $$-\del_{uv} \cdot I_{uv}$$ symbolically.

$$
\begin{aligned}
\del_{uv} \cdot I_{uv} &= (\b{u} \p_u + \b{v} \p_v) \cdot (\b{uu} + \b{vv}) \\
&= \cancel{(\b{u} \cdot \p_u \b{u})} \b{u} + (\b{u} \cdot \p_u \b{v}) \b{v} + (\b{v} \cdot \p_v \b{u}) \b{u} + \cancel{(\b{v} \cdot \p_v \b{v})} \b{v} \\
&+ (\b{u} \cdot \b{u}) \p_u \b{u} + \cancel{(\b{u} \cdot \b{v})} \p_u \b{v} + \cancel{(\b{v} \cdot \b{i})} \p_v \b{u} + (\b{v} \cdot \b{v}) \p_v \b{v} \\
&= \p_u \b{u} + (\b{u} \cdot \p_u \b{v}) \b{v} + \p_v \b{v} + (\b{v} \cdot \p_v \b{u}) \b{u} \\
&= \p_u \b{u} - (\b{v} \cdot \p_u \b{u}) \b{v} + \p_v \b{v} - (\b{u} \cdot \p_v \b{v}) \b{u} \\
&= [\b{vv} + \b{nn}] \cdot \p_u \b{u} - (\b{vv}) \cdot \p_u \b{u} + [\b{uu} + \b{nn}] \cdot \p_v \b{v} - (\b{uu}) \cdot \p_v \b{v} \\
&= \b{nn} \cdot \p_u \b{u} + \b{nn} \cdot \p_v \b{v} \\
&= \b{n}(-\b{u} \cdot \p_u \b{n} - \b{v} \cdot \p_v \b{n}) \\
&= - (\del_{uv} \cdot \b{n}) \b{n}
\end{aligned}
$$

Not so helpful. I guess the version that should be the most intuit-able is

$$\del_{uv} \cdot (\b{nn}) = - \del_{uv} \cdot (\b{uu} + \b{vv})$$

but is this? It is clearly related to $$\b{u} \cdot \p_u \b{v} = - \b{v} \cdot \p_u \b{u}$$ and that sort of thing, but I can't visualize the divergence of an operator at all...

The divergence is conceptually given by integrating a vector field $$f$$ over a boundary $$\int_{\p \sigma} f$$. Then $$(\del \cdot f) dV = df$$ is the thing which has $$\int_{\sigma} df$$ equal to that; therefore $$\del \cdot f = df / dV$$. The $$d$$ here has to be interpreted as the displacement w/r/t a change in _volume_: if we write $$\< f, \p \sigma \>$$ to mean the integral of $$f$$ over $$\p \sigma$$, then

$$df = \< f, \p (\sigma + d \sigma) \> - \< f, \p \sigma \> = \< f, \p d \sigma \>$$

for some infinitesimal dilation $$d \sigma$$ in the volume of $$\sigma$$. In the case of $$\del_{uv} \cdot f$$, the value it computes is the first-order change in $$f$$ as you dilate a $$\sigma$$ _in the $$(uv)$$ plane_, that is, on the surface of $$\alpha \beta$$. In the case of $$\del_{uv}\cdot \b{n}$$, we know that as you move in the $$(u)$$ or $$(v)$$ directions, the only thing that $$\b{n}$$ can do is rotate into $$\b{u}$$ or $$\b{v}$$. The components in these directions look like 

$$
\begin{aligned}
d\b{n} &= \b{n}(0 + d \theta_1, 0 + d \theta_2) \\
&= [\cos (d\theta) \b{n} + \sin (d\theta_1) \b{u}^* + \sin (d\theta_2) \b{v}^* + O(d\theta^2)] - \b{n}\\
&= d \theta_1 \b{u}^* + d \theta_2 \b{v}^* \\
&= k_1 \b{u}^* du^* + k_2 \b{v}^* dv^*
\end{aligned}
$$

where 

* $$\b{u}^*, \b{v}^*$$ are the principal directions (the directions of maximum and minimum curvature) 
* $$d\theta$$ is something like the magnitude of $$(d\theta_1, d\theta_2)$$.
* $$d \theta_1 = k_1 du^*$$ and $$d \theta_2 = k_2 dv^*$$, for $$k_1, k_2$$ the principal curvatures.
* I don't have any intuition for why you can choose this particular frame for the computation, but apparently you can.

Therefore 

$$
\begin{aligned}
\del_{uv} \cdot \b{n} &= \b{u}^* \cdot (\p_{u^*} \b{n}) + \b{v}^* \cdot (\p_{v^*} \b{n}) \\
&= k_1 + k_2 \\
&= J
\end{aligned}
$$

which is the mean curvature. Now for the divergence of the _operator_ $$\del_{uv} \cdot (\b{nn})$$ we can use the first order expansion of $$\b{n}$$ again:

$$
\begin{aligned}
d(\b{nn}) &= (k_1 \b{u}^*  du^* + k_2 \b{v}^* dv^* ) \b{n} + \b{n} (k_1 \b{u}^*  du^* + k_2 \b{v}^* dv^* ) \\
\del_{uv} \cdot (\b{nn}) &= (\b{u}^* \cdot \p_{u^*} + \b{v}^* \cdot \p_{v^*}) (\b{nn}) \\
&= \b{u}^* \cdot (k_1 \b{u}^* \b{n} + k_1\b{n}  \b{u}^*) + \b{v}^* \cdot ( k_2 \b{v}^* \b{n} + k_2 \b{n} \b{v}^*) \\
&= (k_1 + k_2) \b{n}  \\
\end{aligned}
$$

For $$I_{uv}$$ we need $$d \b{u}$$ and $$d \b{v}$$. Fortunately if we use the principal frame we get to assume that there's no first-order rotation between $$(\b{u}, \b{v})$$

$$
\begin{aligned}
d \b{u}^* &= \b{u}^*(0 + \theta_1, 0 + \theta_2) - \b{u}^* \\
&= [\cos (d\theta_{1}) \b{u}^* + \sin (d\theta_1) (-\b{n})] - \b{u}^* \\ 
&= -d \theta_1 \b{n} \\
&= -k_1 \b{n} d u^* \\
d \b{v}^* &= [\cos (d\theta_2) \b{v}^* + \sin (d\theta_2) (-\b{n})] - \b{v}^* \\
&= -d \theta_2 \b{n} \\
&= -k_2 \b{n} d v^*
\end{aligned}
$$

Therefore

$$
\begin{aligned}
d(\b{u}^* \b{u}^* + \b{v}^* \b{v}^*) &= (-k_1 \b{n} d u^* ) \b{u}^* + \b{u}^* (-k_1 \b{n} d u^* ) + (-k_2 \b{n} d v^*) \b{v}^* + \b{v}^* (-k_2 \b{n} d v^*) \\ 
\del_{uv} \cdot (\b{u}^* \b{u}^* + \b{v}^* \b{v}^*) &= (\b{u}^* \cdot \p_{u^*} + \b{v}^* \cdot \p_{v^*}) (\b{u}^* \b{u}^* + \b{v}^* \b{v}^*) \\
&= \b{u}^* \cdot [-k_1 (\b{n} \b{u}^* + \b{u}^* \b{n})] + \b{v}^* \cdot [-k_2 (\b{n} \b{v}^* + \b{v}^* \b{n})] \\
&= -(k_1 + k_2) \b{n}
\end{aligned}
$$

That was helpful for me at least---getting to use the principal curvature frame simplifies things to the point that the derivation is manageable symbolically. I still cannot really intuit why this whole thing is true in any frame, but that's okay: at least it reduces the overall insight to knowing that a canonical frame _exists_, and then once you have that the rest follows procedurally.

I'd still like a good interpretation of, e.g., $$d (\b{uu}) = (d \b{u}) \b{u} + \b{u} (d \b{u})$$. Of course it tells you how $$\b{uu}$$ varies, but I can't really picture it. In any case the important bit is: once you have chosen the principal frame, $$d \b{u}^*$$ has no $$d v^*$$ component, so it is proportional to $$\b{n}$$, and in $$\b{u}^* \p_{u^*} (\b{u}^* \b{u}^*)$$, only the $$k_1 \b{u}^* \b{n}$$ term survives.

One thing to note is that the final term in the resulting formula (A.64) has this enter with a minus sign:

$$
\begin{aligned}
\delta F &= (\ldots) - \int (f) (\del'_{uv} \cdot I'_{uv} \cdot \delta \b{x}) d \frakr + (\ldots) \\
&= (\ldots) - \int (f) (-J \delta n )\d \frakr + (\ldots) \\
&= (\ldots) + \int f (J \delta n) \d \frakr + \ldots
\end{aligned}
$$

The minus sign is there to make it proportional to $$+J$$, I guess. I still don't have a _great_ picture of why $$\del_{uv} I_{uv}$$ is negative, but I guess it's because we define the curvatures in terms of the motion of $$\b{n}$$, so while $$\b{n}$$ is rotating into $$\b{u}, \b{v}$$, they are themselves rotating into $$-\b{n}$$ by the same amount... anyway it's awkward.

... well, here's a version of the computation. The AI recommended the $$(X_u, X_v)$$ parameterization of the area element which I did not remember was a thing.

Suppose the surface is parameterized as $$X(u,v)$$, such that

$$dA = dX^{\^2} = (X_u du) \^ (X_v dv)$$

Then the variation in just the normal direction is $$X \ra X + \b{n}\delta n $$. Then

$$
\begin{aligned}
(dX + \b{n} \delta n)^{\^2} &= [(X_u + \b{n}_u \delta n) du] \^ [(X_v + \b{n}_v \delta n) dv] \\
&= X^{\^2} + [(\b{n}_u \^ X_v + X_u \^ \b{n}_v ) \delta n] du \^ dv + O(\delta n^2) \\
\end{aligned}
$$

Now assuming principal directions: $$\b{n}_u = k_1 \b{u}$$ and $$\b{n}_v = k_2 \b{v}$$. Meanwhile $$X_u = \b{u}$$ and $$X_v = \b{v}$$ (by definition, apparently). So

$$
\begin{aligned}
&= dX^{\^2} + (k_1 \b{u} \^ \b{v} + \b{u} \^ k_2 \b{v}) (\delta n) du \^ dv + O(\delta n^2) \\
&= (1 + (k_1 + k_2) \delta n) dX^{\^2} + O(\delta n^2)\\
&\approx (1 + J \delta n) dX^{\^2} \\
&= (1 + J \delta n) dA
\end{aligned}
$$

and therefore, when the surface is varied only along its normal, the first-order variation of the surface area element is

$$\delta dA = (J \delta n) dA$$

(Note that although this is also a first-order variation of an integral, $$J$$ is the mean curvature (times two), not the Jacobian, this time...)

Among other things, this gives that the first-order change in the area of a figure when it's dilated is proportional to its mean curvature:

$$\frac{\delta A}{\delta n} = \frac{\delta}{\delta n} \int dA = \int  \frac{\delta dA}{\delta n} = \int J dA$$

Note, variations in other directions than $$n$$ would presumably also affect $$dA$$, but they should integrate out as well (assuming the integrand does not depend on velocity/direction at all?)

It seems like we can think of mean curvature as being given by this derivative:

$$J \d A = \frac{\delta dA}{\delta n}$$

(or even $$J = \frac{\delta \log dA}{\delta n}$$??)
    
---------

<aside class="toggleable" id="curvature" placeholder="<b>Aside</b>: wip - calculations">

Although TCAT doesn't really discuss it such, I wanted to see how curvature falls out of this. I know by memorization that $$2H = J = \pm \del \cdot \b{n}$$ (can't remember the sign) but it should be more intuitive than that.

There clearly pieces of it in here. The frame $$U = (\b{u}, \b{v}, \b{n})$$ frame is orthornomal, which means its derivative must be a rotation operator acting on it. As a matrix:


$$dU = U \Omega$$

We can extract the important part:

$$U^T dU = U^T U \Omega = I \Omega = \Omega$$

We have to assume that $$dU = U \Omega$$ holds for *some* choice of $$\Omega$$, but that's okay because $$U$$ spans the space. Then:

$$
\begin{aligned}
d(U^T U) &= d(U^T) U + U^T dU \\
&= (\Omega^T U^T) U + U^T (U \Omega) \\
0 &= \Omega^T + \Omega \\
\end{aligned}
$$

The point is that $$\Omega = U^T dU$$ is antisymmetric. This is basically a compact way of writing the identities that follow from differentiating the orthogonality conditions $$d(\b{u} \cdot \b{n}) = 0$$ all at once:

$$
\begin{aligned}
(\p \b{u}) \cdot \b{v} &= - \b{u} \cdot (\p \b{v}) \\
(\p \b{u}) \cdot \b{n} &= - \b{u} \cdot (\p \b{n}) \\
(\p \b{v}) \cdot \b{n} &= - \b{v} \cdot (\p \b{n}) \\
\end{aligned}
$$

becomes

$$
\begin{aligned}
U^T \cdot dU &= -dU^T \cdot U \\
\Omega &= - \Omega^T
\end{aligned}
$$

Note that $$\Omega$$ is not itself the derivative of $$U$$. Actually, it is the derivative of the _logarithm_ of $$U$$, in a sense. We can write out displacements of $$U$$ as 

$$U(\b{x} + d \b{x}) = \exp (\vec{r} \cdot \frac{d \theta}{d \b{x}} \cdot d \b{x}) U$$

This can be approximated as:

$$
\begin{aligned}
U(\b{x} + d \b{x}) &\approx (I + \vec{r} \cdot \frac{d \theta}{d\b{x}} \cdot d \b{x}) U \\
&= U + (\vec{r} \cdot \frac{d \theta}{d\b{x}} \cdot d \b{x}) U \\
U + dU &= U + (U \Omega) \cdot d\b{x} \\
dU &= (U \Omega) \cdot d\b{x}
\end{aligned}
$$

(where I am cheating a bit with the order of the terms, since it needs index notation to really specify what contracts with what). This is why the rotation part is extracted via $$U^T dU = U^T (U\Omega) d\b{x} = \Omega$$. But a better way to write that is

$$\Omega = \frac{d \log U}{d \b{x}} = \vec{r} \cdot \frac{d \theta}{ d \b{x}}$$

directly. I'm not quite sure what the rules for matrix logarithms are, but in analogy with single variable calculus these should be equivalent because $$d \log U = U^{-1} dU = U^T dU = \Omega$$.

The actual behavior of $$\Omega$$ is that it maps translations $$d \b{x}$$ onto rotation operators that describe how the frame rotates as you move in that direction. In particular 

$$dU = \p_\alpha U_{ai} dx_{\alpha}= U_{aj} {\Omega_{\alpha ji}} dx_{\alpha}$$

so $$\Omega$$ is really a degree-$$3$$ tensor with three indices. The $$\alpha$$ index is the one that is used to make directional derivatives:

$$ \Omega_{\alpha ji}  d x_{\alpha}$$

describes something which, when multiplying by $$U$$, describes how $$U$$ changes as you move in that direction.

Since $$\Omega$$ is antisymmetric it can be written as a linear-combination of antisymmetric matrices in each of the $$(un, vn, uv)$$ planes. These are called the "generators of rotation".

$$
\begin{aligned}
r_{vn} &= \b{vn} - \b{nv} \\ 
r_{nu} &= \b{nu} - \b{un} \\ 
r_{uv} &= \b{uv} - \b{vu}
\end{aligned}
$$

Which we can consolidate into a vector:

$$\vec{r} = (r_{vn}, r_{nu}, r_{uv})$$

Each generator can be written as a [Hodge Star](https://en.wikipedia.org/wiki/Hodge_star_operator) operation in coordinates. For example 

$$r_{nu} = \b{nu} - \b{un} = \star \b{v} = \b{v} \cdot (\x \^ \y \^ \z) = \b{v} \cdot (\b{u} \^ \b{v} \^ \b{n})$$

I like to write this as $$r_{\star v}$$, for short, so 

$$\vec{r} = (r_{\star u}, r_{\star v}, r_{\star n})$$

The full expression for $$\Omega$$ is 

$$\Omega = \omega_{vn} r_{vn} + \omega_{nu} r_{nu} + \omega_{uv} r_{uv} = \begin{pmatrix} 0 & -\omega_{uv} & \omega_{nu} \\ \omega_{uv} & 0 & -\omega_{vn} \\ -\omega_{nu} & \omega_{vn} & 0 \end{pmatrix}$$

Where each $$\omega_{ij} = \omega_{\star k}$$ is itself a one-form. 

$$\omega_{\star k} = d \theta_k = \frac{d \theta_k}{d x_{\alpha}} d x_{\alpha}$$

These are the _curvatures_, the derivatives of the angle in the $$(ij)$$ plane, that is, around the $$k$$ axis, as you travel in the $$\alpha$$ direction (where $$(i,j,k)$$ can be picked from $$(u,v,n)$$ or $$(x,y,z)$$ or whatever you want).

$$d\b{n} = \b{n} \Omega $$ tells us how $$\b{n}$$ specifically rotates as you move in other directions:

$$
\begin{aligned}
\b{n} \Omega &= \begin{pmatrix} 0 \\ 0 \\ 1 \end{pmatrix}  \begin{pmatrix} 0 & -\omega_{uv} & \omega_{nu} \\ \omega_{uv} & 0 & -\omega_{vn} \\ -\omega_{nu} & \omega_{vn} & 0 \end{pmatrix} \\
&= \begin{pmatrix} \omega_{nu} \\ -\omega_{vu} \\ 0 \end{pmatrix} \\
&= \omega_{nu} \b{u} - \omega_{vn} \b{v}\\
\end{aligned}

// wip for later

* second fundamental form
* connection to derivatives
* should I use $$U^T$$ instead of $$U$$ for the frame so that this all multiplies in the usual direction?
* principal curvatures
* mean curvature
* connection between $$(\b{u}, \b{v}, \b{n})$$ and $$(\p_u, \p_v, \p_n)$$ notations

-----

</aside>

<aside class="toggleable" id="indices" placeholder="<b>Aside</b>: wip - calculations in indices</em>">


Now I want to repeat these calculations with indices, very tediously, because it is the only way I can be sure I know exactly what I'm writing down.

In indices, $$U = (\b{u}, \b{v}, \b{n})$$ has two indices $$U_{ij}$$. It is a bit confusing however because these indices mean different things: one is a 'spatial' index, over $$(\x, \y, \z)$$, for example, while the other is a 'frame' index which iterates over the three elements themselves. To distinguish the two I will use $$(i, j, k \ldots)$$ for frame indices and $$(a,b,c, \ldots)$$ for spatial indices. So $$U = U_{ai}$$, e.g. 

$$U_{a1} = u_a = \b{u}$$

A pretty decent way to think about this is that $$U$$ acts like vector over another vector space $$e_i = (e_1, e_2, e_3)$$, so $$U = \b{u} e_1 + \b{v} e_2 + \b{n} e_3$$. The $$e_i$$ basis vectors don't really mean anything; they're just there to keep track of which vector of the frame is in which position.

The spatial derivative of $$U$$ is 

$$dU_{ai} = \p_{\alpha} U_{ai} = U_{aj} \Omega_{\alpha ji}$$

We'll suppress the $$\alpha$$ coordinate for now since it is just used to form a directional derivative. Therefore $$\p U_{ai} = U_{aj} \Omega_{ji}$$. The effect of $$\Omega$$ is to mix together the frame vectors. For example 

$$d\b{u} = dU_{a1} = U_{a1} \Omega_{11} + U_{a2} \Omega_{21} + U_{a3} \Omega_{31} = \b{u} \Omega_{11} + \b{v} \Omega_{21} + \b{n} \Omega_{31}$$

(and it will turn out that $$\Omega_{11} = 0$$ because it's antisymmetric.) So each derivative of a basis vector is a linear combination of the other basis vectors.

Next, $$U^T U = I$$ translates to $$U^T_{ia} U_{aj} = I_{ij} \equiv e_1 e_1 + e_2 e_2 + e_3 e_3$$. (I'll omit the $$T$$ symbol after this since it is implied by the frame index coming first.) This operator is the identity on the frame index (the space spanned by $$e_i$$). The other way gives $$U U^T = U_{ai} U_{ib} = I_{ab} \equiv \b{uu} + \b{vv} + \b{nn}$$.

We extract $$\Omega$$ with

$$(U^T dU)_{ji} = (U_{ja} dU_{ai}) = U_{ja} U_{ak} \Omega_{ki} = \Omega_{ji}$$

Differentiating $$U^T U$$ gives us the antisymmetry of $$\Omega$$:

$$
\begin{aligned}
d (U^T U)_{ij} &= d (U_{i a} U_{aj}) \\
&= dU_{ia} U_{aj} + U_{ia} dU_{aj} \\
&= (\Omega^T_{ik} U_{ka}) U_{aj} + U_{ia} (U_{ak} \Omega_{kj}) \\
0 &= \Omega_{ji} + \Omega_{ij} \\
\end{aligned}
$$


//

// wip $$U$$ has two indices...

In coordinates this is a Levi-Cevita symbol times a basis vector:

$$r_{ij} = U_k \e_{ijk}$$

for example

$$r_{31} = U_2 \cdot \e_{ijk} (U_i U_j U_k) = \e_{ij2} U_i U_j = U_3 U_1 - U_1 U_3 = \b{n} \b{u} - \b{u} \b{n}$$

(Note, $$\e_{ijk} U_i U_j U_k$$ can be expanded in any basis, for example $$=\e_{ijk} x_i x_j x_k$$ as well, but things work out nicely if we stick with the $$U$$-basis.)


</aside>

To summarize this section, let me requote the formula TCAT derived and describe its structure again:

$$
\begin{aligned}
\delta F_{\alpha \beta} &= \delta \int_{\Omega_{\alpha \beta}} f_{\alpha \beta} d \frakr \\
&= \underbrace{\int_{\Omega_{\alpha \beta}}\odelta' f_{\alpha \beta} \d \frakr}_{1} - \underbrace{\int_{\Omega_{\alpha \beta}} f_{\alpha \beta} \del'_{\alpha \beta} \cdot \b{I}'_{\alpha \beta} \cdot \delta \b{x} \d \frakr}_{2} + \underbrace{\int_{\Gamma_{\alpha \beta}} f_{\alpha \beta} \b{n}_{\alpha \beta} \cdot \delta \b{x} \ d \frakr}_{3}
\end{aligned} \tag{A.64}
$$


1. Is the variation in $$f$$ _plus_ the variation due to just evaluating $$f$$ at different points because the boundary expanded (in the $$\b{n}_{\alpha}$$ direction -- remember $$\odelta' f = \odelta f+ \delta \b{x} \cdot \b{n}_{\alpha} \b{n}_{\alpha} \cdot \del f$$, which we might write as $$\odelta f + \p_n f \delta n$$).
2. Is the variation due to the area of the boundary changing. $$ \del'_{\alpha \beta} \cdot \b{I}'_{\alpha \beta} \cdot \delta \b{x} = -(J \b{n}) \cdot \delta \b{x} =  -(k_1 + k_2) \delta n$$ is the first-order change in the surface area, so whatever values $$f$$ had at those points are now contributing to the integral more because they're evaluated at slightly-larger patches of area. In particular this term is really $$\int f \, J \delta n \d A$$
3. There's a term for expansion of the boundary _of_ the boundary, which is zero if one phase encloses the other, and otherwise looks like a line integral $$\int f \; \delta n_{\alpha \beta} \d \ell$$, where $$\delta n_{\alpha \beta}$$ is the variation in the normal to the boundary's boundary (however you're supposed to get that).

So I see now that I could have guessed all three of these with no derivations---at least, if I already knew what I know now about mean curvature. The one thing that I can't intuitive is the $$-\del_{uv} \cdot I_{uv}$$ way of writing the mean curvature, which feels like it obscures the meaning of the term. My version would be

$$\delta \int f \d A = \int_{\Omega} \odelta' f \d A + \int_{\Omega} f J \delta n \d A + \int_{\p \Omega} f \delta n_{\alpha \beta} \d s$$

-----

### A.6 Variation of an Integral over a Curve

The integral to be varied is

$$F_{\alpha \beta \gamma} = \int_{\Omega_{\alpha \beta \gamma}} f_{\alpha \beta \gamma} \d \frakr$$

Following the logic of the previous section, I am going to guess the form of the variation without looking.

There are three terms:

1. Variation due to $$f$$ itself, including the fact that it is evaluated at a new point, so there will be an $$\odelta''$$ which is defined as $$\odelta + \delta \b{x} \cdot [(\b{n}_{\alpha} \b{n}_{\alpha}) + (\b{n}_{\alpha \beta} \b{n}_{\alpha \beta})] \cdot \del f$$, since those two normals are orthogonal to the line and to each other.
2. Variation due to the length element changing, which will work out to be proportional to the change in its linear curvature, $$\int f \kappa \delta \b{x} ds$$... something like that
3. Variation due to the boundary of the curve changing, of the form $$\int_{\p \Omega_{\alpha \beta \gamma}} f  \b{n} \cdot \delta \b{x} = \sum_{\p \Omega} f \b{n} \cdot \delta \b{x}$$

This looks about like what they got, except that the term (2) is in that form I can't intuit:

$$
\begin{aligned}
\delta F_{\alpha \beta \gamma} = 
\underbrace{\int_{\Omega_{\alpha \beta \gamma}} \odelta'' f \d \frakr}_{1} 
-\underbrace{\int_{\Omega_{\alpha \beta \gamma}} f \del'' \cdot I''_{\alpha \beta \gamma} \cdot \delta \b{n} \d \frakr}_{2} + 
+\underbrace{\sum_{m \in \Gamma_{\alpha \beta \gamma}} f \b{n}_{\alpha \beta \gamma} \cdot \delta \b{x} \mid_{\Gamma_{\alpha \beta \gamma_m}}}_{3} \\
\end{aligned} \tag{A.84}
$$

Their notation is still very unwieldy. Also, once again it seems clear that the second term 'should' be positive, but it's counting its contribution in an odd way.

Here is the curvature calculation:

An arc length integral can be written

$$\int f ds = \int f \| \gamma'(t) \| dt$$

We want to vary $$\gamma$$ in _both_ normal directions this time, using the same technique as before. Recapping what I know of 1d differential geomtery... the unit tangent vector $$\b{t} = \frac{\gamma'(t)}{\| \gamma'(t) \|}$$ and the [Frenet Frame](https://en.wikipedia.org/wiki/Frenet%E2%80%93Serret_formulas) $$(\b{t}, \b{n}, \b{b})$$ along the curve is related by the curvature $$\kappa$$ and torsion $$\tau$$:

$$
\begin{aligned}
\frac{d\b{t}}{ds} &= \kappa \b{n} \\ 
\frac{d \b{n}}{ds} &= -\kappa \b{t} + \tau \b{b} \\ 
\frac{d \b{b}}{ds} &= - \tau \b{n}
\end{aligned}
$$

We can vary $$\gamma(t) \mapsto \gamma(t) + \b{t} \delta t  + \b{n} \delta n  +  \b{b} \delta b$$. We will see that the components other than the derivative of $$\b{t}$$ drop out. First

$$\delta \gamma' = \b{t}' \delta t  + \b{n}' \delta n  + \b{b}' \delta b  = [\kappa \b{n}\delta t  + (-\kappa \b{t} + \tau \b{b}) \delta n + (-\tau \b{n}) \delta b ] \frac{ds}{dt}$$

Note that

$$\gamma' \cdot \delta \gamma' = (\b{t} \frac{ds}{dt}) \cdot (\ldots) = - \kappa \delta n (\frac{ds}{dt})^2$$

Plugging into the vector norm and using $$\gamma' = \b{t} \frac{ds}{dt}$$:

$$
\begin{aligned}
\| (\gamma + \delta \gamma)' \| dt &= \sqrt{(\gamma' + \delta \gamma') \cdot (\gamma + \delta \gamma')} \\
&= \sqrt{\gamma' \cdot \gamma' + \gamma' \cdot \delta \gamma' + \delta \gamma' \cdot \gamma' + O(\delta \gamma^2)} \\
&=\sqrt{ (\frac{ds}{dt})^2 (1  - 2 \kappa \delta n + O(\delta \gamma^2))} dt \\
&= \sqrt{1 - 2 \kappa \delta n} \frac{ds}{dt} dt \\
&\approx (1 - \kappa \delta n) ds 
\end{aligned}
$$

And therefore

$$\delta ds = - \kappa \delta n ds$$

The minus sign is because I did this in terms of the Frenet frame, which writes $$\p_s \b{t} = \kappa \b{n}$$. This means that the choice of normal is towards whichever direction the curve is curving, which means that pushing the curve in that direction closes the circle 'faster' and therefore makes the length element shorter.

In the TCAT term 

$$\int_{\Omega_{\alpha \beta \gamma}} f \del'' \cdot I''_{\alpha \beta \gamma} \cdot \delta \b{n} \d \frakr$$

the tangent derivative $$\del''$$ must equal $$\b{t} \p_t$$, and the projection onto the surface is $$I''_{\alpha \beta \gamma} = \b{tt}$$. So

$$
\begin{aligned}
(\b{t} \p_t) \cdot (\b{tt}) &= (\b{t}  \cdot \p_t \b{t}) \b{t} + (\b{t} \cdot \b{t}) \p_t \b{t} \\
&= 0 + \p_t \b{t} \\
&= \kappa \b{n}
-(\b{t} \p_t) \cdot (\b{tt}) \cdot \delta \b{x} &= -\kappa \delta n \\
\end{aligned}
$$

Where again the sign is due to this particular arbitrary choice of normal convention.

So I guess we got the same answer: the second term is really 

$$-\int_{\Omega_{\alpha \beta \gamma}} f \kappa \delta n \d \frakr$$

The integral (2) in A.84 is definitely more coordinate-free than this, but I can't say that I love these $$\del'' \cdot I''$$ terms because I can't really think about the divergence of a projection operator at all... 

I don't think it's possible to write this $$\b{n}$$ (or $$\b{b}$$, for that matter) in terms of the surface's normals: the fact that the curve is at the intersection of three surface does not pin down its plane of curvature at all (other than the fact that its tangent is given by $$\b{t} = \pm \b{n}_{\alpha} \times \b{n}_{\alpha \beta}$$)

I am not going through the whole calculation in section A.6 because it's too messy and anyway I was able to guess it up front.

The minus sign is still bothering me here. The problem is that, really, the "normal" of a curve is a two-dimensional plane (spanned by $$(\b{n}, \b{b})$$ if you write it in Frenet coordinates). Although it is possible to uniquely specify $$\b{n}$$ as the direction of $$d \b{t}$$, it is not going to generalize very well to higher dimensions ... e.g. a $$(\b{u}, \b{v})$$ plane in 4d will have a 2d normal plane $$(\b{n}_1 \b{n}_2)$$, but the 'derivative' of this plane will involve (a) rotation in $$(uv)$$ which is negligible, (b) rotation in $$(n_1 n_2)$$ which is negligible, and (c) four angles of rotation $$\omega_{u n_1}, \omega_{u n_2}, \omega_{v n_1}, \omega_{v n_2}$$, none of which are going to be 'canonical'.

I have learned from the AI however that in >3 dimensions the mean curvature becomes vector-valued, such that the first-order variation in area is given by

$$\delta A = \int( \b{J} \cdot \delta \b{x}) dA$$

This integrand will expand as a linear combination of variations along each normal direction, e.g. $$ \b{J} \cdot \delta \b{x} =j_1 \delta n_1 + j_2 \delta n_2$$. 

... this is confusing. Conclusion: I should carefully work through a diffgeo book. The book I used in my undergrad class, do Carmo, was confined to 3d, but the internet says O'Neill is good and intuitive more generally. (Also some of this stuff comes up in Weyl's book on Tubes which I apparently started reading at some point? and then lost? Hm.)


--------

## A.7 Summary

TCAT presents the following summary of the variations of integrals:

$$\delta F_{\alpha} = \int_{\Omega_{\alpha}} \odelta{}^{(n)} f_{\alpha} d \frakr - \int_{\Omega_{\alpha}} f_{\alpha} \del^{(n)} \cdot I^{(n)}_{\alpha} \cdot \delta \b{x} \d \frak r + \int_{\Gamma_{\alpha}} f_{\alpha} \b{n}_{\alpha} \cdot \delta \b{x} \d \frakr \tag{A.86}$$

where $$(n)$$ can refer to 3, 2, or 1 dimensional objects. Which is cute. I am still not happy with it but I don't know how to resolve my further issues. Roughly:

1. I don't see the reason for defining $$\odelta{}^{(n)}$$ at all. Maybe this will become clear elsewhere in the book.
2. The second term $$-\del^{(n)} \cdot I^{(n)} \cdot \delta \b{x}$$ is opaque. Evidently it has to do with the change in volume due to dilating the volume element, but this is ... not an intuitive way to write it.
3. The third term is basically fine.

-----

# Ruminations

Much earlier in these notes, I showed that there is a quicker 'non-rigorous' derivation of the variation of a volume integral by writing

$$\Omega \mapsto \Omega + \delta \Omega = \Omega + \sigma(\Omega) + \delta \b{x} \cdot \p \Omega$$

Such that apart from the $$\odelta f$$ term itself, the variation is

$$
\begin{aligned}
\delta \int_{\Omega} f \d V &= \int_{\delta \Omega} f \d V \\
&= \int_{\delta \b{x} \cdot \p \Omega} f \d V \\
&= \int_{\p \Omega} f (\delta \b{x} \cdot \d A)
\end{aligned}
$$

because the base integral cancels out and the $$\sigma(\Omega)$$ just permutes the integral rather than changing its total. Note that $$\delta \b{x} \cdot \p \Omega$$ as a surface means the volume created by $$\delta \b{x} \cdot \d A$$ at each point. (btw $$\delta \b{x} \cdot \d A = (\delta \b{x} \cdot \b{n}) dA$$ is properly $$\delta \b{x} \^ \d A$$ but I don't think the distinction matters here)

I suspect this way of thinking is much better for intuition than the complicated derivations shown above. Basically, we should be able to think of the variations of the shapes themselves algebraic objects as independent of the thing we are integrating over them. Then the integral is simply the shape's variation, plugged in.

But, the volume variation was by far the easiest one, because it didn't have any curvature terms involved. So does the same thing work for the others? I am particularly worried about the $$\odelta'' f$$ and $$\odelta'' f$$ terms messing this up as they seem to 'conflate' the variation of $$f$$ and the variation of the surface, but maybe not...

For the variation of the surface and curve integrals over a surface $$\Omega$$ the terms are

1. Fixed-point variation of the integrand $$\odelta{f}$$
2. Variation of $$f$$ due to changing position on the surface, $$\p_n f \, \delta n $$ (which TCAT lumps with (1))
3. Variation of $$dA$$ due to first-order divergence of normals $$J dA = \delta (dA)/\delta n$$ or $$\kappa ds = \pm \delta (ds)/\delta n$$
4. Variation of the boundary $$\p \Omega$$ along its normal on the plane of $$\Omega$$

we would like to write something like

$$
\begin{aligned}
\delta \Omega &= \delta n \cdot \Omega + \delta r \cdot \p \Omega \\
&= (??) + (??) + \delta r \cdot \p \Omega
\end{aligned}
$$

The terms here all come out of the product rule basically:

$$\delta (f dA 1_{\alpha}) = (\delta f) dA 1_{\alpha} + f (\delta dA) 1_{\alpha}  + f \d A  \delta 1_{\alpha}$$

I guess what is more confusing is why the variations only count in the normal direction each time..?

Also confusing... how do we think of $$dA 1_{\alpha}$$ as the 'simplex' model of the surface? I guess the surface has to be thought of as a bunch of 'areas'?

After thinking about this for a while, I realize:

If we have a 2-surface $$\Omega$$ in 3d, we have to think of its "boundary" as containing _both_

1. its actual boundary as a simplex, $$\p \Omega$$, which expands out in the "radial" $$\delta r$$ direction
2. its actual faces as a boundary -- if we view it as a infinitesimally-thin 3-volue, for example, it would have a boundary that looks like $$\Omega \b{n}$$ on one side and $$- \Omega \b{n}$$ on the other side.

Now, we happen to integrating against $$dA$$, which means that we can't view it as a $$3$$-surface because it would be of zero volume... but there are a few ways to interpret that

1. $$dA$$ integrates over only one 'normal face' of the volume
2. $$dA$$ integrates over both 'normal faces', but its value is $$0$$ on one side
3. $$dA$$ is distributional: it integrates over both faces, but returns negative on the opposite faces despite being infinitesimally far away, so it looks like $$\frac{1}{2} (dA_+ - dA_)$$, which should give the same result unless $$f$$ is _also_ distributional on the surface
4. same thing, but we can express it as a delta function: $$dA = \delta(n) dV$$

If $$f$$ is classical (=non-distributional, I guess?) then these are all the same. If $$f$$ is non-classical, then (3) and (4) would conceivably give different answers than (1) and (2). But I think we can ignore that case.

The resulting $$dA = \delta(n) dV$$ is the same thing as TCAT's $$(- \b{n} \cdot \del I_{\alpha}) d\frakr$$ but much easier to read.

One other problem is that $$\delta$$ means both 'variation' and "delta function' here. I guess that's one argument for writing $$-\p_n 1_{\Omega}$$ instead. Or $$1_{\p \Omega}$$?.  (Since in 1d $$1_{(a,b)} = \theta(x-a) - \theta(x-b)$$ and it's $$-\p 1_{(a,b)} = \delta_b - \delta_a$$ which represents the 'boundary' it makes sense to write it as $$1_{\p (a,b)} = - \p 1_{(a,b)}$$)

Maybe we should use $$D$$ for the differential in that case? Not sure.

In fact I think we can just do the whole thing like this:

$$
\begin{aligned}
D \int f \delta(n) \theta(r) \d V &= \int [D f] \delta(n) \theta(r) dV + \int f [D \delta(n)] \theta(r) dV + \int f \delta(n) [D \theta(r)] dV \\
&= \int \big[ (f_\b{x} D\b{x}) \delta(n) \theta(r) + f [\delta'(n) Dn] \theta(r) + f \delta(n) [\delta (r) D r] \big] dV
\end{aligned}
$$

We have to interpret $$\delta'(n) Dn \d V$$ as the mean curvature term somehow... er, wait, no, we still have to factor out the part that goes on the $$\odelta' f$$. I suppose we have:

$$D \delta(n) = \p_n \delta(n) Dn + \p_{u, v} \delta(n) D(u,v)$$

not that can't be right... it's all on the $$Dn$$ term. The actual value has to be


$$D \delta(n) = - [\p_n \delta(n) + J \delta(n)] Dn$$

where the minus sign comes from the fact that it's a derivative with respect to the surface itself, not the $$n$$ coordinate (conceptually: $$\delta(n) = \delta(n - n_0)$$ and then the derivative is on $$n_0$$). but where does the $$J$$ term come from?

Well, here's one (good) way of doing it, although I still want one that doesn't go this way. If we write

$$\delta(n) = \frac{1_{\Omega}}{\| dn \|}$$

> now: I made a mistake here at first and had to come back and rewrite it.
> I am not sure about some of the 'fractions' here, or about the magnitude $$\| d n \|$$ in the denominator, but I'm leaving them to not get overwhelmed for now.

Normally 

$$dn \? \star dA = dA \cdot dV = (du \^ dv) \cdot (du \^ dv \^ dn)$$

However, there's a subtlety. Those calculations assume that $$dA = \| (X_u du \^ X_v dv) \| = du \^ dv$$ has magnitude $$1$$, which is true on the surface, but *not* after we do a variation. Meanwhile $$dV = (X_u du) \^ (X_v dv) \^ (dn)$$ is supposed to the pseudoscalar $$dx \^ dy \^ dz$$. So we need

$$dn = \frac{1}{dA} dV = \frac{(X_u \^ X_v) du \^ dv}{\|X_u \^ X_v \|^2} \cdot (X_u du \^ X_v dv \^ dn)$$

that is,

$$dn = \star \frac{dA}{\| d A \|^2} = \frac{1}{ \star dA}$$

(where I'm not entirely sure what I mean by all these fractions..)

We could even write

$$\frac{1}{dn} = \frac{1}{dV} dA$$ 

which is nice because it explains how the cancellation in an integral works. Anyway.

Suppose we go with $$dn = \star dA / \| d A \|^2$$.

$$
\begin{aligned}
\frac{1}{dn} &= \frac{\| d A \|^2}{\|\star dA} \\
&= \frac{ \| (X_u du \^ X_v dv) \|^2}{\star X_u du \^ X_v dv} \\
&= \frac{\| X_u \^ X_v \|^2 }{\| X_u \^ X_v \| \star du \^ dv } \\
&= \frac{\| X_u \^ X_v \|}{\star (du \^ dv)}
\end{aligned}
$$

And thne

$$
\begin{aligned}
D \frac{1}{\| dn \|} &=D \frac{\| X_u \^ X_v \|}{ \| \star (du \^ dv) \| } \\
&= \frac{(X_u \^ X_v + (k_1 + k_2) X_u \^ X_v \|)}{\| \star du \^ dv \| } - \frac{\| X_u \^ X_v \|}{ \| \star du \^ dv \| } \\
&= \frac{1}{\| dn \|}(1 + (k_1 + k_2) Dn) - \frac{1}{\| dn \|} \\ 
&= J \frac{1}{\| dn \|} Dn
\end{aligned}
$$


This is probably not quite the right way to do this computation (the stars and absolute values are suspicious) but I'm going to leave it for now. The important point is that $$\frac{1}{dn}$$ is proportional to $$X_u du \^ X_v dv$$ because it has to be $$\sim dX^{\^2} / dV$$, and therefore the mean curvature that comes out is _positive_.




Therefore

$$
\begin{aligned}
D \delta(n) &= D \frac{1_{\Omega}}{ \| dn \| } \\
&= \frac{D 1_{\Omega}}{\| dn \|} + 1_{\Omega} D \frac{1}{\| dn \|} \\ 
&= [-\p_n 1_{\Omega} Dn - \p_r 1_{\Omega} Dr] \frac{1}{\| dn \|} + J \delta(n) Dn
\end{aligned}
$$

which is definitely what we want. The first term becomes the $$f_n Dn $$ term (the minus sign disappears when the derivative transfers over). The second term is the boundary-of-boundary term, it becomes a $$\delta(r)$$ that produces a line integral. The third term is the curvature term; I am unsure about the sign.

------

I still feel like it should be possible to do this manipulation directly on $$\delta(n)$$ without using my 'inverse differential' trick. How do we compute

$$D (\delta(n)) = - \p_n \delta(n) - J \delta(n)$$

correctly? (That is, $$D (dA) = D [ \delta(n) dV ] = D[\delta(n)] dV$$). We know that it comes from the fact that ~extruding the surface along its normal causes the normals to spread out in proportional with the curvature... but I want to see it algebraically from the definition of $$\delta(n)$$. 

I guess we can write

$$\delta(n) = \delta (\b{n} \cdot (\b{x} - \b{x}_0))$$

For $$\b{x}_0$$ the nearest point on the surface.

But then won't $$D \delta(n) = -\delta' \del_{\b{x}} (\b{n} \cdot \b{x}) \cdot D\b{x}$$? which only has a $$\delta'$$ in it, not a $$\delta$$?

I was stumped by this for a while until I realized that delta functions behave oddly with regard to the chain rule. Recall that delta functions pass their derivatives to arguments in a function:

$$\int \delta'(x) f(x) \d x = - \int \delta(x) f'(x) \d x$$

If a delta function is composed with something else, this derivative term gets passed to the term from the chain rule as well:

$$
\begin{aligned}
\int \p_x \delta(g) f \d x &= \int (\delta'(g) g') f \d x \\
&= -\int \delta(g) \p_x (g' f) \d x \\
&= -\int \delta(g) [g'' f + g' f'] \d x \\
\end{aligned}
$$

I had never really thought about that before.

Incidentally another way this can be seen is by applying the identity

$$\delta(g(x)) = \sum_{x_0 \in g^{-1}(0)} \frac{\delta(x - x_0)}{\| g'(x) \|}$$

Since clearly the derivative of the LHS is going to have two terms on the RHS.

Anyway, we need this to properly differentiate $$\delta(n)$$. It's sort of hellish but I can do it. We have to compute


$$
\begin{aligned}
D \delta(n) &= D \delta(\b{n} \cdot (\b{x} - \b{x}_0)) \\ 
&= \del_{\b{x}_0} \delta(\b{n} \cdot (\b{x} - \b{x}_0)) \cdot D \b{x}_0 \\ 
&= \delta'(n) [\del_{\b{x}_0} (\b{n} \cdot (\b{x} - \b{x}_0))] \cdot D \b{x}_0 \\ 
&= \delta'(n) [ (\del_{\b{x}_0} \b{n}) \cdot (\b{x} - \b{x}_0) + \b{n} \cdot (- \del_{\b{x}_0} \b{x}_0) ] \cdot D \b{x}_0
\end{aligned}
$$

The second term is just 

$$\b{n} \cdot (-\del_{\b{x}_0} \b{x}_0) \cdot D \b{x}_0 = -\b{n} \cdot D \b{x}_0 = -Dn$$

The first term is confusing.

$$[(\del_{\b{x}_0} \b{n}) \cdot (\b{x} - \b{x}_0)] \cdot D \b{x}_0$$

Which is very confusing. What does it mean to differentiate the normal vector with regard to $$\b{x}_0$$, the basepoint on the surface? I'm pretty sure the answer is that it's $$0$$, but I had a ton of trouble understanding why.

(2 hours later...)

Here's the actual calculation:

$$
\begin{aligned}
D \delta(n) = \delta'(n) \b{n} \cdot D \b{x}_0 = \delta'(n) Dn
\end{aligned}
$$

Easy. The tricky part is that when you integrate the delta by parts, you have to remember that

$$\delta'(n) \stackrel{!}{=} \b{n} \cdot \del \delta(n)$$

And therefore


$$
\begin{aligned}
-\delta'(n) Dn \, f  &= -[\b{n} \cdot \del \delta(n)] Dn \, f \\ 
&= \delta(n) \del \cdot (\b{n} Dn \, f) \\ 
&= \delta(n) [ (\del \cdot \b{n}) Dn \, f + (\b{n} \cdot \del Dn) f + Dn (\b{n} \cdot \del f) ] \\ 
&= \delta(n) [ J Dn f + Dn \p_n f] \\
\end{aligned}
$$

note that $$\p_n Dn = \p_n (\b{n} \cdot D \b{x}) = \b{n} \cdot \del \b{n} \cdot D\b{x}_0 = 0$$ because $$\del \b{n}$$ is defined to only change in $$\b{u}$$ and $$\b{v}$$.[^unit]

[^unit]: I am sort of curious abotu what happens if you do all of this with a frame of _non_ unit vectors such that $$\p_n n$$ could be nonzero ... feels like it might end up being more elegant if you do it right. After all none of the properties of the surface itself should depend on our use of a unit frame.


So all in all I have described a bunch of ways of reaching the same conclusion: that 

$$D(dA) = D(\delta(n) dV) = -\delta'(n) Dn$$

Whether we want to write it as

$$dA = \delta(n) dV = \frac{1_{\Omega}}{\| dn \|} dV$$

or anything else, we get the same answer. I guess that's good.

-------

## Conclusion

I've written too much to synthesize it right now but I think there is something good in here that can be consolidated into something useful.

In light of all this, *is* there anything like

$$\Omega \mapsto \Omega + \delta \Omega = \Omega + \sigma(\Omega) + \delta \b{x} \cdot \p \Omega$$

for the surface or line integrals?

I think the closest thing was

$$
\begin{aligned}
D \delta(n) &= D \frac{1_{\Omega}}{ \| dn \| } \\
&= \frac{D 1_{\Omega}}{\| dn \|} + 1_{\Omega} D \frac{1}{\| dn \|} \\ 
&= [-\p_n 1_{\Omega} Dn - \p_r 1_{\Omega} Dr] \frac{1}{\| dn \|} + J \delta(n) Dn
\end{aligned}
$$

(modulo some stuff I'm not sure about in the weird algebra)

At least, this form includes the exact three terms we're looking for.

If we think of this as acting on a single infinitesimal simplex $$\sigma \mapsto \sigma + \delta \sigma$$, then it should be something like... this?

$$
\begin{aligned}
\delta [f \d A(\sigma)] &= f \d A(\sigma + \delta \sigma) - dA(\sigma) \\
&= f \d A(\sigma + \p \sigma \cdot \delta \b{x})  - f \d A(\sigma) \\
&= f \d A(\sigma + \p_n \sigma \cdot \delta n + \p_r \sigma \cdot \delta r) - f \d A(\sigma) \\
&= f(\p_n \sigma \cdot \delta n + \p_r \sigma \cdot \delta r) dA + f dA(\p_n \sigma \cdot \delta n + \p_r \sigma \cdot \delta r) \\
&\? f_n \delta n \d A (\sigma) + \cancel{f_r \delta r \d A (\sigma)} + f dA(\p_n \sigma) \delta(n)  + f dA (\p_r \sigma) \delta r \\
\end{aligned}
$$

I think it is also the case that the second term cancels because it is second-order: the size of the $$\b{r}$$ boundary is first-order in area and then the derivative of $$f$$ is also. Whereas the size of the $$\b{n}$$ is zero-th order in area which is why it survives. Something like that....

Not quite there but I guess it's close.

I really want to think of a way to write the mean curvature as a "simplex" object, but I'm not sure how to do it. It really seems to be a proper of $$dA(\delta_n \sigma)$$ rather than just $$\delta_n \sigma$$ itself, is the problem.

------

more rumination:

One idea I had to think of each simplex as being given by something like $$\exp(X^{\^2}) = \exp(X_u \^ X_v)$$ in the first place --- the idea being that they are the image of a path of $$(u,v)$$ space --- and then write their extruded coordinates as $$\delta \sigma = \exp((X_u + \b{n}_u \delta n) \^ (X_v + \b{n}_v  \delta n)) - \exp(X^{\^2})$$ explicitly, viewing ---at least that gives a model of "what we're doing", I guess?---it is just hard to think of the "type" of differential simplexes; they are not quite _volumes_ because they don't have to be closed; instead they're like vector fields along the normals at every point.


(I guess it might be possible to think of the surface as being the image of a torus in $$(u,v)$$ space with the same areas and curvatures... somehow... or some kind of twisted product between the $$U$$ and $$V$$ circles...)

or maybe you can think of it as a combination of (1) a rigid translation and (2) a field of "additional" area that has to be added to fill in the gaps that appear with the translation, which is proportional to the mean curvature terms. That's not so bad. But now you need a way to say that you've translated the surface _without_ expanding it. Maybe that's okay?

$$\Omega \ra \Omega + \p \Omega \cdot \delta \b{r} + (\Omega + J \Omega) \cdot \delta \b{n}$$

where $$J \Omega$$ creates / deletes area instead of modifying existing ones. And really 

$$(I + J) \Omega = e^{J} \Omega$$

oguht to be an operator which expands each simplex along its axes as it's translated. (This should work on linear curvature as well so can start there)

aside: it occurs to me that the reason the volume variation is simple was that there was no variation of the _density_ of the points, but that these variations in surface/line integrals are, sort of, modifying density implicitly. It might be interesting to repeat these calculations but explicitly including density. In which case $$dV = dm / \rho(m)$$ is being implicitly used in the case where an integral is only over volume. I wonder how the Lagrangian coordinate trick works when density is involved? Surely that is standard.

Doing $$J \Omega$$ correctly may require thinking of it in terms of a density field. 