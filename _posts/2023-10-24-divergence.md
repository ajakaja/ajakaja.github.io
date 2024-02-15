---
layout: blog
title: "Divergences and Delta Functions"
tags: math
math: true
footnotes: true
aside: true
---

There's an identity in electromagnetism which has been bugging me since college. 

Gauss's law says that the divergence of the electric field is equivalent to the charge distribution: $$\del \cdot \b{E} = \rho$$. But in order to use this for a point charge---which is the most basic example in the subject!---we already don't have the mathematical objects we need to calculate the divergence on the left or to represent the charge distribution on the right.

After all, the field of a point charge has to be $$\b{E} = q \hat{\b{r}}/4 \pi r^2$$, and since its charge should be concentrated at a point it has to be a delta function: $$\del \cdot (q \hat{\b{r}}/4 \pi r^2) = q \delta(\b{x})$$. In your multivariable-calculus-based E&M class you might mention this briefly, at best. Yet it is... kinda weird? And important? It feels like it should make a basic fact that lives inside of a larger intuitive framework of divergences and delta functions and everything else.

<!--more-->

Why, in the first place, are we using this divergence operator that we didn't know how to actually calculate---are we missing something? Are there _other_ divergences that we don't know how to calculate? Does it work the same way in other dimensions? What about other powers of $$\frac{1}{r}$$? Are there other derivative _operators_ we don't know about that do similar tricks? Is there an equivalent version for the curl and by extension the magnetic field? Is there an equivalent version for dipoles, or multipoles? Etc. (The answer to all of these questions is 'yes', by the way.)

