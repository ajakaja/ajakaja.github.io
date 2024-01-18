---
layout: article
title: "My Project"
math: true
aside: true
footnotes: true
---


I'm chasing a bunch of hunches which are kinda hard to explain. Roughly:

## 1. Inverses and Distributions

There's a missing "theory" that unifies a lot of disparate parts of mathematics. In particular:

* Generalized inverses (of scalars, matrices, differential operators)
* Delta functions and distributions
* Integration (which is an example of an inverse operation)
* Exterior Algebra
* Taylor Series and especially divergent sums

Finding it should make a lot of things easier:
* Most of differential geometry
* Most of physics, especially QFT
* Possibly functional calculus / Lagrangians---less sure about this but it seems very related, like perhaps they're confusing because they're not built on this and they should be.
* Most of differential equations / PDE theory (which I think is the part of math that is presently "closest" to finding all this)

First, generalized inverses. Any inverse object, such as

$$\frac{1}{x}$$

or 

$$(\p^2_t - \p^2_x)^{-1}$$

Necessarily creates a geometric structure, because there are spaces of things the operation sets to zero. E.g. the multiplicative inverse $$\frac{1}{x}$$ should be "stuff which multiplies $$x$$ to give $$1$$". The meaning of this _completely depends on the space you're inverting into_. In scalars there is only one value; in vector spaces or arbitrary geometric structures there may easily be others. For this reason $$\frac{1}{x}$$ may be best regarded as

* a distribution, generally
* which can be "converted" to a number when needed, which amounts to "picking" the space the inverse is going to live in (collapsing the distribution to an implementation on that space)

Interesting examples show up when the space of objects are themselves functions of variables. For instance $$f(x) x = 1$$ has solution $$f(x) = 1/x + K \delta(x)$$ in certain spaces because $$x \delta(x) = 0$$ is taken to be true. 

