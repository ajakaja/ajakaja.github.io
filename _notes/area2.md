---
layout: article
title: "Silly thoughts on area"
math: true
aside: true
footnotes: true
---


Let $$A,B$$ be two points in space.

It is interesting to note that both area (of the triangle $$(\cal{O}, A, B)$$), and length (of the vector $$B-A$$) correspond to "parts of the tensor product $$A \otimes B$$":

$$A \otimes B = A_x B_x \b{xx} + A_x B_y \b{xy} + A_y B_x \b{yx} + A_y B_y \b{yy}$$

Length (squared) comes from mapping $$\b{x} \b{x} \sim \b{y} \b{y} \sim 1$$, $$\b{xy} \sim \b{yx} \sim 0$$:

$$\begin{aligned} A \otimes B &= A_x B_x \b{xx} + A_x B_y \b{xy} + A_y B_x \b{yx} + A_y B_y \b{yy} \\
&\sim A_x B_x + A_y B_y \\
&\Ra Length^2 \end{aligned}$$

Area comes from mapping $$\b{x} \b{y} \sim +1, \b{y} \b{x} \sim -1, \b{xx} \sim \b{yy} \sim 0$$:

$$\begin{aligned} A \otimes B &= A_x B_x \b{xx} + A_x B_y \b{xy} + A_y B_x \b{yx} + A_y B_y \b{yy} \\
&\sim A_x B_y - A_y B_x \\
&\Ra Area \end{aligned}$$

In this sense length and area are 'two parts of the same formula'. The length (squared) extracts the 'symmetric' components ($$\b{xy}$$, etc), while the area extracts the 'asymmetric' components like $$\b{xy}$$.

The same formulas continue to work in higher dimensions, expect that areas are vectorial quantities -- so our term above has to be $$ (A_x B_y - B_y A_x) \b{x \wedge y}$$, and a general area has multiple components along (in 3d, for illustration) $$\b{x} \wedge \b{y}, \b{y} \wedge \b{z}, \b{z} \wedge \b{x}$$.

## 2

