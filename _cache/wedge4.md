---
layout: article
title: "Wedge products on block matrices"
footnotes: true
math: true
aside: true
---

The exterior algebra $$\^ V$$ of a vector space $$V$$ is the quotient of the tensor algebra $$\o V$$ by the relation which identifies all symmetric elements like $$\b{x} \o \b{x}$$ or $$\b{x \o y + y \o x}$$. This causes antisymmetric elements to be equivalent: $$\b{x \o y} \sim \b{y \o x}$$.

The wedge product, we recall, is the action of the tensor product under this quotient. We can compute it by consider the tensor product with every symmetric term canceled out or identified:

$$\begin{aligned}
\b{a} \^ \b{b} &= (a_x \b{x} + a_y \b{y}) \^ (b_x \b{x} + b_y \b{y}) \\
&= a_x b_x \cancel{ \b{x \o x} } + a_x b_y \b{x \o y} + a_y b_x \b{y \o x} + a_y b_y \cancel{\b{y \o y} }\\
&\sim (a_x b_y - a_y b_x) \b{x \o y} \\
&\equiv (a_x b_y - a_y b_x) \b{x \^ y}
\end{aligned}$$

I suspect this can be extended to non-commutative coefficients. Particularly, to matrices which are written as vectors-of-vectors:

$$A = ( A_1 , A_2) = A_1 \b{x}_1 + A_2 \b{x}_2 $$

Or even to block matrices, whose coefficients are themselves matrices:

$$Q = (A, B) $$

A good approach for developing this would be to write $$Q$$ in several ways, and compute wedge products in each. We should get the same answer, and we can deduce the rules from this.

Suppose $$Q$$ is $$4 \times 4$$, and each of $$A, B$$ are $$4 \times 2$$. We'll use this for a bunch of examples, so here it is written out:

$$Q = \begin{pmatrix} 
A_{11} & A_{12} & B_{11} & B_{12} \\
A_{21} & A_{22} & B_{21} & B_{22} \\
A_{31} & A_{32} & B_{31} & B_{32} \\
A_{41} & A_{42} & B_{41} & B_{42}
\end{pmatrix}$$

We can expand $$Q$$ as a row vectors who coefficients are column vectors, which we can write in a basis:

$$Q =  A_1 \b{x}_1 + A_2 \b{x}_2  + B_1 \b{y}_1 + B_2 \b{y}_2$$

Meanwhile, we can write $$Q$$ in a block form as $$Q = (A,B)$$, so we should be able to, more or less, write $$Q$$ as a row vector in this 'basis', with the coefficients now being matrices and the basis elements being some sort of two-dimensional basis vector, which we will write as $$\b{x}_{12}, \b{y}_{12}$$:

$$Q = (A,B) = A \b{x}_{12} + B \b{y}_{12}$$

Now let us see what $$Q \^ Q$$ ought to mean.

---------

## 1. Excavation

First, written in columns. We assume that the wedge product amounts to, as usual, the tensor product $$\otimes$$ quotient the equivalence relation. When we write out a vector in its components, we'll compute the tensor product over the visible components first.

We assume that $$\^$$ should be associative and distributive over $$+$$, and that columns' wedges with themselves should be zero (because $$\b{x}_1 \o \b{x}_1 \sim 0$$, etc), so:

$$\begin{aligned}
Q \^ Q &= (A_1 \b{x}_1 + A_2 \b{x}_2 + B_1 \b{y}_1 + B_2 \b{y}_2) \^ (A_1 \b{x}_1 + A_2 \b{x}_2 + B_1 \b{y}_1 + B_2 \b{y}_2) \\
&= A_1 \b{x}_1 \^  A_2  \b{x}_2+ A_2 \b{x}_2 \^  A_1 \b{x}_1 \\
&+ (A_1 \b{x}_1 + A_2 \b{x}_2) \^ (B_1 \b{y}_1 + B_2 \b{y}_2) + (B_1 \b{y}_1 + B_2 \b{y}_2) \^ (A_1 \b{x}_1 + A_2 \b{x}_2)  \\
&+ B_1 \b{y}_1 \^ B_2 \b{y}_2 + B_2 \b{y}_2 \^ B_1 \b{y}_1 \\
\end{aligned}$$

Everything seems to work out if we interpret $$A_1 \b{x}_1 \^  A_2  \b{x}_2 = (A_1 \o A_2) \b{x}_1 \^ \b{x}_2$$, ie, $$\o$$ functions as our 'scalar multiplication'. Then:

$$\begin{aligned}
A_1 \b{x}_1 \^  A_2  \b{x}_2+ A_2 \b{x}_2 \^  A_1 \b{x}_1 &\sim (A_1 \o A_2 - A_2 \o A_1) \, \b{x}_1 \o \b{x}_2 \\
 &\sim 2 (A_1 \^ A_2) \, \b{x}_1 \^ \b{x}_2 \end{aligned}$$

The factor of $$2$$ appears because the symmetry relation means that both $$A_1 \o A_2 \sim A_1 \^ A_2$$ and $$A_2 \o A_1 \sim - A_1 \^ A_2$$, so $$A_1 \o A_2 - A_2 \o A_1 \sim 2 A_1 \o A_2$$.

We compute:

$$\begin{aligned} 
Q \^ Q&= 2(A_1 \^ A_2) \b{x}_1 \^ \b{x}_2 \\
&+ 2(A_1 \^ B_1) \, \b{x}_1 \^ \b{y}_1 + 2(A_1 \^ B_2)\, \b{x}_1 \^ \b{y}_2 \\
&+ 2(A_2 \^ B_1) \, \b{x}_2 \^ \b{y}_1 + 2(A_2 \^ B_2)\, \b{x}_2 \^ \b{y}_2 \\
&+ 2(B_1 \^ B_2) \, \b{y}_1 \^ \b{y}_2 \\
&= A^{\^2} + 2 A \^ B + B^{\^2} 
\end{aligned}$$


That looks really good. But why is $$A \^ B + B \^ A  = 2 A \^ B$$?

The reason is that there are two indices of antisymmetrization, instead of one:

$$B_1 \b{y}_1 \o A_1 \b{x}_1 \sim - (B_1 \o A_1) \b{x}_1 \o \b{y}_1 \sim (A_1 \o B_1) \b{x}_1 \o \b{y}_1$$

This illustrates the importance of notating the basis vectors: $$A_1 \b{x}_1 \^ A_2 \b{x}_2 = A_2 \b{x}_2 \^ A_1 \b{x}_1$$, while $$A_1 \^ A_2 = - A_2 \^ A_1$$.

Ultimately this means that that the wedge products of matrices, when considered as vectors-of-vectors, _commute_ (which also explains why $$A \^ A \neq 0$$).

Note, if you're counting elements: $$Q$$ is $$4 \times 4$$ and has $${4 \choose 2} \times {4 \choose 2} = 36$$ minors. $$A^{\^2}$$ and $$B^{\^2}$$ each account for $${4 \choose 2} \times {2 \choose 2} = 6$$ of them, and $$A \^ B$$ gives the other $$24$$.

Note, our $$A^{\^2}$$ has a different meaning than what is normally meant by this notation. In usual usage it means $$A_1 \^ A_2$$, but we mean $$(A_1 , A_2) \^ (A_1 , A_2) = 2 A_1 \^ A_2$$. Presumably this means that $$Q^{\^n} = n! \det(Q)$$, not $$\det Q$$ directly.

Our final result is a very satisfying form:

$$\begin{aligned}
Q \^ Q &= (A + B) \^ (A + B) \\
&= A^{\^2} +  A \^ B + B \^ A + B^{\^2} \\
&= \boxed{A^{\^2} + 2 A\^B + B^{\^2}} \end{aligned}$$

------

Now we write $$Q$$ in blocks.

$$\begin{aligned}
Q \^ Q &= (A \b{x}_{12} + B \b{y}_{12}) \^ (A \b{x}_{12} + B \b{y}_{12}) \\
&= (A \b{x}_{12} \^ A \b{x}_{12}) + (A \b{x}_{12} \^ B \b{y}_{12}) + (B \b{y}_{12} \^ A \b{x}_{12}) + (B \b{y}_{12} \^ B \b{y}_{12}) \\
&\sim (A \o A) \b{x}_{12} \o \b{x}_{12} + (A \o B - B \o A)\b{x}_{12} \o \b{y}_{12} + (B \o B) \b{y}_{12} \o \b{y}_{12} \\
&\sim (A \^ A) \b{x}_{12} \o \b{x}_{12} + 2 (A \^ B) \b{x}_{12} \^ \b{y}_{12} + (B \^ B) \b{y}_{12} \o \b{y}_{12}
\end{aligned}$$

Evidently it is not true that $$\b{x}_{12} \o \b{x}_{12} \sim 0$$, which makes sense; as two-dimensional indexes, there are internal non-symmetric elements $$\b{x}_1 \o \b{x}_2, \b{x}_2 \o \b{x}_1$$. We can expand the nonsymmetric elements as:

$$\begin{aligned}
A \b{x}_{12} \o A \b{x}_{12} &\sim (A_1 \o A_2) \, \b{x}_1 \o \b{x}_2 + (A_2 \o A_1) \, \b{x}_2 \o \b{x}_1 \\
&\sim (A_1 \o A_2 - A_2 \o A_1) \, \b{x}_1 \^ \b{x}_2 \\
&\sim 2 (A_1 \^ A_2) \, \b{x}_1 \^ \b{x}_2 \\
&= (A \^ A) \, \b{x}_1 \^ \b{x}_2
\end{aligned}$$


This gives, once again:

$$Q \^ Q = A^{\^2} + 2 A \^ B + B^{\^2}$$

If we write

$$\b{x}_{12}^{\^ 2} = \b{x}_1 \^ \b{x}_2$$

Then we can include basis-like vectors:

$$Q \^ Q = A^{\^2} \b{x}_{12}^{\^2}  + 2 (A \^ B)  \b{x}_{12} \^ \b{y}_{12} + B^{\^2} \b{y}_{12}^{\^2}$$

It looks, pleasantly, a lot like a square:

$$Q^{\^2} = (A \b{x}_{12} + B \b{y}_{12})^{\^2}$$

-------

To ground things in reality, let's compute this on our example. Let's assume the basis elements for the columns are called $$\b{w}_j$$. We have:

$$\begin{aligned}
A \^ A 
&= 2 (A_1 \^ A_2) \b{x}_{1} \^ \b{x}_2 \\
&= 2(A_{11} \b{w}_1 + A_{21} \b{w}_2 + A_{31} \b{w}_3 + A_{41} \b{w}_4) \^ (A_{12} \b{w}_1 + A_{22} \b{w}_2 + A_{32} \b{w}_3 + A_{42} \b{w}_4) \b{x}_{1} \^ \b{x}_2 \\
&= 2((A_{11} A_{22} - A_{12} A_{21}) \b{w}_1 \^ \b{w}_2 + (A_{11} A_{32} - A_{31} A_{12}) \b{w}_1 \^ \b{w}_3) \\
&+ (A_{11} A_{42} - A_{41} A_{12}) \b{w}_1 \^ \b{w}_4 + (A_{21} A_{32} - A_{31} A_{22}) \b{w}_2 \^ \b{w}_3 \\
&+ (A_{21} A_{42} - A_{41} A_{22}) \b{w}_2 \^ \b{w}_4 + (A_{31} A_{42} - A_{41} A_{32}) \b{w}_3 \^ \b{w}_4) \b{x}_{1} \^ \b{x}_2 

\end{aligned}$$

This is easier to understand by just listing terms over the $$\b{w}_i \^ \b{w}_j$$ basis. (Note that in $$N>3$$ dimensions, it's not very useful to care whether we write, say, $$\b{w}_2 \^ \b{w}_3$$ or $$\b{w}_3 \^ \b{w}_2$$ as the basis element, as long as we're consistent.)

$$A^{\^2} = A^{\^ 2}_{1 \^ 2} + A^{\^ 2}_{1 \^ 3} + A^{\^ 2}_{1 \^ 4} + A^{\^ 2}_{2 \^ 3} + A^{\^ 2}_{2 \^ 4} + A^{\^ 2}_{3 \^ 4}$$

Each term is a determinant of a $$2\times 2$$ minor of $$A$$. $$B$$ is the same:

$$B^{\^2} = B^{\^ 2}_{1 \^ 2} + B^{\^ 2}_{1 \^ 3} + B^{\^ 2}_{1 \^ 4} + B^{\^ 2}_{2 \^ 3} + B^{\^ 2}_{2 \^ 4} + B^{\^ 2}_{3 \^ 4}$$

$$A \^ B$$ can be expanded into each set of columns:

$$A \^ B = (A_1 \^ B_1) \, \b{x}_1 \^ \b{y}_1 + (A_1 \^ B_2) \, \b{x}_1 \^ \b{y}_2 \\
+ (A_2 \^ B_1) \, \b{x}_2 \^ \b{y}_1 + (A_2 \^ B_2) \, \b{x}_2 \^ \b{y}_2$$

And then this has terms in each column bivector:

$$A \^ B = (A \^ B)_{1 \^ 2} + (A \^ B)_{1 \^ 3} + \\ (A \^ B)_{1 \^ 4} + (A \^ B)_{2 \^ 3} + (A \^ B)_{2 \^ 4} + (A \^ B)_{3 \^ 4}$$

This is what's all hiding inside $$Q \^ Q$$.

