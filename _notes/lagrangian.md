---
layout: article
title: "Lagrangian Notes"
math: true
category: notes
footnotes: true
aside: true
---

Unorganized copy-pastes from other files.

# 1. Dual basis argument (old version)

*[I have a cleaner version of this typed up somewhere which I will paste in a later section hopefully... This is copied from an old draft]*

I came across a 1972 paper [Geometric Nature of Lagrange's Equations](https://aapt.scitation.org/doi/abs/10.1119/1.1987001) by Brian Lee Beers which presented an alternative derivation of the Euler-Lagrange equations without least action. Then I found a [comment](https://aapt.scitation.org/doi/10.1119/1.1987615) complaining that Beers' derivation wasn't actually original, since it had previously existed in the 1965 textbook "Introduction to the Principles of Mechanics" by Walter Hauser. So I tracked that down and... it's true. There's a totally different, and much better (non-magical!) derivation of least action. Where did this derivation go? Why isn't it taught anymore?

In fact, there are a few other things in the Hauser book which are conspicuously different from the way analytical mechanics is normally taught, which I will now summarize because they are necessary to understand the Lagrangian derivation.

Hauser presents the concept of co- and contra-variant vectors early in a discussion of non-orthogonal coordinate systems. He constructs a _reciprocal basis_ $$\{e^i \}$$ to a general non-orthogonal frame $$\{e_i \}$$, with the property that $$e_i \cdot e^j = \delta_i^j$$. We recognize these as the dual vectors used in relativity, and I'll use the modern notation here. Normally these are given by $$e^i = g^{ij} e_j$$, where $$g^{ij}$$ is the inverse of the metric tensor $$g^{ij}$$. In mechanics, where we know we have only three coordinates, we can explicitly write these as vectors via:

$$e^1 = \frac{e_2 \times e_3}{e_1 \cdot e_2 \times e_3}$$

and etc via cyclic permutations for $$e^2, e^3$$. These are the columns of $$\{ e_i \}^{-1}$$, and the denominator is $$\det (e_1, e_2, e_3)$$. Unlike in differential geometry, though, we continue to treat these as vectors, and to use them with the dot product (instead of defining an inner product via pairing a vector with a dual vector). It's the same result, but it's mildly convenient to not incorporate dual vector spaces when we don't need them.


I've found references to this concept on [Wikipedia](https://en.wikipedia.org/wiki/Reciprocal_lattice#Mathematical_description), but mostly I'm surprised that these aren't used this way anymore -- they seem natural and useful. (Of course, dual vectors and basis changes are ubiquitous, but Hauser's version. is much more fluid to use).

Since $$e_i \cdot e^j = \delta_i^j$$, we can use the dual basis to comfortably project an abstract (index-less) vector onto a coordinate system:

$$v \cdot \{ e^i \} = v^j e_j \cdot e^i = v^i$$

So $$v_i = v \cdot e_i$$ are the regular velocity components, and $$v_i = v \cdot e_i$$ are the _contravariant_ components (its dual).

And this handily encodes changes of basis:

$$v^i = v \cdot f^i = (v^j e_j) \cdot f^i = v^j (e_j \cdot f^i)$$

--------

Now suppose we want to do physics in generalized coordinates $$q = \{ q_i(x) \}$$ which are functions of the Euclidean coordinates. The tangent vectors $$e_{q_i}$$ at a point are given by transforming the Euclidean tangent vectors $$e_{x_j}$$ via the Jacobian $$\frac{\p q_i}{\p x_j}$$ of the coordinate change:

$$e_{q_i} = \frac{\p q_i}{\p x_j} e_{x_j}$$

And the cotangent vectors:

$$e^{q_i} =  \frac{\p x_j}{\p q_i} e^{x_j}$$

We write our system's velocity in these coordinates. The covariant velocity components are

$$v_{q_i} = (v_{x_j} e^{x_j}) \cdot e_{q_i} = v_{x_j} \frac{\p x_j}{\p q_i} $$

And the contravariant velocity components are 

$$v^{q_i} = (v^{x_j} e_{x_j}) \cdot e^{q_i} = v^{x_j}  \frac{\p q_i}{\p x_j}  $$

The magnitude of the velocity vector is basis-independent: $$v^2 = v \cdot v = v_{q_i} v^{q_i} = v_{x_j} v^{x_j}$$, and it's helpful to write the covariant velocity like this: 

$$v_{q_i} = \p_{v^{q_i}} \big( \frac{1}{2} v^2 \big)$$

For example, the covariant velocity in spherical coordinates is given by differentiating $$v^2 = \dot{r}^2 + r^2 \dot{\theta}^2 + r^2 \sin^2 \theta \dot{\phi}^2$$, and then:

