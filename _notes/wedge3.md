---
layout: article
title: "Still more about the exterior algebra"
math: true
aside: true
footnotes: true
---

## 1. Vectors over 'multi-bases'

Consider a matrix like

$$Q = \begin{pmatrix} a_1 & a_2 & a_3 \\ b_1 & b_2 & b_3 \end{pmatrix}$$

It is not uncommon to write this in various _block forms_, where the elements of our blocks are themselves matrices or scalars. Some examples:

$$\begin{pmatrix} A \\ B \end{pmatrix}$$

$$\begin{pmatrix} Q_1 & Q_2 & Q_3 \end{pmatrix}$$

$$\begin{pmatrix} \begin{pmatrix} a_1 & a_2 \\ b_1 & b_2 \end{pmatrix} & \begin{pmatrix} a_3 \\ b_3 \end{pmatrix} \end{pmatrix}$$

$$\begin{pmatrix} Q \end{pmatrix}$$

$$\begin{pmatrix} a_1 & a_2 & a_3 \\ b_1 & b_2 & b_3 \end{pmatrix}$$

(The last two are just 'the matrix as a single block' and 'the matrix itself'.)

I want to propose that there seems to be a generalization of the 'wedge product' $$\wedge$$, and related operations like $$\det$$ and $$Q^{-1}$$, that operate symmetrically on _all_ of these structures. 

The argument for the validity of the interpretation will be that it treats every way of re-writing a matrix like $$Q$$ the same way. In the process, some well-known formulas will receive tiny and elegant proofs, compared to anything I've been able to find.

I'm not being rigorous or precise. The point is to show that this version of $$\wedge$$ is _compelling_, by demonstrating what it seems to be able to do.

(Every vector space mentioned on this page will be finite-dimensional, by the way.)

------

I will use $$\text{basis}(V)$$ to stand for "a set of basis vectors for a vector space $$V$$", where the choice doesn't matter. 

A vector $$v \in V$$ may be written as $$v^i \hat{e}_i$$, where $$\{\hat{e}_i \} = \text{basis}(V)$$. Normally we write vector components as a column vector $$\begin{pmatrix} v^1 \\ v^2 \end{pmatrix}$$, but this should be understood to represent, literally, a direct sum:

$$\begin{pmatrix} v^1 \\ v^2 \end{pmatrix} \equiv v^1 \hat{e}_1 \oplus v^2 \hat{e}_2 $$

A matrix is a representation of a linear map $$V \ra W$$ where $$V$$ and $$W$$ are vector spaces over the same field $$K$$, and is an element of $$V^* \otimes W$$. If $$\{ \hat{e}_i \} = \text{basis}(V)$$ and $$\{ \hat{f}_j \} = \text{basis}(W)$$, then a matrix $$Q \in V^* \otimes W$$ is a direct sum of elements $$Q_i^j \hat{e}^i \otimes \hat{f}_j$$, and $$\hat{e}^i \otimes \hat{f}_j = \text{basis}(V^* \otimes W)$$.


