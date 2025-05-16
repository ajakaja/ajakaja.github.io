---
layout: blog
title: "Factorials as Multiplicative Integrals"
math: true
aside: true
footnotes: true
tag: math
---

(This was formerly part of the [previous post]({% post_url 2025-04-29-n-spheres %}) about $$n$$-spheres, but I started adding things to it and decided to split them up.)

This article: investigations in trying to figure out what what's going on with double-factorials.

The interesting thing in here is probably the idea of treating factorials as multiplicative integrals, like

$$\frac{n!}{m!} = \prod_m^n d^{\times}(x!)$$

Since this seems to remove some of the ambiguity in the various definitions/analytic continuations of factorials on non-integer numbers (as well as explaining why those definitions don't mess up the usual combinatoric sense of factorials). There's also some observations about the interpretation of fractional derivatives that seemed interesting and are maybe not found elsewhere.

<!--more-->

It may or may not be helpful to read the previous post also. They're both unwieldy dumps for notes and calculations that I've done. But maybe they'll be useful as a survey of various related ideas, if anyone else is curious about this and comes across them?

_5/10/2025 edit: rewrote most of this after realizing I had made some major errors._

---------

# 1. Investigations into factorials

We'll need some Gamma function/factorial identities for integer and half-integer values to start unpacking things, and I don't like the ways that anyone else writes them so I need to write them out myself.

I am going to not use the symbol $$\Gamma$$ very much except for connecting things to existing formulas: I prefer to write $$n!$$ for $$\Gamma(n+1)$$, even for non-integers. We're used to analytically extending a function outside of the domain where it makes discrete sense (e.g. $$e^x$$), and I never liked that $$\Gamma$$ is defined to be off-by-one from factorials anyway. (Apparently it's largely a historical accident. But there are [arguments for both ways](https://mathoverflow.net/questions/20960/why-is-the-gamma-function-shifted-from-the-factorial-by-1).)

The first few half-integer terms of $$\Gamma$$/factorial are:

$$
\begin{aligned}
(-\frac{1}{2})!  &= \sqrt{\pi} \\ 
&= \Gamma(\frac{1}{2}) \\
(\frac{1}{2})!  &= (\frac{1}{2}) \sqrt{\pi} \\
&= \Gamma(\frac{3}{2}) \\
(\frac{3}{2})! &= (\frac{3}{2}) (\frac{1}{2}) \sqrt{\pi} \\
&= \Gamma(\frac{5}{2}) 
\end{aligned}
$$

All of the structure here arises from $$(-1/2)! = \sqrt{\pi}$$, since $$n! = n (n-1)!$$ continues to hold for non-integers. The value of $$(-1/2)!$$ is essentially connected to the Gaussian integral $$\int_{-\infty}^{\infty} e^{-x^2} \d x = \sqrt{\pi}$$; more on that later. Other non-half-integer fractions also take values that sometimes have legible expressions (see [here](https://en.wikipedia.org/wiki/Particular_values_of_the_gamma_function)) but they are much harder to compute or make sense of.

The general case for half-integers with odd $$n$$: 

$$
\begin{aligned}
(\frac{n}{2})! &= (\frac{n}{2})(\frac{n-2}{2}) (\frac{n-4}{2}) \ldots (\frac{3}{2}) (\frac{1}{2}) \sqrt{\pi} \\
&= \frac{n!!}{2^{n/2}} \sqrt{\pi} \\
\end{aligned}\tag{$n$ odd}
$$

Whereas for even $$n$$ there are no factors of $$\sqrt{\pi}$$ because the series just terminates at $$n=1$$.

$$
\begin{aligned}
(\frac{n}{2})!&= (\frac{n}{2})(\frac{n-2}{2}) (\frac{n-4}{2}) \ldots (\frac{6}{2})(\frac{4}{2})(\frac{2}{2}) \\
&= \frac{n!!}{2^{n/2}} \\
\end{aligned}\tag{$n$ even}
$$

Here is the value of the half-integer factorial for a single fixed _even_ $$n$$ and, the odd $$n-1$$ below it, and the even $$n-2$$ below that (since we're going to use that in a sec):

$$
\begin{aligned}
(\frac{n}{2})! &= \frac{n!!}{2^{n/2}} \\
(\frac{n-1}{2})! &= \frac{(n-1)!!}{2^{n/2}} \sqrt{\pi} \\
(\frac{n-2}{2})! &= \frac{(n-2)!!}{2^{(n-2)/2}} \\
\end{aligned} \tag{$n$ even}
$$

And the other way around: odd $$n$$, even $$n-1$$, and odd $$n-2$$:

$$
\begin{aligned}
(\frac{n}{2})! &= \frac{n!!}{2^{(n+1)/2}} \sqrt{\pi} \\
(\frac{n-1}{2})! &= \frac{(n-1)!!}{2^{(n-1)/2}} \\
(\frac{n-2}{2})! &= \frac{(n-2)!!}{2^{(n-1)/2}} \sqrt{\pi} \\
\end{aligned} \tag{$n$ odd}
$$

Finally, the same formulas in terms of $$k = n/2$$ when $$n$$ is even:

$$
\begin{aligned}
k! &= \frac{(2k)!!}{2^{k}} \\
(k-\frac{1}{2})! &= \frac{(2k-1)!!}{2^{k}} \sqrt{\pi} \\
(k-1)! &= \frac{(2k-2)!!}{2^{k-1}} \\
\end{aligned}
$$

The double factorials of two adjacent numbers combine to form one single factorial: $$(n!!)(n-1)!! = n!$$. So, the product of the two half-integers does also, with some coefficients:[^gamma2]

[^gamma2]: More on that [here](https://en.wikipedia.org/wiki/Multiplication_theorem#Gamma_function%E2%80%93Legendre_formula), where it is called the "Legendre Duplication Formula". The Gamma function version is $$\Gamma(k) \Gamma(k + \frac{1}{2}) = \Gamma(2k) \sqrt{\pi}/2^{2k-1}$$. It's more elegant with factorials.

$$k! (k-\frac{1}{2})! = \frac{(2k)!}{2^{2k}} \sqrt{\pi}$$

Okay, that should do it.

-------

The surface area and volume of an $$n$$ sphere are:

$$
\begin{aligned}
S_{n-1} &= \frac{2 \pi^{n/2}}{(\frac{n}{2}-1)!} r^{n-1} & V_n &= \frac{\pi^{n/2}}{(\frac{n}{2})!} r^n
\end{aligned}
$$

Using the above identities, the general forms of the $$n$$-sphere surface area and volume are, for $$n$$ even:

$$
\begin{aligned}
S_{\text{even, }n-1} &= \frac{2\pi^{n/2}}{\frac{(n-2)!!}{2^{(n-2)/2}}} r^{n-1} & V_{\text{even, }n} &=  \frac{\pi^{n/2}}{\frac{n!!}{2^{n/2}} } r^n \\
&\boxed{= \frac{(2\pi)^{n/2}}{(n-2)!!} r^{n-1}} & &\boxed{=  \frac{(2\pi)^{n/2}}{n!!} r^n}  \\ 
\end{aligned}
$$

and $$n$$ odd:

$$
\begin{aligned}
S_{\text{odd, }n-1} &= \frac{2 \pi^{n/2}}{\frac{(n-2)!!}{2^{(n-1)/2}} \sqrt{\pi} } r^{n-1}  & V_{\text{odd, }n} &= \frac{\pi^{n/2}}{\frac{n!!}{2^{(n+1)/2}} \sqrt{\pi} } r^n 
\\
& \boxed{= \frac{(2) (2\pi)^{(n-1)/2}}{(n-2)!!} r^{n-1}} & 
& \boxed{= \frac{(2) (2\pi)^{(n-1)/2}}{n!!} r^n}  \\ 
\end{aligned}
$$

Those feel slightly more symmetric to me: the powers of $$2$$ and the factors of $$\pi$$ mostly have the same exponent so it seems meaningful to group them together. But they are still awkward! At least now it's clear how to compute them. But it sucks that there's different formulas for $$n$$ even vs odd. And what's with that stray factor of $$2$$?

Here they are written in a slightly more symmetric way:

$$
\begin{aligned}
S_{\text{even, }n-1} &= \sqrt{\frac{\pi}{2}} \frac{(2) (2\pi)^{(n-1)/2}}{(n-2)!!} r^{n-1} \\
&= \sqrt{\frac{\pi}{2}} S_{\text{odd, }n-1} \\ 
V_{\text{even, }n} &= \sqrt{\frac{\pi}{2}} \frac{(2) (2\pi)^{(n-1)/2}}{n!!} r^n \\
&= \sqrt{\frac{\pi}{2}} V_{\text{odd, }n} \\
\end{aligned}
$$

When written with double-factorials, the formulas for odd $$n$$ are off by a factor of $$\frac{1}{\sqrt{\pi/2}}$$. Isn't that just annoying? Well: I've started to suspect that the "discrepancy" actually comes from **how we've chosen to define the double factorial of an odd number**.[^double] Here are some of the clues. Take a look back at those half-integer factorial identities: 

[^double]: There's some discussion of this on Wikipedia for [double factorial](https://en.wikipedia.org/wiki/Double_factorial) in the part about extending it to all complex numbers... but I think they actually go in a less-good direction with it. So here's my version. See what you think?

Consider the product of two factorials that differ by a half-integer:

$$k! (k-\frac{1}{2})! = \frac{(2k)!}{2^{2k}} \sqrt{\pi}$$

And compare that to the two double factorials offset by an integer, which is trivial:

$$(2k)!! (2k-1)!! = (2k)!$$

They're so similar. But the $$\sqrt{\pi}$$ seems out-of-place. For example here's $$k = 3$$:

$$
\begin{aligned}
(2k)!!(2k-1)!! &= [6 \times 4 \times 2 \times 0!] \times [5 \times 3 \times 1!!] \\
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

Also, consider these two formulas, but let's write the latter expressly as a function of its argument, $$k-\frac{1}{2}$$:

$$
\begin{aligned}
k! &= \frac{(2k)!!}{2^{k}} \\
(k-\frac{1}{2})! &= \frac{(2k-1)!!}{2^{k}} \sqrt{\pi} \\
&= \frac{(2k-1)!!}{2^{k-1/2}} \sqrt{\frac{\pi}{2}} 
\end{aligned}
$$

There it is again! What to do? Well, here's an idea: the factorial of an integer $$k$$ contains $$k+1$$ terms, if you count the $$0!$$ term. The factorial of a half-integer $$k-1/2$$ contains... $$(k-1/2) + 1 + 1/2$$ terms? Meanwhile, the double-factorial of an even $$2k$$ contains $$k+1$$ terms, but the double-factorial of an odd $$k$$ contains $$k$$ terms: one fewer, instead of $$3/2$$ more. And this seems to be where the discrepancy comes from.

Suppose we interpreted the factorial of $$k-1/2$$ as containing $$k-1/2$$ terms, whatever that means, times its base-case, by splitting the last $$1/2$$ into two factors of $$1/\sqrt{2}$$:

$$
\begin{aligned}
3! &= \frac{6}{2} \times \frac{4}{2} \times \frac{2}{2} \times 0! \\ 
(3-\frac{1}{2})! &\? \frac{5}{2} \times \frac{3}{2} \times \frac{\sqrt{1}}{\sqrt{2}} \times \sqrt{\frac{\pi}{2}} \\
\end{aligned}
$$

(Nevermind that the basecase doesn't make a ton of sense, we'll deal with that in a moment.) And then suppose we tried to make the double-factorials match this:

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

Suppose that factorials are thought of like a type of integral: they will be products of numbers in a range with both a start point _and_ an end point, rather than just "all the numbers down to zero". The classical factorial $$n!$$ is the one starts at $$0$$ and ends at $$n$$, which we can write as a [product integral](https://en.wikipedia.org/wiki/Product_integral)[^product] of its multiplicative differential $$d^{\times}(x!)$$:

[^product]: The "geometric integral", on that page. I assume that this investigation of factorials is out there in the literature somewhere also, but I'm making it up for myself here. It seems to make a lot of sense, anyway.

$$n! = \prod_0^n d^{\times}(x!) = \frac{n!}{0!} = n!$$

But other endpoints are also possible. E.g.

$$\prod_2^n d^{\times}(x!) = \frac{n!}{2!}$$

Or 

$$\prod_{-1/2}^n d^{\times(x!)} = \frac{n!}{(-1/2)!} = \frac{n!}{0!} \frac{0!}{(-1/2)!} = \frac{n!}{\sqrt{\pi}}$$

Varying the endpoints will allow us to account for the discrepancies in the definitions. Throughout this discussion we'll use the factorial symbol to refer to product integrals of $$d^{\times}(x!)$$ which have their basepoint at $$0$$, but as we will see, plenty of factorials are better thought of as having different base-cases than that.

The meaning of $$d^{\times}(f)$$ is the natural one from multiplicative calculus,[^prod] which is a thing, albeit somewhat less-well-known than the usual additive calculus:

[^prod]: There are several ways to define product integrals. You can also have the _argument_ be multiplied, like $$d^{\times} f = (f(x \times (1+dx)) - f(x))/(1 +dx)$$, or both, or other things, and there is a coherent calculus for each of them. But the rest are not useful here. (You could distinguish them with $$d^{\times} f/d^+ x$$ vs $$d^+ f / d^{\times} x$$, etc. But we won't.) 

$$d^{\times} f = \frac{f(x+dx)}{f(x)}$$

You could write this with a $$\lim_{dx \ra 0}$$ in front of it. But we're not really interested in doing the "infinitesimal" version of this calculus, and I don't really know or care if the limit exists. We're going to be computing finite-difference derivatives instead, because that's what we know how to do. For instance

$$d^{\times}(x!)\big|_{n-1}^n = \frac{n!}{(n-1)!} = n$$

Which you can think of as the result of an integral of an infinitesimal integral, $$\prod_{n-1}^n d^{\times}(x!) = d^{\times}(x!) \big\vert_{n-1}^n$$, if you want, but it's not necessary.

Product integrals obey multiplicative identities equivalent to the additive identities of ordinary integrals:

$$[\prod_{0}^a d^{\times}f] [\prod_{a}^b d^{\times}f] = \frac{f(a)}{f(0)} \frac{f(b)}{f(a)} = \frac{f(b)}{f(0)} = \prod_{0}^b d^{\times}f$$

When the range of the product is empty, then the value is simply the multiplicative identity $$1$$. This is the reason why $$0!$$ is $$1$$: it's the product of nothing at all:

$$\prod_0^0 d^{\times}(f)= 1$$

And if two product integrals ever multiply to create $$0/0$$... that's fine, we should probably allow them to cancel out because we know it gives the right answer:

$$\prod_{-1}^{0} d^{\times} (x) \prod_{0}^{1} d^{\times} (x) = \frac{0}{(-1)} \frac{(1)}{0} = \prod_{-1}^{1} d^\times (x)$$

I don't know if we'll need that, but I feel like it has to work that way for this to make any sense.[^zero]

[^zero]: The additive equivalent is $$\int_{-1}^0 d(\log x) + \int_0^{1} d(\log x) = \int_{-1}^1 d(\log x)$$. Technically $$1/x$$ is not integrable over $$x=0$$ because the behavior at $$x=0$$ is uncontrolled. But IMO $$d(\log x)$$ is justifiably integrable, because you can say: however we choose to regularize the infinity here, we can guarantee it will cancel out _with itself_. One argument for why $$1/x$$ is not integrable at $$x=0$$ is that you can never really see the exact value of $$x$$, just an approximation of it, so $$1/x$$ might really be $$1/(x + \e f(x))$$ for indetectable $$f(x)$$, and the $$f(x)$$ might do something non-trivial. On the other hand if $$d(\log x)$$ is really $$d(\log x + \e f(x))$$, the $$f(x)$$ will get canceled out regardless of what it is... as long as both integrands come from the same function.

If the multiplicative integrals seem sketchy, you can always convert them into additive integrals with logarithms:

$$\log \prod_a^b d^{\times}(f) = \int_a^b d \log(f) = \log \frac{f(b)}{f(a)}$$

The value of the actual differential $$d^{\times}(f)$$ may be written as

$$d^{\times}(f) = e^{d \log(f(x))} = e^{f'/f} e^{dx} = e^{f'/f} d^{\times}(x)$$

If you want to write it out---but it's rarely useful to do so.

When you occasionally do get factors which multiply to $$\pm \infty$$, the logarithm picture splits them out into their own terms. This is just a notational difference, but maybe less upsetting to look at?[^entropy]

$$
\begin{aligned}
\log \prod_{-a}^a d^{\times} x &= \int_{-a}^a d(\log x)  \\
&= \log_{-a}^0 d(\log x) + \log_0^a d(\log x) \\
&= \log a - \log 0 + \log 0 - \log (-a) \\
&= \log (-1) 
\end{aligned}
$$

[^entropy]: I am reminded of the sense in which [entropy]({% post_url 2018-02-23-entropy-1 %}) of continuous distributions should be thought of being relative to an infinite "entropy of continuum": $$S[\mathcal{U(0,2)}] = 1 + S[\mathcal{U}(0,1)] = 1 + \log 2^X = 1 + X$$, where $$X$$ is the number of bits to specify a point in a uniform distribution: theoretically infinite, in practice just very large and unspecified.

Note for $$d (\log f) = df/f = f'(x)/f(x) \,d x$$ should not be confused with $$(\log f) \, d x$$. We are never actually taking the logarithm of $$n!$$ when we integrate $$\int d (\log n!)$$.

------------

The normal factorial function $$n!$$ is therefore thought of as

$$n! = \prod_0^n d^{\times}(x!) = \frac{n!}{0!}$$

But the Gamma function reveals that the product must actually extend below $$0$$ for non-integers:

$$(n+\e)! = \prod_{a}^n d^{\times}(x!) = \frac{n!}{a!}$$

What is the value of $$a$$, though? Maybe $$-\infty$$? Maybe $$-1$$? I'm not sure it really matters. If all the integrals start at $$0$$, then we know that 

$$\int_0^{-1/2} d^{\times}(x!) = \frac{(-1/2)!}{0!} = \sqrt{\pi}$$

And all the other half-integers are derivable from that. We get

$$
\begin{aligned}
(\frac{1}{2})! &= \frac{\sqrt{\pi}}{2} \times 0! \\
&= \frac{\sqrt{\pi}}{2} \times \frac{1}{\sqrt{\pi}} \times (-\frac{1}{2})! \\ 
&= \frac{1}{2} \times (-\frac{1}{2})! \\
0! &= \frac{1}{\sqrt{\pi}} \times (-\frac{1}{2})! \\
&= 1 \\
\end{aligned}
$$


Note that we're not trying to define these in terms of infinite products descending to $$-\infty$$. Although it's probably still true that in some sense the infinite products cancel out to give $$\sqrt{\pi}$$:

$$\dfrac{(-\frac{1}{2})!}{0!} = \dfrac{(-\frac{1}{2}) \times (-\frac{3}{2}) \times \ldots}{(0) \times (-1) \times (-2) \times (\ldots)}$$

We aren't basing this on any argument like that. Since we are doing explicit integrals, we can simply use the algebra of integration bounds to cancel things out:

$$
\begin{aligned}
\dfrac{(\frac{1}{2})!}{0!} &= \prod_0^{1/2} d^{\times}(x!) \\
&= \prod_{1/2}^{-1/2} d^{\times}(x!) \prod_0^{-1/2} d^{\times}(x!) \\
&= \frac{1}{2} \times \sqrt{\pi}
\end{aligned}
$$

That said, it's probably not _wrong_ to write

$$\frac{n!}{0!} = \dfrac{\prod_{-\infty}^n d^{\times}(x!)}{\prod_{-\infty}^{0} d^{\times}(x!)}$$

We just don't need it. To make sense of that expressions you're going to have to contend with the divergences---both the fact that the products are infinite, and the fact that $$0! = 0 \times (-1)! \? 0 \times (1/0)$$ seems to requiring multiplying zero times infinity. It is a lot more work to justify. But you can still just cancel the integration bounds without thinking about it too much.

Note that the classical value $$0!$$ is _not_ the value of $$\prod_{-\infty}^0 d^{\times}(x!)$$, but rather the (trivial) value of $$\prod_0^0 d^{\times}(x!)$$. So far we do not really know anything about $$\prod_{-\infty}^0 d^{\times}(x!)$$, and there's no reason to think that it's going to be finite or convergent at all (since it appears to oscillate between negative and positive values at every integer...). But we will try to compute it explicitly later, after we talk about double factorials in this notation.

Also: we are not going to actually try to use the explicit expression for $$d^{\times}(x!)$$. Actually it is not very helpful anyway. You can look some of explicit product integral forms up [here](https://en.wikipedia.org/wiki/List_of_derivatives_and_integrals_in_alternative_calculi): it says that $$d^{\times}(\Gamma(z)) = e^{\Psi(z)} d^{\times}$$, where $$\Psi(z)$$ is the "digamma function" $$\Psi(z) = \Gamma'(z) / \Gamma(z)$$. But in fact that is just $$e^{\log \Gamma(z) dz}$$, which is already what we would have guessed it would be.

Although I do think that this "multiplicative calculus" is exactly as important as the usual additive one (since they are isomorphic...), I don't find the explicit formulae in it to be especially useful. The reason it's helpful here is that it helps us make sense of what factorials were already doing by removing a layer of abstraction.

-----------

# 3. A theory of double factorials

One of the awkwardnesses about generalizing factorials to non-integers is that it seems to conflict with the "combinatorial" interpretation of factorials. $$n!$$ is the number of ways to permute $$n$$ elements; what does that have to do with $$(1/2)!$$ or $$(-1)!$$? Well, maybe there's some kind of answer to that, but it's not a problem for our purposes. The combinatoric process _explicitly_ stops multiplying at $$0$$, because you stop selecting elements at that point. $$n!$$ really does mean

$$\prod_0^n d^{\times}(x!)$$

Which is interpretable as selecting one element, then another, etc, until there are none left. What happens below zero isn't relevant. (Although I would still love a combinatoric interpretation of non-integer or negative factorials.)

Now we want to talk about changing the definition of $$n!!$$ for odd $$n$$. But it doesn't have to affect the combinatoric meaning of $$n!!$$, which is the number of ways of selecting two adjacent elements at a time out of $$n$$, where the first and last elements are counted as adjacent. Selecting two elements at a time out of an odd number of elements expressly stops at $$n=1$$, because you just can't do it anymore:

$$n!! \equiv \prod_{1}^n d^{\times}(x!!)$$

So redefining $$n!!$$ in _other_ situations won't affect the combinatoric meaning at all, as long as these integrals' values doesn't change.

In particular let's consider 

$$\prod_0^{2k+1} d^{\times} (x!!)$$

Where now the lower bound is zero, not one. For example

$$\prod_0^5 d^{\times}(x!!) = \frac{5!!}{0!!} \? \frac{5 \times 3 \times 1!!}{0!!}$$

How should the numerator behave? We need for it to end at an explicit factor of $$0!!$$ to cancel out the denominator: although it's likely reasonable to define $$0!! = \prod_0^0 d^{\times}(x!!) = 1$$, the same should work if we (divergently) factor $$0!! = 0 \times (-2) \times (-4) \times \ldots$$. We need an _explicit_ factor of $$0!!$$ in the numerator to make this work in all factorizations (which is I guess equivalent to making an equation work "in all coordinate systems").

Based on the clues from before, it seems like a reasonable definition of the double factorial is that it is simply the single factorial times a factor of $$2^n$$:

$$\prod_{2a}^{2b} d^{\times}(x!!) = 2^{b-a} \prod_{a}^{b} d^{\times}(x!)$$

This wasn't quite right due to the $$\sqrt{\pi/2}$$ term, but now we have another way of dealing with that, by changing the product integral bounds. This corresponds to the following calculus:

$$
\begin{aligned}
d^{\times}[x!!] &= d^{\times} [2^{x/2} (\frac{x}{2})!] \\
&= \frac{2^{(x + dx)/2} (\frac{x+dx}{2})!}{2^{x/2} (\frac{x}{2})!} \\
&= d^{\times}[2^{x/2}] d^{\times}[(\frac{x}{2})!]
\end{aligned}
$$

When integrated the two terms just separate into two integrals, equivalent to how you can separate two integrands which are added together in an additive integral:

$$
\begin{aligned}
\prod_{2a}^{2b} d^{\times}[x!!] 
&= \prod_{2a}^{2b} d^{\times}[2^{x/2}] d[(\frac{x}{2})!] \\
&= \prod_{a}^{b} d^{\times}[2^{x}] \times \prod_a^b d(x!) \\
&= 2^{b-a} \prod_{a}^{b} d^{\times}(x!)
\end{aligned}
$$

Assuming our postule about $$d^{\times}(x!!)$$ is correct, we get

$$
\begin{aligned}
\prod_0^5 d^{\times}(x!!) &= 2^{5/2}\prod_{0}^{5/2} d^{\times}(x)! \\
&= (2^{5/2})\frac{5}{2} \times \frac{3}{2} \times (\frac{1}{2})! \\
&= 5 \times 3 \times [\sqrt{2} \times \frac{\sqrt{\pi}}{2}] \\
&= 5 \times 3 \times \sqrt{\frac{\pi}{2}} \\
\end{aligned}
$$

As expected. The difference in the two definitions of the double factorial for odd numbers then is

$$
\begin{aligned}
5!!_{\text{old}} &\equiv \prod_1^5 d^{\times}(x!!) = \frac{5 \times 3 \times 1!!}{1!!} = 5 \times 3 \\
5!!_{\text{new}} &\equiv \prod_0^5 d^{\times}(x!!) = \frac{5 \times 3 \times 1!!}{0!!} = 5 \times 3 \times \sqrt{\frac{\pi}{2}}
\end{aligned}
$$

And 

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
(2k+1)!!_{\text{new}} & \prod_0^{2k+1} d^{\times}(x!!) \\
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

$$n!!_{\text{new}} = \prod_0^{n} d^{\times}(x!!) = 2^{n/2} (x!)$$

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
&= \sqrt{2k} \times \sqrt{\frac{\pi}{2}} \\
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

Writing each factorial as a product integral reveals that this computation was very flawed, however. The very first line says that

$$
\begin{aligned}
1 = \frac{1!!}{0!!} &\? \frac{\prod^1_{-\infty} d^{\times}(x!!)}{\prod^0_{-\infty} d^{\times}(x!!)} = \prod_0^1 d^{\times}(x!!) = \sqrt{\frac{\pi}{2}} \text{ ???}\\
\end{aligned}
$$

The problem is that $$1!!$$ is not normally given by $$\prod_0^1 d^{\times}(x!!) = 1!!/0!!$$, but instead by $$\prod_1^1 d^{\times}(x!!)$$. That is: extending both factorials to infinity symetrically requires including the missing $$\prod_0^1$$ term as well.

$$\frac{1!!}{0!!} = \frac{\prod_1^1}{\prod_0^1} \times \frac{\prod_{-\infty}^0}{\prod_{-\infty}^0} = \frac{\prod_1^0 \prod_{-\infty}^1}{\prod_{-\infty}^0} =  \frac{1}{\sqrt{\pi/2}} \frac{\prod_{-\infty}^1}{\prod_{-\infty}^0}$$

(omitting $$d^{\times}(x!!)$$s for brevity here...)

The second line is also wrong. We can tell because we know what the partial products should be:

$$
\begin{aligned}
1!! &= \sqrt{\frac{\pi}{2}} \\
(-1)!! &= (1!!) / (1) = \sqrt{\frac{\pi}{2}} \\
(-3)!! &= (-1)!!/(-1) = -\sqrt{\frac{\pi}{2}} \\
(-5)!! &= (-3)!!/(-3) = \frac{1}{3!!} \sqrt{\frac{\pi}{2}} \\
0!! &= 1 \\
(-2)!! &= (0!!)/(0) \? \infty \\
(-4)!! &= (-2!!)/(-2) \? -\frac{1}{2!!} \times \infty \\ 
(-6)!! &= (-4!!)/(-4) \? \frac{1}{4!!} \times \infty \\
\end{aligned}
$$

That is:

$$
\begin{aligned}
(-2k-1)!! &= \frac{1}{(2k-1)!!} \sqrt{\frac{\pi}{2}} \\
(-2k-2)!! &= \frac{1}{(2k)!!} \times \infty
\end{aligned}
$$

Which means the actual factorization is

$$
\frac{1 \times (-1) \times (-3) \times (-5) \ldots}{0 \times (-2) \times (-4) \times (-6) \ldots} = \frac{1}{0} \times \lim_{k \ra \infty} \frac{(2k-1)!!}{(2k)!!} \times \frac{\frac{1}{(2k-1)!!} \sqrt{\frac{\pi}{2}}}{\frac{1}{(2k)!!} \times \infty} = \sqrt{\frac{\pi}{2}}
$$

So it just doesn't work: whatever partial product you construct, the remainder of the product just serves to cancel it all out again. Boring.

-------

# 5. Multifactorials in general

It's clearly possible to generalize all of this to higher-dimensional multifactorials, like $$n!!! = n \times (n-3) \times \ldots$$. Suppose we define $$F_1(n) = n!$$ and $$F_2(n) = n!!$$, etc, so that we don't have to figure out how to notate ten factorials in row or something. Then we can generalize to all positive integers:

$$F_k(n) = n \times (n-k)$$

The values are always considered to be relative to zero:

$$F_k(n) \equiv \prod_0^n d^{\times} F_k(n)$$

But you can divide two of them to make an integral over whatever range ouy want:

$$\prod_a^b d^{\times} F_k(n) = F_k(b)/F_k(a)$$

The identity we found above relates $$F_k$$ and $$F_1$$ like this:

$$F_1(\frac{n}{k}) = \frac{F_k(n)}{k^{n/k}}$$

e.g.

$$
\begin{aligned}
\prod_0^{5/2} d^{\times}(x!) &= \frac{5}{2} \times \frac{3}{2} \times \frac{\sqrt{\pi}}{2} \\
&= F_1(\frac{5}{2}) \\
&= \frac{F_2(5)}{2^{5/2}} \\
&= 2^{-5/2}\prod_0^5 d^{\times}(x!!) \\
&= 2^{-5/2} (5 \times 3 \times \sqrt{\frac{\pi}{2}}) 
\end{aligned}
$$

Although do keep in mind that the classical value of the double factorial is

$$
\begin{aligned}
n!! = \begin{cases} 
\frac{F_2(n)}{F_2(0)} & n \text{ even} \\[1em]
\frac{F_2(n)}{F_2(1)} & n \text{ odd}
\end{cases}
\end{aligned}
$$

(This generalization is on Wikipedia [also](https://en.wikipedia.org/wiki/Double_factorial#Alternative_extension_of_the_multifactorial), but in a different notation. I prefer my way of thinking about it with integrals, though.) 

--------

The one double-factorial identity that really doesn't translate well to product integrals is

$$(2k)!! (2k-1)!! = (2k)!$$

In our notation that identity becomes

$$
\begin{aligned}
(2k)!! (2k-1)!! &= \big[ \prod_0^{2k} d^{\times}(x!!)\big] \big[ \prod_{-1}^{2k-1} d^{\times}(x!!) \big] \\
\end{aligned}
$$

Suppose we went ahead and divided each into its factorial representation:

$$
\begin{aligned}
(2k)!! (2k-1)!! = 2^{2k} [\prod_0^{k} d^{\times}(x!)] [\prod_{-1/2}^{k-1/2} d^{\times}(x!)] 
\end{aligned}
$$

Now how do we make that equal to $$(2k)!$$? Consider an example:

$$
\begin{aligned}
(6!!)(5!!) &= (6 \times 4 \times 2) \times (5 \times 3 \times 1) \\ 
&= 2^3 (3 \times 2 \times 1) \times 2^{5/2} (\frac{5}{2} \times \frac{3}{2} \times \frac{1}{2}) \\
&\? 2^{6} (\frac{6}{2} \times \frac{5}{2} \times \frac{4}{2} \times \frac{3}{2} \times \frac{2}{2} \times \frac{1}{2})
\end{aligned}
$$

But what are we supposed to do with that?

Well: it's a _half_ factorial! Just like there are double factorials $$n!! = (n-2)!!$$ and triple factorials $$n!!! = (n-3)!!!$$, why shouldn't there be half-factorials?

The relationship is:

$$\prod_{a/2}^{b/2} d^{\times}(x!^{1/2}) = (\frac{1}{2})^{b-a} \prod_a^b \d^{\times}(x!)$$

In this case:

$$
\begin{aligned}
\frac{6}{2} \times \frac{5}{2} \times \frac{4}{2} \times \frac{3}{2} \times \frac{2}{2} \times \frac{1}{2} &= \prod_{0/2}^{6/2} d^{\times}(x!^{1/2}) \\
&= 2^{-6} \prod_0^6 d^{\times}(x!) \\
&= 2^{-6} (6!)
\end{aligned}
$$

The interleaving can happen by translating everything into a half-factorial:

$$
\begin{aligned}
(6!!) \times (5!!) &= \prod_0^6 d^{\times}(x!!) \times \prod_{-1}^5 d^{\times}(x!!) \\
&= 2^3 \prod_0^3 d^{\times}(x!) \times 2^3 \prod_{-1/2}^{5/2} d^{\times}(x!) \\
&= 2^6 \prod_{0}^{6/2} d^{\times}(x!^{1/2}) \\
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

------

Okay that's all I have for now. I might come back and add notes to this if I have any more ideas/investigations about factorials, though.