---
layout: blog
title: "Divergences and Delta Functions"
tags: math
math: true
footnotes: true
aside: true
---

There's an identity that shows up in electromagnetism which has been bugging me since college. 

As soon as we start using Gauss's Law ($$\del \cdot \b{E} = \rho$$) in introductory E&M, we run into the problem that, in order to use it for a point charge --- which is the most basic example in the subject! --- we already don't have the mathematical object we need to calculate the divergence on the left, or to represent the charge distribution on the right. The field of a point charge has to be

$$\b{E} = q \hat{\b{r}}/4 \pi r^2$$

And its charge has to be concentrated at a point, i.e. it's a delta function:

$$\del \cdot \frac{q \hat{\b{r}}}{4 \pi r^2} = q \delta(\b{x})$$

In your multivariable-calculus-based E&M class you mention this briefly, maybe, but you don't really use it. Yet it is... kinda weird? It feels like it should make sense inside of a larger framework.

<!--more-->

Why, in the first place, are we using this divergence operator that we didn't know how to actually calculate --- are we missing something? Are there _other_ divergences that I don't know how to calculate? Does it work the same way in other dimensions? What about other powers of $$\frac{1}{r}$$? Are there _other_ derivative operators I don't know about that do similar tricks? Is there an equivalent version for the curl and by extension the magnetic field? Is there an equivalent version for dipoles, or multipoles? Etc. (The answer to all of these questions is 'yes', by the way.)

