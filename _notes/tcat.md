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

# Appendix A

The notations for variational calculus used here are different than those in physics. However I don't particularly like the physics ones either, because really variational calculus is exactly the same as regular calculus (and it is literally the same if you discretize your functions, e.g. $$F[x(t)] = F[(x_0, x_1, x_2, \ldots, x_N)]$$ for $$N \ra \infty$$; the differences are mostly on the analytical side). So I will write things in my own notations as I go.


--------

## 1. Classical Approach to Volume Integrals (A.2 through A.32)

These describe the "classical" approach to varying a volume integral over a _changing_ surface $$F = \int_{\Omega(\b{x})} f(\b{u}(\b{x})) d\Omega$$. 

$$\delta F = \int_{\Omega} \overline{\delta} f(\b{u}) \, d \frakr + \int_{\Gamma} f(\b{u}) \b{n} \cdot \delta \b{x} \, d \frakr \tag{A.32}$$

Note that the derivation is also basically found on Wikipedia under [Reynolds Transport Theorem](https://en.wikipedia.org/wiki/Reynolds_transport_theorem), although in slightly less generality. The Wiki version is

$$
\begin{aligned}
\frac{dF}{dt} &= \frac{d}{dt} \int_{\Omega(t)} f dV \\
&= \int_{\Omega(t)} \p_t f dV + \int_{\p \Omega(t)} (\b{v}_b \cdot \b{n}) f dA 
\end{aligned}
\tag{Reynolds Transport Thm.}
$$

The difference is that in the Reynolds theorem is talking about how an integral changes as the surface and function $$\b{f}$$ evolve in time, whereas the TCAT version describes arbitrary variations of the path itself (presumably in order to find its equilibria). But they are the same idea.

--------

TCAT's $$\overline{\delta}$$ notation is strange. The meaning is that it is the 'independent' variation of an object _not_ due to the variation in $$\b{x}$$. Using their notation of regarding variations as parameterized by an infinitesimal $$\e$$, they write

$$\overline{\delta} \b{u} = \p_{\e} \b{U}(\b{x}, \e)$$

and

$$\overline{\delta} f(\b{u}) = f_{\b{u}} \overline{\delta}\b{u}$$

and

$$\delta \b{u} = \overline{\delta} \b{u} + \b{u}_{\b{x}} \delta \b{x}$$

I haven't seen this before, but it corresponds to the $$\b{f}_t$$ in the Reynolds tranport theorem: the derivative of $$\b{f}(\b{x}, t)$$ due to dependent variables other than $$\b{x}$$. I would probably write it as $$\delta_{\perp \b{x}}$$ instead, such that

$$\delta \b{u} = \delta_{\b{x}} \b{u} + \delta_{\perp \b{x}} \b{u} = \b{u}_{\b{x}} \delta \b{x} + \delta_{\perp \b{x}} \b{u}$$

(Notation note: I'm writing $$f_{\b{u}}$$ for the gradient $$\p_{\b{u}} = \del_{\b{u}} f$$ and $$\b{u}_{\b{x}}$$ for the (2-tensor) gradient $$\p_{\b{x}} \b{u} = \del_{\b{x}} \b{x}$$.)

-------

The TCAT paper's derivation of the transport theorem was hard to follow for a few reasons. One, I have not done these continuum mechanics calculations before. Two, anything involving Jacobians and determinants and their derivatives is always confusing. But three, it was hard to figure out what was going on with the $$\Omega^*$$ term, the variation applied to the integration bounds themselves---why did they change? What does that mean?

I believe the answer comes from figuring out exactly what $$\delta \b{x}$$ means here. We are dealing with an integral over the surface $$\Omega$$ as expressed in [Lagrangian coordinates](https://en.wikipedia.org/wiki/Lagrangian_and_Eulerian_specification_of_the_flow_field), meaning that each point on the surface is parameterized by the point it _started_ at; that's the

$$\b{x}^* = \b{X}(\b{x}, \e)$$

at the start.

I don't love the name "Lagrangian coordinates" because it doesn't really tell you what they mean. Also, it overloads the word "Lagrangian" which means a lot of other things already. It would be nice to have a different and more mundane word for it. The best one I could think of was "comoving coordinates", because they're co-moving (with the fluid). This term is also a bit overloaded because it also refers to comoving with a particular reference frame, but I think that's ok. In the same vein, I really prefer "ambient coordinates" to "Eulerian coordinates" for the fixed ambient frame ("background coordinates") would also work.

Comoving/Lagrangian coordinates are _normally_ used to talk about the time-evolution of a fluid: you would write $$\b{x}(t) = \b{X}(\b{x}_0, t)$$ for the location that the particle which started at $$\b{x}_0$$ ended up. Then you compute an integral over the body at a time $$t$$ by instead integrating it over the body at time $$0$$, but regarding the motion $$\b{x}_0 \ra \b{x}$$ as a "coordinate change" even though it is actually an active transformation (which is a neat trick I hadn't seen before):

$$\int_{\Omega(t)} f(\b{x}(t)) \, dV = \int_{\Omega_0} f(\b{X}(\b{x}_0, t)) J \d V_0$$

So the version in the TCAT paper is doing the same idea, but instead of the comoving evolution equation describing the motion of the fluid in _time_, it's describing our arbitrary variation at a fixed time. This is also why both $$\b{x}$$ and $$\b{u}$$ have their own variations: because we can vary more things than just the position variables.

The reason that $$\Omega^*$$ exists, then, is that when we vary the $$\b{x}$$ coordinates we do necessarily change the position of $$\Omega$$ itself, exactly as if we had moved a fluid forward in time instead. Varying $$\b{x}$$ is essentially varying the shape $$\Omega$$. 


Here's TCAT's dervaition. derivation. We want to compute 

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

Here's another way heuristic way of thinking about the same calculation. Consider writing

$$\Omega^* = \Omega + \delta \Omega$$

Here $$\delta \Omega$$ describes all of the changes in the resulting positions of points (in comoving coordinates). That is, given each point $$\b{x}_0 \in \Omega$$, its resulting position after the variation is $$\b{x}_0 + \delta \b{x}_0$$; the overall variation $$\delta \b{x}$$ describes an 'infinite' vector of these for every choice of $$\b{x}_0$$.

We can factor $$\delta \Omega$$ into two parts. One consists of "rearrangements" of the positions within $$\Omega$$. Since we end up integrating over $$d V$$ we do not actually care if points "compress" in some locations and "expand" in others. We can write this term as $$\sigma(\Omega)$$, implying that it "permutes" $$\Omega$$ without changing it; the result is that $$\Omega + \sigma(\Omega) = \Omega$$ again (as a set, I guess). The other part consists of how the actual boundary of $$\Omega$$ changes. Since each point on the boundary moves to a new point $$\b{x}_0 \ra \b{x}_0 + \delta \b{x}_0$$, each differential area element $$d \b{A}_0$$ corresponds to a new volume $$\delta \b{x} \cdot d \b{A}_0$$. As a result we can write

$$\Omega + \delta \Omega = \Omega + \sigma(\Omega) + \delta \b{x} \cdot \p \Omega = \Omega + \delta \b{x} \cdot \p \Omega$$

Therefore:

$$
\begin{aligned}
\delta_{\b{x}} \int_{\Omega} f(\b{u}) \d V &= \int_{\Omega + \delta \Omega} f(\b{u}) \d V - \int_{\Omega} f(\b{u}) \d V \\
&= \int_{\Omega + \delta \b{x} \cdot \p \Omega} f(\b{u}) \d V - \int_{\Omega} f(\b{u}) \d V \\
&= \int_{\delta \b{x} \cdot \p \Omega} f(\b{u}) \d V \\
&= \int_{\p \Omega} f(\b{u}) (\delta \b{x} \cdot \d A)
\end{aligned}
$$

This is admittedly a sketchy argument, but I think it's correct. I came to it by staring at the previous argument for a while and trying to make sense of what the integration-by-parts terms "means". 

The answer basically is that, although there is a first-order variation in the value of $$f(\b{u}^*) \approx f(\b{u} + \delta \b{u}) \approx f(\b{u}) + f_{\b{x}} \delta \b{x}$$ throughout $$\Omega$$, it gets cancelled out by the term from the integration-by-parts because none of those contributions actually change the resulting $$\int_{\Omega}$$. In particular, if moving some points causes $$\int f(\b{u})$$ to change at a given point, then moving some _other_ points into the gap left behind will cause it to change by $$-\int f(\b{u})$$ to compensate---except at the changes in the boundary $$ \p \Omega$$, where points can be genuinely added or removed.[^holes]

[^holes]: Strictly speaking you can also add/remove points in the interior because $$\delta \Omega$$ is in principle allowed to introduce "holes" in $$\Omega$$. However this won't change the integral to first-order because the holes will have volume $$\sim \e^3$$. I am however confused about how this works if you introduce 2d holes, that is, "cuts", in $$\Omega$$. In that case you are essentially creating a new boundary on the interior somewhere, and it feels like you would want your integral to be over that as well, as it will also end up having a volume which is first-order in $$\e$$. (I think this is solved by requiring $$\delta \b{x}$$ be continuous, which prevents introducing holes because that would be a point at which its values point in opposite directions e.g. a discontinuity.)

Before continuing, a few mathematical notes.

------

<aside class="toggleable" id="material" placeholder="<b>Aside</b>: Note on material derivatives <em>(click to expand)</em>">

In the process of understanding this I learned that the material derivative is quite simple.

The comoving coordinate formulation of a field $$f$$ is

$$f(\b{x}, t) = f(\b{X}(\b{x}_0, t), t)$$

Therefore its derivative is

$$d f = f_{\b{x}} d \b{X} + f_t dt$$

The total time derivative is

$$\frac{df}{dt} = f_{\b{x}} \frac{d \b{X}}{dt} + f_t$$

But $$\nfrac{d \b{X}}{dt}$$ is just the velocity $$\b{u}$$ of the fluid packet at position $$\b{x}$$ (which happened to start at position $$\b{x}_0$$, but that doesn't matter). Therefore

$$\frac{df}{dt} = f_{\b{x}} \cdot \b{u} + f_t$$

Which is more commonly written

$$\frac{df}{dt} = \b{u} \cdot \del f + \frac{\p f}{\p t}$$


</aside>

<aside class="toggleable" id="jacobian" placeholder="<b>Aside</b>: Note on Jacobians <em>(click to expand)</em>">


Earlier we have this coordinate change $$\b{x} = \b{X}(\b{x}_0, t)$$ and then we have a volume integral transformation

$$\int f \d V = \int f \; J \d V_0$$

The better way to write this is in terms of exterior algebra (with some of my own modifications). I will write it out even though this won't be sufficient to explain it. Note that this is related to the math of differential forms, but other than the fact that we're doing it in an integral it applies to vectors algebra in general.

First, note that $$d \b{x} = (dx, dy, dz)$$ is the "frame" of differentials. The volume element is given by the third exterior power:

$$dV = d^{\^3} \b{x} = dx \^ dy \^ dz$$

The notation $$d^{\^3} \b{x}$$ means that it is the third exterior power of the _frame_; the exterior product of a vector with itself is always zero, but the exterior power of a frame with itself is not zero; instead it contains only of products of unique terms in the frame.

The change of variables is in order to write this in terms of $$d V_0 = d^{\^3} \b{x}_0 = dx_0 \^ dy_0 \^ dz_0$$. We do this by taking the third exterior power of the change of variables $$\b{X}$$:

$$
\begin{aligned}
dV &= d \b{x}^{\^3} \\
&= d \b{X}(\b{x}_0) ^{\^3}\\
&= \frac{d \b{X}^{\^3}}{d \b{x}_0^{\^3}} d\b{x}_0^{\^3} \\
&= (\frac{d \b{X}}{d \b{x}_0})^{\^ 3} d \b{x}_0^{\^3} \\
&= \det (J) d V_0
\end{aligned}
$$

Here $$J = \nfrac{d \b{X}}{d \b{x}_0}$$ is the Jacobian of the coordinate transformation (really, it's just the first derivative of $$\b{X}$$), and $$\det J =\frac{d  \b{X}^{\^3}}{d \b{x}_0^{\^3}}= (\frac{d \b{X}}{d \b{x}_0})^{\^ 3}$$ is the Jacobian determinant. (Note, I do not write this as $$\| J \|$$ because it can be negative if the coordinate change swaps orientations, yet the vertical bars visually imply that it's positive). This is generally a much better way to think about what a Jacobian is. The "general rule" here is that if a linear transformation $$Q$$ acts on each term of a $$k$$-wedge product $$\b{a} \^ \b{b} \^ \b{c}$$, you can factor it out into the $$k$$-exterior power:

$$(Q \b{a}) \^ (Q \b{b}) \^ (Q \b{c}) = Q^{\^ 3} (\b{a} \^ \b{b} \^ \b{c})$$

If $$Q$$ is $$n \times n$$ then $$Q^{\^ n} = \det Q$$.[^det]  This identity gives the above with $$Q = \nfrac{d \b{X}}{d \b{x}_0}$$ and $$\b{a} \^ \b{b} \^ \b{c} = dx_0 \^ dy_0 \^ dz_0 = \b{x}_0^{\^3}$$.

[^det]: Strictly speaking, if $$Q: V \ra W$$ then $$Q^{\^ n}$$ is a linear transformation $$\^^n V \ra \^^n W$$, so its only _component_ $$\det Q = \tr Q^{\^ n}$$ is the determinant, since the determinant has to be a scalar---but this detail rarely matters and people often fudge it.

The first-order approximation of the determinant can be seen as following from the fact that $$\^$$ is a linear operator on both arguments. So

$$
\begin{aligned}
d (a \^ b \^ c) &= \p_a (a \^ b \^ c) da + \p_b (a \^ b \^ c) db + \p_c (a \^ b \^ c) dc \\
&= (b \^ c) da + (c \^ a) db + (a \^ b) dc \\
&= (a,b,c)^{\^ 2} \^ (da, db, dc)
\end{aligned}
$$

Things are a bit more confusing in our case, because we're starting with $$J = \nfrac{d \b{x}^{\^ 3}}{d \b{x}_0^{\^3}}$$ and then taking the _variational_ derivative of that, for the small approximation $$\b{x} = \b{x}_0 + \delta \b{x}$$. It looks like this:

$$
\begin{aligned}
\delta \frac{d \b{x}^{\^3}}{d\b{x}_0^{\^3}} &= \frac{d(\b{x}_0 + \delta \b{x})^{\^3}}{d \b{x}_0^{\^3}} - \frac{d \b{x}^{\^3}}{d\b{x}_0^{\^3}} \\
&= \frac{d \b{x}_0^{\^2} \^ d \delta \b{x}}{d \b{x}_0^{\^3}} \\ 
&= \frac{\delta \b{x}}{d \b{x}_0} \\
&= \del \cdot \delta \b{x}
\end{aligned}
$$

I definitely can't claim this manipulation is rigorous without working it all out in indexes, but it makes some intuitive sense. (In particular, it's not at all clear that it's valid to cancel out two of the factors of $$d \b{x}_0^{\^2} / d \b{x}_0^{\^3} = 1/d \b{x}_0$$) I have some ideas for doing it symbolically and rigorously at the same time, but I haven't figured out all the details yet.

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

over all space, where $$\b{x} = \b{X}(\b{x}_0, \e)$$ is a comoving coordinate for the fluid. This clearly needs to be defined everywhere, not just inside the fluid. Now you might argue that this is not a problem because you can reduce the integral to $$\int_{\Omega}$$ _before_ switching to comoving coordinates... but that feels like the wrong approach. You should be able to instead compute

$$\int 1_{\Omega}(\b{X}(\b{x}_0, \e)) f(\b{X}(\b{x}_0, \e)) \d V$$

without doing this. 

Some LLM-querying suggests that this is solved with what's called a "fictitious extension", but then it didn't really turn up anything about that.

Off the top of my head it seems like you can basically imagine that $$\b{x}_0$$ is extended to be defined everywhere, and remaps points as necessary to "stay out of the way" of the fluid, so that $$\b{X}$$ is bijective everywhere, not just on $$\Omega$$. I have no idea if this runs into theoretical problems but I don't see why it would. (I mean: you can have a fluid where everything starts spread out and then gets arbitrarily close together, or vice versa... but you can still have a bijection in each case). 

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

$$\int_{\alpha \beta} f \d A = \int f \, (- \b{n} \cdot \p_{\b{x}} 1_{\alpha}) 1_{\alpha \beta} \d V = \int \delta(n_{\alpha}) f \; 1_{\alpha \beta} \d V \tag{A.42}$$

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

Comment: I'm not very happy with any of this in the form I've stated it here, but I don't want to go to far afield at the moment. I think there is a better way to think about all of this in terms of "inverse differentials", as I have written about [here](http://localhost:4000/2024/03/12/indicators.html). However, when I wrote that post I had not figured all the details out yet and I think there are a few mistakes in it. I am hoping that after I work through all this stuff I can write a followup which gets it correct.

------

For TCAT's integral over a common curve between three volumes $$\alpha, \beta, \gamma$$, we repeat the above but include delta functions for both boundaries. We can't just use $$\delta_{\p \alpha} \delta_{\p \beta}$$, however, because they may not necessarily be orthogonal, and you can't multiply delta functions which are not in orthogonal directions (more on this later...) Instead you need the first differential to be the normal between two of the surfaces, say $$\delta_{\alpha} \b{n}_{\alpha} = - \p_{\b{x}} 1_{\alpha}$$, and then the seond one is the normal of _that_ boundary, $$\delta_{\alpha \beta} \b{n}_{\alpha \beta} = -\p_{\b{x}} 1_{\alpha \beta}$$

So

$$
\begin{aligned}
\int 1_{\alpha \beta \gamma} f \d V &= \int 1_{\alpha \beta \gamma} \delta_{\alpha} \delta_{\alpha \beta} f \d V \\
&= \int 1_{\alpha \beta \gamma} (- \b{n}_{\alpha} \cdot \p_{\b{x}} 1_{\alpha}) (- \b{n}_{\alpha \beta} \p_{\b{x}} 1_{\alpha \beta}) f \d V
\end{aligned} \tag{A.47}
$$

In imaginary normal coordinates you can think of this as $$(n_{\alpha}, n_{\alpha \beta}, t)$$, where $$n_{\alpha \beta}$$ is basically the normal coordinate for the integration region in $$(u,v)$$ coordinates that is left after you move to $$(n, u, v)$$ coordinates, and $$t \in T$$ is an arbitrary integration range that parameterizes the resulting curve. Then

$$\int 1_{\alpha \beta \gamma} f \d V = \int \delta(n_{\alpha}) \delta(n_{\alpha \beta}) 1_{t \in T} f \d V$$

Again, I'm not happy with any of this, but it is a way of thinking about what TCAT is doing.

--------

## 3. Variations of Integrals