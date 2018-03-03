---
layout: blog
title: "Lagrangian Mechanics in a Nutshell"
math: true
aside: true
footnotes: true
---

*(Interesting if you majored in physics or math, maybe?)*
*(Disclaimer: these are just my notes. Don't trust me, I'm not a physicist.)*

Lagrangian Mechanics is presented, in my experience, somewhat... magically. "Look, if you write down $$\cal{L} = T - V$$ and insist that Action is stationary it works! 

Despite a lot of searching I've failed to appreciate why the whole theory is so... *complex*. I have a lot of difficulty accepting the "Principle of Stationary Action" as a fundamental physical law (of classical mechanics), and it bothers me that this *doesn't* bother everyone else.

I do know that there is a much simpler derivation, at least for systems where energy is conserved, which makes stationary action seem like a 'trick for solving differential equations'. 

Goal: to work my way to understanding why $$\cal{L} = T - V$$.

<!--more-->

## 1. A Newtonian Derivation

Suppose we are trying to solve for the equations of motion $$\b{x}(t)$$ of a simple harmonic oscillator, which is described by differential equation:

$$m\ddot{\b{x}} + k \b{x} = 0$$

Written as a differential operator:

$$D \b{x}(t) = (m \p_{t}^{2} + k) \b{x}(t) = 0$$

This is a differential equation which, given initial conditions, has a solution $$\b{x}(t)$$ for all $$t$$. In 3d it's really three coupled differential equations but using vector equations encapsulates some of the symmetries of the problem.

For several reasons, this form of equation gets annoying to solve for multi-bodied systems or systems with constraints. Mostly, it's much easier to solve differential equations in scalars $$f(t, \| \b{x}(t) \|, \| \dot{\b{x}}(t) \|, \ldots)$$ than vectors. And it's turns out to be easier to reason about  the dynamics of a system in terms of coordinates of the system -- $$\b{x}$$ and $$\dot{\b{x}}$$ -- before involving time.

We can use our vector dot product to turn vectors into scalars, giving conservation of energy:

$$\dot{\b{x}}(t) \cdot \big[ m \ddot{\b{x}} + k \b{x} \big] = \p_{t}(\frac{1}{2} m\dot{\b{x}}^{2} + \frac{1}{2} k \b{x}^{2}) =  \p_{t}(T + V) = 0 $$

<aside class="toggleable" placeholder="<b>Derivation</b>:">

Kinetic term: $$\p_{t} T = \p_{t} \frac{1}{2} m \vert \dot{\b{x}} \vert^{2} = m \dot{\b{x}} \cdot \ddot{\b{x}}$$

Potential term: $$\p_{t} U = \p_{t} \frac{1}{2} k \vert \b{x} \vert^{2} = k \b{x} \cdot \dot{\b{x}}$$

This only says that the sum $$T(t) + V(t)$$ is *conserved*, not that it equals 0. It equals whatever it started at in your initial conditions.

</aside>

The Lagrangian-Mechanics formulation goes in a different direction:

1. Both dot- and inner-product the system down to a *single* scalar value (a functional of the path), the **action** $$S[\b{x}(t)]$$, which summarizes the motion.
2. Argue (from the "Principle of Stationary Action", which is treated like an axiom) that the physical motion of the system is a path which has $$\b{x}(t) \Ra \var S_{x(t)}[\b{x}(t)] = 0$$.

This strikes me as a very strange approach. I think the right interpretation is: just as it's easier to solve dynamic equations by collapse coupled *vector* differential equations to a single *scalar* differential equation $$d_{t} E = 0$$, it's easier to collapse further still, removing the time variable, getting $$\var_{\b{x}} S = 0$$.

That is: if you're trying to solve for the path of a system, first write down an equation that's *only* in terms of that path, eliminating any extra variables or redundancies.

-----

Define an inner product $$\< \b{f}, \b{g} \> = \int \b{f} \cdot \b{g} \; dt$$ (integration over any range you like -- these equations are rote manipulations that work anywhere). This both collapses vector functions to scalar functions and scalar functions to actual scalars.