$$\begin{aligned}
v_1 &= \frac{1}{2} \p_{\dot{r}} v^2 = \dot{r} \\
v_2 &= \frac{1}{2} \p_{\dot{\theta}} v^2 = r^2 \dot{\theta} \\
v_3 &= \frac{1}{2} \p_{\dot{\phi}} v^2 = r^2 \sin^2 \dot{\phi}
\end{aligned}$$

--------

Now there is a trick which must be played. This had me confused for a very long time, so I'm going to be as explicit about it as possible.

The problem is that, at this point, people always start using $$\dot{x}_j$$ and $$\dot{q}_i$$, which is strange because up until now those were just labels for the coordinate system -- and while $$q$$ may be time-dependent, they're using these to refer to the particle trajectory, not the coordinates.

I am _pretty_ sure that the step which justifies this is equivalent to the application of d'Alembert's principle in the Goldstein derivation where we wrote $$(F - \dot{p}) \cdot \delta x$$. By projecting onto $$\delta x$$, we are able to drop all of the terms which violate the constraint.

We will also make use of the fact that, having performed the trick, we can add time derivatives to Jacobians if we need them.

$$\frac{\p q_i}{\p x_j} = \frac{\p \dot{q}_i}{\p \dot{x}_j}$$

So now the reason for all this is because that the _covariant acceleration_ is, um, familiar:

$$\begin{aligned} 
a_{q_i} &= a_{x_j} \frac{\p x_j}{\p q_i} \\
&= d_t (v_{x_j} \frac{\p x_j}{\p q_i}) - v_{x_j} \, d_t \frac{\p x_j}{\p q_i} \\
&= d_t (v_{x_j} \frac{\p \dot{x}_j}{\p \dot{q}_i})- v_{x_j} \frac{ \p \dot{x}_j}{\p q_i} \\
ma_{q_i} &= d_t (\p_{\dot{q}_i} T_{q_i}) - \p_{q_i} T

\end{aligned}$$

This says that the $$T$$ part of the Euler-Lagrange equations is simply a covariant expression of $$ma$$ in generalized coordinates.

Just to finish things out: when we then have motion in a conservative potential (or in a conservative velocity-dependent potential, with some modifications) we can write $$F = -V_{q_i}$$ and then regroup to express this in terms of $$L = T - V$$:

$$d_t \p_{\dot{q}_i} L - \p_{\dot{q}} L = 0$$

If there are other non-conservative forces involved, we can express them in generalized coordinates via $$F_{q_i} = F_{x_j} \frac{\p x_j}{\p q_i}$$ (usually written $$Q_{q_i}$$), and then we get the most general form:

$$Q_{q_i} = d_t \p_{\dot{q}_i} L - \p_{q_i} L$$

So the Lagrangian formulation is simply a re-phrasing of Newtonian mechanics into general, possibly time-dependent (which I didn't handle but it's the usual stuff), possibly non-orthogonal, possibly non-normalized coordinates, and the specific use of the Lagrangian is useful if the force is conveniently conservative.

That's neat. Euler-Lagrange as a covariant expression of $$F = ma$$. I'll take it. There is still a sleight-of-hand where d'Alembert's principle gets secretly involved -- ugh. And it still doesn't provide much insight into $$L = T - V$$, exactly

----------

Note: I wrote this all out in painful detail to make sure I got it. A much shorter version is to just write $$\p_{x_i} V - \p_t (m v_{x_i}) = 0$$ and then immediately write these in $$q$$ coordinates, if you already know what you are doing.

// todo: but you end up using d'alembert again anyway!?

-------

# 2. Hamiltonian as Lagrange Multiplier argument


Here's another aspect of the connection between the Lagrangians of physics and the Lagrangians of Lagrange Multipliers. It turns out that:[^legendre]

1. The Hamiltonian formulation of Mechanics is produced by asserting that the velocity $$v(t)$$ of a particle is the time derivative of its position $$\dot{x}(t)$$ as a constraint function.
2. This reproduces the "Legendre Transform" between the $$L$$ and $$H$$ functions, but makes a lot more sense than just doing that arbitarily.
3. The Lagrange multiplier for this constraint is the momentum $$p(t)$$. Evidently this is what momentum is: it's a Lagrange Multiplier for changing the velocity of a particle in a particular coordinate.

