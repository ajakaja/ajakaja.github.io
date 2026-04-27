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

* The physicist's convention, which has $$\theta \in [0, \pi)$$ as the polar/zenithal angle (that is, the angle off of the north pole), and $$\phi \in [0, 2\pi)$$ as the equatorial/azimuthal angle (that is, the angle off of a designated line of $$0$$ longitude which is usually the $$+x$$ axis).
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


That's right. I do not care that physics has always been doing it the other way, or even that all the reference books about spherical harmonics [disagree](https://bridge.math.oregonstate.edu/papers/spherical.pdf) (what a weird objection). There is only one right answer and it will be easy for everyone to remember. Please update your textbooks. We can't fix everything (the electron will always be negatively charged, shoot) but perhaps we can fix this.

<!--more-->

----------

Update: a reader suggested to me that perhaps the situation is not this simple, because you could instead regard the symbol $$\phi$$ and $$\theta$$ as being pictures of the axis around which each rotation occurs. That is true, but I don't think it warrants doing things the other way. All else being equal, it's introductory learners we should be catering to in making things easiest to understand, and they're going to have an easier time the way I've described above. Once you're an expert in the field you can easily memorize the fact that things are backwards. 

This way is also consistent with the use of $$\theta$$ as a symbol for $$(r, \theta)$$ polar coordinates, which people will have learned first, and the picture even (almost) works. So we won't have to update those.

I will admit that $$e^{i m \phi}$$ is more _aesthetic_ for angular momentum phases in quantum mechanics. Maybe it's just familiarity, since I was an undergraduate physics major, or maybe it's just because $$\phi$$ is a smaller and less-important-looking symbol than $$\theta$$ and azimuthal angles are generally less important than polar ones in the study of spin. I don't know. But it's not reason enough to keep things split like this.

(For the same reason it's probably better to use the words _polar_ and _equatorial_ over _zenithal_ and _azimuthal_, because there is no reason to make things harder than they have to be. But this is not as important, I think. To me the word _equatorial_ feels slightly inappropriate in that usage; it has a connotation of referring to the entire equator rather than an angle relative to a designated _point_ on the equator. But it is still probably more democratic to use it. _Azimuth_ is definitely jargon. And people tend to use _polar_ over _zenithal_ anyway, so there's already an inconsistency there which we should prefer to resolve in the favor of simplicity.)