---
layout: blog
title: "Exact Divergent Series"
math: true
aside: true
footnotes: true
---

One of my more strongly held mathematical opinions is that results which appear to be surprising or paradoxical (or just overly complex) are in fact bad results, and are often indicators of places that our foundations have gone wrong. For example, to me Banach-Tarski is an indictment of measure theory, not a surprising fact about the universe. The long list of pathological counterexamples in topology is if anything an argument for a version of finitism that excludes them. Surprising implications of the axiom of choice are reasons to discard set theory as a foundation. That sort of thing. I can't really argue convincingly for these claims (yet) but I believe them.

In particular I have long had a vendetta against all the math explainers who give too much credence to nonsensical divergent summation results like $$1 + 2 +3 + 4 + \ldots \? -\frac{1}{12}$$. I wrote about that sum in one of my [first]({% post_url 2018-11-01-summations %}) articles, which was inspired by a [Numberphile video](https://www.youtube.com/watch?v=w-I6XTVZXww) that had a very disappointing discourse around it at the time. People were far too willing to say that the sum equalling $$-1/12$$ was "in some sense" true, or even literally true, basically because they were unable to bring themselves to say that their mathematical understanding had a hole in it---even though any layperson could clearly see that it did. If there is one thing that academics should not do it is gaslight the public. Truth is determined by reality, not by fancy techniques inside some formalism.

Well, I have since found a much more simple and pleasing exposition on these sorts of sums than I had before, which I think dispels all possible objections. I thought I would write it out as a standalone article in case anyone else wants to see this laid to rest (or, I guess, thinks there's something I'm still missing). Nothing in here is particularly deep, and that's kind of the point. It is just a simple explanation for a simple thing.

<!--more-->

(The first parts of this article were previously part of an [earlier piece]({% post_url 2026-02-05-series %}) about Taylor series. I decided to expand them into a standalone post, because thithey are quite concrete and more likely to be interesting to someone else, whereas the rest of that post is baiscally a pile of unhinged musings. I also wanted to add some more sections that just didn't belong there. So now it's its own thing.)


----

# 1.

I like to say that

$$f(x) = \frac{1}{1-x}$$

is my favorite function because it has the best Taylor series. Around $$x=0$$ it is

$$S(x) = 1 + x + x^2 + x^3 + \ldots $$

This converges for $$\| x \| < 1$$. For example,[^limit]

[^limit]: This equality holds if the $$1+1/2+1/4+\ldots$$ is regarded as a limit, which is standard. It's equivalent to how $$1.99\overline{9} = 2$$, and in fact it's the same phenomenon exactly, since the statement $$1+\frac{1}{2}+\frac{1}{4} + \ldots = 2$$ becomes $$1.11\overline{1} = 10$$ when written in binary.

$$\frac{1}{1-\frac{1}{2}} = 1 + \frac{1}{2} + \frac{1}{4} \ldots = 2$$

We can also write down the Taylor series for $$f(x)$$ around $$x=\infty$$ by expanding around $$1/x = 0$$ instead. It is:

$$
\begin{aligned}
\frac{1}{1-x} &= (-\frac{1}{x}) \frac{1}{1 - \frac{1}{x}} \\
&= -\frac{1}{x} [1 + \frac{1}{x} + \frac{1}{x^2} + \ldots] \\
S_{\infty}(x)&= -\frac{1}{x} - \frac{1}{x^2} - \frac{1}{x^3} - \ldots
\end{aligned}
$$

This works for $$\| x \| > 1$$. For example,

$$\frac{1}{1-2} = -\frac{1}{2} \frac{1}{1 - \frac{1}{2}} = -\frac{1}{2}[1 + \frac{1}{2} + \frac{1}{4} + \ldots] = -1$$

It is interesting to contemplate the fact that plugging $$2$$ into the first series _sorta_ works.

$$S(2) = 1 + 2 + 4 + 8 + \ldots$$

gives a series whose "sum", by any of the various [divergent series summation techniques](https://en.wikipedia.org/wiki/Divergent_series#Abel_summation), equals $$-1$$. The standard "proof" of this fact is


$$
\begin{aligned}
S(2) &= 1 + 2 + 4 + 8 + \ldots \\
S(2) - 2 S(2) &= [1 + 2 + 4 + \ldots] - (2 + 4 + 8 + \ldots) \\
(1-2)S(2) &= 1 \\
S(2) &= -1
\end{aligned}
$$

One might interpret this to mean that, although the result of $$S(2)$$ is not a number, it still 'contains' the data $$-1$$ somehow---maybe in a form like $$-1 + O(\infty)$$? This is an explanation I have seen online a few times. People will often link [Tao's article](https://terrytao.wordpress.com/2010/04/10/the-euler-maclaurin-formula-bernoulli-numbers-the-zeta-function-and-real-variable-analytic-continuation/) on the subject, which shows how you can "smooth out" these sums to remove the jumps at each discrete integer. Doing this typically reveals a constant term which has the finite value that the summation techniques get.

However, I've since come to think that all of that is making things too complicated. There is a very simple way of thinking about this that is completely satisfactory for intuition, which is as follows. Depending on your background it might seem a bit elementary, so I feel almost weird making a big deal about it, but I think it's important for staying sane.

--------

# 2

In general it is not the case that $$S(x) = 1 + x + x^2 + \ldots$$ is equal to $$f(x) = \frac{1}{1-x}$$, the multiplicative inverse of $$(1-x)$$.

This is most clear if you write it as an arbitrary partial sum, $$S(x) = 1 + x + x^2 + \ldots + x^N$$. Then

$$(1-x) S(x) = (1-x)(1 + x + x^2 + \ldots + x^N) = 1 - x^{N+1}$$

So the 'real' value is of $$S(x)$$

$$S(x) = \frac{1-x^{N+1}}{1-x} = \frac{1}{1-x} - \frac{x^{N+1}}{1-x} $$

Likewise for the expansion around $$x=\infty$$ we have $$(1-x) S_{\infty}(x) = 1 - x^{-N}$$, therefore

$$S_{\infty}(x) = \frac{1}{1-x} - \frac{x^{-N}}{1-x}  = \frac{1-x^{-N}}{1-x}$$

Normally we think of the value of $$N$$ as implicitly going to infinity. It is clear why this leads to each approximation having its radii of convergence: $$S(x) = \frac{1}{1-x}$$ is true only if $$\lim_{N \ra \infty} x^{N} = 0$$, and $$S_{\infty}(x) = \frac{1}{1-x}$$ only if $$\lim_{N \ra \infty} x^{-N} = 0$$. This is why $$S(1/2) = 2$$ is correct, because $$(1/2)^N$$ becomes indistinguishable from $$0$$ for large enough $$N$$. Meanwhile $$S(2) = -1$$ diverges because

$$S(2) = \frac{1}{1-2} - \frac{2^{N+1}}{1-2} = - 1 + 2^{N+1}$$

is _not_ the value of $$\frac{1}{1-2}$$, even though it is indeed the value of $$(1+2+4+\ldots)$$.

The reason that $$S(2) \? -1$$ under divergent summation techniques is because the algebraic manipulations are conveniently erasing the $$x^{N+1}$$ term even though it should contribute to the result. At the step 

$$
\begin{aligned}
(1-x)S(x) &= (1 + x + \ldots + x^N) \\
&- (x + x^2 + \ldots + x^{N+1}) \\
&= 1 - x^{N+1} \\
&\stackrel{??}{=} 1
\end{aligned}
$$

we're just dropping the $$O(x^N)$$ term even though it is not necessarily small. It is easy to ignore because it is hiding behind the ellipses! In fact the computation which gave $$S(2)=-1$$ should have read 

$$
\begin{aligned}
(1-2) S(2) &= S (2) - 2S(2)  \\
-S(2) &= -1 + 2^{N+1} - 2(-1 + 2^{N+1}) \\
&= 1 - 2^{N+1} \\ 
S(2) &= 2^{N+1} - 1
\end{aligned}
$$

which is correct for all $$N$$. When you write $$S(2) = -1$$, it's not that the $$2^{N+1}$$ term cancelled --- you just accidentally dropped it (because your $$1+x+x^2+x^3+\ldots$$ notation made it easy to do so). The mistake results from being too used to thinking of the $$S(x) = 1/(1-x)$$ approximation as being exact. It is simply not. There is always an 'ambient' $$N$$ variable which parameterizes how inexact it is.

The same argument gives $$1 - 2 + 4 - 8 + \ldots$$ as

$$S(-2) = 1 - 2 + 4 - 8 + \ldots = \frac{1}{1-(-2)} + \frac{(-2)^{N+1}}{1-(-2)} = \frac{1}{3} + \frac{1}{3} (-2)^{N+1}$$

which is why divergent sum techniques that drop the $$N$$ dependency give it the value $$\frac{1}{3}$$.

--------

Here is a more complicated example which is resolved by including the $$x^{N+1}$$ terms:

Consider the function $$g(x) = \frac{1+x}{1+x+x^2}$$ which should have $$g(1) = 2/3$$. But the summation $$g_0(1)$$ appears to give an unsummable divergent series

$$
\begin{aligned}
\frac{1+x}{1+x+x^2} &= \frac{1-x^2}{1-x^3} \\
&= (1-x^2)(1 + x^3 + x^6 + \ldots) \\
&= 1 - x^2 + x^3 - x^5 + x^6 - x^8 + \ldots \\
&\Ra_{x=1} 1 - 1 + 1 - 1 - 1 + 1 + \ldots 
\end{aligned}
$$

The manipulation $$\frac{1+x}{1+x+x^2} = \frac{1-x^2}{1-x^3}$$ is valid, and you can tell that it really does have value $$g(1) = 2/3$$ by l'Hôpital's rule. But the series expansion in the next step doesn't work, because the $$O(x^N)$$ term is being dropped again. It should be

$$
\begin{aligned}
\frac{1-x^2}{1-x^3} &= (1-x^2)(1 + x^3 + x^6 + \cdots + x^{3N} + \frac{(x^3)^{N+1}}{1-x^3}) \\
&= 1 - x^2 + x^3 - x^5 + \cdots + x^{3N} - x^{3N+2} + x^{3N + 3} \frac{1-x^2}{1-x^3} \\
&\stackrel{x=1}{\Ra}(1-1) + (1-1) + \cdots + (1-1) + \frac{2}{3}
\end{aligned}
$$

This time the remainder term that is normally dropped is doing _all_ the work: every other pair of terms cancel, and then the remainder gives the full value $$2/3$$. So in this case erasing the $$N$$-dependence would leave something unusable. (It will not be surprising that you can also get a version of $$1-1+1-1+\ldots$$ which equals any rational you want by computing $$(1-x^m)/(1-x^n)$$ instead.)

------

This is basically an example of a general way of handling a lot of paradoxes that show up involving infinities and limits: whenever there is a limit $$\lim_{N \ra a}$$, instead of thinking of the value of $$N$$ canceling out, think of it as just going unstated in the rest of the problem. It's still _there_; you're just not writing it anymore. If later on you something paradoxical, go back and restore the $$N$$s and see if they resolve the paradox. Usually they do.

So any normal mathematician will tell you that the above partial sums are true, but might note that they skirt the question of taking the _limit_ as $$N \ra \infty$$, which is what makes $$S(1/2) = 2$$. Indeed, what makes divergent sums mysterious is how they seem to work after taking limits, despite the limits being invalid. Personally I don't buy this. I think the limits don't really matter: what makes $$1+1/2 +1/4+\ldots = 2$$ is that it is _indistinguishable_ from $$2$$ in a practical sense, not that they are literally equal. This is what is meant by the epsilon-delta definition of a limit anyway: for any accuracy (epsilon) you want, I can show a value that is close enough to $$1/2$$ (by delta) to get that close to $$2$$ (by epsilon). Analysis is developed by insisting that this hold for all $$\e$$, but physics (and all practical applications) doesn't care; you just need it to be true for _the $$\e$$ you actually have_, which will necessarily be finite. Therefore one does not need to really consider limits, except insofar as they summarize this approximation process succinctly. If they do not, you pull your $$N$$-dependencies back out---hopefully you did not forget where they are---and keep going.

This is an example of what I would call a [finitist](https://en.wikipedia.org/wiki/Finitism) argument. I have come to consider myself a strong finitist, moreso than most (although nothing like [ultrafinitism](https://en.wikipedia.org/wiki/Ultrafinitism) which is just silly). I keep finding that when I hold onto finitism, very many of the things which are otherwise vexing in higher mathematics simply disappear---you can't get surprising results from limits if you refuse to take limits at all! However there is a downside: much of mainstream theory is essentially unusable from a finitistic perspective, since topology and analysis are built on the assumption that things can be viewed with 'infinite resolution', so I have to translate everything into finistic terms myself to actually learn anything new. This makes mastering new fields very slow, to say the least. It saves times in learning physics, though: since physics is inherently finitistic (in the sense that you should never have infinite quantities except for coordinate singularities), so if you stick with finitistic math you will never have to worry about mathematical paradoxes are sneaking into your physical models.

------

# 3

$$S(x) = 1+x+x^2 +\ldots$$ is, admittedly, the easiest divergent series for figuring out what's going on. Therefore, to demonstrate that this way of thinking works more generally, and also mostly just to have a record of these calculations, I will go through each of the other interesting divergent sums I know and show how this 'finitistic' perspective gives the right answer. (Well, most of them. Unfortunately the sums involving primes are beyond me.)

The first series to consider is ([wiki](https://en.wikipedia.org/wiki/1_+_1_+_1_+_1_+_%E2%8B%AF)):

$$P = 1 + 1 + 1 + 1 + \ldots$$

Which happens to be $$S(1)$$. An easy manipulation shows that $$P$$ equals... any integer you want?

$$
\begin{aligned}
P - P &= 1 + 1 + 1 + 1 + \ldots \\ 
&- \;\;\;\;\;(1 + 1 + 1 + 1 + \ldots)\\ 
&= 1 \\
&= 1 + 1 + 1 + 1 + \ldots \\ 
&- \;\;\;\;\;\;\;\;\;\;\;\;( 1 + 1 + 1 + 1 + \ldots) \\ 
&= 2\
\end{aligned}
$$

That can't be right.

If we fix $$P$$ to have a finite number of terms $$N$$ then its sum is clearly $$P = N$$ To handle this better, we will label the sum with a subscript to indicate by how many terms were included in it, like this:[^index]

[^index]: Note that the indexing is off by one because $$S_N(x) = 1+x+x^2+\ldots+x^N$$ has $$N+1$$ terms whereas $$P_N = 1+1+1+1\ldots = N$$ has $$N$$.

$$P_N = S_{N-1}(1) = \underbrace{1+1+1+1+\ldots}_{N \text{ times}} = \sum_1^N 1 = N$$

Then we can say concretely:

$$
\begin{aligned}
P_N - P_N &= 0 \\
P_N - P_M &= N - M
\end{aligned}
$$

Which dispels the mystery. You can get any number if you use two un-"correlated" copies of the value, but if you subtract the _same_ value from itself you of course get $$0$$, regardless of how you try to arrange the terms. So this just works and is basically trivial. 

-------

Next we have [Grandi's Series](https://en.wikipedia.org/wiki/Grandi's_series), which is $$S(-1)$$:

$$Q = 1 - 1 + 1 - 1 + \ldots$$

It is 'summable' with the classic manipulation

$$
\begin{aligned}
Q + Q &= 1 - 1 + 1 - 1 + \ldots \\
&+ \;\;\;\;\;\; (1 - 1 + 1 - 1 + \ldots) \\
&= 1 \\
\Ra Q &\? \frac{1}{2} \\
\end{aligned}
$$

The actual value is clearly

$$
\begin{aligned}
Q_N &= S_{N-1}(-1) = \frac{1}{2}(1 - (-1)^N)
\end{aligned}
$$

If we repeat the calculation with the actual value,

$$Q_N + Q_N = 2Q_N = 1 - (-1)^N$$

it is clear that the $$N$$-dependency was inadvertently being dropped. 

However, we saw before that $$(1-x^2)/(1-x^3)$$ also gives the same series, yet equals $$\frac{2}{3}$$. How do we reconcile this? For that matter, how does a sum of $$\pm 1$$s ever equal a non-integer? Why, it is simple. Remember the actual equivalency was

$$
\begin{aligned}
\frac{1-x^2}{1-x^3} &= (1-x^2)(1 + x^3 + x^6 + \cdots + x^{3N} + \frac{(x^3)^{N+1}}{1-x^3}) \\
&= 1 - x^2 + x^3 - x^5 + \cdots + x^{3N} - x^{3N+2} + x^{3N + 3} \frac{1-x^2}{1-x^3} \\
&\stackrel{x=1}{\Ra} Q_{2N} + \frac{2}{3}
\end{aligned}
$$

So it is not the case that $$(1-x^2)/(1-x^3)$$ equals this sum, because it additionally has an term at the end whose value is $$2/3$$. No sums of integers had to equal fractions at all. Whew.

------

Next up,

$$R = 1 - 2 + 3 - 4 + \ldots$$

([wiki](https://en.wikipedia.org/wiki/1_%E2%88%92_2_+_3_%E2%88%92_4_+_%E2%8B%AF)) with the classic manipulation

$$
\begin{aligned}
R + R &= 1 - 2 + 3 - 4 + \ldots \\
&+ \;\;\;\;\;(1 - 2 + 3 - 4 + \ldots) \\
&= 1 -1 + 1 - 1 + \ldots \\
&= Q \? \frac{1}{2} \\
\Ra R &\? \frac{1}{4}
\end{aligned}
$$

We already know the value of $$Q$$ is wrong there, and probably so is the value of $$R$$, since the $$N$$ dependenceis are missing. How do we do it right? Well, the partial sums of $$R$$ are 

$$(1, -1, 2, -2, 3, -3, \ldots)$$

It is a bit harder to see how to write this as a closed form. The trick is that it is almost $$(1, \frac{3}{2}, 2, \frac{5}{2}, \ldots)$$, except that every other term is wrong by a certain amount. But once you rewrite it like this

$$(\frac{1}{4} + \frac{3}{4}, \frac{1}{4} - \frac{5}{4}, \frac{1}{4} + \frac{7}{4}, \frac{1}{4} - \frac{9}{4}, \frac{1}{4} + \frac{11}{4}, \frac{1}{4} - \frac{13}{4}, \ldots)$$

the closed form becomes obvious.

$$R_N = \frac{1}{4} - (-1)^N \frac{2N+1}{4}$$

This is why the invalid computation that canceled out the $$N$$-dependency gave $$R = 1/4$$: was just dropping the $$N$$-dependence again.

Another hacky way of getting $$R=1/4$$ that you see sometimes is by squaring $$Q$$ and then arranging the terms in a certain way:

$$
\begin{aligned}
Q^2 &= (1-1+1-1+\ldots)(1-1+1-1+\ldots) \\
(\frac{1}{2})^2 &= 1 - 1 + 1 - 1 + \ldots \\ 
&- \;\;\;\;\;(1-1+1-1+\ldots) \\
&+ \;\;\;\;\;\;\;\;\;\;\;\;(1-1+1-1+\ldots) \\
 \frac{1}{4} &\? 1 - 2 + 3 - 4 + \ldots\\
\end{aligned}
$$

This obviously won't do at all for getting the $$R_N$$ form. Once we switch to actually tracking the length of the partial sums, there are going to be a bunch of floating $$\pm 1$$s at the end of each term which don't accumulate to give a term in $$R_N$$. But we can fix this method. If it is going to compute a particular value of $$R_N$$, the sum should actually be

$$R_N = Q_N - Q_{N-1} + Q_{N-2}-Q_{N-3} \ldots$$

such that every sum terminates on exactly the $$N$$th term of $$1-2+3-4 +\ldots$$. Since $$Q_N$$ is $$0$$ for $$N$$ even and $$1$$ for $$N$$ odd, it simplifies to 

$$
\begin{aligned}
R_N = \underbrace{Q_N - Q_{N-1} + Q_{N-2}-Q_{N-3} + \ldots \mp Q_1}_{N \text{ terms}} &= \begin{Bmatrix}
-\frac{N}{2} & N \text{ even} \\[0.5em]
\frac{N+1}{2} & N \text{ odd}
\end{Bmatrix}
\end{aligned}
$$

Which happens to be another way of writing $$R_N = \frac{1}{4} - (-1)^N \frac{2N+1}{4}$$. So that's good. The reason $$Q^2 \? R \? \frac{1}{4}$$ seemed to work is because it is equivalent to the constant terms of this calculation: naturally all the $$Q_{N-K}$$s have constant term $$1/2$$, and so did the number of terms in the sum since it oscillated between even and odd numbers.

--------

Finally we have the [Ramunajan sum](https://en.wikipedia.org/wiki/1_+_2_+_3_+_4_+_%E2%8B%AF)

$$T = 1 + 2 + 3 + 4 + \ldots$$

Which can be 'summed' by reducing to $$R$$:

$$
\begin{aligned}
T - 4T &= 1 + 2 + 3 + 4 + 5 + 6 + \ldots \\ 
&- \;\;\;\;4(1 \;\;\;+ \;\;\; 2 \;\;\;+\;\;\; 3 +\ldots) \\
&= 1 - 2 + 3 -4 + 5 -6 \\
-3 T &= R \\
&\? \frac{1}{4} \\
T &= - \frac{1}{12}
\end{aligned}
$$

This one uses a new trick, of 'spacing out' the series in order to act on every other term in the sum, which we will have to handle. There is also an another problem, which is that we _know_ the closed forms of the partial sums for this series. They are

$$\sum_{k=1}^N k = \frac{N(N+1)}{2}$$

This decidedly does not contain a $$-\frac{1}{12}$$ term. So where does that value come from?

To get a closed form for $$T_N$$ we will attempt to duplicate the summation logic while carefully tracking the length of the partial sums. The 'spacing out' step requires including only the terms up to exactly the $$N$$th term of $$T$$. For this we need to use $$T_{N/2}$$ if $$N$$ is even or $$T_{(N-1)/2}$$ if $$N$$ is odd, like this:

$$
\begin{aligned}
R_N &= \begin{cases}
T_N - 4 T_{N/2} & N \text{ even} \\
T_N - 4 T_{(N-1)/2} & N \text{ odd} \\
\end{cases}
\end{aligned}
$$

More concisely:

$$R_n = T_N - 4 T_{\lfloor N/2 \rfloor}$$

Using $$R_N =  \frac{1}{4} - (-1)^N \frac{2N+1}{4}$$ we can rework this into a recurrence for $$T_N$$:

$$
T_N = \frac{1}{4}  - (-1)^N \frac{2N+1}{4} + 4 T_{\lfloor N/2 \rfloor}
$$

(with $$T_0 = 0$$). It is not too hard to check that $$T_N = \frac{N(N+1)}{2}$$ obeys this relation. If $$N$$ is even then 

$$
\begin{aligned}
\frac{N(N+1)}{2} &= \frac{N^2}{2} + \frac{N}{2} \\
&= -\frac{N}{2} + (N + \frac{N^2}{2}) \\
&= (\frac{1}{4} -\frac{2N+1}{4}) + 4(\frac{(N/2)(N/2+1)}{2})
\end{aligned}
$$

And there's something similar for $$N$$ odd.

Okay, fine. But then where does the $$-1/12$$ come from? Back to the fake derivation. The $$-3$$ factor shows up because of this manipulation:

$$T - 4T = R$$

Which is simply not valid if you're tracking partial sums, since $$T_N - 4T_N \? R_N$$ is false; the actual relationship is $$T_N - 4T_{\lfloor N/2 \rfloor} = R_N$$ But maybe that's sufficient? After all the constant term of $$R_N$$ is going to depend on the constant terms of $$T_N$$ _and_ $$T_{\lfloor N/2 \rfloor}$$, which depends on $$T_{\lfloor \lfloor N/2 \rfloor/2 \rfloor}$$, etc, all the way down to $$T_0 = 0$$. So we need to sum over the whole recurrence to see if this is true.

Put differently: since $$T_N = R_N + 4T_{\lfloor N/2 \rfloor}$$ is defined by a recurrence, there is going to be a _series_ of $$R_N$$s in the resulting sum, and therefore multiple copies of the $$\frac{1}{4}$$ constant term. This is easier to see if you just write out an example calculation for $$T_N$$:

$$
\begin{aligned}
T_5 &= \frac{1}{4} - (-1)^5 \frac{2(5)+1}{4} + 4 [ \frac{1}{4} - (-1)^2 \frac{2(2)+1}{4} + 4 [\frac{1}{4} - (-1)^1 \frac{2(1)+1}{4}]] \\
&= \frac{1}{4} + (\frac{2(5)+1}{4}) + 1 - 4 \frac{2(2)+1}{4} + 4 + 16 \frac{2(1)+1}{4} \\
&= \frac{1}{4} + \frac{11}{4} + 1 - 5 + 4 + 12 \\
&= 15 \\
&= 1 + 2 + 3 + 4 + 5 
\end{aligned}
$$

Note the multiple copies of $$\frac{1}{4}$$. Specifically there are $$\log_2 (N) + 1$$ terms, since that is the number of times you can repeat this $$ N \mapsto \lfloor \frac{N}{2} \rfloor$$ calculation (each one being equivalent to lopping off the lowest digit in binary; we would write $$N \gg 1$$ if we were in a programming context). So what we really have is a series of series:

$$T_N = \underbrace{R_N + 4 R_{\lfloor N/2 \rfloor} + 4^2 R_{\lfloor (\lfloor N/2 \rfloor)/2 \rfloor} + \ldots}_{\log_2 N + 1 \text{ terms}}$$

Each term contributes a copy of $$\frac{1}{4}$$ times a $$4^k$$ coefficient, meaning that the resulting 'constant' part of the overall sum

$$
\begin{aligned}
T_N &\sim \frac{1}{4} + 4 \frac{1}{4} + 4^2 \frac{1}{4} + \ldots \\
&= 
(\underbrace{1 + 4 + 4^2 + \ldots}_{\approx \, \log_2 N + 1 \text{ terms}}) (\frac{1}{4}) \\
\end{aligned}
$$

But we can sum that (divergently!)---it's 

$$
\begin{aligned}
T &\? (1 + 4 + 4^2 + \ldots) (\frac{1}{4}) \\
&\? \frac{1}{1 - 4} (\frac{1}{4}) \\[0.8em]
&= -(\frac{1}{3}) (\frac{1}{4}) \\[0.8em]
&= -\frac{1}{12}
\end{aligned}
$$


So this is where the number is actually coming from. Inside the overall series for $$T_N$$ there are a series of $$(\log_2 N + 1)$$ of these $$4^k \frac{1}{4}$$ terms which on their own can be have a constant part of $$-\frac{1}{12}$$. The source of them is basically from the fact that $$T_N$$ can be written as a sum of a bunch of $$R_N$$, each of which _does_ have a constant term. Evidently $$T_N$$, with $$N$$ terms, contains another series inside of it with $$(\log_2 N + 1)$$ terms, which has constant part $$-\frac{1}{12}$$. 

The exact value of the whole $$(1 + 4 + 4^2 + \ldots) (\frac{1}{4})$$ series---the sum of the constant parts of the $$R_N$$s---is

$$
\begin{aligned}
T_N &\? (1 + 4 + 4^2 + \ldots) (\frac{1}{4})  \\
&= \frac{1}{4} S_{\log_2 N + 1}(4) \\
&= (\frac{1}{4})  \frac{1 - 4^{\log_2 N + 1}}{1 - 4} \\
&=  (\frac{1}{4}) \frac{4N^2-1}{3} \\
&= -\frac{1}{12} + \frac{N^2}{3} \\
\end{aligned}
$$

The full expression for $$T_N$$ is that plus all the $$\pm$$ terms that we dropped:

$$T_N = -\frac{1}{12} + \frac{N^2}{3} + \text{(a bunch of oscillating terms)}$$

And the reason that the $$T - 4T = R$$ manipulation appeared to work is that it was actually computing

$$
\begin{aligned}
T - 4T &= (R_N + 4 R_{\lfloor N/2 \rfloor} + 4^2 R_{\lfloor (\lfloor N/2 \rfloor)/2 \rfloor} + \ldots) - 4(R_N + 4 R_{\lfloor N/2 \rfloor} + \ldots) \\ 
&= R_N + 4 (\underbrace{\cancel{R_{\lfloor N/2 \rfloor} - R_N}}_{\text{??}}) + 4^2 (\underbrace{\cancel{R_{\lfloor (\lfloor N/2 \rfloor)/2 \rfloor} - R_{\lfloor N/2 \rfloor}}}_{\text{???}} ) + \ldots \\
&\? R_N
\end{aligned}
$$

Which once again is totally invalid in general, but does work if you consider only the constant terms of each of the $$R$$, since they are all $$\frac{1}{4}$$ with no $$N$$-dependence.

So I guess that's why the $$-\frac{1}{12}$$ shows up: it is really there, but only when you divergently sum up the series created by all $$R_N$$'s constant terms, ignoring their actual value. Including those gives the partial sums the overall shape of a parabola $$-\frac{1}{12} + \frac{N^2}{3}$$, and adding back in all the oscillating terms as well gives the full $$T_N = N(N+1)/2$$.

I am still not quite sure how to reconcile this expansion with the fact that the closed form for $$T_N$$ is $$\frac{N(N+1)}{2}$$, though. I guess there's a sense in which these closed forms want to be written as a sum of oscillating- and non-oscillating terms? Wikipedia suggests that the sense in which it is correct is that, as $$N \ra \infty$$, the _best_ parabolic approximation to $$T_N$$ is one which 'smoothes out' the jumps at each integer discontinuity. For whatever reason constructing $$T_N$$ in this way correctly handles that, whereas just writing its value down directly does not.

-----

# 4

Okay, that's enough for now. Perhaps later I will come back and add some more worked-out sums on here. I am fairly confident this sort of technique continues to work on most other divergent sum results, but I'll have to try them to be sure.

The main reason for writing this is just to have these calculations set down somewhere so I can not worry about them again. But I also wanted to demonstrate some of the merits of my finitist philosophy. Whenever possible, sticking with finite results lets to say only things which are unobjectionably true. We see that for these (comparatively gentle) divergent sums, all of the special 'techniques' like analytic continuation, rules about when you can interchange or respace terms, or smoothing with mollifiers are not necessary---careful math gives the same answers, with less theory, and with no question as to the interpretation of the result. I can't confidently say that this will work in general since I've tackled only the easiest examples here, but I do think it is a worthy approach, and far more philosophically sound than the other things I see people trying.