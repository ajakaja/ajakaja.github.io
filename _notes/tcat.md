---
layout: blog
title: "TCAT notes"
footnotes: true
math: true
aside: true
tags: math
---

Notes on the book on Thermodynamically Constrained Averaging Theory by Gray & Miller.

We start with Appendix A because the mathematical framework has to be understood first.

<!--more-->

$$\newcommand{\frakr}{\mathfrak{r}}$$

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

$$\delta F = \int_{\Omega} \overline{\delta} f(\b{u}) \, d \frakr + \int_{\Gamma} f(\b{u}) \b{n} \cdot \delta \b{x} \, d \frakr \tag{A.32}$$

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
\delta \b{u} = \overline{\delta} \b{u} + \del \b{U} \cdot \delta \b{x}
\end{aligned}
$$

which I find very hard to read. But the $$\overline{\delta}$$ notation is confusing. The meaning is that it is the 'independent' variation of an object _not_ due to the variation in $$\b{x}$$, that is, it's the $$\e$$ partial derivative rather than the part that depends on $$\e$$ only indirectly via an $$\x$$ derivative.

$$\overline{\delta} \b{u} = \p_{\e} \b{U}(\b{x}, \e)$$

The same operator can act on functions of $$\b{u}$$ as well:

$$\overline{\delta} f(\b{u}) = f_{\b{u}} \overline{\delta}\b{u}$$

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
&\approx \int_{\Omega} [ f_{\b{x}} \delta \b{x}  + f \; \p_{\b{x}} \delta \b{x}] \d V \\
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

$$\int f \d V = \int f \; J \d V_0$$

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

TCAT writes this as $$\overline{\delta} 1_{\Omega} = \delta \b{x} \cdot \del 1_{\Omega}$$, and if you write it out explicitly in terms of $$\e$$, then $$\overline{\delta} 1_{\Omega} = \p_{\e} 1_{\Omega} \d \e$$.

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

## Variations of Integrals

### 4. Variation of a Volume Integral

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

(where $$ \delta_{\perp \alpha}$$ is the term TCAT writes as $$\overline{\delta}$$), rather than the $$\delta_{\b{x}} + \delta_{\perp \b{x}}$$ I was using before.

------

### 5. Variation of a Surface Integral

TCAT considers the case where a surface $$\Omega_{\alpha \beta}$$ is defined as the boundary between the surfaces $$\Omega_{\alpha}$$ and $$\Omega_{\beta}$$. The derivation is somewhat long and therefore difficult to follow, but it is mostly methodical. However, it's not very satisfactory to have a long derivation that produces a short result, because there ought to be a less roundabout way to the same result that captures the intuition better. I will try to find it.

We ask: what terms contribute to the variation of $$F_{\alpha \beta} = \int_{\alpha \beta} f_{\alpha \beta} \d A$$?

1. There's a term for the independent variation in $$f$$, $$=\int \overline{\delta} f \d A$$
2. There's a term for "dilations" of the boundary, where more surface area shows up because of the boundary expanding, which I am not immediately sure how to write.
3. There's a term for expansion of the boundary _of_ the boundary, $$\delta \Omega_{\alpha \beta} \cdot \delta \b{x}$$

(3) shows up verbatim in the resulting formula (A.64), so it's fine. (1) is almost te same, but they have this $$\overline{\delta}' = \overline{\delta} + \delta \b{x} \cdot \b{n} \b{n} \cdot \del$$ object instead, which they call the "fixed point variation on the surface". And (2) requires some investigation.

Note: TCAT uses the objects $$\del'_{\alpha \beta}$$ and $$I'_{\alpha \beta} = I - \b{n}_{\alpha} \b{n}_{\alpha}$$ to write the second term, which I think requires more explanation than they give. The prime symbol $$'$$ is being used to mean that an operator is of one dimension less than it would normally be, so this is a _surface_ derivative and a _surface_ projection operator rather than volumes. (Similarly $$\del''$$ and $$I''$$ are derivatives/projections for curves). I don't love this notation; the subscript should really already be telling us that. (I guess there is some ambiguity whether $$I_{\alpha \beta}$$ projects _points_ or _vectors_ onto the surface, though.)

