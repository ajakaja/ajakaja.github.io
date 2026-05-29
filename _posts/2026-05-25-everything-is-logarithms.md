---
layout: blog
title: "Everything Is Logarithms"
math: true
aside: true
footnotes: true
---

Some connections between things, which I have not seen elsewhere. Maybe they mean something?

<!--more-->

------------

# 1. The Baseless Logarithm

Normally one writes a logarithm with a base, $$\log_b (x)$$, to mean

$$y = \log_b (x) \Lra b^y = x$$

And then you can change the base of the logarithm with

$$\log_b (x) = \frac{\log_a (x)}{\log_a(b)}$$

Which follows from rearranging $$\log_a (x) = \log_a (b^{\log_b x}) = \log_b (x) \times \log_a (b)$$.

One way of thinking about what this formula does is that it is a change of units. Similar to writing $$2 \text{ km} = 2000 \text{ m} / (1000 \text{ m}/1 \text{ km})$$ or $$5 \text{ bytes} = 40 \text{ bits}/(8 \text{ bytes}/1\text{ bit})$$. It says: how many copies of $$b$$ are in $$x$$? It's the number of copies of $$a$$ in $$x$$, divided by the number of copies of $$a$$ that are in $$b$$. 

This is perfectly simple, but for some reason it's hard to think about logarithms that way. The notation kind of... obfuscates things? It is hard to read $$\log_b x$$ as "how many copies of $$b$$ are in $$x$$, because that English expression should correspond to the notation $$x/b$$, not $$\log_b x$$.

I found a way of thinking about logarithms which makes this clearer, but you have to allow a sort of odd object, which I am calling a _baseless logarithm_. It is simply a logarithm without a base:

$$\log N$$

which we regard as an abstract object, not a number, and then we write our normal "based" logarithm as a ratio of two of these baseless logarithms:

$$\log_2 N = \frac{\log N}{\log 2}$$

Note, this is already sort of a thing people colloquially do, e.g. leaving out the base of logarithms in asymptotic formulas. I'm arguing that it is useful to regard it more literally than that, as an actual algebraic object.

We interpret $$\log 2$$ as _being_ the unit "bits". To write $$\log N$$ in bits is to factor it as a multiple of $$\log 2$$:

$$\log N = \frac{\log N}{\log 2} \log 2 = \log_2 (N) \log 2 = \log_2 (N) \text{ bits}$$

Then the change-of-base for logarithms follows from just writing the same geometric quantity in different units. For example $$\log e$$ as a unit is sometimes called "nats":

$$
\begin{aligned}
\log N = \frac{\log N}{\log 2} \log 2 = \log_2 (N) \text{ bits} = \frac{\log N}{\log e} \log e = \ln (N) \text{ nats}
\end{aligned}
$$

Regarding the baseless $$\log N$$ as a real mathematical object is a bit strange at first. But I've been coming to think that it's the right way to do things, as the rest of the article will elaborate on.

You might ask: if we have a baseless logarithm $$\log N$$, do we also have a "baseless exponential"? Normally $$b^{\log_b N}$$ can be written as something like $$b^{\log_b N} = b^{\ln N / \ln b} = e^{\ln N} = N$$; is there any way to do this without actually choosing a base? I think the answer has to be "no". All we can say is that we have split the one object, a logarithm $$\log_b N$$ which is the solution of $$b^y = N$$, into two objects, $$\log N$$ and $$\log b$$, each of which on their own are without "units" and so have no numerical meaning. It is similar to how we can have a vector without any coordinates: we can talk about the vector's meaning in context, such as the displacement it describes, but we can't compare it to anything else, or ask what its length is, without something by which to measure it.

In fact it is exactly like that:


-----

# 2. Logarithms are Vectors

When doing vector algebra and differential geometry in a properly covariant way, we distinguish between abstract vectors and vectors in a particular coordinate system. My personal convention for this is to refer to the abstract vectors as "geometric" vectors and always write them in bold, $$\v$$, whereas "coordinate" vectors, tuples of their values in coordinates, are written with an arrow over them like $$\vec{v} = (v_x, v_y, v_z)$$. Boldface geometric vectors are always coordinate-free, whereas coordinate vectors are just collections of numbers or other objects. The geometric vector $$\b{v}$$ can be written as a dot product of its coordinates with a 'frame' $$X = (\x, \y, \z)$$ of basis vectors

$$\b{v} = \vec{v} \cdot X = (v_x, v_y, v_z) \cdot (\x, \y, \z) = v_x \x + v_y \y + v_z \z$$

