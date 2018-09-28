---
layout: article
title: "Pseudo-basis vectors"
math: true
aside: true
footnotes: true
---


Suppose we have a vector $$\vec{v} = v_x \hat{x} + v_y \hat{y} + v_z \hat{z} \in \bb{R}^3$$, and we want to write it, for some reason, like this:

$$\vec{v} = v_x \hat{x} + v_{yz} \hat{yz}$$

Call this the $$(x,yz)$$ 'basis'. What does linear algebra look like when we write a vector like this?

-------

Clearly the $$v_{yz}$$ coefficient is itself a vector: $$\vec{v} = v_x \hat{x} + (v_y, v_z) \cdot (\hat{y}, \hat{z})$$. 

The magnitude of $$\vec{v}$$ is more or less created the same way from the magnitudes of its parts:

$$| \vec{v} | = \sqrt{v_x^2 + | v_{yz} |^2 } = \sqrt{v_x^2 + v_y^2 + v_z^2}$$

We can normally extract coordinates by projecting onto each basis 'vector':

$$v_x = \hat{x} \cdot \vec{v}$$

If we try to extract $$v_{yz}$$ this way, we probably _don't_ want to get a scalar:

$$v_{y + z} = (\hat{y} + \hat{z}) \cdot \vec{v} \stackrel{?}{=} v_y + v_z$$

We want the result to be a projection on the $$yz$$ plane:

$$v_{yz} = (\hat{y} \otimes \hat{y} + \hat{z} \otimes \hat{z}) \cdot \vec{v} = (v_y, v_z) \cdot (\hat{y}, \hat{z})$$

Which looks exactly like projecting on to the $$\hat{x}$$ axis:

$$v_x \hat{x} = (\hat{x} \otimes \hat{x}) \cdot \vec{v}$$

(The dot product is understood to apply to apply to the rightmost argument of $$\otimes$$ in this notation.) 

