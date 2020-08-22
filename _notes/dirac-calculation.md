---
layout: blog
title: "A quantum mechanical calculation"
footnotes: true
math: true
aside: true
tags: notes
---

Brief version of a derivation which I worked through on paper.

The non-relativistic EM Hamltonian is:

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

Unfortunately the $$\sigma$$ matrices are misdefined. They should be equivalent to the quaternions, but it's actually $$-i \sigma$$ that have this property. This means our operation is a bit strange:

$$
\begin{aligned}
(\vec{\sigma} \cdot \vec{u}) (\vec{\sigma} \cdot \vec{v}) 
&= i (-i \vec{\sigma} \cdot \vec{u}) i (-i \vec{\sigma} \cdot \vec{v}) \\
&= i^2 (- \vec{u} \cdot \vec{v} + (-i \vec{\sigma}) \cdot (\vec{u} \times \vec{v})) \\
&= \vec{u} \cdot \vec{v} + i (\vec{u} \^ \vec{v})
\end{aligned}$$

Keeping that in mind we can expand $$H$$:

$$ \begin{aligned}
( \vec{\sigma} \cdot (\vec{p} - e \vec{A}))^2 &= \| \vec{p} \|^2 + e^2 \| \vec{A} \|^2 + e( \vec{p} \cdot \vec{A} + \vec{A} \cdot \vec{p}) + e(\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p}) \\
&= \| \vec{p} \|^2 + e^2 \| \vec{A} \|^2 + 2 e( \vec{p} \cdot \vec{A}) + e(\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p})
\end{aligned}$$

$$\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p}$$ exposes a curiosity that I haven't properly considered in exterior algebra. We'd like to think that it's just $$\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p} = \vec{p} \^ \vec{A} - \vec{p} \^ \vec{A} = 0$$ but it's not. The problem is that the coefficients of $$\vec{p}$$ are derivative operators $$\vec{p} = i \hbar \vec{\p}$$. That is, we are dealing with an element in two exterior algebras at once.

Consider:

$$\begin{aligned}
A_i \circ p_j &= p_j \circ  A_i - (p_j \cdot A_i) \\
&= p_j \circ A_i - (i \hbar \p_j A_i) \\
\end{aligned}$$

And therefore:

$$\begin{aligned}
\vec{A} \^ \vec{p} &= A_i p_j - A_j p_i \\
&= p_j A_i - p_i A_j - i \hbar (\p_j \cdot A_i - \p_i \cdot A_j) \\
&= p_j A_i - p_i A_j + i \hbar (\p_i \cdot A_j - \p_j \cdot A_i) \\
&= \vec{p} \^ \vec{A} + i \hbar (d A) \\
&= \vec{p} \^ \vec{A} + i \hbar (-i \sigma_k B^k) \\
\end{aligned}$$

And thus:

$$\begin{aligned}
\vec{p} \^ \vec{A} + \vec{A} \^ \vec{p} &= \vec{p} \^ \vec{A} - \vec{p} \^ \vec{A} + \hbar \sigma_k B^k\\
&= \hbar \vec{\sigma} \cdot \vec{B}
\end{aligned}$$

Giving:

$$( \vec{\sigma} \cdot (\vec{p} - e \vec{A}))^2 = \| \vec{p} \|^2 + e^2 \| \vec{A} \|^2 + 2 e( \vec{p} \cdot \vec{A}) + e \hbar \vec{\sigma} \cdot \vec{B}$$

Thought that was interesting.

Things to investigate:

* Pauli matrices have $$\sigma_i^2 = 1$$ and $$(-i \sigma)^2 = -1$$. Maybe I'm wrong to map them to quaternions, since I believe they're actually _translation_ operators, not rotations.
* Two-component exterior algebra terms pull out commutators. I've looked into this some before but it's clearly kinda important.
* Clearly the exterior derivative acts like a wedge product already: $$d f \sim d \^ f$$. 
* Meanwhile analytic functions are elements of an infinite dimensional symmetric algebra: $$f(\vec{x}) \sim f(0) + (\p f) \vec{x} + \frac{1}{2} (\p^{\o 2} f) \vec{x}^{\o 2} + \ldots$$. (Well -- it would be a tensor algebra, except that $$\p_i \p_j - \p_j \p_i = 0$$ for analytic functions so only the symmetric terms survive).
* What happens for functions that disobey $$[\p_i, \p_j] = 0$$? This is equivalent to being inexact / having a path-dependent integral. Apparently derivatives in _general_ are a tensor algebra. The exterior derivative is what you get when you only consider the antisymmetric combinations, which measures the degree to which functions _aren't_ analytic.
