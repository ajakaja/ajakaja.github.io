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

## 1. Newton's Laws (rehash)

L1. Objects move at constant velocity unless acted upon by a force (in an inertial reference frame)
L2. $$\mathbf{F} = m\mathbf{a}$$. That is, $$-\nabla U(\mathbf{x}) = \dot{\mathbf{p}} = \frac{dE}{dv}$$.
L3. Actions have equal/opposite reactions: $$F_{ab} = -F_{ba}$$.

**Q**: How do we initially introduce energy? Even before we talk about potential energies we might realize that $$T = \sum \frac{1}{2}m\mathbf{v}^{2}$$ is preserved by, like, elastic collisions: $$d_{t} T = 0$$. Why would this be... true? And why would it be natural to take this form?[^justify] And it's not fair to run ahead and invoke Noether's theorem and say 'time invariance implies energy conservation'.

[^justify]: aside: If you google, like, "how would you derive conservation of energy", people like to remind other people that we don't **derive** things in physics; we believe them if they correspond to the behavior of nature. Well, that's not interesting and tends to miss the point that much of physics is derived from simple physical insights instead of *entirely* being pattern-matching to how reality imperically behaves. Well, that's annoying. I feel we need a better word for 'derive' when talking about motivation of aspects of theories, so that people stop saying that. Something like **reduce**?...

We can find energy conservation inside Newton:

$$\frac{d}{dt}U(\mathbf{x}(t)) = \frac{d\mathbf{x}}{dt} \nabla U(\mathbf{x}(t)) = \mathbf{v}\cdot \nabla U$$

So dotting with $$\mathbf{v}$$ makes $$\mathbf{v} \cdot F = d_{t}U$$. On the other side, the same operation gives:

$$\mathbf{v} \cdot m\ddot{\mathbf{x}} = m\dot{\mathbf{x}} \cdot \ddot{\mathbf{x}} =  \frac{1}{2} m\frac{d}{dt} (\mathbf{v \cdot v}) = d_{t}T$$

Therefore:

$$\mathbf{v} \cdot [\mathbf{F} = m\mathbf{a}] \Rightarrow -d_{t} U = d_{t} T$$

The momentum 'vector' is conserved in each direction, including time. Actually, the better 'law' is $$U + T = 0$$, and then taking time derivatives gives $$U_{t} + E_{t} = 0 \Rightarrow \mathbf{F} = m\mathbf{a}$$. I guess that's not that enlightening, though.

**Conclusion**: Newton's laws directly state conservation of momentum, and conservation of energy is a short algebraic manipulation away.

Moving on...

## 2. Lagrangians & Functional Calculus

*(The thing I was **really** looking to understand.)*

### 2.1 T-V?

Jumping into this ahead of everything else to get it out of the way:

The Lagrangian in classical mechanics is usually

$$\mathcal{L(t, x, \dot{x})} = T - V$$

When is that valid? Well, never, exactly, because you can always add a total time derivative $$f(t)$$ to $$\mathcal{L}$$, or scale $$\mathcal{L} \rightarrow c\mathcal{L}$$, without changing the solutions of the E-L equations, $$\mathcal{L}_{x} - d_{t} \mathcal{L}_{\dot{x}} = 0$$. And it has to be true that $$\mathcal{L(t, x, \dot{x})} = T(\dot{x}) - V(x)$$, so if *V* depends on something other than *x*, it isn't a 'potential energy' anymore (it's not from a conservative force) and the form is likely not correct.

And it's not true in special relativity and above. For example, the Lagrangian for a free relativistic particle is  $$\mathcal{L} = -\frac{mc^2}{\gamma} = -mc^{2}\sqrt{1 - \beta^{2}} \approx mc^{2}(-1 + \frac{1}{2}\beta^{2}) = -mc^{2} + \frac{1}{2}mv^{2}$$.

The reason the classical mechanics form $$\mathcal{L} = T - V$$ is unsettling is that it doesn't seem to correspond to anything that's, like, 'physical' about a system. Even if this does not turn out to be the 'true' general form, any form that reduces to $$T-V$$ has the same unsettling quality: it seems meaningless. So I want to figure out where it comes from and what it means.

---------------

I went and scoured a bunch of sources to try to figure out the 'true' reason for this form, and this is the best I've got:

