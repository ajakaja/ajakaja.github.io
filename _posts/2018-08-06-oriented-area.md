---
layout: blog
title: "Oriented Areas and the Shoelace Formula"
footnotes: true
math: true
aside: true
tags: math
---

Here's a summary of the concept of oriented area and the "shoelace formula", and some equations I found while playing around with it which are not novel. I wanted to write this article because I think the concept deserves to be better popularized, and it is useful to me to have my own reference on the subject.

Several resources I have found on the subject, including Wikipedia, all cite a 1959 text entitled *Computation of Areas of Oriented Figures* by A.M. Lopshits, which was originally printed in Russian and translated to English by Massalski and Mills, but is apaprently not available online. I did find a copy via university library, so I thought I would summarize its contents in the process in order to make them available to a casual Internet reader.

I also took this chance to practice making beautiful math diagrams. Which went okay, but god is it ever not worth the effort.

<!--more-->

-----------

## 1. Oriented Area

Let $$P$$ be an $$n$$_sided polygon with vertices labeled $$\{p_1, p_2, \ldots p_n\}$$. Sometimes we'll refer to $$p_n$$ as $$p_0$$ as well so that the list wraps around, because it makes formulas cleaner. 

Here's a $$P$$ with $$n=5$$:

{% include image.html filename="2018-08-06/output/01-polygon.svg" width="200px" %}

The "signed" or "oriented" area of $$P$$ is given by the so-called "[shoelace formula](https://en.wikipedia.org/wiki/Shoelace_formula)":

$$\text{area}(P) = \frac{1}{2} \sum_{i=0}^{n-1} p_i \times p_{i+1} \tag{1}$$

where the sum wraps around, thanks to $$p_0$$ being the same as $$p_n$$. Each term in the shoelace formula is a cross product (e.g. $$a \times b = a_x b_y - a_y b_x$$), which gives the area of the triangle $$(\mathcal{O}, p_i, p_{i+1})$$, where $$\mathcal{O}$$ is the origin. It's called the shoelace formula because when you write all the coordinates in a column and begin to compute the cross products by multiplying $$x_1 y_2 - x_2 y_1$$, $$x_2 y_3 - x_3 y_2$$, etc, it looks like a laced shoe:

{% include image.html filename="2018-08-06/output/02-shoelace.svg" width="150px" %}

The fact that this is a "signed area" means that it can be positive or negative. In particular the area is positive if its vertices go counterclockwise, like radians do, and is negative if its vertices go clockwise. 

$$\text{area}(-P) = \text{area}(\{p_n, p_{n-1}, \ldots p_0\}) = -\text{area}(P)$$

{% include image.html filename="2018-08-06/output/03-negative.svg" width="200px" %}

Which direction has which sign is totally arbitrary, and we could have defined it the other way, but it's handy to keep it consistent with radians. If you ever just want the unsigned area of a region you can always take an absolute value, so the signed area is strictly more powerful than the unsigned version.

Signed/oriented areas are useful because they are better-behaved than regular areas in several ways. The signed area of a shape is preserved under any decomposition into component shapes, with negatively-oriented components subtracting from the total area:

{% include image.html filename="2018-08-06/output/04-subtraction.svg" width="500px" %}

I've indicating that the circle is negatively oriented and thus has negative area with an arrow that says it is to be traversed clockwise. Its area is subtracted from the total area of the rectangle, giving the area of the composite shape automatically.

This becomes useful in more complicated figures, because it lets us build them out of simple parts very cleanly. For example, the shoelace formula works because of the ability to add these oriented areas without having to specify which ones to subtract; it amounts to decomposing a shape into a list of triangles with the origin as the third vertex and adding their areas. This is totally natural if the origin is fully contained within the polygon:

{% include image.html filename="2018-08-06/output/05-triangles.svg" width="200px" %}

But signed area mean that this construction works even if the origin is outside the polygon, with the triangles overlapping, because their overlapping parts cancel perfectly:

{% include image.html filename="2018-08-06/output/06-triangles2.svg" width="200px" caption="The dark areas cancel out of the total sum, because the (negative) area of $$p_1 p_2\mathcal{O}$$ exactly cancels the excess positive areas in each of the other triangles $$p_2 p_3 \mathcal{O}, p_3 p_4 \mathcal{O}, p_4 p_0 \mathcal{O}$$, and $$p_0 p_1 \mathcal{O}$$."%}

