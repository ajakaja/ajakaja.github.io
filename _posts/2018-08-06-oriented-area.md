---
layout: blog
title: "Oriented Areas and the Shoelace Formula"
footnotes: true
math: true
aside: true
---

This article exists for two reasons:

First, because I wanted to make a reference to link to that collects all of the ideas around oriented areas, a concept that I find myself studying a lot and which I think deserves to be better popularized. 

Second, because some resources (including Wikipedia) cite a 1959 monograph called *Computation of Areas of Oriented Figures*, by A.M. Lopshits, originally printed in Russian and translated to English by Massalski and Mills, which I have not been able to find online. I did find a copy via university library, and I thought I would summarize its contents in the process to make them more available to a casual Internet observer.

(Also I wanted practice making cleaner math diagrams. Which succeeded, mostly, but my god is it ever not worth the effort.)

First, a summary of the concept of oriented area and the "[shoelace formula](https://en.wikipedia.org/wiki/Shoelace_formula)", and some equations I found playing while around with it.

---------

## 1

Let $$P$$ be a polygon with vertices $$\{p_0, p_1, p_2, \ldots p_n\}$$, with $$p_0 = p_n$$. For instance:

{% include image.html filename="2018-08-06/1-polygon.svg" width="200px" %}

<!--more-->

The _signed_ or _oriented_ area of $$P$$ is given by the so-called "shoelace" formula:

$$Area(P) = \frac{1}{2} \sum_{i=0}^n p_i \times p_{i+1} \tag{1}$$

where the sum wraps around, thanks to $$p_0$$ being the same as $$p_n$$. Each term is the area of the triangle formed by the origin, $$p_i$$, and $$p_{i+1}$$.

It's called the shoelace formula because when you write all the coordinates in a column and begin to compute the cross products, it's reminiscent of shoelaces:

{% include image.html filename="2018-08-06/1-shoelace.svg" width="150px" %}


Signed area means that the area gains a negative sign if its vertices' order is inverted (or any cyclic rotation thereof):

$$Area(-P) = Area(\{p_n, p_{n-1}, \ldots p_0\}) = -Area(P)$$

{% include image.html filename="2018-08-06/2-negative.svg" width="200px" %}

Signed areas are positive if the vertices surround the area counterclockwise -- the direction that radians, by convention, go. This is arbitrary, and we could have defined it the other way. If you just want the unsigned area of a region, you can always take the absolute value of this, so it's strictly more powerful.

Signed areas are useful because they are better-behaved than regular areas in several ways. For example, the signed area of a shapes is preserved under any decomposition into component shapes, with negatively-oriented components subtracting from the total area:

{% include image.html filename="2018-08-06/3-subtraction.svg" width="500px" %}

Indicating that the circle is to be traversed clockwise means that area will negative, and thus subtracts from the total area of the rectangle, giving the area of the composite shape without _explicitly_ saying that it should be subtracted. This becomes useful in more complicated figures.

The shoelace formula works because of the ability to add oriented areas without having to specify which ones to subtract. It amounts to decomposing a shape into a list of triangles with the origin as the third vertex, and adding their areas, which makes perfect sense if the origin is fully contained within the polygon:

{% include image.html filename="2018-08-06/4-triangles.svg" width="200px" %}

But signed areas mean that this construction works even if the origin is outside the polygon, with the triangles overlapping:

{% include image.html filename="2018-08-06/5-triangles2.svg" width="200px" %}

The dark areas cancel out of the total sum, because the (negative) area of $$p_1 p_2\mathcal{O}$$ exactly cancels the excess positive areas in each of the other triangles ($$p_2 p_3 \mathcal{O}, p_3 p_4 \mathcal{O}, p_4 p_0 \mathcal{O}$$, and $$p_0 p_1 \mathcal{O}$$).

The coordinate-invariance of this formula should be enough to motivate it as a 'good thing to know'. We like formulas that don't care where you put the origin.

The shoelace formula continues to work if the polygon is non-simple -- if it is allowed to have overlapping or degenerate sides -- except we must understand that negatively-oriented areas subtract from the total sum instead of adding, which may not be totally intuitive:

{% include image.html filename="2018-08-06/6-nonsimple.svg" width="250px" %}

The total signed area of this figure is _zero_, because the two oppositely-oriented components are congruent and thus cancel out.

---------



Related to the concept of oriented area is the concept of _oriented angle_, which are a bit more familiar. They distinguish between "the angle between $$\b{a}$$ and $$\b{b}$$" and "the angle between $$\b{b}$$ and $$\b{a}$$", by insisting that we only measure _counterclockwise_ angles:

{% include image.html filename="2018-08-06/7-angles.svg" width="250px" %}

