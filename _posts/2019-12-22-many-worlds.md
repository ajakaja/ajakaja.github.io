---
layout: blog
title: "A possible derivation of the Born Rule"
footnotes: true
math: true
aside: true
tags: math
---

The so-called [Born Rule](https://en.wikipedia.org/wiki/Born_rule) of quantum mechanics says that if a system is in a state $$\alpha \| 0 \> + \beta \| 1 \>$$, upon 'measurement' (in which we entangle with one or the other outcome), we measure the eigenvalue associated with the state $$\| 0 \>$$ with probability

$$P[0] = \| \alpha \|^2$$

The Born Rule is normally included as an additional postulate in QM, which is somewhat unsatisfying. Or at least, it is apparently difficult to justify, given that I've read a bunch of attempts, each of which talks about how there haven't been any other satisfactory attempts.

Anyway here's an argument I came up with which seems somewhat compelling. It argues that the Born Rule can emerge from interference if you assume that every _measurement_ of a probability that you're exposed to (which I guess is a Many-Worlds-ish idea) is assigned a random, uncorrelated phase.

<!--more-->

-------

## 1. Classical version of the argument

First let's discuss what it means to 'measure a probability' in a _non_-quantum experiment. Suppose we're flipping a biased coin that gets heads with probability $$P[H] = p$$ and $$P[T] = q = 1 - p$$. We'll write it in a notation suggestive of quantum mechanics.: let's call its states $$\| H \> $$ and $$\| T \>$$, so the results of a coin flip are written as $$p \| H \> + q \| T \>$$ with $$p + q= 1$$. Upon $$n$$ iterations of classical coin-flipping we end up in state

$$(p \| H \> + q \| T \>)^n = \sum_k {n \choose k} p^k q^{n-k} \| H^k T^{n-k} \>$$

Where $$\| H^k T^{n-k} \>$$ means a state in which we have observed $$k$$ heads and $$n-k$$ tails in any order.

Now suppose this whole experiment is being performed by an experimenter who's trapped in a box or something. The experimenter does the experiment, writes down what they think the probability of heads is, and then transmits _only that_ to us, outside of the box. So the only value we end up seeing is the value of their _measurement_ of $$P[H]$$, which we'll call $$\hat{p}$$. The best estimate that the experimenter can give, of course, is their observed frequency $$\frac{k}{n}$$, so we might say that the resulting system's states are now identified by the probability perceived by the experimenter:

$$(p \| H \> + q \| T \>)^n = \sum_k {n \choose k} p^k q^{n-k} \| \hat{p} = k/n\>$$

If you let $$n$$ get very large, the states near where $$\hat{p} = p$$ will end up having the highest-magnitude amplitude, and so we expect to end up in a 'universe' where the measurement $$\hat{p}$$ converges on the true value of $$p$$. Mathematically this is just the law of large numbers: for large $$n$$ the binomial distribution $$B(n, p, q)$$ converges to a normal distribution $$\mathcal{N}(np, npq)$$ with mean $$np$$.

I think this is as good an explanation as any as to what probability 'is'. Instead of trying to figure out what it means for _us_ to experience an infinite number of events and observe a probability, let's just ask an experimenter who's locked in a box to figure it out for us, and then just have them send us their results! Unsurprisingly, the experimenter comes up with classical probability.

--------

## 2. Quantum version

Now let's do it again with a qubit (a, er, 'quantum coin'). The individual experiment runs are now given by $$\alpha \| 0 \> + \beta \| 1 \>$$ where $$\alpha, \beta$$ are probability amplitudes with $$\| \alpha \|^2 + \| \beta \|^2 = 1$$. Note that normalizing these to sum to 1 is just for convenience and doesn't predetermine the probabilities --- if you don't normalize now, you just have to divide through by the normalization later instead.

As before we have our experimenter perform $$n$$ individual measurements of the qubit and report the results to us:

$$(\alpha \| 0 \> + \beta \| 1 \>)^n$$

Where are things going to go differently? If we imagine our experimenter as a standalone quantum system, it seems like their measurements may pick up their own phases and possibly interfere with each other. That is, a single $$\| \hat{p} = \frac{k}{n} \>$$ macrostate, consisting of all the different ways they could have gotten $$k$$ $$\| 1 \>$$s out of $$n$$ measurements, will consist of many different 'worlds' that may end up with different phases themselves, and there is no reason to think that they will add up neatly. I'm not totally sure this is reasonable, but it leads to an interesting result, so let's assume it is.

For an example, consider the $$n=2$$ case. We'll let each $$\| 0 \>$$ state have a different phase $$\alpha_j = \| \alpha \| e^{i \theta_j}$$. (We can ignore the $$\| 1 \>$$ phases without loss of generality.)

The state we generate will be:

$$\begin{aligned} 
&(\alpha_1 \| 0 \> + \beta \| 1 \>) (\alpha_2 \| 0 \> + \beta \| 1 \>) \\
&= \alpha_1 \alpha_2 \| 0 0 \> + \alpha_1 \beta \| 0 1 \> + \beta \alpha_2 \| 1 0 \> + \beta^2 \| 1 1 \> \\
\end{aligned}$$

This is no longer a clean binomial distribution. Writing $$a = \| \alpha \|$$ and $$b = \| \beta \|$$ for clarity, the two-iteration wave function is:

$$= e^{i (\theta_1 + \theta_2) }  a^2 \| 0^2 \> + ab (e^{i \theta_1} + e^{i \theta_2}) \| 0^1 1^1 \> + b^2 \| 1^2 \>$$

Note that $$ab (e^{i \theta_1} + e^{i \theta_2}) \| 0^1 1^1 \>$$ only has the same magnitude as $$2ab \| 0^1 1^1 \>$$, the classical value, when $$\theta_1 = \theta_2$$. This suggests that, if the experimenter's different experiment outcomes can randomly interfere with each other as quantum states, then the probability of their reporting $$\| 0^1 1^1 \>$$ will be suppressed compared to $$\| 0^2 \>$$ or $$\| 1^2 \>$$. Note that we still haven't determined _why_ the different ways of measuring these outcomes have different phases; we're just assuming that they do.

Now we consider what this looks like as $$n \ra \infty$$. For a state with $$k$$ $$\alpha\| 0 \>$$ terms, we end up with a sum of exponentials with $$k$$ phases in them: 

$$E_{k, n} = \sum_{J \in S_{k,n}} e^{i \sum_{j \in J} \theta_j}$$

Here $$S_{k,n}$$ is the set of $$k$$-element subsets of $$n$$ elements. For instance if $$k=2, n=3$$:

$$E_{2, 3} = e^{i(\theta_1 + \theta_2)} + e^{i(\theta_2 + \theta_3)} + e^{i(\theta_1 + \theta_3)}$$

Our wave function for $$n$$ iterations of the experiment is given by

$$\psi = \sum_k a^k b^{n-k} E_{k, n} \| 0^k  1^{n-k} \> = \sum_k a^k b^{n-k} E_{k, n} \| \hat{p} = \frac{k}{n} \>$$

The classical version of this is a binomial distribution because $$E_{k, n}$$ is replaced with $${n \choose k}$$. The quantum version observes some cancellation. We want to know: as $$n \ra \infty$$, what value of $$k$$ dominates?

We don't know anything the phases themselves, but the result is interesting if we treat them as classical independent random variables. This means that $$\bb{E}[e^{i \theta}] = 0$$ and therefore $$\bb{E}[E_{k, n}] = 0$$ for all $$k$$. But the expected _magnitude_ is not 0. The sum of all of these random vectors forms a random walk in the complex plane, and the expected amplitude of a random walk is [given](http://mathworld.wolfram.com/RandomWalk2-Dimensional.html) by $$\bb{E}[ \| E_{1, n} \|^2 ] = n$$. because:

$$\begin{aligned}
\bb{E}[ \| E_{1, n} \|^2 ] &= \bb{E} [ \sum_i e^{- i \theta_i} \| \sum_j e^{i \theta_j} ] \\
&= \bb{E} \sum_i \| e^{i \theta_i} \|^2 + \bb{E} \sum_{i \neq j} e^{- i \theta_i} e^{i \theta_j} \\
&= n \bb{E}[1] + \sum_{i \neq j} \bb{E}[e^{i (\theta_i - \theta_j)}] \\
&= n
\end{aligned}$$


This means that the magnitude of the $$k=1$$ term for our quantum coin is proportional to $$\sqrt{n}$$, rather than the classical value of $$n$$.

For $$k > 1$$, the same argument applies (it's still basically a random walk), except that there are $${ n \choose k }$$ terms in the sum, so in every case we get an expected amplitude $$\bb{E} [ \| E_{k, n} \|^2 ] = { n \choose k }$$. This makes the resulting experimenter wave function look like:

$$
\begin{aligned}
(e^{\hat{\theta} i} \alpha \| 0 \> + \beta \| 1 \>)^n 
&\sim \sum_{k =0}^n  \sqrt{ n \choose k } a^k b^{n-k} \| 0^k 1^{n-k} \text{ in some order }\> \\
&\sim \sum_{k =0}^n  \sqrt{ n \choose k } a^k b^{n-k} \| \hat{p} = k/n \>
\end{aligned}
$$

(This is not an equality because it still depends on a classical random variable $$\hat{\theta}$$. But it produces the correct expected magnitudes for each term, which is what we care about.) 

------

After running $$n$$ experiments in their box, our experimenter tell us a number, their perceived value of $$\hat{p}$$. As $$n \ra \infty$$ the highest-amplitude state will dominate. For that, we only need to compute the value of $$k$$ at the peak amplitude, and we can find that using $$\| \psi \|^2$$, which is easy to work with:

$$\| \psi \|^2  \sim \sum {n \choose k} (a^2)^k (b^2)^{n-k} $$

This is a binomial distribution $$B(n, a^2, b^2) = B(n, \|\alpha\|^2, \| \beta \|^2)$$, which asymptotically looks like a normal distribution $$\mathcal{N}(n \| \alpha \|^2, n \| \alpha \|^2 \| \beta \|^2)$$ with maximum $$k = n \| \alpha \|^2$$, which means that the highest-amplitude state measured is:

$$\begin{aligned}
\| \hat{p} = \| \alpha \|^2 \>
\end{aligned}$$

Thus we conclude that the observed probability of measuring $$\| 0 \>$$ when interacting with a system in state $$\alpha \| 0 \> + \beta \| 1 \>$$ is centered around $$\| \alpha \|^2$$, as reported by an experimenter in a box who runs the measurement many times and reports their measurement of the probability afterwards, but whose many runs of the experiment interfere with each other due to classical-distributed noise. And that's the Born Rule.

Ultimately this follows from postulating that many different ways of seeing the same result interfere with each other, suppressing the amplitudes of seeing less uniform results by a factor of the square root of their multiplicity.

So that's interesting. I find the argument to be suspiciously clean, and therefore compelling. As far as I can tell it also works in generalizations of the same setup:

* to distributions with more than two possible values.
* to 'nested' experiments, where you find out the value of a measurement from multipler measures who each got it from multiple experimenters. In this case all of the measurers are able to interfere with each other, from your perspective, so it gets flattened out to a single level of interference.
* if the amplitudes aren't normalized to begin with. If $$\|\alpha \|^2 + \| \beta \|^2 \neq 1$$ the resulting asymptotic normal distribution will just end up having mean $$\frac{n \| \alpha \|^2}{\| \alpha \|^2 + \| \beta \|^2}$$.

I'm not sure I've correctly identified what might actually lead to the random interference in this experiment. Is it the experimental apparatus interfering with itself? Is it hidden degrees of freedom in the experiment itself? Or maybe it's all of reality, from the point of view of an observer trying to make sense of all historical evidence for the Born Rule. And it's unclear to me how carefully isolated an experiment would have to be for different orderings of its results to interfere with each other. Presumably the answer is "a lot", but what if it isn't?

If this is actually how nature works, I wonder if it's detectable somehow. What if you could isolate a particular experiment so much that you could suppress the interference of histories. Can you get the probabilities to become proportional to $$\| \alpha \|$$? Or maybe there is some measurable difference between the distribution of probabilities resulting from a random walk, compared to the normal distribution in classical probability? After all a "squared normal distribution" seems like it would fall off faster than a regular one.

Suffice to say I would love to know a) what's wrong with this argument, or b) if it exists or has been debunked in the literature somewhere, cause I haven't found anything.