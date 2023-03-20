---
layout: article
title: "Quick note on survival analysis"
footnotes: true
math: true
tag: math
---

First some review (ie I derive everything myself):

Consider a population of things, such as people, which start alive and eventually die. Let $$N(t)$$ be the number of living people at time $$t$$, with $$N(0) = N_0$$, $$N(\infty)=N_{\infty}$$ and there's some time $$t_{max}$$ where they're all dead, so $$N(t_{\max}) = N_{\infty}$$.

The **survival function** is the proportion of people alive at time $$t$$:

$$S(t) = \frac{N(t)}{N_0}$$

It can also be written as the probability that a person's time of death $$T$$ is greater than $$t$$: $$S(t) = P[T > t]$$. The **lifetime distribution function** or **failure function** (basically, number of dead) $$F(T)$$ is 

$$F(t) = 1 - S(t) = \frac{N_0 - N(t)}{N_0}$$

which measures how many people have died at time $$t$$, and of course $$F(t) = P(T < t)$$. The **death rate** per time is therefore 

$$f(t) = F'(t) = -S'(t) = - \frac{N'(t)}{N_0} = -\frac{N'(t)}{N_0}$$

----------

Failure rate says: "for a sufficiently small interval $$\D t$$, $$f(t) \D t$$ will be the percentage of the total population that will die in that time. It is the rate by which the percentage of dead people changes. If you are actually, say, 65 years old, $$f(65 \text{ years})$$ does _not_ tell you your expected death rate -- it tells you the death rate of of the whole population at 65 years old. If $$f(T) = .1$$ that means "10% of all people die per year around age $$T$$!" rather than "10% of people of age $$T$$ are dying per year!".

To get the number of people of age $$T$$ who are dying per year, we need to rescale -- we should only be considering the rate of death among people of that age, by dividing the total death rate by the number of people of that age. This is the **hazard function** $$\lambda(t)$$:

$$\lambda(t) = -\frac{N'(t)}{N(t)} = -\frac{N'(t)/N_0}{N(t)/N_0} = -\frac{S'(t)}{S(t)} = \frac{f(t)}{S(t)}$$

Note that this divides out the dependence on $$N_0$$ entirely. This makes sense: the actual rate of death at a time should not depend on where we started counting time from -- if $$t_0$$ was $$0$$, or $$55$$, or whatever, it doesn't matter; the concept of rate of death is independent of that. For a simple example: if 10% of people die per year around age 80, but 10% of people _are_ of age 80, then their hazard rate is 100%.

Put differently, $$\lambda(t)$$ is the rate of death at a time $$t$$, conditional on _having lived_ to time $$t$$. That sounds like it might mean $$\lambda(t) = \frac{d}{dt} P[T < t \| T > t ]$$, but that can't be right. The right way is to start with two variables: it's actually the derivative of 

$$P[T < t \| T > t_0] = 1 - \frac{S(t)}{S(t_0)} = \frac{S(t_0) - S(t)}{S(t_0)}$$

Conceptually: this says "what's the chance of dying before time $$t$$, given that you have lived to time $$t_0$$?" Its derivative says: "what's the rate of dying at time $$t$$, given that you have lived to $$t_0$$. Then we set $$t_0 = t$$ to get down to one variable, computing the local chance of death at any $$t$$ conditional to living to $$t$$. Call this 'conditional death rate' $$\Lambda(t,t_0)$$, and:

$$\Lambda(t, t_0) = 1 - \frac{S(t)}{S(t_0)} = \int_{t_0}^t \lambda(\tau) d \tau$$

As $$t_0 \ra t$$, this converges to the **cumulative hazard**:

$$\begin{aligned}
\Lambda(t) &= \lim_{t_0 \ra t} \Lambda(t, t_0) \\
&= - \log S(t)
\end{aligned}$$

And so $$\lambda(t) = \Lambda'(t) = -\frac{S'(t)}{S(t)}$$.

------