This is very much like how the vector $$\bf{b-a}$$ is the negative of the vector $$\bf{a-b}$$. In fact we may as well think of angles as some kind of curved vectors. We can add and subtract angular vectors just like regular vectors. In this example, evidently $$\angle \b{ab} + \angle \b{bc} = \angle \b{ac}$$, and this angle addition formula does not need to be aware of the orientation of our angular 'vectors'.

{% include image.html filename="2018-08-06/8-angle-addition.svg" width="120px" %}


We want to think of angles as oriented because we can use them in formulas to get oriented areas as results. The cross product of two vectors $$\b{a}, \b{b}$$ gives the signed area of the parallelogram $$(\b{0}, \b{a}, \b{a+b}, \b{b})$$, regardless of their relative orientation:

$$\b{a} \times \b{b} = |a||b| \sin \phi \\
\b{a} \times \b{b} = |a||b| \sin (- \phi) = - |a||b| \sin \phi$$

----------

## 2

The shoelace formula can be massaged into some other forms. Defining $$\b{d}_i$$ as the vector displacements of each side[^vector]:

[^vector]: I like to use boldface to refer to things that are definitely _vectors_, as opposed to our $$p_i$$ which are points and cannot be added and subtracted.

$$\b{d}_i = p_{i+1} - p_i$$

Which describes the same polygon, labelled differently and with in a translation-invariant way:

{% include image.html filename="2018-08-06/9-displacements.svg" width="150px" %}


Then:

$$Area(P) = \frac{1}{2} \sum p_i \times \b{d}_{i} \tag{2}$$

Since $$p_i \times p_i = 0$$ and $$\times$$ is distributive, this is the same as (1). Essentially we are just referring to our triangles differently, by $$p_i$$ and $$\b{d}_i$$ instead of $$p_i$$ and $$p_{i+1}$$:

{% include image.html filename="2018-08-06/9-displacements2.svg" width="150px" %}

We can eliminate the $$p_i$$ terms entirely by writing them as sums of displacements, since the $$\b{d}_i$$ vectors traverse the polygon starting at $$p_0$$:

$$p_j = p_0 + \sum_{i = 0}^{j-1} \b{d}_i$$



And:

$$\sum_{i=0}^{n} \b{d}_i = \b{0}$$

Thus, we can write the area as a double sum:

$$\begin{aligned} Area(P) &= \frac{1}{2} \sum_{i} (p_0 + \sum_{j < i} \b{d}_j) \times \b{d}_i \\
&=\frac{1}{2} [ \sum_{i} p_0 \times \b{d}_i + \sum_{i}\sum_{j < i} \b{d}_j \times \b{d}_i ] \\
 &= \frac{1}{2} \sum_{i}\sum_{j < i} \b{d}_j \times \b{d}_i \tag{3} \end{aligned} $$

($$\frac{1}{2} \sum_{i} p_0 \times \b{d}_i$$ cancels out because it equals $$ \frac{1}{2} [p_0 \times  \sum_{i} \b{d}_i ] = \frac{1}{2} p_0 \times \b{0} = 0$$.)



---------

Finally, we can write this in terms of just the side-lengths and vertex angles of the polygon. 

We may describe the angles of a polygon in three ways. The first is by the interior angle $$\alpha_i$$ at vertex $$p_i$$, with the stipulation that this is always the angle measured counterclockwise from the first side in our oriented order, so that it is always the interior on positively-oriented simple polygons:

{% include image.html filename="2018-08-06/10-interior.svg" width="150px" %}

But for several reasons these angles perform less well in equations than the _exterior_ angle at each vertex, which is the angle between the vectors $$\b{d}_{i-1}$$ and $$\b{d}_i$$. Let's call them $$\theta_i$$, so $$\theta_i$$ is the exterior angle at the point $$p_i$$:

{% include image.html filename="2018-08-06/11-exterior.svg" width="150px" %}

Evidently $$\alpha_i + \theta_i = \pi$$. Also, for a simple polygon, the sum of all the angular displacements at every vertex must add up to $$2 \pi \equiv 0$$, because the angles make one complete circle.

$$\sum \theta_i = \b{0}$$

In a regular $$n$$-gon, each exterior angle must be equal, so $$\alpha_i = \frac{2 \pi}{n}$$, which means the interior angles are $$2\pi - \frac{2 \pi}{n}$$ and the sum of the interior angles is $$n(2\pi - \frac{2 \pi}{n}) = 2\pi (n-2)$$. The area of an $$n$$-gon is $$2n$$ copies of the right triangle that has half that, $$\pi (n-2)$$, as one of its angles, which gives various formulas for computing their area depending on what lengths you have:

{% include image.html filename="2018-08-06/11-regular.svg" width="200px" %}