**Explanation**: ([source](https://physics.stackexchange.com/questions/86008/motivation-for-form-of-lagrangian/357476#357476)) The minus sign appears because the **adjoint** of the derivative operator $$\partial_{t}$$, on suitable spaces, is $$\partial_{t}^{*} = -\partial_{t}$$.

The adjoint, as a reminder, is the generalization of the matrix transpose. In this case we're talking about the infinite-dimensional vector space of functions with inner product $$\langle f,g \rangle = \int_{i}^{f} fg dt$$.

The fact that $$\partial_{t}^{*} = -\partial_{t}$$ is conceptually how integration by parts works: because $$\int f \partial_{t}g dt = \langle f , \partial_{t} g \rangle = \langle \partial_{t}^{*} f \vert g \rangle = -\langle \partial_{t}f , g \rangle = (bounds) -\int (\partial_{t}f) g dt $$. This also seems to mean that it's intrinisically connected to the concept of a derivation, since it basically follows from $$D(fg) = (Df)g + f(Dg)$$. Also, in QM, adjoint operations also include Hermitian conjugates of matrices $$A^{\dagger}$$, which also take $$i \rightarrow -i$$. This is mysterious, but no more than the whole Hilbert space structure is to begin with.

At some level this is the *true* reason for $$\mathcal{L} = T-V$$, and we just need to find the derivation. We can make a lot more sense of Lagrangian mechanics in the process, also.

----------

The example from the source is of a simple harmonic oscillator ($$V = \frac{1}{2}\omega^{2} x^{2}$$). Start from the differential equation:

$$(m\partial_{t}^{2} + \omega^{2})x = 0$$

but then split the $$\partial_{t}$$ like this:

$$(-m\partial_{t}^{*}\partial_{t} + \omega^{2})x = 0$$

And inner-product by $$x$$ on the left:

$$\langle x,  (-m\partial_{t}^{*}\partial_{t} + \omega^{2})x \rangle = - m\langle \partial_{t} x , \partial_{t} x \rangle + \langle \omega x , \omega x \rangle$$

Note that this isn't equal to 0 anymore, because a boundary term appears when we take $$x \partial_{t}^{*} = \partial_{t} x$$. Writing things out explicitly, we have:

$$\langle x, (-m\partial_{t}^{2} + \omega^{2})x \rangle = \int_{i}^{f} x\partial_{t}^{2}x - \omega^{2} x^{2} dt = m(x \dot{x})\vert_{i}^{f} + \int - m \dot{x}^{2} + \omega^{2}x^{2} dt$$

$$= m(x \dot{x})\vert_{i}^{f} - 2\int_{i}^{f} (T - V) dt = 0 $$

$$\frac{1}{2}m(x \dot{x})\vert_{i}^{f} = \int \mathcal{L} dt$$

Why $$=0$$? We started out saying that $$(m\ddot{x} - F) = (m\partial_{t}^{2} + \omega^{2})x = 0$$ on the path of the system. So $$\langle x, m\ddot{x} - F \rangle = \langle x, 0 \rangle = 0$$. 

Note that the resulting term has two parts: a term dependent on **boundary conditions only**, $$\frac{1}{2}m(x \dot{x})\vert_{i}^{f}$$, and a term that's an **integral of a scalar quantity over time**, $$\int_{i}^{f} T-V dt$$.

(Aside: If we use $$\dot{\mathbf{x}}\cdot$$ instead, we just get $$d_{t} (T + U) = 0$$, as derived above. I wonder if others are valid? I wonder if other conservation laws are derived by inner-producting with other things? Newton's 2nd law is just momentum conservation, anyway. And $$\mathbf{r} \wedge (F-m\ddot{\mathbf{x}}) = \tau - m\ddot{\theta} = 0$$ gives angular momentum conservation. I wonder if any differential equation has conserved quantities that can be found with a process like this? It's a lot easier than using Noether's Theorem...)

------------

And how do you get closer to solving $$S[x(t)] = \frac{-1}{2}m(x \dot{x})\vert_{i}^{f}$$ for $$x(t)$$? You naively proceed like you would in single variable calculus to solve $$f(x) = c(y)$$: by calculating $$f'(x) = 0$$ to eliminate $$c$$.

Or in this case, $$\frac{\delta S_{1}}{\delta x(t)} = 0$$, a functional derivative where we perturb the path without changing the value of $$(x \dot{x})\vert_{i}^{f}$$, by varying $$x(t) \rightarrow x(t) + \phi(t)$$, with $$\phi(i) = \phi(f) = 0$$ and $$\dot{\phi}(i) = \dot{\phi}(f) = 0$$. By doing this we're no longer getting a path where $$S[x(t)] = 0$$, but rather one where $$\frac{\delta S}{\delta x} = 0$$, so we're instead only *extremizing* the action instead of setting it to 0.

Note: somehow our choices of $$i$$ and $$f$$ don't matter very much. These derivations hold for any two times, so you set $$i$$ as your initial condition, or whatever, and then this tells you the equations of motion that lead forward to $$f$$. Since it applies over any $$(i,f)$$, even vanishingly small ranges, the identity $$\frac{\delta S[x(t)]}{\delta x} = 0$$ ends up holding at all time.

--------

Why would you want to do any of this? What the hell is the action?

I think the answer is: the result is a differential equation of scalar functions instead of vectors, and scalars are way easier to solve for (and compose over multiple component systems much, much, _much_ more cleanly).

**Conclusion**: The Lagrangian formulation of classical mechanics is best thought of as: a *clever differential equation-solving technique*. Given Newton's laws, it's a set of obscure but ultimately mundane algebraic manipulations to get a **differential equation in conserved scalar quantities of the path**.

Well, this still feels mysterious, but less so.

Lagrangians work for plenty of things that are more complex than just (N2) applications. But I think this is where the idea comes from. I like this a lot better than taking $$\delta S = 0$$ as a *postulate* -- even if that works. Instead, we just have an elaborate restatement of "energy is conserved".

Anyway, I'd rather see this whole messy framework as a 'clever solution technique that generalizes well' than a 'postulate about reality'. Of course it may end up being more fundamental in QM -- but there's no point in confusing things now when the derivation can be made unmysterious, in terms of what we already know.


### 2.2 Functional Derivatives

Let's go over how to define the derivative [operator](https://en.wikipedia.org/wiki/Functional_derivative) on functionals.

We want an analogy:

$$\frac{\delta F[x]}{\delta x} \Leftrightarrow \frac{d f(\mathbf{x})}{d \mathbf{x}}$$

It probably looks similar: 

$$\frac{\delta F[x]}{\delta x} = \lim_{\epsilon \rightarrow 0} \frac{F[x + \epsilon\delta x] - F[x]}{\epsilon} $$ 

$$\Leftrightarrow \frac{d f(\mathbf{x})}{d\mathbf{v}} = \lim_{\epsilon \rightarrow 0} \frac{f(\mathbf{x} + \epsilon \mathbf{v}) - f(\mathbf{x})}{\epsilon}$$

With:

$$f(\mathbf{x} + \epsilon \mathbf{v}) \approx f(\mathbf{x}) + \epsilon \frac{df(\mathbf{x})}{d\mathbf{x}} \cdot \mathbf{v} + o(\epsilon^{2})$$

$$\Leftrightarrow F(x + \epsilon \phi) \approx F(x) +  \epsilon\langle \frac{\delta F[x]}{\delta x}, \phi \rangle + o(\epsilon^{2})$$

Except that we use 

$$\langle \frac{\delta F[x]}{\delta x}, \phi \rangle = \int \frac{\delta F[x]}{\delta x} \phi dx$$

So the directional derivative

$$\nabla_{\mathbf{v}} f(\mathbf{x}) = f(\mathbf{x} + \epsilon \mathbf{v}) - f(\mathbf{x}) = \frac{df(\mathbf{x})}{d\mathbf{x}} \cdot \mathbf{v}$$

Becomes:

$$\nabla_{\phi} F[x] = (\frac{1}{\epsilon} (F[x + \epsilon \phi] - F[x]) = \langle \frac{\delta F[x]}{\delta x}, \phi \rangle$$

---------

The procedure to compute them on Wikipedia (well, by definition) is:

* To calculate $$\frac{\delta F[x]}{\delta x} = \delta_{x} F[x]$$ (simpler notation!), compute:

$$\frac{d}{d \epsilon} F[x + \epsilon \phi]_{\epsilon = 0}$$

* and then match it to $$\int \delta_{x} F[x] \phi(t) dt$$.

**Example 0?** For example, if $$F[x] = \int \dot{x}(t) dt$$, then 

$$\partial_{\epsilon} F[x + \epsilon \phi]_{\epsilon = 0} = \frac{1}{\epsilon}\int \dot{x}(t) + \epsilon \dot{\phi}(t) - \dot{x}(t) dt = \int \dot{\phi}(t)dt $$

So $$\int \delta_{x} F[x] \phi(t) dt = \int \dot{\phi}(t)dt $$, so $$\delta_{x} F[x] = \frac{d}{dt}$$. Right? Well, I'm not sure if they're supposed to be operators. Seems intuitive to me, but, these things are usually done with more complicated functions...

**Example 1.** If $$F[x] = \int f(x(t)) dt$$, then 

$$\partial_{\epsilon} F[x + \epsilon \phi]_{\epsilon = 0} = \frac{1}{\epsilon} \int f(x + \epsilon \phi) - f(x) dt) = \int \partial_{x} f(x(t)) \phi(t) dt$$

So: $$\delta_{x} F[x(t)] = \partial_{x} f(x(t))$$.

We can also write $$\delta F[x] = F[x + \delta x] - F[x]$$, where $$\delta x$$ is understood to be an 'infinitesimal' function variation.

**Example 2: Euler-Lagrange**

And now we just follow the same procedure for the somewhat more interesting functional $$S[x] = \int \mathcal{L}(t, x, \dot{x}) dt$$:

$$\delta S = S[x + \delta x] - S[x] = \int \mathcal{L}(t, x + \delta x, \dot{x} + \delta \dot{x}) - \mathcal{L}(t, x, \dot{x}) dt$$

$$\Rightarrow \delta S = \int (\mathcal{L} + \delta x (\partial_{x} \mathcal{L}) + \delta \dot{x} (\partial_{\dot{x}} \mathcal{L})) - (\mathcal{L})dt = \int \delta x (\partial_{x} \mathcal{L}) + \delta \dot{x} (\partial_{\dot{x}} \mathcal{L}) dt$$

The (total) time derivative $$\int \partial_{t}(\delta x) \mathcal{L}_{\dot{x}} dt$$ integrates by parts into $$\int \frac{d}{dt} (\delta x \mathcal{L}_{\dot{x}}) - \delta x\frac{d}{dt}(\mathcal{L}_{\dot{x}}) dt$$, and, for suitable $$\delta x$$ (if $$\delta x$$ is zero and $$\delta \dot{x}$$ is zero at the endpoints), the first term vanishes on the boundary of the integral, giving: 


$$\delta S = \int \delta x \cdot (\mathcal{L}_{x} - \frac{d}{dt}\mathcal{L}_{\dot{x}}) dt$$

Which, in order to hold for all $$\delta(x)$$, gives, of course, the Euler-Lagrange equation(s):

$$\mathcal{L}_{x} - \frac{d}{dt}\mathcal{L}_{\dot{x}} = 0$$.

So, to return to mechanics, we found that

$$S_{1}[x] = \frac{1}{2}m(x \dot{x})\vert_{i}^{f} - \int \mathcal{L(t, x, \dot{x})} dt  = 0$$

in the previous section. And now we proceed to eliminate the boundary term via 'a (simple) calculus procedure', solving $$\delta_{x}S[x] = 0$$, to find 

$$\mathcal{L}_{x} - \frac{d}{dt}\mathcal{L}_{\dot{x}} = 0$$

Which is the Euler-Lagrange equations.

And the grand point is:

**The Grand Point** _This is not that amazing_. The **principle of stationary action**, which takes a postulate / assumption that $$\delta S = 0$$ for the 'phyical path', is the application of a mechanical procedure to solving a differential equation. It just turns out a good technique for solving the kinds of differential equations we get in physics, primarily because it ends up giving the solutions via scalar differnetial equations over the whole system instead of vector differential equations over each component separately.


By the way, this is basically, at a marginally higher abstraction, the approach Feynman describes [here](http://yima.csl.illinois.edu/psfile/ECE553/FeynmanLecturesOnPhysicsChapter2-19.pdf). He also mentions that stationary points of functionals can be used to solve other equations.

### 2.3 Functional Derivatives 2

There is something about this treatment of functional derivatives that really irritates me.

**Complaint 1:**: Why is $$\delta_{x}(\int \dot{x} dt) = \partial_{t}$$, rather than $$\delta_{x}(\dot{x}) = \partial_{t}$$?

All of the example of functional derivatives are inside integrals. Well, there's one that's a summation from Wikipedia, for entropy of a probability distribution:

$$H[p(x)] = - \sum p(x) \log p(x)$$

$$\delta_{p} H[p(x)] = -\sum 1 + \log p(x)$$

(Using the same procedure except that $$\sum$$ is used instead of $$\int$$ everywhere.)

**Complaint 2:** But if you just *directly* differentiate $$\partial_{p} H(p) = \partial_{p} (- \sum p(x) \log p(x)) = - \sum 1 + \log p(x)$$ you get the same result! So why a) does it give the result you'd expect here and b) why bother with the functional definition in the first place, here?

---

I can tell that there are two kinds of functionals on a space $$M$$ of functions. Consider the difference in type between $$F[x] = \int \dot{x} dt$$ and $$G[x] = \dot{x}$$:

$$F: M \rightarrow \mathbb{R}$$

$$G: M \rightarrow M$$

In general on *any* smooth manifold, smooth maps $$Q: M \rightarrow N$$ have, at a point *p*, a differential map: $$dQ: T_{p}M \rightarrow T_{Q(p)}N$$, which encodes the first-order change in $$Q$$. 

The differential map at *p* gives an element of $$T^{*}_{p}M$$, the dual space of $$T_{p}M$$ vectors at $$p$$. For a given displacement $$\mathbf{v} \in T_{p}M$$, we have $$\langle dF, \mathbf{v} \rangle$$

So for a functional $$F: M\rightarrow \mathbb[R]$$, we should be getting something like $$dF : TM \rightarrow T\mathbb{R}$$, which, in coordinates, should look like $$dF = (something)ds$$. What's the relationship between $$\delta F and dF$$? Not sure; let's try working through it.

If

$$F[x] = \int f(x(t)) dt$$

Then

$$dF[x] = d\int f(x(t)) dt = F[x + \delta x] - F[x] = \int f(x(t) + \delta(t)) - f(x(t)) dt$$

$$= \int \partial_{x} f(x(t)) \delta x(t) dt$$

Which is, indeed, still a functional on $$x(t)$$. How do we extract a $$ds$$ term? We would have to _integrate_ $$\delta x(t)$$. But I don't think we can without knowing more about $$f(x)$$.

$$= \int \partial_{x} f(x(t)) \delta x(t) dt \stackrel{?}{=} (something) ds \in T_{F(p)}\mathbb{R}$$

**So**, because we *can't* compute $$\frac{dF}{ds}$$, we have to look for what we *can* compute -- staying inside the integral. And that's where we conceive of something else: the functional / variational derivative.

Because for any (suitable) function $$Q[x] = \int q(x(t)) dt$$, we *do* have the fact that the differential $$dQ[x]$$ has the form:

$$dQ[x] = \int \frac{\delta Q[x]}{\delta x}(t) \delta x(t) dt$$

So a functional derivative is "a way to take derivatives of functionals that actually leads to something"?

### Functional Derivatives 3

There *is* a way to take a real derivative of $$G[x] : M \rightarrow M$$, such as $$G[x] = \dot{x}$$. Of course there is -- it's a mapping between manifolds and there ought to be a generated differential map on whatever coordinates we have.

Clearly it should be true that

$$G[x + \epsilon \phi] \approx G[x] + \epsilon dG \cdot \phi + o(\epsilon^{2})$$

But in this case, $$dG \cdot \phi$$ gives *another function*, not a scalar -- so it's not $$\int_{i}^{f} \frac{\delta G}{\delta x}(t) \phi(t) dt$$.

Since we know that $$G[x + \epsilon \phi] = G[x] = \epsilon \dot{\phi} = dG \cdot \phi$$, we need to find a way to make $$dG \cdot \phi = \dot{\phi}$$. How? The **Dirac Delta Function** -- except now we're, oh god, overloading the symbol $$\delta$$. I'm so sorry.

**Notation**: to avoid ambiguity I'll be referring to the Dirac Delta function (distribution) as $$J$$, so $$\int J(t) f(t) dt = f(0)$$.

Here's the useful identity for **Computing a derivative via an integral**:

$$\int -\dot{J}(t-t_{0}) f(t) dt = \int J(t - t_{0}) \dot{f}(t) dt = f(t_{0})$$

And so we see that something like $$dG = -\dot{J}$$ should hold, so we can keep using our integral inner product:

$$dG \cdot \phi = -\dot{J} \cdot \phi = \int -\dot{J}(t' - t) \phi(t') dt' = \dot{\phi}(t)$$

(Glossing over some details about what space $$J$$ and $$\phi$$ live in..). We have:

$$G[x + \epsilon \phi] = \partial_{t}(x + \epsilon \phi) = \partial_{t}x + \epsilon \partial_{t} \phi \stackrel{?}{=} \partial_{t}x + \epsilon (-\dot{J}) \cdot \phi$$

Clearly there's something still confusing here. I think it basically amounts to: if you're requiring you do everything 'under an integral sign', you perform $$x \mapsto \dot{x}$$ via $$x \mapsto (-\dot{J}\cdot x)$$. If you're not, you perform it via left-multiplication by $$\partial_{t}$$. In some sense these are different representations of the same operation.

Anyway, this does resolve why $$\delta_{x} \int \dot{x} dt = \partial_{t}$$, because $$\delta_{x} \dot{x} = -\dot{J}$$ instead.

----------

### Functional Derivatives 4

This does get you wondering if there's a clean calculus on non-commutative variables $$(D = \frac{d}{dt},t)$$ with $$[D,t] = Dt - tD = 1$$, such that 

$$\partial_{t}t = 1$$

$$\partial_{t} (Dt) = D$$

$$\partial_{D} (Dt) = t$$

It sounds kinda nice. We can do:

$$\partial_{D} (Dt) = D \partial_{D} t + (\partial_{D} D) t = D (0) + t = t \checkmark$$

And see that for $$x(t)$$, if $$D = \frac{d}{dt}$$,

$$[D, x(t)]f = D(xf) - x(Df) = f(Dx) + x(Df) - x(Df) = f(Dx) = \dot{x}f$$

$$\rightarrow [D, x(t)] = Dx(t) = \dot{x}$$

What about the Euler-Lagrange equations? Sure, no problem:

$$S[x] = \int \mathcal{L}(t, x, D x) dt$$

$$dS[x] = \frac{\partial S}{\partial x}dx = d \int \mathcal{L}(t, x, D x) dt$$

If (not sure) we can commute $$d$$ into the integral...

$$\rightarrow \int d \mathcal{L}(t, x, D x) dt$$ 

$$= \int (\partial_{x} \mathcal{L}) dx + (\partial_{D x} \mathcal{L}) d (D x) dt$$

Does $$d (Dx) = dx D$$? I think so -- if this treatment as separate variables is valid. This $$d$$ is only a differential in $$x(t)$$, not $$D = \frac{d}{dt}$$, since we are treating them as unrelated variables other than their non-commutativity.

$$d S = [\int (\partial_{x} \mathcal{L}  + (\partial_{D x} \mathcal{L}) \overrightarrow{D}) dt ]dx$$

And **if** we have a suitable integral / this whole thing is operating on a suitable target function $$\phi$$ whose bounds we know vanished, we could integrate by parts (= take the adjoint):

$$\int (\partial_{D x} \mathcal{L}) D \phi(t) dt$$

into

$$\int -D(\partial_{D x} \mathcal{L}) \phi(t) dt$$

Which is how we get to the E-L form:

$$dS = \int \mathcal{L}_{x} - D (\mathcal{L}_{Dx}) dt$$

$$\frac{\delta S}{\delta x} = \mathcal{L}_{x} - D (\mathcal{L}_{Dx}) = \checkmark$$

This is so much easier to use than the test-function version up above. If it's valid. Not sure.

And it also clearly still gives $$\frac{d}{dx}(\dot{x}) = \partial_{t}$$. Of course it's not *quite* the usual space we work in in calculus -- but it's not far off either, and feels extremely suggestive and comprehensible compared to, say, the usually arcane commutators $$[x,p] = i\hbar$$ of quantum mechanics...

-------------------

## 3. More Physics with Lagrangians

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