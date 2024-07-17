---
layout: blog
title: "The Spherical Coordinate Convention"
tags: math
math: true
footnotes: true
aside: true
---

It has come to my attention (actually I think I noticed this a long time ago and then forgot...) that there is a correct answer as to the convention used for spherical coordinates.

The options are:

* The physicist's convention, which has $$\theta$$ as the zenithal (polar) angle, the angle away from "north", which ranges in $$(0, \frac{\pi}{2})$$, and $$\phi$$ as the azimuthal (equatorial) angle, the angle away from a designated line of 0 longitude, which ranges in $$(0, 2 \pi)$$
* The mathematician's convention, which has $$\phi$$ as the zenithal angle and $$\theta$$ as the azimuthal angle.

<div style="display: flex; justify-content: center; gap: 10%">
{% include image.html filename="2024-07-08/output/01-sphere-physics.svg" width="200px" caption="the physics way" %}

{% include image.html filename="2024-07-08/output/02-sphere-math.svg" width="200px" caption="the math way" %}
</div>

It turns out that there is a right answer. The mathematicians are right (for once). 

I mean... look at them:

<div style="font-size: 2em;">
$$\LARGE{\theta \, \, \, \phi}$$
</div>

They're _pictures_ of which angle they are.


That's right. I do not care if everyone writes spherical harmonics [the other way](https://bridge.math.oregonstate.edu/papers/spherical.pdf). There is only one right answer. Please update your textbooks.