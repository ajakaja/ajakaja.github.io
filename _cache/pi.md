---
layout: article
title: "Pi"
math: true
footnotes: true
category: cache
---

*Sketch of a train of thought*

## 1

I'm indulging a compulsion to try to find the 'true source' of the value of $$\pi = 3.141592\ldots$$. I feel like it is more fundamental than the colloquial definition:

* $$\pi$$ is the empirically-measured value of the ratio between a circles' circumference and diameter

Certainly this definition doesn't let us immediately compute the value of the $$\pi$$.

Moreover, $$\pi$$ seems to be related to 'the interplay between area and length'. And these are already axiomatized concepts. What's the smallest number of axioms we need to have the value of $$\pi$$ emerge? And what's the 'minimal' way to compute it?

True, almost all of $$\pi$$'s appearances in math are related to circles. But it seems like almost all of them are built in systems where you use continuous functions and arc length integrals. If there was a theorem that involved $$\pi$$ but applied entirely to a *discrete* geometry -- say, polygons on a grid, then it would seem like $$\pi$$ is immediately 'more fundamental' than continuous-number calculus. Likewise if we could find theorems involving $$\pi$$ on the rationals without accidentally secretly rederiving the reals.

## The Isoperimetric Inequality

I've been able to find one theorem involving $$\pi$$ that seems to apply entirely on discrete structures with no relationship to circles -- involving, if you'd like, polygons constructed on grid points. It's:

* **Isoperimetric Inequality**: For any closed curve in $$\mathbb{R}^{2}$$ with arc-length $$L$$ and enclosing area $$A$$, $$L^{2} \geq 4 \pi A$$

The inequality becomes equality for circles, showing that they are the curve that maximizes the ratio of area to length in the plane. So, I suppose, it's *related* to circles, but the appealing thing is that it doesn't *start* from circles. It makes perfect sense even on a restricted class of curves that can't even express circles (though you'll never attain equality in that case).

This applies to arbitrary curves, without the requirement that they be simple (non-self-intersecting). It's not too hard to see that non-simple curves have longer lengths than the simple curve created by chopping off any part of the curve in the interior.

-----------

**Digression**: I haven't found a reference yet that talks about how it works on oriented areas, in which overlapping parts of a non-simple curve may end up with areas that subtract. Clearly this can let you arbitrarily shrink the area and expand the perimeter, so I suppose it's fine. It would of course also work to add up the absolute values of the areas: treat the two overlapping areas as totally separate, and summing their areas and perimeters. Since $$(L_{1} + L_{2})^{2} > L_{1}^{2} + L_{2}^{2} \geq 4\pi(A_{1} + A_{2})$$, the inequality is maintained.

------------

It's immediately clear that the truth of the inequality on *convex* curves implies it for *all* curves. The convex hull of a given curve clearly has $$A_{CH} \geq A$$ and $$L_{CH} \leq L$$ compared to the curve it surrounds.

Clearly, also, we can deform a curve to make the perimeter as large as we want without reducing the area -- just cause the curve to oscillate rapidly, extending its length arbitrarily without increasing the area appreciably. Unsurprisingly, there are generalizations and refinements of the inequality that do things like relate the windingness and curvature of the curve to *how much* $$L^{2}$$ exceeds $$4\pi A$$ by.

Example: $$L^{2} \geq 4\pi A + 8\pi \tilde{A_{0.5}}$$, where $$\tilde{A_{0.5}}$$ is the area of the strangely-named *Wigner Caustic*, which is an area that measures how much the curve fails to have a *constant width*.

There are generalizations to curves in other geometries -- for example, on a sphere, $$L^{2} \geq 4\pi A - \frac{A^{2}}{R}$$.

There are equivalent versions in higher dimensions. In general, in $$\mathbb{R}^{n}$$, the equation is $$\text{surf}(S) \geq n \text{vol}(S)^{\frac{n-1}{n}} \text{vol}(B_{n})^{\frac{1}{n}}$$. In this equation $$S$$ is a closed surface and $$B_{n}$$ is the unit ball (circle, sphere, hypersphere, etc, with radius one). In 2D, $$\text{vol}(B_{n}) = \pi$$. In 3D, $$=\frac{4}{3}\pi$$; in 4D, $$=\frac{1}{2}\pi^{2}$$. In 1D it's just $$=2$$, of course.

In 2D, we have $$\text{surf}(S) = L$$, $$\text{vol}(S)^{\frac{n-1}{n}} = A^{\frac{1}{2}}$$, and $$n\text{vol}(B_{n})^{1/n} = 2\pi^{\frac{1}{2}}$$, recovering $$L^{2} \geq 4\pi A$$.

In 3D, we have $$\text{surf}(S) = A$$, $$\text{vol}(S)^{\frac{n-1}{n}} = V^{\frac{2}{3}}$$, and $$n\text{vol}(B_{n})^{1/n} = 3 (\frac{4}{3} \pi)^{\frac{1}{3}}$$, giving $$A^{3} \geq 36\pi V^{2}$$

There is also a stronger version of the inequality, **Bonneson's Inequality**, that invokes a couple more objects: the *incircle radius* $$R_{in}$$, the radius of the largest circle that can be inscribed inside the curve, and the *circumcircle radius* $$R_{out}$$, the radius of the smallest circle that can be inscribed around the curve. This is:

$$L^{2} \geq 4\pi A + \pi^{2} (R_{out} - R_{in})^{2}$$

