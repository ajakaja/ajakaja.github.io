---
layout: article
title: "re: derivation of Lagrangian Mechanics"
math: true
category: notes
footnotes: true
---

I'm trying to figure out how to derive the E-L equation without any reference to "Action", because I think it should be possible.

## 1

Newton tells us that $$\frac{dE}{dt} = 0$$ for a closed system with total energy $$E$$.

Calculus tells us that we can rephrase this to say that any infinitesimal tangent vector $$\vec{\D}$$ in the configuration of such a system must have:

$$dE \cdot \vec{\D} = 0$$

That is: along the path of the system's evolution, energy does not change. If we suppose that we can write the energy of a configuration of the system as a function of the position and velocities $$E = E(\b{x}, \b{v})$$ (where each vector spans, potentially, many particles), then:

$$\nabla E \cdot \vec{\D} = (E_\b{x}, E_{\b{v}}) \cdot (\D \b{x}, \D \b{v}) = 0$$

Without incorporating time or really thinking much about physics at all, I can tell you a $$\vec{\D}$$ which is a solution to this equation:

$$\nabla E \cdot (\D \b{x}, \D \b{v}) = (E_\b{x}, E_{\b{v}}) \cdot (E_{\b{v}}, -E_{\b{x}}) = 0 \; \checkmark$$

This defines a _line_ of solutions: any $$\vec{\D}$$ parallel to $$(E_{\b{v}}, -E_{\b{x}})$$ will do. But we know that $$\b{v}$$ is the time derivative of $$\b{x}$$, so that also requires that along a valid $$\vec{\D}$$:

$$ E_{\b{x}} + \frac{d}{dt} E_{\b{v}} = 0$$

If you write $$\cal{L} = T - V$$, then this would be the Euler-Lagrange equation. But... something is wrong. At first glance _many_ solutions to 

$$(E_\b{x}, E_{\b{v}}) \cdot (\D \b{x}, \D \b{v}) = 0$$

An equation of the form $$\b{n} \cdot \b{u} = 0$$, for constant $$\b{n}$$, has a hyperplane of solutions. Anything which is orthogonal to $$\b{n}$$ will do. (For example consider the equation for a line in $$\bb{R}^{3}$$: $$ax + by + cz = (a,b,c) \cdot (x,y,z) = (a,b,c) \cdot \b{u} = 0$$.)

The equation $$\nabla E \cdot \D$$ exists in $$(\bb{R}^{3\times 2})^{N}$$ for an N-body system. Restricting the motion to a hyperplane only eliminates _one_ of those dimensions, leaving us with $$\bb{R}^{6N-1}$$. So what about the rest?

## 2

It's not hard to see where this goes wrong. Consider, for example, energy conservation for two unrelated particles on the x axis (call their coordinates $$x$$ and $$y$$) with energy $$E = \frac{1}{2} m v_x^2 + \frac{1}{2} m v_y ^2$$:

$$\begin{aligned} \nabla E \cdot \vec{\D} &= (E_x, E_y, E_{v_x}, E_{v_y}) \cdot (\D x, \D y, \D v_x, \D v_y) = 0 \\
&= (0, 0, mv_x, mv_y) \cdot (\D x, \D y, \D v_x, \D v_y) =0 \end{aligned}$$

The $$\dot{\b{x}} = \b{v}$$ constraint will determine $$\D x$$ and $$\D y$$, but there are many non-physical values to $$\D v_x$$ and $$\D v_y$$ (the physically correct solutions would just be $$0$$ for both -- with no interactions, an object in motion stays in motion, etc). For instance $$(\D v_x, \D v_y) = (mv_y, - mv_x)$$ would do -- they can just switch momentums arbitrarily!

Compare this to the same two particles but with a coupling spring force given by $$V(x,y) = \frac{1}{2} k (x-y)^{2}$$:

$$\begin{aligned} 
\nabla E \cdot \vec{\D} &= (E_x, E_y, E_{v_x}, E_{v_y}) \cdot (\D x, \D y, \D v_x, \D v_y) = 0 \\
&= (kx, -ky, mv_x, mv_y) \cdot (\D x, \D y, \D v_x, \D v_y) = 0 
\end{aligned}$$