Not only is it unsatisfying, it's also hard to learn about. For years I've been referring back to this one [rather confusing physicsforum.com post](https://www.physicsforums.com/threads/divergence-of-the-e-field-at-a-theoretical-point-charge.956012/), and I'm pretty tired of reading that. It's not even good! Griffith's and other E&M textbooks have blurbs on the  subject also, of course, but they're obscured by pedagogy and most of the interesting parts are left as exercises. Meanwhile the treatment on venerable old Wikipedia is very slim and spread out over many hard-to-navigate articles.

So today's the day: I'm going to figure this out in all the generalization I want and write myself the reference I have wanted so I never have to visit that forum post, or that one page of Griffiths, ever again.

---------

## 1. The Basic Argument

The first thing we learn in electrostatics is that the electric field of a point particle is

$$\b{E} = \frac{q \hat{\b{r}}}{4 \pi r^2}$$

That is, the field points radially out in every direction from the 'infinitely concentrated' point charge, and the magnitude falls off proportional to $$4 \pi r^2$$. Non-coincidentally, $$4\pi r^2$$ is the formula for the surface area of a sphere of radius $$r$$. Evidently electric flux lines get weaker exactly in proportion to how much they "spread out". It is as though you had a pipe whose input has to be equal to its output, except the input is at the origin and the output is "every direction at once". Put differently, an electric charge is the source of a flux and then that flux fluxes around in exactly the way a flux has to flux around, which is conservatively. A source of nonzero electric flux is what a charge _is_. 

Which means that you can measure charges by measuring flux. This is Gauss's law: that summing the electric flux through any surface measures the total charge contained within it.

$$\oiint_{S} \b{E} \cdot d \b{A} = q_{\text{enclosed}}$$

The divergence theorem turns Gauss into

$$\iiint_V \del \cdot \b{E} \; dV = q_{\text{enclosed}}$$

We also learn the differential form of Gauss's law, that the divergence $$\del \cdot \b{E}$$ equals the charge distribution $$\rho(\b{x})$$. For a point particle the integral's value is entirely concentrated at the origin, so $$\rho(\b{x})$$ has to be a delta function: 

$$\rho(\b{x}) = q \delta(\b{x})$$

But we also know the functional form of $$\b{E}$$ for a point charge: it's $$\frac{q \hat{\b{r}}}{4 \pi r^2}$$. Hence at least in $$\bb{R}^3$$ it must be true that:

$$\del \cdot \frac{\hat{\b{r}}}{r^2} = 4 \pi \delta(\b{x})$$

Equivalently:[^laplacian]

[^laplacian]: I am stubbornly opposed to the Laplacian symbol $$\Delta = \del^2$$

$$- \del^2 \frac{1}{r} = 4 \pi \delta^3(\b{x})$$

We can also write this delta function in terms of $$r$$:[^spherical]

[^spherical]: By the way (because I definitely didn't know this off the top of my head) you can't just replace $$\delta(\b{x})$$ with $$\delta(r)$$. Translating $$\delta(\b{x})$$ to spherical coordinates requires some extra care because it has to be true that $$\int_V \delta(x,y,z) d^3 \b{x} = \int_V \delta(r) (r^2 \sin \theta) \, dr \, d \theta \, d\phi$$. The two angular integrals integrate to $$4 \pi$$, so $$\delta(r)$$ has to have a $$\frac{1}{4 \pi r^2}$$ to cancel everything out.

$$ 4 \pi \delta^3(\b{x}) = - \del^2 \frac{1}{r} = \del \frac{\hat{\b{r}}}{r^2} =\frac{\delta(r)}{r^2} $$

Which is rather suspicious-looking.

It's pleasing (since it's pleasing when any integral is easy) that you can simply plug that into the equation for the electric field of an arbitrary charge distribution and recover Gauss's law:

$$\begin{aligned}
\b{E}(\b{x}) &= \frac{1}{4 \pi} \int \frac{\rho(x')}{\|\b{x} - \b{x}' \|^2} dx' \\
\nabla \cdot \b{E}(\b{x}) &= \frac{1}{4 \pi} \int [\del \cdot \frac{1}{\|\b{x} - \b{x}' \|^2} ] \rho(x')  \; d\b{x}' \\
&= \frac{1}{4 \pi} \int [4 \pi \delta(\b{x} - \b{x}')]  \rho(x') \; d\b{x}' \\
&= \rho(\b{x}) \end{aligned}$$

--------

## 2. The Other Definition of Divergence

Producing this result by working backwards from physics is good enough for most purposes, but it's a bit perplexing. Maybe there's a cleaner derivation?

I've looked around and there are some formal-ish [ways](https://math.stackexchange.com/questions/1335591/divergence-of-vecf-frac-hat-mathrmrr2) to do it, by a procedure they call 'regularizing' $$\frac{\b{r}}{r^2}$$ as a limit of a more complicated function like $$\b{r} /(r^2 + a^2)^{\frac{3}{2}}$$, which is a way of producing distributions as a limit of non-distributions. I guess it's rigorous, but I don't want to do it. It doesn't teach me anything new about divergences or delta functions at all. Plus it just feels unnecessary.

Others [claim](https://math.stackexchange.com/questions/2136837/divergence-of-vecf-frac1r2-hatr) that the divergence of $$\b{r}/r^2$$ 'is' undefined according to the usual definition, and that we're just assigning a value to make the divergence theorem work. They're obviously wrong: we're not "inventing" a value; we're 'discovering' the actual value and it just requires delta functions to express. For the purposes of physics we don't care at all about confining the space of objects we consider to just the standard-issue smooth functions. Evidently multivariable calculus _wants_ distributions to get involved; we may as well let it happen.

The most satisfying explanation, in my opinion, is based on a different definition of divergence which isn't used as much. In multivariable calculus class we initially define divergence as a sum of partial derivatives $$\p_x \hat{\b{x}}+ \p_y \hat{\b{y}}+ \p_z \hat{\b{z}}$$ (or whatever it becomes in other coordinate systems). But there's another definition which is really a more direct extension of the one-variable derivative[^derivative]. It looks like this:

[^derivative]: The sense in which this is a 1d derivative: $$1/V$$ can be written as $$\int dV$$, with the integral is over a ball of radius $$\e$$. In the numerator it's over the boundary of that ball. So divergence is $$\underset{e \ra 0}{\lim} [\int_{ \p B_\e} f \, dA] / (\int_{B_\e} dV) . $$ In one dimension a ball of radius $$\e$$ is just a line segment, so this is literally the same as the 1d derivative $$\lim_{\e \ra 0} \frac{f(x + \e) - f(x)}{\e}$$.

$$\del \cdot \b{F} = \lim_{V \ra 0} \frac{1}{\| V \|} \oint_{\p V} \b{F} \cdot d\b{n}$$

That is, it's a ratio of the flux through a volume surrounding the point divided by the volume itself, as the volume goes to zero. It's a standard definition which is at the top of the Wikipedia page on 'divergence' but for whatever reason it doesn't come up much. You can compute the volume in the denominator as a sphere or a cube or whatever. For instance if $$\b{F} = x \hat{\b{x}} + y \hat{\b{y}} + z \hat{\b{z}}= r \hat{\b{r}} $$ and we integrate over a sphere, then 

$$\begin{aligned} 
\del \cdot \b{F} &= \frac{1}{4/3 \pi r^3} \oint (r \hat{\b{r}}) \cdot \hat{\b{r}} (r^2 d \theta d \phi) \\
&= \frac{4 \pi r^3}{4/3 \pi r^3} \\
&= 3 \\
&= (\p_x \hat{\b{x}}+ \p_y \hat{\b{y}}+ \p_z \hat{\b{z}}) \cdot (x \hat{\b{x}} + y \hat{\b{y}} + z \hat{\b{z}}) 
\end{aligned}$$

In many ways this is more intuitive! On the other hand I have no idea how to prove that it's equivalent to $$\p_x \hat{\b{x}}+ \p_y \hat{\b{y}}+ \p_z \hat{\b{z}}$$, and it's hard to google for because you just get results about proving the divergence theorem. Sigh.

Using this definition we can derive the annoying equation from E&M as follows. The flux of $$\hat{\b{r}}/r^2$$ through a sphere of radius $$\e$$ is $$\frac{4 \pi \e^2}{\e^2} = 4 \pi$$ as long as the volume contains the origin and therefore the limit is $$\del \cdot \frac{\hat{\b{r}}}{r^2} = \lim_{V \ra 0} \frac{4 \pi 1_{\mathcal{O} \in V}}{V}$$ which, if you integrate that against test functions, acts like $$4 \pi \delta(\b{x})$$. Something like that.

One nice thing about the integral definition is that it makes generalizations to other dimensions very natural: just integrate over different types of objects. In each case the coefficient is given by the surface area of an $$(n-1)$$-sphere of radius $$R=1$$, which you can [look up](https://en.wikipedia.org/wiki/N-sphere).

$$\begin{aligned} 
\del \cdot \frac{\hat{\b{r}}}{r^{n-1}} &= S_{n-1} \delta(\b{x}) \\
&= \frac{\delta(r)}{r^{n-1}}
\end{aligned}$$

e.g. in $$\bb{R}^2$$ with polar coordinates (so $$\b{r}_{xy} = x \hat{\b{x}} + y \hat{\b{y}}$$):

$$\del \cdot \frac{\hat{\b{r}}_{xy}}{r_{xy}} = 2 \pi \delta(x,y) = \frac{\delta(r_{xy})}{r_{xy}}$$

Note that this doesn't require you to keep using the $$\del$$ symbol, either. You can totally compute a 2-divergence in $$\bb{R}^3$$, or a 3-divergence in $$\bb{R}^4$$, etc.

Disclaimer: I don't really know how to double-check these formulas because I haven't found a resource on them. But they makes sense, I think?

Fun fact: this construction works in $$\bb{R}^1$$ also, but it's kinda weird. What's the 1d version of $$\hat{\b{r}}/r^2$$ in $$\bb{R}^3$$ or $$\hat{\b{r}}_{xy}/r_{xy}$$ in $$\bb{R}^2$$? Well, it's $$\hat{\b{r}}_{x}$$, the "one dimensional radius function", also written less strangely as $$\sgn(x) \hat{\b{x}}$$.

$$\begin{aligned} \del \cdot  (\hat{\b{r}}_x ) &= (\p_x \hat{\b{x}}) \cdot (\sgn(x) \hat{\b{x}}) \\
&= \p_x \sgn(x) \\
&= 2 \delta(x) \\
&= \delta(r_x)
\end{aligned}$$

Where the $$2$$ is the surface area of a $$0$$-sphere aka a line segment. My flimsy justification for $$2 \delta(x) = \delta(r_x)$$ is that $$\delta(r_x)$$ splits $$\bb{R}$$ into two copies that both of end at $$x=0$$, and we need a term for each: $$\delta(r_x) = \delta(+x) + \delta(-x) = 2 \delta(x)$$. 


----------

# 3. Other Shapes and Multipoles

If you stare at this for a while you realize that it generalizes to a lot more than just point charges. In fact every example charge distribution from elementary E&M has an expression as a delta function. It's just that we're not very good at using delta functions so we don't normally write them that way.

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

$$\rho_{\text{dipole}}(\b{x}) = \lim_{d \ra 0} [(+ q)\rho(\b{x} + \b{p}/2) + (- q)\rho(\b{x} - \b{p}/2)] =  \p_{\b{p}} [ \delta(\b{x})]$$

So the charge distribution of a dipole is the gradient of a delta-function (recall that $$\p_{\b{p}} f = \b{p} \cdot \del f$$). That makes sense: the net charge is zero, but there's two infinite spikes at the origin infinitesimally close to each other, which is what $$\delta'$$ looks like.

We can immediately write down the electric field and potential also:

$$\begin{aligned}
\rho_{\text{dipole}}(\b{x}) &= \p_{\b{p}} [\delta(\b{x})]  \\
\b{E}_{\text{dipole}}(\b{x}) &= \p_{\b{p}}[ \frac{ \hat{\b{r}}}{4 \pi r^2}] =  \frac{3 (\b{p} \cdot \hat{\b{r}}) \hat{\b{r}} - \b{p}}{4 \pi r^3} \\
V_{\text{dipole}}(\b{x}) &= \p_{\b{p}} [ -\frac{1}{4 \pi r}] = \b{p} \cdot [- \frac{\hat{\b{r}}}{4 \pi r^2} ]\\
\end{aligned}$$

(Although see the next section for a correction to $$\b{E}$$ that makes this calculation cleaner.)

We can also make lines and planes and other shapes out of dipoles. Evidently the result is just that we take an additional $$\p_{\b{p}}$$ of every term, which is equivalent in each case to taking two copies of the monopole function and forcing them to be $$d \ra 0$$ apart with opposite signs while holding the ratio $$qd$$ constant.

Higher-order multipoles work the same way. The [multipole distribution](https://en.wikipedia.org/wiki/Multipole_expansion) of a potential looks like

$$\begin{aligned}
V(\b{x})_{\text{multipole}} &= \frac{1}{4 \pi} [\frac{q}{r} + \b{p} \cdot \frac{\hat{\b{r}}}{r^2} + \frac{1}{2} Q \cdot \frac{\hat{\b{r}}^{\o 2} }{r^3} + \ldots] \\
&=[q + \b{p} \cdot \p + \frac{1}{2} Q \cdot \p^2 + \ldots]\frac{1}{4 \pi r} \\
\end{aligned}$$

Each of these terms is going to have a $$-\del^2$$ that gives a delta-function derivative of some order.

$$\begin{aligned}
-\del V = \b{E}(\b{x})_{\text{multipole}} &=  [q + \b{p} \cdot \p + \frac{1}{2} Q \cdot \p^{2} + \ldots] \frac{\hat{\b{r}}}{4 \pi r^2} \\
-\del^2 V = \rho(\b{x})_{\text{multipole}} &= [q + \b{p} \cdot \p + \frac{1}{2} Q \cdot \p^{2} + \ldots] \delta(\b{x})

\end{aligned}$$

This shows that, in general, there are lots of objects in $$\bb{R}^3$$ that have delta function divergences; it's not just $$\hat{\b{r}}/r^2$$. It's just that lots of them are delta-function derivatives instead, which are even harder to detect with the usual method of taking divergences.

-----------

# 4. The Dipole Field Discrepancy

By the way. While we're talking about dipoles and delta functions. Remember how the dipole term in $$\b{E}$$ was the second derivative of $$\frac{1}{4 \pi r}$$?

$$\b{E}_{\text{dipole}} = \frac{3 (\b{p} \cdot \hat{\b{r}}) \hat{\b{r}} - \b{p}}{4 \pi r^3}$$

It turns out there is some debate in the physics world about whether this should have a delta function term attached to it:

$$\b{E}_{\text{dipole (corrected?)}} \stackrel{?}{=} \frac{1}{4 \pi } [ \frac{3 (\b{p} \cdot \hat{\b{r}}) \hat{\b{r}} - \b{p}}{ r^3} - \frac{4 \pi}{3}  \b{p} \delta(\b{x})]$$

Griffiths and Jackson, the pre-eminent textbooks, both say it should. The argument is that if you integrate the electric field $$\int \b{E}(\b{x}) d^3 \b{x}$$ over a region containing a dipole, it is off: you should get that the total field is $$-\frac{4 \pi}{3}  \b{p}$$, but instead you get that it's zero as long as you exclude the origin. ($$4 \pi /3$$ being the volume of a unit sphere.)

But when you go looking to read about this correction, people are pretty polarized (no pun intended). [This](https://iopscience.iop.org/article/10.1088/0143-0807/28/2/012/meta) delightful paper by Andre Gsponer argues that the problem is that nobody is very good at using the $$r = \| \b{r} \|$$ variable, which (as I also noticed earlier) has a derivative of $$\sgn(r)$$ at $$r = 0$$; hence, its second derivative produces a delta function at the origin. In particular, they argue that the actual potential of a point charge goes as

$$4 \pi V(\b{x}) = \frac{1}{r} \sgn(r)$$

where $$\sgn(r)$$ hangs out even though it's always positive in order to give a correct derivative later. Then (recall that $$\del \cdot f$$ has radial part $$\frac{1}{r^2} \p_r(r^2 f_r)$$):

$$\begin{aligned}
4 \pi \b{E} &= - \del V \\
&= \frac{\hat{\b{r}}}{r^2} \sgn(r) - q \frac{\hat{\b{r}}}{r} \delta(r) \\
4\pi (\del \cdot \b{E}) &= \frac{1}{r^2} \p_r (\sgn(r) - \cancel{r \delta(r)}) \\
4 \pi \rho &= \frac{1}{r^2} \delta(r)
\end{aligned}$$

The dipole version is:

$$\begin{aligned}
4 \pi \b{E} &= - \del V \\
&= - \del ( \frac{\b{p} \cdot \b{r}}{r^3} \sgn(r)) \\
&= [\frac{3 (\b{p} \cdot \b{r})(\b{r}) - r^2\b{p} }{r^5} \sgn(r) - \frac{(\b{p} \cdot \b{r}) \b{r}}{r^4} \delta(r) ] \\
&= [\frac{3 (\b{p} \cdot \b{r})(\b{r}) - r^2 \b{p} }{r^5} \sgn(r) - \frac{\b{p}}{r^2} \delta(r) ] \\
\end{aligned}$$

It's that last term $$ - \frac{\b{p}}{r^2} \delta(r)$$ which gives the discrepancy: when integrated over a sphere the $$1/r^2$$ cancels out the $$r^2$$ integration factor so the result is just the volume of the sphere, $$\frac{4 \pi}{3}$$, leading to $$-\frac{\b{p}}{3} \delta(r)$$. So there you go. Apparently there should be delta functions on $$\b{E}$$ fields also, and it's the missing $$\sgn(r)$$s that are causing us to lose track of our deltas. Who knew?

Also, fun fact: apparently Jackson, who wrote that one textbook everyone hates, also published a [paper](http://cds.cern.ch/record/118393?ln=en) arguing that the fact that _intrinsic_ dipoles have a different delta function term ($$+ \frac{8 \pi}{3}$$ instead of $$- \frac{4 \pi}{3}$$, he says) compared to dipoles that are the limit of two monopoles shows that distant stars must have magnetic dipoles (that is, circulating electric currents) rather than magnetic monopoles in them, or they'd have a 42cm spectral line instead of a 21cm spectral line. Weird.

There are some other weird papers around the subject:

* [This](https://arxiv.org/pdf/1604.01121.pdf) paper by Edward Parker discusses various ways to get the terms in Jackson's argument.
* [Some novel delta‐function identities](https://pubs.aip.org/aapt/ajp/article-abstract/51/9/826/1043129/Some-novel-delta-function-identities?redirectedFrom=fulltext) by Charles Frahm derives some of these equations with explicit calculations in indexes.
* [Comment on “Some novel delta-function identities”](https://arxiv.org/abs/1001.1530) by Jerrold Franklin thinks that Frahm did it wrong and does it a different way, using "dyadic" notation for tensors, which always strikes me as juvenile for some reason. They do explicitly claim that the $$-\p^2 (\frac{1}{r}) = 4 \pi \hat{\b{x}}^{\o 2}\delta(\b{x})$$, though, and that everyone else has been integrating over the angular dependence implicitly. Actually I got that earlier when I had written $$(\b{p} \cdot \hat{\b{r}})\hat{\b{r}}$$, but the $$\hat{\b{r}}$$s disappeared because $$\b{p}$$ points in a radial direction so we just replaced the whole thing with $$\b{p}$$.
* And then there's [Comment on "Comment on `Some novel delta-function identities"](https://arxiv.org/abs/1308.2262) by Yunyun Yang and Ricardo Estrada... but unfortunately ArXiv doesn't have the pdf. I think they took it down because it was an older version. But I think the actual paper is called [Distributions in spaces with thick points](https://repository.lsu.edu/cgi/viewcontent.cgi?article=1282&context=mathematics_pubs), which deals with everything more rigorously than I care for and honestly gets crazy in how complex it is, defining distributions on certain surfaces and a new kind of "thick" delta functions. Why is figuring out what happens at $$r=0$$ in $$\bb{R}^3$$ so hard?

Math is horrifying, but this chain of commentaries is kinda funny. Out of all of these I think the trick of using $$\frac{1}{r} \ra \frac{1}{r} \sgn(r)$$ is easily the most useable. Stay away from thick distributions for now.

------


## 5. Curl and Magnetic Fields

One last question. How does this work for magnetism and curl?

The equivalent Maxwell equation is Ampère's law, which establishes that the curl of the _magnetic_ field is proportional to the current density (in units with $$\mu_0  = 1$$):

$$\del \times \b{B} = \b{J}$$

The integral form is:

$$\oint_{\p A} \b{B} \cdot d \ell = \iint_{A} \b{J} \cdot d\b{A}$$

The Dirac-delta formula is going to be for a current which is entirely concentrated in a line, which we'll assume is at the origin of the $$(x,y)$$ plane and directed up the $$z$$ axis.

$$\b{J} = j \hat{\b{z}}  \delta(x,y) = j \hat{\b{z}}  \frac{\delta(\b{r}_{xy})}{r_{xy}} $$

(That's in $$(r_{xy}, \theta, z)$$ cylindrical coordinates; the $$\frac{1}{r_{xy}}$$ factor is the same as the one for the 2d divergence up above.)

Of course the magnetic field due to a infinitely thin wire is a basic textbook example, so we know immediately what function has this as its curl:

$$\begin{aligned}\b{B} &= j\frac{\hat{\theta}}{2 \pi r_{xy}} \\
\del \times \b{B} &= j \hat{\b{z}} \delta(\b{r}_{xy})  \end{aligned}$$

The $$\hat{\theta}/r_{xy}$$ vector field is the classic 'twist around the origin' vector field that points along $$\hat{\theta}$$ and at a right angle to $$\hat{\b{r}}_{xy}$$ everywhere. It might look more familiar in cartesian coordinates:

$$\del \times \frac{\hat{\theta}}{r_{xy}} = \del \times \frac{x \hat{\b{y}} - y \hat{\b{x}}}{x^2 + y^2} = 2 \pi \hat{\b{z}} \delta(\b{r}_{xy})  $$

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


Anyway, that's all I've got. Thanks for reading. 

These equations aren't surprising or anything: they're basically just the toy examples used for half the problems in that intro electromagnetism course. But it's satisfying to just see them written _explicitly_ as delta functions, instead of working backwards to that form afterwards. I think things would have been easier to learn, back then, if the delta-function forms of these objects were made explicit from the start.
