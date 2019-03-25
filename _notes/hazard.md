---
layout: article
title: "Hazards"
footnotes: true
math: true
---

Some quick high-level notes on survival analysis and hazard rates.

Consider a population of living things (people, machines, whatever) which start all alive and eventually all die and never come back to life.

Let $$N(t)$$ be the number of living people at time $$t$$, with $$N(0) = N_0$$, $$N(\infty)=N_{\infty}$$ and there's some time $$t_{max}$$ where they're all dead, so $$N(t_{\max}) = N_{\infty}$$.

The **survival function** is the proportion of people alive at time $$t$$:

$$S(t) = \frac{N(t)}{N_0}$$

It can also be written as the probability that a person's time of death $$T$$ is greater than $$t$$: $$S(t) = P[T > t]$$. The **failure function** (so, non-survival or death function) $$F(T)$$ is 

$$F(t) = 1 - S(t) = \frac{N_0 - N(t)}{N_0}$$

which measures how many people have died at time $$t$$, and of course $$F(t) = P(T < t)$$. The **failure rate** per time is therefore 

$$f(t) = F'(t) = -S'(t) = 1 - \frac{N'(t)}{N_0} = \frac{N_0 - N'(t)}{N_0}$$

----------

For the next step, it's important to be very clear what failure rate does and does not say.

Failure rate says: "for a sufficiently small interval $$\D t$$, $$f(t) \D t$$ will be the percentage of the total population that will die in that time. It is the rate by which the percentage of dead people changes. If you are actually, say, 65 years old, $$f(65 \text{ years})$$ does _not_ tell you your expected mortality rate (in the absence of additional information). Basically $$f(T) = .1$$ says "10% of all people die per year around age $$T$$!" rather than "10% of people of age $$T$$ are dying per year!".