Not only is it unsatisfying, it's also hard to learn about. For years I've been referring back to this one [rather confusing physicsforum.com post](https://www.physicsforums.com/threads/divergence-of-the-e-field-at-a-theoretical-point-charge.956012/), and I'm pretty tired of reading that. It's not even good! Griffith's and other E&M textbooks also mention it but they're obscured by pedagogy and most of the interesting parts are left as exercises... and even then they don't have much to say. Meanwhile venerable Wikipedia's treatment is very slim and spread out over many hard-to-navigate articles; the best one is probably [here](https://en.wikipedia.org/wiki/Green%27s_function_for_the_three-variable_Laplace_equation) but it's still not great.

So today's the day: I'm going to figure this out in all the generalization I want and write myself the reference I have wanted so I never have to visit that forum post, or that one page of Griffiths, ever again.

---------

## 1. The Basic Argument

The first thing we learn in electrostatics is that the electric field of a point particle is

$$\b{E} = \frac{q \hat{\b{r}}}{4 \pi r^2}$$

That is, the field points radially out in every direction from the 'infinitely concentrated' point charge, and the magnitude falls off proportional to $$4 \pi r^2$$. Non-coincidentally, $$4\pi r^2$$ is the formula for the surface area of a sphere of radius $$r$$. Evidently electric flux lines get weaker exactly in proportion to how much they "spread out". It is as though you had a pipe whose input has to be equal to its output, except the input is at the origin and the output is "every direction at once". Put differently, an electric charge is the source of a flux and then that flux fluxes around in exactly the way a flux has to flux around, which is: conservatively. A source of nonzero electric flux is what a charge _is_. 

Which means that you can detect the presence of charges by measuring the flux around a volume. This is Gauss's Law: that summing the electric flux through any closed surface measures the total charge contained within it.

$$\oiint_{S} \b{E} \cdot d \b{A} = q_{\text{enclosed}}$$

The divergence theorem turns Gauss's Law into

$$\iiint_V \del \cdot \b{E} \; dV = q_{\text{enclosed}}$$

We also learn the differential form of Gauss's Law, which says that the divergence $$\del \cdot \b{E}$$ equals the charge distribution $$\rho(\b{x})$$. For a point particle the integral's value is entirely concentrated at the origin, so $$\rho(\b{x})$$ has to be a delta function: 

$$\rho(\b{x}) = q \delta(\b{x})$$

But we also know the functional form of $$\b{E}$$ for a point charge: it's $$q \hat{\b{r}} /4 \pi r^2$$. Hence at least in $$\bb{R}^3$$ it must be true that:

$$\del \cdot \frac{\hat{\b{r}}}{r^2} = 4 \pi \delta^3(\b{x})$$

Equivalently:[^laplacian]

[^laplacian]: Sorry but I am stubbornly opposed to the Laplacian symbol $$\Delta = \del^2$$

$$- \del^2 \frac{1}{r} = 4 \pi \delta^3(\b{x})$$

We can also write this delta function in terms of $$r$$:[^spherical]

[^spherical]: By the way (because I definitely didn't know this off the top of my head) you can't just replace $$\delta(\b{x})$$ with $$\delta(r)$$. Translating $$\delta(\b{x})$$ to spherical coordinates requires some extra care because it has to be true that $$\int_V \delta(x,y,z) d^3 \b{x} = \int_V \delta(r) (r^2 \sin \theta) \, dr \, d \theta \, d\phi$$. The two angular integrals integrate to $$4 \pi$$, so $$\delta(r)$$ has to have a $$\frac{1}{4 \pi r^2}$$ to cancel everything out.

$$ 4 \pi \delta^3(\b{x}) = - \del^2 \frac{1}{r} = \del \frac{\hat{\b{r}}}{r^2} =\frac{\delta(r)}{r^2} $$

Which is neat, and also rather suspicious-looking. Seems like the more interesting identity here is that $$\delta^3 (\b{x}) = \delta(r) / 4 \pi r^2$$ where the numerator is the surface area of a $$2$$-sphere.

It's pleasing (since it's pleasing when any integral is easy) that you can simply plug that into the equation for the electric field of an arbitrary charge distribution and recover Gauss's law:

$$\begin{aligned}
\b{E}(\b{x}) &= \frac{1}{4 \pi} \int \frac{\rho(x')}{\|\b{x} - \b{x}' \|^2} dx' \\
\nabla \cdot \b{E}(\b{x}) &= \frac{1}{4 \pi} \int [\del \cdot \frac{1}{\|\b{x} - \b{x}' \|^2} ] \rho(x')  \d \b{x}' \\
&= \frac{1}{4 \pi} \int [4 \pi \delta(\b{x} - \b{x}')]  \rho(x') \d \b{x}' \\
&=  \int  \delta(\b{x} - \b{x}')  \rho(x') \d \b{x}' \\
&= \rho(\b{x}) 
\end{aligned}$$

--------

## 2. The Other Definition of Divergence

Producing this result by working backwards from physics is good enough for most purposes, but it's a bit perplexing. Maybe there's a cleaner derivation?

I've looked around and there are some formal-ish [ways](https://math.stackexchange.com/questions/1335591/divergence-of-vecf-frac-hat-mathrmrr2) to do it, by a procedure they call 'regularizing' $$\frac{\b{r}}{r^2}$$ as a limit of a more complicated function like $$\b{r} /(r^2 + a^2)^{\frac{3}{2}}$$, which is a way of producing distributions as a limit of non-distributions. I guess it's rigorous, but I don't want to do it. It doesn't teach me anything new about divergences or delta functions at all. Plus it just feels unnecessary.[^delta]

[^delta]: In general there are two ways of defining delta functions: either you make them out of a limit of functions you know how to do analysis on and prove that the limit is well-defined, which is this regularization procedure... or you define them to have certain properties by fiat, and then show that they exist. The latter, IMO, is the "right" way. I think the approximations are only to satisfy people who are unnecessarily fixated on classical functions that have definite values at points. (There's a rather nice book called "Theory of Distributions: A Non-Technical Introduction" by Richards & Youn which I like because of how much it commits to the better approach.)

Others [claim](https://math.stackexchange.com/questions/2136837/divergence-of-vecf-frac1r2-hatr) that the divergence of $$\b{r}/r^2$$ "is" undefined according to the usual definition, and that we're just assigning a value to make the divergence theorem work. They're obviously wrong: we're not _inventing_ a value; we're _discovering_ the actual value and it just requires delta functions to express. For the purposes of physics we don't care at all about confining the space of objects we consider to just the standard-issue smooth functions. Evidently multivariable calculus _wants_ distributions to get involved; we may as well let it happen.

The most satisfying explanation, in my opinion, is based on a different definition of divergence which isn't used as much:

Recall that in multivariable calculus class we initially define divergence as a sum of partial derivatives $$\p_x \hat{\b{x}}+ \p_y \hat{\b{y}}+ \p_z \hat{\b{z}}$$ (or whatever it becomes in other coordinate systems). But there's another definition which is really a more direct extension of the one-variable derivative[^derivative]. It looks like this:

[^derivative]: The sense in which this is a 1d derivative: $$1/V$$ can be written as $$\int dV$$, with the integral is over a ball of radius $$\e$$. In the numerator it's over the boundary of that ball. So divergence is $$\underset{e \ra 0}{\lim} [\int_{ \p B_\e} f \, dA] / (\int_{B_\e} dV) . $$ In one dimension a ball of radius $$\e$$ is just a line segment, so this is literally the same as the 1d derivative $$\lim_{\e \ra 0} \frac{f(x + \e) - f(x)}{\e}$$.

$$\del \cdot \b{F} = \lim_{V \ra 0} \frac{1}{\| V \|} \oint_{\p V} \b{F} \cdot d\b{n}$$

That is, it's a ratio of the flux through a volume surrounding the point divided by the volume itself, as the volume goes to zero. It's actually a standard definition and is at the top of the Wikipedia page on divergence, but for whatever reason it doesn't come up as often. To use it, you compute the volume in the denominator as a sphere or a cube or whatever you want. For instance if $$\b{F} = x \hat{\b{x}} + y \hat{\b{y}} + z \hat{\b{z}}= r \hat{\b{r}} $$ and we integrate over a sphere, then 

$$\begin{aligned} 
\del \cdot \b{F} &= \frac{1}{4/3 \pi r^3} \oint (r \hat{\b{r}}) \cdot \hat{\b{r}} (r^2 d \theta d \phi) \\
&= \frac{4 \pi r^3}{4/3 \pi r^3} \\
&= 3 \\
&= (\p_x \hat{\b{x}}+ \p_y \hat{\b{y}}+ \p_z \hat{\b{z}}) \cdot (x \hat{\b{x}} + y \hat{\b{y}} + z \hat{\b{z}}) 
\end{aligned}$$

In many ways this is more intuitive! On the other hand I have no idea how to prove that it's equivalent to $$\p_x \hat{\b{x}}+ \p_y \hat{\b{y}}+ \p_z \hat{\b{z}}$$ in general, and it's hard to google for because you just get results about proving the divergence theorem. Sigh. But it makes some sense. $$\del \cdot \b{F} = (\p_x, \p_y, \p_z) \cdot \b{F}$$ acts like the same formula but implemented on a cube instead of a sphere.

Using this definition we can derive the weird equation from E&M as follows. The flux of $$\hat{\b{r}}/r^2$$ through a sphere of radius $$\e$$ is $$4 \pi \e^2 / \e^2 = 4 \pi$$ as long as the volume contains the origin and therefore the limit is $$\del \cdot \hat{\b{r}} / r^2 = \lim_{V \ra 0} 4 \pi 1_{\mathcal{O} \in V}/V$$ which, if you integrate that against test functions, acts like $$4 \pi \delta(\b{x})$$. Something like that.

-------

# 3. Dealing with $$\delta(r)$$ in other dimensions

One nice thing about the integral definition is that it makes generalizations of the delta function divergence to other dimensions very natural: just integrate over different types of objects. In each case the coefficient is given by the surface area of an $$(n-1)$$-sphere of radius $$R=1$$, which you can [look up](https://en.wikipedia.org/wiki/N-sphere).

$$\begin{aligned} 
\del \cdot \frac{\hat{\b{r}}}{r^{n-1}} &= S_{n-1} \delta(\b{x}) \\
&= \frac{\delta(r)}{r^{n-1}}
\end{aligned}$$

e.g. in $$\bb{R}^2$$ with polar coordinates (so $$\b{r}_{xy} = x \hat{\b{x}} + y \hat{\b{y}}$$):

$$\del \cdot \frac{\hat{\b{r}}_{xy}}{r_{xy}} = 2 \pi \delta(x,y) = \frac{\delta(r_{xy})}{r_{xy}}$$

Note that you can totally compute a 2-divergence in a plane in $$\bb{R}^3$$, or a 3-divergence in $$\bb{R}^4$$, etc. I guess we could write it as $$\del_{xy} \cdot \b{F}$$. I do vaguely recall seeing that object in formulas in my life but can't remember where.

In fact this construction works in $$\bb{R}^1$$ also, but it's kinda weird: the 1d version of $$\hat{\b{r}}/r^2$$ in $$\bb{R}^3$$ and $$\hat{\b{r}}_{xy}/r_{xy}$$ in $$\bb{R}^2$$ is $$\hat{\b{r}}_{x}$$, the "one dimensional radius function", also written less strangely as $$\sgn(x) \hat{\b{x}}$$. That is, it's a unit vector pointing in the $$+\b{x}$$ direction in the positive numbers and the $$-\b{x}$$ direction in the negative numbers. Then:

$$\begin{aligned} \del \cdot  (\hat{\b{r}}_x ) &= (\p_x \hat{\b{x}}) \cdot (\sgn(x) \hat{\b{x}}) \\
&= \p_x \sgn(x) \\
&= 2 \delta(x) \\
&= \delta(r_x)
\end{aligned}$$

The factor of $$2$$ can be regarded as the "surface area" of a $$0$$-sphere, that is, of a line segment. Admittedly it's kinda weird to write $$2 \delta(x) = \delta(r_x)$$. One way of thinking about it is that $$\hat{\b{r}}_x$$ "acts like" $$\delta(x) \theta(x)$$, covering only half the displacement at the origin with a step function, whereas $$\hat{\b{x}} (\sgn(x))$$ acts like $$\delta(x) \sgn(x)$$ and covers the full displacement. Hence the factor of $$2$$.

Yes, that sounds weird and made up. I'm happy with it mostly I realized that it gives a satisfying result in in $$\bb{R}^3$$ as well: recall that in spherical coordinates the radial term of the divergence looks like $$\del \cdot \b{f} = \frac{1}{r^2} \p_r (r^2 f_r)$$. Well, suppose $$f = \hat{\b{r}} \theta(r) /r^2$$ where once again we imagine that we need the $$\theta(r)$$ in there to deal with how $$r$$ switches signs at the origin. Then $$\del \cdot \b{f} = \frac{1}{r^2} \p_r [r^2 \frac{\theta(r)}{r^2}] = \frac{1}{r^2} \p_r \theta(r) = \delta(r)/r^2$$ is the right value. Not bad, eh?

By the way, there is some information about all of this on the Wikipedia article for [Newtonian potential](https://en.wikipedia.org/wiki/Newtonian_potential). They call the function which is the fundamental solution to $$\del^2 f = \delta$$ in $$\bb{R}^d$$ the "Newtonian Kernel" $$\Gamma$$, and write

$$\Gamma(x) = \begin{cases} 
2 \pi \log r & d = 2 \\ 
\frac{1}{d(2-d) V_d} r^{2 - d} & d \neq 2
\end{cases}$$

Where $$V_d$$ is the _volume_ of the $$d$$-sphere. That's a bit confusing. It's easier to follow with the identity $$V_d = \frac{S_{d}}{d}$$ where $$S_d$$ is the surface area of the $$d$$-sphere. Then this is really

$$\Gamma(x) = \begin{cases} 
\frac{1}{2 \pi} \log r & d = 2 \\ 
\frac{1}{(2-d) S_d} r^{2 - d} & d \neq 2
\end{cases}$$

And its gradient is given by the same formula in all dimensions:

$$\del \Gamma(x) = \frac{1}{S_d} \frac{\hat{\b{r}}}{r^{d-1}}$$

This agrees with what we wrote above, and even works in $$d=1$$ if you consider the "surface area of the 1-sphere" to be $$S_1 = 2$$.


----------

# 4. Other Shapes and Multipoles

In fact every example charge distribution from elementary E&M has an expression as a delta function. It's just that we're not very... good... at using delta functions so we don't normally write them that way.

Here are two classic examples from intro E&M, plus the electric fields that you get from applying Gauss's law to their symmetries:

* an infinite line of charge in the $$z$$-direction with linear charge density $$\mu$$ has electric field $$\b{E}(\b{x}) = \mu \hat{\b{r}}_{xy} / (2 \pi r_{xy})$$.
* an infinite plane of charge in the $$xy$$ plane with area charge density $$\sigma$$ has constant electric field $$\b{E}(\b{x}) = \sigma \sgn(z) \hat{\b{z}}/ 2$$. The $$\sgn(z)$$ makes this valid on both sides of the plane.

In each case it should be that $$\del \cdot \b{E} = \rho(\b{x})$$. Evidently:


$$\begin{aligned}
\rho_{\text{line}}(\b{x}) &=  \mu \delta(y, z)  \\
&= \mu \frac{\delta(r_{xy})}{2 \pi r_{xy}} \\ 
\rho_{\text{plane}}(\b{x}) &= \sigma \delta(z) \\
&= \sigma \frac{\delta(r_z)}{2}   \\
\end{aligned}$$

Here are the forms of $$V$$, $$\b{E}$$, and $$\rho$$ side-by-side:

$$\begin{aligned}
\rho_{\text{line}}(\b{x}) &= \mu \delta(y, z)  \\
\b{E}_{\text{line}}(\b{x}) &= \frac{\mu}{2 \pi} \frac{\hat{\b{r}}_{xy}}{ r_{xy}} \\
V_{\text{line}}(\b{x}) &= \frac{\mu}{2\pi} \ln {r_{xy}} \\
&\\
\rho_{\text{plane}}(\b{x}) &= \sigma \delta(z)  \\
\b{E}_{\text{plane}}(\b{x}) &= \frac{\sigma}{2}  \sgn(z) \hat{\b{z}} \\
V_{\text{plane}}(\b{x}) &= \frac{\sigma}{2}  \| z \| \hat{\b{z}} \\
\end{aligned}$$

How about some other interesting charge distributions?

A perfect [electric dipole](https://en.wikipedia.org/wiki/Electric_dipole_moment) is the limiting case of a positive and negative charge next to each other, so that their net charge is zero but there is a nonzero dipole moment $$\b{p}$$ along a certain axis axis. The potential, electric field, and charge distributions of dipoles are given by the limit as we press two point charges together while keeping the product $$qd$$ fixed. But in fact this limit is just a directional derivative:

$$\rho_{\text{dipole}}(\b{x}) = \lim_{d \ra 0} [(+ q)\delta(\b{x} - \b{d}/2) + (- q)\delta(\b{x} + \b{d}/2)] =  -\b{p} \cdot \p [ \delta(\b{x})] = -\p_{\b{p}} \delta(\b{x})$$

So the charge distribution of a dipole is the gradient of a delta-function. That makes sense: the net charge is zero, but there's two infinite spikes at the origin infinitesimally close to each other, which is what $$\delta'$$ looks like.

We can immediately write down the electric field and potential also:

$$\begin{aligned}
V_{\text{dipole}}(\b{x}) &= -\p_{\b{p}} [ \frac{1}{4 \pi r}] = \b{p} \cdot [\frac{\hat{\b{r}}}{4 \pi r^2} ]\\
\b{E}_{\text{dipole}}(\b{x}) = -\del V_{\text{dipole}}(\b{x})   &= -\p_{\b{p}}[ \frac{ \hat{\b{r}}}{4 \pi r^2}] =  \frac{3 (\b{p} \cdot \hat{\b{r}}) \hat{\b{r}} - \b{p}}{4 \pi r^3} \\

 \rho_{\text{dipole}}(\b{x}) = \del \b{E}_{\text{dipole}}(\b{x}) &=  -\p_{\b{p}} [\delta(\b{x})]  \\
\end{aligned}$$

(Although see the next aside for a correction to $$\b{E}$$: there's apparently supposed to be a delta function term there also.)

<aside id="dipole" class="toggleable" placeholder="<b>Aside</b>: The Dipole Field Discrepancy <em>(click to expand)</em>">

By the way. While we're talking about dipoles and delta functions. Remember how the dipole term in $$\b{E}$$ was the second derivative of $$\frac{1}{4 \pi r}$$?

$$\b{E}_{\text{dipole}} = \frac{3 (\b{p} \cdot \hat{\b{r}}) \hat{\b{r}} - \b{p}}{4 \pi r^3}$$

It turns out there is some debate in the physics world about whether this should have a delta function term attached to it and what the coefficient should be:

$$\b{E}_{\text{dipole (corrected?)}} \stackrel{?}{=} \frac{1}{4 \pi } [ \frac{3 (\b{p} \cdot \hat{\b{r}}) \hat{\b{r}} - \b{p}}{ r^3}] - \frac{1}{3}  \b{p} \delta(\b{x})$$

Griffiths and Jackson, the pre-eminent textbooks, both say it should look like that. The argument is that if you integrate the electric field $$\int \b{E}(\b{x}) d^3 \b{x}$$ over a region containing a dipole, it is off: you should get that the total field is $$-\frac{1}{3}  \b{p}$$, but instead you get that it's zero as long as you exclude the origin. (The $$\frac{1}{3}$$ is really $$\frac{1}{4 \pi} \times \frac{4 \pi}{3}$$, the second term being the volume of a unit sphere.)

But when you go looking to read about this correction, people are pretty polarized (no pun intended). [This](https://iopscience.iop.org/article/10.1088/0143-0807/28/2/012/meta) delightful paper by Andre Gsponer (not a typo) argues that the problem is that nobody is very good at using the $$r = \| \b{r} \|$$ variable, which (as I also noticed earlier) has a derivative of $$\sgn(r)$$ at $$r = 0$$; hence, its second derivative produces a delta function at the origin. In particular, they argue that the actual potential of a point charge goes as

$$ V(\b{x}) = \frac{1}{4 \pi r} \sgn(r)$$

Or equivalently:

$$V(\b{x}) = \frac{1}{4 \pi \| r \|}$$

since $$r \, \sgn (r) = \frac{r}{\sgn (r)} = \| r \|$$. The $$\sgn(r)$$ hangs out even though it's always positive in order to give a correct derivative later.

$$\begin{aligned}
\del \frac{1}{\| r \|}  &= \p_r (\frac{1}{r} \, \sgn (r)) \\
&= - \frac{\hat{\b{r}}}{r^2} \sgn(r) + 2 \frac{\hat{\b{r}}}{r} \delta(r) \\
\del^2 \frac{1}{\| r \|}  &= \frac{1}{r^2} \p_r [r^2 (- \frac{1}{r^2} \sgn(r) + 2 \frac{1}{r} \delta(r))] \\
&= \frac{1}{r^2} \p_r [- \sgn(r) + 2 r \delta(r)] \\
&= \frac{1}{r^2} [- \delta(r) + \cancel{2 \delta(r) + 2 r \delta'(r)}] \\
 &= - \frac{1}{r^2} \delta(r)
\end{aligned}$$

(Note that the radial part of the divergence is given by  $$\del \cdot f = \frac{1}{r^2} \p_r(r^2 f_r)$$, and also that $$x \delta'(x) = - \delta(x)$$.)

The dipole version is:

$$\begin{aligned}
\del \p_{\b{p}} \frac{1}{\| r \|} &= \del [ - \frac{\b{p} \cdot \b{\hat{r}}}{r^2} \sgn (r)] \\
&= \frac{3 (\b{p} \cdot \b{r})(\b{r}) - r^2\b{p} }{r^5} \sgn(r) - \frac{(\b{p} \cdot \b{r}) \b{\hat{r}}}{r^3} \delta(r)  \\
&= \frac{3 (\b{p} \cdot \b{r})(\b{r}) - r^2\b{p} }{r^5} \sgn(r) - \frac{\b{p}}{r^2} \delta(r)  \\

\end{aligned}$$

It's that last term $$ - \frac{\b{p}}{r^2} \delta(r)$$ which gives the discrepancy: when integrated over a sphere the $$1/r^2$$ cancels out the $$r^2$$ integration factor so the result is just the volume of the sphere, $$\frac{4 \pi}{3}$$, leading to $$-\frac{\b{p}}{3} \delta(r)$$. So there you go. Apparently there should be delta functions on $$\b{E}$$ fields also, and it's the missing $$\sgn(r)$$s that are causing us to lose track of our deltas. Who knew?

Also, fun fact: apparently Jackson, who wrote that one textbook everyone knows, also published a [paper](http://cds.cern.ch/record/118393?ln=en) arguing that the fact that _intrinsic_ dipoles have a different delta function term ($$+ \frac{8 \pi}{3}$$ instead of $$- \frac{4 \pi}{3}$$, he says) compared to dipoles that are the limit of two monopoles shows that distant stars must have magnetic dipoles (that is, circulating electric currents) rather than magnetic monopoles in them, or they'd have a 42cm spectral line instead of a 21cm spectral line. Weird. I didn't really follow it.

There are some other weird papers around the subject:

* [This](https://arxiv.org/pdf/1604.01121.pdf) paper by Edward Parker discusses various ways to get the terms in Jackson's argument.
* [Some novel delta‐function identities](https://pubs.aip.org/aapt/ajp/article-abstract/51/9/826/1043129/Some-novel-delta-function-identities?redirectedFrom=fulltext) by Charles Frahm derives some of these equations with explicit calculations in indexes.
* [Comment on “Some novel delta-function identities”](https://arxiv.org/abs/1001.1530) by Jerrold Franklin thinks that Frahm did it wrong and does it a different way. They do explicitly claim that the $$-\p^2 (\frac{1}{r}) = 4 \pi \hat{\b{x}}^{\o 2}\delta(\b{x})$$, though, and that everyone else has been integrating over the angular dependence implicitly.
* And then there's [Comment on "Comment on `Some novel delta-function identities"](https://arxiv.org/abs/1308.2262) by Yunyun Yang and Ricardo Estrada... but unfortunately ArXiv doesn't have the pdf. I think they took it down because it was an older version and they changed the name later: the actual paper is called [Distributions in spaces with thick points](https://repository.lsu.edu/cgi/viewcontent.cgi?article=1282&context=mathematics_pubs), which deals with everything more rigorously than I care for and honestly gets crazy in how complex it is, defining distributions on certain surfaces and a new kind of "thick" delta functions. Why is figuring out what happens at $$r=0$$ in $$\bb{R}^3$$ so hard?

Math is horrifying, but this chain of commentaries is kinda funny. Out of all of these I think the $$\frac{1}{r} \ra \frac{1}{r} \sgn(r)$$ trick is the most useable. Probably best to stay away from "thick distributions" for now.

In summary:

$$\b{E}_{\text{dipole}} \stackrel{?}{=} \frac{1}{4 \pi } [ \frac{3 (\b{p} \cdot \hat{\b{r}}) \hat{\b{r}} - \b{p}}{ r^3}] + \begin{cases} - \frac{1}{3}  \b{p} \delta(\b{x}) &  \\ + \frac{2}{3} \b{p} \delta(\b{x}) \end{cases} \text{ (depending on who you ask)} $$

</aside>

Another way of looking at dipoles is to consider manually placing a bunch of charges at a distance $$h$$ apart and then taking $$h \ra 0$$. Write $$\Delta_\b{v}$$ for a finite difference at a distance $$h$$ along the $$\b{v}$$. For instance $$\Delta_{\b{v}} = f(\b{x} + \b{v} h) - f(\b{x})$$. Note that $$\p_\b{v} f(\b{x}) = \lim_{h \ra 0} \Delta_\b{v} f(\b{x})$$. Also, we can write $$T_\b{z} f \equiv f(\b{x} + \b{z} h)$$, such that $$D_\b{z} = T_\b{z} - 1$$ and $$D_\b{z} f = (T_\b{z} - 1) f = T_\b{z} f - f$$.

Then a "physical" dipole (where the charges are a small but finite distance apart) is proportional to

$$\Delta_\b{z} \delta(\b{x}) = \delta(\b{x} + \b{z} h) - \delta(\b{x})$$



Then the infinitesimal dipole charge distribution is given by $$\rho(\b{x}) = - \frac{q}{h} \Delta_\b{z} \delta(\b{x})$$, which in the limit where $$h \ra 0$$ with $$hq = p $$ fixed gives

$$\rho_{\text{dipole}}(\b{x}) = (- p ) \p_\b{z} \delta(\b{x}) = (-p \b{z}) \cdot \p \delta(\b{x})$$

A physical quadrupole is given by the "second finite difference" (so, second derivative). We can consider the case along a single axis:

$$
\begin{aligned}
\Delta_\b{z}^2 \delta &= (T_\b{z} - 1)^2 \delta \\
&= T_\b{z}^2 \delta - 2 T_\b{z} \delta + \delta \\
&\equiv \delta(\b{x} + 2h \b{z}) - 2 \delta(\b{x} + h \b{z}) + \delta(\b{x}) 
\end{aligned}
$$

In the limit we take $$h \ra 0 $$ while holding $$q^2 h = Q$$ and get $$\rho_{\b{z}\b{z}\text{-quadrupole}} = Q \p_\b{z}^2 \delta = \hat{Q} \cdot \p^2 \delta$$ (where $$\hat{Q}$$ is a quadrupole tensor which only has an $$\b{z}\b{z}$$ component). Or, we can do an $$\b{y}$$-$$\b{z}$$ quadrupole:

$$
\begin{aligned}
\Delta_\b{y} \Delta_\b{z} \delta (\b{x}) &= (T_\b{y} - 1)(T_\b{z} - 1) \delta \\
&= T_\b{y} T_\b{z} \delta - T_\b{y} \delta - T_\b{z} \delta + \delta \\
&\equiv \delta(\b{x} + h(\b{z} + \b{y})) - \delta(\b{x} + h \b{xz}) - \delta(\b{x} + h \b{z}) + \delta(\b{x})
\end{aligned}
$$

The limit with $$q^2 h = Q$$ is $$\rho_{yz\text{-quadrupole}} = Q \p_y \p_z \delta(\b{x}) = \hat{Q} \cdot \p^2 \delta$$ (where $$\hat{Q}$$ is now a quadrupole tensor which only has an $$yz$$ component).

This construction is nicely easy to generalize, for instance to any charge distribution that's a mix of points and multipoles at any separation from each other.

We can also make lines and planes and other shapes out of multipoles. For instance a "line of dipoles" looks like a positively-charged line infinitesimally close to a negatively-charged line. The result is just that we take an additional $$-\p$$ of every term, which is equivalent to forcing the two charged surfaces to be $$d \ra 0$$ apart with opposite signs while holding the ratio $$qd$$ constant. For instance a line of charge on the $$z$$ axis had charge distribution $$\rho_{\text{line}} = \mu \delta(x,y)$$. A dipole along the $$x$$-axis made out of two of thsee has charge distribution

$$\rho_{\text{line of dipoles}} = \lim_{h \ra 0, h\mu = p} [\rho_{\text{line}}(\b{x} + h \hat{x}) - \rho_{\text{line}}(\b{x})] = p \p_x \delta(x,y) $$

More generally, the [multipole distribution](https://en.wikipedia.org/wiki/Multipole_expansion) of a potential gives an Taylor expansion of $$V$$ away from the charges, in terms of the increasingly higher-order moments $$(q, \b{p},  \hat{Q}, \ldots)$$ of the underlying charge distribtion.[^quad]

[^quad]: $$ \hat{Q}$$ here is the rank-2 [quadrupole tensor](https://en.wikipedia.org/wiki/Quadrupole). Equations using it and higher-order multipoles are best unpacked in index notation: $$\p^2_{ \hat{Q}} \delta(\b{x}) = Q^{ij} \p_i \p_j \delta(\b{x})$$. By the way, I haven't learned a ton about $$ \hat{Q}$$, and I'm a bit confused about when it ought to have a factor of $$1/2$$ or not. It might be a convention. Definitely double-check before using this.

$$\begin{aligned}
V(\b{x})_{\text{multipole}} &= \frac{1}{4 \pi} [\frac{q}{r} + \b{p} \cdot \frac{\hat{\b{r}}}{r^2} + \frac{1}{2}  \hat{Q} \cdot \frac{\hat{\b{r}}^{\o 2} }{r^3} + \ldots] \\
&=\frac{1}{4 \pi r}  [q + \b{p} \cdot (-\p) + \frac{1}{2}  \hat{Q} \cdot (-\p)^2 + \ldots]\\
\end{aligned}$$


Each of these terms is going to have a $$-\del^2$$ that gives a delta-function derivative of some order.

$$\begin{aligned}
-\del V = \b{E}(\b{x})_{\text{multipole}} &=  [q + \b{p} \cdot (-\p) + \frac{1}{2} \hat{Q} \cdot (-\p)^{2} + \ldots] \frac{\hat{\b{r}}}{4 \pi r^2} \\
-\del^2 V = \rho(\b{x})_{\text{multipole}} &= [q + \b{p} \cdot (-\p) + \frac{1}{2}  \hat{Q} \cdot (-\p)^{2} + \ldots] \delta^3(\b{x})

\end{aligned}$$

-----

## 5. Other powers of $$r$$

The multipole examples imply that in general, there are lots of objects in $$\bb{R}^3$$ that have delta function divergences and it's not just $$\hat{\b{r}}/r^2$$, but the results are going to involve _derivatives_ of delta functions instead... which are even harder to detect with the usual implementations of divergence. 

For instance we can can compute $$\del \cdot \hat{\b{r}}/r^3$$ in two ways. Everywhere except the origin, we can use $$\del \cdot f(r) = \frac{1}{r^2} \p_r (r^2 f_r)$$ to get 

$$\del \cdot \frac{\hat{\b{r}}}{r^3} = - \frac{1}{r^4}$$

And around the origin we use the integral definition of divergence:

$$
\begin{aligned}
\del \cdot \frac{\hat{\b{r}}}{r^3} &= \lim_{R \ra 0} \oint_{R} \frac{1}{r} \frac{d \Omega}{ r^2} \\
&= \frac{4 \pi }{r} \delta^3(\b{x}) \\
&= \frac{\delta(r)}{r^3} \\
\end{aligned}
$$

It seems like we should be able to make the delta function into a derivative, similar to what showed up in the multipole distribution. But it's a little weird. Normally we can replace $$\delta/x^n$$ with $$\frac{(-1)^n}{n!} \delta^{(x)}$$. But it seems like the identity is probably a little bit different in radial coordinates, since after all we expect this to be true:

$$\frac{4 \pi }{r} \delta^3(\b{x}) = \frac{1 }{r} \frac{\delta(r)}{ r^2} = \frac{- \delta'(r)}{r^2}$$

That is, $$\frac{1}{r^3}$$ should give a _first_ derivative, not a _third_ derivative:

$$\frac{4 \pi }{r} \delta^3(\b{x}) = \frac{1 }{r} \frac{\delta(r)}{ r^2} \stackrel{!}{\neq} \frac{- \delta^{(3)}(r)}{3!}$$

The problem, I presume, is basically that $$\p_r \delta(r)$$ is a weird object, because in an integral against a test function $$\< -\p_r \delta(r), f \>$$, the normal integration-by-parts that lets us move the derivative across doesn't work: $$\< -\p_r \delta(r), f \> \neq \< \delta, \p_r f \> $$: since the radial integral has bounds $$(0,r)$$, we _can't_ ignore the boundary. This integration by parts is what justifies $$\delta(x)/x = -\p_x \delta(x)$$ normally, since $$\< \delta(x)/x, f \> = \< \delta, f/x \> = - f'(0)$$ (in a principal-value sense?). Therefore it is _probably_ best to leave $$\delta(r) / r^3$$ as-is instead of trying to turn it into a radial derivative. 

Nevertheless I'm pretty sure there are ways to do it, but it's a lot more than I want to figure out right now. Roughly speaking, though, we can expect that a term like $$\delta(r)/r^k$$ is going to turn into a delta-function derivative that is comparable to $$\frac{1}{r^2}  \frac{(-1)^{k-2}}{(k-2)!} \delta^{(k-2)}$$, that is, it will act like a delta-derivative but it acts like a factor of $$\frac{1}{r^{(k-2)}}$$ instead. But I hope to figure out the actual details in a future article.

--------------

## 6. Curl and Magnetic Fields

One last question. How does this work for magnetism and curl?

The equivalent Maxwell equation is Ampère's law, which establishes that the curl of the _magnetic_ field is proportional to the current density (in units with $$\mu_0  = 1$$):

$$\del \times \b{B} = \b{J}$$

The integral form is:

$$\oint_{\p A} \b{B} \cdot d \ell = \iint_{A} \b{J} \cdot d\b{A}$$

Like divergence, there's an integral form for the curl, which is basically the same idea except that it is computed each plane instead of in the overall volume. The coordinates on the plane with normal $$\b{u}$$ are given by:

$$(\del \times \b{F} )\cdot \hat{\b{u}} = \lim_{A \ra 0} \frac{1}{\| A \|} \oint_{\p A} \b{F} \cdot d \ell$$

We can use this to justify delta-function formulas for currents on various surfaces, although I'm going to skip most of the steps. The equivalent identity is going to be for a current which is entirely concentrated in a line, which we'll assume is at the origin of the $$(x,y)$$ plane and directed up the $$z$$ axis.

$$\b{J} = j \hat{\b{z}}  \delta(x,y) = j \hat{\b{z}}  \frac{\delta(\b{r}_{xy})}{r_{xy}} $$

(That's in $$(r_{xy}, \theta, z)$$ cylindrical coordinates; the $$\frac{1}{r_{xy}}$$ factor is the same as the one for the 2d divergence up above.)

Of course the magnetic field due to a infinitely thin wire is a basic textbook example, so we know immediately what function has this as its curl:

$$\begin{aligned}\b{B} &= j\frac{\hat{\theta}}{2 \pi r_{xy}} \\
\b{J} = \del \times \b{B} &= j \hat{\b{z}} \delta(r_{xy})  \end{aligned}$$

The $$\hat{\theta}/r_{xy}$$ vector field is the classic 'twist around the origin' vector field that points along $$\hat{\theta}$$ and at a right angle to $$\hat{\b{r}}_{xy}$$ everywhere. It might look more familiar in cartesian coordinates:

$$\hat{\theta} = \frac{x \hat{\b{y}} - y \hat{\b{x}}}{\sqrt{x^2 + y^2}} = \frac{x \hat{\b{y}} - y \hat{\b{x}}}{r_{xy}}$$

Then its curl is:

$$ \del \times \frac{\hat{\theta}}{r_{xy}} = 2 \pi \hat{\b{z}} \delta(x, y) =  \hat{\b{z}} \frac{ \delta(r_{xy})}{r_{xy}}   $$

That's neat, I guess.

We can also do the magnetic field due to a single magnetic dipole (an infinitesimal magnetic or loop of current or classically-interpreted particle with spin) with magnetic dipole moment $$\b{m}$$. We'll use Gsponer's notation of including a $$\sgn(r)$$ term and see if it gives us some good delta functions terms. The vector potential is:

$$\b{A} = \frac{1}{4\pi} \frac{\b{m} \times \b{r}}{r^3} \sgn(r)$$

The magnetic field is (yes, definitely had to look up some identities for this):

$$\begin{aligned}
4 \pi \b{B} = 4 \pi \del \times \b{A} &= \del \times [(\b{m} \times \frac{\b{r}}{r^3}) \sgn(r)] \\
&= [(- \b{m} \cdot \del) \frac{\b{r}}{r^3} + \b{m} (\cancel{\del \cdot \frac{\b{r}}{r^3}})] \sgn(r) - \frac{\b{m} \times \b{r}}{r^3} \times \del \sgn(r) \\
&= [\b{m} \cdot (-\frac{1}{r^3} + \frac{3 \b{r}^{\o 2}}{r^5})    ] \sgn(r) - \frac{\b{m} \times \b{r}}{r^3} \times \hat{\b{r}} \delta(r) \\
\b{B} &= \frac{3 (\b{m} \cdot \b{r}) \b{r} - r^2 \b{m}}{4 \pi r^5} \sgn(r) + (\hat{\b{r}} \times \b{m} \times \hat{\b{r}}) \frac{\delta(r)}{4 \pi r^2}
\end{aligned}$$

(Since we included the $$\sgn$$ term that should track the delta functions for us, it seemed like $$\del \cdot \frac{\b{r}}{r^3} = \del \cdot \frac{\hat{\b{r}}}{r^2}$$ could be ignored now.) The latter term is the delta-function correction to the magnetic dipole field. The internet tells me that its integral over space is $$ +\frac{8 \pi}{3} \b{m}$$, compared to $$-\frac{4 \pi}{3} \b{p}$$ for the scalar dipole field, and, as mentioned earlier, Jackson says this is responsible for the specific wavelength in the hyperfine splitting of hydrogen. Weird. 

---------

## 7. Summary

Most of these equations are the same toy examples from an intro electromagnetism course, written in a different way. But it is satisfying to see them written "explicitly", which is what the delta functions let us do, instead of "working around" the delta function formulation by computing with e.g. Gauss's law. I think things would have been easier to learn, back then, if the delta-function forms of these objects were made explicit from the start.

For posterity here's a summary of the talked we've talked about:

**Delta Functions in Radial Coordinates**

$$
\begin{aligned}
\delta^n(\b{x}) &= \delta(r_n)/ S_{n-1} \\
\delta^3(\b{x}) &= \delta(r_3)/4 \pi r^2 \\
\delta^2(\b{x}) &= \delta(r_2)/2 \pi r \\
\delta(x) &= \delta(r_1)/2 \\
\end{aligned}
$$

For the $$1d$$ case, recall that the "0-sphere" is a line segment whose "surface" area is usefully understood to be $$S_0 = 2$$, giving $$\delta(x) = \frac{1}{2}\delta(r)$$. That does seem a bit weird---why are we chopping our delta function in two?---but it does seem to work.

**Integral Form of Divergence and Curl**

Divergence in general is given by

$$\del \cdot \b{F} = \lim_{V \ra 0} \frac{1}{\| V \|} \oint_{\p V} \b{F} \cdot d \b{n}$$

Curl is given by

$$(\del \times \b{F} )\cdot \hat{\b{u}} = \lim_{A \ra 0} \frac{1}{\| A \|} \oint_{\p A} \b{F} \cdot d \ell$$

for any plane with normal $$\b{u}$$; chose $$\b{u} = \{ \b{x}, \b{y}, \b{z} \}$$ to get the usual vector projections.

**Functions whose divergence/curl/exterior derivative are delta functions**

In $$\bb{R}^n$$ the divergence's integrand includes a factor of $$r^{n-1}$$ from the coordinates, while all the angular coordinates naturally integrate to $$S_{n-1}$$. Therefore it's $$1/r^{n-1}$$ that cancels the radial part out and produces a delta function at the origin:

$$\del \cdot \frac{\hat{\b{r}}}{r^{n-1}} = S_{n-1} \delta^n (\b{x}) = \frac{\delta(r)}{r^{n-1}}$$

Which in $$\bb{R}^3$$ is

$$\del \cdot \frac{\hat{\b{r}}}{r^{2}} = 4 \pi \delta^3 (\b{x}) = \frac{\delta(r)}{r^2}$$

Meanwhile if curl is integrated around a loop in e.g. the $$\b{xy}$$ plane, then the integrand includes a factor of the radius $$\rho$$ in that plane and is therefore canceled out by $$\rho^{-1}$$.

$$\del \times \frac{\hat{\theta}}{\rho^{-1}} = (0, 0, 2 \pi \delta(x, y)) = (0, 0, \frac{\delta(\rho)}{\rho})$$

The analogs on other dimensions of $$n$$-spheres can be used to generalize these to higher dimensions, or to charge or current distributions that take lower-dimensional forms like lines or planes of charge.