Apply with $$\b{x}(t)$$: 

$$\Ra \< \b{x}(t) , \big[ m \p_{t}^{2} + k \big]  \b{x}(t) \> = 0$$

$$ = m \< \b{x}, \p_{t}^{2} \b{x} \> + k \| \b{x} \|^{2} = 0$$

Integrate the first term by parts, getting a boundary condition term from the integral:

$$ \int \b{x}(t) \cdot \p_{t}^{2} \b{x}(t) dt = m (\b{x} \cdot \dot{\b{x}}) \big|_{\p} - m \int \dot{\b{x}} \cdot \dot{\b{x}} dt$$

$$ = m (\b{x} \cdot \dot{\b{x}}) \big|_{\p} - 2 \int T dt$$

<aside class="toggleable" placeholder="<b>Aside 1</b>: Integration by Parts, abstractly <em>(click to expand)</em>">

We find that $$\< u, \p_{t} v \> = \tt{<bounds>} + \< -\p_{t} u, v\>$$, via integration by parts.

What we've done is manually calculated the more abstract notion of the [adjoint](https://en.wikipedia.org/wiki/Differential_operator#Adjoint_of_an_operator) of the derivative operator, which answers "what happens to this operator when it passes across an inner product?":

$$\p_{t}^{*} = -\p_{t}$$

The analog for regular vectors, whose inner product (at least in classical mechanics) is the dot product $$\b{u} \cdot \b{v}$$, is the matrix transpose $$M^{*} = M^{T}$$:

$$M \b{u} \cdot \b{v} =  \b{u} \cdot M^{T} \b{v}$$

For any space involving complex number it tends to involve the complex conjugate: $$z^{*} = \bar{z}$$. This is because inner products on complex numbers still define the magnitude of a complex number being *real*, which requires the inner product be $$\| z \|^{2} = \bar{z} z$$, so the dual / adjoint element to $$z$$ is $$\bar{z}$$. For complex analysis, this basically says "to make a scalar you have to multiply a function with positive parity times a function with negative parity". We call functions with 'positive' parity 'complex analytic', ie, $$\p_{\bar{z}} f = 0$$.

In quantum mechanics the adjoint is both at once, because we have matrices of complex numbers: $$M^{\dagger} = \bar{M}^{T}$$. Tediously, QM calls it the Hermitian Conjugate. 

Incidentally, if you write complex numbers $$a + bi$$ as matrices $$\begin{pmatrix} a & -b \\ b & a \end{pmatrix}$$, the conjugate just *is* the transpose. So I tend to think we should just write adjoints with overbars $$\bar{p}$$ everywhere, to be more consistent. Ah well.

Note that what adjoint you get depends entirely on which inner product you're using. The same operator on a different definition of inner product can have a different adjoint. We defined our own, and it gave us a concept of adjoint -- *almost*. 

Actually, I think it's not a true adjoint because of the $$\tt{<bounds>}$$ terms.. But that's still where the negative sign comes from, which is the reason $$\cal{L} = T - V$$ at the end instead of $$T + V$$. We just have to figure out how to kill the boundary terms first!

</aside>

Giving:

$$ m \< \b{x}, \p_{t}^{2} \b{x} \> + k \| \b{x} \|^{2} = 0$$

$$ \Ra m (\b{x} \cdot \dot{\b{x}}) \big|_{\p} - 2 \int T dt + 2 \int U dt = 0$$

$$ \Ra \int (T - V) dt = \frac{1}{2} m (\b{x} \cdot \dot{\b{x}}) \big|_{\p} $$

And now, finally, we have an equation that is *strictly* scalar-valued, rather than scalar functions of time.

... Unfortunately, it still looks hard to solve. It depends both on the endpoints and ending velocities of our paths, *and* their values over all time. 