[^legendre]: I became aware of this perspective from a [comment](https://news.ycombinator.com/item?id=19765389) by Jules Jacobs as well as the helpful answers on [this](https://physics.stackexchange.com/questions/790569/derivation-of-hamiltonian-by-constraining-lq-v-t-with-v-dotq) stackexchange post.

An interesting way of rephrasing the Lagrange formulation of the previous section is to "forget" about the functional relationship between $$\dot{x}(t)$$, the time derivative of position, to the position $$x$$ itself, by writing it as a separate function $$v(t)$$, and then regard the requirement that $$\dot{x}(t) = v(t)$$ as a constraint that we enforce using a Lagrange multiplier. The resulting problem is

$$
\begin{aligned}
\min_{x, \dot{x}} L(x, \dot{x}) &= \min_{x, v, \vec{\lambda}} L(x, v) + \vec{\lambda} \cdot (\dot{x} - v) \\
&= \min_{x, v, \vec{\lambda}} L(x, v)  -  \vec{\lambda} \cdot v + \vec{\lambda} \cdot \dot{x} \\
&= \min_{x, v, \vec{\lambda}} L'
\end{aligned}
$$

Where we have defined a new Lagrangian $$L' = L(x, v)  -  \vec{\lambda} \cdot v + \vec{\lambda} \cdot \dot{x}$$. So now we have a minimization problem in three functions instead of two: $$x(t)$$, $$v(t)$$, and $$\vec{\lambda}(t)$$, where $$\vec{\lambda}$$ is a function of time (because the constraint acts like a bunch of separate constraints at every point in time). Here's the weird trick: we can factor out the $$\min_{v}$$ part into a separate term, which we'll call, say, $$H$$:

$$H(x, \vec{\lambda}) = \max_{v} \vec{\lambda} \cdot v -  L(x, v) $$

(Note that this switches to a $$max_{v}$$ because this term is negative in the expression we were minimizing. Some authors define swap the sign on this to keep it as a $$\min$$, and it's kinda confusing, but I'm following the physics convention here as far as I know?) The remaining optimization problem is now

$$\min_{x, \vec{\lambda}} \vec{\lambda} \cdot \dot{x} - H(x, \vec{\lambda})$$

Which looks a lot like the original Lagrange multiplier problem! Only now we are minimizing over $$x, \vec{\lambda}$$ rather than $$x, \dot{x}$$. Weird. $$H$$ is called the "Hamiltonian", and I'm told that this reformulation of the initial problem is called the [dual problem](https://en.wikipedia.org/wiki/Duality_(optimization)) in optimization theory. 

In physics the Lagrange multiplier $$\vec{\lambda}$$ is the thing we call momentum, $$p$$, and we always write the $$x$$ variable as $$q$$ instead because they're not necessarily the coordinate variables. Then the overall minimization problem is 

$$ \min_{q, v, p} L' = \min_{q, p} p \cdot \dot{q} - H(x, p)$$

Now all of this is still designed to solve the original problem of making $$S = \int L \d t$$ stationary, except that we had decoupled $$\dot{q}$$ and $$v$$, so we're trying to make $$S = \int L' \d t = \int L - p \cdot (\dot{q} - v) \d t$$ stationary. Since we are still inside an integral we can still apply the Euler-Lagrange equation to the solution (the E-L equations rely on being able to integrate $$\delta \dot{p}$$ by parts so they need to be inside something like an integral). Here is the calculation:


$$
\begin{aligned}
0 &= \delta \int L' \d t \\
&= \delta \int p \cdot \dot{q} - H(q, p) \d t \\
&= \int \big[ \delta p \cdot \dot{q} + p \cdot \delta \dot{q} - H_{p} \cdot \delta p - H_{q} \cdot \delta q \big] \d t \\
&= \int \big[ \delta p \cdot \dot{q} - \underbrace{\dot{p} \cdot \delta q}_{\text{integrate by parts}} - H_{p} \cdot \delta p - H_{q} \cdot \delta q \big] \d t \\
0 &= \int [\dot{q} - H_{p}] \cdot \delta p + [- \dot{p} - H_{q}] \cdot \delta q \d t \\
\end{aligned}
$$ 

Finally, for $$\delta S = 0$$ for any choice of variation $$(\delta q, \delta p)$$, the integrand has to be zero at all times, which gives Hamilton's equations of motion:

$$
\begin{aligned}
H_{q} &= - \dot{p} \\
H_{p} &= \dot{q}\\
\end{aligned}
$$ 

These express the laws of physics in terms of $$q, p$$ instead of $$q, v$$, which is apparently useful sometimes.[^poisson]

[^poisson]: What I have so far: since $$d_t(q, p) = (H_p, -H_q)$$ you can write the time evolution of a function $$f(q, p)$$ as $$d_t f = f_q \dot{q} + f_p \dot{p} = f_q H_p - f_p H_q = \{ f, H \}$$, the [Poisson Bracket](https://en.wikipedia.org/wiki/Poisson_bracket). But this acts like a rotation operator $$R$$ on $$(f_q, f_p)$$, which is super easy to exponentiate, so you can write $$e^{aR} (f_q, f_p) = (f_q(t+a), f_p(t+a))$$ to advance $$f$$ into the future, so it's probably pretty easy to compute in practice. And all of this works in whatever $$(q,p)$$ coordinates are convenient for you.

Note the difference between this variation and the usual Lagrangian one. We have varied $$L'$$ in two separate variables $$q, p$$ ("phase space") which are, for all the variation knows, unrelated to each other. Whereas in the Lagrangian formulation we are varying $$L$$ in $$x, \dot{x}$$ ("configuration space"), where the second is explicitly a time derivative of the first.

This argument at least provides a different way of looking at the "Legendre Transform". Often one just reads that the Hamiltonian is arbitrarily defined as the Legendre Transform of the Lagrangian ($$H = \max_v pv - L(q, v)$$) and it is rather mystifying. One explanation of this is that it makes two functions' derivatives into inverses: if $$g$$ is the Legendre transform of $$f$$ then $$g' = f'^{-1}$$, [roughly](https://blog.jessriedel.com/2017/06/28/legendre-transform/). But it is always nice to get another perspective, that the Legendre transform follows naturally comes extremizing a different variable first.

I will say, though, that I still don't _quite_ understand what we just did. Rather than assuming $$\dot{q} = v$$, we incorporated it as a constraint, and then enforced it through a Lagrange multiplier $$p$$, and now we expressed the problem in terms of $$p$$? What the heck? But it does seem like, following the "Lagrange multiplier tells you the rate of change of the solution with respect to the constraint" perspective: what is happening is _something_ like, "momentum is the cost of changing a velocity in a physical system". So if a force is the Lagrange multiplier for a path in a potential, well: **a momentum is the Lagrange multiplier for changing an object's velocity**. 

Something like that.

----------

# 3. Snippets from Lagrangian post which contains derivation from N2

> You are certainly entitled to ask why the quantity T - U should be of any interest. There seems to be no simple answer to this question except that it is.

(Taylor's _Classical Mechanics_, as quoted by [Wagner & Guthrie](https://arxiv.org/abs/1907.07069), which is a very nice and more legit discussion of the same stuff, by the way.)

> The most general formulation of the law governing the motion of mechanical systems is the principle of least action, ... \<nothing else\>

(Landau and Lifshitz, with no fanfare. I guess they were not philosophers.)

$$L = T - V$$ is the most memorable oddity of Lagrangian mechanics, because it seems like $$T + V$$ is a physically "meaningful" value, the total energy, so why in the world would their _difference_ matter as well? How could that be?[^l]

[^l]: Yes, $$L$$ does not _have_ to be written this way, and there are problems and coordinate systems where it cannot be. But in general it is, and that's enough to be confused.

Two ways of answering that are _not_ satisfying would be (a) "it comes from the action" (well duh but we're confused about that also) and (b) "because it gives the right answer" (sure but like...why?) 

I can think of a few ways to answer this usefully, which approach it from different directions.

--------

### Physically, why does $$L = T - V$$?

The basic physical reason why $$L = T - V$$ is due to relativity.

The action of a (free, relativistic, massive) particle is given by something that is so simple it seems intrinsically meaningful:

$$S = \int -p_\mu dx^\mu = \int \b{p} \cdot d\b{x} - E \d t $$

$$p_\mu$$ is the four-momentum $$(E, \b{p}) = \gamma(m, m\b{v})$$. In the rest frame this becomes:

$$S = \int (-m) \ d \tau$$

That is, in the absence of a potential, the action is the proper time times the mass, $$-m \tau$$. Isn't that simple? (If you think of the particle as a quantum mechanical wave, then mass corresponds to something like the frequency of its oscillation, so in a way the action of a path is simply "how many wavelengths transpire along the path". More on this later.)

In classical mechanics $$L$$ is always used in a time integral $$S = \int L \d t$$, so it does equal $$-m$$ in the rest frame, but we'll want to transform the $$- p_\mu$$ form to be entirely attached to a $$dt$$ term. We can do this $$S$$ is a line integral, and we can move terms between its components using a standard procedure that I don't quite understand[^dt], using $$d \b{x} = \b{v} dt$$:

[^dt]: When you study relativity you get pretty used to the idea that the contraction of two four-vectors $$a_\mu b^\mu$$ is manifestly covariant, so you can write it in any frame you want (usually, a rest frame in which one of them is trivial). But I don't really know how to think about the fact that $$L \d t$$ is "also" covariant: it feels like it doesn't typecheck, but I'm pretty sure it's a failure of my mental type system. $$L$$ is not a normal tensor, so... what is it? Well, it's the time component of a four-vector, but when we change frames we don't mix it into other coordinates? Weird.

$$S =  \int  \b{p} \cdot d\b{x} - E \d t = \int (\b{p} \cdot \b{v} - E) dt = \int L \d t$$

Hence

$$L = \frac{dS}{dt} = \b{p} \cdot \b{v} - E$$

For the free particle this equals $$ m \gamma v^2  -m \gamma  = - m \gamma (1-v^2) = - \frac{m}{\gamma}$$, which in the rest frame becomes $$-m$$ because $$\gamma=1$$. More importantly, the nonrelativistic approximation of $$ L = \b{p} \cdot \b{v} - E$$ is $$L = mv^2 - m - \frac{1}{2}mv^2 = \frac{1}{2} mv^2 - m = T - m$$, the rest mass plus the kinetic energy. Since we don't care about constant terms in Lagrangians we can ignore the rest mass, leaving $$L = T$$.

To get $$L = T - V$$ we have to include a potential. Well, stick it on the $$E$$ term, since it's part of the energy?

$$
\begin{aligned}
S &= \int  \b{p} \cdot d \b{x} - (E + V) \d t\\
&= \int [\b{p} \cdot \b{v} - (E + V)] \d t \\
&\approx \int [ T - V - m] \d t \\
L &= \boxed{T - V} - \underbrace{m}_{\text{ignore}}
\end{aligned}
$$

So that's where the $$T - V$$ comes from. You start with $$T + V$$ on the time component and $$- \b{p}$$ on the spatial component: moving in time ticks up your proper time; moving in space decreases it. But when the $$\b{p}$$ term moves over it becomes $$-\b{p} \cdot \b{v} \approx - m v^2$$, which turns $$+T \approx \frac{1}{2}mv^2$$ into $$-\frac{1}{2}mv^2$$. And then we write the whole thing with a negative sign by convention.

Put differently important: $$T + V$$ is important, but the term $$\b{p} \cdot \b{v} \approx 2T$$ is _also_ important: it's the change in action along spatial variations $$d \b{x}$$, while $$T+V$$ is the change along time variations $$dt$$. So $$T - V$$ is best thought of as $$2T - (T + V)$$, the difference of two important quantities, one of which we had been neglecting.

This construction is also nice because it kinda tells us what a potential is, at least in relativistic quantum mechanics: a scalar potential is a term that changes the amount of proper time we experience as we move in $$t$$.

In fact it seems to follow that a _vector_ potential is a term that changes the proper time we experience as we move in $$\b{x}$$, which will make the action $$S = - \int(p_\mu + A_\mu) dx^\mu$$. In fact, it seems like it would be possible to put the $$V$$ on the $$d \b{x}$$ term instead, by writing something morally equivalent to $$(V/\b{v}) \cdot d \b{x}$$, which is weird. But actually it's what happens in the Lagrangian for a relativistic charged particle: the Lagrangian looks like $$-m\gamma^{-1} - q E + q \b{v} \cdot \b{A}$$, and the $$+ q \b{v} \cdot \b{A} \d t$$ term is better written as a $$-q \b{A}\cdot d \b{x}$$ in $$L \d t = (p_\mu + q A_\mu) dx^\mu$$. Neat.

All of this explains why $$L = T - V$$ for a single particle. It is somewhat less clear why it holds for basically arbitrary mechanical systems. We could sort of imagine that it adds over separate systems as long as they are basically the sum of single particles, but without a deep understanding of what a Lagrangian _is_, that's just a guess. We will talk about a deep understanding of what a Lagrangian is, but... later.

------------

### But how can $$T-V$$ and $$T+V$$ both be meaningful?

I find the relativity argument helpful because it points _exactly_ at the reason that both $$T+V $$ and $$T-V$$ are physically meaningful quantities. $$T+V$$ is meaningful because it's the time component of a thing. $$T-V$$ is what you get when you subtract the spatial component, which happens to equal $$2T$$ at low velocities, from the time component.

But still we would like to answer this question from a different angle: not why _nature_ chose $$T - V$$, but why _classical mechanics_ produces $$T - V$$. After all classical mechanics with Newton's laws mostly made sense on it own, so it feels like there should be a purely classical-mechanical explanation. How and why is the difference between the classical concepts of kinetic and potential energies physically meaningful?

I thought a long time about this question some months ago and still don't have a perfect answer, but I did realize some things that I had missed before. In particular there are a few basic points that I had been taking for granted without realizing it:

First, note that conservation of energy alone is not sufficient to generate classical mechanics.

The evolution of the system is fully specified by the values of $$( d \b{x}, d \b{v})$$ for each object, which is six degrees of freedom. We get 3 of those for free from $$\dot{\b{x}}_i = \b{v}_i$$ and the other 3 from $$\b{F} = m \b{a}$$. But conservation of energy on its own only gives a single constraint: $$dE = E_\b{x} \cdot \d \b{x} + E_\b{v} \cdot \d \b{v} = 0$$. You need conservation of momentum to get all three.

(Newton's laws do not _exactly_ specify conservation of momentum, because they don't require the force as necessarily acting like it stores  momentum. But for closed systems they imply it: Newton's third law says that forces are equal and opposite, while $$\b{F} = m \b{a} = \frac{d\b{p}}{dt}$$, implying $$\sum \frac{d \b{p}}{dt} = 0$$.)

Anyway, I see that now, but it is still weird to me that $$L = T - V$$ is enough information to encode all of momentum conservation, while $$E = T + V$$ only seems to contain energy conservation. How can $$T - V$$ encode _so much more information_ than $$T + V$$? Not only does it contain more information, there's also more redundancy: $$T + V$$ is more-or-less defined up to a scalar on the $$V$$ term, while $$T - V$$ is just one of many forms that give rise to the same mechanics. Weird, right? Somehow the magic comes from the use of the variational derivative: $$\frac{\delta L}{\delta \b{x}} = L_{\b{x}} - d_t L_{\dot{\b{x}}} = 0$$, by which $$L$$ produces an equation along every coordinate, while $$d_t E = 0$$ produces an equation only along $$\b{v}$$:

$$
\begin{aligned}
d_t(E) &= d_t (T + V) \\
&= d_t [\frac{1}{2} m\b{v}^2 + V_t]
&= m \dot{\b{v}} \cdot \b{v} + V_{\b{x}} \cdot \b{v} \\
&= (m \b{a} - b{F}) \cdot \b{v}
\end{aligned}
$$

Second, note that $$\b{F} = m\b{a}$$ actually already kinda contains $$T-V$$, in a certain sense. If you write it like this:

$$-V_{\b{x}} = d_t T_{\b{v}}$$

We could rearrange that into:

$$(T - V)_{\b{x}} - d_t (T - V)_{\b{v}} = 0$$

It's just that in the boring Newtonian case $$T_{\b{x}} = V_{\b{v}} = 0$$ so you don't get to that $$T$$ and $$V$$ would have opposite signs if they had the same derivative on them.

Meanwhile as we just saw you can project $$\b{F} = m\b{a}$$ onto $$\b{v}$$ to get conservation of energy as well. So it seems like $$\b{F} = m \b{a}$$ on its own does not really lend priority to either of $$T + V$$ _or_ $$T - V$$. It contains both, depending on how you look at it.

Third, the role of [d'Alembert's Principle](https://en.wikipedia.org/wiki/D%27Alembert%27s_principle).

Per above classical mechanics is specified by conservation of momentum along every axis, which in most cases trivially implies conservation of energy.[^momentum] And as we saw, conservation of energy follows from projecting $$\b{F} = m \b{a}$$ onto the single vector $$\b{v}$$, but for each particle there are two other directions that also have their momentum conserved, but which conservation of energy doesn't say anything about. So we might like to repeat the operation where we projected $$\b{F} = m \b{a}$$ onto $$\b{v}$$, but using an arbitrary axis instead, since actually it holds in every direction. The way this gets written in analytical mechanics is that we project onto arbitrary axes called $$ \delta \b{x}$$:


[^momentum]: Cases where conservation of momentum doesn't imply conservation of energy: weird non-conservative forces, or equivalently, if there's a dissipation of energy that you're not accounting for, e.g. inelastic collisions or friction.


$$\b{F} \cdot \delta \b{x} = (m \b{a}) \cdot \delta \b{x}$$

Which is d'Alembert's Principle. To be clear, $$\delta \b{x}$$ is just "an arbitrary vector", and it's just written that way because people are about to use it to do calculus of variations. But it could have been written as anything.

Most derivations of least action start with d'Alembert's principle, but it never made a ton of sense to me. But I realize now that it's actually pretty simple. You don't really need to think about the $$\delta \b{x}$$ as a "virtual displacement" or jostling the system away from its physical trajectory. It's just _any choice of direction_ at all... or at least, any choice of direction that you can express in the $$\b{x}$$ coordinates, so it does not include directions that you've removed to handle constraint surfaces. Basically $$\delta \b{x}$$ just means you can only pick directions along which $$F_{\text{constraint}} \cdot \delta \b{x} = 0$$ holds.

Fourth, note that in the relativistic derivation up above, we found that $$L =  \b{p} \cdot \b{v} - (T+V)$$, which happens to give $$T- V$$ because $$ \b{p} \cdot \b{v} = 2T$$. Well, this is just the approximation at low energies. $$T$$ and $$\b{p}$$ are components of the four-momentum $$m \gamma (1, \b{v})$$, and we can expand the $$\gamma$$ with more terms. If we expanded up to $$O(v^4)$$ we would get

$$
\begin{aligned}
L &=  \b{p} \cdot \b{v} - (T+V) \\
&= (m \gamma(v) v^2) - (m \gamma(v) + V) \\ 
&=  (m + \frac{1}{2} v^2) v^2 - [m + \frac{1}{2} m v^2 + \frac{3}{8} m v^4 + V]\\
&=  -m + \frac{1}{2} mv^2 + \frac{1}{8} m v^4 - V
\end{aligned}
$$

So really it is just that $$L = T - V$$ in the low energy approximation, not in general. That is comforting, somehow.

All of this is forms a sort of weak answer to the question of why it's not so weird that $$L = T - V$$: it's just that $$T + V$$ was not that special anyway! It was important but not nearly powerful enough to express all of physics; it was always just part of the answer. Nor is $$T - V$$ all that special. It really just turns out to work due to some nice approximations.

### But why does $$L = T - V$$ just within classical mechanics?

That's all well and good, but how about an algebraic answer? Something that doesn't refer to relativity or quantum mechanics at all, that follows from Newton's laws?

Another way of seeing why $$L$$ should equal $$T - V$$ is that it shows up naturally under a fairly straightforward (but not obvious) manipulation manipulation of Newton's laws. For some reason this is not shown very often (well, Goldstein sorta does it, but it's cloaked in the d'Alembert stuff so it's hard to see that it's actually pretty simple).[^beers]

[^beers]: I basically got this derivation in a paper called _Geometric Nature of Lagrange's Equations_ by Beers (1972), although a comment by Roeder (1974) says it predates Beers and is found in a textbook _Introduction to the Principles of Mechanics_ by Hauser (1965). Go figure.

Consider Newton's second law, which henceforth will just be called "N2".

$$\b{F} = m \b{a}$$

A question that an inspired physicist might ask, even if they do not know about Lagrangians yet, is how to change N2 into a different coordinate system which is generally curvilinear and might encode constraints in the coordinates so you don't have to think about them. So let's do that. We'll be switching from regular Euclidean $$\b{x}$$ coordinates to generalized $$\b{q}$$ coordinates. $$T = T(\b{q}, \dot{\b{q}})$$ may now depend on the $$\b{x}$$ as well as the $$\b{v}$$, and there might also be fewer coordinates in the $$\b{q}$$ system because we only parameterize motion that obeys the constraints.

Ideally N2 would have the exact same form in this new coordinate system and look like $$\b{F}(\b{q}) \? m \ddot{\b{q}}$$. But, we have to check, and it turns out that no, it does not.

We have to rewrite $$\b{F} = m \ddot{\b{x}}$$ in terms of $$\b{q}$$ only. There is a "trick" for doing this: for a conservative force $$\b{F} = -V_{\b{x}}$$, we recognize that if we multiply it by the Jacobian[^jacobian] $$\b{x}_{\b{q}} = \frac{\p \b{x}}{\p \b{q}}$$, it will "automatically" be in $$\b{q}$$ coordinates after an application of the chain rule:

[^jacobian]: Hate that name.

$$
\begin{aligned}
\b{F} &= m \b{a} \\ 
- V_{\b{x}} \cdot \b{x}_{\b{q}} &= m \ddot{\b{x}} \cdot \b{x}_{\b{q}} \\
- V_{\b{q}} &= m \ddot{\b{x}}  \cdot \b{x}_{\b{q}}
\end{aligned}
$$

(The LHS $$-V_{\b{q}}$$ is usually labeled as a "generalized force" $$\b{Q}$$.) 

This is also the point where we handle constraint forces: if $$\b{F} = \b{F}_{\text{external}} + \b{F}_{\text{constraint}}$$, we can pick the $$\b{q}$$ variables to simply only parameterize motion that obeys the constraint. Then $$\b{x}_{\b{q}}$$ will have no components along the constraint at all, because there is no direction of changing $$q$$ that causes $$x$$ to leave the constraint (so it will be a non-square matrix that projects out some dimensions). Therefore $$\b{F} \cdot \b{x}_{\b{q}} = (\b{F}_{\text{external}} + \b{F}_{\text{constraint}} )\cdot \b{x}_{\b{q}} = \b{F}_{\text{external}} \cdot \b{x}_{\b{q}}$$. The constraint forces just vanish from the problem.

We still need to deal with the RHS, though. We use another trick: since it is very easy to write $$T(\dot{\b{x}})$$ in the $$\b{q}$$ coordinates by just plugging in $$\b{x}(\b{q}, \dot{\b{q}})$$, we'll manipulate the RHS to write it in terms of these $$\b{q}$$ derivatives of $$T$$:[^xq]

$$
\begin{aligned}
T_{\b{q}} &= T_{\dot{\b{x}}} \dot{\b{x}}_{\b{q}}  \\
&=  m \dot{\b{x}} \cdot \dot{\b{x}}_{\b{q}} \\
T_{\dot{\b{q}}} &= T_{\dot{\b{x}}} \cdot \dot{\b{x}}_{\dot{\b{q}}}   \\
&= m \dot{\b{x}} \cdot \dot{\b{x}}_{\dot{\b{q}}} \\
&= m \dot{\b{x}} \cdot \b{x}_{\b{q}} \\
\end{aligned}
$$

The derivation is

[^xq]: It is definitely not obvious to me that $$\dot{\b{x}}_{\dot{\b{q}}} = \b{x}_{\b{q}}$$ but it follows from realizing that $$\dot{\b{x}}_{\dot{\b{q}}}$$ expands by the chain rule as $$\p_{\dot{\b{q}}}(\b{x}_{\b{q}} \dot{\b{q}}) = \b{x}_{\b{q}}$$. 

$$
\begin{aligned}
- V_{\b{q}} &= m \ddot{\b{x}}  \cdot \b{x}_{\b{q}} \\
&= d_t (m \dot{\b{x}} \cdot \b{x}_{\b{q}}) - m \dot{\b{x}} \cdot d_t \b{x}_{\b{q}} \\
&= d_t (m \dot{\b{x}} \cdot \b{x}_{\b{q}}) - m \dot{\b{x}} \cdot \dot{\b{x}}_{\b{q}} \\
&= d_t (T_{\dot{\b{q}}}) - T_{\b{q}}
\end{aligned}
$$

Which rearranges into the Euler-Lagrange equation form[^xq2]

[^xq2]: The identity $$\d_t \b{x}_{\b{q}} = \dot{\b{x}}_{\b{q}}$$ is also weird. Both turn out to expand to $$\b{x}_{\b{qq}} \dot{\b{q}}$$, e.g. $$\dot{\b{x}}_{\b{q}} = (\b{x}_{\b{q}} \dot{\b{q}})_{\b{q}} = \b{x}_{\b{qq}} \dot{\b{q}}$$ since $$\dot{\b{q}}_{\b{q}} = 0$$. This kind of calculus is bewildering.

$$(T - V)_{\b{q}} - d_t (T - V)_{\dot{\b{q}}} = 0$$

So we have produced $$T - V$$, not by any sort of action principle, but _just_ by going through the steps of writing $$\b{F} = m \b{a}$$ in generalized coordinates. It was not exactly straightforward: we sorta "walked backwards" towards what we wanted, by recognizing ways of writing things in terms of $$V_{\b{q}}$$, $$T_{\b{q}}$$, and $$T_{\dot{\b{q}}}$$. I really don't see why this works so well! But it does work.[^velocity]

[^velocity]: Extending this to a velocity-dependent force is possible in some cases. When it works it is not hard but it is subtle. For the Lorentz force term $$\b{F} = q \b{E} + q \b{v} \times \b{B}$$, it's very hard to just see how to handle the cross product term. 

Incidentally you can also do this derivation by expanding the $$\b{x}$$ derivatives directly. But it is harder to follow and ends up being the same: $$V_{\b{x}}  = V_{\b{q}} \b{q}_{\b{x}}$$, and then you have to multiply through by $$\b{x}_{\b{q}}$$ in order to cancel the second term out.[^inverse]

[^inverse]:  $$ \b{q}_{\b{x}}$$ and $$ \b{x}_{\b{q}}$$ are not necessarily full inverses because there can be fewer $$q$$ coordinates than $$x$$ coordinates... but multiplying through this way is okay; because it turns into a projection matrix on the $$q$$ coordinates, which is what we care about anyway.


The actual source of the minus sign relationship in $$L = T - V$$ is that, _when_ this derivation produced a $$T_{\b{q}}$$ term, it enters with the opposite sign from the $$V_{\b{q}}$$ term. I feel like it is useful to keep this in mind! $$\b{F} = m \b{a}$$ did not include a $$T_{\b{x}}$$ term, so actually nothing about it was telling us what sign $$T_{\b{x}}$$ would have when it showed up in more general coordinates. Turns out it's a negative. Whaddayaknow.

There's a part of the above derivation that bugs me. It's that we went from $$m\b{a}$$ to $$d_t (T_{\dot{\b{q}}}) - T_{\b{q}}$$ by artitrarily expanding in $$\b{q}$$ coordinates, and then applying some algebraic tricks in order to get it into a form where we could replace terms with $$T_{\b{q}}$$ and $$T_{\dot{\b{q}}}$$. It seems like nature _wanted_ us to express physics in terms of scalar functions: it likes conservative potentials and it likes the acceleration being written as derivatives of $$T$$. Clearly these scalars are fundamental somehow. Why?

Well, I guess $$V$$ was a meaningful scalar because we assumed it was. And $$T$$ is the time component of the four-momentum, so I guess it is just intrinsically meaningful also? I don't know. Not a great answer. Sorry.