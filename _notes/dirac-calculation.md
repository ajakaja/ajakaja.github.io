---
layout: blog
title: "Pauli Hamiltonian Calculation"
footnotes: true
math: true
aside: true
tags: notes
---

Brief version of a derivation which I worked through on paper.

The non-relativistic EM Hamiltonian is:

$$H = \frac{1}{2m} ( \vec{\sigma} \cdot (\vec{p} - e \vec{A}))^2 - e \phi$$

Which, calculated out, gives:

$$\frac{1}{2m} ( \| p \|^2 + e^2 \| A \|^2 + 2 \vec{p} \cdot \vec{A} + e \hbar \vec{\sigma} \cdot \vec{B}) - e \phi$$

The [usual derivation](https://quantummechanics.ucsd.edu/ph130a/130_notes/node479.html) here sucks.

-------------

The $$\sigma$$ matrices (and $$\gamma$$ matrices) for spacetime have the purpose of mapping vectors onto a space of matrices that obeys the correct 'geometric' algebra.

$$\vec{\sigma} \cdot \vec{u} = \sigma_i u^i \sim u_x \hat{x} + u_y \hat{y} + u_z \hat{z}$$

In this space, we _should_ have:

$$\vec{u} \vec{v} \stackrel{?}{=} \vec{u} \cdot \vec{v} + \vec{u} \^ \vec{v}$$

Which we would write as $$\vec{u} \cdot \vec{v} + \vec{\sigma} \cdot (\vec{u} \times \vec{v})$$ because we don't know how to represent wedge products.

(Note: this represents multipling vectors with $$\hat{x} \hat{x} = -1$$, $$\hat{x} \hat{y} - \hat{y} \hat{x} = 2 (\hat{x} \^ \hat{y})$$, and $$\hat{x} \hat{y} + \hat{y} \hat{x} = 0$$. Equivalently, quotienting $$V \o V$$ by $$\hat{x} \o \hat{x} \sim -1$$. In this algebra $$\hat{x} \hat{x} = -1$$, not $$1$$. This is not the usual choice in exterior algebra.)

---------
**Edit**: reworking this section.

The $$\sigma$$ matrices aren't defined exactly correctly. Exposition:

Geometric Algebra's merit is that it implements and generalizes the algebra of complex numbers and quaternions. The models are:

$$a + bi \Lra a + b \b{xy}$$

$$a + bi + cj + dk \Lra a + b \b{yz} + c \b{zx} + d \b{xy}$$

Note that Geometric Algebra almost certain implements multiplication _wrong_. It has $$\b{xy} \b{xy} = - \b{xy} \b{yx} = -1$$, which the correct inner product on bivectors should be $$(\b{xy})\cdot \b{xy}) = 1$$. The $$-1$$ object is actually the action of a bivector _on a vector_, treating each of them as a linear transformation: $$(\b{xy}) (\b{xy}) \b{x} = (\b{xy}) \b{y} = - \b{x}$$. I don't know a great notation for any of this yet, but in essence it is a sort of 'twisted' inner product.

The objects supporting multiplication and single-valued division are the _even_ graded bivectors. In these two spaces (but not in higher dimensions) there's an isomorphism between the even and odd grades:

$$(a + b\b{xy}) \Lra (a + b \b{xy})\b{x} = a \b{x} - b \b{y}$$

(With the correct interior product, this would give $$a \b{x} + b \b{y}$$). For quaternions with $$I = \b{xyz}$$:

$$(a + b \b{yz} + c \b{zx} + d \b{xy}) I = a I - b \b{x} - c \b{y} - d \b{z}$$

