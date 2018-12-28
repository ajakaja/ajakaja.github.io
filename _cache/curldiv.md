---
layout: article
title: "Curl and Div"
footnotes: true
math: true
aside: true
---



This is not a great explanation, but I don't want to go too far into this on this page.

Let's briefly consider how divergence and curl are related to Taylor series. Suppose $$\b{f} : \bb{R}^3 \ra \bb{R}^3$$. Then:

$$\b{f}(\b{x} + \b{e}) \approx \b{f}(\b{x}) + J_f \b{e} + O(|\b{e}|^2)$$

We can write $$J_f = \begin{pmatrix} \p_x f_x & \p_y f_x \\ \p_x f_y & \p_y f_y \end{pmatrix}$$ as a sum of antisymmetric and symmetric matrices, via $$J_f = \frac{1}{2}(J_f + J_f^T) + \frac{1}{2}(J_f - J_f^T)$$, which gives:

$$\begin{aligned} \b{f}(\b{x} + \b{e}) &\approx \b{f}(\b{x}) \\
&+ 
\begin{pmatrix} \p_x f_x & \p_y f_x + \p_x f_y \\ \p_x f_y + \p_y f_x & \p_y f_y \end{pmatrix} \b{e} \\
&+ \begin{pmatrix} 0 & \p_y f_x - \p_x f_y \\ \p_x f_y - \p_y f_x & 0 \end{pmatrix} \b{e} \\
&+ O(|\b{e}|^2) \end{aligned}$$

The _divergence_ of $$\b{f}$$ at $$\b{x}$$ can be written as $$\nabla \cdot \b{f}$$ or just $$\vec{\p}^i \b{f}_i = \vec{\p} \cdot \b{f}$$. It's the trace of $$J$$, though it's useful to think of it as the trace of the first term: $$\vec{\p} \cdot \b{f} = \tr J = \tr \frac{1}{2} (J + J^T)$$. 

Conceptually, the divergence is the net flux of $$\b{f}$$ through an infinitesimal sphere at $$\b{x}$$, but when the sphere is small enough we can just treat it as a cube, and consider the flux through each coordinate -- which is given by $$\sum_i x^i J_f x_i$$.

The _curl_ of $$\b{f}$$ is the entire matrix $$\p \^ \b{f} = \frac{1}{2}(J - J^T)$$, though it's treated as a bivector. It has a component for each coordinate pair, like $$(\p \^ \b{f})_{xy} = \p_x \b{f}_y - \p_y \b{f}_x$$. It tells you the difference between how $$\b{f}_x$$ changes in the y-direction and how $$\b{f}_y$$ changes in the x-direction, aka how much 'net rotation' there is on that plane at the point.

Generally speaking, in dimensions greater than $$3$$ you have many more operators like these two -- they are all applications of the exterior derivative operator. But the other operators don't act on vector functions; you would need a function which produced bivectors (or antisymmetric matrices) to take the $$n=2$$ to $$n=3$$ exterior derivative.

Note that $$\tr (J - J^T) = 0$$ and $$(J+J^T) - (J + J^T)^T = 0$$. This means the divergent part of $$f$$ has no curl and the curl part has no divergence, which suggests the [Helmholtz decomposition](https://en.wikipedia.org/wiki/Helmholtz_decomposition) of $$\b{f}$$ into curl-free and divergence-free parts.

