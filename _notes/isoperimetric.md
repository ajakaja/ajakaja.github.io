---
layout: article
title: "Isoperimetric Inequality"
math: true
category: notes
---

Consider a polygon $$P$$ in 2d with area $$A$$ and perimeter $$L$$.

The [Minkowski sum](https://en.wikipedia.org/wiki/Minkowski_addition) of two polygons is, essentially, the result from smearing one of the two out on every point of the other. If each is written as a set of position vectors, then:

$$A + B = \{ \b{a} + \b{b} \vert a \in A, b \in B \}$$

Here's what that would look like for two arbitrary shapes, like, say, a very thin line and a triangle:

	picture

In the case of our polygon $$P$$, we may imagine smearing it out with the radius-$$\e$$ circle $$B_{\e}$$ ($$B$$ for 'ball' -- circles in any dimension), which amounts to drawing the polygon with a 'thicker line':

	picture

It is natural to ask how this operation changes the area and perimeter of $$P$$, and it's easy to see that if $$P$$ is a simple polygon (its boundary is non-intersecting) then:

$$L \mapsto L + 2 \pi \e $$

$$A \mapsto A + L \e + \pi \e^{2}$$

## Brunn-Minkowski

Meanwhile, there is a theorem about Minkowski sums in general, the [Brunn-Minkowski Theorem](https://en.wikipedia.org/wiki/Brunn%E2%80%93Minkowski_theorem), which relates the $$n$$-volume of any two objects $$A, B$$ in $$n$$-d space to the $$n$$-volume of their Minkowski sum:

$$V(A+B)^{\frac{1}{n}} \geq V(A)^{\frac{1}{n}} + V(B)^{\frac{1}{n}}$$

Why would this be true? 

Note that the simpler version, with no $$\frac{1}{n}$$ powers, is trivial: of course $$V(A+B) \geq V(A) + V(B)$$; inequality would be if one of the shapes was just a point. So this says instead that, not only is the product larger, it's larger even when you take $$n$$'th roots everything.

It is a version of the [Arithmetic-Geometric mean inequality](https://en.wikipedia.org/wiki/Inequality_of_arithmetic_and_geometric_means), which says that $$\frac{x+y}{2} \geq \sqrt{xy}$$, etc, for any number of terms, or equivalently that $$x^{2} + y^{2} \geq 2xy$$. (Why? trivial if $$x=y$$; otherwise, set $$y = x + h$$; then it just says that $$h^{2} \geq 0$$).

It's easiest to see how this works for cuboids ($$n$$-rectangles, with volume $$V = \prod_{n} x_{i}$$ if $$\{x_{i}\}$$ are the side lengths). Then the volume elements are each products of $$n$$ terms:

$$(\prod_{n} a_{i} + b_{i})^{\frac{1}{n}} \geq (\prod_{n} a_{i})^{\frac{1}{n}} + (\prod_{n} b_{i})^{\frac{1}{n}}$$

Divide through by the left side to make things simpler:

$$1 \geq (\prod_{n} \frac{a_i}{a_i + b_i})^{\frac{1}{n}} + (\prod_{n} \frac{b_i}{a_i + b_i})^{\frac{1}{n}}$$

The right side is less, via AM-GM, than the mean of the terms in each product, but that just equals 1 so we're done:

$$\begin{aligned} 1 &= \frac{1}{n} \sum_{n} \frac{a_i}{a_i + b_i} + \frac{1}{n} \sum_{n} \frac{b_i}{a_i + b_i}   \\
&\geq (\prod_{n} \frac{a_i}{a_i + b_i})^{\frac{1}{n}} + (\prod_{n} \frac{b_i}{a_i + b_i})^{\frac{1}{n}} \; \checkmark \end{aligned}$$

While this is analytically fine, I still have trouble seeing it intuitively. The best explanation I have is something like this:

$$V(A) = (\prod_n a_i)^{\frac{1}{n}}$$ is multiplying $$n$$ side lengths together and then taking the $$n$$th root. The result is the side-length of an $$n$$-cube with the same total volume as $$A$$. AM-GM says that, in any dimension, the $$n$$-cube has the smallest perimeter among the $$n$$-cuboids of a certain volume. So the $$\prod_{n} a_i^{\frac{1}{n}}$$ is the edge length of the cube with volume $$V(A)$$, while $$\frac{1}{n} \sum a_{i}$$ is $$A$$'s actual average edge length, which must be higher.

$$(\prod_{n} \frac{a_i}{a_i + b_i})^{\frac{1}{n}}$$ is normalizing the lengths to be fractions of the total side length $$a_i + b_i$$ (a sort of 'unitless' length). Still, these are the sides of the cube with the same (unitless) volume, which are $$\leq$$ than the side-lengths of the actual cuboid we've generated via $$A+B$$. The two $$(\prod_{n} \frac{a_i}{a_i + b_i})^{\frac{1}{n}}$$ terms are the unitless volumes corresponding to each figure; clearly they do not fill up the cuboid because there are cross terms.

For instance, in 2d:

	2d picture

Or something like that. 

Anyway, once you have the proof for cuboids, you can imagine your arbitrary shapes as being built of combinations of cuboids, and things should more-or-less work out.

I need to find a cleaner intuition for this, though, because I'd like to have the following theorem be completely obvious, instead of deferring to a relatively unintuitive theorem for the crux of the proof.

## The Isoperimetric Inequality

Anyway, here's the **Isoperimetric Inequality** in 2d, from combining the Brunn-Minkowski Theorem with the expression for $$P + B_{\e}$$:

$$\begin{aligned} \sqrt{A(P + B_{\e})} &\geq A(P) + A(B_{\e}) \\
\sqrt{A + L\e + \pi \e^{2}} &\geq \sqrt{A} + \sqrt{\pi \e^{2}} \\

\cancel{A} + L\e + \cancel{\pi \e^{2}} &\geq \cancel{A} + \cancel{\pi \e^{2}} + 2 \sqrt{A \pi \e^{2}} \\

&\Ra \boxed{L^{2} \geq 4 \pi A}\end{aligned}$$

This is one of my favorite theorems, because it means that even if you're just drawing polygons in the plane, you can't get away from $$\pi$$. You can't draw anything whose squared-perimeter exceeds its area by less than a factor of $$4\pi$$.

(It is simple to generalize the derivation to higher dimensions if you know (look up) the volume of an $$n$$-sphere for the $$B_{\e}$$ term.)

Here's the proof visually:

	visual proof


Finally, I'll add that the more illuminating form of the 2d Isoperimetric Inequality is:

$$\big(\frac{L}{2 \pi r}\big)^2 \geq \frac{A}{\pi r^{2}}$$

Without specifying what $$r$$ is, since it cancels, you can still see what it's really saying more closely -- something like "length exceeds a circle's circumference by more than area exceeds a circle's area". This also gives a good guess as to how it will generalize to higher dimensions, and it turns out to be correct.

## On the origin of $$\pi$$

I am intrigued by where $$\pi$$ 'comes from' in geometry. The isoperimetric inequality is the 'earliest' place I've found: if you have only developed geometry as far as the length and areas of polygons, you are already constrained by $$L^2 \geq 4\pi A$$, even with no explicit mention of circles. Indeed, this is why the inequality was known to the ancient Greeks, since it's that's fundamental.

True, you would probably begin making increasingly higher-edged polygons and discover $$C = 2 \pi r$$, also. But this one also doesn't really involve any sort of limiting process! (well, the proof does, but the statement doesn't).

$$\pi$$ enters via the 'turns' at the corners of our polygon: when the sides of a polygon take a shart corner, they create a $$\pi \e^{2}$$ area (due to being Minkowski-summed with a circle). I wonder if this had to happen? Might we have summed against a square, instead, so $$\pi$$ would not emerge?

I'm not sure. But it seems related. $$\pi$$ is somehow the fundamental ratio between length and area, when you consider length as a sort of infinitesimal-width area.

<small>(This is related to something that I come back to a lot: that in 2d, length should be thought of as being an area of infinitesimal size $$L \mapsto L\e$$, which may as well be written as 0: $$L \mapsto L0$$. And 'quantity', number, has two factors of 0: $$Q \mapsto Q 0^2$$. Alternatively, let quantity have no units and put, say, meters on everything, so $$V \ra V m^3$$, $$A \ra A m^2$$, etc. Either way it lets intuitions about multiplication work like you'd expect, and makes 'projected volumes into a plane' and the like make more sense, and it plays well with determinants that have multiple 0s in them vs ones that don't... more on this another time.)</small>