(Again, the correct interior product would keep all of these signs positive. I say 'correct' but I suppose if your goal is to have these act on vectors it might not be correct -- you really do want squaring a rotation to be a negative sign. Anyway, there's no way to implement both vectors and bivectors with sigma matrices such that both square to 1 anyway, I believe?)

(Note: I am not sure about why we always use comutators/anti-commutators $$[\sigma_i, \sigma_j]$$ and $$\{ \sigma_i, \sigma_j \}$$ rather than just multiplication. This is probably kinda important also. I have seen versions of GA that always do this also, presumably borrowing from spin -- so they write $$u \cdot v \equiv \frac{1}{2} (uv + vu)$$ and $$u \^ v \equiv \frac{1}{2} (uv - vu)$$. Shouldn't matter here though. There's even more ambiguity because sometimes the wedge product is defined this way also depending on whether you antisymmetrize tensor products or quotient them. It's complicated and I'm lost.)

So if we want to represent the geometric algebra with the Sigma matrices, we need $$(\b{xy})^2 = -1$$ and $$\b{x}^2 = 1$$. Since $$\sigma_i^2 = 1$$, this implies that the sigma matrices are $$\pm \sigma_i \lra \b{x}_i$$, and $$\pm i \sigma_i \lra I(\b{x}_i)$$. Apparently multiplying by $$i$$ in the $$\sigma$$ matrix space is equivalent to multiplying by $$I$$ in the GA space.

Suppose we pick $$\sigma_i = \b{x}_i$$. The geometric product on vectors should be:

$$\vec{u} \vec{v} = \vec{u} \cdot \vec{v} + \vec{u} \^ \vec{v}$$

We'll write our vectors as $$\vec{u} = \sigma_i u^i$$. The bivector term will have $$\pm \sigma_i$$ coefficients to represent the fact that it's a bivector; we can use this to find the appropriate sign. Since 

$$[\sigma_i, \sigma_j] = 2 i \e_{ijk} \sigma_k$$

It's apparently $$\b{x}_{i \^ j} \equiv i \sigma_i \^ \sigma_j = i \sigma_k$$

So we have a $$\bb{C}^2 \times \bb{C}^2$$ matrix representation of the geometric algebra:

$$(1, x, y, z, yz, zx, xy, xyz) \equiv (I, \sigma_x, \sigma_y, \sigma_z, i \sigma_x, i \sigma_y, i \sigma_z, i I)$$

Note: $$i$$ works as the pseudoscalar because it commutes with everything. This is true in $$\bb{R}^3$$ because $$x (xyz) = (xyz) x$$ and $$(xy) (xyz) = (xyz) (xy)$$. It's definitely not true in general.

So, our $$\sigma$$ matrix version of the geometric product on two vectors is:

$$
\begin{aligned}
(\vec{\sigma} \cdot \vec{u}) (\vec{\sigma} \cdot \vec{v}) 
&= (\vec{u} \cdot \vec{v}) I + \sigma_{j \^ k} (\vec{u} \^ \vec{v})^{j \^ k} \\
&= (\vec{u} \cdot \vec{v}) I + i \sigma_{i} (\vec{u} \times \vec{v})^{i} \\
\end{aligned}$$

-----------

Keeping that in mind we can expand $$H$$:

$$ \begin{aligned}
( \vec{\sigma} \cdot (\vec{p} - e \vec{A}))^2 &= \| \vec{p} \|^2 + e^2 \| \vec{A} \|^2 + e( \vec{p} \cdot \vec{A} + \vec{A} \cdot \vec{p}) + e(\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p}) \\
&= \| \vec{p} \|^2 + e^2 \| \vec{A} \|^2 + 2 e( \vec{p} \cdot \vec{A}) + ei(\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p})
\end{aligned}$$

$$\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p}$$ exposes a curiosity that I haven't properly considered in exterior algebra. We'd like to think that it's just $$\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p} = \vec{p} \^ \vec{A} - \vec{p} \^ \vec{A} = 0$$ but it's not. The problem is that the coefficients of $$\vec{p}$$ are derivative operators $$\vec{p} = i \hbar \vec{\p}$$. That is, we are dealing with an element in two exterior algebras at once -- a vector whose coefficients are themselves exterior algebra terms in another space. I've done some work on figuring out the rules for this but it's not finished.

Consider:

$$\begin{aligned}
p (A \psi) &= (p \cdot A) \psi + A (p \cdot \psi) \\
p \circ A &= p \cdot A + A \circ p  \\
p_j \circ A_i &= p_j \cdot A_i + A_i \circ p_j \\
A_i \circ p_j &= p_j \circ  A_i - (p_j \cdot A_i) \\
&= p_j \circ A_i + (i \hbar \p_j A_i) \\
\end{aligned}$$

And therefore:

$$\begin{aligned}
\vec{A} \^ \vec{p} &= A_i p_j - A_j p_i \\
&= p_j A_i - p_i A_j + i \hbar (\p_j \cdot A_i - \p_i \cdot A_j) \\
&= - (p_i A_j - p_j A_i) - i \hbar (\p_i \cdot A_j - \p_j \cdot A_i) \\
&= - \vec{p} \^ \vec{A} - i \hbar (d A) \\
&= - \vec{p} \^ \vec{A} - i \hbar (B^k) \\
\end{aligned}$$

And thus:

$$\begin{aligned}
i \sigma_k(\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p}) &= i \sigma_k (\vec{p} \^ \vec{A} - \vec{p} \^ \vec{A} - i\hbar \sigma_k B^k) \\
&= \hbar \vec{\sigma} \cdot \vec{B}
\end{aligned}$$

Giving:

$$( \vec{\sigma} \cdot (\vec{p} - e \vec{A}))^2 = \| \vec{p} \|^2 + e^2 \| \vec{A} \|^2 + 2 e( \vec{p} \cdot \vec{A}) + e \hbar \vec{\sigma} \cdot \vec{B}$$

Thought that was interesting.

Things to investigate:

* Two-component exterior algebra terms pull out commutators. I've looked into this some before but it's clearly kinda important.
* Clearly the exterior derivative acts like a wedge product already: $$d f \sim d \^ f$$. 
* Meanwhile analytic functions are elements of an infinite dimensional symmetric algebra: $$f(\vec{x}) \sim f(0) + (\p f) \vec{x} + \frac{1}{2} (\p^{\o 2} f) \vec{x}^{\o 2} + \ldots$$. (Well -- it would be a tensor algebra, except that $$\p_i \p_j - \p_j \p_i = 0$$ for analytic functions so only the symmetric terms survive).
* What happens for functions that disobey $$[\p_i, \p_j] = 0$$? This is equivalent to being inexact / having a path-dependent integral. Apparently derivatives in _general_ are a tensor algebra. The exterior derivative is what you get when you only consider the antisymmetric combinations, which measures the degree to which functions _aren't_ analytic.