A polygon created by points $$\{p_i\}$$ has area given by the [shoelace formula](https://en.wikipedia.org/wiki/Shoelace_formula):

$$area(P) = \frac{1}{2} \sum p_i \wedge p_{i+1}$$

where the sum is understood to 'wrap around', so the last term is $$p_n \wedge p_0$$.

Meanwhile, its perimeter may be given by:

$$perimeter(P) = \sum | p_{i+1} - p_i |$$

Another quantity I want to consider is the sum of _squared_ side lengths, which I will denote with $$L^2$$

$$length^2(P) = \sum | p_{i+1} - p_i |^2 $$

Obviously it is true that:

$$length^2(P) \leq perimeter(P)^2$$

Here are some other forms of the $$length^2$$ formula:


$$\begin{aligned} L^2(P) &= \sum (p_{i+1} - p_i) \cdot (p_{i+1} - p_i) \\
&= \sum | p_{i+1}|^2 + | p_{i} |^2 - p_i \cdot p_{i+1} - p_{i+1} \cdot p_i\\
&= 2 \sum |p_i|^2 - 2 \sum p_i \cdot p_{i+1}  \\
&= 2 \sum |p_i|^2 - p_i \cdot p_{i+1} \\
&= 2 \sum p_i \cdot (p_i - p_{i+1}) \\
&= 2 \sum p_{i+1} \cdot (p_{i+1} - p_i) \\
\end{aligned}$$

Okay I don't have anything else to say right now. But I feel like there's _something here_.

-------------

## 3

There _is_ something here, though.

Let's revisit the arbitrary polygon $$P = \{ p_0, p_1, \ldots, p_n \} = \{ p_i \}$$.

Define vectors for the sides as:

$$d_i = p_{i+1} - p_i$$

With the indexes 'wrapping around', as before, so:

$$d_n = p_0 - p_n$$

Since the polygon is closed, we also have:

$$\sum d_i = \vec{0}$$

And we can write each point as a sum of displacements:

$$p_i = p_0 + \sum_{j < i} d_j$$

Now consider the shoelace area formula again:

$$area(P) = \frac{1}{2} \sum p_i \wedge p_{i+1}$$

But let's write it in terms of $$d_i$$:

$$\begin{aligned} &= \frac{1}{2} \sum p_i \wedge d_i \\
&= \frac{1}{2} \sum_i (p_0 + \sum_{j < i} d_j) \wedge d_i \\
&= \frac{1}{2} \sum_i \sum_{j < i} d_j \wedge d_i
\end{aligned}$$

(The $$p_0$$ term drops out because $$\sum_i p_0 \wedge d_i = p_0 \wedge \sum_i d_i = p_0 \wedge \vec{0} = 0$$,  which just says that areas are translation-invariant).

The last term in the sum , when $$i = n$$, also drops out, because of $$\sum d_i = \vec{0}$$:

$$\begin{aligned} &= \frac{1}{2} \sum_{i < n} \sum_{j < i} d_j \wedge d_i + \frac{1}{2} \sum_{j < n} d_j \wedge d_n \\
&= \frac{1}{2} \sum_{i < n} \sum_{j < i} d_j \wedge d_i + \frac{1}{2} (-d_n \wedge d_n) \\
&=  \frac{1}{2} \sum_{0 < i < n} \sum_{0 \leq j < i} d_j \wedge d_i
\end{aligned}$$



-------

As an example, consider a quadrilateral formed by four points in the plane:

$$P = \{ p_0, p_1, p_2, p_3 \}$$

Then the displacements are:

$$dP = \{ p_1 - p_0, p_2 - p_1, p_3-p_2, p_0-p_3\} \\
= \{d_0, d_1, d_2, d_3 \}$$

And the area is given by:

$$A = \frac{1}{2}[d_0 \wedge d_1 + d_0 \wedge d_2 + d_1 \wedge d_2]$$


As a more concrete example, suppose the quadrilateral is the trapezoid:

$$Q = \{ (1, 0), (3,0), (3,5), (1, 3) \}$$

Then:

$$dQ = \{ (2,0), (0, 5), (-2, -2), (0, -3) \}$$

And:

$$\begin{aligned} 
area(Q) &= \frac{1}{2} [(2,0) \wedge (0,5) + (2,0) \wedge (-2, -2) + (0,5) \wedge (-2, -2)] \\
&= \frac{1}{2} [(2)(5) - (0)(0) + (2)(-2) - (0)(-2) + (0)(-2) - (5)(-2)] \\
&= \frac{1}{2} [10 + -4 + 10] \\
&= 8
\end{aligned}$$

-----

I am very intrigued by this. I have never seen a formula giving the area of an arbitrary polygon in terms of the vector displacements of its sides.

## More Forms

A more symmetric form may be written like this:

$$A = \frac{1}{4} \sum_i \sum_j \sigma_{ij} d_j \wedge d_i$$

where:

$$\sigma_{ij} = 
\begin{cases} 
1 & \if i > j \\
0 & \if i = j \\
-1 & \if i < j \\\end{cases}$$

This uses the observation that if we replace the $$\sum_{j < i}$$ with $$\sum_{j > i}$$, the result is just the negation of the original formula. Therefore we can add the two together:

$$A = \frac{1}{2}[ \frac{1}{2} \sum_i \sum_{j < i} d_j \wedge d_i - \frac{1}{2} \sum_i \sum_{j > i} d_j \wedge d_i] \\
= \frac{1}{4} \sum_{i} \sum_{j} \sigma_{ij} d_j \wedge d_i$$

This formula is a bit redundant, though: it's not necessary to specify $$\sigma_{i = j}$$, because $$d_j \wedge d_j = 0$$ anyway. But it might reveal a bit of structure?

We can also remove a factor of $$\frac{1}{2}$$ by replacing the $$\wedge$$ with $$\otimes$$, via $$a \wedge b = a \otimes b - b \otimes a$$. But the resulting formula seems to obscure structure -- the $$\sigma_{ij}$$ creates antisymmetrization, just like $$\wedge$$, only now you can't really see it:

$$A = \frac{1}{2} \sum_{i} \sum_{j} \sigma_{ij} d_j \otimes d_i$$
