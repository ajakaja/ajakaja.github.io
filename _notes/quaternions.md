---
layout: article
title: "Quaternions"
math: true
aside: true
footnotes: true
---

## 1 Facts

As you may know (...):

[Quaternions](https://en.wikipedia.org/wiki/Quaternion) $$q = q_0 + q_1 i + q_2 j + q_3 k  \in \bb{H}$$ are the 3d analog of $$\bb{C}$$, with such familiar properties as

$$i^2 = j^2 = k^2 = -1$$, $$ij = k \\
\| q \|^2 = q_0^2 + q_1^2 + q_2^2 + q_3^2 \\
\bar{q} = q_0 - q_1 i - q_2 j - q_3 k$$

And the math most works like $$\bb{C}$$, except for the notable difference being the lack of commutative multiplication ($$ij = k = -ji)$$. The non-commutativity means we can define an inverse $$q^{-1} = \frac{q}{\| q \|}$$, but we can't write order-agnostic fractions like $$\frac{s}{q}$$ because $$q^{-1} s \neq s q^{-1}$$.

-------

A quaternion can be thought of as having a scalar part and a vector part: $$q = q_0 + \vec{q}_v = (q_0, \vec{q}_v)$$. Two quaternions multiply as:

$$(r_1, \vec{v}_1)(r_2, \vec{v}_2) = (r_1 r_2 - \vec{v}_1 \cdot \vec{v}_2, r \vec{v}_1 + r \vec{v}_2 + \vec{v}_1 \times \vec{v}_2)$$


------

Geometric Algebra fans will tell you that a quaternion is really a scalar + bivector element, and the quaternion product $$q_1 q_2$$ is the 'geometric product' of those objects, which is correct (although (imo) the geometric product is almost useless for intuition -- because how are we supposed to interpret $$\vec{u} \vec{v} = \vec{u} \cdot \vec{v} + \vec{u} \wedge \vec{v}$$? Incidentally, rotation via quaternions (below) is the only place I know of where the geometric product seems compelling).

Since this is the right interpretation, we'll want to freely write $$i = y \wedge z$$, $$j = z \wedge x$$, $$k = x \wedge y$$.


-----


Quaternions do a good job of representing rotations in 3d space -- they're faster to compute, only store the necessary information (compared to a $$3 \times 3$$ matrix!), easy to interpolate (because they can be renormalized at each step, whereas matrices have to be made orthogonal), and avoid 'gimbal lock' (in a pitch/yaw/roll system, if you pitch all the way up the other axes do nothing).

The quaternion for a rotation of angle $$\theta$$ around the vector axis $$\vec{n}$$ is given by:

$$q = e^{\frac{\theta}{2} \vec{n}} = (\cos \frac{\theta}{2}, \vec{n} \sin \frac{\theta}{2})$$

and is applied to a vector $$\vec{v}$$ via 'conjugation' (in analogy to conjugation in group theory):

$$R(\vec{v}) = q v q^{-1}$$

You can transform a quaternion into an orthogonal rotation matrix by solving $$R \vec{v} = q v q^{-1}$$ for $$R$$, but why would you? Ok, there are probably reasons.

Rotations compose as expected:

$$R_2 R_1 (\vec{v}) = (q_2 q_1) v (q_2 q_1)^{-1} = q_2 q_1 v q_1^{-1} q_2^{-1}$$

---------

The rotation formula is an application of the [exponential map](https://en.wikipedia.org/wiki/Exponential_map_(Lie_theory)) to the conjugation operation with a vector quaternion (no scalar part) $$n$$, via $$v \mapsto n v n^{-1}$$.

To understand $$n v n^{-1}$$, note that if a vector $$u$$ is parallel to $$n$$, then $$un = nu$$, but if it's perpendicular, then $$un = -nu$$. This means:

$$\begin{aligned}
n v n^{-1} &= n(v_{\parallel} + v_{\perp}) n^{-1} \\ 
&= v_{\parallel} n n^{-1} - v_{\perp} n n^{-1} \\
&= v_{\parallel}- v_{\perp} \\
&= R_{\pi}(v) \end{aligned}$$

Then the exponential map applies the operation $$v \ra R_{\pi} v$$ gradually, via 

$$\lim_{k \ra \infty} (1 + \frac{\theta}{2} \frac{R_{\pi}}{k})^k v \approx e^{\frac{\theta}{2} R_{\pi}} v = R_{\frac{\theta}{2}}(v)$$ 

Among other things, this means one quaternion represention of a $$\frac{\pi}{2}$$ rotation is something like $$1 - xy = 1 - k$$.

The conjugation step is the more interesting of the two. It takes the cross product $$n \times v$$ twice, hence the 'double' rotation -- which is, I think, suprising, because it makes the result distinctly different to the rotation matrix formalism.

Conjugation is also the form taken by changes-of-basis in linear algebra, like $$A \mapsto P^{-1}AP$$. In that context, a useful interpretation is that $$P^{-1}AP$$, acting on a vector on the right as $$v \mapsto P^{-1} A P v$$, first changes the basis of $$v$$, then applies $$A$$, then changes back to the original coordinate system by undoing $$P$$.

I vaguely remember hearing an argument that rotation matrices don't work as well as quaternion-like (conjugation) rotations in higher dimensions, but I don't remember it right now.

--------

We could also have defined our rotations with the inverse on the other side: $$v \mapsto n^{-1} v n$$. Since $$\vec{n}^{-1} = - \frac{\vec{n}}{\|n \|^2}$$ (in the sense of inverting quaternions), this gives the same result, which is almost weird -- because, which direction does that mean that $$e^{\frac{\theta}{2} \vec{n}} v e^{-\frac{\theta}{2} \vec{n}}$$ goes?

Well, let's work it out. Note that $$nn = - n \cdot n = -1$$; it's $$n \bar{n}$$ that equals $$1$$.

$$\begin{aligned}
e^{\frac{\theta}{2} \vec{n}} v e^{-\frac{\theta}{2} \vec{n}} &= ( \cos \frac{\theta}{2} + \vec{n} \sin \frac{\theta}{2}) v ( \cos \frac{\theta}{2} - \vec{n} \sin \frac{\theta}{2})  \\
&= \cos^2 \frac{\theta}{2} v + \cos \frac{\theta}{2} \sin \frac{\theta}{2} (nv - vn) - \sin^2 \frac{\theta}{2} (nvn) \\
&= (v_\parallel + v_{\perp}) \cos^2 + (n v_{\parallel} + n v_{\perp} - v_{\parallel} n - v_{\perp} n) \cos \sin  -  n (v_{\parallel} + v_{\perp})n \sin^2 \\
&= (v_\parallel + v_{\perp}) \cos^2 + (v_{\parallel} n - v_{\perp} n - v_{\parallel} n - v_{\perp} n) \cos \sin  -  (v_{\parallel} n - v_{\perp} n)n \sin^2  \\
&= (v_\parallel + v_{\perp}) \cos^2 + (v_\parallel - v_{\perp}) \sin^2 -2 v_{\perp} n \cos \sin \\
&= v_{\parallel} + v_\perp(\cos^2 \frac{\theta}{2}- \sin^2 \frac{\theta}{2}) - 2 v_{\perp} n \cos \frac{\theta}{2} \sin \frac{\theta}{2}\\
&= v_\parallel + v_\perp \cos \theta + \vec{n} \times v_{\perp} \sin \theta
\end{aligned}$$

This is exactly what we'd expect. We keep the parallel part $$v_{\parallel}$$ unchanged, and we mix $$v_\perp$$ and $$\vec{n} \times v_{\perp}$$ according to the angle $$\theta$$.

In $$e^{\frac{\theta}{2}\hat{n}} v e^{-\frac{\theta}{2}\hat{n}} $$, we of course recover $$n v n^{-1} $$ if we take $$\theta = \pi$$, via $$e^{\frac{\pi}{2} \hat{n}} = \hat{n}$$.

------------

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

I don't know why the factors of $$-i$$ are in there, but they cause each matrix to square to $$\sigma_i^2 = I$$ instead of $$-I$$.

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

As a result, it takes a $$4 \pi$$ rotation of space to rotate a spinor completely once, while a $$2 \pi$$ rotation just gives it a minus sign. Put differently: the rotation group of $$2 \times 2$$ matrices over $$\bb{C}$$, $$SU(2)$$, is a double-cover of the rotation group of vectors $$\in \bb{R}^3$$, $$SO(3)$$. 

This is, more or less, the reason that two electrons (or any fermions) cannot exist in the same state, thus the Pauli Exclusion principle and atomic orbitals and all that, because it implies that if they were in the same state, it would gain a minus sign if they were _swapped_, which necessitates that their amplitude be 0.

Related, the _measurement_ of the spin vector $$\vec{s}$$ ends up looking like a standard vector rotation:

$$\< \vec{s} \> = \< s | S_x \sigma_x + S_y \sigma_y + S_z \sigma_z \| s \> = s^* \vec{S} s $$

But why would nature have 'half' rotation operators describing every electron? It's a great mystery.

--------

## 2 Opinions

I don't believe in complex numbers for physics, so I have to not believe in quaternions either.

Or rather: complex numbers do a good job of describing rotations in a 2d plane. The mapping is via treating $$a+bi$$ as an operator $$a + bR_{\frac{\pi}{2}}$$, or, in exterior algebra terms, $$a I + bi \lra a + b(x \wedge y)$$, where:

$$I = x \otimes x + y \otimes y$$

$$x \wedge y = x \otimes y - y \otimes x$$

And the multiplication operation is contraction:

$$\vec{v} \cdot (x \otimes y - y \otimes x) = (\vec{v} \cdot x) y - (\vec{v} \cdot y) x = v_x y - v_y x$$

(Note: implicit in this notation is that we've _chosen_ for contraction to apply to the first argument in the tensor product. It is not demanded because they're 'next each other' in the formula, though that is the convenient choice.)

While elements of $$\wedge \bb{R}^2$$ are not in general commutative $$(x \wedge y) x = - x (x \wedge y)$$, the even-grade subalgebra $$\span(1, x \wedge y)$$ is, and that's what we identify as $$\bb{C}$$. But -- well, it's completely reasonable to respond "how is this any better than $$\bb{C}$$?" It's clunky to extract the even-grade elements.

The advantage, of course, is that it works in any dimension, not just 2 and barely in 3. As mentioned above, the quaternions are just the even elements of $$\wedge \bb{R}^3$$:

$$q = q_0 + q_1 i + q_2 j + q_3 k \Lra q_0 1 + q_1 (y \wedge z) + q_2 (z \wedge x) + q_3 (x \wedge y)$$

--------

There's a problem here, though. The scalar element $$1$$ is an element of $$\wedge \bb{R}^N$$. The identity matrix $$I = \sum x_i \otimes x_i$$ is _not_; it's an element of the symmetric algebra. Which is correct?

Geometric Algebra likes the idea of adding together elements of different grades to make composite-grade operators, like $$1 + x \wedge y$$, and then multiplies together. This is... plausible, maybe (we certainly are used to doing it with $$a + bi$$), but also iffy. I don't think I like it.

I think a lot of confusion arises out of not being careful what 'multiplication' operation we're using in various places, instead mindlessly contracting indices (one example of this is above -- where which tensor position we contract with is a convention, rather than a requirement.)

If we use $$I = \sum x_i \otimes x_i$$ instead of $$1 \in \wedge^0 \bb{R}^3$$, then our entire rotation operator is forever a rank-2 tensor $$I + x_i \wedge x_j$$ in any dimension, and there are no seemingly arbitrary rules for how to multiply it.

However... it is suspicious that rotation via quaternion conjugation $$ v \mapsto n v n^{-1}$$ works so well. Maybe there's something to this $$\wedge^0 \oplus \wedge^2$$ stuff?

--------

One of the reasons I am opposed to $$\bb{C}$$ is -- if you use it as a tool to describe every 2D plane you want to do geometry on, you might accidentally conflate the $$i$$s from different planes, when they live in totally different spaces. I am not sure that quantum mechanics doesn't already do this, when they use $$i$$ to represent complex amplitudes (the $$U(1)$$ gauge group?_) _and_ to represent angular momentum. It may be true that $$i_\psi i_L \simeq i_L^2 \simeq i_\psi^2$$, or something, and so we get away with it. But if there were cases where this wasn't true... I would have no idea how to tell. Hence, I don't think it's a good idea to be writing quaternions via Pauli matrices.

Actually, in a sense $$\bb{H}$$ is just three sets of $$\bb{C}$$ stuck together, with $$i,j,k$$ three different imaginary units, and their real parts identified, and certain multiplication rules between them defined.

Also, you can create $$\bb{H}$$ with _two_ copies of $$\bb{C}$$, something like $$a + b (c + di) j$$, where you define $$ij = k$$ to be the product of their imaginary units.

It seems entirely plausible to me that the complex amplitudes are _actually_ a copy of the quaternions where we've 'dropped' two dimensions. But I should probably go study physics in a graduate school for a few years before I go around telling anyone that.

One thing I am certain of: if it's possible to describe spinors without also introducing matrices of complex numbers as basis elements, it would be a good idea to do so. There is no reason to force students to adjust to so many things simultaneously.

-------


## 3 Spinors

The big question with spinors is, of course, "what the hell is a spinor?".

More specifically: what sort of geometric object would transform via

$$R_{\theta} (s) = e^{\frac{\theta}{2}} s$$

I'm sure that this is entangled (heh) with questions like "why must fields be described as operator-valued in fundamental physics"? Since, after all, if we're interpreting _all_ quaternions as rotation operators, then the one thing we know transforms as a spinor is, well, (each half of) a rotation operator.

---------

One approach: might a vector be decomposed into two parts, each of which transforms as a spinor, and whose combination transforms as a vector?

$$R v R^{-1} \stackrel{?}{\Lra} (R \nu) (\nu^* R^{-1})$$

This would be akin to how a matrix $$M \in V^* \otimes V$$ transforms with $$M^i_j x_i x^j \mapsto M^i_j P^{-1}(x_i) P(x^j)$$, ie, picks up a factor of $$P$$ or $$P^{-1}$$ depending on what each coordinate is. (For comparison, a rank-2 entirely covariant tensor $$T_{ij} x^i x^j$$ would transform as $$T_{ij} P(x^i) P(x^j)$$.) But how would we 'split' a vector into two parts?

A spinor has as many degrees of freedom as a vector, so we're not going to make our vector-like combination of spinors out of the tensor power of two smaller objects. On the other hand, spinors _are_ constrained to have magnitude 1 normally -- so maybe they really do only have three degrees of freedom?

-------

One ends up trying to find _any_ examples of something in the real human-scale world which transforms like a spinor, in order to get some intuition for them. Whence the [plate trick](https://en.wikipedia.org/wiki/Plate_trick), which is barely useful, but is intended to prove that SO(3) is indeed not simply-connected, while $$SU(2)$$ is. Basically because (see the animation on the Wiki article) an object which is rotated $$360 \degree$$ but is _tied to its environment_ cannot be unentangled from its environment without further rotation, while an object rotated $$720 \degree$$ can be (somewhat miraculously!) unentangled.

If this implies that electrons are somehow tethered to space -- well, that is reminiscent of [topological defects](https://en.wikipedia.org/wiki/Topological_defect) and of the rather evocative idea of particles as [vortices and antivortices](https://www.ribbonfarm.com/2015/09/24/samuel-becketts-guide-to-particles-and-antiparticles/).




-------

Here's an example of something which obeys spinor rules, which seems so trivial that I suspect it's wrong because I am not sure why I haven't seen it before. It's simply: any angle bisector, such as the angle between the (fixed, non-rotated) x-axis. That is: consider a rotation which rotates a vector $$v$$ _actively_ (rather than rotating the coordinate axes), and then consider the half angle $$\frac{\theta}{2}$$ between $$v$$ and $$\hat{x}$$.

Suppose $$v$$ starts aligned with $$\hat{x}$$, and we begin moving it around the unit sphere. Any path we take that doesn't cross the antipodal point ($$-\hat{x}$$) can be continuously deformed down to a trivial path. When we get to the antipode, though, the half angle $$\frac{\theta}{2}$$ 'crosses' $$\frac{\pi}{2}$$. If we go _around_ the antipode, it doesn't -- only if $$v$$ is moved through it. From then on it is on the $$-x$$ side of the sphere until we return to the orign, whereupon it ends up at $$\frac{\theta}{2} = -\pi$$, and $$\frac{v}{2} = -x$$. Of course, we're not simply dividing $$v$$ by two, because we're requiring the vector $$\frac{v}{2}$$ move continuously. Otherwise it would have a jump discontinuity when $$v = -x$$.

In fact this is also observable in 2d, just by considering how angle $$\frac{\theta}{2}$$ changes as $$\theta \in (0, 4 \pi)$$. And, um, of course we can also create things with various other symmetries via trisecting the angle, multiplying it by a rational fraction, etc...

This seems to simple that I doubt it is geometrically the same thing -- but, it does perfectly (and rather trivially) capture the transformation law of the $$e^{\vec{n} \frac{\theta}{2}}$$ terms. It _is_, at least, interesting for being a very concrete example of something which has $$R_{\theta} = -1$$. 

The other problem for its being physical, of course, is that there is no privileged $$+\hat{x}$$ axis for it to be half of the angle between, since any rotation of space should rotate all the axes too. Maybe, um, something like: it's half the angle with the $$+\hat{t}$$ axis?

-----------------

A mental model for spinors I have heard of:

Picture the parameters required to describe the state of a spinning top. Besides the angular vector $$(\phi, \theta)$$, you also require an angle $$\alpha$$ to say what rotational position the top is at, and a sign saying whether the rotation is CW or CCW. It's not enough to let opposite angular vector describe negative orientation, because that is a different state entirely. This appears to be a point on the unit 3-sphere, being described by three angles -- which happens to be just what unit quaternions naturally describe? (After all they are four numbers with $$q_0^2 + q_1^2 + q_2^2 + q_3^2$$).

[This](https://arxiv.org/pdf/1312.3824.pdf) article goes quite a bit into this model, though it describes it as a flagpole -- $$(\phi, \theta)$$ describe the position of the pole and $$\alpha$$ describes the direction of the flag.

Actually analyzing this means getting into spinor math in a lot more detail than I want to.