Anyway, the reason I mention all this is just to give an idea of the kinds of relationships between length and area are out there. I'm mostly interested in the original inequality, for the reason that it seems to totally apply to polygons and even curves made of straight line segments in a surprisingly simple way, and so it seems an extremely *fundamental* property of how we measure length and area.

So the question becomes: can we derive $$\pi$$ from a proof of the isoperimetric inequality that doesn't itself involve $$\pi$$ or circles in any way?

## First Principles

Perhaps, ideally, it's possible to derive the relationship between length and area from from nothing more from

$$\vert u \vert = \sqrt{\langle u,u \rangle} = (x^{2} + y^{2})^{\frac{1}{2}}$$

, that is, the Euclidean metric? Of course we need a definition of area as well, and it's not totally clear to me what the canonical way to define area from distance is. But the general formula for the area of a polygon is derivable from the (oriented) area of the triangle spanned by two vectors:

$$A(u, v) = A(u \wedge v) = \frac{1}{2} u \wedge v = \frac{1}{2} (u_{x}v_{y} - u_{y}v_{x})$$

Once we have this to compute the area of triangles, we can compute the area of an arbitrary polygon by triangulating it and then summing the areas. Though, actually, it's not even necessary that we triangulate the polygon -- for any choice of origin $$\mathcal{O}$$ and coordinate system, we can compute the area of a polygon $$P = \{ p_{1}, p_{2}, \ldots p_{n} \}$$ with $$\sum_{i} p_{i} \wedge p_{i+1 \text{ mod } n}$$, regardless of coordinate system -- since the areas are oriented, they cancel out in such a way that the sum comes out to the polygonal area anyway. 

-------

**Digression**: For an arbitrary smooth curve this sum becomes continuous, in the form of Green's theorem: 

$$A = \oint x dy = -\oint y dx = \frac{1}{2} \oint xdy-ydx \rightarrow \iint (\frac{\partial}{\partial x} x) - (\frac{\partial}{\partial y} (-y)) dx\wedge dy = \iint dA = A$$

(I'm not totally sure if I should be subsuming the factor of $$\frac{1}{2}$$ into the wedge product or not, though. hmm..)

And I'm sure there's some definition of integration on piecewise curves that unifies the two cleanly. The slightly surprising revelation, anyway, is that the term $$x dy$$ amounts to a wedge product between each vector on the curve and the infinitesimally-following vector: if we're at a point $$v$$ on the closed curve $$\gamma = \gamma(t)$$, $$t \in [0, 1]$$, $$\gamma(0) = \gamma(1)$$, then $$v = \gamma(t_{0})$$ and the 'next point' is $$\gamma(t_{0} + \epsilon) = \gamma(t_{0}) + \epsilon d\gamma \circ t_{0} = \gamma(t_{0}) + \epsilon \gamma'(t_{0}) = v + \epsilon v'$$.

$$v$$ is a position vector from our arbitrary origin $$\mathcal{O}$$, while $$v'$$ is a tangent vector at v. So the contribution to area is computable as $$\frac{1}{2} (v \wedge (v + v')) = \frac{1}{2}(v \wedge v') = \frac{1}{2}(v_{x} v'_{y} - v_{y} v'_{x})$$. Which, at least, *looks* similar to $$x dy - y dx$$, and I suppose to make it more precise you have to get into parameterizing your curve and integrating by an arc length and I don't want to do any of that here. Just wanted to show some geometric intuition.

-------

So, here's a train of thought.

Consider a polygon P made up of a series of points $$p_{i}$$, $$i \in (0,n)$$., and an arbitrary origin + coordinate system $$\mathcal{O}$$. Equivalently, it's a series of line segments $$l_{i} = p_{i}p_{i+1}$$, where we'll just stop writing $$\text{mod } n $$ from now on 'cause it's tedious. 

As shorthand I'll talk about an arbitrary segment $$ l = pq = p, p+v$$, with coordinates $$p = (p_{x}, p_{y}), q = p+v = (q_{x}, q_{y}) = (p_{x} + v_{x}, p_{y} + v_{y})$$. The length is $$d(l) = \sqrt(v \cdot v) = (v_x^{2} + v_y^{2})^{\frac{1}{2}}$$. The area contribution is $$A(l_{i}) = \frac{1}{2} p \wedge q = \frac{1}{2} p \wedge v = \frac{1}{2} v \wedge -q$$, which is meaningless on its own because the origin may be arbitrarily far away.

It is strangely symmetric that the total perimeter is a sum over one function on each segment $$L = \sum_{i} d(l_{i})$$, and the total area is a sum over a different function on each segment, $$A = \sum A(l_{i})$$. It's pretty apparent there's no concept of area that can be added 'in a vacuum', though -- a single line segment *doesn't have* a concept of area, because it depends where the other segments are. Even if we pick an origin on the interior of the polygon, so every area contribution is positive and none overlap, they're not particularly meaningful on their own.

On the other hand, if we consider our polygon as being built up from triangles in a particular way, then each triangle does have a contribution to the area -- but we can't specify the contributions to the *perimeter* as we go, because we don't know as we go which edges will end up being on the outside. If we let edges be oriented as we add up triangles, then every edge except those on the perimeter will end up canceling another out -- but it's not clear if there's a clean closed form for this; we can't just use vectors since the total vector for the perimeter is also 0.

Anyway, it's interesting: we can integrate over the curve to produce non-cancelling, always-positive length contributions, but mysteriously overlapping area contributions that magically work. *Or* we can integrate over the area, producing non-cancelling always-positive area contributions, but mysteriously overlapping length contributions that magically work.

WIP - more to come.