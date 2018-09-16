---
layout: article
title: "Wedge notes part 4"
math: true
aside: true
footnotes: true
---

## 1

The wedge product is *not* defined as:

$$a \wedge b = a \otimes b - b \otimes a$$

This is true only when wedging vectors over commutative entries, and it successfully eliminates the diagonal terms. For instance:

$$\begin{aligned}
a \otimes b - b \otimes a &= 
\begin{pmatrix} a_x b_x & a_x b_y \\ a_y b_x & a_y b_y \end{pmatrix} 
- \begin{pmatrix} b_x a_x & b_x a_y \\ b_y a_x & b_y a_y \end{pmatrix} \\
&= 
\begin{pmatrix} 0 & a_x b_y - b_x a_y \\ a_y b_x - b_y a_x & 0 \end{pmatrix} \\
&= (a_x b_y - b_x a_y) \begin{pmatrix} 0 & 1 \\ -1 & 0 \end{pmatrix} \end{aligned}$$


There are multiple issues with this.

**Issue 1: it doesn't work for more than two vectors**

$$a \wedge b \wedge c$$ is supposed to be the totally antisymmetric tensor power of $$a,b,c$$. Omitting tensor powers for brevity, that's:

$$a \wedge b \wedge c = abc + bca + cab - acb - bac - cba \tag{correct}$$

But:

$$ a \wedge (bc - cb) \stackrel{?}{=} a(bc-cb) - (bc-cb)a = abc - cba - bca + cba \tag{wrong}$$

This is completely wrong; it's missing two terms ($$+cab, -acb$$), and two terms have the wrong sign.

Instead, this seems to be correct:

The signs being wrong suggests that perhaps each time $$a$$ 'crosses' an element, a sign should be picked up. Furthermore, in order to get six total elements, we need to substitute $$a$$ into each position in $$b \wedge c$$.

We could write this like this, with $$\bullet$$ for the position that $$a$$ is substituted into:

$$\begin{aligned} 
a \wedge (b \otimes c - c \otimes b) 
&\ra a (\bullet bc - \bullet cb) 
&- a (b \bullet c - c \bullet b) 
&+ a (bc \bullet - cb \bullet) \\
&= abc - cba 
&- bac + cab 
&+ bca - cba\\
&= a \wedge b \wedge c &&
\end{aligned}$$

This is not a ridiculous thing to do, I think. The basic idea is that $$b \wedge c \in \otimes^2 V$$ (for some vector space V), while $$a \wedge b \wedge c \in \otimes^3 V$$, and there are multiple ways to 'fit' $$a$$ into the product $$b \otimes c$$. 

The rule is, basically:

$$a \wedge (b \otimes c) = a \otimes b \otimes c - b \otimes (a \wedge c)$$

But this is really weird, and it's completely tricky to actually multiply out! How would we expand $$(a \otimes b) \wedge (c \otimes d)$$?

The $$a \otimes b - b \otimes a$$ is still in there, but it's more like:

$$a \wedge b = a \otimes b - b \otimes a \wedge$$


Philosophically: I think there is something natural about this, by this argument:

1. The order of tensor powers in our notation cannot be 'physically' important to anything, so a physically 'natural' multiplication should be symmetric under the ordering.
2. We've already 'forgotten' which of $$b$$ and $$c$$ is in which position in $$b \wedge c$$, reducing their ordering to a factor of $$-1$$.


--------

Maybe this is implemented like this, with a family of linera maps which promote each argument to a the larger space in each possible way:

$$\begin{aligned}
S_i &: \otimes^2 V \ra \otimes^3 V \\
S_1 &: b \otimes c \ra 1 \otimes b \otimes c \\
S_2 &: b \otimes c \ra b \otimes 1 \otimes c \\
S_3 &: b \otimes c \ra b \otimes c \otimes 1 \\
T_i &: \otimes^2 V \ra \otimes^3 V \\
T_1 &: a \ra a \otimes 1 \otimes 1 \\
T_2 &: a \ra 1 \otimes a \otimes 1 \\
T_3 &: a \ra 1 \otimes 1 \otimes A
\end{aligned}$$

Then we could write the wedge product as a function of two arguments:

$$\wedge_{1,2}(p,q) = T_1(q) \circ S_1(p) - T_2 (q) \circ S_2 (p) + T_3 (q) \circ S_3(p) $$

And:

$$\wedge_{1, N}(p,q) = \sum_k (-1)^k T_k S_k$$

(To write $$\wedge_{i,j}$$ would require summing over all ways to arrange the factors.)

I don't know. Seems weird. Interesting, though?

**Issue 2: it swaps multiplication**

I am bothered by terms like:

$$a_x b_y - b_x a_y$$

I think it should be:

$$a_x b_y - a_y b_x$$

Suppose we define some strange scalar space such that $$a_i: A \ra X$$ and $$b_j: B \ra A$$. Then $$a_x \circ b_y$$ is defined, but $$b_y \circ a_x$$ is not, so we could not use the wedge product on our composition.

These are sort-of supposed to be tensor powers anyway -- but it's still odd.