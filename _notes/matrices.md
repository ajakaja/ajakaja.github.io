---
layout: article
title: "Note on Matrices"
math: true
category: notes
footnotes: true
---

Some notes on matrices. I think that without understanding matrix behavior in a more intuitive way, I will never have a hope of naturally abstracting matrix operations to tensors, as would be necessary to de-obfuscate GR or QFT.

## Whence Diagonalizability?

Consider a matrix $$A = A_{ij}$$ in a finite vector space $$V$$ of dimension $$N$$ over $$\mathbb{R}$$.

If $$A$$ is diagonalizable, then it factors into $$N$$ 1-dimensional actions on subspaces, ie, it has $$N$$ eigenvalues:

$$A\b{v} = \lambda \b{v}$$

And there is a basis where it is written as a diagonal matrix of its eigenvalues:

$$A = P^{-1} \Lambda P$$

Such that in $$A\b{v} = P^{-1} \Lambda P \b{v}$$, $$P$$ extracts $$\b{v}$$ onto this basis, then $$\Lambda$$ scales each component, and then $$P^{-1}$$ moves back to the original matrix.

----

In general there is no reason to think that a matrix _should_ be able to be decomposed this way. Why should its action be decomposable into actions on $$N$$ independent subspaces? In fact, it is easy to write down a matrix that is not (over $$\bb{R}$$):

$$R = \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}$$

Which corresponds to (is a matrix representation of) the $$i$$ of complex analysis (ie, $$R^2 = -I \simeq -1$$), and takes $$(x,y) \mapsto (-y, x)$$, ie, is a clockwise quarter-turn.

Unsurprisingly, there is no way to solve its characteristic equation in just $$\bb{R}$$: 

$$\det (R - \lambda I) = \lambda^{2} + 1 = 0$$

The normal thing to do is say "a-ha, but what about $$\mathbb{C}$$?", and say that $$\lambda = \pm i$$. Using this you can write $$R$$ in a diagonal form:

$$R = P^{-1} \begin{pmatrix} i & 0 \\ 0 & -i \end{pmatrix} P$$

The normalized eigenvectors are $$\frac{1}{\sqrt{2}} \begin{pmatrix} 1 \\ \mp i \end{pmatrix}$$, so $$P = \frac{1}{\sqrt{2}} \begin{pmatrix} 1 & 1 \\ -i & +i \end{pmatrix}$$. Whatever. 

More generally, for $$R_{\theta} = \begin{pmatrix} \cos \theta & -\sin \theta \\ \sin \theta & \cos \theta \end{pmatrix}$$, the eigenvalues are $$e^{\pm i \theta}$$, with the same eigenvectors.

<br/>

The intuition is approximately this: to describe the action of $$R$$ or $$R_\theta$$ on $$(x,y)$$, we write $$(x,y)$$ in terms of $$\begin{pmatrix} 1 \\ \mp i \end{pmatrix}$$ which it multiplies by $$e^{\pm i \theta}$$, where the imaginary quantity stands for something like 'bookkeeping' -- we have to have a non-zero value in that position in order to let rotation be linear, so if a quantity is entirely in $$x$$, then its y-value is imaginary. Multiplication by $$e^{i \theta}$$ then makes the real quantities imaginary and the imaginary quantities real, according to $$\theta$$, such that the x- and y- coordinates can rotate 'independently'.  (For the $$y$$-direction, the bookkeeping is instead in the real value. I think.)

More explicitly: look at $$P \b{x}$$ is:

$$P (x \b{x}) = \frac{1}{\sqrt{2}}\begin{pmatrix} x \\ ix \end{pmatrix}$$

The magnitude of $$x b{x}$$ has been spread among both coordinates, so that it can be rotated individually via multiplication-by-$$e^{i \theta}$$. The imaginary term serves to stand for the currently-nonexistent quantity of $$x$$, which becomes real as the other term becomes imaginary. (The normalization factor is ignorable; it could have been entirely relegated to $$P^{-1}$$ but for the convention of normalizing $$P$$.)

See? It's a wonky procedure, but it 'finds', somehow, a 1-dimensional subspace for $$x-$$ rotation, basically by cheating and doubling the underlying field in order to store data.

--------

I think this should strike us as a weird procedure: we are led to expand the field in order to write the action of $$R$$ as splitting into actions on two subspaces, which -- well, of course we had to do _something_, because it fundamentally _doesn't_ split into two subspaces; it rotates them into each other. In fact, $$\begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}$$ seems to be the more 'fundamental' way to write this action, anyway. How come it is even _possible_ to diagonalize this?

But it works, and it's not too hard to compute, and we're not scared of complex numbers so we do it.

## 2 Jordan Form

