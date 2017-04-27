---
layout: article
title: "Polygon Geometry"
math: true
footnotes: true
category: cache
---

*Meditations on geometry and integration, just for fun*

## 0

Suppose we have a $$n$$-sided polygon $$P$$ in $$\mathbb{R}^{2}$$ consisting of $$n$$ points, $$\{p_{i}\}$$. P is assumed (for now?) to be non-degenerate and simple (non-intersecting). (Throughout this page let $$p_{i+1}$$ be interpreted as $$p_{i+1 \text{ mod } n}$$ wherever reasonable.) We can describe the individual line segments $$P$$ as $$p_{i}p_{i+1}$$, and the vectors of these line segments as $$\mathbf{v}_{i} = p_{i+1} - p_{i}$$. In an arbitrary coordinate system $$\mathcal{C}$$ with origin $$\mathcal{O}$$, the coordinates of a point are given by the position vector $$p_{i} = (p_{i,x}, p_{i,y})$$, and vectors by the tangent vector $$\mathbf{v}_{i} = (v_{i,x}, v_{i,y})$$ (we'll omit the $$i$$'s when they're obvious).

The total displacement of the $$\mathbf{v}_{i}$$ set is of course 0, since we end up where we started:

$$0 = \sum \mathbf{v}_{i}$$

The perimeter of P is given by

$$\text{perimeter}(P) = \sum \vert \mathbf{v}_{i} \vert = \sum (v_{x}^{2} + v_{y}^{2})^{\frac{1}{2}}$$ 

$$= \sum ((p_{i+1,x} - p_{i,x})^{2} + (p_{i+1,y}-p_{i,y})^{2})^{\frac{1}{2}}$$

We assign P an orientation: if the points $$p_{i}$$ proceed in the counterclockwise direction (ie, the positive-radian direction), then the orientation is positive.

Any cyclic rotation of the points of $$P$$ is equivalent to $$P$$: $$\{p_{i}\} = \{p_{i+k \text{ mod } n}\}$$. That is, (possibly self-intersecting) polygons are equivalence classes of non-degenerate sequences of points, or equivalently, orbits of cyclic permutations on sequences of unique points. The points of $$p$$ in the opposite order, and any cyclic rotation thereof, evidently gives $$-P \leftrightarrow \{p_{-i + k \text{ mod } n}\}$$.

-----------

The signed area of P is given by

$$\text{area}(P) = \sum \frac{1}{2} p_{i} \wedge p_{i+1}$$

Each term of this sum is the area of the triangle formed by $$\mathcal{O}$$, $$p_{i}$$, and $$p_{i+1}$$. Depending on where $$\mathcal{O}$$ is, much of this might be outside the polygon -- but there will be two contributions for any area outside of the polygon, one positive and one negative, so they cancel out. Areas within the polygon will end up added once in total. (This is the [shoelace formula](https://en.wikipedia.org/wiki/Shoelace_formula), which is a discrete retelling of [Green's theorem](https://en.wikipedia.org/wiki/Green%27s_theorem).)

(Note that summations are discrete versions of integrals, so there's probably a sense in which this is literally a statement of the area of a curve also, if we overload some symbols somewhat. TODO)

We have $$\text{area}(-P) = -\text{area}(P)$$.

If $$P$$ is simple and convex, we can pick a point on the boundary or interior as $$\mathcal{O}$$; the triangles formed by $$\mathcal{O}, p_{i}, p_{i+1}$$ will then all lie within the polygon and will not overlap or cancel each other out, and all the non-zero triangle areas will be have the same sign as the total area of the polygon.

The [Isoperimetric Inequality](https://en.wikipedia.org/wiki/Isoperimetric_inequality) tells us that 

$$\text{perimeter}(P)^{2} \geq 4 \pi \vert \text{area}(P) \vert$$

With equality if P is a circle (or, since P is a polygon, with equality approached as P approaches a circle). 

--------

## 1

It would be nice to have a formula for the *oriented* perimeter, that can take negative values, if such a concept makes sense. This is a function like perimeter / arc length, except that it would be negated when we take the opposite orientation of a curve. Problem is, we compute lengths with square roots, and we'd have to have a method to indicate that we should select the negative square root if $$\mathbf{v}_{i}$$ is .. what? pointing the wrong direction? We would need a way to capture "if the polygon boundary has the interior of the polygon on its right, pick a negative sign".

Would it make any sense to have for $$-P$$ to have $$perimeter(-P) = -perimeter(P)$$? At first glance, I'd say 'yes' -- we have a well-defined concept of the orientation of a curve, depending on whether it goes clockwise or counterclockwise. But it turns out be very hard to define -- an 'integral' form of such a perimeter function, that has the property that $$l(A + B) = l(A) + l(B)$$. That is, when we conjoin curves we add their lengths. Since from a single part of a curve $$A$$ we *can't* tell what the total orientation of the curve is, the integral $$l(A)$$ becomes meaningless until we've integrated over a closed curve -- and therefore, this concept of length is meaningless on *non*-closed curves, if it's meaningful on closed curves.

This is similar to how our formula for area $$area(P) = \frac{1}{2} \sum p_{i} \wedge p_{i+1}$$ is meaningless on the individual segments: we have to know how the parts are going to end up canceling out to make sense of pieces. But for area, that's perfectly reasonable: we don't expect to have a concept of area for non-closed curves. For length it's pretty undesirable.

(At this point I spent a long time trying to come up with a way to calculate an oriented perimeter -- and concluded that it's not really possible in any elegant way.
Basically, the problem is that $$-P$$ is _another polygon_, and as a curve it doesn't really have a concept of orientation at all, since in 'piecewise curve space', $$B$$ and $$-B$$ are perfectly valid entries. On the other hand, if we imagine our plane as having a canonical orientation, there's no part of the plane that corresponds to the opposite orientation -- so we end up having something like $$X \oplus \bar{X}$$, where $$\bar{X}$$ is the 'oppositely oriented version of $$X$$', and oppositely-oriented areas live in $$\bar{X}$$, while oppositely-oriented curves do just fine living in $$X$$. That is, when we're integrating (ie doing _anything like summing_) something around a curve, the orientation comes from _the integral_, not the curve itself. Whereas for areas, the orientation is a concept attached to the area in a coordinate-free way. Need to put this in better terms.)

It may be productive to consider instead what the components of the area integral mean. How can we assign meaning to $$\frac{1}{2} p_{i} \wedge p_{i+1}$$ terms without the rest of the integral being present? This is the area of the oriented triangle created by $$\mathcal{O}, p_{i}, p_{i+1}$$. It just so happens that areas within the polygon's boundaries will end up not canceling out, while areas outside will. It's not hard to see how this works, but it still feels surprising and unintuitive.

The interior of $$P$$ can be defined as points around which $$P$$ has a winding number that isn't 0. And, of course, the area is negative if those winding numbers are negative and positive otherwise. So it stands to reason that if we have an area measure on the whole plane, and we integrate against it the winding number of $$P$$, we should get area: $$area(P) = \int \gamma_{P}(\mathbf{v})d\mathbf{v}$$. By Stoke's Theorem $$\int_{dP} f = \int_{P} df$$ we can turn this into an integral on the boundary, if we can find a differential form whose exterior derivative is the winding number of $$P$$ at each point. We could also bring in the explicit formula for winding number, $$\gamma_{C}(p) = \frac{1}{2\pi} \int_{C} d\theta$$.

--------

## 2

Whatever our conception of lengths and areas (and N-volumes, if we let our dimensionality go up), there are a couple obvious rules they should follow:

1. They should be invariant under translation, rotation, and reflection of the space.
2. They should be composable -- the N-volumes of two conjoined objects should be the volumes of the separate objects, summed.
3. The N-volume of nothing should be 0: $$\mu(\emptyset) = 0$$

(not that we necessarily want to require that our volumes are real numbers or anything like that -- but whatever space we use needs a concept of 0, since we definitely want $$V(A \cup \emptyset) = V(A) + 0 = V(A)$$.)

Since we quite like our oriented areas, we won't ask that these be strictly non-negative.

These requirements are wrapped up in the concept of [measure](https://en.wikipedia.org/wiki/Measure_(mathematics)) -- when you perform an integral, you're performing it against a measure, which is basically the idea of enforcing the requirement that $$\int_{a}^{c} d\mu = \int_{a}^{b} d\mu + \int_{b}^{c} d\mu$$. There's a lot of rigor required to make this work in a sensible way on infinite collections of sets, but I'm not too interested in that right now. [Signed measure](https://en.wikipedia.org/wiki/Signed_measure) extends this to allowing negative areas, so that's what we're actually using.

My understanding of the concept of *integration* at the most abstract level is this:

* Suppose you have a topological space $$T$$ that has a concept of signed measure; that is, you can assign volumes to subsets of the space. If you have a function $$f: T \rightarrow A$$ that assigns values in $$A$$ to *elements* of $$T$$, there's a canonical way to extend it to assign values to *subsets* of $$T$$ with the requirement that $$f(t_{1} \cup t_{2}) = f(t_{1}) +_{A} f(t_{2})$$, where $$+_{A}$$ is "the concept of addition in A". Usually A is a field, and usually the real numbers or a real vector space, but that's not explicitly required. What's required is the ability to 'lift' the concept of addition on $$T$$ to addition on $$A$$, and that means addition on $$T$$ has to have certain measure-theoretic properties. 

The *implementation* of this behavior requires that addition on T (and A) obey certain compatible properties, which constrains T's subsets to a $$\sigma$$-algebra, and constrains A to have certain properties as well, though I'm not sure what they are right now (certainly associativity is a requirement).

(Personally, at least for now, I'm super okay with not even considering volumes of infinite sets or pathological analytical constructions like cantor sets. I'd rather treat line segments and whatnot as their own objects and try to fanangle a definition that makes intuitive sense, instead of reaching it through analysis.)

At this point we're perfectly happily performing integration on an ordered list of points -- such as the integers. The integral of a function $$f(\mathbb{Z})$$ is a summation: $$\int_{s \subseteq T} f  d\mu = \sum_{s_{i} \in S} f(s) \mu(s)$$. If $$s$$ is a single closed interval in $$S$$, then we can construct the differential $$df(s_{i}) = f(s_{i+1}) - f(s_{i})$$, giving $$\int_{s} df = f(s_{0}) + \sum_{s_{i}} df(s_{i}) = f(s_{n}) - f(s_{0}) = \int_{ds} f $$. This is a sort of canonical way to lift $$f$$ from being defined on values to being defined on intervals". (It's also the the discrete version of the fundamental theorem of calculus / Stoke's theorem.) This is naturally extended to finite collections of intervals, etc. The measure $$\mu$$ lets us pretend like sets $$\{s_{i}\}$$ are single objects $$\mathcal{S} = \{s_{i}\}$$ and come up with a fairly sensible meaning for $$f(\mathcal{S}) = \int_{s} df$$.


Any operation $$O: T\rightarrow T$$ leads to a 'directional derivative', $$\partial_{O}f$$. For example, the translation operation $$R(s_{i}) = s_{i+1}$$ leads to $$\partial_{R}f = df$$, with $$\partial_{R} f(s_{i}) =  f(Rs_{i}) - f(s_{i}) = df(s_{i})$$. A second derivative would be $$\partial_{R}^{2}f(s_{i}) = \partial_{R}df(s_{i}) = df(s_{i+1}) - df(s_{i}) = f(s_{i+2}) - 2f(s_{i}) + f(s_{i})$$. (Note that this isn't the same as $$\partial_{R^{2}}f = f(s_{i+2}) - f(s_{i})$$... I think!). This is the [finite difference calculus](https://en.wikipedia.org/wiki/Finite_difference), and if you change the $$+1$$'s to $$+h$$'s and stick it inside a $$\lim_{h \rightarrow 0}$$ it becomes calculus on $$\mathbb{R}$$.

$$Rf(s_{i}) = f(s_{i+1}) - f(s_{i})$$ can be written as $$Rf - If = (R-I)\circ f$$, which is a compelling form. It seems that given an operator like $$R$$, there are two natural ways for it to act on $$f(s_{i})$$: as $$R \circ f := f(R(s_{i}) = f(s_{i+1})$$, or as $$\partial_{R}f = (R-I)\circ f = R\circ f - I\circ f = f(s_{i+1}) - f(s_{i})$$.

It's reasonable to equate vectors with operators: $$R_{1}: s_{i} \rightarrow s_{i+1}$$ is the 'unit vector'. $$R^{2}: s_{i} \rightarrow s_{i+2}$$ is something like $$2\mathbf{x}$$, then, since the result of each is translation by $$2$$. 

In continuous spaces like $$\mathbb{R}^{2}$$, vectors $$a\mathbf{x} + b\mathbf{y}$$ will associate to translation operators $$(x,y)\mapsto (x+a, y+b)$$. This is the normal interpretation in differential geometry: vectors and vector fields are treated directional derivatives, with $$\mathbf{v}f \leftrightarrow \partial_{\mathbf{v}} f = \mathbf{v} \cdot \nabla f$$. The bivector $$\mathbf{x} \wedge \mathbf{y}$$ is the rotation operator that takes $$\mathbf{x} \mapsto \mathbf{y}, \mathbf{y} \mapsto -\mathbf{x}$$. Any operator that makes sense on the entire manifold should be usable as a derivative as well.

------------

As far as I can tell, _linearity_ isn't required as a property of integrals at all yet. The concept of multiplication hasn't even been mentioned, in either $$T$$ or $$A$$. _If_ it exists in A, you ought to support it, because you should be able to integrate elementwise operations in $$A$$, such as $$\int_{t} af+bg d\mu$$), but I really don't think it's necessary. Additionally (oddly), if $$T$$ is treated as a vector space, allowing $$ct_{1}$$, you ought to support $$\int_{at_{1} \cup bt_{2}} f d\mu = \int_{t_{1}} af d\mu + \int_{t_{2}} bf d\mu$$. And, actually, the reason the coefficients 'escape' the integrals $$at_{1}, bt_{2}$$ is that any sensible notion of measure on a space that supports scalar multiplication has to have $$d\mu(ct) = c d\mu(t)$$, and we'll require that the underlying scalar $$c$$ exist in both $$A$$ and $$T$$ (we could also translate it as well, but let's not bother). And this ends up being what always happens, in a sense: if you can integrate over an interval $$t$$, you ought to be able to just _do it twice_, and that's the meaning of integrating over $$2t$$.

So what we want when integrating over $$\mathbb{Z}$$ or $$\mathbb{R}$$ is an vector space of intervals, letting us write $$c\mathbf{u} + d\mathbf{v}$$. The algebra on these follows naturally: for example, $$a(0,1) - b(0,2) = (a-b)(0,1) - b(1,2)$$. It's also natural to fit points into the model, so we get a hierarchy of objects: points, line segments, polygons, polyhedrons, etc, that is, the set of finite [simplicial complexes](https://en.wikipedia.org/wiki/Simplicial_complex) (these are unions of simplexes, which are vertices, line segments, triangles, tetrahedrons, etc). It's [common](https://en.wikipedia.org/wiki/Simple_function) to create linear combinations of these, anyway.

More generally, we could let ourselves incorporate curves to our building blocks of shapes, giving an algebra of finite unions of curves; I'm just as happy multiplying and adding and unioning curves as segments. For now, though, it's probably safest to stick with polygons, so we'll restrict ourselves to finite unions of line segments. And, actually, contour integrals in complex analysis seem pretty similar to the discussion of discrete integration: given a contour C, the contour integral $$\oint_{C} f dz$$ is naturally interpreted as $$f(C)$$. More on that later.

## 3

I've found [various](https://golem.ph.utexas.edu/category/2008/02/metric_spaces.html) [discussions](http://www.maths.ed.ac.uk/~tl/docs/Schanuel_Length_of_potato.pdf) of the concept of area on simplexes, and its relationship to [Euler characteristic](https://en.wikipedia.org/wiki/Euler_characteristic). They also find it useful to consider the endpoints of intervals / segments / curves as separate 0-dimensional objects, and attach units (say, *m*), to lengths and areas. We'll talk about a concept of 'magnitude', labeled $$\mathcal{M}(P)$$, that will be a sum of area, 'length', and 'number' (and higher volumes in higher dimensions) at once, using the units *m* to distinguish between each. *Number* has no units, length *m*, area $$m^{2}$$, etc.

Points are unitless, so the magnitude of a point $$p$$ is 1, of *n* points is $$n$$, and of a linear combination of points $$c_{i}\mathbf{p}_{i}$$ is $$\sum c_{i}$$.

An open line segment has magnitude $$L m$$, where $$L$$ is its length. A closed line segment is an open line segment plus two vertices, so $$\mathcal{M}(l)= Lm + 2.

(Actually, the Schanuel paper above wants to say that closed line segments have $$\mathcal{M}(l) = Lm + 1$$, which seems wrong to me. Confused about this.)

An rectangular area with no boundaries or vertices but dimensions $$l, w$$ has magnitude $$lw m^{2}$$. If we 'construct it' (via, I suppose, [Minkowski summation](https://en.wikipedia.org/wiki/Minkowski_addition)) from two closed line segments, we have $$\mathcal{M}((am + 2) \otimes (bm+2))= ab m^{2} + (2a + 2b)m + 4 = area + perimeter + number$$, which (somewhat suprisingly) makes a lot of sense.

If we cleave a line segment $$[0, 2l]$$ in two, creating $$[0, L] \cup (L, 2L]$$, the magnitudes are $$Lm + 2 + Lm + 1 = Lm + 3$$, which means we created an extra point by accident. Clearly the correct sum operation is $$[0, L) + (L, 2L] = [0, 2L]$$. So this is _not_ the same as the set operations; line segments do not require points to be 'closed' when they touch. This makes sense, I think: in order to have no point in the middle after the sum, we would need to add a positive and negative point, so $$[0, L] + [L, 2L] - 2(L) = [0, 2L]$$, and this plays correctly with magnitude.

-------

Observation:
If we converted all scalar coefficients to 1, and (abusing notation) set $$m=-1$$, then $$(area) m^{2} + (perimeter) m + (number) \rightarrow c_{2} - c_{1} + c \approx \chi (\{c_{i}\})$$, the Euler characteristic, where $$c_{i}$$ is the count of objects of dimension $$i$$. In doing so we have converted terms like $$(a+b)m^{n}$$ to $$(1+1)(-1)^{n}$$, which is a strange operation. It's not really being performed on magnitudes directly, since we would be treating $$a+b$$ as a single number. It's before that, when they're still separate objects in the simplex vector space. What's happening is $$\chi(\mathbf{a} + \mathbf{b}) = 2(-1)^{n}$$.

$$\chi$$ doesn't have a clean form under the addition operation, but it does play well with unions and intersections. ..

(section on Euler characteristic?)
(Euler characteristic as measure.)

--------

## 4

I suspect that there's another oft-ignored 'invariant' concept that is useful for probing representations of geometry: the projection operation.

Consider $$\mathbb{R}^{2}$$ and a distinguished line, such as the $$\mathbf{x}$$-axis. There's a canonical way to project vectors onto it via the dot product: $$\mathbf{v} \rightarrow (\mathbf{v} \cdot \hat{\mathbf{x}}) \hat{\mathbf{x}}$$, which I'll write more concisely as $$\mathbf{v}_{\mathbf{x}}$$ (and sometimes forget to write in bold when it's annoying).


--------
projections as ~dot products. determinants, 0s.

## 5

Steiner-Minkowski, Isoperimetric, etc

## 6

Projective representations, A^B^C <=> A^B + B^C + C^A

## 7

Contour integration, inner products, analytic as simplex