We call the term inside the integral $$\cal{L} = (T - V)$$ the **Lagrangian**, and the total integral $$S = \int (T - V) dt$$, with units of $$\tt{energy}\times\tt{time}$$, the **action**[^Interpretation]. 

[^Interpretation]: Question: should we try to make sense of the action and Lagrangian? Well, yes, we should try; it ends up mattering a lot in QM/QFT.

With full units these are:

$$S_{i,f}(\b{x}, \dot{\b{x}}) = \int_{i}^{f} \cal{L}(t, \b{x}, \dot{\b{x}}) dt =  \frac{1}{2} m (\b{x} \cdot \dot{\b{x}}) \big|_{i}^{f}$$

<aside class="toggleable" placeholder="<b>Aside 2</b>: Comments on this equation">

1. I'm pretty sure the action does have an explicit dependency on the time range $$[i, f]$$, but I've never actually seen that written out.

2. $$(\b{x}(t), \dot{\b{x}}(t))$$ are collectively called **phase space**. For a single particle in 3D they're an element of $$t \ra \bb{R}^{3+3}$$. For $$N$$ particles they are an element of $$t \ra \bb{R}^{6N}$$. It gets big fast, but, hey, that's where we've shoved all of our complexity to get a more macroscopic equation.

3. Note that the Lagrangian is not always of the form $$T - V$$; that's an artifact of the system we started out trying to solve. It's especially not of that form if there are strange constraints on motion that correspond to 'fictitious', non-energy-conserving forces, like the usual first-order approximation of friction, or forcing motion along a particular path. It's also *never* $$T - V$$ in relativity (because $$\b{F} = m\b{a}$$ isn't right in relativity).

4. We can freely multiply this equation by anything right now, or add anything to both sides. This means that, in the next section, when we take $$\nabla S = 0$$, we should keep in mind that $$S$$ is definitely not unique -- we have liberty to rescale it by a constant or by adding any $$f$$ with $$\nabla f = 0$$ without changing the result.

</aside>

## 2. now what?

Having come all this way to consolidate the equations of motion into a single all-encompassing differential equation, we have to do undo some of our work to eliminate the boundary terms. But we keep our functions as integrals of the system over all time, rather than as local continuity equations at any particular time.[^continuity] This is, apparently, the key insight in Lagrangian mechanics, and turns out to make solving things much easier.

[^continuity]: Newton's laws are heuristic statements of energy-continuity equations. N1 says that kinetic energy is conserved in isolated systems.". N2 says that acceleration (time deriv of velocity, ~ spatial deriv of kinetic energy) equals force (spatial deriv of potential energy), so energy is conserved in local interactions between potentials and motion. N3 says that reactions have equal opposite reactions, ie, energy is conserved in local interactions between two potentials.

If we had a function 

$$F(x, y) = A$$

and we wanted to eliminate $$A$$, we might take a (multivariate) derivative, no problem: 

$$\nabla F(x, y) = \nabla A = 0$$

The same thing works here, but the math is more arcane. Instead of a function of a variable $$f(t)$$, we have a functional of a path $$F[x(t)]$$. So we need a **functional derivative** -- a derivative operator that works on functionals. Let's assume we know how to do it, for now.

We have:

$$S[\b{x}] = B$$

And we want to eliminate the dependence on $$B = \frac{1}{2} m (\b{x} \dot{\b{x}})_{i}^{f}$$, so we'll take a 'derivative':

$$\nabla S[\b{x}] = 0$$

The result we'll get is:

$$\nabla S = \nabla \int \cal{L}(t, \b{x}, \dot{\b{x}}) dt = \int \big[ \cal{L}_{\b{x}} - d_{t} \cal{L}_{\dot{\b{x}}} \big] dt = 0$$

Because the integral is $$0$$ with *any* choice of integration bounds, the integrand must be $$0$$ at all time. And so we extract the **Euler-Lagrange equation**:

$$ \Ra \cal{L}_{\b{x}} - d_{t} \cal{L}_{\dot{\b{x}}} = 0$$