The coordinate-invariance of this formula (that it works regardless of where $$\mathcal{O}$$ is) should be enough to motivate it as mathematically valuable. We like formulas that don't care about specific coordinate systems.

We're used to dealing with what are called _simple_ polygons -- polygons whose sides never overlap, so they surround a single region of space without any intersections. We can also consider _non-simple_ polygons, which are allowed to have their vertices or edges overlap or intersect. The shoelace formula continues to work if the polygon is non-simple, except we must understand that negatively-oriented regions subtract from the total sum instead of adding, which may not be totally intuitive:

{% include image.html filename="2018-08-06/output/07-nonsimple.svg" width="250px" caption="The total signed area here is zero, because the two oppositely-oriented components have the same magnitudes of areas, but opposite signs, so they cancel out."%}


---------

## 2. Oriented Angle

Related to the concept of oriented area is the concept of _oriented angle_, which is actually a bit more familiar. Oriented angles distinguish between "the angle between $$\b{a}$$ and $$\b{b}$$" and "the angle between $$\b{b}$$ and $$\b{a}$$", by insisting that we specify _counterclockwise_ angles (the way radians go) as positive:

{% include image.html filename="2018-08-06/output/08-angles.svg" width="250px" %}

This is very much like how the vector $$\bf{b-a}$$ is the negative of the vector $$\bf{a-b}$$. In fact it is appealing to think of oriented angles as some kind of curved vectors -- we can add and subtract 'angular' vectors just like regular vectors. In this example, evidently $$\angle \b{ab} + \angle \b{bc} = \angle \b{ac}$$, and this angle addition formula holds whether or not $$\b{c}$$ falls between $$\b{a}$$ and $$\b{b}$$:

{% include image.html filename="2018-08-06/output/09-angle-addition.svg" width="300px" %}


We want to think of angles as oriented because we can use them in formulas to get oriented areas as results. The cross product of two vectors $$\b{a}, \b{b}$$ gives the signed area of the parallelogram $$(\b{0}, \b{a}, \b{a+b}, \b{b})$$, regardless of their relative orientation:

$$\b{a} \times \b{b} = |a||b| \sin \phi \\
\b{a} \times \b{b} = |a||b| \sin (- \phi) = - |a||b| \sin \phi$$

----------

## 3. The Shoelace Formula in Displacements

The shoelace formula can be massaged into some other forms. Defining $$\b{d}_i$$ as the vector displacements of each side[^vector]:

[^vector]: I like to use boldface $$\b{d}$$ to refer to things that are definitely vectors, so adding them together is meaningful, as opposed to points $$p_i$$ which cannot be meaningfully added.

$$\b{d}_i = p_{i+1} - p_i$$

Which is just the same polygon labelled differently:

{% include image.html filename="2018-08-06/output/10-displacements.svg" width="150px" %}

Then we can write the area as:

$$\text{area}(P) = \frac{1}{2} \sum p_i \times \b{d}_{i} \tag{2}$$

Where $$\times$$ is a cross product. Since $$p_i \times (p_{i+1} - p_i) = p_i \times p_{i+1} - \cancel{p_i \times p_i} = p_i \times p_{i+1}$$, this is the same as (1). Essentially we are just referring to our triangles differently, by $$p_i$$ and $$\b{d}_i$$ instead of $$p_i$$ and $$p_{i+1}$$:

{% include image.html filename="2018-08-06/output/11-displacements2.svg" width="150px" %}

The $$\b{d}_i$$ vectors traverse the polygon starting at $$p_0$$:

$$p_j = p_0 + \sum_{i = 0}^{j-1} \b{d}_i$$


They form a closed loop ($$\sum_{i=0}^{n} \b{d}_i = \b{0}$$). Therefore we can eliminate the $$p_i$$ terms from the area formula entirely by writing them as sums of displacements (recalling that $$\sum_{i} p_0 \times \b{d}_i$$ cancels out because it equals $$ p_0 \times  \sum_{i} \b{d}_i = p_0 \times \b{0} = 0$$):

$$\begin{aligned} \text{area}(P) &= \frac{1}{2} \sum_{i} (p_0 + \sum_{j < i} \b{d}_j) \times \b{d}_i \\
&=\frac{1}{2} [ \sum_{i} p_0 \times \b{d}_i + \sum_{i}\sum_{j < i} \b{d}_j \times \b{d}_i ]\end{aligned}$$