For a simple, positively-oriented polygon, the exterior angles add up to exactly $$2 \pi$$ radians. For non-simple polygons they may add up to any multiple of $$2 \pi$$ depending on how many clockwise or counterclockwise loops there are:

{% include image.html filename="2018-08-06/12-exterior2.svg" width="500px" %}

We can also refer to the angle of each vector segment indvidually: $$\angle(\b{d}_i)$$ is the angle of $$\b{d}_i$$ relative to the $$x$$-axis, which is given by

$$\angle(\b{d}) = \text{atan2} (\b{d}_y, \b{v}_d)$$

([atan2](https://en.wikipedia.org/wiki/Atan2) is just a version of $$\arctan$$ which is aware that the angles of $$(1,1)$$ and $$(-1,-1)$$ are not the same. It's available in most math libraries.)


This is just going to be useful for finding the angle between _any_ two sides.

{% include image.html filename="2018-08-06/13-slope.svg" width="150px" %}

The exterior angle at a vertex is just the difference in angle between the two neighboring sides:

$$\theta_i = \angle(\b{d}_{i+1}) - \angle(\b{d}_i)$$

And the angle of the $$i$$'th side is the angle of the first side plus each rotation angle that has happened at intervening vertices:

$$\angle(\b{d}_j) = \angle(\b{d}_0) + \sum_{i < j} \theta_i$$

Therefore the angle between any two $$\b{d}_i$$ is (with the sum wrapping around if need be, and with addition be modulo $$2 \pi$$):

$$\theta_{ij} = \angle(\b{d}_j) - \angle(\b{d}_i) = \sum_{k < j} \theta_k - \sum_{k < i} \theta_k = \sum_{i \leq k < j} \theta_k$$


We can plug this into $$(3)$$ to get a version the area formula expressed only in lengths and angles:

$$\begin{aligned}
Area(P) &= \frac{1}{2} \sum_{i}\sum_{j < i} \b{d}_j \times \b{d}_i \\
&= \frac{1}{2} \sum_i \sum_{j < i} | \b{d}_j | | \b{d}_i | \sin (\theta_{ij}) \\
\end{aligned}$$

$$Area(P) = \frac{1}{2} \sum_i \sum_{j < i} | \b{d}_j | | \b{d}_i | \sin (\theta_{ij}) \tag{4}$$

By labeling the side lengths $$\| \b{d}_i \| $$ as $$a_{i+1}$$ and expanding the sum over $$i$$ before $$j$$, we can get to a form which which is presented [on Wikipedia](https://en.wikipedia.org/wiki/Polygon#cite_ref-lopshits_6-0):

$$\begin{aligned} Area(P) &= \frac{1}{2} (a_1 [a_2 \sin (\theta_1) + a_3 \sin (\theta_1 + \theta_2) + \ldots a_{n-1} \sin(\theta_1 + \theta_2 + \ldots + \theta_{n-1}) ] \\
&+ a_2 [ a_3 \sin (\theta_2) + a_4 \sin (\theta_2 + \theta_3) + \ldots + a_{n-1} \sin (\theta_2 + \theta_3 + \ldots + \theta_{n-1})] \\
&+ \dots + a_{n-2} \sin (\theta_{n-1})) \tag{5}
\end{aligned}$$

But I think my version is better. It's certainly more compact. Doesn't matter, though; you can translate these formulas into any of various forms depending on which angles you would prefer to use.

--------

## 3


The Wikipedia article on [polygons](https://en.wikipedia.org/wiki/Polygon) sources formula (5) from *Computation of Areas of Oriented Figures* by A.M. Lopshits, published 1959. It turns out some other people have chased that link and also cited this text, but I could not get my hands on a .pdf version, so I got it from the university library.

If you are curious what it contains, here's an outline. The short version is: not much. I wanted more formulas and ideas in the vein of (5), but much deeper. Turns out, though, that's it's a largely pedagogical text that reaches that formula as its final result after spending 40 pages on the concept of oriented area and related (elementary) geometric proofs.

### Outline of *Computation of Areas of Oriented Figures* by AM Lopshits:

**Chapter 1. Measurement of the Area of an Oriented Figure**
1. Oriented triangles are a lot like regular triangles, but oriented
2. Oriented triangles have oriented areas
	* The simplest way to see that this might be useful is this:
	* Consider a triangle $$ABC$$. If $$A'$$ is a point on the line segment $$BC$$, then $$area(ABC) = area(A'AB) + area(A'CA)$$.<br/>{% include image.html filename="2018-08-06/14-triangle.svg" width="150px" %}
	* If we allow ourselves _oriented_ triangles and areas, this remains true even if $$A'$$ is a point on the line $$\vec{BC}$$, but _outside_ the triangle:<br/>{% include image.html filename="2018-08-06/15-triangle2.svg" width="200px" %}
	* Lopshits makes all of these points arduously, in multiple theorems with elaborate proofs. I suspect the mid-century Russians loved proving things arduously.
3. The area of an oriented triangle can be calculate using the shoelace formula for any choice of origin $$\mathcal{O}$$.
	* this is carefully proven using previous theorems.
4. Oriented polygons are oriented collections of points. The shoelace formula gives their area for any choice of $$\mathcal{O}$$.
	* this is also carefully proven using previous theorems.
5. Some examples and exercises. The most interesting ones are similar to this:

	example -- problem 9 (center of a dodecagon star)

**Chapter 2. The Planimeter**
1. This chapter entirely describes the workings of the device called the *planimeter*, which is used to measured (oriented) areas of printed curves via, essentially, the shoelace formula acting on a polygonal approximation.
I do not care about planimeters, though I'm sure this was interesting in 1959.
In fact it turns out there are multiple kinds of planimeters out there, each of which the reader is invited to deeply contemplate.
There is one theorem I found interesting, though:
2. "Imagine a directed segment $$\vec{AB}$$ in the plane. Let us move it around the plane, finally bringing it back to its original position. In this motion the end $$A$$ and $$B$$ will of course trace out closed curved $$L_A$$ and $$L_B$$. Also, $$\vec{AB}$$ will sweep out an oriented area $$S$$."
	Theorem:

	$$area(S) = area(L_A) - area(L_B)$$

	This is simple to convince yourself of -- as oriented areas, we must have $$area(S) = area(L_A) + area(L_B)$$, and one of the areas must be oppositely-oriented so we may pick $$area(L_B)$$ to be negative. 

**Chapter 3. Computation of the Area of a Polygon Useful in Surveying**
1. This section primarily produces my formula (5). The argument for its use in surveying is that the formula uses only scalar lengths and angles, meaning that one can find the area of unwieldy regions (say, a plot of land) by measuring all the lengths and angles individually and then computing the result.
2. But before getting to that formulation, Lopshits introduces the concept of _vectors_. I am not understanding what level this text is meant for.
3. Derives of equation (4), though without summation formulas.
4. Oriented angles work better than regular ones for this calculation.
5. Lot of words about computing what I have called $$\theta_{ij}$$.
6. Derivativation of equation (5), for which Lopshits was cited on Wikipedia.

And that's pretty much... it. I'm a little disappointed.

---------

## 4


I'll mention, just in passing because this is already really long, that the shoelace formula is a discrete version of [Green's theorem](https://en.wikipedia.org/wiki/Green%27s_theorem), which says that the area of a region $$D$$ bounded by an oriented curve $$C$$ can be computed from any of several line integrals:

$$area(D) = \iint_D 1 dx dy = \int_C x dy = \int_C -y dx = \frac{1}{2} \int_C x dy - y dx$$ 

This means that, among other things, the shoelace formula should continue to work in higher dimensions without problems, though it takes a bit of work to interpret the result correctly. Among other things, it can be used to find the surface area of polyhedrons, though we have to take the positive magnitude of each area ($$SA = \sum_{faces F} \Vert area(F) \Vert$$), because the _signed_ surface area of a closed figure will always be 0.

The shoelace formula can be quickly generalized to find volumes, $$N$$-volumes, etc, though the coefficient becomes $$\frac{1}{N!}$$ and we have to replace the cross product with the [wedge product](https://en.wikipedia.org/wiki/Exterior_algebra), $$\wedge$$, to take products of $$N$$ vertices at a time.

That this should be valid is immediately apparent by upgrading Green's theorem to [Stoke's Theorem](https://en.wikipedia.org/wiki/Stokes%27_theorem), though there is some trickiness in how you actually _refer_ to all the sides of a polyhedron inside a summation.

------

That's all I've got, for now. Thanks for reading! Hope it's useful, interesting, or otherwise not a total waste of time. I hope to revisit higher-dimensional shoelace-type formulas at some point, but -- another time.

I made the diagrams using [Tikz](https://en.wikipedia.org/wiki/PGF/TikZ), which is what all those fancy diagrams in LaTeX documents and textbooks are made in, and it was a lot of work but I'm glad I've started to learn how to do it. The process of conveniently importing Tikz images into websites, though, is ... not enjoyable. I would be so excited if there was a project like [Mathjax](https://www.mathjax.org/) that extracted a subset of Tikz for inline web-document creation. 

As far as I can tell no current JS framework implements a math library that looks as professional as Tikz does -- but maybe I'm biased. I saw so many quality Tikz diagrams in my undergraduate classes that it has become my definition of professional. Unclear.