(Aside: I think that $$x \delta = 0 $$ is wrong _in general_ but the sense in which it is wrong is that it's a distribution that extracts "poles" from functions, e.g. $$\int x \delta f \d x \neq 0$$ iff $$f \sim \frac{1}{x}$$. This is another example of things only taking concrete values when you identify them with physical output spaces.)

Anyway, it seems like the right answer is to basically:

1. model _all_ inverses as distributions
2. catalog ways of factoring them into concrete parts: finite parts + distributional parts, say. often the second part is something like a free parameter on a surface (e.g. the inverse of $$\| x \|^2 = R$$ is a sphere in $$\bb{R}^3$$)
3. produce a calculus on these inverse objects that lets them be manipulated in equations.

All of the other stuff listed above is part of (3). Examples:

* Distributions allow us to model inverses as objects in equations.
* Various inverse objects in math are implemented as combinations of functions with distributions.
  * Integration = $$\int_a^b f(x) \d x = \int 1_{(a,b)} f(x) \d x = \< 1_{\p(a,b)} , \p^{-1} \d f \>$$
  * Inverses of division of course
  * Inverses of polynomials, e.g. $$\sqrt{x^2} = \pm x$$. Note that the free parameters in this case are a pair of points, a value from a 0-dimensional spaces... but $$\sqrt{ \| x \|^2}$$ implemented on vectors $$\in \bb{R}^3$$ has an entire $$S_2$$ of free parameters.
  * Inverses of dot products produce free spaces, e.g. $$\vec{a} \cdot \vec{x} = b$$ gives $$\vec{x} = \vec{a}^{-1} \cdot c = \frac{c}{\vec{a}} + \lambda \cdot \vec{a}_{\perp}$$
  * Inverses of dot products can also be constructed as inverses of division + summation. For instance $$\vec{a} \cdot \vec{x} = a_i x^i = b$$ necessarily has $$\{ a_i x^i \} \in \text{tr}_n^{-1}(b)$$, where $$\text{tr}_n^{-1}(b)$$ gives the space of "all sums of $$n$$ numbers that equal $$b$$, and $$\vec{x} \in \{ a_i x^i \}^{-1}$$ which means that that $$x$$ is in the set of vectors whose values $$ \{ a_i x_i \}$$ produce a given value of that set of diagonal numbers. Etc. Every step is _fully_ invertible, with meaning given by the choice of space that inverse lives in
  * Inverses of matrices produce free spaces according to the Moore-Penrose pseudoinverse
  * Inverses of matrices can also be constructed as intersections of inverses of dot products
  * Lagrange multipliers are obviously unions of inverses to the two equations $$\p f(x) = 0, g(x) = 0$$
  * Paths of stationary action are generically inverses to $$\delta S = 0$$ and seem to be in some way related to delta-function-y objects (e.g. objects that fix the points of the path), btu this is just a vague sense that I haven't dug into
  * Principal Values = $$\int_{0^-}^{0^+} f(x) \d x$$ = some sort of distributional object that seems simpler than it is usually taken to be.
  * Generic inverses to division of functions like $$1/(1-x)$$ get "implementations" on particular regions of the plane like $$1 + x + x^2 + \ldots$$, but it seems in principle possible to "wrangle" the poles using distributions. After all that solution _does_ work for $$x > 1$$ in a twisted sense, e.g. $$1/(1-2) = -1$$ which is the "sum" of the divergent series $$1 + 2 + 4 + \ldots$$.
* Exterior algebra is the basic calculus of combining geometric objects using, essentially, "join" and "meet" which are "union" and "intersection". However there are gaps: clearly the join of a vector with itself ought to be the same vector. In typical algebra this would be implemented as something like $$x \^ x = 0 x$$ and $$x \^ x \^ y = 0 x \^ y$$. There's a lot of signs that there's a way to make this work.
  * In particular we ought to have an exterior algebra for curves and surfaces, for distributional representations of them, for block matrices, etc. The basic operations seem to generally extend pretty far but it's not always clear exactly how to do it.
  * On the way we need a theory of linear algebra over "multibases" (this is the whole theory of frames, etc), because those are the building blocks of a better theory of exterior algebra (plus they just make sense in their own right)
* Differential equation solutions e.g. BVPs are intersections of the space of inverses with the BVP constraints. Sorting through all this is sorta the "holy grail"---I feel like if all the pieces fall into place then solving Diffeqs should become "easy", basically rote algebra. I haven't learned much about this yet but I know that most of modern distribution theory is handled in the theory of PDEs, and delta functions and their ilk are inordinately useful for solving PDEs generically.

Misc other stuff:

**Integration**

Contour integration is another example where it seems like arbitrary generalized-inverse-y objects show up. For instance choosing to close a contour around a pole or not might give a factor of $$0$$ or $$ 2\pi i$$ in the result. This should be thought of as a solution parameterized by a two-value set, akin to $$\pm \sqrt{2}$$, where the final choice of value (or choice to keep both) is akin to projecting the result onto some other space.
  
More generally it seems true that smooth functions are essentially parameterizeable by their sets of poles (including poles at infinity aka zeroes), and integration and differentiation on them may be viewable as a transformation _just_ on those sets of poles. In $$>1$$ dimension poles may exist on surfaces instead of single points. In this way it may be possible to model functions as equivalent to distributions in this way, and to perhaps implement integration directly on these sets by translating between the two views.

If so I also think there will be some form of relationship between "poles" and "poles of the terms in a series expansion". For instance a Fourier transform is some kind of transformation on "bases of poles".... translating between $$x$$ meaning "a simple zero at $$0$$" to $$k$$ which means "an evenly spaced lattice of poles". It seeme like these, and most other series transformations, may be "completeable" (in that every fourier transform exists, every taylor series exists everywhere, etc) by viewing them as transformations "on sets of poles" in this way. But i'm not sure yet. For instance why would $$1/(1-x) = 1 + x + x^2 + \ldots$$ work? that is, why would a single pole at $$x=1$$ turn into a sum of poles at $$\infty$$? I'm not sure yet. But it seems like this puzzle might be more solveable by looking at it as the inverse of a _geometric_ operation, rather than an algebraic one.

More generally it seems like the meaning of integration over a pole generally has a sort of distributional character to it. For instance $$\int_{(a,b)} \frac{1}{x} \d x$$ picks up a "thing" at the origin that doesn't have a definite value; it's related to the generalized inverse of $$1/x$$... but it can be given a value in a given problem. The same is true for an integral around a hole in a space, for instance around the circle $$S_1$$. Classically one writes an integral of a closed curve $$\gamma$$ around the circle $$\frac{1}{2 \pi} \int_{\gamma} d \theta = w(\gamma)$$ where $$w(\gamma)$$ is the winding number of the curve, a _number_. I would say that this could be regarded as a distributional object $$w_{\gamma}$$ which encodes "the number of times $$\gamma$$ circled the curve". The difference is that you can do algebra on $$w_{\gamma}$$ that you can't do on the _number_ itself (in principle). After all the interesting thing that $$\gamma$$ did wasn't $$5$$, it was "went around the circle $$5$$ times". 

It seems to me that at some level _all_ interesting closed integration results are like this: they're not really _numbers_ but _geometric relationships_ and they ought to continue having that "type", as it might make other results obvious. Of course later on, as with distributions, you can "collapse them" to their appropriate number.

(Aside, it seems clear that at some level $$ 2 \pi$$ is a _unit_ that expresses this idea, but I haven't found a clear sense for that interpretation.)

(I don't have a great example available for why I want this atm but I like the idea and I've had concrete examples before so I'll add one here if it comes to me.)

Oh, one example of why this might matter. There are better ones though.

Normally in math it's true that "boundaries of boundaries are zero", $$\p^2 \sigma = 0$$. But this is because $$\p$$ has been defined to be adjoint to the exterior derivative $$d$$. In fact $$\p^2 \neq 0$$ _if_ you're dealing with integrating singular functions. Now consider a function $$f = \frac{1}{\theta}$$ on a circle, which has a pole at $$\theta = 0$$. The circle's boundary is zero _but_ the integral $$\int_{S_1} f(\theta) \d \theta = \int_{\p S_2} \ln(\theta)$$ is meaningful somehow (perhaps we also need to keep track of the winding number at the same time). The point is $$\p S_1$$ is obviously zero _as a geometric object_, but the pole in $$f$$ ends up "counting as a boundary also". $$\p S_1$$ therefore has a "distributional character": it's unmeaningful on its own but becomes meaningful when combined with _another_ object with distributional character, namely $$f$$, in which case it is going to add a factor for that pole in the integral even if neither integral endpoint is actually at the pole.

Related, I like to think of integration as "evaluation on a curve", e.g. $$f(C) = \int_C f \d x$$ or something like that (the coordinate system has to be implied in the symbol $$f$$, I guess). Then it seems clear that evaluation is evaluation on a point, $$f(a)$$, and differentiation is "evaluation on a boundary": $$f(\p a) = f'(a)$$, $$f(\p^2 a) = f''(a)$$, etc. Curl and divergence are implementations of this, but I can't quite see how. Evidently the generic object $$\p \vec{a}$$ has projections into three planes (giving curl) or onto a sphere (giving divergence), but it's a bit hard to make sense of it.

**Measurement**

There are a lot of places where I get the impression that we need to think of all mathematical equations as being distributional in nature, e.g., every operation is generically allowed (the way that distributions always have derivatives because $$T'$$ is defined by $$\< T', \phi \> = - \< T, \phi' \>$$), until some sort of "measurement" is made that corresponds the mathematics back to reality. This is the only way I can see to solve the problem of generalized inverses in general. Basically you never _know_ if a "disallowed" operation, such as dividing by zero or multiplying by infinity or whatever, is actually disallowed.... until you know what you're doing with it.

For example. For instance when is $$f \ra \infty$$ big enough to cancel out the zero in a step function such that $$f \theta \neq 0$$ for $$x < 0$$? The answer depends on the relationship between input and output space. If they're unidentified then you just end up with this generic object which essentially should have the form $$0 f = \frac{0_x}{0_y}$$. But later on you might find out that in fact $$y = 2x$$, in which case the result becomes physical again and equals, maybe, $$\frac{1}{2}$$.

This strikes me as a general pattern that is related to e.g. general covariance in physics and the phenomenon of measurement in quantum mechanics. Basically math gets meaning _by holding it up to reality_, and it turns out that basically _every_ mathematical operation_ is perfecty sensible when implemented "as a distribution"... unless it leads to some sort of internal contradiction, of course. For instance $$\pm \sqrt(x)$$ isn't "a number" or even "a pair of numbers", it's "all the numbers that are going to end up being giving $$x$$ when squared". If it turns out we're working in quaternions then that is a larger space of things. We have to "project" the result onto a space in order to see what its values are. Or, if it does not give values, then at least we might be able to simplify its representation somewhat --- for instance the roots of a 5th degree polynomial $$P_5^{-1}(0)$$ are generically an unrepresentable distribution, but we can allow ourselves to write them as (very complex) terminating 'series expansion' in radicals, which is at least a simpler form. Presumably there is some generic logic underlying all of this.

**Duality**

More generally, the form of an inverse has a pattern. The solution to

$$\vec{a} \cdot \vec{x} = b$$ 

is something like

$$\vec{x} = \< \frac{b}{\vec{a}} \> + \star \vec{a}$$

There are always two terms. The first is "constructive", knows about the space we're in, and provides an explicit algorithm for computing a result. The second is a "constraint", which _doesn't_ necessarily know what space we're in, and mght be arbitrarily hard to compute an explicit representation of. Very broadly these correspond to "objects" and "dual objects" (dual in the sense of category theory / everything that has "co-" in front of it in math). 

An interesting observation is that different mathematical operations are easy on each of the two parts. It is very easy to "join" (union) constructive terms, e.g. $$\vec{a} \^ \vec{b}$$, but very complicated to take their meet/intersection (requires e.g. finding the common subspace between two planes). On the other hand it is very easy to meet/intersect two constraint terms e.g. given two constraint vectors $$\star \vec{a}, \star \vec{b}$$ their intersection is just $$\star (a \vee b) = (\star \vec{a} \^ \star \vec{b})$$.

This strikes me as a general phenomonenon and I think it's related all the way back to type theory and computational complexity theory. After all there are broadly speaking two kinds of types: constructive types and constraint types. Constructive types are algorithms for producing objects that have a certain type, while constraint types are algorithms for checking if objects have a certain type. I would not be surprised to find that these two things end up corresponding to P and NP in some broad-reaching generalization.

The point is that the types of objects, constructions vs constraints, are extremely broad-reaching categories that have fundamentally different properties. Large parts of math seem to involve going from one to the other, or implementing operations on objects in one category vs the other.

A common example is implicit vs explicit surfaces. Implicit surfaces describe surfaces in terms of a function they satisfy $$g(x) = 0$$, which for many reasons is a lot easier to actually do math on because you know its derivative (so, it's normal planes) at every point for free. On the other hand it is very hard (essentially impossible) to actually _put coordinates_ on an implicit surface; you basically have to break it into a mesh and put coordinates on each mesh and glue them together and even then it's an approximation. Other operations on implicit surfaces are also extremely hard, such as finding the distance from a point to the nearest point on an implicit surface.

Among other things, I notice that series expansions and approximations algorithms are usually necessary _exactly_ when you're translating between these two types of objects. For instance root-finding, $$>5$$th degree polynomials, Taylor series, etc. For instance note that there's no closed form for $$\ln x$$ or $$\sqrt(x)$$ or $$\sin (x)$$ or $$\int f(x) \d x$$ or $$f^{-1}(0)$$ in general (note: not sure about how to think about $$\sin x$$, both it and $$sin^{-1}$$ seem like inverses). Although also note that these "constraint" objects --- generalized inverses --- are generally _easy to approximate_, almost conspicuously so. (Whereas $$\p$$ is _hard_ to approximate (very sensitive to numerical error) but easy to compute symbolically, perhaps because it is easy to compute on "constructive" objects but hard to compute on "constraint" objects. See what I mean?)

I suspect that a "high-level" understanding of the relationship between these two types of objects---constructions and constraints and constructions, explicit and implicit surfaces, objects and co-objects---will allow "systematizing" a great deal of presently bewildering mathematics in a unified framework.

So in summary: distributions and generalized inverses and the "grand duality" between constraints and constructions seem to be part of a unified theory of mathematics that should handle a _lot_ of things in generality when it's understood.

# 2. Geometry and Structure

The above describes one "cut" through math that I think will simplify a lot of stuff. I have glimpsed another cut, though. Basically it's the idea that a lot of math is implementing the same operations on different structures, for instance "union" and "join" and "wedge product" and "concatenation of lists" being related operations. The way I'm hoping to see this organized is what I like to call the **Grand Commutative Diagram**. Basically it says that:

1. There are high-level mathematical concepts which you can implement on anything you think of, before you consider its structure existing (basically implemented in a distributional sense) --- stuff like addition, multiplication, union, intersection, "forgetting differences between", etc
  * Usually I think of starting with geometric objects but no sense of measurement, metrics, distance, angles, etc
  * It can also be useful to think of starting with even less information, such as not being sure if two points are the same point or not, or not sure if you can see things of small or large scales clearly or at all, or not knowing the dimensionality of the space you're looking at and only seeing it in projection.
2. As you add structure to these objects, those generic operations begin to "collapse" down into concrete operations. For instance subspaces become multivectors when you add cordinates and forget their dimensions. Unions of subspaces become wedge products of multivectors under the same transformations.
3. All of these ways of adding structure should commute with each other, naturally.
4. The commutation means that everything is initially regarded as "distributional", for instance $$x \times (1/x) \neq 1$$ at first, just as a product of distributions.
5. But finally there are these "forgetful" steps you can perform that delete the differences between things, akin to the stuff in the previous section about "collapsing" distributions down to computeable values. When this happens you can't go back; the algebra becomes (more) concrete but the commutativity stops necessarily working in cases where you "forgot" the distributions that _kept_ it working.

It seems to me that this structure ought to allow one to organize _most_ of math in a very cogent way.

Some examples

1. Clearly vectors follow from forgetting origins on line segments
  * multivectors follow from commuting this operation with the concatenation/multiplication of line segments to make shapes
  * this is especially clear because of their elegant implementation on simplexes 
2. Related, generic surfaces are limits of sums of simplexes. Passing to this limit is an operation, and most operations in math commute with it generically .... perhaps even _by definition_, in a distributional sense.
3. The aforementioned idea that $$\p^2 \sigma \neq 0$$ because the boundary operator can act like a distribution and be meaningful in equations where it's contracted against other distributions.
4. Clearly vector spaces like $$(x,y,z)$$ should decompose into objects like $$(x, (y, z))$$ (generalizing bases to "frames") and all the algebra should work the same way. This pretty much tells you exactly how certain operations should work.
  * Or you can forget the difference between $$\e$$ and $$0$$, ie, map very narrow volumes to actual lines and planes, say, basically "passing to the limit" where things are infinitely thin.
5. The same is true for "forgetting" the $$z$$ dimension... up until the point where you do a generalized inverse that _produces_ it again, and then if you've forgotten it, no further operations will "commute" anymore, because a value was produced that you can no longer represent or use in equations.
6. There seem to be similar operations going on with the projections onto $$\hat{r} = (x \hat{x} + y \hat{y}) / \sqrt{x^2 + y^2}$$ and $$\hat{\theta} = 1/r^2 (x \hat{y} - y \hat{x})$$. In particular measuring the "length" of vectors is like projecting everything onto its $$r$$ coordinate and "forgetting" the $$\theta$$ coordinate, and measuring the curvature / Euler characteristic is like projecting everything onto $$\theta$$ and forgetting $$r$$. Hence why you can integrate against arc length ($$r$$) or Euler characteristic ($$\theta$$). 
7. I expect that lengths and curvatures and other sorts of numerical values extracted from geometries may be viewed as living in smaller-dimensional vector spaces of their own. For instance an object in $$\bb{R}^4$$ can map to _two_ lengths, $$(w^2 + x^2)$$ and $$(y^2 + z^2)$$, before it maps to one length in $$(w^2 + x^2 + y^2 + z^2)$$. A lot of theorems are going to follow from this sort of "intermediate" forgetting.
8. Various "group" structures systematically follow from different types of forgetting
  * homology groups follow from homotopy, and then the relatoinships between homologies follow from this operation commuting with _other_ kinds of forgetting/parameterizations (e.g. taking boundary operators) (nb. don't know this well)
  * groups in general arise from "forgetting the differences between symmetries". 
  * but other objects that are _not_ groups may also fall out in general.
9. Also, for every forgetful operation there is a generalized operation that returns all the things that could have produced it, with all of the implications of the previous section.
10. You can also, say, do a bunch of operations without letting your algebraic operators commute, and then later impose more and more freedom on commutation and of course everything should converge to its fully commutative case.
11. generically none of this really needs to happen on geometric objects; they're just easiest to think about.

I have a bit less of a sense of how to organize all of this but I can see the shape of it. There are _so many_ connections here that I keep seeing it eveywhere, the question is mostly organizing it all.

# 3. The nature of math

I don't feel like explaining this in detail atm but basically, I think that the way math is done is almost perfectly backwards. 

Math today is concerned with "what truth it can find, by any means necessary" (usually arduous proofs), presumably because that _has worked_, but it has gone way too far. It needs to be unwound and return to "what can be known and wielded". 

I don't really believe in proofs. Every good result ought to be obvious, or at least reachable by a rote computation where each step is obvious. Or at least, the _goal_ should be to do that. Making a proof closer to a rote computation should be _at least_ as important as finding a proof in the first place. The goal is to produce a framework of thought that makes all the results obvious, useful, and trivially extendable to new domains, such that learning this framework imparts the ability to "wield" mathematics to do and see things. 

High school algebra, therefore, was closer to the essence of mathematics than graduate research is.  To treat _only_ new knowledge, even about esoteric and unnecessary objects, as important, is to ignore most of the reason math is useful. Moreover, it selectively avoids the work that would actually _make us better at math_, so even if new knowledge is the goal it would be better obtained by my approach, emphasizing wieldability, than its current approach. 

The ultimate proof of this would be if my project worked, of course, because it would prove that my approach can find something that every professional couldn't: an actual better toolset that can reveal all kinds of new math essentially for free.