$$ \text{area}(P) = \frac{1}{2} \sum_{i}\sum_{j < i} \b{d}_j \times \b{d}_i \tag{3} $$

This is the shoelace formula, rewritten to only use the vector displacements of the figure.

## 4. The Shoelace formula in Angles

Finally, we can write this in terms of just the side-lengths and exterior vertex angles of the polygon. 

We may describe the angles of a polygon in several ways. The first is by the interior angle $$\alpha_i$$ at vertex $$p_i$$, with the stipulation that this is always the angle measured counterclockwise from the first side in our oriented order, so that it is always the interior on positively-oriented simple polygons:

{% include image.html filename="2018-08-06/output/12-interior.svg" width="150px" %}

Interior angles are probably the most intuitive, but they perform less well in equations than the _exterior_ angle at each vertex, which is the angle between the vectors $$\b{d}_{i-1}$$ and $$\b{d}_i$$. Let's call them $$\theta_i$$, so $$\theta_i$$ is the exterior angle at the point $$p_i$$:

{% include image.html filename="2018-08-06/output/13-exterior.svg" width="150px" %}

Evidently $$\alpha_i + \theta_i = \pi$$. Also, for a simple polygon, the sum of all the angular displacements at every vertex must add up to $$2 \pi \equiv 0$$, because the angles make one complete circle.

$$\sum \theta_i = \b{0}$$

{% include image.html filename="2018-08-06/output/14-complete.svg" width="250px" %}


In a regular $$N$$-gon, each exterior angle must be equal, so $$\theta_i = \frac{2 \pi}{N}$$, which means the interior angles are $$\alpha = \pi - \frac{2 \pi}{N}$$ and the sum of the interior angles is $$N \alpha = N(\pi - \frac{2 \pi}{N}) = \pi (N-2)$$.

The area of a regular $$N$$-gon is created from $$2N$$ copies of the right triangle that has $$\frac{\alpha}{2}$$ as one of its angles, which gives various formulas for computing their area depending on what lengths you have:

{% include image.html filename="2018-08-06/output/15-regular.svg" width="200px" %}

We can see that these relationships should hold, in case you'd like to go calculating some values from the others:

$$\begin{aligned} \frac{L}{2} &= r \cos \frac{\alpha}{2}  \\
s &= r \sin \frac{\alpha}{2} \\
s &= \frac{L}{2} \tan \frac{\alpha}{2} \\
\text{perimeter} &= NL = 2 n r \cos \frac{\alpha}{2} \\ 
\text{area} &= \frac{1}{2} NsL \\
\text{area} &= \frac{1}{2} s \cdot \text{perimeter}
\end{aligned}$$



For a simple, positively-oriented polygon, the exterior angles add up to exactly $$2 \pi$$ radians. For non-simple polygons they may add up to any multiple of $$2 \pi$$ depending on how many clockwise or counterclockwise loops there are:

{% include image.html filename="2018-08-06/output/16-exterior2.svg" width="500px" caption="The first figure has $$\sum \theta_i = 2\pi$$, the second has $$\sum \theta_i = -2 \pi$$, and the third has $$\sum \theta_i = 0$$."%}



Each adjacent displacement vector $$\b{d}_i$$ differs from the previous vector $$\b{d}_{i-1}$$ by the exterior angle between them $$\theta_i$$.

{% include image.html filename="2018-08-06/output/17-exterior3.svg" width="125px" %}

Therefore we can find the angle between _any_ two displacement vectors $$\b{d}_i, \b{d}_j$$ by adding up all the exterior angles between them: (with the sum wrapping around if need be, and with addition be modulo $$2 \pi$$):

$$\theta_{ij} = \sum_{i \leq k < j} \theta_k$$


We can use this in $$(3)$$ to get a version of the area formula expressed only in lengths and exterior angles:

$$\begin{aligned}
\text{area}(P) &= \frac{1}{2} \sum_{i}\sum_{j < i} \b{d}_j \times \b{d}_i \\
&= \frac{1}{2} \sum_i \sum_{j < i} | \b{d}_j | | \b{d}_i | \sin (\theta_{ij}) \\
\end{aligned}$$

