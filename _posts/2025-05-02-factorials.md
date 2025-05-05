---
layout: blog
title: "Factorial Integrals and √π"
math: true
aside: true
footnotes: true
tag: math
---

This was formerly part of my [previous post]({% post_url 2025-04-29-n-spheres %}), but right after posting that I realized I had a lot more to say, so I started adding to it until it got too big and needed to be split up.

This article: investigations in trying to figure out what factorials, Gaussians, $$n$$-spheres, and fractional derivatives might have in common that makes them all turn series that involve factors of $$\sqrt{\pi}$$.

The one interesting thing in here is probably the idea of treating factorials as multiplciative integrals, like

$$\frac{n!}{m!} = \prod_m^n d^{\times} (n!)$$

Since this seems to remove some of the ambiguity in the various definitions/analytic continuations of factorials on non-integer numbers (as well as explaining why those definitions don't mess up the usual combinatoric sense of factorials).

<!--more-->

It may or may not be helpful to read the previous post also. They're both quite unwieldy and are largely dumps for notes and calculations that I've done. But maybe they'll be useful as a survey of various related ideas for somebody? I hope so.

---------

# 1. Investigations into factorials

For reasons that must somehow be very fundamental, spheres are closely tied to factorials. More on that later. But we'll need some Gamma function/factorial identities for integer and half-integer values to start unpacking things, and I don't like the ways that anyone else writes them so I need to write them out myself.

I am going to not use the symbol $$\Gamma$$, for starters: I'll be writing $$\Gamma(n)$$ as $$(n-1)!$$, even for non-integers. We should all be okay with analytically extending a function outside of the domain where it makes discrete sense (e.g. $$e^x$$). And I never liked that $$\Gamma$$ is defined to be off-by-one from factorials anyway. 

The first few half-integer terms of $$\Gamma$$/factorial are:

$$
\begin{aligned}
\Gamma(\frac{1}{2}) &= (-\frac{1}{2})! \\
&= \sqrt{\pi} \\ 
\Gamma(\frac{3}{2}) &= (\frac{1}{2})! \\
&= (\frac{1}{2}) \sqrt{\pi} \\
\Gamma(\frac{5}{2}) &= (\frac{3}{2})! \\
&= (\frac{3}{2}) (\frac{1}{2}) \sqrt{\pi}
\end{aligned}
$$

The general case for odd $$n$$: 

$$
\begin{aligned}
\Gamma(\frac{n}{2}) &= (\frac{n-2}{2})! \\
&= (\frac{n-2}{2}) (\frac{n-4}{2}) \ldots (\frac{3}{2}) (\frac{1}{2}) \sqrt{\pi} \\
&= \frac{(n-2)!!}{2^{(n-1)/2}} \sqrt{\pi} \\
(\frac{n}{2})! &= \frac{n!!}{2^{(n+1)/2}} \sqrt{\pi} \\
\end{aligned}\tag{$n$ odd}
$$

For even $$n$$:

$$
\begin{aligned}
\Gamma(\frac{n}{2}) &= (\frac{n-2}{2})! \\
&= (\frac{n-2}{2}) (\frac{n-4}{2}) \ldots (3)(2)(1) \\
&= \frac{(n-2)!!}{2^{(n-2)/2}} \\
(\frac{n}{2})! &= \frac{n!!}{2^{n/2}}
\end{aligned}\tag{$n$ even}
$$

Now dispensing with the $$\Gamma$$s, here is the value of the half-integer factorial for a single fixed _even_ $$n$$ and also the odd $$n-1$$ below it.

$$
\begin{aligned}
(\frac{n}{2})! &= \frac{n!!}{2^{n/2}} \\
(\frac{n-1}{2})! &= \frac{(n-1)!!}{2^{n/2}} \sqrt{\pi} \\
\end{aligned} \tag{$n$ even}
$$

And the other way around: odd $$n$$ and even $$n-1$$.

$$
\begin{aligned}
(\frac{n}{2})! &= \frac{n!!}{2^{(n+1)/2}} \sqrt{\pi} \\
(\frac{n-1}{2})! &= \frac{(n-1)!!}{2^{(n-1)/2}} \\
\end{aligned} \tag{$n$ odd}
$$

Finally, the same formulas in terms of $$k = n/2$$ when $$n$$ is even:

$$
\begin{aligned}
k! &= \frac{(2k)!!}{2^{k}} \\
(k-\frac{1}{2})! &= \frac{(2k-1)!!}{2^{k}} \sqrt{\pi} \\
\end{aligned}
$$

It's fun to note that their product combines to form one factorial again, times some factors[^gamma]

[^gamma]: More on that [here](https://en.wikipedia.org/wiki/Multiplication_theorem#Gamma_function%E2%80%93Legendre_formula). The Gamma function version is $$\Gamma(k) \Gamma(k + \frac{1}{2}) = \Gamma(2k) 2^{1-2k} \sqrt{\pi}$$. It's really more elegant with factorials.

$$k! (k-\frac{1}{2})! = \frac{(2k)!}{2^{2k}} \sqrt{\pi}$$

Okay, that should do it.

-------

Using the above factorial notations and identities, the general forms of the sphere surface area and volume are, for $$n$$ even:

$$
\begin{aligned}
S_{\text{even, }n-1} &= \frac{2 \pi^{n/2}}{\Gamma(\frac{n}{2})} r^{n-1} & V_{\text{even, }n} &=  \frac{\pi^{n/2}}{\Gamma(\frac{n}{2} + 1)} r^n \\
&= \frac{2 \pi^{n/2}}{(\frac{n}{2}-1)!} r^{n-1} & &=  \frac{\pi^{n/2}}{(\frac{n}{2})!} r^n  \\ 
&= \frac{2\pi^{n/2}}{\frac{n!!}{2^{n/2}} \frac{2}{n}} r^{n-1} & &=  \frac{\pi^{n/2}}{\frac{n!!}{2^{n/2}} } r^n  \\ 
&\boxed{= n \frac{(2\pi)^{n/2}}{n!!} r^{n-1}} & &\boxed{=  \frac{(2\pi)^{n/2}}{n!!} r^n}  \\ 
\end{aligned}
$$

and $$n$$ odd:

$$
\begin{aligned}
S_{\text{odd, }n-1} &= \frac{2 \pi^{n/2}}{\Gamma(\frac{n}{2})} r^{n-1} & V_{\text{odd, }n} 
&= \frac{\pi^{n/2}}{\Gamma(\frac{n}{2} + 1)} r^n \\
&= \frac{2 \pi^{n/2}}{(\frac{n}{2}-1)!} r^{n-1} & 
&= \frac{\pi^{n/2}}{(\frac{n}{2})!} r^n  \\ 
&= \frac{2 \pi^{n/2}}{\frac{n!!}{2^{(n+1)/2}} \sqrt{\pi}  \frac{2}{n}} r^{n-1} & 
&= \frac{\pi^{n/2}}{\frac{n!!}{2^{(n+1)/2}} \sqrt{\pi} } r^n  \\ 
& \boxed{= n \frac{(2) (2\pi)^{(n-1)/2}}{n!!} r^{n-1}} & 
& \boxed{= \frac{(2) (2\pi)^{(n-1)/2}}{n!!} r^n}  \\ 
\end{aligned}
$$

But these are _still_ awkward! At least now it's clear how to compute them. But it sucks that there's different values for $$n$$ even and $$n$$ odd.

Here are the four values for a single choice of integer $$k$$ with $$2k = n$$.

$$
\begin{aligned}
S_{\text{even, }2k-1} 
&=\boxed{(2k) \frac{(2\pi)^{k}}{(2k)!!} r^{2k-1}} & V_{\text{even, }2k}
&=\boxed{\frac{(2\pi)^{k}}{(2k)!!} r^{2k}}  \\ 
S_{\text{odd, }2k} 
&=\boxed{(2k+1)\frac{(2) (2\pi)^{k}}{(2k+1)!!} r^{2k}} & V_{\text{odd, }2k+1}
&=\boxed{\frac{(2) (2\pi)^{k}}{(2k+1)!!} r^{2k+1}} \\
\end{aligned}
$$

Note that the formulas for odd $$n$$ are off by a factor of:

$$
\begin{aligned}
S_{\text{even, }2k} &= \sqrt{\frac{\pi}{2}} S_{\text{odd, }2k} \\
V_{\text{even, }2k} &= \sqrt{\frac{\pi}{2}} S_{\text{odd, }2k} \\
\end{aligned}
$$

Isn't that just annoying?

Well, I thought about this for a long time and I think the "discrepancy" actually comes from how we've chosen to define the double factorial of an odd number. There's some discussion of this on Wikipedia for [double factorial](https://en.wikipedia.org/wiki/Double_factorial) (in the part about extending it to all complex numbers)... but I think they actually go the wrong direction with it. So here's my version. See what you think?

Going back to those half-integer factorial identities: 

$$
\begin{aligned}
k! &= \frac{(2k)!!}{2^{k}} \\
(k-\frac{1}{2})! &= \frac{(2k-1)!!}{2^{k}} \sqrt{\pi} \\
\end{aligned}
$$

And their product:

$$k! (k-\frac{1}{2})! = \frac{(2k)!}{2^{2k}} \sqrt{\pi}$$

Compare that to two double factorials offset by an integer, which is trivial:

$$(2k)!! (2k-1)!! = (2k)!$$

The half integer version is so similar. Consider $$k =3$$:

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

The two are very nearly the same, except that the second continues after $$(1)$$ to include $$(-1)$$ in the list, which becomes $$(-1/2)!$$ and is where $$\sqrt{\pi}$$ comes from.

It sure feels suspicious. Could the definition of $$!!$$ be modified to make these exactly equal (up to the $$2^{2k}$$ factor)? Or is the definition of $$(1/2)!$$ wrong, like it shouldn't go down to $$(-1/2)!!$$? What's going on here? And the ultimate question has to be: morally, why is it that $$(-1/2)! = \Gamma(1/2) = \sqrt{\pi}$$?

--------

There is some other reasons to suspect that something is up with how $$\sqrt{\pi}$$ shows up in relation to double factorials.

Inverting the equations above gives the double factorial in terms of the single factorial for even/odd:

$$
\begin{aligned}
n!! &\sim 2^{n/2} (\frac{n}{2})! & \text{$n$ even} \\
n!! &\sim \frac{2^{n/2} (\frac{n}{2})!}{\sqrt{\pi/2}} & \text{$n$ odd}
\end{aligned}
$$

They're off by that factor of $$\sqrt{\pi/2}$$ again.

Also, look closely at these two formulas.

$$
\begin{aligned}
k! &= \frac{(2k)!!}{2^{k}} \\
(k-\frac{1}{2})! &= \frac{(2k-1)!!}{2^{k}} \sqrt{\pi} \\
\end{aligned}
$$

The latter should really be written in terms of $$k-1/2$$ throughout, right?

$$
\begin{aligned}
k! &= \frac{(2k)!!}{2^{k}} \\
(k-\frac{1}{2})! &= \frac{(2k-1)!!}{2^{k-1/2}} \sqrt{\pi/2} \\
\end{aligned}
$$

What would that mean? Well, here's an idea: it could mean that the double-factorial of $$5 = 2(3-1/2)$$ should really only contain $$3-1/2$$ terms, not $$3$$ terms:

$$
\begin{aligned}
3! &= \frac{6 \times 4 \times 2}{2 \times 2 \times 2} \\
(3-\frac{1}{2})! &\? \frac{5 \times 3 \times \sqrt{1}}{2 \times 2 \times \sqrt{2}}
\end{aligned}
$$

...whatever that means! And then $$\frac{(-1/2)!}{\sqrt{2}} = \frac{\sqrt{\pi}}{\sqrt{2}}$$ is actually the missing additional term. Which implies something like:

$$(\frac{1}{2})! = \sqrt{\frac{1}{2}} \times 0! = \sqrt{\frac{1}{2}} \times \sqrt{\frac{1}{2}} \times (-\frac{1}{2})! = \frac{1}{2} \sqrt{\pi}$$

I don't know _why_ the "half-factorial" of $$1/2$$ gives a factor of $$1/\sqrt{2}$$, or what value it would take at other points. But, combining these observations, I believe the following is in some sense correct for making sense of the different definitions:

-----

# 2. Factorials as multiplicative integrals

I have a feeling that factorials should be thought of like integrals: they should have a start point _and_ an end point, so they are the product of numbers in a range, rather than just "down to zero". The classical factorial $$n!$$ is the one starts at $$0$$ and ends at $$n$$, which we can write as a [product integral](https://en.wikipedia.org/wiki/Product_integral):[^product]

[^product]: I am very much making this up as I go along. But it's not too weird, promise.

$$n! = \prod_0^n d^{\times}(x!) = \frac{n!}{0!} = n!$$

But other endpoints are possible, which accounts for the discrepancies in the definitions. E.g.

$$\prod_2^n d^{\times}(x!) = \frac{n!}{2!}$$

That sort of thing.

The meaning of $$d^{\times}f$$ is[^prod]

[^prod]: there are several ways to define product integrals. You can also have the _argument_ be multiplied, like $$d^{\times} f = (f(x \times (1+dx)) - f(x))/(1 +dx)$$, or both, or other things, and there is a coherent calculus for each of them. But the rest are not useful here.

$$d^{\times} f = \frac{f(x+dx)}{f(x)}$$

For instance

$$d^{\times}(x!)\big|_{n-1}^n = \frac{n!}{(n-1)!} = n$$

And product integrals obey multiplicative versions of the additive properties of ordinary integrals:

$$[\prod_{0}^a d^{\times}f] [\prod_{a}^b d^{\times}f] = \prod_{0}^b d^{\times}f$$

It seems as though the value $$\sqrt{\pi}$$ is for some reason equivalent to integration from $$-\infty$$ to $$-1/2$$:

$$\sqrt{\pi} = \prod_{-\infty}^{-1/2} d^{\times}(x!)$$

(Best not to interpret that too literally, though. It must be more like how we can assign values to divergent series.)

Hence there are three things you could mean by $$(k-\frac{1}{2})!$$, depending on what bounds you're using, which could be any of $$(-\infty, k-\frac{1}{2})$$, $$(-\frac{1}{2}, k - \frac{1}{2})$$, or $$(0, k-\frac{1}{2})$$ (which is the one that actually "has" $$(k-\frac{1}{2})$$ terms in it). The integrals are:

$$
\begin{aligned}
\prod_{-\infty}^{-1/2} d^{\times}(x!) &= \sqrt{\pi} \\
\prod_{-1/2}^0 d^{\times}(x!) &= \frac{1}{\sqrt{2}}\\ 
\prod_{0}^{k-1/2} d^{\times}(x)! &= \frac{k!!}{2^{k-1/2}} \\ 
\end{aligned}
$$

The "classical" value is the product of all three:

$$
\begin{aligned}
(k-\frac{1}{2})! &= \prod_{-\infty}^{k-1/2} d^{\times}(x!) \\
&= \prod_{-\infty}^{-1/2} d^{\times}(x!) \prod_{-1/2}^0 d^{\times}(x!) \prod_{0}^{k-1/2} d^{\times}(x!) \\
&= \sqrt{\pi} \frac{1}{\sqrt{2}}\frac{k!!}{2^{k-1/2}} \\
&= \frac{k!!}{2^k} \sqrt{\pi} \\
\end{aligned}
$$

We can repeat the same thing for the double-factorial. We assume, following the observations from above, that there's a way of interpreting a double factorial $$(2k)!!$$ as a single factorial times $$2^k$$$, as in $$(\frac{5}{2})! = 5!!/ 2^{5/2}$$. This wasn't quite right due to the $$(-1/2)!$$ term, but now we have another way of dealing with that, by changing the product integral bounds. So, we postulate that a good rule is

$$\prod_{2a}^{2b} d^{\times}(x!!) = 2^{b-a}\prod_{a}^{b} d^{\times}(x!)$$

Which given our assumptions about double factorials can be justified by the following calculus:

$$
\begin{aligned}
d^{\times}[x!!] &= d^{\times} [2^{x/2} (\frac{x}{2})!] \\
&= \frac{2^{(x + dx)/2} (\frac{x+dx}{2})!}{2^{x/2} (\frac{x}{2})!} \\
&= d^{\times}[2^{x/2}] d^{\times}[(\frac{x}{2})!]
\end{aligned}
$$

Multiplying two terms with $$d^{\times}$$ is equivalent to just adding two separate expressions under an integral, as in $$\int [g(x) dx + f(x) dx] = \int [g(x) dx] + \int [f(x) dx]$$, meaning that we can just separate the integrals:

$$
\begin{aligned}
\prod_a^b d^{\times}[x!!] &= \prod_a^b d^{\times}[2^{x/2}] d[(\frac{x}{2})!] \\
&= \prod_a^b d^{\times}[2^{x/2}] \prod_a^b d[(\frac{x}{2})!] \\
&= 2^{(b-a)/2} \prod_{a/2}^{b/2} d^{\times}[x!]
\end{aligned}
$$

Anyway, this means that we can associate each term in $$(2k-1)!!$$ with a corresponding term in $$(k-1/2)!$$:

$$
\begin{aligned}
(2k-1)!! &= \prod_{-\infty}^{2k-1} d^{\times}(x!!) \\
&= \prod_{-\infty}^{-1} d^{\times}(x!!) \prod_{-1}^0 d^{\times}(x!!) \prod_{0}^{2k-1} d^{\times}(x!!) \\
&= \big[2^{(\infty-1)/2??} \prod_{-\infty/2}^{-1/2} d^{\times}(x!)\big] \big[\sqrt{2} \prod_{-1/2}^{0} d^{\times}(x!)\big] \big[\frac{1}{2^{k-1/2}} \prod_{0}^{k-1/2} d^{\times}(x!)\big] \\
&= \big[2^{(\infty-1)/2??} \sqrt{\pi} \big] \big[\sqrt{2} \frac{1}{\sqrt{2}} \big] \big[2^{k-1/2} \frac{(2k-1)!!}{2^{k-1/2}}\big] \\
\end{aligned}
$$

Evidently:

$$
\begin{aligned}
\frac{(2k-1)!!}{0!!} &= \frac{(k-1/2)!}{0!} \\ 
\frac{0!!}{(-1)!!} &= 1 \\
\frac{(-1)!!}{(-\infty)!!} &= 2^{(\infty-1)/2} \sqrt{\pi}
\end{aligned}
$$

Well, that infinity is pretty annoying. But I suppose we can separate it out and leave the finite part?

$$\frac{(-1)!!}{(-\infty)!!} \? 2^{\infty/2} \sqrt{\frac{\pi}{2}}$$

Which is, I guess, _an_ argument for $$(2k-1)!!$$ having a factor of $$\sqrt{\pi/2}$$. Although yeah, pretty sus.[^sus]

[^sus]: $$2^{\infty/2}$$ is really $$\sqrt{2^{\infty}}$$, where half as many copies of $$2$$ were included compared to $$(-1)!$$ because the double factorial skips every other value. Inasmuch as $$(-1/2)! = (-1/2)(-3/2)(-5/2)\ldots = \sqrt{\pi}$$, $$(-1)!! = (-1)(-3)(-5)\ldots = 2^{\infty/2}\sqrt{\pi/2} $$, I guess?

The larger point is: there are competing definitions of factorials and double-factorials here, and the difference is that we had been neglecting what the endpoints of their "integrals" are. When we include those then some of the ambiguity goes away: the combinatoric double factorials stop at $$n=0$$ or $$n=1$$, as makes sense in combinatoric problems, while---for whatever reason!---the $$n$$-sphere ones stop at $$n=-\infty$$ (whilst dropping the mysterious infinite factor that comes along with that).

In particular this cleans up some of the confusion Wikipedia describes about alternate extensions of the double-factorial to the rest of the reals. The different definitions they use amount to different choices of where to stop the "integral". Their inverted recurrence $$n!! = (n+2)!!/(n+2)$$ is also correct: it's the ratio of two factorials with the infinite part removed.

By the way: this scheme does not interfere at all with the usual combinatoric uses of double factorials. If you want to interpret $$5!! = 5 \times 3 \times 1$$ as counting the ways of selecting pairs of adjacent elements out of $$5$$, that's fine: you're using the value $$\prod_1^5 d^{\times}(n!!)$$, _not_ $$\prod_{-\infty}^{5} d^{\times}(n!!)$$... since you're stopping when there's one element left. The mysterious square roots of two and $$\pi$$ only get involved (and demand interpretation, not that we have any) when you are doing something that allows you to somehow keep selecting below $$n=1$$. I doubt that there is a combinatoric explanation of them, but I'd love to hear of one.

-----

A few addenda about this.

One: if the multiplicative integrals bother you, you can always convert them into additive integrals with logarithms:

$$\log \prod_a^b d^{\times}[x!] = \int_a^b d \log(x!) = \log(b!) - \log(a!)$$

One nice thing about this is that it means the problematic infinity term in $$n!!$$ gets split out into its own constant term (which is just a notational difference, but maybe less upsetting to look at?).[^entropy] Using $$d^{\times}(x!!) = d^{\times} (2^{x/2}) d^{\times} (\frac{x}{2}!)$$:

$$
\begin{aligned}
\log \prod_{-\infty}^{2k-1} d^{\times}(x!!) &= \prod_{-\infty}^{2k-1} \log  d^{\times} (2^{x/2})  + \log d^{\times} (\frac{x}{2}!) \\
&= \int_{-\infty}^0 d \log(2^{x/2}) + \int_{-\infty}^{2k-1} d \log (\frac{x}{2}!) \\ 
&= [\log 2^{0/2}-\log 2^{-\infty/2}] + \log (k - \frac{1}{2})! \\
&= [0 - (-\infty)] \ln (\sqrt{2}) + \log (k - \frac{1}{2})! 
\end{aligned}
$$

I dunno. Maybe interesting.

[^entropy]: I am reminded of the sense in which [entropy]({% post_url 2018-02-23-entropy-1 %}) of continuous distributions should be thought of being relative to an "entropy of continuum": $$S[\mathcal{U(0,2)}] = 1 + S[\mathcal{U}(0,1)] = 1 + \log 2^X = 1 + X$$, where $$X$$ is the number of bits to specify a point in a uniform distribution: theoretically infinite, in practice just very large and unspecified. (I'm also reminded of general renormalization trickery.)

Two, it's clearly possible to generalize all of this to higher-dimensional multifactorials, like $$n!!! = n \times (n-3) \times \ldots$$. Suppose we define $$F_1(n) = n!$$ and $$F_2(n) = n!!$$, etc. The values are always considered to be relative:

$$\prod_a^b d^{\times} F_k(n) = F_k(b)/F_k(a)$$

But we may safely think of them all as being relative to $$0$$: $$F_k(n) = F_k(n)/F_k(0)$$, such that $$F_1(5) = 5!/0! = 5!$$ and $$F_1(-1/2) = (-1/2)!/0! = \sqrt{\pi}$$.

Since $$n\underbrace{!!!!!}_{k} = n \times (n-k)\underbrace{!!!!!}_{k}$$, they must have

$$F_k(n) = n F_k(n-k)$$

And the identity we found above relates $$F_k$$ and $$F_1$$ like this:

$$F_1(\frac{n}{k}) = \frac{F_k(n)}{k^{n/k}}$$

e.g.

$$(\frac{5}{2})! = F_1(\frac{5}{2}) = \frac{F_2(5)}{2^{5/2}} = \frac{5!!}{2^{5/2}}$$

But keep in mind that this is not the classical value of $$(5/2)!!$$, since that would be given by $$F_1(5/2) / F_1(-\infty) = \frac{5!! \sqrt{\pi}}{2^{3}}$$. Really these have no way at all of telling you any absolute value compared to $$-\infty$$, unfortunately.

(This generalization is on Wikipedia [also](https://en.wikipedia.org/wiki/Double_factorial#Alternative_extension_of_the_multifactorial), but in a different notation. I prefer my way of thinking about it with integrals, though.) 

-------

Well. That was fun to think about, but not clearly useful for anything at all. It did put to rest, for me at least, the confusion about the various ways of generalizing $$n!!$$ to non-integers: I think it's basically not possible to express it neatly if you're not using the product-integral sense of a factorial. But somehow I do not feel like I have learned anything new about spheres.

Actually no. There was one useful thing. _If_ we adjust the definition of the double-factorial on odd numbers like this:

$$(2k-1)!!_{\text{new}} = \sqrt{\frac{\pi}{2}} (2k-1)!!_{\text{old}}$$

Which is to say to define 

$$1!! = 1 \times (-1)!! = \sqrt{\frac{\pi}{2}}$$

instead of $$1$$, then it always the case that

$$(\frac{n}{2})! = \frac{(n)!!_{\text{new}}}{2^{n/2}}$$

Which means that we can write the spherical area and volume formulas like so, for all $$n$$:

$$
\begin{aligned}
S_{n-1}(r) &= \frac{2 \pi^{n/2}}{(\frac{n}{2}-1)!} r^{n-1} & V_n (r) &= \frac{\pi^{n/2}}{(\frac{n}{2})!} r^n \\
&= \frac{2 \pi^{n/2}}{(n-2)!!_{\text{new}}/2^{(n-2)/2}} r^{n-1} & & = \frac{\pi^{n/2}}{n!!_{\text{new}}/2^{n/2}} r^n \\
&= \frac{(2\pi)^{n/2}}{(n-2)!!_{\text{new}}} r^{n-1} & & = \frac{(2\pi)^{n/2}}{n!!_{\text{new}}} r^n \\
\end{aligned}
$$

Which... is a smidge more symmetric than the old version, I guess? But otherwise not very useful.



------

# 3. Other factors of $$\sqrt{\pi}$$

A few miscellaneous observations I will make in a desperate attempt to connect factorials and spheres more directly.

First, one of the ways to compute the volume of a sphere is to consider Gaussian integral over all the same variables

$$I = \int_{-\infty}^{\infty} e^{-x^2} \d x$$

The normal trick for evaluating $$I$$ is to square it and then change variables to $$(r, \theta)$$:

$$
\begin{aligned}
I^2 &= [\int_{-\infty}^{\infty} e^{-x^2} \d x] [\int_{-\infty}^{\infty} e^{-y^2} \d y] \\
&= \int_{\bb{R}^2} e^{-(x^2 + y^2)} \d x \d y \\
&= \int_0^\infty \int_0^{2 \pi} e^{-r^2} r \d r \d \theta \\
&= 2 \pi (-\frac{1}{2} e^{-r^2} \big|_0^{\infty}) \\
I^2 &= \pi \\
I &= \sqrt{\pi}
\end{aligned}
$$

But in fact you can do this for as many variables as you want, using the substitution $$z = r^2$$, and it produces the volume of $$n$$-sphere instead.

$$
\begin{aligned}
I^n &= \int_{\bb{R}^n} e^{-(x_1^2 + x_2^2 + \ldots x_n^2)} \d^n x \\
&= \int_0^{\infty} \int_{S^{n-1}(r)} e^{-r^2} \d r \d S^{n-1} \\
&= S_{n-1}  \int_0^{\infty} e^{-r^2} r^{n-1} \d r \\
&=  S_{n-1} \frac{1}{2} \int_0^{\infty} e^{-z} z^{n/2 - 1}  \d z \\
(\sqrt{\pi})^n &= S_{n-1} \frac{1}{2} \Gamma(\frac{n}{2}) \\
S_{n-1} &= \frac{2 \pi^{n/2}}{(\frac{n}{2} - 1)!}\\
\end{aligned}
$$

Which is cute!

Also amusing is that we can interpret $$I = \int_{-\infty}^{\infty} e^{-x^2} \d x = 2 \int_0^\infty e^{-x^2} \d x$$ as the $$n=1$$ case of this: the factor of $$2$$ is the value of $$S_0$$, and the value $$\int_0^{\infty} e^{-x^2} \d x = \frac{1}{2} \int_0^\infty e^{-z} z^{-1/2} \d z = \sqrt{\pi}$$ is the value of $$\frac{1}{2} \Gamma(\frac{1}{2})$$. But weird also, right? What's going on? I dunno.[^lemniscate]

[^lemniscate]: Other values of $$\Gamma$$ at non-integers might generally do the same thing but with "shapes" than circles. The example I'm aware of is $$\Gamma(\frac{1}{4}) = (-\frac{3}{4})! = \sqrt{2 \varpi \sqrt{2 \pi}}$$, where $$\varpi$$ is the [lemniscate constant](https://en.wikipedia.org/wiki/Lemniscate_constant), a number that serves a similar role to $$\pi$$ for circles but for a lemniscate which is connected to $$x^4$$ rather than $$x^2$$ ($$\varpi = 2 \int_0^1 \frac{1}{\sqrt{1-x^4}} \d x $$). I don't know anything about that; I just think it's cool. Anyway other values of $$\Gamma$$ are related to the values of elliptic integrals, so maybe there's some general logic to the whole thing for which $$n=1/2$$ is the special and best-behaved case? Dunno.

It's clear why Gaussian integrals involve the factors of $$S_n$$: the product $$I^n$$ has $$n$$-spherical symmetry, hence that term shows up in in the integral, and since each product of another $$I$$ increases the dimension of the sphere, they must obey the same recurrence relations.

What is not at all clear is why $$(-\frac{1}{2})! = \sqrt{\pi} = \int e^{-x^2} \d x$$. What in the world is going on? What possible geometric explanation of negative-half-integer factorials could explain that?

One argument is that it actually goes the other way: the half-integer factorials are so defined _because_ of the $$n$$-spheres.[^math] That is: to make

$$S_{n-1} = \frac{2\pi^{n/2}}{\Gamma(n/2)} r^{n-1} = \frac{2\pi^{n/2}}{(\frac{n}{2}-1)!} r^{n-1}$$

Work for $$n=1$$, it _must_ be the case that 

$$S_0 = \frac{2 \pi^{1/2}}{(-\frac{1}{2})!} = 2$$

[^math]: Well, arguably everything in math that is equivalent is equivalent _both_ ways, like they are saying the same thing, not "causing" each other. But nevermind that.

But that doesn't quite work for me. I need there to be some connection to the combinatoric interpretation of factorials: when computing $$S_{2k-1} = 2 \pi^k/(k-1)!$$, why does the denominator involve $$(k-1)!$$? Which permutations are being canceled out there?

---------

Another place to look for logic in fractional factorials and square roots of $$\pi$$ is in [fractional calculus](https://en.wikipedia.org/wiki/Fractional_calculus). A natural way[^frac] to define a "square root of a derivative" operator $$D^{1/2}$$ (the "semiderivative") is to generalize from

[^frac]: What I've written here about fractional derivatives is probably not actually correct. Various comments online point out that fractional derivatives are generally non-local extensions, since (e.g.) you can define them with the Fourier transform $$\F[\p^a f(x)] = (ik)^a \hat{f(k)}$$ but then inverse-transforming that is probably non-local. But it's such an aside that I'm not going to bother researching it further.

$$D^{k} \frac{x^{n}}{n!} = \frac{x^{n-k}}{(n-k)!}$$

This basically creates an operator that has $$D^{1/2} \circ D^{1/2} = D$$ (it also basically works as an integral with negative powers also, but there's a lot of ambiguity in the definition).

The half-derivative of a polynomial then produces another polynomial with a factor of $$\sqrt{\pi}$$, e.g.

$$D^{1/2} x^n = \frac{n!}{(n-1/2)!} x^{n-1/2}$$

and in particular, proceeding naively, you would get a series like this:

$$
\begin{aligned}
D^{1/2} x^{1/2} &= \frac{(\frac{1}{2})!}{0!} x^0 &=& \; \frac{\sqrt{\pi}}{2} \\
D^{1/2} x &= \frac{1}{(\frac{1}{2})!} x &=& \; \frac{1}{\sqrt{\pi}/2} x^{1/2} \\ 
D^{1/2} x^{3/2} &= \frac{(\frac{3}{2})!}{1!} x &=&  \; \frac{3\sqrt{\pi}}{4} x \\
D^{1/2} x^{2} &=\frac{2!}{(\frac{3}{2})!}x^{3/2} &=& \; \frac{8}{3 \sqrt{\pi}} x^{3/2} \\
\end{aligned}
$$

Oddly, though, you also get that the half-derivative of a constant is not constant:

$$D^{1/2} 1 = \frac{0!}{(-\frac{1}{2})!} x^{-1/2} = \frac{1}{\sqrt{\pi}} x^{-1/2}$$

And, squared, it just becomes problematic (since $$0! = 1$$ it seems like $$(-1)! = 0!/0 \? \infty$$...):

$$D^{1/2} x^{-1/2} = \frac{(-\frac{1}{2})!}{(-1)!} x^{-1} \? \frac{\sqrt{\pi}}{\infty} x^{-1} \? 0$$

Anyway here are the half-integer derivatives of a single polynomial like $$x^3$$:

$$
\begin{aligned}
D^{1/2} x^3 &= \frac{3!}{(\frac{5}{2}!)} x^{5/2} &=& \; \frac{6}{5!!/2^{5/2}\sqrt{\pi/2}} x^{5/2}\\
D^{1} x^3 &= \frac{3!}{2!} x^{2} &=& \; 3x^2\\
D^{3/2} x^3 &= \frac{3!}{(\frac{3}{2}!)} x^{5/2} &=& \; \frac{6}{3!!/2^{3/2} \sqrt{\pi/2}} x^{3/2}\\
D^{2} x^3 &= \frac{3!}{1!} x^{1} &=& \; 6 x\\
D^{3/2} x^3 &= \frac{3!}{(\frac{1}{2}!)} x^{5/2} &=& \; \frac{6}{1!!/\sqrt{2} \sqrt{\pi/2}} x^{1/2} \\
D^{3} x^3 &= \frac{3!}{0!} x^{0} &=& \; 3! (1)\\
\end{aligned}
$$

I'm not sure there's anything deep about this, though, because the factorials in derivatives arise from the normal combinatoric case of counting permutations. The reason is basically $$D x^n = n x^{n-1}$$ may be interpret as a sum over every way of choosing to differentiate one of the $$x$$s according to the product rule:

$$
\begin{aligned}
D (x \times x \times \ldots x) &= (Dx) \times (x \times \ldots x) + x \times (Dx) \times (x \times \ldots) + \ldots + x \times x + \ldots (Dx) \\
&= \text{Sym} [D (x \times x \times \ldots x)] = n (Dx) \times x^{(n-1)}
\end{aligned}
$$

So in order for $$D^{1/2} x^n \propto \frac{1}{\sqrt{\pi}} x^{n-1/2}$$ we once again need some connection between the combinatorics and the fractional factorials: selecting "half" an element out of an integer number produces a factor of $$1/\sqrt{\pi}$$, for some reason (at least in this interpretation of fractional derivatives).

Here's another way to connect derivatives with factorials. You can differentiate

$$\int_0^\infty e^{-ax} dx = \frac{1}{a}$$

under the integral sign with respect to $$-a$$, then set $$a=1$$ at the end, to get

$$
\begin{aligned}
(-\p_a)^n \int_0^\infty e^{-ax} dx &= (-\p_a)^n (\frac{1}{a}) \\ 
\int_0^{\infty} x^n e^{-ax} dx &= \frac{n!}{a^{n+1}} \\
\int_0^{\infty} x^n e^{-x} dx &= n! \\
\Gamma(n+1) &= n!
\end{aligned}
$$

And apparently this then also holds for non-integer $$n$$ as well, where you'll have to again use fractional differentiation on each side, whatever that's supposed to mean. Well: evidently $$\p_a^n e^{ax} = a^n e^{ax}$$ for non-integer $$a$$? But now you have to justify how the non-integer exponents are going to produce imaginary numbers as well: $$\p_a^{n} e^{-ax} = (-1)^{1/n} a^n e^{-ax}$$. Not sure what to do with that. I'm also not sure if the fractional half derivatives as defined on polynomials even work on $$e^x$$... But anyway, this is not an article about fractional calculus; I just wanted to mention it for comparison to give myself/you more to think about.


------

In any case: I assume there is some close geometric connection between each of these ways (spheres, Gaussians, fractional derivatives) of producing factors of $$\sqrt{\pi}$$, and although I basically understand it algebraically, I'd really like for it to make more intuitive sense. In each case you get something like

$$\sqrt{\pi} \times \frac{a}{b \sqrt{\pi}} \times \frac{b \sqrt{\pi}}{c}  \times \frac{c}{d \sqrt{\pi}} \ldots$$

Where, at least for $$n$$-spheres, an additional factor of $$\pi^{n/2}$$ serves to ensure each term is either poportional to $$\pi$$ or not. And it is clear that in every place where you might want to interpolate $$n!$$ between integers, the half-integer terms produce something of this form.

Generally it just seems like $$\sqrt{\pi}$$ is nature's answer to the half-integer terms in multiplicative series. Here's one more argument for the same, which I found [here](https://math.stackexchange.com/a/4998228/324102):

Factorials generally form a multiplicative series in which $$\frac{(n+k)!}{n!}$$ is proportional to $$n^k$$, especially as $$n$$ gets large. For instance $$(n+2)! = (n+2)(n+1) n! \approx (n^2) n!$$. For this to hold for half-integers as well you will want

$$\frac{(n + \frac{1}{2})!}{n!} \approx \sqrt{n}$$

But since 

$$
\begin{aligned}
\frac{(n + \frac{1}{2})!}{n!} &= \frac{(n+\frac{1}{2}) \times (n-\frac{1}{2}) \times \ldots (\frac{5}{2}) \times (\frac{3}{2}) \times (\frac{1}{2})!}{n \times (n-1) \times \ldots \times 2 \times 1} = \frac{(2n+1)!!}{(2n)!!} (\frac{1}{2})!  \\
\end{aligned}
$$

You might want to define (or infer, I guess)

$$
\begin{aligned}
(\frac{1}{2})! &= \lim_{n \ra \infty} \frac{(2n)!!}{(2n+1)!!} \sqrt{n} = \sqrt{\frac{\pi}{2}}
\end{aligned}
$$

Just another way of reaching the same conclusion, I suppose.

Another closely related thing to consider is the ratio $$S_n/V_n$$:

$$
\begin{aligned}
\frac{S_n}{V_n} &= \frac{2 \pi^{(n+1)/2} r^{n}}{(\frac{n+1}{2}-1)!}  \times \frac{ (\frac{n}{2})! }{ \pi^{n/2} r^n} \\
&= 2 \pi^{1/2} \frac{ (\frac{n}{2})!} {(\frac{n}{2} - \frac{1}{2})!}
\end{aligned}
$$

These give, for instance, the ratio of a sphere's surface area to a circle's area: 

$$\frac{S_2}{V_2} = 2 \sqrt{\pi} \frac{1!}{(\frac{1}{2}!)} = 4$$

All of this interesting $$\sqrt{\pi}$$ structures comes from the $$\frac{ (\frac{n}{2})!} {(\frac{n}{2} - \frac{1}{2})!}$$ term, which, recall is equivalent using our "new" double factorial to 

$$\frac{ (\frac{n}{2})!} {(\frac{n}{2} - \frac{1}{2})!} = \frac{(n)!!_{\text{new}} / 2^n}{(n-1)!!_{\text{new}} / 2^{n-1/2} } = \frac{(n)!!_{\text{new}}}{(n-1)!!_{\text{new}} \sqrt{2} }$$


And, with $$n!!_{\text{new}} = \sqrt{\frac{\pi}{2}} n!!$$ for odd $$n$$:

$$
\begin{aligned}
I(n) = \frac{ (\frac{n}{2})!} {(n - \frac{1}{2})!}  = \begin{cases}
\frac{1}{\sqrt{\pi}} \frac{(n)!!}{ (n-1)!!} & \text{$n$ even}\\
\frac{\sqrt{\pi}}{2} \frac{(n)!!}{(n-1)!!} & \text{$n$ odd} \\
\end{cases}
\end{aligned}
$$

(Incidentally: $$I(2k)/I(2k+1) = \frac{\pi}{2} \frac{(2k+1)!!(2k-1)!!}{(2k)!!(2k)!!}$$ but in the limit is equal to $$1$$, so $$\lim_{k \ra \infty} I(2k+1)/I(2k) = \frac{\pi}{2}$$, which is the [Wallis Product](https://en.wikipedia.org/wiki/Wallis_product) formula for $$\pi$$.)

----------

Okay that's all I have for now. I might come back and add notes to this if I have any more ideas/investigations about factorials, though.