Clearly to get the number of people of age $$T$$ who are dying per year, we need $$\frac{-N'(t)}{N(t)}$$. This is the **hazard function** $$\lambda(t)$$:

$$\lambda(t) = -\frac{N'(t)}{N(t)} = -\frac{N'(t)/N_0}{N(t)/N_0} = -\frac{S'(t)}{S(t)} = \frac{f(t)}{S(t)}$$

Note that this divides out the dependence on $$N_0$$ entirely. This makes sense: the actual rate of death at a time should not depend on where we started counting time from -- if $$t_0$$ was $$0$$, or $$55$$, or whatever, it doesn't matter; the concept of rate of death is independent of that.

Put differently, $$\lambda(t)$$ is the rate of death at a time $$t$$, conditional on _having lived_ to time $$t$$. We might naively write $$P[T < t \| T > t ]'$$, which obviously has something wrong with it. The right way is to start with two variables: it's actually the derivative of 

$$P[T < t \| T > t_0] = 1 - \frac{S(t)}{S(t_0)} = \frac{S(t_0) - S(t)}{S(t_0)}$$

Conceptually: this says "what's the chance of dying before time $$t$$, given that you have lived to time $$t_0$$?" Its derivative says: "what's the rate of dying at time $$t$$, given that you have lived to $$t_0$$. Then we set $$t_0 = t$$ to get down to one variable, computing the local chance of death at any $$t$$ conditional to living to $$t$$. We call this conditional rate of death $$\Lambda(t,t_0)$$, so:

$$\Lambda(t, t_0) = 1 - \frac{S(t)}{S(t_0)} = \int_{t_0}^t \lambda(\tau) d \tau$$

As $$t_0 \ra t$$, this converges to:

$$\begin{aligned}
\Lambda(t) &= \lim_{t_0 \ra t} \Lambda(t, t_0) \\
&= - \log S(t)
\end{aligned}$$

[didn't check this derivation yet though]

And so $$\lambda(t) = \Lambda'(t) = -\frac{S'(t)}{S(t)}$$.


------

If the rate of something happening is constant at $$\lambda(T)$$, then the expected time till it happens is $$\frac{1}{\lambda(T)}$$. This gives us a way of comparing "how dangerous a time range is" at different times in life. 5 years when you're young is unlikely to kill you; 5 years when you're old is much more likely to kill you, and the constant of proportionality is

$$\frac{1}{\lambda(t)} = - \frac{S(t)}{S'(t)}$$

this is only if $$\lambda(t)$$ is close enough to constant, locally. But it gives us the right ratio for comparing sufficiently small intervals around a time $$t$$. For a concrete example, suppose the hazard rate is 10%/year around age 70 and 50%/year around age 100 (I have no idea what the actual numbers are). The equivalent lifespans would be, for a first guess, 1/10% = 10 years and 1/50% = 2 years. But 10 years is too long -- the hazard rate likely changes significantly over that period of time.

Nevertheless, the rates are comparable, so we can just pick a timescale over which both values _are_ effectively constant. Suppose the hazard is 10%/year throughout a year around age 70 (even if it changes significantly by age 80), and likewise around age 100. Then the time durations of "1 year" and "2 years/10 = 0.2 years" _are_ directly comparable, and the two ranges can be said to be "equivalently dangerous", in the sense that an equal percentage of each population will die in those timespans. For intuitive purposes this is probably plenty useful.

--------

This is all only if $$\lambda(t)$$ is locally approximately constant. We can be more precise. Let's go back to $$\Lambda(t, t_0) = \frac{S(t_0) - S(t)}{S(t_0)} = \int_{t_0}^t \lambda(\tau)d \tau$$, the probability of dying by time $$t$$ conditional on having lived until time $$t_0$$. We want to compare time intervals for two different values of $$t_0$$; basically we want to find $$\D t_0$$ and $$\D t_1$$ such that:

$$\Lambda(t_0 + \D t_0, t_0) = \Lambda(t_1 + \D t_1, t_1)$$

This will give us two time ranges which are "equivalently lethal" starting at times $$t_0, t_1$$. Suppose both of these are set equal to $$p$$; then, writing $$S_0 = S(t_0)$$, we can write the expectated time for percentage $$p$$ of the population to die with

$$\begin{aligned}
1 - \frac{ S(t_0 + \D t_0)}{S_0} &= p \\
S(t_0 + \D t_0) &= (1-p)S_0  \\
\D t_0 &= S^{-1} ((1-p)S_0 ) - t_0
\end{aligned}$$

This is a function $$\D t_0 (p)$$, which gives the time to reach a mortality of $$p$$ conditional on having lived until $$t_0$$. Now let's write this as a function $$\D(t_0, p)$$. To compare mortality times at two different $$t_0$$, we compute them for the same $$p$$: $$\D (t_0, p)$$ is a time interval after time $$t_0$$ which is as dangerous as $$\D (t_1, p)$$ is after $$t_1$$, with $$\D$$ given by

$$\D(\tau, p) = S^{-1} ( (1-p)S(\tau)) - \tau$$

If you just want to compare time intervals, compute $$p = \Lambda(t_0 + \D t_0, t_0) $$ as a function of the time interval around $$t_0$$ and then compare it to $$t_1$$.

$$\D t_1 (t_1, \D t_0) = S^{-1} ( \frac{S(t_1)}{S(t_0)} S(t_0 + \D t_0) ) - t_1$$

Of course this is also just the result of setting

$$\frac{S(t_0 + \D t_0)}{S(t_0)} = \frac{S(t_1 + \D t_1)}{S(t_1)}$$

and then solving for either $$\D(t_1)$$ as a function of $$\D(t_0)$$.

And, let's just double check: if $$S$$ is approximately constant around each time, then $$\frac{S(t_0 + \D t_0)}{S(t_0)} \approx 1 - \D t_0 \lambda(t_0)$$ and so 

$$\D t_0 \lambda(t_0) = \D t_1 \lambda(t_1)$$

Hence the intuition in the previous section:

> a time range $$\D t_1$$ around $$t_1$$ is as dangerous as the range $$\D t_0 \frac{\lambda(t_0)}{\lambda(t_1)}$$  around $$t_0$$.

-----

## A tangent on entropy

Another way to write $$\lambda(t) = -\frac{S'(t)}{S(t)}$$ is as

$$\lambda(t) = \frac{d}{dt} (- \log S(t))$$

And thus:

$$\Lambda(t) = - \log S(t)$$

Other than that "calculus demands it", why did these logarithms appear here? In fact, there is a close connection to information theory and entropy which is surfacing here.

If there are $$N_0$$ total people in a population, then it takes $$\log N_0$$ bits of information required to identify a single person out of that population (all logarithms will be base 2 so that we are working in bits). Likewise, if there are $$N(t)$$ people left at time $$t$$, then it takes $$\log N(t)$$ people to identify one of them. Thus, by _learning_ that a person has lived to time $$t$$, we have learned $$\log N_0 - \log N(t)$$ bits of entropy, or:

$$H(t) = - \log \frac{N(t)}{N_0} = - \log S(t) = \Lambda(t)$$

($$H(t)$$ is the usual symbol for entropy.)

Thus, $$H'(t) = \lambda(t)$$ is the "rate we learn information about a person's lifespan as they age". Or, put differently, information about "which lifespan they have out of a distribution of possible lifespans". The faster people are dying, the faster we are sorting the living into their longer-living age buckets. The fact that $$\lambda(t)$$ is invariant of $$N_0$$ reflects the fact that our information learning is just based on the death rate of the living population, not those who have already died -- we have already learned everything there is to learn from the fact that a person has survived to time $$t$$, but there is more to learn if they survive to time $$t + dt$$.

The aforement concept of "ranges of equal mortality" could be equivalently described as "ranges of equal information". Maybe that's interesting.