(Though note that, if we don't care about $$V$$ otherwise, or if $$V^* \simeq V$$, we may as well just relabel $$V^*$$ as $$V$$ for simplicity.)

When we write a linear transformation as a matrix, it's usually implied that the vector spaces it maps between are over the same field, so that the coefficient $$Q_{i}^j$$ makes sense. Strictly speaking this is not necessary. Let's assume it's true everywhere on this page. I will still use different basis symbols $$\hat{e}_i$$ and $$\hat{f}_j$$ sometimes to make it clear which parts are in which space, though it may turn out that $$\hat{e}_i = \hat{f}_i$$.

We see that we may write a matrix like $$Q$$, above, as:

$$\begin{aligned}Q &= \begin{pmatrix} a_1 & a_2 & a_3 \\ b_1 & b_2 & b_3 \end{pmatrix} \\
& = a_1 \hat{e}^1 \otimes \hat{f}_1 \oplus  a_2 \hat{e}^2 \otimes \hat{f}_1 \oplus  a_3 \hat{e}^3 \otimes \hat{f}_1 \oplus  b_1 \hat{e}^1 \otimes \hat{f}_2 \oplus  b_2 \hat{e}^2 \otimes \hat{f}_2 \oplus  b_3 \hat{e}^3 \otimes \hat{f}_2 \end{aligned}$$

But we are also free to label the elements of $$\text{basis}(V^*) \otimes \text{basis}(W)$$ as $$\hat{q}_k$$. In this case $$k$$ may be thought of as a [multi-index](https://en.wikipedia.org/wiki/Multi-index_notation) like $$\vec{k} = (i, j)$$, or whatever enumeration you want, such that $$\hat{q}_k = \hat{e}^i \otimes \hat{f}_j$$. Then we can write:

$$Q = Q_k \hat{q}_k = a_1 \hat{q}_1 \oplus a_2 \hat{q}_2 \oplus a_3 \hat{q}_3 \oplus b_1 \hat{q}_4 \oplus b_2 \hat{q}_5 \oplus b_3 \hat{q}_6$$

Often we will replace $$\oplus$$ with $$+$$, because it's easier to read, but it should be understood that the operation is $$\oplus$$ if elements of different spaces are being added. So the previous line is the same as:

$$Q  = a_1 \hat{q}_1 + a_2 \hat{q}_2 + a_3 \hat{q}_3 + b_1 \hat{q}_4 + b_2 \hat{q}_5 + b_3 \hat{q}_6$$

--------

If we relax the requirement that the spaces $$V$$ and $$W$$ in $$Q \in V^* \otimes W$$ be _vector spaces_, we can write $$Q$$ in more ways. 

Specifically, we will allow our basis 'vectors' to instead be _tuples_ of basis vectors (perhaps we can call them a **multibasis**), and we will allow our 'scalar coefficients' to become vector or matrix coefficients. For example, we can write:

$$Q = \begin{pmatrix} A \\ B \end{pmatrix} = A_i \hat{e}^i \otimes \hat{f}_1 + B_i \hat{e}^i \otimes \hat{f}_j$$

This still _looks_ like a vector, but $$A = \begin{pmatrix} a_1 & a_2 & a_3 \end{pmatrix}$$, and the coefficients and basis elements sum together. We can go a step further by defining $$\vec{e} = \hat{e}^i$$:

$$Q = A \vec{e} \otimes \hat{f}_1 + B \vec{e} \otimes \hat{f}_2$$


The idea here is that we 'forget' how the space $$V^*$$ is composed in the decomposition $$Q = V^* \otimes W$$, and index it by a single value. This of course works column-wise as well:

$$Q = \begin{pmatrix} a_1 \\ b_1 \end{pmatrix} \hat{e}^1 \otimes \vec{f} +  \begin{pmatrix} a_2 \\ b_2 \end{pmatrix} \hat{e}^2 \otimes \vec{f} +  \begin{pmatrix} a_3 \\ b_3 \end{pmatrix} \hat{e}^3 \otimes \vec{f}
=  \begin{pmatrix} a_i \\ b_i \end{pmatrix} \hat{e}^i \otimes \vec{f}$$

Using the labels in the intro:

$$Q = \begin{pmatrix} Q_1 & Q_2 & Q_3 \end{pmatrix} = Q_i \hat{e}^i \otimes \vec{f}$$

Or, we can write $$Q$$ is as a single element of a space:

$$Q \equiv Q_k \hat{q}_k = Q \vec{q}$$

This means we interpret the _linear transformation_ $$Q$$ as a single 'matrix coefficient' times a 'tuple of basis vectors', which just happens to mean the same thing as the matrix interpretation in the first place.

--------
These 'generalized vectors' continue to make sense with tensor products and, particularly, for tensors of rank $$> 2$$. For instance, consider the tensor product of two vectors $$v \in V$$, $$w \in W$$:

$$\vec{v} \otimes \vec{w} = (v^i \hat{e}_i) (w^j \hat{f}_j) = v^i w^j \hat{e}_i \otimes \hat{f}_j$$

This is the same as:

* a vector over $$V$$, whose coefficients are vectors in $$W$$: $$\vec{v} \otimes \vec{w}  = (v^i \vec{w}) \hat{e}_i$$
* a vector over $$W$$, whose coefficients are vectors in $$V$$: $$\vec{v} \otimes \vec{w} = (\vec{v} w^j) \hat{f}_j$$

* a vector over $$Q = V \otimes W$$ with a single component, which is a matrix: $$\vec{v} \otimes \vec{w} = (v \otimes w)^k \hat{q}_k$$

-----

Evidently if we allow our coefficients to be anything (scalars, vectors, matrices, tensors), ranging over multibases that preserve all of the formulae, then all of these types of objects are just elaborate versions of 'vectors'.

But why do any of this?

Answer: because a lot of equations around regular vector-space vectors and matrices are _suspiciously valid_ when blindly applied to tensor-valued vectors.

## 2 Illustrative Examples

[Lagrange's Identity](https://en.wikipedia.org/wiki/Lagrange%27s_identity) says for vectors $$\in \bb{R}^3$$:

$$| \b{a} |^2 | \b{b} |^2 = ( \b{a} \cdot \b{b} )^2 + | \b{a} \times \b{b} |^2$$

Or in any dimension:

$$| \b{a} |^2 | \b{b} |^2 = ( \b{a} \cdot \b{b} )^2 + | \b{a} \wedge \b{b} |^2$$

It is a specific case of the [Binet-Cauchy Identity](https://en.wikipedia.org/wiki/Binet%E2%80%93Cauchy_identity), when $$\b{a} = \b{c}$$ and $$\b{b} = \b{b}$$:

$$(\b{a} \cdot \b{c}) (\b{b} \cdot \b{d})  = (\b{a} \cdot \b{d}) (\b{b} \cdot \b{c}) + (\b{a} \wedge \b{b}
) \cdot (\b{c} \wedge \b{d})$$

(And further generalizes to the [Cauchy-Binet Identity](https://en.wikipedia.org/wiki/Cauchy%E2%80%93Binet_formula) (yeah, they just reversed the names).)

This formula is not hard to prove via coordinate representations of the vectors $$\b{a}, \b{b}, \b{c}, \b{d}$$. What's interesting is that it also appears to work this way:

Recall that for a $$2 \times 2$$ matrix $$C = \begin{pmatrix} a & b \\ c & d \end{pmatrix}$$, $$\det C = ad - bc$$, and this determinant can be written as $$\wedge^2 C = \begin{pmatrix} a \\ c \end{pmatrix} \wedge \begin{pmatrix} b \\ d \end{pmatrix}$$.

Now let's try some bogus-looking operations on a 'matrix of vectors':

$$\begin{aligned} 
\det \big[ \begin{pmatrix} A \\ B \end{pmatrix} \cdot \begin{pmatrix} C & D \end{pmatrix} \big] &= \det \begin{pmatrix} A \cdot C & A \cdot D \\ B \cdot C & B \cdot D \end{pmatrix} \\
&= (A \cdot C) ( B \cdot D) - (A \cdot D )( B \cdot C )
\end{aligned} $$

But meanwhile, $$\det PQ = \det P \det Q$$ on matrices, so maybe $$\wedge^2 PQ = \wedge^2 P \wedge^2 Q$$?

$$\begin{aligned} 
\det \big[ \begin{pmatrix} A \\ B \end{pmatrix} \cdot \begin{pmatrix} C & D \end{pmatrix} \big] &= \wedge^2 \begin{pmatrix} A \\ B \end{pmatrix} \cdot \begin{pmatrix} C & D \end{pmatrix} \\
&= \wedge^2 \begin{pmatrix} A \\ B \end{pmatrix} \cdot \wedge^2 \begin{pmatrix} C & D \end{pmatrix}  \\
& \stackrel{?}{=} (A \wedge B) \cdot (C \wedge D) \end{aligned}$$

which _appears_ to say that

$$(A \wedge B) \cdot (C \wedge D) = (A \cdot C) ( B \cdot D) - (A \cdot D )( B \cdot C )$$

Assuming that these plausible-looking expressions makes sense:

* &nbsp;$$\wedge^2 \begin{pmatrix} A \\ B  \end{pmatrix} = A \wedge B$$
* &nbsp;$$\wedge^2 P \cdot Q = \wedge^2 P \cdot \wedge^2 Q$$
* &nbsp;$$\begin{pmatrix} A \\ B \end{pmatrix} \cdot \begin{pmatrix} C & D \end{pmatrix} = \begin{pmatrix} A \cdot C & A \cdot D \\ B \cdot C & B \cdot D \end{pmatrix}$$

Just for completeness, the Lagrange Identity version:

$$\begin{aligned} 
\| \b{a} \wedge \b{b} \|^2 &= \wedge^2 \big[ \begin{pmatrix} \b{a} \\ \b{b} \end{pmatrix} \cdot \begin{pmatrix} \b{a} & \b{b} \end{pmatrix} \big]   \\
&= \wedge^2 \begin{pmatrix} \b{a} \b{a} & \b{a} \b{b} \\ \b{b} \b{a} & \b{b} \b{b} \end{pmatrix} \\
&= |\b{a}|^2 |\b{b}|^2 - (\b{a} \cdot \b{b})^2
\end{aligned}$$

Which trivially implies the Cauchy-Schwartz inequality:

$$\Ra (\b{a} \cdot \b{b})^2 \leq |\b{a}|^2 |\b{b}|^2$$

(Since the strictly-positive term $$\| \b{a} \wedge \b{b} \|^2$$ is missing.)
