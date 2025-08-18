---
layout: blog
title: "Factorials as Multiplicative Integrals"
math: true
aside: true
footnotes: true
tag: math
---

In which we try to figure out what what's going on with double-factorials.

This was formerly part of the [previous post]({% post_url 2025-04-29-n-spheres %}) about $$n$$-spheres, but I started adding things to it and decided to split them up. It is not necessary to read the original previous post first, but this does sort of function as a sequel to it since it's the direction my investigation has gone. Both articles are essentially unwieldy dumps for notes and calculations that I've done and make a record of. But maybe they'll be useful as a survey of various related ideas, if anyone else is curious about this and comes across them.

My main finding is that I now believe we should be thinking of factorials as multiplicative integrals, like this:

$$\frac{n!}{m!} = \prod_m^n d^{\times}(x!)$$

And in particular, the factorials we're used to have an implicit lower bound on that integral: the value $$n!$$ is really $$\frac{n!}{0!} = \prod_0^n d^{\times}(x!)$$. This means we never really "see the value" of $$0!$$, because $$0!$$ is equivalent to $$0!/0! = 1$$. This interpretation seems to remove a bunch of ambiguity in the various definitions/analytic continuations of factorials on non-integer numbers (as well as explaining why those definitions don't mess up the usual combinatoric sense of factorials).

<!--more-->

---------

# 1. Investigations into double factorials

First we will study the double factorial function a bit and see how it interacts with half-integer single-factorials.

We'll need some Gamma function/factorial identities for integer and half-integer values to start unpacking things. I don't care much for the ways that everyone else writes them so here are my preferred versions.

The first few half-integer terms of $$\Gamma(x+1)$$/$$x!$$ are:

$$
\gdef\arraystretch{1.5}
\begin{array}{rcccl}
(-1/2)! &=& \Gamma(1/2) &=& \sqrt{\pi} \\ 
(1/2)!  &=& \Gamma(3/2) &=& (\frac{1}{2}) \sqrt{\pi} \\
(3/2)!  &=& \Gamma(5/2) &=& (\frac{3}{2}) (\frac{1}{2}) \sqrt{\pi}
\end{array}
$$

All of the structure here arises from $$(-1/2)! = \sqrt{\pi}$$: since $$n! = n (n-1)!$$ continues to hold for non-integers you just find that $$(5/2)! = 5/2 \times 3/2 \times 1/2 \times (-1/2)!$$.

