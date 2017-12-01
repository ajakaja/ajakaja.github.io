---
layout: article
title: "Mechanics (digression)"
math: true
footnotes: true
category: cache
---

*I started trying to figure out how [symplectic integrators](https://en.wikipedia.org/wiki/Symplectic_integrator) give better (roughly energy-preserving) solutions to differential equations, making them preferable for implementing physics simulations in games, and got lost in a rabbithole of 'trying to actually understand classical mechanics'. (Partly because this really needs to be solid to make better sense of QM.) Here are some notes.*

(work in progress)

(sometimes the fractions don't render well at certain zooms. Sorry. It's an [open bug](https://github.com/Khan/KaTeX/issues/824) in KateX)

<!--more-->

## 1. Newton's Laws

L1. Objects move at constant velocity unless acted upon by a force (in an inertial reference frame)
L2. $$\mathbf{F} = m\mathbf{a}$$
L3. Actions have equal/opposite reactions: $$F_{ab} = -F_{ba}$$.

A bunch of comments:

* If you have already assumed 'momentum' as a concept, (L1) is basically $$\frac{dp}{dt} = 0$$, ie, conservation of momentum. But it's not general enough to apply in interactions.
* (L2) is probably more natural as $$\mathbf{F} = \dot{\mathbf{p}}$$, which is important if $$m$$ is time-dependent.
* ... and is actually more natural as $$\mathbf{F} = D_{t}(m\mathbf{v}) = D_{t}\mathbf{p}$$, which is important if $$D$$ is a covariant derivative.
* Forces $$\mathbf{F}$$ are... sort of... a fictitious concept. Or rather, they're a way of factoring systems:
	* if you have an energy-changing interaction that you don't want to describe in your system, you describe it as an external 'thing' parameterized by internal variables -- usually a potential $$U(\mathbf{x})$$, so that $$\mathbf{F} = -\nabla U$$.
	* this is especially necessary for describing force fields if you're just doing mechanics. An object moving in gravity could only exchange energy with the gravitational field at the point it's at, and then that energy would have to travel through the field to get to wherever it's going.
	* it amounts to finding a way to parameterize an external system with variables our model *has* ($$\mathbf{x}$$).
* If forces are our abstractions of other systems, (L3) is the constraint that makes sure we're talking about the same things.
* Since $$\mathbf{F} = \dot{\mathbf{p}}$$, (L3) says that changes in momentum in one system negate changes in momentum in the other: that is, $$d_{t} \sum \mathbf{p_{i}} = 0$$.

### 1.1 Energy

**Q**: How do we initially introduce energy? Even before we talk about potential energies via $$\mathbf{F} = -\nabla U(\mathbf{x})$$, we might realize that $$T = \sum \frac{1}{2}m\mathbf{v}^{2}$$ is preserved by, like, elastic collisions: $$d_{t} T = 0$$. Why would this be... true? And why would it be natural to take this form?[^justify]

[^justify]: aside: If you google, like, "how would you derive conservation of energy", people like to remind other people that we don't **derive** things in physics; we believe them if they correspond to the behavior of nature. Well, that's not interesting and tends to miss the point that much of physics is derived from simple physical insights instead of *entirely* being pattern-matching to how reality imperically behaves. Well, that's annoying. I feel we need a better word for 'derive' when talking about motivation of aspects of theories, so that people stop saying that. Something like **reduce**?...

(It's not fair to run ahead and invoke Noether's theorem and say 'time invariance implies energy conservation'. It feels like we can say something before we get there.)

Put differently: why is E, with units of $$mass \times velocity^{2}$$, the thing that is preserved both in kinetic and potential-field interactions?

We write potentials and their forces as $$\mathbf{F} = -\nabla U(\mathbf{x})$$, because all we can generically say about all fields is that, for a particle to move from $$x \rightarrow y$$, the energy delta $$U\vert^{y}_{x}$$ must be expended. (which amounts to the observation, I suppose, that "fields create geometries on space", or something?) (By the way, note the $$U\vert^{b}_{a}$$: all energies are actually energy deltas, meaning that they're the result of integrals between two places.) (Only speaking of conservative potentials, here, since those seem to be 'realistic' ones.)

Inverting this, it might be cleaner to think of (some) (conservative) forces as energy gradients: a statement of the differential energy 'price' to move in a certain direction.

But, still, why $$\frac{1}{2}m \vert \mathbf{v} \vert^{2}$$ (or if you prefer $$= \frac{1}{2m}\vert \mathbf{p} \vert^{2}$$)?

It makes some sense that scalars are $$\propto (\mathbf{v}^{2})$$, because to take the length of a vector you have to compose it with a linear map: $$\langle \mathbf{v}, \mathbf{v} \rangle = \vert v \vert^{2} = g(\mathbf{v}, \mathbf{v}) = g_{ij}v^{i}v^{j}$$.

We *can* just find energy conservation inside Newton. In $$-\nabla U(\mathbf{x}) = D_{t} (m\mathbf{v})$$ one side is a spatial derivative and the other is a time derivative. If we want to look for conserved quantities, the left side is good for talking about things conserved in time, while the right is better for things conserved in space. We can dot both sides with $$\mathbf{v}$$:

* $$\nabla U$$ is a gradient, so $$\nabla U \cdot \mathbf{v}$$ is a directional derivative: it's the amount of energy that's changing in time.
* (It's also just $$\frac{d}{dt}U(\mathbf{x}(t))$$. If we parameterize our position by *t*, U becomes a function U(t) such that we can talk about its time-variance.)
* and $$m\frac{d}{dt}(\mathbf{v}) \cdot \mathbf{v} = \frac{1}{2} m\frac{d}{dt} (\mathbf{v \cdot v})$$

Therefore:

$$[\mathbf{F} = m\mathbf{a}] \cdot \mathbf{v} \Rightarrow -d_{t} U = d_{t} T$$

The momentum 'vector' is conserved in each direction, including time. Actually, the better 'law' is $$U + T = 0$$, and then taking time derivatives gives $$U_{t} + E_{t} = 0 \Rightarrow \mathbf{F} = m\mathbf{a}$$. I guess that's not that enlightening.

------

Musing:

Maybe there is some sort of 'abstract' conservation law, which, when projected onto a spatial direction gives (each coordinate of) $$\mathbf{F} = m\mathbf{a}$$, and when projected onto time gives conservation of energy. That is, it'd be neat if there's some sense in which an equation like:

$$-U \cdot \hat{\mathbf{x}} = \dot{\mathbf{p}} \cdot \hat{\mathbf{x}} \Rightarrow F_{x} = \dot{p}_{x}$$

$$-U \cdot \hat{\mathbf{t}} = \dot{\mathbf{p}} \cdot \hat{\mathbf{t}} \Rightarrow -\dot{U} = \dot{T}$$

(By the way, the main reason I'm thinking about this is to try to make Newtonian physics feel 'less far away' from SR, Lagrangian, or QM physics, so that intuition carries over more.)

Comparing those equations to the above 'actual' conservation of energy via $$\cdot \mathbf{v}$$, it seems odd that we dot with $$\mathbf{v}$$ to 'extract' energy. Is $$\mathbf{v}$$ the 'tangent vector' direction -- the reference frame in which we see only energy conservation (like it is in SR)? It seems strange in classical mechanics to be *forced* to talk about reference frames, since everything should be true in any frame.

Well, also: we dot with $$\mathbf{v}$$ to extract Energy conservation from (N2), and we take time derivatives (on a path) of energy conservation to get (N2). Actually, we could just project with $$\hat{\mathbf{v}}$$; what's important is the direction!



-------------

Nevertheless, the question **What the hell is energy** is still enticing, but it's possible (?) that it's only emergent from quantum mechanics. Right?


## 2. Lagrangians & Functional Calculus

*(The thing I was **really** looking to understand.)*

### 2.1 T-V?

Jumping into this ahead of everything else to get it out of the way:

The Lagrangian in classical mechanics is *usually*

$$\mathcal{L(t, x, \dot{x})} = T - V$$

When is that valid? Well, never, exactly, because you can always add a total time derivative $$f(t)$$ to $$\mathcal{L}$$, or scale $$\mathcal{L} \rightarrow c\mathcal{L}$$, without changing the solutions of the E-L equations, $$\mathcal{L}_{x} - d_{t} \mathcal{L}_{\dot{x}} = 0$$.

But also, it's only when you can write:

$$\mathcal{L(t, x, \dot{x})} = T(\dot{x}) - V(x)$$

If *V* depends on something other than *x*, it isn't a 'potential energy' anymore (it's not from a conservative force) and the form is likely not correct.

And it's apparently never true in special relativity and above. Or rather, it's only true on a Riemannian manifold, and not the pseudo-riemannian $$(-,+,+,+)$$ manifold of relativity.

(For example, you might expect the Lagrangian for a free relativistic particle to be the kinetic energy $$\mathcal{L} = (\gamma - 1)mc^{2}$$, but it's actually $$\mathcal{L} = -\frac{mc^2}{\gamma} = -mc^{2}\sqrt{1 - \beta^{2}} \approx mc^{2}(-1 + \frac{1}{2}\beta^{2}) = -mc^{2} + \frac{1}{2}mv^{2}$$. (Actually, I wouldn't expect the naive form at all, but Wiki thinks you might.))

The reason the classical mechanics form $$\mathcal{L} = T - V$$ is unsettling is that it doesn't seem to correspond to anything that's, like, 'physical' about a system. (I guess that's also the objection to $$S = \int \mathcal{L} dt$$). Granted, since many Lagrangians describe the same system, it makes sense that it would only describe the system up to isomorphism, but still: what is the point of subtracting energies; what does that do?

Even if this does not turn out to be the 'true' general form, any form that reduces to $$T-V$$ has the same unsettling quality: it seems meaningless.

---------------

I went and scoured a bunch of sources to try to figure out the 'true' reason for this form, and this is the best I've got:

**Explanation**: ([source](https://physics.stackexchange.com/questions/86008/motivation-for-form-of-lagrangian/357476#357476)) The minus sign appears because the adjoint of the derivative operator $$\partial_{t}$$, on suitable spaces, is $$\partial_{t}^{*} = -\partial_{t}$$.

This is why integration by parts works: because $$\langle f , \partial_{t} g \rangle = \langle \partial_{t}^{*} f \vert g \rangle = -\langle f , g \rangle = \int f(t)g(t)dt$$. (Only if at least one of *f* and *g* has compact support; that is, vanishes outside a radius; that is, the bounds of the integral go to zero.) (Or, I suppose, if the inner product we're using $$\langle , \rangle$$ is, instead, defined to go to zero through a weight function or something. Basically, the functions have to vanish on the boundary.)

I'm pretty sure that at some level this is the *true* reason, and the trick is just figuring out how it gets into $$T-V$$.

The example from the source is of a simple harmonic oscillator. Consider the *differential* equation:

$$(\partial_{t}^{2} + \omega^{2})x = 0$$

but then write the $$\partial_{t}$$ like this:

$$(-\partial_{t}^{*}\partial_{t} + \omega^{2})x = 0$$

And inner-product (which one unspecified for now...) by $$-\frac{1}{2}x$$ on the left:

$$-\frac{1}{2}x \cdot (-\partial_{t}^{*}\partial_{t} + \omega^{2})x = \frac{1}{2}\langle \partial_{t} x , \partial_{t} x \rangle - \frac{1}{2} \langle \omega x , \omega x \rangle = 0 = T - V$$

(Recall that for a SHO, $$V = \frac{1}{2}k x^{2} = \frac{1}{2} \omega^{2}x^{2}$$.)

Interesting: $$T - V$$ has appeared. But that's confusing: because $$(\partial_{t}^{2} + \omega^{2})x = 0$$ is derived from substituting $$U = \frac{1}{2}\omega^{2}x^{2}$$ and $$T = \frac{1}{2}m \dot{x}^{2}$$ into $$F = ma$$ in the first place, so why did I think I transformed (N2) into $$d_{t}(T+V) = 0$$ up above?

The minus sign appears, in short, from the identity $$\ddot{x} = -\dot{x}^{2}$$, when integration by parts is valid. But integration by parts is only valid under a suitable inner product where the boundary term $$\int d_{t} (x \dot{x}) dt = x\dot{x}\vert^{b}_{a}$$ vanishes. Viewing this all as simple algebraic manipulation, I think we get to choose the inner product when we do $$\langle x , (\partial_{t}^{2} - \omega^{2})x$$, so I wonder: which inner products are valid for this?

If we inner product with $$\langle \partial_{t} x, \cdot\rangle$$ instead, we just get $$d_{t} (T + U) = 0$$, as above.

If we choose the inner product $$\langle f, g \rangle = \int f g dt$$, we end up with (voilá) $$S = \int \mathcal{L} dt$$. I wonder if others are valid? The vector dot product doesn't, at least not on regular $$\mathbb{R}^{2}$$, because $$x \cdot a \neq -v \cdot v$$. Really, it has to be under some sort of time integral, because we're shifting around time integrals in the integration by parts step.

The bigger constraint seems to be that the boundary term $$x \dot {x} \vert^{b}_{a}$$ vanishes. I'm not sure what that means because I'm not really sure what we're integrating. Let's go back to the derivation:

* First, we have a differential equation $$Dx = (m\partial_{t}^{2} + \omega^{2})x = 0$$ that holds true at all times on the physically valid paths of the system. Solutions $$x(t)$$ with initial conditions give the paths of the systems under time evolution.

* Then, we inner product with $$\langle x,\cdot \rangle$$ to get $$\langle x, Dx \rangle = \int x Dx dt = 0$$. This also vanishes, since at all times the the value of Dx is zero. But, strangely, it works out to be $$ = \int -2(T-V) dt = -2\int \mathcal{L} dt = -2S = 0$$, and it's not true that the *action* equals 0 at all times, right?

* Maybe we suppose the conditions $$Dx = 0$$ and $$x\dot{x}\vert_{i}^{f}$$ aren't necessarily satisfied. So this is a functional that takes *any old path* $$x(t)$$ to $$F[x(t)] = \int_{i}^{f} x(t) Dx(t) dt = x(t)\dot{x}(t)\vert^{f}_{i} + (-2)\int_{i}^{f} \mathcal{L} dt = (bounds) + (-2)S$$.

* So this is an functional that applies to *any path* $$x(t)$$. Let's call it $$S'[x(t)]$$, to indicate that it's not exactly the action, though it's closely related to it.

* And we know that *for the path the system actually takes*, for $$t \in (i, f)$$, the equation $$Dx = 0$$ holds at all times, meaning $$S'[x(t)] = (bounds)$$, which is constant.

* So then we solve this equation, $$S'[x(t)] = b + cS[x(t)] = b + c(0) = b$$, with a method for solving any equation that equals a constant: by solving $$\frac{\partial S'}{\partial{x(t)}} = 0$$, except that, *since S' is an equation of a function*, we have to take the functional derivative $$\frac{\delta S'[x(t)]}{\delta x(t)} = \frac{\delta S[x(t)]}{\delta x(t)} = 0$$ (and, for variations of $$x(t)$$ with the endpoints held constant, we *can* assume the boundary term vanishes).

This feels to me like an actually valid motivation for $$\delta S = 0$$. But I also have a feeling it might be wrong somehow, because I've never seen it explicitly before.

Couple notes:

* $$\mathcal{L} = T-V$$ will only make sense in this derivation if you can actually describe the system with a conservative potential. For interactions like friction where you totally ignore the energy exchange, it's pretty much irrelevant. The general idea of a Lagrangian can still be used, but the exact equation $$T-V$$ is no longer relevant.

* The $$(-2)$$ factor doesn't really matter; as we have already seen, $$\mathcal{L}$$ can be multiplied by scalars (and changed in other ways) without changing the equations of motion. Because, ultimately, $$S$$ is kind of meaningless, I guess?

I think the right interpretation of this, at least for now, is as a *clever differential equation-solving technique*. Here's the same technique if you were just working with matrices: in order to solve $$A\mathbf{x} = 0$$, you:

* instead solve $$\Rightarrow \mathbf{x} \cdot A\mathbf{x} = 0$$
* find a way to factor $$A = B^{*}B$$ (always possible if A is positive-semidefinite)
* rewrite $$\mathbf{x} \cdot A \mathbf{x} = (B^{*}\mathbf{x}) \cdot (B \mathbf{x}) = \vert B\mathbf{x}\vert^{2} = 0$$
* now solve $$S(\mathbf{x}) = \vert B\mathbf{x}\vert^{2} = 0$$ by solving $$\frac{dS(\mathbf{x})}{d\mathbf{x}} = \nabla S(\mathbf{x}) = 0$$ and trying to solve *that* differential equation.
* but $$\partial_{\mathbf{x}} \vert B \mathbf{x} \vert^{2} = 2 B\mathbf{x} B$$ = $$2A\mathbf{x}$$, so that's not too interesting; we're just back where we started.
* but with functionals, this step eliminates the bounds from the integral and gives us a differential equation only in the scalars of the system. So I guess that's the reason it works?

....

* this still feels mysterious, but less so.

nb: Lagrangians work for plenty of things that are more complex than just (N2) applications. But I think this is where the idea comes from. I like this a lot better than taking $$\delta S = 0$$ as a *postulate* -- even if that works. I'd rather see it as a 'clever solution technique that generalizes well' than a 'postulate about reality'. (I'll dig more into whether it's really fundamental from QM another time, I guess...).

This derivation also explains why the requirement is that the action be stationary, not minimized: basically because its actual value is pretty meaningless; the fact that $$ S = (constant)$$ (well, a function of the bounds only, not the rest of the path, so constant ever) and therefore $$\delta S = 0$$ is a product of the fact that the differential equation of the system is 0 at all times on physically valid paths.


### 2.2 Functional Derivatives

Completely without mention of Lagrangians, let's just talk about defining a derivative [operator](https://en.wikipedia.org/wiki/Functional_derivative) on functionals.

We want an analogy:

$$\frac{\delta F[x(t)]}{\delta x(t)} \Leftrightarrow \frac{\partial f(x)}{\partial x}$$

and a differential analogous to $$df = f(x + \epsilon) - f(x)$$:

$$\delta F[x(t)] = F[x(t) + \delta x(t)] - F[x(t)] $$

and a directional derivative analogous to $$\nabla_{\mathbf{v}} f = df \cdot \mathbf{v} = \sum v^{i} \partial_{i}f$$:

$$\nabla_{\phi(t)}F[x(t)] = \frac{\delta F[x(t)]}{\delta x(t)} \cdot \phi(t) = \partial_{\epsilon} F[x(t) + \epsilon \phi(t)] \vert_{\epsilon = 0} = \frac{F[x(t) + \epsilon \phi(t)] - F[x(t)]}{\epsilon}$$

... and in fact I'm pretty sure everything 'just works' if we just use the inner product $$\langle f, g\rangle = \int fg dt$$ instead of the vector dot product.

We define $$\frac{\delta F[x]}{\delta x}$$ in terms of (omitting a lot of $$(t)$$s for clarity):

$$\langle \frac{\delta F[x]}{\delta x}, \phi \rangle = \frac{F[x + \epsilon \phi]}{d\epsilon} = \frac{d}{d\epsilon} \int \delta F(x + \epsilon \phi) dt$$

And if that sounds arcane, it really isn't. Check it out on $$F(x) = x^{2}$$ and $$G(x) = \dot{x}$$:

$$\frac{d}{d\epsilon} \int \delta F(x + \epsilon \phi) dt = \frac{d}{d\epsilon} \int (x + \epsilon \phi)^{2} dt =  \int 2x \phi dt \Rightarrow \frac{\delta F(x)}{\delta x} = 2x$$

$$\frac{d}{d\epsilon} \int \delta G(x + \epsilon \phi) dt = \frac{d}{d\epsilon} \int (\dot{x} + \epsilon \dot{phi}) dt =  \int \dot{\phi} dt \Rightarrow \frac{\delta G(x)}{\delta x} = \partial_{t}$$

Those make tons of sense: $$\delta(x^{2}) = 2x \delta{x}$$; $$\delta(\dot{x}) = \partial_{t} \delta{x}$$. They make *so* much sense that we should just write them without fancy $$\delta$$s: $$d(x(t)^{2}) = 2x(t)dx(t)$$ and $$d(\dot{x}) = \partial_{t} dx(t)$$, if that's not confusing.

The somewhat simpler way to write these is:

$$\delta G = G[x+\delta x] - G[x] = \partial_{t} (x + \delta x) - \partial_{t} x = \partial_{t} (\delta x)$$

But this term isn't quite valid: we only defined $$\frac{\partial_{t}(\delta x)}{\delta x}$$ in terms of its inner product with a test function $$\phi$$:

$$\langle \frac{\partial_{t}(\delta x)}{\delta x},\phi \rangle = \int \partial_{t} (\delta x) \phi dt = \int \delta x (- \partial_{t} \phi) dt \Rightarrow \frac{\partial_{t}(\delta x)}{\delta x} := -\partial_{t} = \partial_{t}^{*}$$

(As long as $$\delta{x}$$ vanishes on the integration boundaries!)

(I wonder if it's interesting that the derivative of $$\partial_{t} x$$ is $$-\partial_{t}$$?)

Note: if we *additionally* define that our functions are functions of only $$t$$ and not also some intermediate functions $$y(t)$$ or something, then it's okay to turn that into a total derivative $$\frac{d}{dt}$$. (Well... I think. I hope I've got that right!)

---------------

And now we just follow the same procedure for the somewhat more interesting functional $$S[x] = \int \mathcal{L}(t, x, \dot{x}) dt$$:

$$\delta S = S[x + \delta x] - S[x] = \int \mathcal{L}(t, x + \delta x, \dot{x} + \delta \dot{x}) - \mathcal{L}(t, x, \dot{x}) dt$$

$$\Rightarrow \delta S = \int (\mathcal{L} + \delta x (\partial_{x} \mathcal{L}) + \delta \dot{x} (\partial_{\dot{x}} \mathcal{L})) - (\mathcal{L})dt = \int \delta x (\partial_{x} \mathcal{L}) + \delta \dot{x} (\partial_{\dot{x}} \mathcal{L}) dt$$

The (total) time derivative $$\int \partial_{t}(\delta x) \mathcal{L}_{\dot{x}} dt$$ integrates by parts as earlier into $$\int \frac{d}{dt} (\delta x \mathcal{L}_{\dot{x}}) - \delta x\frac{d}{dt}(\mathcal{L}_{\dot{x}}) dt$$, and, for suitable $$\delta x$$, the first term vanishes on the boundary of the integral, giving: 


$$\delta S = \int \delta x \cdot (\mathcal{L}_{x} - \frac{d}{dt}\mathcal{L}_{\dot{x}}) dt$$

Which, in order to hold for all $$\delta(x)$$ (or when composed with $$(\delta x)^{-1}$$?), gives, of course, the Euler-Lagrange equation(s):

$$\mathcal{L}_{x} - \frac{d}{dt}\mathcal{L}_{\dot{x}} = 0$$.

The grand point is this:

**Grand Point**:

Functional derivatives (ie variations) are a mundane calculus procedure, which, when they *happen to be applied to the action functional*, specifically *as a tool for solving differential equations*, give the Euler-Lagrange equations in mechanics. But both the idea of 'solving a differential equation with a variation' and 'deriving the E-L relation from the variation' are independently 'mundane' concepts, and the only interesting physical content is (I think ... at this point...) the fact that the equilibrium solution of a mechanical problem is described by the differential equation / Lagrangian *in the first place*.

------------------

By the way, this is basically, at a marginally higher abstraction, the approach Feynman describes [here](http://yima.csl.illinois.edu/psfile/ECE553/FeynmanLecturesOnPhysicsChapter2-19.pdf). He also mentions that stationary points of functionals can be used to solve other equations. It's worth showing an example to prove that this method is general:

To solve for the potential from a charge distribution $$\rho$$:

$$\nabla^{2} \phi = -\frac{\rho}{\epsilon_{0}}$$

For $$\phi$$, you can find a stationary point of the integral

$$U(\phi) = \frac{1}{2}\int (\epsilon_{0}\nabla \phi)^{2} - \rho \phi dV$$

We can vary $$\phi$$ by infinitesimal $$f$$ to calculate:

$$U(\phi + f) = \int \epsilon_{0}\nabla \phi\nabla f - \rho f dV$$

$$ = \int \epsilon_{0}\nabla (\phi \nabla f) - \epsilon_{0}f \nabla^{2}\phi - \rho f dV$$

(The first term is a total derivative, so can be pulled out, and if we integrate over all space it vanishes.)

$$0 = \int - \epsilon_{0} f \nabla^{2}\phi - \rho f dV = -\int (\epsilon_{0} \nabla^{2} \phi - \rho)f dV$$

Which just enforces the original differential equation again. I guess there are points in there where this might be more useful than the differential version, depending on what information you're working with!


-------------------

### 2.3 Lagrangians

1. virtual work + 'inertia force' equilibrium + D'Alambert principle
2. imaginary time / stati equilibrium
3. non T-V forms?
4. canonical momenta / etc
5. relativistic? fields?
6. integrate over something other than T?
7. action in QM

## 3. Hamiltonians & Phase Space & Symplectic Forms & Poisson Brackets

1. Phase space
2. Symplectic space + symplectic form
3. Lie brackets; 'flows'; Poisson brackets; 
4. Symplectic integrators 
5. QM musings