Even with this trickery, some matrices cannot be made diagonalizable. The technical requirement is that the dimension of the eigenspace matches the dimension of the matrix, which makes sense: you can only diagonalize a matrix if there are $$N$$ eigenvalue + eigenvector pairs for it to (diagonally) act on. Wikipedia [claims](https://en.wikipedia.org/wiki/Diagonalizable_matrix#Matrices_that_are_not_diagonalizable) that some matrices are not diagonalizable over _any_ field, if their algebraic multiplicity (the number of eigenvalues, including multiples of the same one) is not equal to their geometric multiplicity (the dimension of the span of their eigenvectors).

Geometric multiplicity is a bit tricky to wrap one's head around. It helps to go further into the theory -- to the concept of _generalized eigenvectors_ -- and then circle back to understand it, because just looking at eigenectors and wondering about their dimension for a particular matrix doesn't seem to make me understand what they mean in general.

A generalized eigenvector rounds out the space of eigenvectors to match the dimension of a space. While a normal eigenvalue/vector satisifies $$A \b{v} = \lambda \b{v} \Lra (A - \lambda I) \b{v} = 0 $$, a generalized eigenvector/value satisifies:

$$(A - \lambda I)^k \b{v} = 0$$

When $$k=1$$, this is the same as a regular eigenvector. When $$k > 1$$, though:

$$(A - \lambda I)[ (A - \lambda I)^{k-1} \b{v} ] = 0$$

Observe that $$\b{u} = [ (A - \lambda I)^{k-1} \b{v} ]$$ must be itself a regular eigenvector, since $$(A - \lambda I) \b{u} = 0$$.

So: a "generalized eigenvector" is a vector which, under the action of $$A - \lambda I$$, maps to ... another generalized eigenvector, eventually reaching a regular one. Remember that eigenvalue decompositions decompose $$A$$ into its action on 1-dimensional subspaces. When this _can't_ be done, what we do instead is compose it into a $$k$$-dimensional subspace, for a certain eigenvalue $$\lambda_i$$ that has a 'bottom':

$$\b{v}_k \ra \b{v}_{k-1} \ra \ldots \ra \b{v}_{1} \ra 0$$

 
This sequence is called a "Jordan chain". Multiplication by $$A - \lambda I$$ moves down the chain until eventually annihilating. 

If $$R$$ above corresponds to rotation, which was not diagonalizable without augmenting the space, generalized eigenvectors apparently correspond to _shears_, which add one dimension to another in an asymmetric way. 

Their simplest form (after using the generalized eigenvectors to make a change of basis matrix; I'm omitting details) is the "Jordan normal form", which has 1s on the superdiagonal:

$$B = \begin{pmatrix} \lambda & 1 \\ 0 & \lambda \end{pmatrix}$$

The action of $$J$$ on a vector is shearing: 

$$B \begin{pmatrix} x \\ y \end{pmatrix} = \begin{pmatrix} \lambda x + y \\ \lambda y \end{pmatrix}$$

Since _every_ matrix can be put in Jordan normal form:

* The generalized eigenvectors of $$A$$ _do_ span $$V$$
* Every non-diagonalizable transformation (via augmenting the field, or whatever) is in some sense a shear.

It sort-of makes sense to me. Shears are fundamentally non-symmetric, unlike rotations, and so there may be no clean way to decompose them into a single 1-dimensional operation?

--------

Repeated action of $$B$$ continually puts y-values into x-values:

$$\begin{aligned} 
B (x,y) &= (\lambda x + y, \lambda y) \\
B^2 (x,y) &= (\lambda^{2} x + 2 \lambda y, \lambda^2 y) \\
\\
B^k \begin{pmatrix} x \\ y \end{pmatrix} &= \begin{pmatrix} \lambda^k x + k \lambda^{k-1} y \\ \lambda^k y \end{pmatrix}
\end{aligned}$$

Despite a lot of investigation, I still find this form _odd_. Why is _this_ the way to decompose truly non-diagonalizable matrices? Why does expanding the field work on rotations, but not on these?

...Also, why is the off-diagonal term the derivative of the on-diagonal term? 

(Answer: because $$N = \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix}$$ acts like the $$\e$$ of calculus, ie $$\e^2 = 0$$, and so $$B = \lambda I + N$$ acts like $$\lambda + \e$$, and so $$f(\lambda + \e) = f(\lambda) + \p_{\lambda} f(\lambda) \e$$. But it's still suspicious!)

I wonder if diagonalization is _not_ the best way to decompose the action of a matrix? If we're going to force everything into diagonal elements, we should succeed. If we're going to not, then we should do something else entirely. Maybe?

When it works, diagonalization is, of course, fantastic for computation. Writing $$A = P^{-1} \Lambda P$$ means that computing functions of $$A$$ is trivial, since $$A^k = P^{-1} \Lambda^k P$$, so you can use $$A$$ in a Taylor series. 

(It is easier still because the Cayley-Hamilton theorem says that $$\chi(A) = 0$$, ie, $$A$$ is a solution to its own characteristic polynomial, so every power of $$A$$ higher than $$N$$ can be expressed in terms of lower powers. This is trivial to see if $$A$$ is diagonalizable, but pretty mysterious otherwise. No, you can't plug it into $$\det(A - IA) = 0$$.)

Basically: if we wanted a more intuitive decomposition, we would still want a property like $$A = P^{-1} \Lambda P$$, or it would be pretty useless.

## 3 Dual Numbers, or something?

When we were trying to diagonalize the matrix form of a complex number, we augmented our field with complex numbers. We could have just written it directly with complex numbers anyway:

$$\begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix} \begin{pmatrix} x \\ y \end{pmatrix} = \begin{pmatrix} -y \\ x \end{pmatrix} \Lra i \times (x + iy) = -y + ix $$

It turns out there is a number-system interpretation of $$\begin{pmatrix} 0 & 1 \\ 0 & 0\end{pmatrix}$$: the [dual numbers](https://en.wikipedia.org/wiki/Dual_number), which are the reals augmented by $$\e$$ with $$\e^2 = 0$$. (This is basically the same as the infinitesimal $$\e$$ of calculus, except that instead of stating that we don't care about $$O(\e^2)$$, we codify it by setting $$\e^2 = 0$$.)

A dual number $$z = (a+be)$$ therefore obeys such equations as $$(a + be)^{2} = a^{2} + 2ab \e$$, or $$z \bar{z} = (a+be)(a - be) = a^{2}$$. 

These correspond to matrix equations $$\begin{pmatrix} a & b \\ 0 & a \end{pmatrix}$$. (The whole thing could be defined with the transpose of this also; what's important is that it's diagonal.)

So we may think to relate the two like above. How? Apparently like this:

$$\begin{pmatrix} \lambda & 1 \\ 0 & \lambda \end{pmatrix} \begin{pmatrix} x \\ y \end{pmatrix} = \begin{pmatrix} \lambda x + y \\ \lambda y \end{pmatrix} \Lra (\lambda + \e)(\e x + y) = \lambda \e x + \e y + \lambda y = \e (\lambda x + y) + 1 (\lambda x) $$

That is: apparently, the x-coordinate gets multiplied by $$\e$$ in order to represent it as a dual number. (Or the $$y$$-coordinate could be multiplied by $$\frac{1}{\e}$$, but, according to wikipedia you can't divide by these things?)

-------------

Therefore I imagine that there should be a way to let the eigenvalues of B take values in the dual numbers $$\lambda \pm \e$$, so we can write $$B$$ diagonally.

Unfortunately, the dual numbers $$\bb{D}$$ aren't a field, so this isn't quite a vector space anymore. I am not sure what it is (well: it's a $$\bb{D}$$-module, but I don't know what that _does_).

Nevertheless, let's see if we can get it to work.

$$B$$ already has one obvious eigenvalue $$\lambda$$ with eigenvector $$\begin{pmatrix}1 \\ 0 \end{pmatrix}$$, so we're only looking for the other.

For some values of $$a, x, y$$, we need:

$$\begin{aligned}
\lambda x + y &= ax \\
\lambda y &= ay 
\end{aligned}$$

Obviously over $$\bb{R}$$ this is only solved by the eigenvalue we already found, with $$y = 0$$ and $$\lambda = a$$.

If $$y \neq 0$$, then suppose $$y$$ is pure real (non-dual). Then  we can take $$y=1$$ and $$\lambda = a$$, which gives $$\lambda x + 1 = \lambda x$$, which works for no real $$x$$. Therefore let $$y = \e$$:

$$\begin{aligned}
\lambda x + \e &= ax \\
\lambda \e &= a\e 
\end{aligned}$$

This is solved by $$a = \lambda + e$$ and $$x = \<\text{anything}\>$$. That is:

$$\begin{pmatrix}
\lambda & 1 \\ 0 & \lambda
\end{pmatrix} \begin{pmatrix} 1 \\ \e \end{pmatrix} = (\lambda + \e) \begin{pmatrix} 1 \\ \e \end{pmatrix}$$

Except, by some quirk of $$\bb{D}$$, we can also multiply the $$\e$$ term by any constant and it still works:

$$\begin{pmatrix}
\lambda & 1 \\ 0 & \lambda
\end{pmatrix} \begin{pmatrix} 1 \\ b \e \end{pmatrix} = (\lambda + b \e) \begin{pmatrix} 1 \\ b \e \end{pmatrix} = \begin{pmatrix} \lambda + b \e \\ \lambda b \e \end{pmatrix} $$

If we can rescale one coordinate, this isn't a very good eigenvector.

Basically this happens because dual numbers break this deduction:

$$ax = bx \Ra a = b$$

As seen in the case of $$(\lambda + a\e) y = \lambda y$$; by letting $$y = b \e$$, the asymmetric $$a \e$$ term does nothing on the left side.