It seems like the basis vectors are basically duplicating what the coefficients are telling us. I've kept them around mostly to emphasize that we're wedge-producting one dimension at a time, but we can drop them from now except when it's useful as a reminder. Just remember that $$(A,B)^{\^ 2} = 2 A \^ B$$. Actually, it is maybe best to think of the matrix $$(A,B)$$ being a sum under $$\oplus$$ instead of $$+$$, and this rule telling us that the wedge product distributes over $$\oplus$$:

$$Q^{\^2} = (A \oplus B)^{\^ 2} = A^{\^2} \oplus 2 A \^ B \oplus B^{\^ 2}$$

--------

Let's consider $$Q^{\^4}$$, which should give the determinant of $$Q$$.

We know that $$A^{\^3} = B^{\^3} = 0$$, since each only has two columns. The only surviving terms in $$Q^{\^4}$$ are factors of $$A^{\^2} B^{\^2}$$, and because $$A \^ B = B \^ A$$ we can move them all to the same form with a coefficient:

$$Q^{\^4} = {4 \choose 2} A^{\^2} \^ B^{\^2}$$

Given that $$A_1 \^ A_2 \^ B_1 \^ B_2 = \det(Q)$$, and $$A^{\^2} = 2 A_1 \^ A_2$$ and $$B^{\^2} = 2 B_1 \^ B_2$$, which gives:

$$Q^{\^ 4} = (4!) A_1 \^ A_2 \^ B_1 \^ B_2 = 4! \det(Q) $$

So even though we're still carrying our factorial baggage around, at least the numbers are working out.

In general, for an $$n \times n$$ matrix $$M$$ of regular scalars, we have:

$$M^{\^ n} = n! \det (M)$$

-------

We can decompose larger block matrices also.

Suppose that $$P = \begin{pmatrix} A & B \\ C & D \end{pmatrix}$$. In terms of (made-up) basis vectors, we can write this as:

$$P = A \b{x}_1 \o \b{y}_1 + B \b{x}_2 \o \b{y}_1 + C \b{x}_1 \o \b{y}_2 + D \b{x}_2 \o \b{y}_2$$

Or, expanding only in columns:

$$P = \begin{pmatrix} A \\ C \end{pmatrix} \b{x}_1 + \begin{pmatrix} B \\ D \end{pmatrix} \b{x}_2$$

$$P^{\^2}$$ must be:

$$\begin{aligned} 
P \^ P &= \begin{pmatrix} A \\ C \end{pmatrix}^{\^2} \b{x}_1^{\^2} + 2 \begin{pmatrix} A \\ C \end{pmatrix} \^ \begin{pmatrix} B \\ D \end{pmatrix} \b{x}_1 \^ \b{x}_2 + \begin{pmatrix} B \\ D \end{pmatrix} \b{x}_2^{\^2} \\
&= (A^{\^2} \b{y}_1^{\^2} + 2 A \^ C \b{y}_1 \^ \b{y}_2 + C^{\^2} \b{y}_2^{\^2}) \b{x}_1^{\^2} \\
&+ 2(A \^ B \b{y}_1^{\^2} + (A \^ D - B \^ C) \b{y}_1 \^ \b{y}_2 + C \^ D \b{y}_2^{\^ 2}) \b{x}_1 \^ \b{x}_2 \\
&+ (B^{\^2} \b{y}_1^{\^2} + 2 B \^ D \b{y}_1 \^ \b{y}_2 + D^{\^2} \b{y}_2^{\^2}) \b{x}_2^{\^2} \\
\end{aligned}$$

Suppose that $$A$$ is $$k \times k$$ and $$D$$ is $$m \times m$$, and $$n = k + m$$. Then:

$$P^{\^n} = {n \choose k} \begin{pmatrix} A \\ C \end{pmatrix}^{\^k} \^ \begin{pmatrix} B \\ D \end{pmatrix}^{\^ m} \b{x}_1^{\^ k} \^ \b{x}_2^{\^m}$$

Each term can be expanded as a polynomial, sort of:

$$\begin{pmatrix} A \\ C \end{pmatrix}^{\^k} = (A\b{y}_1 + C \b{y}_2)^{\^k} = \sum_{i=0}^{k} {k \choose i} (A^{\^i} \^ C^{\^ k-i}) \b{y}_1^{\^i} \^ \b{y}_2^{\^ k-i}$$

(If $$m < k$$, then $$C$$ is $$m \times k$$ and some of the high-order terms like $$C^{\^ k}$$ will be 0.)


## 2 Reductions

These are obviously complicated and would be hard to use for computation, since wedge powers of a matrix tend to be much larger than the original matrix. We need ways to simplify expressions involving matrix wedge products for them to be practical to use.

