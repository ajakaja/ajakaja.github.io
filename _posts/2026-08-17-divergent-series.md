---
layout: blog
title: "Exact Divergent Series"
math: true
aside: true
footnotes: true
---

One of my more strongly held mathematical opinions is that results which appear to be surprising or paradoxical (or just overly complex) are in fact bad results, and are often indicators of places that our foundations have gone wrong. To me Banach-Tarski is an indictment of measure theory, not a surprising fact about the universe. The long list of pathological counterexamples in topology is if anything an argument for finitism. Surprising implications of the axiom of choice are reasons to discard the standard forms of set theory as a foundation. That sort of thing. I can't really justify these claims (yet) but I believe them.

I have long had a vendetta against, in particular, all math explainers who give too much credence to nonsensical divergent series summation results like $$1 + 2 +3 + 4 + \ldots \? -\frac{1}{12}$$. I wrote about that sum in one of my [first]({% post_url 2018-11-01-summations %}) articles, which was inspired by a [Numberphile video](https://www.youtube.com/watch?v=w-I6XTVZXww) which had a very disappointing discourse around it at the time. I felt that people were far too willing to say that it was "in some sense" true, or even literally true, because they were basically unable to bring themselves to say that their mathematical understanding had a hole in it---even though any layperson could clearly see that it did. And if there is one thing that academics should not do it is gaslight the public. Truth is determined by reality, not by fancy techniques inside some formalism we got used to.

I have since found a much more simple and pleasing exposition on divergent series than I had before, which I think dispels all possible objections. I thought I would write it out as a standalone article in case anyone else wants to see this laid to rest (or, I guess, thinks there's something I'm still missing). Nothing in here is particularly deep, and that's kind of the point. It is just a very simple explanation for a simple thing.

<!--more-->

(The first half of this article was previously part of an [earlier piece]({% post_url 2026-02-05-series %}) about Taylor series. I decided to factor out and expand into a standalone post. The rest of that post is more of a pile of unhinged musings, whereas this part is quite concrete and more likely to be useful to someone else, so it seemed better to separate the two. I also wanted to add another section that just didn't belong there. So now it's its own thing.)


----

# 1.

I like to say that

$$f(x) = \frac{1}{1-x}$$

is my favorite function, because it has the best Taylor series. Around $$x=0$$ it is

$$S(x) = 1 + x + x^2 + x^3 + \ldots $$

which converges for $$\| x \| < 1$$. For example,[^limit]

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

The reason that $$S(2) = -1$$ under divergent summation techniques is because the algebraic manipulations used are conveniently erasing the $$x^{N+1}$$ term entirely, even though it should contribute to the result. At the step 

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

This time the remainder term that is normally dropped is doing _all_ the work: every other pair of terms cancel, and then the remainder gives the full value $$2/3$$. So in this case erasing the $$N$$-dependence would leave something unusable.

------

This is basically an example of a general way of handling a lot of paradoxes that show up involving infinities and limits: whenever there is a limit $$\lim_{N \ra a}$$, instead of thinking of the value of $$N$$ canceling out, think of it as just going unstated in the rest of the problem. It's still _there_; you're just not writing it anymore. If later on you something paradoxical, go back and restore the $$N$$s and see if they resolve the paradox. Usually they do.

So any normal mathematician will tell you that the above partial sums are true, but might note that they skirt the question of taking the _limit_ as $$N \ra \infty$$, which is what makes $$S(1/2) = 2$$. Indeed, what makes divergent sums mysterious is how they seem to work after taking limits, despite the limits being invalid. Personally I don't buy this. I think the limits don't really matter: what makes $$1+1/2 +1/4+\ldots = 2$$ is that it is _indistinguishable_ from $$2$$ in a practical sense, not that they are literally equal. This is what is meant by the epsilon-delta definition of a limit anyway: for any accuracy (epsilon) you want, I can show a value that is close enough to $$1/2$$ (by delta) to get that close to $$2$$ (by epsilon). Analysis is developed by insisting that this hold for all $$\e$$, but physics (and all practical applications) doesn't care; you just need it to be true for _the $$\e$$ you actually have_, which will necessarily be finite. Therefore one does not need to really consider limits, except insofar as they summarize this approximation process succinctly. If they do not, you pull your $$N$$-dependencies back out---hopefully you did not forget where they are---and keep going.

This is an example of what I would call a [finitist](https://en.wikipedia.org/wiki/Finitism) argument. I consider myself a strong finitist, much more than most people are (although nothing like the [ultrafinitists](https://en.wikipedia.org/wiki/Ultrafinitism) which are silly). I keep finding that if I am sufficiently earnest about finitism, very many of the things that are vexing or difficult about higher mathematics simple disappear---you can't get surprising results from limits if you don't have limits at all! However there is a downside: so much of the mainstream theory becomes unusable from a finistic perspective, that you end up having to figure out how to translate everything into finistic terms yourself to actually learn anything new. In particular, anything adjacent to topology or analysis.

------

# 3

$$S(x) = 1+x+x^2 +\ldots$$ is admittedly the easiest of the divergent series to figure out what's going on in. Therefore, to prove that this way of thinking works more generally, and also mostly just to have a record of them, I will go through each of the other interesting divergent sums I know and show how this 'finitistic' perspective gives the right answer.

The first series to consider is ([wiki](https://en.wikipedia.org/wiki/1_+_1_+_1_+_1_+_%E2%8B%AF)):

$$P = 1 + 1 + 1 + 1 + \ldots$$

A common manipulation shows that $$P$$ equals... any integer you want?

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

Which can't be right.

Clearly if we fix $$P$$ to have a finite number of terms $$N$$ then its sum is actually $$P = N$$ (this is also the value of $$S(1)$$---clearly not equal to $$1/(1-1)$$ by the way!). To handle this better, from now on we will label series with a subscript to indicate by how many terms are included in them, like this:[^neg]

[^neg]: We will not try to make sense of negative subscripts!---not today at least.

$$P_N = \underbrace{1+1+1+1+\ldots}_{N \text{ times}} = \sum_1^N 1 = N$$

Then we can say concretely:

$$
\begin{aligned}
P_N - P_N &= 0 \\
P_N - P_M &= N - M
\end{aligned}
$$

This always works and is basically trivial.

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

$$Q_N = \frac{1}{2}(1 - (-1)^N)$$

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

So it is not the case that $$(1-x^2)/(1-x^3)$$ equals this sum: it has an $$N$$-dependent term at the end whose value is $$2/3$$. No sums of integers had to equal fractions at all. Whew. (It will not be surprising that you can also get a version of $$1-1+1-1+\ldots$$ that equals any rational you want, by computing $$(1-x^m)/(1-x^n)$$ instead.)

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

which are a lot like $$(1, \frac{3}{2}, 2, \frac{5}{2}, \ldots)$$, except that every other term is wrong. A bit of thinking reveals that it can be written like this, though:

$$(\frac{1}{4} + \frac{3}{4}, \frac{1}{4} - \frac{5}{4}, \frac{1}{4} + \frac{7}{4}, \frac{1}{4} - \frac{9}{4}, \frac{1}{4} + \frac{11}{4}, \frac{1}{4} - \frac{13}{4}, \ldots)$$

Therefore the closed form must be

$$R_N = \frac{1}{4} - (-1)^N \frac{2N+1}{4}$$

Which is why the invalid computation that canceled out the $$N$$-dependency gave $$R = 1/4$$.

Incidentally, another hacky way of getting $$R=1/4$$ is to square $$Q$$ and then arranging the terms in a certain way:

$$
\begin{aligned}
Q^2 &= (1-1+1-1+\ldots)(1-1+1-1+\ldots) \\
(\frac{1}{2})^2 &= 1 - 1 + 1 - 1 + \ldots \\ 
&- \;\;\;\;\;(1-1+1-1+\ldots) \\
&+ \;\;\;\;\;\;\;\;\;\;\;\;(1-1+1-1+\ldots) \\
 \frac{1}{4} &\? 1 - 2 + 3 - 4 + \ldots\\
\end{aligned}
$$

This obviously won't do at all once we switch to actually tracking the length of the partial sums: there are going to be a bunch of floating $$\pm 1$$s at the end of each term which don't accumulate to give a term in $$R$$. If we want to use this to compute any particular value of $$R_N$$, we need the sum to actually be

$$R_N = Q_N - Q_{N-1} + Q_{N-2}-Q_{N-3} \ldots$$

such that every sum terminates on exactly the $$N$$th term of $$1-2+3-4 +\ldots$$. Since $$Q_N$$ is $$0$$ for $$N$$ even and $$1$$ for $$N$$ odd, it simplifies to 

$$
\begin{aligned}
\underbrace{Q_N - Q_{N-1} + Q_{N-2}-Q_{N-3} + \ldots \mp Q_1}_{N \text{ terms}} &= \begin{Bmatrix}
-\frac{N}{2} & N \text{ even} \\[0.5em]
\frac{N+1}{2} & N \text{ odd}
\end{Bmatrix} = R_N
\end{aligned}
$$

So that's good. But it's definitely not what you get from computing $$Q_N^2$$, because the $$N$$-dependent terms are all different. Still, the constant term is valid, which is why $$Q^2 \? \frac{1}{4} \? R$$ seems to work.

--------

Finally we have the [Ramunajan sum](https://en.wikipedia.org/wiki/1_+_2_+_3_+_4_+_%E2%8B%AF)

$$T = 1 + 2 + 3 + 4 + \ldots$$

Which can be 'summed' by reducing to $$R$$:

$$
\begin{aligned}
T - 4T &= 1 + 2 + 3 + 4 + 5 + 6 + \ldots \\ 
&- \;\;\;\;4(1 \;\;\;+ \;\;\; 2 \;\;\;+\;\;\; 3 +\ldots) \\
&= 1 - 2 + 3 -4 + 5 -6 \\
&= R \\
-3 T &\? \frac{1}{4} \\
T &= - \frac{1}{12}
\end{aligned}
$$

This one uses a new trick, of 'spacing out' a sum in order to cancel out every other term, which we will have to handle. There is also an another problem, which is that we _know_ the closed form of the partial sums for this series. They are

$$\sum_{k=1}^N k = \frac{N(N+1)}{2}$$

which decidedly does not contain a $$-\frac{1}{12}$$ term. So where did that value come from?

To get a closed form for $$T_N$$ we will attempt to duplicate the summation logic while carefully tracking the length of the partial sums. The 'spacing out' step requires including only the terms up to exactly the $$N$$th term of $$T$$. For this we need to use $$T_{N/2}$$ if $$N$$ is even or $$T_{(N-1)/2}$$ if $$N$$ is odd.

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

(with $$T_0 = 0$$). It is not too hard to check that $$T_N = N(N+1)/2$$ obeys this relation. For example if $$N$$ is even then $$N(N+1)/2 = \frac{N^2}{2} + \frac{N}{2} = -\frac{N}{2} + (N + \frac{N^2}{2}) = -\frac{N}{2} + 4(\frac{(N/2)(N/2+1)}{2})$$.

Okay, fine. But then where does the $$-1/12$$ come from? 

Back to the fake derivation. The $$-3$$ factor shows up because of this manipulation:

$$T - 4T = R$$

Which is simply not valid if you're tracking partial sums, since $$T_N - 4T_N \? R_N$$ is false; the actual relationship is $$T_N - 4T_{\lfloor N/2 \rfloor} = R_N$$. What we can do, though, is track the remainder and see what it does. We get

$$T_N - 4 T_N = -3 T_N = R_N - 4 [T_N - T_{\lfloor N/2 \rfloor } ]$$

Expanding:

$$
\begin{aligned}
T_N &= -\frac{1}{3} R_N + \frac{4}{3} [T_N - T_{\lfloor N/2 \rfloor } ] \\
&= -\frac{1}{12} + \frac{1}{3} [(-1)^N \frac{2N+1}{4}] + \frac{4}{3} [\, \boxed{\frac{1}{4}}  - (-1)^N \frac{2N+1}{4} + 4 T_{\lfloor N/2 \rfloor} - T_{\lfloor N/2 \rfloor }] \\
&= \frac{1}{4} - (-1)^N \frac{2N+1}{4} + 4 T_{\lfloor N/2 \rfloor}
\end{aligned}
$$

We see that there is another constant term which modifies the leading $$-\frac{1}{12}$$. It come from the $$T_N$$ in the remainder, which was expanded as $$T_N = R_N + 4T_{\lfloor N/2 \rfloor}$$ in the first place. By ignoring this remainder we end up with a 'dangling' $$-\frac{1}{12}$$ which appears to be the constant term in the whole sum.

When we include it we get a $$+\frac{1}{4}$$ constant term instead, which is still not the $$0$$ we expect from the formula $$\sum^N_1 k = \frac{N(N+1)}{2}$$, however. I suppose it must come from including the $$T_{\lfloor N/2 \rfloor}$$ terms as well? For instance if $$N=5$$ and we write the whole sum out,

$$
\begin{aligned}
T_5 &= \frac{1}{4} - (-1)^5 \frac{2(5)+1}{4} + 4 [ \frac{1}{4} - (-1)^2 \frac{2(2)+1}{4} + 4 [\frac{1}{4} - (-1)^1 \frac{2(1)+1}{4}]] \\
&= \frac{1}{4} + (\frac{2(5)+1}{4}) + 1 - 4 \frac{2(2)+1}{4} + 4 + 16 \frac{2(1)+1}{4} \\
&= \frac{1}{4} + \frac{11}{4} + 1 - 5 + 4 + 12 \\
&= 15 \\
&= 1 + 2 + 3 + 4 + 5 
\end{aligned}
$$

I guess you can't tell anything about the asymptotic behavior from this, but it is at least interesting to see how it works. There are a _bunch_ of constant terms, $$1 + \log_2 (N) $$ of them (so only one is actually 'constant'), plus a bunch of 'oscillating' terms with different magnitudes which serve to create all the cancellation necessary to make the result.

So on the one hand we know that $$\sum_1^N k = \frac{N (N+1)}{2}$$ and there is no constant term, and we have demonstrated that correctly doing algebra with $$T_N$$ does not produce a $$-1/12$$, and _incorrectly_ doing algebra produces one because the term that should cancel it out is being swept under the rug as a missing remainder in $$T - 4T = R \;\; (+ [-4 T_N - T_{\lfloor N/2 \rfloor }])$$. And yet---Tao's mollifier arguments, and all the graphs on Wikipedia that show that a parabola approximation to the discrete sum goes through $$y=-1/12$$, must also be correct. And then there's those people who claim this sum shows up in quantum field theory and the $$-1/12$$ means something. How do we reconcile these facts?

I have one idea. Consider what happens to the $$T_N = R_N + 4 T_{\lfloor N/2 \rfloor}$$ recurrence as $$N$$ gets large:

$$T_N = R_N + 4 R_{\lfloor N/2 \rfloor} + 4^2 R_{\lfloor (\lfloor N/2 \rfloor)/2 \rfloor} + \ldots$$

There are $$\log_2 N + 1$$ of these terms (I think?), and every one of them contributes a copy of $$\frac{1}{4}$$, meaning that the resulting 'constant' part of the sum (which is not actually constant since there are a varying number of them) is

$$
\begin{aligned}
T_N &\sim \frac{1}{4} + 4 \frac{1}{4} + 4^2 \frac{1}{4} + \ldots \\
&= 
(\underbrace{1 + 4 + 4^2 + \ldots}_{\approx \, \log_2 N + 1 \text{ terms}}) (\frac{1}{4})
\end{aligned}
$$

If we then apply divergent series summation trickery to _this_ sum, we get what we're looking for:

$$(1 + 4 + 4^2 + \ldots) (\frac{1}{4}) \? \frac{1}{1 - 4} (\frac{1}{4}) = -(\frac{1}{3}) (\frac{1}{4}) = -\frac{1}{12}$$

So I think that may be where the number is actually coming from. Inside the overall series for $$T_N$$ there are a series of $$(\log_2 N + 1)$$ of these $$4^k \frac{1}{4}$$ terms which on their own can be have a constant part of $$-\frac{1}{12}$$. The source of them is basically from the fact that $$T_N$$ can be written as a sum of a bunch of $$R_N$$, each of which _does_ have a constant term. Evidently $$T_N$$, with $$N$$ terms, contains another series inside of it with $$(\log_2 N + 1)$$ terms, which has constant part $$-\frac{1}{12}$$. In fact we can use the exact sum for this as well: it is

$$(\frac{1 - 4^{\log_2 N + 1}}{1-4})(\frac{1}{4}) = \frac{4N^2-1}{3} (\frac{1}{4}) = -\frac{1}{12} + \frac{N^2}{3}$$

The overall form of $$T_N$$ is therefore

$$\lim_{N \ra \infty} T_N \sim -\frac{1}{12} + \frac{N^2}{3} + \text{(a bunch of oscillating terms)}$$

(if I did not screw up my arithmetic anywhere). So I guess that's why the $$-\frac{1}{12}$$ shows up: it is really there, but only when you ignore all the oscillating contributions from the variable number of $$R_N$$s, giving the partial sums and overall shape of a parabola $$-\frac{1}{12} + \frac{N^2}{3}$$. I don't know enough to say that this is rigorous, but I think it's right. 

Amusingly, the reason the $$T - 4T = R$$ manipulation worked is that it was sort of actually computing

$$
\begin{aligned}
T - 4T &= (R_N + 4 R_{\lfloor N/2 \rfloor} + 4^2 R_{\lfloor (\lfloor N/2 \rfloor)/2 \rfloor} + \ldots) - 4(R_N + 4 R_{\lfloor N/2 \rfloor} + \ldots) \\ 
&= R_N + 4 (\underbrace{\cancel{R_{\lfloor N/2 \rfloor} - R_N}}_{\text{??}}) + 4^2 (\underbrace{\cancel{R_{\lfloor (\lfloor N/2 \rfloor)/2 \rfloor} - R_{\lfloor N/2 \rfloor}}}_{\text{???}} ) + \ldots \\
&\? R_N
\end{aligned}
$$

Which, while completely invalid in general, _is_ valid if you only consider the constant terms of each of the $$R$$, since they are all $$\frac{1}{4}$$ with no $$N$$-dependence.

I still am not quite sure how to reconcile this expansion with the fact that $$T_N = \frac{N(N+1)}{2}$$ though. It seems like the $$-\frac{1}{12}$$ version is somehow talking about a constant term specifically with respect to the $$(-1)^N$$ oscillations that are introduced by the $$R_N$$s, which $$\frac{N(N+1)}{2}$$ glosses over and therefore does not detect. But I don't know how to think about it really. Maybe it's just that $$\frac{N(N+1)}{2}$$ does not give the best parabolic approximation when you include the way that $$T_N$$ 'jumps' at each integer, whereas $$-\frac{1}{12} + \frac{N^2}{3}$$ does? Not sure.


-----

# 4

Okay, that's enough for now. Perhaps later I will come back and add some more worked-out sums on here. I am fairly confident this sort of technique continues to work on most other divergent sum results, but I'll have to try them to be sure.

The point of all this is mostly to demonstrate my philosophy of staying finitist whenever possible. At least for these (comparatively gentle) divergent sums, special 'techniques' like analytic continuation, rules about when you can interchange or respace terms, or smoothing with mollifiers are not necessary: careful math gives the same answers, with less theory, and with no question as to the interpretation of the result. I'd like to say I'm confident that this will hold in general, but of course I'm not. But I do think it is a worthy approach, and far more philosophically sound than the other things I see people trying.