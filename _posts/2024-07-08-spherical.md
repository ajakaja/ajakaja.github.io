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

* The physicist's convention, which has $$\theta$$ as the polar (zenithal) angle, that is, the angle off of the north pole, which ranges in $$(0, \pi)$$, and $$\phi$$ as the equatorial (azimuthal) angle, the angle off of a designated line of 0 longitude which is usually the $$+x$$ axis, and which ranges in $$(0, 2 \pi)$$
* The mathematician's convention, which swaps them, and has $$\phi$$ as the polar angle and $$\theta$$ as the equatorial angle.

<div style="display: flex; justify-content: center; gap: 10%">
{% include image.html class="invertible" filename="2024-07-08/output/01-sphere-physics.svg" width="200px" caption="the physics way" %}

{% include image.html class="invertible" filename="2024-07-08/output/02-sphere-math.svg" width="200px" caption="the math way" %}
</div>

It turns out that there is a right answer. The mathematicians are right (for once). 

The reason is simple. Just look at them:

<div style="font-size: 2em; text-align: center;">
$$\LARGE{\theta \, \, \, \phi}$$
</div>

They're fricking _pictures_ of which angle they are.


That's right. I do not care that physics has always been doing it the other way, or even that all the reference books about spherical harmonics [disagree](https://bridge.math.oregonstate.edu/papers/spherical.pdf) (what a weird objection). There is only one right answer and it will be easy for everyone to remember. Please update your textbooks.