The value of $$(-1/2)!$$ seems essentially connected to the Gaussian integral $$\int_{-\infty}^{\infty} e^{-x^2} \d x = \sqrt{\pi}$$; more on that another time. For now we take it as a given. Incidentally, other non-half-integer fractions of $$\Gamma$$ also take values that sometimes have legible expressions (see [here](https://en.wikipedia.org/wiki/Particular_values_of_the_gamma_function); for instance $$\Gamma(\frac{1}{4})$$ is connected to the [Leminscate](https://en.wikipedia.org/wiki/Lemniscate) in a manner similar to how $$\Gamma(\frac{1}{2})$$ is connected to spheres)... but they are much harder to compute or make sense of.

(After this, I am going to not use the symbol $$\Gamma$$ very much, except for connecting things to existing formulae. I prefer to write $$n!$$ for $$\Gamma(n+1)$$, even for non-integers. After all there's no problem to analytically extending a function outside of the domain where it makes discrete sense (we do it for $$e^x$$ and $$\ln x$$ without much complaint), and I never liked that $$\Gamma(x+1) = x!$$ is defined to be off-by-one from factorials anyway.[^gamma]

It should be mentioned, however that $$\Gamma$$ is not the _only_ interpolation of factorials to non-integers, since that is not sufficient to define it---after all any function which is zero on the integers can be added to it freely. The other ways of doing it are called [Pseudogamma](https://en.wikipedia.org/wiki/Pseudogamma_function) functions. $$\Gamma$$ is the choice that satisfies a certain criteria, the [Bohr-Mollerup conditions](https://en.wikipedia.org/wiki/Bohr%E2%80%93Mollerup_theorem): it is the only "log-convex" interpolation of $$n!$$ to non-integers, whatever that means. In any case, all the other places $$\Gamma$$ shows up proves to me that it is the _correct_ generalization of factorials in some important sense, so I'm happy to say that $$x! \equiv \Gamma(x+1)$$ throughout this article.)

[^gamma]: Apparently it's largely a historical accident, due to Legendre, and around the same time Gauss had introduced $$\Pi(z) = \Gamma(z+1)$$ for the same function. We might want to try to use that: the one advantage of $$\Gamma$$ or $$\Pi$$ is that it uses the standard function notation, meaning we can write things like $$\Pi^{(2)}(z)$$ or $$\Pi_{z}(z)$$ etc.) But I'm gonna stick with $$z!$$ for now. Incidentally there are at least some good reasons to prefer $$\Gamma$$; see see [this](https://mathoverflow.net/questions/20960/why-is-the-gamma-function-shifted-from-the-factorial-by-1). TLDR: it can be interpreted as an integral transform $$\int_0^{\infty} t^z e^{-t} d(\ln t)$$ with respect to what's called the [Haar Measure](https://en.wikipedia.org/wiki/Haar_measure) $$d(\ln t)$$. I'll talk about this in the last section.

The general case for half-integers with **odd** $$n$$: 

$$
\begin{aligned}
(\frac{n}{2})! &= (\frac{n}{2})(\frac{n-2}{2}) (\frac{n-4}{2}) \cdots (\frac{3}{2}) (\frac{1}{2}) \sqrt{\pi} \\[5px]
&= \frac{n!!}{2^{n/2}} \sqrt{\pi} \\
\end{aligned}\tag{$n$ odd}
$$

Whereas for **even** $$n$$ there are no factors of $$\sqrt{\pi}$$ because the series just terminates at $$n=1$$.

$$
\begin{aligned}
(\frac{n}{2})!&= (\frac{n}{2})(\frac{n-2}{2}) (\frac{n-4}{2}) \cdots (\frac{6}{2})(\frac{4}{2})(\frac{2}{2}) \\[5px]
&= \frac{n!!}{2^{n/2}} \\
\end{aligned}\tag{$n$ even}
$$

Here is a single value for **even** $$n$$ and the odd $$n-1$$ below it:

$$
\begin{aligned}
(\frac{n}{2})! &= \frac{n!!}{2^{n/2}} \\
(\frac{n-1}{2})! &= \frac{(n-1)!!}{2^{n/2}} \sqrt{\pi} \\
\end{aligned} \tag{$n$ even}
$$

Here are the same formulas in terms of $$k = n/2$$ ($$n$$ is still even)

$$
\begin{aligned}
k! &= \frac{(2k)!!}{2^{k}} \\
(k-\frac{1}{2})! &= \frac{(2k-1)!!}{2^{k}} \sqrt{\pi} \\
(k-1)! &= \frac{(2k-2)!!}{2^{k-1}} \\
\end{aligned}
$$

Note that the product of double factorials of adjacent numbers combine to form one single factorial, for obvious reasons (e.g. $$(5!!) (4!!) = (5 \times 3 \times 1) (4 \times 2) = 5!$$):

$$(n!!)(n-1)!! = n!$$

The product of the two half-integers does also, with some coefficients:[^gamma2]

[^gamma2]: More on that [here](https://en.wikipedia.org/wiki/Multiplication_theorem#Gamma_function%E2%80%93Legendre_formula), where it is called the "Legendre Duplication Formula". The Gamma function version is $$\Gamma(k) \Gamma(k + \frac{1}{2}) = \Gamma(2k) \sqrt{\pi}/2^{2k-1}$$. If you ask me it's more elegant written with factorials.

$$k! (k-\frac{1}{2})! = \frac{(2k)!}{2^{2k}} \sqrt{\pi}$$

Okay, that's all we need.

-------

Recall that the surface area and volume of an $$n$$-sphere are:

$$
\begin{aligned}
S_{n-1}(r) &= \frac{2 \pi^{n/2}}{(\frac{n}{2}-1)!} r^{n-1} & V_n(r) &= \frac{\pi^{n/2}}{(\frac{n}{2})!} r^n
\end{aligned}
$$

These bug me because they make it not-at-all obvious how the factors of $$\pi$$ work. The numerator alone would make you think that odd-dimensional spheres involve fractional powers of $$\pi$$, e.g. $$S_2(r) = S_{3-1}(r) = \frac{2 \pi^{3/2}}{(\frac{1}{2})!} r^2$$. Of course it turns out that the factorial in the denominator has another factor of $$\sqrt{\pi}$$ that cancels out the one in the numerator. But I don't like the formula being written this way: it's disconcerting that the computation is structurally different for even vs. odd integers, and makes me think there must be a better way to do it.

Using the above identities, the general forms of the $$n$$-sphere surface area and volume can be written, for $$n$$ even, as:

$$
\begin{aligned}
S_{\text{even, }n-1} &= \frac{2\pi^{n/2}}{\frac{(n-2)!!}{2^{(n-2)/2}}} r^{n-1} & V_{\text{even, }n} &=  \frac{\pi^{n/2}}{\frac{n!!}{2^{n/2}} } r^n \\
&\boxed{= \frac{(2\pi)^{n/2}}{(n-2)!!} r^{n-1}} & &\boxed{=  \frac{(2\pi)^{n/2}}{n!!} r^n}  \\ 
\end{aligned}
$$

and for $$n$$ odd:

$$
\begin{aligned}
S_{\text{odd, }n-1} &= \frac{2 \pi^{n/2}}{\frac{(n-2)!!}{2^{(n-1)/2}} \sqrt{\pi} } r^{n-1}  & V_{\text{odd, }n} &= \frac{\pi^{n/2}}{\frac{n!!}{2^{(n+1)/2}} \sqrt{\pi} } r^n 
\\
& \boxed{= \frac{(2) (2\pi)^{(n-1)/2}}{(n-2)!!} r^{n-1}} & 
& \boxed{= \frac{(2) (2\pi)^{(n-1)/2}}{n!!} r^n}  \\ 
\end{aligned}
$$

Those feel slightly more symmetric to me: the powers of $$2$$ and the factors of $$\pi$$ mostly have the same exponent so it seems meaningful to group them together. Now it's clear how to compute them, but it still sucks that there's different formulas for $$n$$ even vs odd. And what's with that stray factor of $$2$$ in the odd formulas?

Here they are written in an even more symmetric way:

$$
\begin{aligned}
S_{\text{even, }n-1} &= \sqrt{\frac{\pi}{2}} \frac{(2) (2\pi)^{(n-1)/2}}{(n-2)!!} r^{n-1} \\
&= \sqrt{\frac{\pi}{2}} S_{\text{odd, }n-1} \\ 
V_{\text{even, }n} &= \sqrt{\frac{\pi}{2}} \frac{(2) (2\pi)^{(n-1)/2}}{n!!} r^n \\
&= \sqrt{\frac{\pi}{2}} V_{\text{odd, }n} \\
\end{aligned}
$$

When written with double-factorials, the formulas for odd $$n$$ are off by a factor of $$\frac{1}{\sqrt{\pi/2}}$$. Isn't that just annoying? 

After thinking about this for a while I've come to think that the "discrepancy" actually comes from **how we've chosen to define the double factorial of an odd number**.[^double] Do it differently and the difference between the two equations goes away. Some clues arise if we look back at the double-factorial identities.

[^double]: There's some discussion of this on Wikipedia for [double factorial](https://en.wikipedia.org/wiki/Double_factorial) in the part about extending it to all complex numbers... but I think they actually go in a less-good direction with it. So here's my version. See what you think?

Consider the product of two factorials that differ by a half-integer:

$$k! (k-\frac{1}{2})! = \frac{(2k)!}{2^{2k}} \sqrt{\pi}$$

And compare that to the two double factorials offset by an integer, which is trivial:

$$(2k)!! (2k-1)!! = (2k)!$$

They're so similar. But the $$\sqrt{\pi}$$ seems out-of-place. For example here's $$k = 3$$:

$$
\begin{aligned}
(2k)!!(2k-1)!! &= [6 \times 4 \times 2 \times 0!!] \times [5 \times 3 \times 1!!] \\
&= 6 \times 5 \times 4 \times 3 \times 2 \times 1!! \times 0!! \\
&= 6! \\
& \\
(k!)(k - \frac{1}{2})! &= [ \frac{6}{2} \times \frac{4}{2} \times\frac{2}{2} \times\frac{0}{2}!] \times [\frac{5}{2} \times\frac{3}{2} \times\frac{1}{2} \times (-\frac{1}{2})!] \\
&= \frac{6 \times 5 \times 4 \times 3 \times 2 \times 1}{2^6}  \times 0! \times (-\frac{1}{2})! \\
&= \frac{6!}{2^6} \sqrt{\pi}
\end{aligned}
$$

The two are very nearly the same, except that the second continues after $$(1)$$ to include $$(-1)$$ in the list, which becomes $$(-1/2)!$$ and is where $$\sqrt{\pi}$$ comes from. It would be very symmetric if the two were exactly the same, except for the powers of two that come from the factorial being 'doubled'.

It sure feels suspicious. Could the definition of $$!!$$ be modified to make these exactly equal (up to the $$2^{2k}$$ factor)? Or is the definition of $$(1/2)!$$ wrong, like it shouldn't go down to $$(-1/2)!!$$?

Another way of seeing this: inverting the equations above gives the double factorial in terms of the single factorial for even/odd:

$$
\begin{aligned}
n!! &\sim 2^{n/2} (\frac{n}{2})! & \text{$n$ even} \\
n!! &\sim \frac{2^{n/2} (\frac{n}{2})!}{\sqrt{\pi/2}} & \text{$n$ odd}
\end{aligned}
$$

They're off by that factor of $$\sqrt{\pi/2}$$ again. And the asymptotic expansions of the double-factorial (by plugging into Stirling's formula) are also off:

$$
n!! \sim \begin{cases}
\sqrt{\pi n} (\frac{n}{e})^{n/2} & \text{$n$ even} \\ 
\sqrt{2 n} (\frac{n}{e})^{n/2} & \text{$n$ odd} \\ 
= \frac{1}{\sqrt{\pi/2}} [\sqrt{\pi n} (\frac{n}{e})^{n/2}] & 
\end{cases}
$$

Also, consider these two formulas $$(\frac{n}{2})! = \frac{n!!}{2^n}$$ again, but let's write the latter expressly as a function of its argument, $$k-\frac{1}{2}$$, so that the main part has the same form for $$n = 2k, 2k-1$$:

$$
\begin{aligned}
k! &= \frac{(2k)!!}{2^{k}} \\
(k-\frac{1}{2})! &= \frac{(2k-1)!!}{2^{k}} \sqrt{\pi} \\
&= \frac{(2k-1)!!}{2^{k-1/2}} \sqrt{\frac{\pi}{2}} 
\end{aligned}
$$

There it is again! What to do? Well, here's an idea. Note how

1. The factorial of an integer $$k$$ contains $$k$$ terms times the base case (e.g. $$3! = 3 \times 2 \times 1 \times 0!$$), but the factorial of a half-integer $$k-1/2$$ contains... also $$k$$ terms, or should I say, $$(k-1/2) + 1/2$$ terms (e.g. $$(\frac{5}{2})! = \frac{5}{2} \times \frac{3}{2} \times \frac{1}{2} \times (-\frac{1}{2})!$$)
2. Meanwhile, the double-factorial $$n!! = (2k!!)$$ for an integer $$k$$ contains $$k$$ terms (e.g. $$6!! = 2^3 (3 \times 2 \times 1) \times 0!!$$), but for $$k-1/2$$ also contains $$k$$ terms but with _no_ base case, e.g. $$5!! = 2^{3} (5 \times 3 \times 1)$$.

This seems to where the discrepancy comes from. Suppose we tried to fix this: let's redefine $$x!$$ and $$x!!$$ so that their products involve exactly the _same_ lists of terms. This probably means that we need to somehow interpret the factorial of $$k-1/2$$ as containing $$k-1/2$$ terms, whatever that means, times its base case, by splitting the last $$1/2$$ into two factors of $$1/\sqrt{2}$$, something like this:

$$
\begin{aligned}
3! &= \frac{6}{2} \times \frac{4}{2} \times \frac{2}{2} \times 0! \\ 
(3-\frac{1}{2})! &\? \frac{5}{2} \times \frac{3}{2} \times \frac{\sqrt{1}}{\sqrt{2}} \times \underbrace{\sqrt{\frac{\pi}{2}}}_{\text{??}} \\
\end{aligned}
$$

(Nevermind that the base-case doesn't make a ton of sense, we'll deal with that in a moment.) And then suppose we tried to make the double-factorials match this:

$$
\begin{aligned}
\frac{6!!}{2^{3}} &= \frac{6 \times 4 \times 2}{2 \times 2 \times 2} \times 0!!\\
\frac{(6-1)!!}{2^{3-1/2}} &\? \frac{5 \times 3 \times \sqrt{1}}{2 \times 2 \times \sqrt{2}} \times \underbrace{0!!}_{\? \sqrt{\pi/2}}
\end{aligned}
$$

Now $$(3-1/2)!!$$ actually contains $$(3-1/2)$$ terms, and the denominator is actually $$2^{3-1/2}$$. And, most importantly: the missing term compared to $$(3-1/2)!$$ is exactly $$\sqrt{\pi/2}$$.

It seems like whenever you write $$n!!$$ in terms of $$(n/2)!$$, there is an extra factor of $$\sqrt{\pi/2}$$ for the odd numbers, caused by the fact that $$n!!$$ stops at zero for both even and odd, while $$(n/2)!$$ goes down to zero for even but to $$-1/2$$ for odd. So perhaps what's happening is that we should think of $$5!! = 5 \times 3 \times 1$$ as including only $$5/2$$ terms in its sequence, instead of three. Whereas $$5!! = 5 \times 3 \times 1 \times (-1)!!$$ includes four terms: three full terms plus the base case. Meanwhile $$(5/2)!$$ has been including $$3$$ terms all along, and maybe the extra half term is extraneous as well, but in a different way?

Still, we have to contend with the fact that it doesn't make a lot of sense. If $$(3-1/2)!$$ and $$(6-1)!!$$ contain $$3-1/2$$ terms in their product, then the product would seem to stop at $$0!$$ or $$0!!$$, _not_ at $$(-1/2)!$$ or $$(-1/2)!/\sqrt{2}$$. So how can we reconcile that? After all we know that $$0!$$ and $$0!!$$ ought to equal $$1$$, right? So what's going on?

I feel like there are enough signs that it has to work _somehow_, and I have a guess how.  Combining these observations and then making some theory up to make the whole thing well-behaved, I believe the following is in some sense correct:

-----

# 2. Factorials as multiplicative integrals

Suppose that factorials are thought of as being a type of integral: they will be products of numbers in a range with both a start point _and_ an end point, rather than just "all the numbers down to zero". The classical factorial $$n!$$ is the one starts at $$0$$ and ends at $$n$$. We can write this as a [product integral](https://en.wikipedia.org/wiki/Product_integral)[^product] of its "multiplicative differential" $$d^{\times}(x!)$$:

[^product]: On that page this is what's called the "geometric integral". I assume that this investigation of factorials in terms of it is out there in the literature somewhere also, but I'm making it up for myself here. It seems to make a lot of sense, anyway.

$$n! = \prod_0^n d^{\times}(x!) = \frac{n!}{0!} = n!$$

But other endpoints are also possible. E.g.

$$\prod_2^n d^{\times}(x!) = \frac{n!}{2!}$$

Or 

$$\prod_{-1/2}^n d^{\times(x!)} = \frac{n!}{(-1/2)!} = \frac{n!}{0!} \frac{0!}{(-1/2)!} = \frac{n!}{\sqrt{\pi}}$$

Varying the endpoints will allow us to account for the discrepancies in the definitions. Throughout this discussion we'll use the factorial symbol to refer to product integrals of $$d^{\times}(x!)$$ which have their basepoint at $$0$$, but as we will see, plenty of factorials are better thought of as having different base-cases than that.

Here is some exposition on the multiplicative calculus. In fact it is completely isomorphic the same thing as the familiar additive calculus, under the substitution 

$$\ln \prod_a^b d^{\times} f = \int_a^b d(\ln f)$$

But since everything looks weirder in the multiplicative notation, I will go over a few things.

First, note that there are several possible alternative calculi. The one we're talking about here uses

$$d^{\times} f \equiv \frac{f(x+dx)}{f(x)}$$

Which is to say: given an _additive_ change in the argument $$x \mapsto x + dx$$, produce the _multiplicative_ change in the output of $$f$$. There are other ways to do this, e.g. you could also talk about $$d^{\times}_{\times} f = \frac{f(x \times (1+dx))}{f(x)}$$ or $$d^{+}_{\times} f = f(x \times (1+dx)) - f(x)$$ or whatever you want, and there is a (completely equivalent) theory of calculus for each. But we will only be using this one.

When you go to evaluate such an integral, instead of being a Riemann sum, it's a Riemann "product": a bunch of telescoping fractions, which cancel to produce the ratio of the integrand at the endpoints:

$$
\begin{aligned}
\prod_a^b d^{\times} f &= \frac{f(a+dx)}{f(a)} \frac{f(a + 2 \d x)}{f(a+dx)} \cdots \frac{f(b)}{f(b - dx)} \\
&= \frac{f(b)}{f(a)}
\end{aligned}
$$

Therefore the integral of $$d^{\times}(x!)$$ is a ratio of factorials:

$$\prod_a^b d^{\times}(x!) = \frac{b!}{a!}$$


Product integrals obey multiplicative identities equivalent to the additive identities of ordinary integrals:

$$[\prod_{0}^a d^{\times}f] [\prod_{a}^b d^{\times}f] = \frac{f(a)}{f(0)} \frac{f(b)}{f(a)} = \frac{f(b)}{f(0)} = \prod_{0}^b d^{\times}f$$

When the range of the product is empty, then the value is simply the multiplicative identity $$1$$. This is the reason why $$0!$$ is $$1$$: it's the product of nothing at all.

$$\prod_0^0 d^{\times}(f)= 1$$

The reason for using the integration notation is purely because we want to represent factorials as having "integration bounds". We are not really concerned with the actual value of $$d^{\times} (x!)$$. If we wanted to, we could rearrange it in terms of the additive differential $$df = f(x+dx) - f(x)$$:

$$
\begin{aligned}
d^{\times} f &= \frac{f(x+dx)}{f(x)} \\
&= 1 + \frac{f(x+dx) - f(x)}{f(x)}  \\
&= 1 + \frac{df(x)}{f(x)} \\
&= 1 + d(\ln f(x))
\end{aligned}
$$

The first-order approximation of this, the equivalent of the limit expression for the derivative, is

$$
\begin{aligned}
\lim_{dx \ra 0} \sqrt[dx]{d^{\times} f} &= \lim_{dx \ra 0} [1 + \frac{d(\ln f(x))}{dx} dx]^{1/dx} \\
&= e^{d\ln f(x) dx} \\
&= e^{f'(x)/f(x)}
\end{aligned}
$$

And you can integrate this by raising it to the $$dx$$'th power inside a product integral. Since $$e^{y \d x} \approx 1 + y \d x$$ to first order it goes back to being a product integral:

$$
\begin{aligned}
\prod [e^{f'(x)/f(x)}]^{dx} &= \prod e^{f'(x) dx/f(x)} \\
&= \prod e^{d \ln f(x)} \\
&\approx \prod 1 + d \ln f(x) \\
&= \prod d^{\times} f
\end{aligned}
$$


You can look some of explicit product integral forms up [here](https://en.wikipedia.org/wiki/List_of_derivatives_and_integrals_in_alternative_calculi). For example it says that 

$$\Gamma^*(x) = \sqrt[dx]{d^{\times}(\Gamma(x))} = e^{\Psi(x)}$$

where $$\Psi(x)$$ is the "digamma function" $$\Psi(z) = \Gamma'(x) / \Gamma(x)$$. But that's trivial: it's $$ e^{f'(x)/f(x)}$$ for $$f = \Gamma$$. So there's nothing gained by using the explicit expression for $$d^{\times}(\Gamma(x))$$. Our only purpose in using $$d^{\times}$$ is express these things as integrals.

------------

So, the normal factorial function $$n!$$ is therefore thought of as

$$n! = \prod_0^n d^{\times}(x!) = \frac{n!}{0!}$$

The Gamma function tells us roughly how to extend this to non-integers and negative numbers (ish). We expect, though, that all the integration still starts at $$0$$, meaning that the negative factorials are negatively-oriented (product) integrals:

$$\prod_0^{-1/2} d^{\times}(x!) = \frac{(-\frac{1}{2})!}{0!} = \sqrt{\pi}$$

This means that the positive-oriented integral is the inverse of that:

$$\prod_{-1/2}^0 d^{\times}(x!) = \frac{1}{\sqrt{\pi}}$$

When we want to come up with values for a factorial like $$(\frac{1}{2})!$$ we can either just take the integral from $$0$$, or we can use the usual $$n! = n \times (n-1)!$$ down to $$-1/2$$, and _then_ go back to zero.

$$
\begin{aligned}
(\frac{1}{2})! &= \prod_0^{1/2} d^{\times}(x!) \\
&= \frac{1}{2} \prod_0^{-1/2} d^{\times}(x!) \\
&= \frac{1}{2} \sqrt{\pi} \\
\end{aligned}
$$

We do not have to try to make sense of any infinite products descending to $$-\infty$$. Although it's probably still true that in some sense that these two infinite products should "cancel out" to give $$\sqrt{\pi}$$,

$$
\begin{aligned}
\dfrac{(-\frac{1}{2})!}{0!} &= \prod_0^{-1/2} d^{\times}(n!) \\
&\? \dfrac{(-\frac{1}{2}) \times (-\frac{3}{2}) \times \ldots}{(0) \times (-1) \times (-2) \times (\ldots)} \\
&= \dfrac{\prod_{-\infty}^n d^{\times}(x!)}{\prod_{-\infty}^{0} d^{\times}(x!)}
\end{aligned}
$$

we aren't going to assume anything like that. It's probably not _wrong_ to write it, but we don't need it: since we are doing explicit integrals, we can simply use the algebra of integration bounds to cancel things out. To make sense of those expressions you're going to have to contend with the divergences and how the limits get taken---the products are infinite, and $$0! = 0 \times (-1)! \? 0 \times (1/0)$$ seems to requiring multiplying zero times infinity, and if you want to express this as a limit you probably need the numerator and denominator limits to be offset even as they go to infinity (e.g. in $$\lim_{n \ra \infty}$$ the numerator still uses $$n - \frac{1}{2}$$ while the denominator uses $$n$$). It is a lot more work to justify. But you can still just cancel the integration bounds without thinking about it too much.

Note that in this scheme that the classical value $$0!$$ is _not_ the (suspicious) value of $$\prod_{-\infty}^0 d^{\times}(x!)$$, but rather the (trivial) value of $$\prod_0^0 d^{\times}(x!)$$. So far we do not really know anything about $$\prod_{-\infty}^0 d^{\times}(x!)$$, and there's no reason to think that it's going to be finite or convergent at all (since it appears to oscillate between negative and positive values at every integer...). But we will think about it some later.

-----------

# 3. A theory of double factorials

One of the awkwardnesses about generalizing factorials to non-integers is that it seems to conflict with the "combinatorial" interpretation of factorials. $$n!$$ is the number of ways to permute $$n$$ elements; what does that have to do with $$(1/2)!$$ or $$(-1)!$$? Well, maybe there's some kind of answer to that, but it's not a problem for our purposes. The combinatoric process _explicitly_ stops multiplying at $$0$$, because you stop selecting elements at that point, meaning that $$n!$$ really does mean

$$\prod_0^n d^{\times}(x!)$$

Which is interpretable as selecting one element, then another, etc, until there are none left. What happens below zero isn't relevant. (Although I would still love a combinatoric interpretation of non-integer or negative factorials.)

Now we want to talk about changing the definition of $$n!!$$ for odd $$n$$. But it doesn't have to affect the combinatoric meaning of $$n!!$$, which is the number of ways of selecting two adjacent elements at a time out of $$n$$ (where the first and last elements are counted as adjacent). Selecting two elements at a time out of an odd number of elements expressly stops at $$n=1$$, because you just can't do it anymore, meaning that the classical double factorial of an odd number is equivalent to

$$n!! \equiv \prod_{1}^n d^{\times}(x!!) \tag{odd $n$}$$

So redefining $$n!!$$ in other situations won't affect the combinatoric meaning at all, as long as that integral's value doesn't change.

Now let's consider 

$$\prod_0^{2k+1} d^{\times} (x!!)$$

Where now the lower bound is zero, not one. For example

$$\prod_0^5 d^{\times}(x!!) = \frac{5!!}{0!!} \? \frac{5 \times 3 \times 1!!}{0!!}$$

How should the numerator behave? We shouldn't try to divide the $$1!!/0!!$$ out. In fact we don't _know_ the value of $$\prod_0^1 d^{\times}(x!!) = 1!!/0!!$$. We've never seen it before; it never comes up.

Based on the clues from before, we postulate that $$n!!$$ ought to be equivalent to $$(\frac{n}{2})!$$ times a factor of $$2^{n/2}$$:

$$\prod_{2a}^{2b} d^{\times}(x!!) = 2^{b-a} \prod_{a}^{b} d^{\times}(x!)$$

When integrated the two terms just separate into two integrals, equivalent to how you can separate two integrands which are added together in an additive integral:

$$
\begin{aligned}
\prod_{2a}^{2b} d^{\times}[x!!] 
&= \prod_{2a}^{2b} d^{\times}[2^{x/2}] d^{\times}[(\frac{x}{2})!] \\
&= \prod_{a}^{b} d^{\times}[2^{x}] \times \prod_a^b d^{\times}(x!) \\
&= 2^{b-a} \prod_{a}^{b} d^{\times}(x!)
\end{aligned}
$$

Note that

$$
\begin{aligned}
d^{\times}[x!!] &= d^{\times} [2^{x/2} (\frac{x}{2})!] \\
&= \frac{2^{(x + dx)/2} (\frac{x+dx}{2})!}{2^{x/2} (\frac{x}{2})!} \\
&= d^{\times}[2^{x/2}] d^{\times}[(\frac{x}{2})!]
\end{aligned}
$$


Assuming the postulate about $$d^{\times}(x!!)$$ is correct, we get an explanation for the double factorial discrepancy. The "actual" value of $$x!!$$ when you stop at $$0$$ is

$$
\begin{aligned}
\prod_0^5 d^{\times}(x!!) &= 2^{5/2}\prod_{0}^{5/2} d^{\times}(x)! \\
&= (2^{5/2})\frac{5}{2} \times \frac{3}{2} \times (\frac{1}{2})! \\
&= 5 \times 3 \times [\sqrt{2} \times \frac{\sqrt{\pi}}{2}] \\
&= 5 \times 3 \times \sqrt{\frac{\pi}{2}} \\
\end{aligned}
$$

As expected. We'll write $$n!!_{\text{new}} = \prod_0^n d^{\times}(n!!)$$ to refer to this "new" definition of the double factorial. The two definitions side-by-side are:

$$
\begin{aligned}
5!!_{\text{old}} &\equiv \prod_1^5 d^{\times}(x!!) = \frac{5 \times 3 \times 1!!}{1!!} = 5 \times 3 \\
5!!_{\text{new}} &\equiv \prod_0^5 d^{\times}(x!!) = \frac{5 \times 3 \times 1!!}{0!!} = 5 \times 3 \times \sqrt{\frac{\pi}{2}}
\end{aligned}
$$

Although note, it's somewhat arbitrary whether you define $$5!!_{\text{old}}$$ to equal $$\prod_1^5$$ or $$\prod_{-1}^5$$. They have the same value, so I'm not sure which is conceptually correct.

$$1!!_{\text{new}} = \prod_0^1 d^{\times}(x!!) =  2^{1/2} \prod_0^{1/2} d^{\times}(x!)= \sqrt{2} \times \frac{\sqrt{\pi}}{2} = \sqrt{\frac{\pi}{2}}$$

And also

$$
\begin{aligned}
(-1)!!_{\text{new}} &= \prod_0^{-1} d^{\times}(x!!) = 2^{-1/2} \prod_0^{-1/2} d^{\times}(x!) = \sqrt{\frac{\pi}{2}}
\end{aligned}
$$

Which is also just just because $$1!! = 1 \times (-1)!! = \sqrt{\frac{\pi}{2}}$$.

Armed with this new interpretation we can answer the question of why double factorials work strangely for odd numbers. When $$(2k+1)!! = (2(k+\frac{1}{2}))!$$ is defined to contain exactly $$k+1/2$$ terms, it works fine:

$$
\begin{aligned}
(2k+1)!!_{\text{new}} &= \prod_0^{2k+1} d^{\times}(x!!) \\
&= 2^{k+1/2} \prod_0^{k+1/2} d^{\times}(x!) \\
&= 2^{k+1/2} (k+1/2)!
\end{aligned}
$$

But when it contains only $$k$$ terms, there's a missing factor of $$\sqrt{\pi/2}$$:

$$
\begin{aligned}
(2k+1)!!_{\text{old}} &= \prod_1^{2k+1} d^{\times}(x!!) \\
&= 2^{k} \prod_{1/2}^{k+1/2} d^{\times}(x!) \\ 
&= \frac{2^{k+1/2}}{2^{1/2}} \frac{(k+\frac{1}{2})!}{(\frac{1}{2})!} \\ 
&= \frac{(2k+1)!!_{\text{new}}}{\sqrt{\pi/2}}
\end{aligned}
$$

Now we have one formula for double-factorials of even or odd numbers:

$$n!!_{\text{new}} = \prod_0^{n} d^{\times}(x!!) = 2^{n/2} (n!)$$

And one asymptotic expansion:

$$n!!_{\text{new}} \sim \sqrt{\pi n} (\frac{n}{e})^{n/2}$$

And one pair of formulas for the areas and volumes of spheres when written in terms of double-factorials:

$$
\begin{aligned}
S_{n-1} &= \frac{(2\pi)^{n}}{(n-2)!!_{\text{new}}} r^{n-1} \\
V_n &= \frac{(2\pi)^n}{(n!!)_{\text{new}}} r^{n}
\end{aligned}
$$

I certainly prefer that. Not that we're going to want to start using $$n!!_{\text{new}}$$ everywhere, I mean. It's just satisfying because it makes the discrepancies less perplexing.

I don't know if this solution exists out there anywhere, because I haven't really looked. But, oddly, Wikipedia suggests the opposite fix: after observing $$n!! = 2^{n/2} \Gamma(n/2+1) / \sqrt{\pi/2}$$ for odd $$n$$, it proceeds by treating that as correct, while bemoaning that the formula doesn't work for _even_ numbers. I think that's backwards: the even one was correct.

Here are a couple more things this helps with.

The asymptotic ratio of neighboring double-factorials

$$
\begin{aligned}
\frac{(2k)!!}{(2k-1)!!} \approx \sqrt{\pi k}
\end{aligned}
$$

Is explained by:

$$
\begin{aligned}
\frac{(2k)!!}{(2k-1)!!} &= \frac{\prod_0^{2k} d^{\times}(x!!)}{\prod_1^{2k-1} d^{\times}(x!!)} \\
&= \frac{\prod_0^{2k} d^{\times}(x!!)}{\prod_0^{2k-1} d^{\times}(x!!) \times \prod_1^0 d^{\times}(x!!)} \\
&= \frac{(2k)!!_{\text{new}}}{(2k-1)!!}_{\text{new}} \times \prod_0^1 d^{\times}(x!!) \\
&\approx \sqrt{2k} \times \sqrt{\frac{\pi}{2}} \\
&= \sqrt{\pi k}
\end{aligned}
$$

Where

$$\frac{(2k)!!_{\text{new}}}{(2k-1)!!}_{\text{new}}  = \frac{2^{k}}{2^{k-1/2}} \frac{k!}{(k-1/2)!} \approx \sqrt{2k}$$

Follows from the general factorial identity $$n!/(n-a)! \approx n^a$$.

Similarly, the [Wallis Product](https://en.wikipedia.org/wiki/Wallis_product) results from

$$
\begin{aligned}
\frac{(2k)!!}{(2k-1)!!} \times \frac{(2k)!!}{(2k+1)!!} &=  [ \frac{(2k)!!_{\text{new}}}{(2k-1)!!_{\text{new}}/\sqrt{\pi/2}} ] \times [\frac{(2k)!!_{\text{new}}}{(2k+1)!!_{\text{new}}/\sqrt{\pi/2}} ] \\
&\approx \sqrt{2k} \times \frac{1}{\sqrt{2k}} \times[ \sqrt{\frac{\pi}{2}} ]^2 \\
&= \frac{\pi}{2}
\end{aligned}
$$

---------

# 4. Infinite negative factorials

Another interesting thing that this cleared up for me is why a naive attempt at defining _negative_ factorials as divergent products fails. It seems like it should be true, in some sense, that $$1!! = 1 \times (-1) \times (-3) \times \ldots$$ to infinity. Yet it is easy to find expressions using this that are clearly false, for instance

$$
\begin{aligned}
1 = \frac{1!!}{0!!} &\? \frac{1 \times (-1) \times (-3) \times (-5) \ldots}{0 \times (-2) \times (-4) \times (-6) \ldots} \\
&= \frac{1}{0} \times (\frac{-1}{-2}) \times (\frac{-3}{-4}) \times (\frac{-5}{-6}) \ldots \\
&= \frac{1}{0} \times \lim_{k \ra \infty} \frac{(2k-1)!!}{(2k)!!} \\
&\approx \frac{1}{0} \times \lim_{k \ra \infty} \frac{1}{\sqrt{\pi k}} \\
&\? \frac{1}{\sqrt{\pi}} \text{???}
\end{aligned}
$$

Writing each factorial as a product integral reveals that this computation was very flawed, however. It's incorrect in the very first line

$$
\begin{aligned}
1 = \frac{1!!}{0!!} &\? \frac{\prod^1_{-\infty} d^{\times}(x!!)}{\prod^0_{-\infty} d^{\times}(x!!)} = \prod_0^1 d^{\times}(x!!) = \sqrt{\frac{\pi}{2}} \text{ ???}\\
\end{aligned}
$$

The problem is that the classical $$1!!$$ is not $$\prod_0^1 d^{\times}(x!!) = 1!!/0!!$$, but instead $$\prod_1^1 d^{\times}(x!!)$$. Extending both factorials to infinity symmetrically requires including the missing $$\prod_0^1$$ term as well.

$$\frac{1!!}{0!!} = \frac{\prod_1^1}{\prod_0^1} \times \frac{\prod_{-\infty}^0}{\prod_{-\infty}^0} = \frac{\prod_1^0 \prod_{-\infty}^1}{\prod_{-\infty}^0} =  \frac{1}{\sqrt{\pi/2}} \frac{\prod_{-\infty}^1}{\prod_{-\infty}^0}$$

(omitting $$d^{\times}(x!!)$$s for brevity here)

The deduction between the second and third lines is also wrong: it is not valid to write $$1!! = 1 \times (-1) \times (-3) \times \ldots = \lim_{k \ra \infty} (-1)^k (2k+1)!!$$, because there is always a remainder term. We can tell because we know what the partial products should be:

$$
\begin{aligned}
1!!_{\text{new}} &= \sqrt{\frac{\pi}{2}} \\
(-1)!! &= (1!!_{\text{new}}) / (1) = \sqrt{\frac{\pi}{2}} \\
(-3)!! &= (-1)!!/(-1) = -\sqrt{\frac{\pi}{2}} \\
(-5)!! &= (-3)!!/(-3) = \frac{1}{3!!} \sqrt{\frac{\pi}{2}} \\
(-7)!! &= (-5)!!/(-5) = -\frac{1}{5!!} \sqrt{\frac{\pi}{2}} \\
0!! &= 1 \\
(-2)!! &= (0)!!/(0) \? \infty \\
(-4)!! &= (-2)!!/(-2) \? -\frac{1}{2!!} \times \infty \\ 
(-6)!! &= (-4)!!/(-4) \? \frac{1}{4!!} \times \infty \\
\end{aligned}
$$

That is:

$$
\begin{aligned}
(-2k-1)!! &= \frac{1}{(2k-1)!!} \sqrt{\frac{\pi}{2}} \\
(-2k-2)!! &= \frac{1}{(2k)!!} \times \infty
\end{aligned}
$$

(Where $$\infty = 1/0$$ is being assumed to be somehow meaningful.) Which means the actual factorization of $$1!!/0!!$$ is

$$
\frac{1 \times (-1) \times (-3) \times (-5) \ldots}{0 \times (-2) \times (-4) \times (-6) \ldots} = \frac{1}{0} \times \lim_{k \ra \infty} \frac{(2k-1)!!}{(2k)!!} \times \frac{\frac{1}{(2k-1)!!} \sqrt{\frac{\pi}{2}}}{\frac{1}{(2k)!!} \times \infty} = \sqrt{\frac{\pi}{2}}
$$

So it just doesn't work: whatever partial product you construct, the remainder of the product just serves to cancel it all out again. Boring. Evidently, although you _can_ extend factorials and double-factorials to negative infinity, it doesn't really tell you anything you don't already know: the value is fully determined by fixing it at $$n=0$$. I wish I knew what to make of the oscillating infinities, though.

-------

# 5. Multifactorials in general

It's clearly possible to generalize all of this to higher-dimensional multifactorials, like $$n!!! = n \times (n-3) \times \ldots$$. Suppose we define $$F_1(n) = n!$$ and $$F_2(n) = n!!$$, etc, so that we don't have to figure out how to notate ten factorials in row or something. Then we can generalize to all positive integers:

$$F_k(n) = n \times (n-k)$$

The values are always considered to be relative to zero:

$$F_k(n) \equiv \prod_0^n d^{\times} F_k(n)$$

But you can divide two of them to make an integral over whatever range you want:

$$\prod_a^b d^{\times} F_k(n) = \frac{F_k(b)}{F_k(a)}$$

The identity we found (or rather, guessed) above relates $$F_k$$ and $$F_1$$ like this:

$$F_1(\frac{n}{k}) = \frac{F_k(n)}{k^{n/k}}$$

such that

$$
\begin{aligned}
\prod_0^{5/2} d^{\times}(x!) &= \frac{5}{2} \times \frac{3}{2} \times \frac{\sqrt{\pi}}{2} \\
&= F_1(\frac{5}{2}) \\
&= \frac{F_2(5)}{2^{5/2}} \\
&= 2^{-5/2}\prod_0^5 d^{\times}(x!!) \\
&= 2^{-5/2} (5 \times 3 \times \sqrt{\frac{\pi}{2}}) 
\end{aligned}
$$

And also things like

$$
\begin{aligned}
\prod_{0}^{4/3} d^{\times}(x!) &= \frac{4}{3} \times \frac{1}{3} \times (-\frac{2}{3})! \\
&= \frac{F_3(4)}{3^{4/3}}
\end{aligned}
$$

Not that I have any idea what $$(-2/3)!$$ is.

The classical value of the double factorial is written in terms of $$F_k(n)$$ as

$$
\begin{aligned}
n!!_{\text{old}} = \begin{cases} 
\frac{F_2(n)}{F_2(0)} & n \text{ even} \\[1em]
\frac{F_2(n)}{F_2(1)} & n \text{ odd}
\end{cases}
\end{aligned}
$$

(This generalization is on Wikipedia [also](https://en.wikipedia.org/wiki/Double_factorial#Alternative_extension_of_the_multifactorial), but in a different notation. I prefer my way of thinking about it with integrals, though.) 

--------

Generally writing multifactorials in this notation seems to make them easy to understand, compared to using Gamma functions or dealing with all the special cases when e.g. $$4!!!$$ is expected to stop at $$1!!!$$ instead of $$0!!!$$. But, one double-factorial identity seems to translate especially well, which is the one for interleaving two double-factorials into a single-factorial:

$$(2k)!!_{\text{old}} (2k-1)!!_{\text{old}} = (2k)!$$

In the new notation that's

$$
\begin{aligned}
(2k)!!_{\text{old}} (2k-1)!!_{\text{old}} &= \big[ \prod_0^{2k} d^{\times}(x!!)\big] \big[ \prod_{-1}^{2k-1} d^{\times}(x!!) \big] \\
\end{aligned}
$$

Suppose we went ahead and divided each into its factorial representation:

$$
\begin{aligned}
(2k)!!_{\text{old}} (2k-1)!!_{\text{old}} = 2^{2k} [\prod_0^{k} d^{\times}(x!)] [\prod_{-1/2}^{k-1/2} d^{\times}(x!)] 
\end{aligned}
$$

Now how do we make that equal to $$(2k)!$$? Consider an example:

$$
\begin{aligned}
(6!!_{\text{old}})(5!!_{\text{old}}) &= (6 \times 4 \times 2) \times (5 \times 3 \times 1) \\ 
&= 2^3 (3 \times 2 \times 1) \times 2^{3} (\frac{5}{2} \times \frac{3}{2} \times \frac{1}{2}) \\
&\? 2^{6} (\frac{6}{2} \times \frac{5}{2} \times \frac{4}{2} \times \frac{3}{2} \times \frac{2}{2} \times \frac{1}{2})
\end{aligned}
$$

But what are we supposed to do with that? Well: it's a _half_ factorial! There are double factorials $$n!! = n \times (n-2)!!$$ and triple factorials $$n!!! = n \times (n-3)!!!$$, so why shouldn't there be half-factorials that have $$F_{1/2}(n) = n \times F_{1/2}(n-\frac{1}{2})$$?

The relationship is:

$$\prod_{a/2}^{b/2} d^{\times}(F_{1/2}(x)) = (\frac{1}{2})^{b-a} \prod_a^b \d^{\times}(F_{1}(x))$$

In this case:

$$
\begin{aligned}
\frac{6}{2} \times \frac{5}{2} \times \frac{4}{2} \times \frac{3}{2} \times \frac{2}{2} \times \frac{1}{2} &= \prod_{0/2}^{6/2} d^{\times}(F_{1/2}(x)) \\
&= 2^{-6} \prod_0^6 d^{\times}(x!) \\
&= 2^{-6} (6!)
\end{aligned}
$$

The interleaving can happen by translating everything into a half-factorial:

$$
\begin{aligned}
(6!!) \times (5!!) &= \prod_0^6 d^{\times}(x!!) \times \prod_{-1}^5 d^{\times}(x!!) \\
&= 2^3 \prod_0^3 d^{\times}(x!) \times 2^3 \prod_{-1/2}^{5/2} d^{\times}(x!) \\
&= 2^6 \prod_{0}^{6/2} d^{\times}(F_{1/2}(x)) \\
&= 2^6 \times 2^{-6} \prod_0^6 d^{\times}(x!) \\
&= 6!
\end{aligned}
$$

Apparently our multifactorial $$F_1(n/k) = F_k(n)/k^{n/k}$$ should also work for non-integers:

$$F_1(2n) = (\frac{1}{2})^{2n}F_{1/2}(n)$$

In this case:

$$2^{-6} F_{1/2}(3) = F_{1}(6)$$

We should also probably generalize the "interleaving" property. For single vs double factorials it's (with a few redundant terms)

$$\frac{F_2(2k)}{F_2(0)} \frac{F_2(2k-1)}{F_2(-1)} = \frac{F_1(2k)}{F_1(0)}$$

The equivalent for integer triple-factorials:

$$\frac{F_3(3k)}{F_3(0)} \times \frac{F_3(3k-1)}{F_3(-1)} \times \frac{F_3(3k-2)}{F_3(-2)} = \frac{F_1(3k)}{F_1(0)}$$

And for half-factorials expands on the $$F_1$$ side:

$$\frac{F_{1/2}(k/2)}{F_{1/2}(0)} = \frac{F_1(k/2)}{F_1(0)} \times \frac{F_1(k/2-1/2)}{F_1(-1/2)}$$

--------

The pattern is pretty clear, and as far as I can tell identities like these should hold for any numbers... but I'm not sure what is a good way to succinctly notate them. Although see also the multifactorial stuff on [here](https://en.wikipedia.org/wiki/Double_factorial#Alternative_extension_of_the_multifactorial), which is presumably equivalent.

By the way: none of these identities are really factorial-specific; they're all true of any family of sequences, such as summations, products, or whatever else. The identity for interleaving double-factorials expresses the same thing, up to some logarithms, as

$$\sum_{i=0, \text{ even}}^{2k} S_i + \sum_{i = -1, \text{ odd}}^{2k-1} S_i = \sum_{i = -1}^{n} S_i$$

So one could factor all of the factorials out of the factorial identities and create a "calculus of series", which the factorials are just one example of. It's going to look a whole lot like differential calculus, I guess. One can mostly interpret "skipping every other number" as a change of variables $$\int d(x) \ra \int d(2x)$$. But summations and products, unlike integrals, can have totally different contributions on the integer vs. non-integer terms, whereas the calculus of smooth functions, at least, cannot. I suppose the general idea is something like:

1. Start with a smooth function $$f(x)$$, and its derivative $$f'(x)$$.
2. Create another function $$g_k(x) = \int_{x-k}^x f'(x) \d x$$, so each value of $$g_k(x)$$ summarizes the preceding $$k$$-width range of $$f'(x)$$.
3. Now $$g_k(x)$$ obeys a new calculus: $$f(x) = f(x-k) + g_k(x)$$, and all values of $$f$$ can be written as sums of $$g_k$$ plus some base values.
4. And all of the above also holds for product integrals or any other iteratable binary operation. In particular, factorials are reconstructed by taking $$f(x) = \Gamma(x+1)$$ and $$g_1(x) = \prod_{x-1}^x \Gamma'(x+1) \d x = \Gamma(x+1)/\Gamma(x) = x$$.

I hope to look into all this a lot more later on, because the factorial theory is clearly harder to understand due to be conflated with this other theory. I expect that it will also be interesting to connect it to the theory of [interpolating infinite sums](https://mpmueller.net/fractional-sums/), coarse-graining (which it is), and generally to the evaluation of divergent series. (Probably there is also a theory of this out there? But I'm not sure how to find it.)

---------

Okay that's all I have for now. I might come back and add notes to this if I have any more ideas/investigations about factorials, though.