(Also note that using $$((\hat{y} + \hat{z}) \otimes (\hat{y} + \hat{z})) \cdot \vec{v}$$ would instead project just on to the line $$\hat{y} + \hat{z}$$, giving a single scalar coefficient instead of a vector. And it wouldn't be correctly normalized; projecting onto an arbitrary vector requires using $$(\frac{\vec{u}}{\| u \|} \otimes \frac{\vec{u}}{\| u \|})$$.)

--------

If a linear transformation $$A$$ acts on $$\bb{R}^3$$ like this:

$$\begin{aligned} 
A (\vec{v}) &= \begin{pmatrix} A_{xx} & A_{xy} & A_{xz} \\ A_{yx} & A_{yy} & A_{yz} \\ A_{zx} & A_{zy} & A_{zz} \end{pmatrix}
\begin{pmatrix} v_x \\ v_y \\ v_z \end{pmatrix} \\ 
&= \begin{pmatrix} A_x & A_y & A_z \end{pmatrix}\begin{pmatrix} v_x \\ v_y \\ v_z \end{pmatrix} \\
&= A_x v_x + A_y v_y + A_z v_z
\end{aligned}$$

Then in our new 'basis' it should look act like this:

$$A (\vec{v}) = A_x v_x + A_{yz} v_{yz}$$

Which amounts to writing it as a block matrix:

$$A (\vec{v}) = \begin{pmatrix} A_{x, x} & A_{x, yz} \\ A_{yz, x} & A_{yz, yz} \end{pmatrix} \begin{pmatrix} v_x \\ v_{yz} \end{pmatrix} \\
= A_{xx} v_x + A_{x, yz} \cdot v_{yz} + A_{yz,x} v_x + A_{yz, yz} \cdot v_{yz}$$

As long as everything multiplies according to usual rules of matrix multiplication, this gives the same result as above.

------

Suppose the transformation is a rotation matrix which fixes the $$z$$ axis and mixes $$x$$ and $$y$$:

$$R = \begin{pmatrix} \cos \theta & -\sin \theta & 0 \\ \sin \theta & \cos \theta & 0 \\ 0 & 0 & 1 \end{pmatrix}$$

It seems like this operation might be tricky to understand this operation in the $$(\hat{x}, \hat{yz})$$ basis. The matrix would be decomposed this way:

$$R = \begin{pmatrix} \cos \theta & \begin{pmatrix} -\sin \theta & 0 \end{pmatrix} \\ \begin{pmatrix} \sin \theta \\ 0 \end{pmatrix} & \begin{pmatrix} \cos \theta & 0 \\ 0 & 1 \end{pmatrix} \end{pmatrix}$$

We should define the transpose of a matrix with matrix coefficients in the natural way, so that we get the same result if we transpose $$(R_x, R_{yz})$$ as if we compute $$R^T$$ and then write it in the $$(x,yz)$$ basis. Namely, if we write $$R_{ij}$$ and let $$i,j$$ take values in the set $$(x,yz)$$, then we have to define that $$(R_{ij})^T = R_{ji}^T$$ -- ie, if a matrix element is a scalar, it's unchanged, but if it's matrix it has to be transposed as well. 

(Since complex numbers are isomorphic to $$2 \times 2$$ matrices, this is the reason why the transpose operation is replaced with Hermitian conjugation when dealing with matrices over complex numbers: because the scalars have to be 'transposed' also, and $$(a+bi)^T = a-bi$$ when considered as a matrix.)

With this definition it's easily verified that $$R^T R = R R^T = I$$, so 'orthogonality' still makes sense.

The action of $$R$$ on a vector in the $$(x,yz)$$ basis is:

$$R (\vec{v}) = 
\begin{pmatrix} 
(\cos \theta) v_x + (-\sin \theta, 0) v_{yz} \\
\begin{pmatrix} \sin \theta \\ 0 \end{pmatrix} v_x  + \begin{pmatrix} \cos \theta & 0 \\ 0 & 1 \end{pmatrix} v_{yz}
\end{pmatrix}$$

This is something like "a rotation in the $$(x,yz)$$ 'plane'". It's one of a one-dimensional space of rotations that mix $$x \lra yz$$, since a rotation in the $$xy$$ plane would also mix them. 

To interpret as a 2d-like operation, we might write it something like this:

$$R(\vec{v}) = \begin{pmatrix} v_x \cos \theta - v_{yz} \vec{\sin} \; \theta \\ v_x \vec{\sin} \; \theta + v_{yz} \stackrel{?}{\vec{\cos} \theta} \theta \end{pmatrix}$$

The $$\vec{\sin} \theta$$ terms are vectors which have $$\| \vec{\sin} \theta \| = \pm \sin \theta$$, so they act like the off-diagonal terms in a 2-dimensional rotation matrix. The matrix term $$\vec{\cos} \; \theta \stackrel{?}{=} \begin{pmatrix} \cos \theta & 0 \\ 0 & 1 \end{pmatrix}$$ makes less sense, though.

One way to understand it might be: suppose we consider $$\sin \theta$$ to be the 'natural' operation, and define $$\cos \theta$$ only in terms of it, as $$\cos \theta = \sqrt{1 - \sin^2 \theta}$$. Then we might imagine that this makes sense (being very sloppy with the signs of the square roots):

$$\begin{aligned} 
\sqrt{1 - \vec{\sin}^2 \theta} 
&= \sqrt{I - (\vec{\sin} \; \theta) \otimes (\vec{\sin} \; \theta)} \\
&= \sqrt {\begin{pmatrix} 1 - \sin^2 \theta & 0 \\ 0 & 1 \end{pmatrix}} \\
&= \sqrt {\begin{pmatrix} \cos^2 \theta & 0 \\ 0 & 1 \end{pmatrix}} \\
&= \begin{pmatrix} \cos \theta & 0 \\ 0 & 1 \end{pmatrix} \end{aligned}$$


The idea is: we insist that $$\vec{\sin} \; \theta$$ be a vector with magnitude $$\sin \theta$$. We insist that the diagonal terms, which act like cosines, obey $$\vec{\sin}^2 \; \theta + \vec{\cos}^2 \; \theta = I$$. We don't really specify _how_ they do that. We wave our hands and claim that $$\begin{pmatrix} \cos \theta & 0 \\ 0 & 1 \end{pmatrix}$$ is one such diagonal term, if multiplication is interpreted as $$\otimes$$.