Let's consider the wedge product $$A^{\^2} \^ B^{\^ 2}$$. Its behavior is to take, say, the $$\b{w}_1 \^ \b{w}_2$$ component of $$A^{\^ 2}$$ and multiplies it by the $$\b{w}_3 \^ \b{w}_4$$ component. Each of $$A^{\^^2}$$ and $$B^{\^^2}$$ is a $${4 \choose 2} \times {2 \choose 2} = 6 \times 1$$ matrix. Using the abbreviated notation from earlier:

$$A^{\^2} = A^{\^ 2}_{1 \^ 2} + A^{\^ 2}_{1 \^ 3} + A^{\^ 2}_{1 \^ 4} + A^{\^ 2}_{2 \^ 3} + A^{\^ 2}_{2 \^ 4} + A^{\^ 2}_{3 \^ 4}$$


We can expand $$A^{\^2} \^ B^{\^2}$$ as:

$$\begin{aligned}
A^{\^2} \^ B^{\^2} &= A^{\^ 2}_{1 \^ 2} B^{\^2}_{3 \^ 4} - A^{\^ 2}_{1 \^ 3} B^{\^2}_{2 \^ 4} \\
&+ A^{\^ 2}_{1 \^ 4} B^{\^2}_{2 \^ 3} + A^{\^ 2}_{2 \^ 3} B^{\^2}_{1 \^ 4} \\
&- A^{\^ 2}_{2 \^ 4} B^{\^2}_{1 \^ 3} + A^{\^ 2}_{3 \^ 4} B^{\^2}_{1 \^ 2}
\end{aligned}$$

Which reminds us that this is essentially a dot product. For any multivectors, $$\alpha \in \^^k V$$, $$\beta \in \^^{n-k} V$$, we have:

$$\alpha \^ \beta = \alpha \cdot (\star \beta) \omega$$

(We can also write $$\star \beta$$ as $$\beta \cdot \omega$$, so $$(\alpha \^ \beta) \omega = \alpha \cdot (\beta \cdot \omega) \omega$$?)

$$\star B^{\^2}$$ replaces each basis vector of $$B$$ with its complement, with an appropriate sign:

$$\star B^{\^2} = B^{\^ 2}_{1 \^ 2} \b{w}_{3 \^ 4} - B^{\^ 2}_{1 \^ 3} \b{w}_{2 \^ 4} \\
+ B^{\^ 2}_{1 \^ 4} \b{w}_{2 \^ 3} + B^{\^ 2}_{2 \^ 3} \b{w}_{1 \^ 4} \\
- B^{\^ 2}_{2 \^ 4} \b{w}_{1 \^ 3} + B^{\^ 2}_{3 \^ 4} \b{w}_{1 \^ 2}$$


So $$A^{\^2} \^ B^{\^2} = A^{\^2} \cdot (\star B^{\^2})$$ acts like a dot product / matrix multiplication.

We've previously that matrix multiplication plays well with the wedge product, via the generalized Cauchy-Binet identity:

$$(UV)^{\^k} = U^{\^k} V^{\^k}$$

Since $$\star B^{\^2} = (\star B)^{\^2}$$ (**check**):

$$A^{\^2} \^ B^{\^2} = (A \cdot \star B)^{\^2}$$


**is $$B^T$$ the same as $$\star B$$?**
**are the signs correct?**

## 2 Applications


$$\det Q = Q^{\^n}$$

$$Q^{-1} = \frac{Q^{\^n-1}}{Q^{\^n}}$$

todo: block matrix A B / C D

1 + AB

(A+B)(A-B)

------

$$\^^{2k} \begin{pmatrix} A & B \\ B & A \end{pmatrix} = {2k \choose k} \begin{pmatrix} A \\ B \end{pmatrix}^{\^ k} \^ \begin{pmatrix} B \\ A \end{pmatrix}^{\^ k}$$

$$\begin{aligned}
\begin{pmatrix} A \\ B \end{pmatrix}^{\^ k} \^ \begin{pmatrix} B \\ A \end{pmatrix}^{\^ k} &= (A\b{x} + B \b{y})^{\^ k} \^ (B \b{x} + A \b{y})^{\^ k} \\
&= ((A\b{x} + B \b{y}) \^ (B \b{x} + A \b{y}))^{\^ k} \\
&= A^{\^ k} \b{x}^{\^k} A^{\^ k} \b{y}^{\^k} + B^{\^ k} \b{y}^{\^k} B^{\^ k} \b{x}^{\^k} + ??
\end{aligned}$$

