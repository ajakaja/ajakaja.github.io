---
layout: article
title: "Quaternions"
math: true
aside: true
footnotes: true
---

## 1

As you know:

[Quaternions](https://en.wikipedia.org/wiki/Quaternion) $$q = q_0 + q_1 i + q_2 j + q_3 k  \in \bb{H}$$ are the 3d analog of $$\bb{C}$$, with such familiar properties as

$$i^2 = j^2 = k^2 = -1$$, $$ij = k \\
\| q \|^2 = q_0^2 + q_1^2 + q_2^2 + q_3^2 \\
\bar{q} = q_0 - q_1 i - q_2 j - q_3 k$$

And the math most works like $$\bb{C}$$, except for the notable difference being the lack of commutative multiplication ($$ij = k = -ji)$$. The non-commutativity means we can define an inverse $$q^{-1} = \frac{q}{\| q \|}$$, but we can't write order-agnostic fractions like $$\frac{s}{q}$$ because $$q^{-1} s \neq s q^{-1}$$.

-------

A quaternion can be thought of as having a scalar part and a vector part: $$q = q_0 + \vec{q}_v = (q_0, \vec{q}_v)$$. Two quaternions multiply as
$$(r_1, \vec{v}_1)(r_2, \vec{v}_2) = (r_1 r_2 - \vec{v}_1 \cdot \vec{v}_2, r \vec{v}_1 + r \vec{v}_2 + \vec{v}_1 \times \vec{v}_2)$$


------

Geometric Algebra fans will tell you that a quaternion is really a scalar + bivector element, and the quaternion product $$q_1 q_2$$ is the 'geometric product' of those objects, which is correct (although (imo) the geometric product is almost useless for intuition -- because how are we supposed to interpret $$\vec{u} \vec{v} = \vec{u} \cdot \vec{v} + \vec{u} \wedge \vec{v}$$? Incidentally, rotation via quaternions (below) is the only place I know of where the geometric product seems compelling).

Since this is the right interpretation, we'll want to freely write $$i = y \wedge z$$, $$j = z \wedge x$$, $$k = x \wedge y$$.


-----


Quaternions do a good job of representing rotations in 3d space -- they're faster to compute, only store the necessary information (compared to a $$3 \times 3$$ matrix!), easy to interpolate (because they can be renormalized at each step, whereas matrices have to be made orthogonal), and avoid 'gimbal lock' (in a pitch/yaw/roll system, if you pitch all the way up the other axes do nothing).

The quaternion for a rotation of angle $$\theta$$ around the vector axis $$\bb{n}$$ is given by:

$$q = e^{\frac{\theta}{2} \vec{n}} = (\cos \frac{\theta}{2}, \vec{n} \sin \frac{\theta}{2})$$

and is applied to a vector $$\vec{v}$$ via 'conjugation' (in analogy to conjugation in group theory):

$$R(\vec{v}) = q v q^{-1}$$

You can transform a quaternion into an orthogonal rotation matrix by solving $$R \vec{v} = q v q^{-1}$$ for $$R$$, but why would you? Ok, there are probably reasons.

Rotations compose like this:

$$R_2 R_1 (\vec{v}) = (q_2 q_1) v (q_2 q_1)^{-1} = q_2 q_1 v q_1^{-1} q_2^{-1}$$

---------

The rotation formula is an application of the [exponential map](https://en.wikipedia.org/wiki/Exponential_map_(Lie_theory)) to the conjugation operation $$v \mapsto n v n^{-1}$$.

To understand $$n v n^{-1}$$, note that if a vector $$u$$ is parallel to $$n$$, then $$un = nu$$, but if it's perpendicular, then $$un = -nu$$. This means:

$$\begin{aligned}
n v n^{-1} &= n(v_{\parallel} + v_{\perp}) n^{-1} \\ 
&= v_{\parallel} n n^{-1} - v_{\perp} n n^{-1} \\
&= v_{\parallel}- v_{\perp} \\
&= R_{\pi}(v) \end{aligned}$$

Then the exponential map applies the operation $$v \ra R_{\pi} v$$ gradually, via 

$$(1 + \frac{\theta}{2} \frac{R_{\pi}}{n})^n v \approx e^{\frac{\theta}{2} R_{\pi}} v = R_{\frac{\theta}{2}}(v)$$ 

Among other things, this means one quaternion represention of a $$\frac{\pi}{2}$$ rotation is something like $$1 - xy = 1 - k$$.

The conjugation step is the more interesting of the two. It takes the cross product $$n \times v$$ twice, hence the 'double' rotation -- which is, I think, suprising, because it makes the result distinctly different to the rotation matrix formalism.

Conjugation is also the form taken by changes-of-basis in linear algebra, like $$A \mapsto P^{-1}AP$$. In that context, a useful interpretation is that $$P^{-1}AP$$, acting on a vector on the right as $$v \mapsto P^{-1} A P v$$, first changes the basis of $$v$$, then applies $$A$$, then changes back to the original coordinate system by undoing $$P$$.

I vaguely remember hearing an argument that rotation matrices don't work as well as quaternion-like (conjugation) rotations in higher dimensions, but I don't remember it right now.

--------

Quaternions can also be represented as $$2 \times 2$$ matrices over $$\bb{C}$$, basically because lots of things can, via:

$$q = q_0 + q_1 i + q_2 j + q_3 k = \begin{pmatrix} q_0 + q_1 i & q_2 + q_3 i \\ - q_2 + q_3 i & q_0 - q_1 i \end{pmatrix}$$

And since complex numbers themselves can be represented as $$2 \times 2$$ matrices over $$\bb{R}$$ via 

$$ a + bi = \begin{pmatrix} a & -b \\ b & a \end{pmatrix}$$

This implies $$\bb{H}$$ can be represented as $$ 4 \times 4$$ matrices over $$\bb{R}$$, though the implementation of this is far too tedious to write out. Regardless, in every representation $$i^2 = j^2 = k^2 = -I$$.

Neither representation takes a unique form. This is necessarily true, because $$\bb{H}$$ gives the same arithmetic is given under relabeling $$i \ra j \ra k \ra i$$. 

Physicists all learn this complex representation in their undergraduate degrees, and then sometimes never learn the more sane $$\bb{R}$$ version.

-----------

The main reason that quaternions of more than a curiosity in physics is that all evidence suggests that [spinors](https://en.wikipedia.org/wiki/Spinor), which are the vector-like objects that represent the direction of a particle's intrinsic angular momentum, transform via one-sided multiplication by quaternions:

$$s \mapsto q s \stackrel{!}{\neq} q s q^{-1}$$

The complex matrix formalism of physics uses slightly different matrices, the [Pauli matrices](https://en.wikipedia.org/wiki/Pauli_matrices) $$\sigma_k$$. The identitification with quaternion terms is:

$$\begin{aligned}
1 &\lra I \\
i &\lra -i \sigma_z \\
j &\lra -i \sigma_y \\
k &\lra -i \sigma_x
\end{aligned}$$

I don't know why the factors of $$-i$$ are in there, but they cause each matrix to square to $$\sigma_i^2 = I$$ instead of $$-1$$.}

Anyway, the Pauli matrices' eigenvectors form the basis of spinors, which are vectors in $$\bb{C}^2$$ with $$\| s \| = s \cdot \bar{s} = 1$$:

$$\begin{aligned}
s_{\pm x} &= \frac{1}{\sqrt{2}} \begin{pmatrix} 1 \\ \pm 1 \end{pmatrix} \\
s_{\pm y} &= \frac{1}{\sqrt{2}} \begin{pmatrix} 1 \\ \pm i \end{pmatrix} \\
s_{\pm z} &= \begin{pmatrix} 1\\ 0 \end{pmatrix}, \begin{pmatrix} 0 \\ 1 \end{pmatrix}
\end{aligned}$$

Perhaps the choice of $$-i$$ above was to get $$s_{\pm z}$$ into this form.

------

Physics is also greatly concerned with the fact that the standard spinor rotation $$R_{\theta}(v) = e^{\frac{\theta}{2} q} v e^{-\frac{\theta}{2} q}$$ only rotates spinors by $$\frac{\theta}{2}$$:

$$R_{\theta}(s) = e^{\frac{\theta}{2}} s$$

As a result, it takes a $$4 \pi$$ rotation of space to rotate a spinor completely once, while a $$2 \pi$$ rotation just gives it a minus sign. This is, more or less, the reason that two electrons (or any fermions) cannot exist in the same state, thus the Pauli Exclusion principle and atomic orbitals and all that, because it implies that if they were in the same state, it would gain a minus sign if they were _swapped_, which necessitates that their amplitude be 0.

Related, the _measurement_ of the spin vector $$\vec{s}$$ ends up looking like a standard vector rotation:

$$\< \vec{s} \> = \< s^\dagger \| S_x \sigma_x + S_y \sigma_y + S_z \sigma_z \| s \> $$

But why would nature have 'half' rotation operators flying around attached to every electron? It's a great mystery.

## 2