Here is how I think about it:

$$I$$ is the identity tensor on vectors in the whole space. Subtracting off the projection onto a particular vector removes that direction from the identity. For the case of the boundary $$(\alpha \beta)$$, you can subtract off the normal $$\b{n}_{\alpha}$$ (or $$=-\b{n}_{\beta}$$) to get 

$$I_{\alpha \beta} = I - \b{n}_{\alpha} \b{n}_{\alpha}$$

Which means $$I - \b{n}_{\alpha} \o \b{n}_{\alpha}$$. (I don't feel like writing $$\b{I}$$ for $$I$$ since it's not really a vector anyway.) If we write this out in terms of $$(\b{n}, \b{u}, \b{v})$$ unit vectors(with the $$\alpha$$ subscripts omitted) then it looks like 

$$I'_{\alpha \beta} = I - \b{nn} = [\b{nn} + \b{uu} + \b{vv}] - \b{nn} = \b{uu} + \b{vv}$$

Note that $$\b{nn} = I_n$$ is the projection operator for the normal direction, so this really says

$$I - I_n = I_{uv} - I_n = I_{uv}$$

A primed derivative is a derivative composed with a projection operator. For example,

$$\del = \b{n} \p_n + \b{u} \p_u + \b{v} \p_v$$

and therefore

$$\del'_{\alpha \beta} = I_{\alpha \beta} \del = (I - \b{nn}) \del =  \b{u} \p_u + \b{v} \p_v$$

Which we could write in $$(u,v)$$ coordinates as $$\del = (\p_n, \p_u, \p_v)$$ and $$\del'_{\alpha \beta} = (0, \p_u, \p_v)$$.

The primed _variation_ is a bit weirder. TCAT writes

$$\overline{\delta}' f = \overline{\delta} + \delta \b{x} \cdot \b{n} \b{n} \cdot \del f$$

To understand this, recall that

$$\delta f = (\delta_{\b{x}} f + \overline{\delta} f) =  \delta \b{x} \cdot \del_{\b{x}} f + \overline{\delta} f$$

Evidently they are factoring the first term as

$$\delta f =  \delta \b{x}  \cdot [\b{u} \p_u + \b{v} \p_v f + \b{n} \p_n f]+ \overline{\delta} f$$

and then consolidating the $$\del_n $$ with the second term:

$$\delta f= \delta \b{x} \cdot [\b{u} \p_u + \b{v} \p_v f] + [(\delta \b{x} \cdot \b{n}) \p_n f + \overline{\delta} f] = \delta \b{x} \cdot \del_{uv} f  + \overline{\delta}' f$$

I'm still kinda confused why these terms are being combined. I guess the justification is something like this:

1. When $$F_{\alpha \beta}$$ is integrated, there are terms due to the way that $$f_{\alpha \beta}$$ and terms due to the way that the integration region itself varies.
2. All of the terms due to $$f_{\alpha \beta}$$ changing are consolidated into $$\overline{\delta}' f$$. This means both changes due to $$\e$$, and changes due to the surface moving in the $$\b{n}$$ direction and therefore evaluating $$f$$ at a new point, $$f(\b{x} + \delta \b{x}) \ra f + (\p_n f )(\delta n) = f + (\p_n f )(\b{n} \cdot \delta \b{x})$$

-----

For integral (2), we need to make sense of $$\del'_{\alpha \beta} \cdot I'_{\alpha\beta} \cdot \delta \b{x}$$. I already know what this term turns out to be, but I want to see it intuitively. Specifically it is going to turn out to be related to the [mean curvature](https://en.wikipedia.org/wiki/Mean_curvature) via $$2H = - \del \cdot \b{n}$$. So the exact term is 

$$\del' \cdot \b{n}_{\alpha} \b{n}_{\alpha} \cdot \delta \b{x} = (-H/2) \delta n$$

But they've rewritten things in terms of the derivative of the projection $$I_{\alpha \beta}'$$. How does that work?

$$I_{\alpha \beta}' = \b{uu} + \b{vv}$$

we can rewrite this as...