$$\text{area}(P) = \frac{1}{2} \sum_i \sum_{j < i} | \b{d}_j | | \b{d}_i | \sin (\theta_{ij}) \tag{4}$$

By labeling the side lengths $$\| \b{d}_i \| $$ as $$a_{i+1}$$ and expanding the sum over $$i$$ before $$j$$, we can get to a form which which is presented [on Wikipedia](https://en.wikipedia.org/wiki/Polygon#cite_ref-lopshits_6-0):

$$\begin{aligned} \text{area}(P) &= \frac{1}{2} (a_1 [a_2 \sin (\theta_1) + a_3 \sin (\theta_1 + \theta_2) + \ldots a_{n-1} \sin(\theta_1 + \theta_2 + \ldots + \theta_{n-1}) ] \\
&+ a_2 [ a_3 \sin (\theta_2) + a_4 \sin (\theta_2 + \theta_3) + \ldots + a_{n-1} \sin (\theta_2 + \theta_3 + \ldots + \theta_{n-1})] \\
&+ \dots + a_{n-2} \sin (\theta_{n-1})) \tag{5}
\end{aligned}$$

This and (4) are two ways of expressing the same idea: the area of a polygon in terms of scalar lengths and angles. I am not sure when you would ever want to use these, though -- these loops have $$O(N^2)$$ steps in them, while the original formula (1) involved only $$N$$.

--------

## 5. A Summary of Lopshits

As mentioned in the intro, the Wikipedia article on [polygons](https://en.wikipedia.org/wiki/Polygon) sources formula (5) from *Computation of Areas of Oriented Figures* by A.M. Lopshits, published 1959. It turns out some other people have chased that link and also cited this text, but I could not get my hands on a .pdf version, so I got it from the university library.

If you are curious what it contains, here's an outline. The short version is: not much. I wanted more formulas and ideas in the vein of (5), but much deeper. Turns out, though, that's it's a mostly pedagogical text that reaches that formula as its final result after spending 40 pages on the concept of oriented area and related (elementary) geometric proofs.

<span style="text-decoration:underline;">Outline of *Computation of Areas of Oriented Figures* by AM Lopshits</span>

**Chapter 1. Measurement of the Area of an Oriented Figure**
1. Oriented triangles are a lot like regular triangles, but oriented.
2. Oriented triangles have oriented areas.
	* The simplest way to see that this might be useful is this:
	* Consider a triangle $$ABC$$. If $$A'$$ is a point on the line segment $$BC$$, then $$\text{area}(ABC) = \text{area}(A'AB) + \text{area}(A'CA)$$.<br/>{% include image.html filename="2018-08-06/output/18-triangle.svg" width="150px" %}
	* If we allow ourselves _oriented_ triangles and areas, this remains true even if $$A'$$ is a point on the line $$\overrightarrow{BC}$$, but _outside_ the triangle:<br/>{% include image.html filename="2018-08-06/output/19-triangle2.svg" width="200px" %}
	* Lopshits makes all of these points arduously, in multiple theorems with elaborate proofs. I suspect the mid-century Russians loved proving things arduously.
3. The area of an oriented triangle can be calculate using the shoelace formula for any choice of origin $$\mathcal{O}$$.
	* this is carefully proven using previous theorems.
4. Oriented polygons are oriented collections of points. The shoelace formula gives their area for any choice of $$\mathcal{O}$$.
	* this is also carefully proven using previous theorems.
5. Some examples and exercises. The most interesting set is like this (for $$N=8,12,20$$):

	"A regular dodecagon $$A_1A_2 \ldots A_{12}$$ is inscribed in a circle. The polygon $$A_1 A_6 A_5 A_{10} A_9 A_2$$ has three points of self-intersection, $$C_1$$, $$C_2$$, $$C_3$$. Prove that the area of the triangle $$C_1 C_2 C_3$$ is three times the area of the triangle $$A_1 A_2 C_1$$."<br/>{% include image.html filename="2018-08-06/output/20-dodecagon.svg" width="250px" %}

<aside class="toggleable" id="solution" placeholder="<b>Solution</b> <em>(click to expand)</em>">
Designate the center of the polygon as the origin $$\mathcal{O}$$. The angle between adjacent points is $$\angle \mathcal{O} A_2 A_1 = \frac{360 \degree}{12} = 30 \degree$$. Recall that the area of an angular segment with angle $$\theta$$ of a circle is $$\frac{R^2}{2} \sin \theta$$.

Noting that $$\mathcal{O} A_1 A_6$$ has the opposite orientation of $$\mathcal{O} A_1 A_2$$, the total signed area $$S$$ of the figure $$A_1 A_6 A_5 A_{10} A_9 A_2$$ is:

$$\begin{aligned} S &= 3[\text{area}(\mathcal{O}A_1 A_6) + \text{area}(\mathcal{O} A_2 A_1)] \\
&= 3 \frac{R^2}{2} [ -\sin 150 \degree +\sin 30 \degree ] \\
&= 0 \end{aligned}$$

But this can also be written as 

$$S = \text{area}(C_1 C_2 C_3) + 3 \cdot \text{area}(C_1 A_1 A_2)$$

Which gives:

$$3 \cdot \text{area}(C_1 A_1 A_2) = -\text{area}(C_1 C_2 C_3)$$

</aside>

**Chapter 2. The Planimeter**
1. This chapter entirely describes the workings of a device called the *planimeter*, which is used to measure [signed] areas of printed curves via, essentially, the shoelace formula acting on a polygonal approximation.
I do not care about planimeters, though I'm sure this was interesting in 1959.
In fact it turns out there are multiple kinds of planimeters out there, each of which the reader is invited to deeply contemplate.
There is one theorem I found interesting, though:
2. "Imagine a directed segment $$\overrightarrow{AB}$$ in the plane. Let us move it around the plane, finally bringing it back to its original position. In this motion the end $$A$$ and $$B$$ will of course trace out closed curved $$L_A$$ and $$L_B$$. Also, $$\overrightarrow{AB}$$ will sweep out an oriented area $$S$$."
	Theorem:

	$$\text{area}(S) = \text{area}(L_A) - \text{area}(L_B)$$

	This is simple to convince yourself of -- as oriented areas, we must have $$\text{area}(S) = \text{area}(L_A) + \text{area}(L_B)$$, and one of the areas must be oppositely-oriented so we may pick $$\text{area}(L_B)$$ to be negative. 

**Chapter 3. Computation of the Area of a Polygon Useful in Surveying**
1. This section primarily produces my formula (5). The argument for its use in surveying is that the formula uses only scalar lengths and angles, meaning that one can find the area of unwieldy regions (say, a plot of land) by measuring all the lengths and angles individually and then computing the result.
2. But before getting to that formulation, Lopshits introduces the concept of _vectors_. I am not understanding what level this text is meant for.
3. Derives of equation (4), though without summation formulas.
4. Oriented angles work better than regular ones for this calculation.
5. Lot of words about computing what I have called $$\theta_{ij}$$.
6. Derivation of equation (5), for which Lopshits was cited on Wikipedia.

And that's pretty much... it. I'm a little disappointed.

---------

## 5. The Shoelace Formnula as an Area Integral

It's worth discussing how the shoelace formula is related to integral calculus. After all, if anything is the 'canonical' way to calculate area, it's an area integral: $$\text{area}(P) = \iint_P 1 \, dx dy$$.

[Green's theorem](https://en.wikipedia.org/wiki/Green%27s_theorem) says how we can translate an area integral over a region into an integral over its boundary. Specifically, it says that an area integral over a region is equivalent to certain a line integral around the boundary of the region. If $$L$$ and $$M$$ are functions with continuous partial derivatives in a region $$D$$ bounded by an (oriented!) curve $$C$$, then:

$$\oint_C L \, dx + M \, dy = \iint [ \p_x M - \p_y L ] dx dy$$

For the simple case of $$\iint 1 \, dx dy$$, we just need to find any $$L,M$$ which have $$\p_x M - \p_y L = 1$$. This is easily done with either $$M(x,y) = x$$, $$L(x,y) = -y$$, or any combination of them, like $$\frac{1}{2} (M + L)$$. Therefore each of these gives an integral for area:

$$\begin{aligned} \text{area}(D) &= \iint_D 1 \, dx dy \\
&= \oint_C x dy \\
&= \oint_C -y dx \\
&= \frac{1}{2} \oint_C x \, dy - y \, dx = \frac{1}{2} \oint_C (x,y) \times (dx, dy) \end{aligned}$$ 

The connection is this:

Suppose we are computing $$\frac{1}{2} \oint_P (x,y) \times (dx, dy)$$, ie, computing a line integral around the boundary of one of the oriented polygons $$P$$ from before. Then, for the entire segment of the integral along the side $$p_i p_{i+1}$$, the tangent direction is parallel to $$\b{d}_i$$. Obviously these sums of 'infinitesimal' triangles along the side should add up to give the finite-sized triangle area of $$p_i \times \b{d}_i$$:

{% include image.html filename="2018-08-06/output/21-integral.svg" width="200px" %}

To be a bit more explicit, we can parameterize the curve along a side $$p_i p_{i+1}$$ by $$t \in [0,1]$$, so that $$(x,y) = p_i + t \b{d}_i $$. Then $$(dx, dy) =\b{d}_i dt$$, and:

$$\int_{p_i}^{p_{i+1}} (x,y) \times (dx, dy) = \int_0^1 (p_i + t \b{d}_i) \times \b{d}_i \, dt = p_i \times \b{d}_i$$

Adding the contributions from every side give:

$$\frac{1}{2} \oint_C (x,y) \times (dx,dy) = \frac{1}{2} \sum_i p_i \times \b{d}_i$$

----

While we're at it, maybe we can come up with an 'integral form' of (3) or (4). Naively, it should look something like this, right?

$$\text{area}(D) = \frac{1}{2} \sum_i \sum_{j < i} \b{d}_j \times \b{d}_i \Lra \frac{1}{2} \int_0^1 \int_0^t \; \dot{\vec{\gamma}}(s) \times \dot{\vec{\gamma}} (t) \, ds \, dt$$

Where we parameterize the curve $$C$$ enclosing our region as $$\vec{\gamma}(t)$$ for $$t \in [0, 1]$$.

This is just taking the integral formula $$\frac{1}{2} \oint_C \vec{\gamma}(t) \times \dot{\vec{\gamma}}(t) dt$$ and replacing $$\vec{\gamma}(t)$$ with $$\int_0^t \dot{\vec{\gamma}}(s) ds$$, which should be fine as long as [*mumble*]. If we separate $$\vec{\gamma}(t)$$ into $$r(t)$$ and $$\theta(t)$$ we should get a version of (5), also.

-------

## 6. The Shoelace Formula in Higher Dimensions

The fact that the shoelace formula is a consequence of Green's theorem means that there should be a way to take it to higher dimensions. Green's theorem readily generalizes to [Stoke's Theorem](https://en.wikipedia.org/wiki/Stokes%27_theorem) in arbitrary spaces, which says that the integral of a function (or differential form) over a closed surface can be equated to the integral of its derivative through the enclosed volume:

$$\oint_{S} f = \int_V df$$

This means that:

* the shoelace formula should continue to calculate the areas of oriented polygons in $$N>2$$ dimensions
* there should be an analog to the shoelace formula for computing volumes, 4-volumes, etc

For now I will mention how to calculate area in 3D, because it looks a little different than in 2d.

**Area of a figure in 3d**: Suppose we want to compute the area of the triangle:

$$T = (t_1,0,0), (0,t_2,0), (0,0,t_3)$$

We can compute the shoelace answer:

$$\begin{aligned} \text{area}(T) &= \frac{1}{2} \big[ (t_1,0,0) \times (0,t_2,0) + (0,t_2,0) \times (0,0,t_3) + (0,0,t_3) \times (t_1,0,0) \big]  \\
&= \frac{1}{2} \big[ (0,0,t_1 t_2) + (t_2 t_3, 0, 0) + (0, t_3 t_1, 0)\big] \\
&= \frac{1}{2} (t_2 t_3, t_3 t_1, t_1 t_2)
\end{aligned}$$

But that's... not a scalar. What went wrong?

The answer is that this the area of $$T$$ represented as a _vector_, which is normal to the plane of $$T$$. It tells you _more_ than the area -- it also tells you what direction the area faces. To get to the _scalar_ area, though, you have to take its magnitude:

$$\text{area}(T) = | \frac{1}{2} (t_2 t_3, t_3 t_1, t_1 t_2) | = \frac{1}{2} \sqrt{t_2^2 t_3^2 + t_3^2 t_1^2 + t_1^2 t_2^2}$$

But you lose the sign when taking the magnitude -- the direction of that vector was what was telling us the orientation. In 3D, it's meaningless to say that a surface is 'positively' oriented -- what if it's orthogonal to the $$XY$$ plane? Should that be positive or negative? What if we flip it over? Orientation cannot be an intrinsic property of a shape if it changes as we rotate things!

Instead we can just talk about how things are oriented _relative_ to each other. A figure on the $$XY$$ plane is either oriented in the $$\b{z}$$ direction or the $$-\b{z}$$ direction. In 2D we drop the $$\b{z}$$'s and just call this positive and negative. In 3D, though, _volumes_ have an absolute concept of orientation, but in 4D they would not -- they would just end up oriented to the, say, $$+\b{w}$$ or $$-\b{w}$$ axes!



The shoelace formula used on a general polygon in 3D will work the same way, giving a vector. Note that this does require the polygon to be already known to be _planar_, or the answer you get will be meaningless.

<aside class="toggleable" placeholder="<b>Aside</b>: Note on coplanarity <em>(click to expand)</em>">

How do you tell if a list of points $$\{p_i\}$$ is coplanar? 

Well, non-degenerate triangles always are, because it takes three points to define a plane. But it's easy in general: since the line between any pair of the points $$(p_i, p_j)$$ should fall on that plane, all of those lines should have cross products with each other that point _out_ of the plane. 

So: first, find any three points $$(a,b,c)$$ from the set which are not co*linear*, and compute $$\b{q} = (b-a)\times (c-a)$$. This vector $$\b{q}$$ definitely points out of the plane, so it should be orthogonal to any vector _on_ the plane -- such as the vector from $$a$$ to any other point, $$(p_i - a)$$. So check that $$\b{q} \times (p_i - a) =0$$ for every $$i$$. That's O(N) computations in total, no problem.

</aside>

By the way -- if you want to compute the surface area of a figure by summing the areas of each side, go right ahead, but make sure you normalize each side's area to be positive first. The surface area _vectors_ of a closed figure in 3D will always cancel out to $$\b{0}$$. (Why? Because of Stoke's theorem: $$\iint_{S} 1 \, d\b{S} = \iiint_V d(1) dV = 0 $$.)

------

As for volumes -- that will have to wait for another article. Higher-dimensional shapes like polyhedra are much harder to deal with than polygons, primarily because it's just hard to _represent_ them. It's not enough to supply a list of vertices $$\{p_i\}$$, because you also needs to specify which sets of vertices make each face, and to ensure that the faces are oriented consistently: if the edge $$\overrightarrow{uv}$$ appears on one face, then $$\overrightarrow{vu}$$ must appear on the other face that shares that edge.


I will say only that if you _do_ have a list of oriented polygonal faces $$\{F_i\} = \{\{f_{ij}\}\}$$, then the volume of the pyramid created by a face with the origin is given by 

$$\begin{aligned} \text{volume}(F_i) &= \frac{1}{6} f_{i0} \cdot \sum_j f_{ij} \times f_{i,j+1} \\
&= \frac{1}{3} f_{i0} \cdot \text{area}(F_i)
\end{aligned}$$

($$f_{i0}$$ just has to be any point on the face -- we're summing the volumes of the tetrahedrons $$(\mathcal{O}, f_{i0}, f_{ij}, f_{i,j+1})$$, and we need any third point in order to turn areas into volumes. $$\text{area}(F_i)$$ in this case is the area _vector_, not the scalar.) 

Then the volume of the whole figure is given by:

$$\text{volume}(F) = \sum \text{volume}(F_i)$$

----------

## 7. Conclusion

That's all I've got, for now. Hope it's useful, interesting, or otherwise not a total waste of time. I hope to revisit higher-dimensional shoelace-type formulas at some point, but it'll have to wait. This was exhausting (well, making it pretty was).

I made the diagrams using [Tikz](https://en.wikipedia.org/wiki/PGF/TikZ), which is what all those fancy diagrams in LaTeX documents and textbooks are made in, and it was a lot of work but I'm glad I've started to learn how to do it. The process of conveniently importing Tikz images into websites, though, is ... not enjoyable. I would be so excited if there was a project like [Mathjax](https://www.mathjax.org/) that extracted a subset of Tikz for inline web-document creation. 