The projection of $$\v$$ onto a basis vector $$\x$$ is then given by 'measuring' the vector against the basis vector (which does not have to be of unit length). I like to write this as division because it acts a lot like division (although it's technically [pseudodivision](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse) instead):

$$\frac{\v}{\x} = v_x$$

That's in my own [very nonstandard notation]({% post_url 2024-09-11-vector-division %})[^notation] for vector division here. The more common way to write this is to project a component of a differential $$df = f_x dx + f_y dy + f_z dz$$ with a partial derivative, which is also the pseudodivision operation (which is incidentally the sense in which partial derivatives kinda work like division but not really):

$$\frac{\p f}{\p x} = f_x$$

I will write things in both forms to make it easy to translate between them; I do prefer my vector-division version because it avoids bringing in the irrelevant notations of differential calculus, but since the latter is actually standard I ought to include it for comparison.

[^notation]: I hope to write a better standalone article about this notation soon. I've been trying to do so for a few years now but I seem to start losing my sanity whenever I try to work on it so it hasn't happened yet. When I do finally manage to do it I'll update this.

Suppose $$\b{v}$$ is one-dimensional, $$\b{v} = v_x \x$$. Then the projection onto a 'measuring stick' $$\b{m} = m \x$$ measures its length in terms of multiples of $$m$$:

$$\frac{\v}{\b{m}} = \frac{v_x \x}{\x} = \frac{v_x}{m}$$

Multiplying by $$\b{m}$$ again is what we mean by "writing $$\b{v}$$ in units of $$\b{m}$$:

$$\frac{\b{v}}{\b{m}} \b{m} = (\frac{v_x}{m}) \text{m} \x$$

(In differentials, this is the differential of $$f$$ restricted to its $$dx$$ component: $$\frac{\p f}{\p x} dx = f_x dx = df \mid_{x}$$, which is a perfectly interesting object (a covariant derivative) that one does not see written in this way very often. By the way, it's not really important here, but is possible to view all measurements of the length of vectors in this way by thinking first of rewriting an arbitrary vector $$\v = v_x \x + v_y \y + v_z \z$$ in a polar form $$\v = v_r \r + v_{\theta} \theta$$ and then projecting onto $$\r$$, $$\| \v \| = \v/\r$$. This tends to be a good way of looking at things.)

The baseless logarithm is performing the same operation on logarithms, where $$\log N$$ is filling the role of the geometric vector $$\v$$ and $$\log 2 = \text{bits}$$ is the unit vector or measuring stick, which takes the role of $$\x$$.

$$
\begin{aligned}
\frac{\log N}{\log 2} &= \log_2 N  \\
\frac{\log N}{\log 2} \log 2 &= \log_2 N \text{ bits}
\end{aligned}
$$

In this sense baseless logarithms write numbers in coordinates in exactly the same way that measuring sticks write vectors in coordinates.

The equivalence of logarithms in different units

$$
\begin{aligned}
\log N &= \frac{\log N}{\log 2} \log 2 = \log_2 (N) \text{ bits} \\
&= \frac{\log N}{\log e} \log e = \ln (N) \text{ nats}
\end{aligned}
$$

is the same as the equivalence of geometric vectors in different units

$$
\begin{aligned}
\v &= \frac{\v}{\x} \x = v_x \x \\[1em]
&= \frac{\v}{\x'} \x' = v_{\x'} \x' \\
\end{aligned}
$$

or

$$
\begin{aligned}
df &= \frac{\p f}{\p x} dx = f_x dx \\
&= \frac{\p f}{\p x'} dx' = f_{x'} dx'
\end{aligned}
$$


And the change of base formula that computes a ratio of logarithms in different bases

$$
\begin{aligned}
\log_2 N \text{ bits}&= \ln N \text{ nats} \\
\log_2 N &= \frac{\text{nats}}{\text{bits}} \ln N\\
&= \frac{\log e}{\log 2} \ln N \\
&= \log_2 (e) \ln N
\end{aligned}
$$

is exactly like the change of coordinates for a vector, where $$\x$$ and $$\x$$ are two units for the same quantity.

$$
\begin{aligned}
v_x \x &= v_{x'} \x' \\  
v_x &= \frac{\x'}{\x} v_{\x'} \\
\end{aligned}
$$

or

$$
\begin{aligned}
f_x dx &= f_{x'} dx' \\
f_x &= \frac{dx'}{dx} f_{x'}
\end{aligned}
$$

(Note that the $$f_x = \p_x f = \p f / \p x$$ notation for partial derivatives is unfortunate; it should be $$(df)_x$$ or $$df_{dx}$$, to indicate that it is the "$$dx$$ component" of the vector $$df$$. To be honest the whole situation with the symbols $$d$$ and $$\p$$ is a mess. I suspect the ideal notation for differentials is actually $$\p f = \frac{\p f}{\p x} \p x + \frac{\p f}{\p y} \p y$$)

--------


What logarithms don't allow you to do that partial derivatives and vector division do allow to actually talk about a partial derivative operation in isolation. For example, if $$N = 2^a 3^b$$, you can only talk about the ratio with respect to a single unit $$\log 2$$

$$\frac{\log N}{\log 2} = a \frac{\log 2}{\log 2} + b \frac{\log 3}{\log 2} = a + b \log_2 3$$

which is equivalent to writing a vector as a multiple of a _single_ basis vector (like in Clifford/geometric algebra)

$$\frac{\v}{\x} = v_x + v_y \frac{\y}{\x}$$

or to a _total_ derivative

$$\frac{df}{dx} = f_x + f_y \frac{dy}{dx}$$

But there is no direct equivalent of the operation of partial differentiation---there's nothing that acts like $$N \? (\log_2 N) \log 2 + (\log_3 N) \log 3$$.

However, I keep finding that people have gone and invented the projection / partial derivative operation on logarithms _anyway_. For example, the [p-adic valuation](https://en.wikipedia.org/wiki/P-adic_valuation) in number theory

$$\nu_p (n) = \max \{ k \in \bb{N} \mid p^k \mid n \}$$

Corresponds to extracting the coefficient of $$\log p$$ of an integer (or rational or radical, in which case the coefficients become negative and fractional respectively) in the logarithmic basis 

$$
\begin{aligned}
\log n &= \log 2^{n_2} 3^{n_3} 5^{n_5} \cdots \\
&= n_2 \log 2 + n_3 \log 3 + n_5 \log 5 + \ldots \\
\nu_p (n) &= n_p
\end{aligned}
$$

Since it is a projection out of the logarithm, it still obeys logarithmic identities like $$\nu_p(m/n) = \nu_p(m) - \nu_p(n)$$. But there is not really a good notation for actually expressing it as a projection out of such a logarithmic 'vector', so sadly it gets a whole separate nomenclature that you have to learn.[^partial]

[^partial]: There is also a thing called an [arithmetic derivative](https://en.wikipedia.org/wiki/Arithmetic_derivative) and a corresponding partial derivative $$D_p(n) = \nu_p(n)/p$$, but as far as I can tell it's not quite the same thing and not what I'm looking for.

Another example of these logarithmic projections: in complex analysis the "order of vanishing" $$\text{ord}_a f(z)$$ of a meromorphic function $$f(z)$$ at a point $$z=a$$ is the order of the [pole or zero](https://en.wikipedia.org/wiki/Zeros_and_poles) at a point (where zeroes are like negative poles). That is, it is the degree $$n$$ of the lowest-degree term in the Laurent series of the function around the point $$z=a$$,

$$f(z) = f_{-n} (z-a)^{-n} + f_{-n+1} (z-a)^{-n+1} + \cdots + f_{-1} (z-a)^{-1} + f_0 + f_1 (z-a) + \cdots$$

(that is, the value of $$n$$ such that $$(z-a)^n f(z)$$ is holomorphic around $$a$$). This is extracted with a logarithm:

$$\text{ord}_a f(z) = \lim_{z \ra} \frac{\log f(z)}{\log (z-a)} = -n$$

since for $$z \approx a$$, $$f(z) \sim f_{-n} (z-a)^{-n}$$ which dominates the other terms that blow up less quickly. It should be clear that this is a very similar operation: $$\log f(z)$$ is some kind of sum over all of the poles and zeroes of $$f(z)$$ (presumably via the [Weierstrass factorization](https://en.wikipedia.org/wiki/Weierstrass_factorization_theorem)), $$\log f(z) \sim \sum_a f_a \log (z-a)^{\text{ord}_a f(z)}$$ division by $$\log (z-a)$$ removes the coefficient of the $$f_a$$ term, and then the limit serves to cancel out the rest of the terms. Together it serves to implement something akin to the pseudodivision by the basis 'vector' $$\log (z-a)$$, akin to how way partial derivatives do the same thing with their limit definition $$f_x = \lim_{dx \ra 0} f(x+dx)/dx$$.

(I don't know complex analysis very well so that's all I'm going to say about that, but it seems clear that it is basically the same operation.)

In each case, we see that the baseless logarithm operation $$\log n$$ works a _lot_ like a vector $$\v$$ or differential $$df$$, and then expressing a logarithm in a base like $$\log_2 n = \log n / \log 2$$ is a lot like a total derivative $$df/dx$$ or Clifford division $$\v \ast \b{x}^{-1}$$. What is missing is some equivalent of the partial derivative / projection operator that projects _only_ onto that component... but various fields have gone and Found a way to invent that anyway, either in the form of a partial derivative $$\p f/\p x$$, or just by making up the $$p$$-adic valuation $$\nu_p$$, or by the limits $$\lim_{z\ra a} \log f(z) / \log (z-a)$$ in complex analysis. The similiarities are all suspicious, though, and I can't help but think there is some unifying theory here that ties all this together... but I can't see what it is yet.

One thing that we might try in order to invent a $$\log_2 N$$ that acts like $$\p_x f$$ or $$\b{v}/\x$$ is to somehow restrict the values of the logarithms to certain spaces, e.g. integers or rationals. Since the $$\{\log p_i\}$$ are linearly indepedent (which is essentially equivalent to prime factorizations being unique), you would end up with objects like $$\log_2 3 = \log_3/\log_2$$ which have no value in $$\bb{Q}$$; "zeroing" those out then gives something that acts like a partial derivative. But I don't know if that's useful. Certainly it doesn't help in any numeric context.


Anyway, onto more things that are logarithms.

------

# 3. Vectors are Logarithms

In differential geometry one interprets vectors like $$\v = v_x \x + v_y \y $$ being written in a basis of partial derivative operators, $$\v = v_x \p_x + v_y \p_y $$. These can then be used to create discrete translations which move around in the various coordinates,

$$T^{\v} = e^{\v} = e^{v_x \p_x + v_y \p_y }$$

The partial derivatives are here in order to make it operate on functions 

$$e^{v_x \p_x + v_y \p_y} f(x,y) = f(x + v_x, y + v_y)$$

which is true at the level Taylor expansions as well. I often find it easier to dispense with the partial derivatives and just think of these as translation operators on the space $$(x,y)$$ directly

$$e^{v_x \p_x + v_y \p_y} (x, y) = (x + v_x, y + v_y)$$

(You can also think of this acting on the function $$f(x) = x$$ also, but that feels like overkill.)

In any case, all this is really doing (in flat space, at least) is changing the additive vector $$\b{v}$$ into a multiplicative form $$T^{\b{v}}$$ which corresponds to the same operation, but whose terms are multiplied instead of added, and whose scalar coefficients are applied via exponentiation instead of multiplication. The basis is now translation operators in each coordinate:[^polar]

[^polar]: If you happen to have a vector in a polar form like $$\b{v} = v_r e^{R v_{\theta}}$$, that refers to a _second_ layer of exponential representation, via $$T^{\v} = T^{v_r e^{\p_{\theta} v_{\theta}}(\p_x)}$$, where $$\p_x$$ is a choice of origin for the rotational $$\theta$$ coordinate (which may be multidimensional as well).

$$T^{\v} = e^{v_x \p_x} e^{v_y \p_y}  = T_x^{v_x} T_y^{v_y} $$

(In non-flat space this is not so simple because the translations in different coordinates may not commute; you can still write it in this form but it's a lot more complicated.)

What this means for us is: look, vectors are logarithms too

$$
\begin{aligned}
\ln T^{\v} &= \ln T_x^{v_x} T_y^{v_y}  \\
&= v_x \ln T_x + v_y \ln T_y \\
&= v_x \p_x + v_y \p_y 
\end{aligned}
$$


I can't exactly say why, but it seems preferable to have this written in terms of baseless logarithms also. We do this by realizing that $$T_x = e^{\p_x} = T^{\p_x}$$ and thinking of this symbol $$T$$ as a sort of 'generic' base for translations, absent the numeric meaning of the symbol $$e$$, which has $$\log T_x = \log T^{\p_x} = \p_x \log T$$. Then

$$\log T^{\v} = \v \log T = v_x \p_x \log T + v_y \p_y \log T$$

And then we can write $$\v = \log_T T^{\v} = \log T^{\v} / \log T$$. This is equivalent to the natural log version but it avoids explicitly depending on the numeric value of $$e$$: any choice of base for the logarithm $$T$$ gives the same concept of a vector, written in terms of the exponentiation of $$T$$, but now we make explicit that the 'units' on $$\v$$ come in part from the units on $$\log T$$ itself.

So vectors in differential geometry may also be thought of as logarithms, specifically, the logarithms of translation operators. 



--------

# 4. Dimensions are Logarithms

Another thing which clearly acts like a logarithm is the dimension operator $$\dim$$ in linear algebra. 


Compare:

$$
\begin{aligned}
\dim_{K} K^n &= n \dim_K K = n \\
\dim_K U \oplus V &= \dim_K U + \dim_K V \\
\dim_K U/V &= \dim_K U - \dim_K V \\
\dim_K U \o V &= (\dim_K U) \times (\dim_K V) \\
\end{aligned}
$$

(where $$\dim_K V$$ means its dimension as a vector space over the base field $$K$$, and assume we're only talking about finite-dimensional spaces here) with

$$
\begin{aligned}
\log_k k^n &= n \log_k k = n \\
\log_k u \times v &= \log_k u + \log_k v \\ 
\log_k u/v &= \log_k u - \log_k v \\
\log_k k^{\log_k u \times \log_k v} &= (\log_k u) \times (\log_k v)
\end{aligned}
$$

The direct sum $$\oplus$$ corresponds to multiplication $$\times$$, which is really just a notational accident, since it is the same as the direct product on finite-dimensional vector spaces; the $$\oplus$$ symbol reflects the fact that it adds _bases_ as sets.[^direct] meanwhile the tensor product $$otimes$$ multiplies bases on sets, but corresponds in arithmetic to a sort of "commutative exponentiation" $$e^{\log_k u \log_k v} = u^{\log_k v}$$ that you don't see very much (sometimes called a [commutative hyperoperation](https://en.wikipedia.org/wiki/Hyperoperation#Commutative_hyperoperations)). 

[^direct]: Apparently the $$\oplus$$ symbol is due to [Bourbaki](https://hsm.stackexchange.com/questions/13894/history-of-direct-sums-and-direct-products) because everything was a mess prior to that. Also it happens to be a coproduct (which came later) and those do correspond to addition on _sets_, so there is at least a connection to addition... but at present I think it is largely a mistake.

I am a bit upset that I never never seen anyone point out that $$\dim$$ is a logarithm, since it's so obviously the case. Maybe I'm missing something and it doesn't work at all? perhaps because I am ignoring infinite-dimensional cases entirely. But I suspect it's mostly just because math likes to stay on more rigorous "solid ground" than this. I, however, love to speculate about underappreciated connections between things, so I have no problem saying: dimension _is_ a logarithm.

The simple reason why $$\dim_K$$ acts like $$\log_k$$ in the case of finite $$K$$ is as follows. We need three observations:

One, the dimension of a vector space is defined as the cardinality of its basis. An individual vector $$\b{v} = v_1 \x_1 + v_2 \x_2 + \ldots + v_n \x_n \in K^n \simeq V$$ can be thought of as a choice of function $$\dim_K V \ra K$$, since it assigns a coefficient $$v_i \in K$$ to each basis vector $$\x_i$$. 

Two, the cardinality of the functions between sets $$B \ra A$$ is given by $$\| A \|^{\| B \|}$$, which is why we use the symbol $$A^B$$ for the sets $$B \ra A$$. For example the powerset of $$A$$, that is, the set of all possible subsets of $$A$$, is notated $$2^A$$ because it is equivalent to the functions $$A \ra \{ 0, 1 \} \equiv \b{2}$$, where a given subset is identified with the elements that map to $$1$$. 

Three: applying that to a vector space $$V \simeq K^n$$, we can interpret $$K^n$$ as describing the set of functions from $$\b{n} = \{ \x_1, \x_2, \ldots, \x_n \}$$ from a choice of basis into the underlying field $$K$$, which naturally has cardinality $$\| V \| = \|K\|^{\| \dim_K V \|}$$. Therefore the logarithm of this is the dimension of $$V$$ over $$K$$:

$$\dim_K V = \log_{\| K \|} \| V \| = \log_{\| K \|} \|K \|^{\dim_K V}$$

This is literally true in the case where $$V$$ is finite dimensional and the field $$K$$ is also finite. It's less solid if either is infinite; however, I tend to think that expressions of this form are _also_ literally true in the case of infinite dimensions, if you define things in a slightly better way. In particular you have to use a concept other than "cardinality" to measure if you want infinite expressions like $$\log_{\| \bb{R} \|} \| \bb{R}^2 \| = 2$$ to make any sense. I am pretty sure the right choice is what's sometimes called [numerosity](https://en.wikipedia.org/wiki/Numerosity_(mathematics)), although I don't know how compatible that is with the rest of linear algebra. More on that some other day.

Anyway, even if you only take this as meaningful on cardinalities of finite-dimensional sets over finite fields, I think it's strange that it never really comes up, since it is such a natural construction! Or maybe it does and I've missed it. But anyway, I like it, and I happen to think the correspondence here is much stronger and more significant than what I've just described. 

If we repeat the above with 'baseless' logarithms, we get expressions like

$$\dim K^n = n \dim K$$

such that

$$\dim_K V = \frac{\dim V}{\dim K}$$

The one place we have to be careful is in the definition of a tensor product. We want it to be the case that

$$\dim_K K^a \o K^b = \dim_K K^a \times \dim_K K^b = a \times b$$

But the naive approach has an extra factor of $$\dim K$$:

$$\dim_K (K^a \o K^b) = \frac{\dim K^a \dim K^b}{\dim K} = \frac{a \dim K b \dim K}{\dim K} = ab (\dim K)$$

The problem is that the definition of the tensor product is a bit more complicated than just multiplying bases. A vector $$\b{u} \o \b{v} \in K^a \o K^b$$ is not the Cartesian product of vectors $$\b{u}$$ and $$\b{v}$$, but rather the Cartesian product modulo a quotient on its scalar coefficient which combines two scalars $$(k_1, k_2)$$ into one $$(k_1 k_2)$$. Since this divides out a factor of $$K$$, we have to do the same with our $$\o$$ operation in order to make the cardinalities work out. This is done by specifying an $$\o_K$$ operation, the "tensor product with respect to the field $$K$$", as

$$U \o_K V = K^{\dim_K U \dim_K V} = K^{\dim U \dim V / \dim K}$$

which allows $$\dim_K K^a \o_K K^b \dim_K K^{ab} = ab$$ to work. (I suspect sometimes that the quotient in the definition of $$\o_K$$ is not actually needed for most purposes, which would have the nice side effect of making this all work out more simply, but let's not get into that.)

The definition

$$\dim_K K^a = \frac{\dim K^a}{\dim K} = \frac{a \dim K}{\dim K}$$ 

seems to imply that one could take the dimension/logarithm of a vector space with respect to a _different_ underlying object, not the field $$K$$, and get a meaningful result. For example it is my dream to be able to say that this is how you construct a vector space with a "fractional dimension" of $$\frac{1}{2}$$:

$$\dim_{K^2} \? K = \frac{\dim K}{2 \dim K} = \frac{1}{2}$$

This works fine at the level of cardinalities, more or less (if you allow that the rationals are invented precisely to let you make objects like $$1/2$$ which interpolate between ratios of non-divisible integers). But it is hard to imagine how it should work if you want anything like a "field" or a "vector space" with its usual axioms to be meaningful (in particular $$K^2$$ will have zero divisors for most attempts you might make at defining multiplication on it). 

Nevertheless, my intuition is that this is a perfectly valid operation and it is the specific usage of fields and vector spaces that goes wrong. After all it is easy to imagine the vectors in a vector space over  the square of a field: picture writing a vector $$\b{v} \in \bb{R}^4$$ as a vector over $$\bb{R}^2$$ via $$\b{v} = (v_w, v_x) \cdot (\w, \x) + (v_y, v_z) \cdot (\y, \z)$$. A vector space with dimension $$\frac{1}{2}$$ is clearly one which is spanned by 'half' a basis vector over that pseudo-field. Maybe its elements look like $$\u = (u_x, \bullet) \cdot (\x, \bullet)$$? The problem comes in defining versions of the theorems of linear algebra which are compatible with this sort of decomposition. But I think that is largely a failure of imagination and I intend to figure out how it works in a future article. 

------

# 5. Bases are Logarithms

(This section is talking about the plural of 'basis', not 'base'. Unfortunately the only distinction between the two in English is their pronunciations. Since I'm not going to start writing 'basees' or 'basises' it's just going to be awkward.)

The dimension of a vector space is the cardinality of its basis. But just like we use expressions like $$B^A$$ for functions between sets because they are respected at the level of cardinalities $$\| B \|^{\| A \|}$$, we may as well interpret the $$\dim$$ operator in the same way: if $$\dim$$ returns the cardinality of the basis, then let's say that $$\log$$ returns _the basis itself_, which happens to have that cardinality.[^set] For instance if a vector space $$V \simeq K^3$$ has basis $$(\x, \y, \z)$$, we might write

[^set]: Another example: if you have sets $$A = \{ a, b \}$$ and $$X = \{ x, y \}$$, then $$(a+b)^{(x+y)} = a^x b^x + a^x b^y + a^y b^x + a^y b^y$$ is true at the level of cardinalities, since the number of functions $$X \ra A$$ is in fact $$4$$. But it is also true at the level of sets: each term in the expanded sum is one of the four possible functions. There are examples of these 'setified' or 'categorified' identities all over algebra, and I think it's wise to assume that every algebraic equation has a perfectly good interpretation as a literal equation on sets (or whatever else).

$$
\begin{aligned}
\log_K V &= (\x, \y, \z) \\ 
\dim_K V &= \| \log_K V \| \\
&= \| (\x, \y, \z) \| \\
&= 3
\end{aligned}
$$

After all, $$(\x, \y, \z)$$ is a thing which in some sense literally has $$K^{(\x, \y, \z)} \simeq V$$.

There is some weirdness to this. Some small problems have to do with the fact that,although it is the case that $$V \simeq K^{(\x, \y, \z)}$$ as sets, it is not really obvious that it's valid as a vector space. The exponent is an ordered tuple, not a set, which is not the usual meaning of the set-exponentiation notation but is not hard to imagine adapting it. Other than that, since the function elements of $$K^{(\x, \y, \z)}$$ are isomorphic to vectors $$\b{v} \in V$$ one can view it just as a change of notation and adapt the theorems acoordingly. Not a big deal.

The larger issue is, why would _this_ particular choice of basis be the value of $$\log_K V$$? There are two ways out:

One, we think of $$\log_K V$$ as really being an object which refers to all possible bases of $$V$$ at once. I like to call such an object a 'surface', even though there is probably a better word for it, just because I think of that as a generic term for a thing which can have coordinates on it (a common example is the preimage / generalized inverse of any function $$f^{-1}(x)$$). I'm sure it has other names (it is sort of the frame bundle of a single point) but I don't really care what they are right now. In any case, if we do things this way we think of $$\log_K V$$ as being parameterizable by a pair of coordinates $$(X, \Lambda)$$: a single 'origin' frame $$X = (\x, \y, \z)$$, plus an arbitrary linear transformation $$\Lambda \in GL(\dim_K V, K)$$, such that the expression $$\log_K V = X$$ is really the composition with a projection

$$X = \pi_X \log_K (V) = \pi_X (X, \Lambda)$$

The other way of doing this is to think of that projection as being encoded somehow in the logarithm itself. We know that $$\log K^2 = (\x) \times \log K + (\y) \times \log K$$ must be true at the level of sets, since $$\log $$ is an isomorphism that just changes the way we write things. But the subsequent step, of dividing by $$ \log K$$, does not have to mean the same thing as algebraic division. On the level of sets division corresponds to quotienting by an equivalence relation, but we should have freedom in _what_ equivalence relation we use. Any choice that amounts to collapsing sets of cardinality $$\log K$$ into sets of cardinality $$1$$ will correspond to the same underlying division operation on cardinalities. And since any choice of basis must give an isomorphic expression, e.g. $$\log K^2 = (\x) \log K + (\y) \log K \simeq (\x + \y) \log K + (\y) \log K $$, it must be that each choice of $$\Lambda$$ corresponds to a choice of viable quotient $$\log K^2 / \log K$$. And really that is all a basis ever is, even if you ignore the logarithm stuff: it is an accounting of all the possible images of $$\b{2} = \{ 1, 2 \}$$ in the functions $$V \simeq \{ \b{v}: \b{2} \mapsto K\} \simeq \{ v(1) \x + v(2) \y \}$$.

(This is a sketch of an argument, I suppose. I there is a much tighter version of the same idea that isn't so sketchy, but I can't seem to find it right now so this is what you get.)

If $$\log_K V$$ is an operation which returns a basis for $$V$$, it stands to reason that there's a dual operation of exponentiation which takes a basis back to $$V$$:

$$K^{\log K} = V$$

This happens to correspond very nicely to the linear span operator:

$$\span(\x, \y, \z) = K^{(\x, \y, \z)} = V$$

although $$\span$$ is usually defined in a fairly technical way ('the smallest vector subspace of an ambient vector space $$V$$ over an ambient field $$K$$ which contains the vectors $$(\x, \y, \z)$$ or something), probably this definition was just a bit confused. Instead we will simply define a new operation, the $$K$$-span, which rebuilds a vector space back from its basis

$$\span_K(X) = K^X$$

Maybe it is interesting to consider what happens if $$X$$ is not linearly-independent, but let's save that for another day.

------

# 6. Everything is Logarithms?

At the end of the day all a logarithm really does is changes the _notation_ we use to refer to a number. $$y = \log_b x$$ is just another way of writing $$x$$, which just assumes that when you go and use it you will write $$b^{y}$$ instead of $$x$$ in order to produce the same output. Logarithm-ing $$x$$ is an isomorphism for most purposes and is just used to write it in a form that is more amenable to representation and computation.

Of course there are logarithms in mathematics which are more complicated than that, such as the complex logarithm $$\log z = \text{Log } z + 2\pi i k \mid k \in \bb{Z}$$, or its messier cousins like the [logarithm of a matrix](https://en.wikipedia.org/wiki/Logarithm_of_a_matrix). But I tend to think that these are a confusion of concepts: what's really going on in the logarithm on $$\bb{C}$$, for instance, is that angles have their values in $$S_1$$, not $$\bb{R}$$, which has a different topology, and so naturally you end up with a redundancy due to the mistake; a different set of conventions would move the problem out of the logarithm and into the definitions of the values themselves. Unfortunately that's not how things are are defined today so you have to deal with it.

Anyway the discussion in this article ignores those cases and assumes that $$\log$$ really is an isomorphism: it's just a way of taking something expressed in a multiplicative form and re-expresses it in an additive form. This is turns out corresponds to many operations that one learns in math, such as the $$\dim$$ operator in linear algebra and the $$\nu_p$$ operation in number theory (sorta) and the total derivative in calculus (also sorta). 

All of these things which appear to be different are in fact many instances of the same basic primitives. My strongly-held belief is that math needs to clean this all up: we are missing the forest for the trees by keeping all this redundancy in the notations; actually we are doing the same operations over and over in different notations with slight variations in their implementations, and missing all of the similarities between them, and as a result everything is a lot harder than it needs to be. These things should not be "discoveries"; the material needs to be refactored so that they are trivial and obvious to every student.

There is also some kind of philosophical implication to things like this which I think mathematical culture tends to miss but physics has a good grasp on. This is partly why I want to emphasize that the 'baseless logarithm', which seems somewhat nonsensical mathematically, is an important object. The idea is closely related to the notion of [general covariance](https://en.wikipedia.org/wiki/General_covariance) in physics: that the properties of objects are independent of the coordinates we use to express them, and the _meaningful_ theorems end up being those that are independent of coordinate system. Since you work in coordinates you have to figure out how to extract coordinate-free insights afterwards. Sometimes the use of coordinates is helpful or necessary, of course, but experience suggests that we should always aim to have a coordinate-free version of things in the first place. 

I am in particular interested in covariant notations of _cardinality_ (which gets into concepts like numerosity, mentioned above), since I think that is the answer to my ongoing quest to make sense of permutations over 'fractional sets', as well in the right way to deal with infinite-cardinality objects such that your theorems have any physical validity (it definitely does not involve anything like the axiom of choice).

My personal suspicion is that a lot of basic mathematical objects are misdefined at present, and forcing them to become properly covariant would fix their definitions. For example, the notion of a vector space over a field is not covariant with respect to the choice of field, and this is somehow a problem; there is ample evidence (imo) that there is a meaningful concept of a vector space with non-integer dimension over a field, but to actually find the objects in which those statements make sense, you will have to modify the definitions of the words "vector space", "dimension", and "field"... while hopefully preserving the _reasons_ they were defined the way they are at present.

In particular, just like $$\log_K K^2 = 2$$ gives the dimension of a basis for $$K^2$$, I suspect that $$\log K$$ gives a thing which acts like a basis _for the field $$K$$_. Not the usual sense of 'basis', of course, but an abstract object which refers to a way of writing $$K$$. For example $$\log K / \log 2 = \log_2 K$$ would give some kind of 'binary code' for $$K$$, combined with the rules of algebra such that all of the field operations on $$K$$ have corresponding opeartions on the binary-representations of $$K$$, and $$\log K / \log J$$ would give you something like a way of writing one field in terms of another, even if they are of different sizes.

Therefore if mathematical names like $$n \in \bb{N}$$ or $$K \in \text{ Field}$$ refer to specific objects, I think of their baseless logairthms $$\log n$$ or $$\log K$$ as referring, abstractly, to the idea of their _representations_, unbound to any coordinate system. The division by another logarithm then implements the step of writing them in coordinates. So $$\log n / \log 2 = \log_2 n$$ means "write the word $$n$$ in terms of the language $$2$$", while $$\log K / \log J$$ means "write the words of $$K$$ in terms of the language of $$J$$". In this sense 'everything is logarithms' means: everything has representations in other languages, and logarithms, or something like them, are the operation we use to do that. 
Of course this is speculative handwaving... but I really have come to think that it is at some level philosophically necessary.

Not that we _have_ to use the symbols for $$\log$$ or division to do this. We could just as easily write $$\b{v} = f^{-1}(\b{v}) f$$ instead, for any function $$f$$. The choice to overload the meanings of logarithms and division follow from the observation that they so often really do mean that in practice.

It also happens to lead to a delightful mathematical pun. The word "logarithm" etymologically comes from _logos_ + _arithmos_ in Greek. _Arithmos_ means 'number', which is expected, but _logos_ can mean either 'proportion' or 'word'; the latter is why it is the root of words like 'neologism' and 'analogy' and 'logic' as well. Since the $$\log n$$ notation does not actually include the -_arithmos_ part, you might interpret it linguistically as meaning something to do with _words_ instead of numbers: abstractly, it could mean "a word for $$n$$", and then $$\log_b n = \log n / \log b$$ means "a word for $$n$$ in terms of the word for $$b$$". Which is of course exactly what it is. Cute, right?