Which is a differential equation of a scalar function, whose solutions are paths $$\b{x}(t), \dot{\b{x}}(t)$$ which ... well, physics will often say "extremize the action", and maybe claim that "physical paths are those which have stationary action". But at least if we started from the Newtonian differential equation and got to $$\cal{L} = T - V$$, these should be the paths that conserve energy, ie, obey Newton's laws.

In full units this is:

$$\big[ \nabla_{\b{x}} - \frac{d}{dt} \nabla_{\dot{\b{x}}} \big] \cal{L}(t, \b{x}, \b{\dot{x}}) = 0$$

(Where $$\p_{\dot{\b{x}}}$$ is a partial derivative with respect to $$\dot{\b{x}}$$ *only*. Why? Because we 'forgot' long ago that $$d_{t} \b{x}(t) = \dot{\b{x(t)}}$$; our scalar equation that we transformed to this form was treating $$\b{x}$$ and $$\dot{\b{x}}$$ as their own variables that we wrote the energy in terms of.) 

This is another reason why solving mechanical systems via the Lagrangian is a lot easier: because the geometry has been simplified via abstraction. It's easier to reason about a system that depends on two separate variables than two connected ones. Energy conservation can induce quantities to 'flow between' $$\b{x}$$ and $$\dot{\b{x}}$$, but, it can do the same for the *x*-coordinates or velocities of two different components, also, and this treats those situations symmetrically.

## 3. The Functional Derivative

We need to find a way to justify:

$$\nabla \int \cal{L}(t, \b{x}, \dot{\b{x}}) dt = \int \big[ \cal{L}_{\b{x}} - d_{t} \cal{L}_{\dot{\b{x}}} \big] dt = 0$$

And it would also be nice to eliminate the handwaving step of 'since this is zero at all times, the integrand $$\cal{L}_{\b{x}} - d_{t} \cal{L}_{\dot{\b{x}}}$$ is always zero'.


There are many explanations of functional derivatives ('variational calculus') online. I don't like most of them. They seem, like much of physics, to pull strange ideas out of thin air without must justification. (Well, this might turn out to be necessary to be rigorous, but I'd rather be conceptually useful than... right.)

Here's my version.

Note that $$S = S[\b{x}] = S[\b{x}(t)]$$ is a function $$\b{x}(t) \ra \bb{R}$$. Whatever type its input has, we should be able to take a total differential, like we often do in calculus.

$$dS[\b{x}] = \frac{\p S}{\p \b{x}} d\b{x} = S_{\b{x}} d\b{x}$$

$$S_{\b{x}}$$ is an operator which takes a change in $$\b{x}$$ and maps it to a change in $$S$$. For whatever reason this is usually written differently when dealing with functional derivatives:

$$\Lra \var S = \frac{\var S}{\var \b{x}} \var \b{x}$$

We define this operator much like a regular derivative -- through asking what the result is when the argument is varied, to first order. Keep in mind that the arguments of $$S$$ are functions $$\b{x}(t)$$ while the arguments of $$\cal{L}$$ are just those functions evaluated at a particular time *t*:

$$\d{S}[\b{x}] = S[\b{x} + \var \b{x}] - S[\b{x}]$$


$$ = \int \cal{L}(t, \b{x} + \var \b{x}, \dot{\b{x}} + \var \dot{\b{x}})  - \cal{L}(t, \b{x}, \dot{\b{x}}) dt$$

$$\cal{L}$$ is not a functional; these first-order variations in its values are just partial derivatives:

$$ = \int \cal{L} + (\var \b{x})  \p_{\b{x}} \cal{L}  + (\var \dot{\b{x}}) \p_{\dot{\b{x}}} \cal{L} - \cal{L} \; dt$$

$$ \var S[\b{x}] = \int (\var \b{x})  \p_{\b{x}} \cal{L}  + (\var \dot{\b{x}}) \p_{\dot{\b{x}}} \cal{L} \; dt$$