At a specific time $$T$$, the hazard probably looks like a locally constant $$\lambda(T)$$, and we know that the expectation value for time until an event with rate $$\lambda(T)$$ happens is $$\frac{1}{\lambda(T)}$$. This gives us a way of comparing "how dangerous a time range is" at different times in life, because the times $$\frac{1}{\lambda(t_0)}$$ around a time $$t_0$$ and $$\frac{1}{\lambda(t_1)}$$ around a time $$t_0$$ are in a sense 'equally lethal'.

(These have units like "days near $$t_0$$ per death". The ratio $$\frac{\lambda(t_0)}{\lambda(t_1)}$$ has units "days near $$t_1$$ per days near $$t_0$$", meaning that it acts like an 'exchange rate', telling us how much mortality a day in each time range is worth in terms of the other.)

Given a fixed time range $$\D t$$, we might 'scale it' for people at different ages: $$(t_0, \lambda(t_0) \D t)$$ and $$(t_1, \lambda(t_1) \D t)$$ are equally lethal time ranges (dividing the first by $$\lambda (t_0)$$ and the second by $$\lambda(t_1)$$ give the same rate of death). Or, we could say something like: $$\D t$$ at $$t_0$$ is worth $$\frac{\lambda(t_1)}{\lambda(t_0)} \D t$$ at $$t_1$$.



This is only if $$\lambda(t)$$ is close enough to constant, locally. But it gives us the right ratio for comparing sufficiently small intervals around a time $$t$$.

For a concrete example, suppose the hazard rate is 10%/year around age 70 and 50%/year around age 100 (I have no idea what the actual numbers are). The expectation values of lifespan would be 1/10% = 10 years and 1/50% = 2 years respectively. $$x$$ years at 100 would be as lethal as $$\frac{\lambda(70)}{\lambda(100)} = \frac{0.5}{0.1} = 5$$ years at age 70. Etc.

But 10 years is definitely too long -- the hazard rate likely changes significantly over that period of time. Nevertheless, the rates are comparable, so we can just pick a timescale over which both values _are_ effectively constant. So if 1 year doesn't work, it still might work to say that 1 month does. 

Suppose only one of the values is constant enough -- the value of $$50%$$ hazard at age $$100$$ is valid over one year, but the $$10%$$ hazard at age $$70$$ isn't constant enough over 5 years. Assuming that the hazard rate only goes _up_ with time, then we can still concretely say that "1 year at 100 is as dangerous as _at most_ 5 years at 70", since the rising hazard rate can only serve to make 5 years _more_ dangerous than the estimate.

[keeping track of which hazard goes in the numerator and which in the denominator has proven tricky. I'll hopefully come back with fresh eyes and catch any mistakes...]

--------

What if $$\lambda(t)$$ is not constant? Let's go back to $$\Lambda(t, t_0) = \frac{S(t_0) - S(t)}{S(t_0)} = \int_{t_0}^t \lambda(\tau)d \tau$$, the probability of dying by time $$t$$ conditional on having lived until time $$t_0$$. We want to compare time intervals for two different values of $$t_0$$; basically we want to find $$\D t_0$$ and $$\D t_1$$ such that:

$$\Lambda(t_0 + \D t_0, t_0) = \Lambda(t_1 + \D t_1, t_1)$$

This will give us two time ranges which are "equivalently lethal" starting at times $$t_0, t_1$$. This gives:

$$\frac{S(t_0 + \D t_0)}{S(t_0)} = \frac{S(t_1 + \D t_1)}{S(t_1)}$$

and then we can solve for either $$\D t_0$$ as a function of $$\D t_1$$ or vice versa. The result is:

$$\D t_1  = S^{-1} ( \frac{S(t_1)}{S(t_0)} S(t_0 + \D t_0) ) - t_1$$

Not too intuitive, but computationally usable I suppose.

And, let's just double check: if $$S$$ is approximately constant around each time, then $$\frac{S(t_0 + \D t_0)}{S(t_0)} \approx 1 - \D t_0 \lambda(t_0)$$ and so 

$$\D t_0 \lambda(t_0) = \D t_1 \lambda(t_1)$$

Hence the intuition in the previous section:

> a time range $$\D t_1$$ around $$t_1$$ is as dangerous as the range $$\D t_0 \frac{\lambda(t_0)}{\lambda(t_1)}$$  around $$t_0$$.

