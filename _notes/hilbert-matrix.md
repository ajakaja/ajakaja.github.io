---
layout: article
title: "Note on inverting a matrix"
footnotes: true
math: true
---

We attempt to prove the following conjecture:

For the infinite symmetric matrix


$$C_{ij} = ij (\frac{1}{i + j + 1} + \frac{1}{i + j - 1})$$

the inverse obeys:

$$\sum_{i = 1, j = 1}^{\infty, \infty} C_{ij}^{-1} = \frac{\pi}{4}$$

For reference, the first few entries of this matrix look like this:

$$\begin{pmatrix}
1(1/1 + 1/3) & 2 (1/2 + 1/4) & 3 (1/3 + 1/5) & \ldots \\ 
2(1/2 + 1/4) & 4 (1/3 + 1/5) & 6 (1/4 + 1/6) & \ldots \\
3(1/3 + 1/5) & 6 (1/4 + 1/6) & 9 (1/5 + 1/7) & \ldots \\
\vdots & \vdots & \vdots & \ddots

\end{pmatrix}$$

First we explicitly construct the inverse. To do this, break the matrix into a bunch of smaller matrices that are easier to invert. First, we can remove the factors of $$ij$$ by multiplying a matrix $$D$$ on each side by $$N = \text{diag}(1,2,3,4, \ldots)$$:

$$C = N \begin{pmatrix}
1/1 + 1/3 & 1/2 + 1/4 & 1/3 + 1/5 & \ldots \\ 
1/2 + 1/4 & 1/3 + 1/5 & 1/4 + 1/6 & \ldots \\
1/3 + 1/5 & 1/4 + 1/6 & 1/5 + 1/7 & \ldots \\
\vdots & \vdots & \vdots & \ddots 
\end{pmatrix} N = NDN $$

$$D$$ clearly consists of the sum of a matrix $$H$$ added to itself, shifted over two rows by another matrix which we'll call $$T$$. So:

$$ D = 
\begin{pmatrix}
1 & 0 & 1 & 0 & 0 & \ldots \\ 
0 & 1 & 0 & 1 & 0 & \ldots \\ 
0 & 0 & 1 & 0 & 1 & \ldots  \\ 
\vdots & \vdots & \vdots & \vdots & \ddots
\end{pmatrix} 
\begin{pmatrix}
1/1 & 1/2 & 1/3 & \ldots \\ 1/2 & 1/3 & 1/4 & \ldots \\ 1/3 & 1/4 & 1/5 & \ldots \\ \vdots & \vdots & \vdots & \ddots
\end{pmatrix}
= TH
$$

So far, $$N$$ and $$T$$ are easy to invert. The inverse of $$N$$ is just $$\text{diag}(1/1, 1/2, 1/3, \ldots)$$. The inverse of $$T$$ is seen by considering it as the matrix form of the operator $$(1 + x^2)$$ (consider its action on the vector $$(1, x, x^2, x^3, \ldots) \mapsto (1 + x^2, x + x^3, x^2 + x^4, \ldots)$$. The inverse is the matrix form of the operator $$\frac{1}{1 + x^2} = \sum (-1)^{n} x^{2n} = 1 - x^2 + x^4 - x^6 + \ldots$$, which is:

$$T^{-1} = \begin{pmatrix} 
1 & 0 & -1 & 0 & 1 & \ldots \\
0 & 1 & 0 & -1 & 0 & \ldots \\
0 & 0 & 1 & 0 & -1 & \ldots \\
0 & 0 & 0 & 1 & 0 & \ldots \\
\vdots & \vdots & \vdots & \vdots & \vdots & \ddots
\end{pmatrix}$$

I was quite stumped on inverting $$H$$ until I ... googled it. Turns out it's a well-known object called the [Hilbert matrix](https://en.wikipedia.org/wiki/Hilbert_matrix), and there's a _ton_ written about it. And the inverse, at least of the finite $$n \times n$$ version is some ridiculous expression:

$$H^{-1}_{ij} = (-1)^{i+j} (i + j - 1) { n + i - 1 \choose n - j } {n + j -1 \choose n -i } {i + j -2 \choose i -1 }^2$$

Which I have zero hope of using in an actual equation. I can't find an explicit form for the inverse of the _infinite_ version, but it's probably okay to assume it has the same properties:
* alternating signs
* giant, basically-infinite integers everywhere
* a determine that gets really tiny

Although [this](https://sci-hub.se/10.2307/2975779) text suggests that it doesn't have a formal inverse ... except also it's complicated, as infinite matrices don't even have the same rules; their multiplication isn't necessarily associative (!). Apparently it has an inverse if restricted to $$\mathcal{l}^2$$.

So anyway we have $$C = N TH N$$ and thus 

$$C^{-1} = N^{-1} H^{-1} T^{-1} N^{-1}$$

Assuming I got all of this right.

If those exist and if the rules of infinite matrices are the same as finite ones (no idea; presumably not quite for the same reason that you can do crazy things with infinite sums). Finally, the _sum_ of all the entries in a matrix is a weird thing to compute, but it is given by $$\sum_{ij} Q_{ij} = \b{1}^T Q \b{1}$$, where $$\b{1}$$ is the vector $$(1, 1, 1, 1, \ldots)$$. So I guess what we want is $$\sum_{ij} C^{-1}_{ij} = \b{1}^TN^{-1} T^{-1} H^{-1} N^{-1} \b{1}$$. But I am daunted at the task of handling the infinite inverse of $$H$$.

One thing I did notice, though, is that $$\pi$$ comes up a lot in discussions of the spectrum of $$H$$. For instance: $$0 \leq x^T H x \leq \pi \| x \|^2$$. So it's not inconceivable that it's related.