Finally, to get to each term having the same $$\var \b{x}$$ factor, we integrate-by-parts on the second term:

$$\int (\var \dot{\b{x}}) \p_{\dot{\b{x}}} \cal{L} dt = (\var \b{x} \cal{L})_{i}^{f} -\int (\var \b{x}) \frac{d}{dt} \p_{\dot{\b{x}}} \cal{L} \; dt$$

Taking a variational derivative by $$\b{x}$$ would, generally, give an operator that says how $$S$$ varies with every choice of $$\var \b{x}$$. It now turns out to be necessary to also declare that $$\var \b{x}(i) = \var \b{x}(f) = 0$$, to make the boundary term go away. This means, basically, that we are taking a directional derivative in a certain direction in function space, "the direction of functions with $$\eta(i) = \eta(f) = 0$$". (Arguably this is necessary to say that the functional derivative is defined at all. I'm not sure I believe that.)

$$\Ra \var S[\b{x}] = \int \var \b{x} \big[ \p_{\b{x}} - \frac{d}{dt} \p_{\dot{\b{x}}} \big] \cal{L} \; dt$$

Our choice of $$\var \b{x}(t)$$ to eliminate the boundary term in $$\var S$$ *should* also eliminate the boundary on the other side of $$\var S = \var B$$. But let's make sure:

$$\var B = \var \frac{1}{2}m (\b{x} \dot{\b{x}})_{i}^{f}$$


$$ = \frac{1}{2}m ( \dot{\b{x}} \cdot \var \b{x} + \b{x} \cdot \var \dot{\b{x}} + \var \b{x} \cdot \var \dot{\b{x}})_{i}^{f} = 0 \; \checkmark$$

So, we have confirmed (ignoring many analytical details) that we can take $$ S = B$$ to 

$$\var S[\b{x}] = \int_{i}^{f} \var \b{x} \cdot \big[ \p_{\b{x}} - \frac{d}{dt} \p_{\dot{\b{x}}} \big] \cal{L} \; dt = 0$$

$$ \Ra \big[ \p_{\b{x}} - \frac{d}{dt} \p_{\dot{\b{x}}} \big] \cal{L} = 0$$

<aside class="toggleable" placeholder="<b>Aside 3</b>: Comments on this equation">

1. Keep in mind this isn't a 'full' derivative of $$S[\b{x}]$$; it's a restricted one that's useful for our purposes.
	* For one thing, we've restricted the direction of our 'directional derivative' when we asked that $$\b{x}(i) = \b{x}(f) = 0$$, to eliminate the boundary terms. We could undo that if we wanted to talk about the derivative of $$S$$ in 'full' function space.
	* Also, the full derivative should end up being linear in $$\var \b{x}$$, right? Something akin to $$dF = F'(x) dx$$? Instead we have $$dS = \int dx L'(x) dt$$ -- what gives?
	Well, we really have no way to integrate the $$\var \b{x}$$ outside of the integral, because it's arbitrary, so we leave it inside instead.

2. The way to skirt the issue of defining 'full' derivatives with respect to functions is to use a derivative of a scalar instead, like this:

	$$dS = S[\b{x} +  \eta(t) ds] - S[\b{x}] $$

	$$= \int \cal{L}(t, \b{x} + \eta(t) ds, \dot{\b{x}} + \dot{\eta}(t) ds) - \cal{L}(t, \b{x}, \dot{\b{x}}) \; dt$$

	$$\frac{dS}{ds} = \int \eta(t) \cdot \big[ \p_{\b{x}} - \frac{d}{dt} \p_{\dot{\b{x}}} \big] \cal{L} \; dt$$

	But I think the intuition follows more cleanly from using, perhaps heuristically, an honest-to-goodness derivative in function space, which just happens to be 'implemented' later with scalars if we need that.


</aside>

## 4 Commentary

I really don't like this thing where we say "ah, this equation is true at all $$(i, f)$$, so we can grab the part inside the integral and say that's equal to 0! It's not that it's wrong, but that it seems like we did too much work if we drop our apparatus at the end.

In fact, how is this different from changing from an integral conservation law to a differential equation one? If:

$$\int F(t) dt = 0 \Lra F(t) = 0$$

Isn't this just the same as saying $$\frac{d}{dt} F(t) = 0$$? Well, the problem is the whole business with "the boundary term drops because the endpoints are held fixed". But it still feels cludgy.

I don't like the Principle of Least Action. It seems to be mysteriously elevated to physical law, but not discussed / motivated nearly as much. It seems like... too much. Like there should be a more direct route.

Here's my attempt at doing it without all the extra machinery. This is how it's done in symplectic geometry, without any of the formal theory:

**A tiny derivation of the Euler-Lagrange equation**

Newtonian classical mechanics amounts to the statement that $$\frac{d}{dt} E = 0$$.

If we parameterize the system by $$(x,v)$$ phase-space and ignore time entirely, we know that along a physical path, $$dE(x,v) = 0$$:

$$dE = E_{\b{x}} \cdot d \b{x} + E_{\b{v}} \cdot d \b{v} = 0$$

That equation defines a hyperplane in $$(x, v)$$-space, but does not specify an exact solution. Any solution to it should have the form (up to an ignoreable constant):

$$(d \b{x}, d \b{v}) \propto (- E_{\b{v}}, E_{\b{x}})$$

Now we parameterize our path in phase space by time, which lets us invoke the other defining equation of mechanics:

$$\b{v}(t) = \frac{d}{dt} \b{x}(t)$$

Giving:

$$ E_{\b{x}} = - d_{t} E_{\b{v}} $$

This equation says exactly what we expect to be true:

> The ΔE from changing position in a potential cancels out the ΔE from changing velocity

Now define $$E = V + T$$, defining $$V(\b{x}) $$ as the part of the energy that has a spatial dependence and $$T(\b{\dot{x}})$$ as the part with a velocity dependence (and assume there are no components with both!).

$$ \Ra V_{\b{x}} + d_{t} T_{\b{\dot{x}}} = 0 $$

With $$\cal{L} = T - V$$:

$$ \cal{L}_{\b{x}} - d_{t} \cal{L}_{\b{\dot{x}}} = 0 \; \checkmark$$

----------

Therefore I conclude that Lagrangians, and the Principle of Stationary Action, are silly, and that we should just be better at doing calculus on manifolds.

Only partially kidding. I'm sure (or I sure hope) there are some more compelling reasons for them when dealing with -- maybe -- arbitrary constraints on problems, or non-separable energies, or quantum field theory, or non-flat manifolds, or whatever. But, at least in cases, I suspect that this is 'really' where it comes from, and all that circumlocution into functional derivatives tends to obscure this fact.

I do, *finally*, realize why $$\cal{L} = T - V$$:

In Newtonian mechanics, we treat energy $$E = T + V$$ as something that is traded off in two forms, so $$T_{t} = - V_{t}$$.

In Lagrangian mechanics, we treat $$T$$ as a potential energy also, but it changes based on changes in our velocity coordinate instead of our energy one. So:
* moving in the $$+\b{v}$$ direction 'costs' $$E_{\b{v}}$$
* moving in the $$+\b{x}$$ direction 'costs' $$-V_{\b{x}}$$

This means that movement in $$(x,v)$$ space is $$d\cal{L} = E_{\b{v}} d\b{x} + V_{\b{x}} d\b{x}$$, and physical paths have $$d\cal{L} = 0$$.

Phrased differently: in Newtonian mechanics, $$T$$ measures the energy of our object, and $$V$$ measures the energy of the external system. In Lagrangian mechanics, $$-T$$ and $$V$$ both measure the energy of our 'position' in the external $$(x,v)$$ system.

And it's not at all surprising that treating different kinds of energy on an entirely equal footing makes systems simpler to reason about. 
