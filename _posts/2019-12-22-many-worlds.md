---
layout: blog
title: "A possible way to get the Born Rule in Many Worlds"
footnotes: true
math: true
aside: true
tags: notes
---

The Many-Worlds Interpretation (MWI) of quantum mechanics is probably roughly correct. There is no reason to think that the rules of atomic phenomena would stop applying at larger scales when an experimenter becomes entangled with their experiment (kooky interjections about consciousness notwithstanding...).

However, MWI has the problem that it does not easily explain why quantum randomness leads to the probabilities that we observe. The [Born Rule](https://en.wikipedia.org/wiki/Born_rule) says that if a system is in a state $$\alpha \| 0 \> + \beta \| 1 \>$$, upon 'measurement' (in which we entangle with one or the other outcome), we measure the eigenvalue associated with the state $$\| 0 \>$$ with probability

$$P[0] = \| \alpha \|^2$$

The Born Rule is normally included as an additional postulate in MWI, and this is somewhat unsatisfying. Or at least, it is apparently difficult to justify, given that I've read a bunch of attempts, each of which talks about how there haven't been any other satisfactory attempts. I think it would be unobjectionable to say that there is not a consensus on how to motivate the Born Rule from MWI without any other assumptions.

Anyway here's an argument that I find somewhat compelling? See what you think.

<!--more-->

-------

## 1. A classical coin

First let's think about classical probability, but write it in a notation suggestive of quantum mechanics. Suppose we're flipping a biased coin that gets heads with probability $$P[H] = p$$ and $$P[T] = q$$. Let's call its states $$\| H \> $$ and $$\| T \>$$, so the results of a coin flip are written as $$p \| H \> + q \| T \>$$ with $$p + q= 1$$. Upon $$n$$ iterations of classical coin-flipping we end up in state

$$(p \| H \> + q \| T \>)^n = \sum_k {n \choose k} p^k q^{n-k} \| H^k T^{n-k} \>$$

Where $$\| H^k T^{n-k} \>$$ means a state in which we have observed $$k$$ heads and $$n-k$$ tails (in any order).

Now suppose this whole experiment is being performed by a poor experimenter who's, like, locked in a box or something. The experimenter does the experiment, writes down what they think the probability of heads is, and then transmits _that_ to us, outside of the box. So the only value we end up seeing is the value of their _measurement_ of $$P[H] = p$$, which we'll call $$\hat{P}[H]$$. The best estimate that the experimenter can give, of course, is their observed frequency $$\frac{k}{n}$$, so we might say that the resulting system's states are identified by the probability perceived by the experimenter:

$$(p \| H \> + q \| T \>)^n = \sum_k {n \choose k} p^k q^{n-k} \| \hat{P}[H] = k/n\>$$

If you let $$n$$ get very large, the system with $$\hat{P}[H] = p$$ will end up having the highest-magnitude amplitude, and so we expect to end up in a 'universe' where the measurement of the probability $$p$$ converges on the true value of $$p$$. This is easily seen, because for large $$n$$ the binomial distribution $$B(n, p, q)$$ converges to a normal distribution $$\mathcal{N}(np, npq)$$ with mean $$np$$. So, asymptotically, the state $$\| \hat{P}[H] = \frac{np}{n} = p \>$$ becomes increasingly high-amplitude relative to all of the others.  This is a way of phrasing the law of large numbers.

I think this is as good an explanation as any as to what probability 'is'. Instead of trying to figure out what it means for _us_ to experience an infinite number of events and observe a probability, let's just let an experimenter who's locked in a box figure it out for us, and then just have them send us their results! Unsurprisingly, the experimenter does a good job of recovering classical probability.

--------

## 2. A quantum coin

Now let's try it for a quantum coin (okay, a qubit). The individual experiment runs are now given by $$\alpha \| 0 \> + \beta \| 1 \>$$ where $$\alpha, \beta$$ are probability amplitudes with $$\| \alpha \|^2 + \| \beta \|^2 = 1$$. Note that normalizing these to sum to 1 doesn't predetermine what the experienced probabilities are, and as we will see the normalization isn't necessary.

As before we generate a state that's something like:

$$(\alpha \| 0 \> + \beta \| 1 \>)^n$$

Where are things going to go differently? A potential problem is that each of the measurement results that comprise a $$\| P = \frac{k}{n} \>$$ macrostate could have different phases, and there is no reason to think that they will add up neatly -- there could be interference between different ways of getting the same result. I'm not totally sure this is reasonable, but it leads to an interesting result, so let's assume it is.

Consider running the experiment twice, but letting each $$\| 0 \>$$ state have a different have a different phase $$\alpha_j = \| \alpha \| e^{i \theta_j}$$. (We can ignore the $$\beta$$ phase without loss of generality by treating it as an overall coefficient to the entire wave function) 

The state we generate will be:

$$\begin{aligned} 
&(\alpha_1 \| 0 \> + \beta \| 1 \>) (\alpha_2 \| 0 \> + \beta \| 1 \>) \\
&= \alpha_1 \alpha_2 \| 0 0 \> + \alpha_1 \beta \| 0 1 \> + \beta \alpha_2 \| 1 0 \> + \beta^2 \| 1 1 \> \\
\end{aligned}$$

This is no longer a clean binomial distribution. Writing $$a = \| \alpha \|$$ and $$b = \| \beta \|$$ for clarity, the two-iteration wave function is:

$$= e^{i (\theta_1 + \theta_2) }  a^2 \| 0^2 \> + ab (e^{i \theta_1} + e^{i \theta_2}) \| 0^1 1^1 \> + b^2 \| 1^2 \>$$

And $$ab (e^{i \theta_1} + e^{i \theta_2}) \| 0^1 1^1 \>$$ only has the same magnitude as $$2ab \| 0^1 1^1 \>$$ when $$\theta_1 = \theta_2$$. 

----

## 3. Random Walks in Phase Space

Now let's consider what this looks like as $$n \ra \infty$$.

For a state with $$k$$ $$\alpha\| 0 \>$$ terms, we end up with a sum of exponentials with $$k$$ phases in them: 

$$E_{k, n} = \sum_{J \in S_{k,n}} e^{i \sum_{j \in J} \theta_j}$$

Here $$S_{k,n}$$ is the set of $$k$$-element subsets of $$n$$ elements. For instance if $$k=2, n=3$$:

$$E_{2, 3} = e^{i(\theta_1 + \theta_2)} + e^{i(\theta_2 + \theta_3)} + e^{i(\theta_1 + \theta_3)}$$

Our wave function for $$n$$ iterations of the experiment is given by

$$\psi = \sum_k a^k b^{n-k} E_{k, n} \| 0^k  1^{n-k} \> = \sum_k a^k b^{n-k} E_{k, n} \| \hat{P}[0] = \frac{k}{n} \>$$

The classical version of this is a binomial distribution because $$E_{k, n}$$ is replaced with $${n \choose k}$$. The quantum version observes some cancellation. We want to know: as $$n \ra \infty$$, what value of $$k$$ dominates?

We don't know anything the phases themselves, so we'll treat them as classical independent random variables. This means that $$\bb{E}[e^{i \theta}] = 0$$ and therefore $$\bb{E}[E_{k, n}] = 0$$ for all $$k$$. But the expected _magnitude_ is not 0. The sum of all of these random vectors forms a random walk in the complex plane, and the expected amplitude of a random walk is [given](http://mathworld.wolfram.com/RandomWalk2-Dimensional.html) by $$\bb{E}[ \| E_{1, n} \|^2 ] = n$$. 

Briefly: this comes from the fact that

$$\begin{aligned}

\bb{E}[ \| E_{1, n} \|^2 ] &= \bb{E} [ \sum_i e^{- i \theta_i} \| \sum_j e^{i \theta_j} ] \\
&= \bb{E} \sum_i \| e^{i \theta_i} \|^2 + \bb{E} \sum_{i \neq j} e^{- i \theta_i} e^{i \theta_j} \\
&= n \bb{E}[1] + \sum_{i \neq j} \bb{E}[e^{i (\theta_i - \theta_j)}] \\
&= n
\end{aligned}$$


This means that the magnitude of the $$k=1$$ term for our quantum coin is proportional to $$\sqrt{n}$$, rather than the classical value of $$n$$.

For $$k > 1$$, the same argument applies (it's still basically a random walk), except that there are $${ n \choose k }$$ terms in the sum, so in every case we get an expected amplitude $$\bb{E} [ \| E_{k, n} \|^2 ] = { n \choose k }$$.

------

## 4. The Born Rule

These don't tell us the constant of proportionality, since $$\bb{E}[ \| E_{k, n} \|^2] \neq \bb{E}[ \| E_{k, n} \|]^2$$, but fortunately we only need to compute the value of $$k$$ at the peak, and we can find that using $$\| \psi \|^2$$, which is easy to work with:

$$\| \psi \|^2  \sim \sum {n \choose k} (a^2)^k (b^2)^{n-k} $$

This is a binomial distribution $$B(n, a^2, b^2) = B(n, \|\alpha\|^2, \| \beta \|^2)$$, which asymptotically looks like a normal distribution $$\mathcal{N}(n \| \alpha \|^2, n \| \alpha \|^2 \| \beta \|^2)$$ with maximum $$k = n \| \alpha \|^2$$, which means that the highest-amplitude state measures is:

$$\begin{aligned}
\| \hat{P}[0]= \frac{n \| \alpha \|^2}{n} \> = \| \hat{P}[0] = \| \alpha \|^2 \>
\end{aligned}$$

Thus we conclude that the observed probability of measuring $$\| 0 \>$$ when interacting with a system in state $$\alpha \| 0 \> + \beta \| 1 \>$$ is centered around $$\| \alpha \|^2$$, as reported by an experimenter in a box who runs the measurement many times, which is what we probably are anyway. And that's the Born Rule.

Ultimately this seems to be because different ways of seeing the same result interfere with each other, suppressing the amplitudes of seeing less uniform results by a factor of the square root of their multiplicity.

(Note that this argument should still work if $$\|\alpha \|^2 + \| \beta \|^2 \neq 1$$; the resulting asymptotic normal distribution will end up having mean $$\frac{n \| \alpha \|^2}{\| \alpha \|^2 + \| \beta \|^2}$$.)

So that's interesting.

I find the argument that "random walks in phase space might lead to a peak amplitude that matches the Born Rule" to be suspiciously clean, and therefore compelling, but I don't any confidence that I've correctly identified what might actually lead to the random interference in this experiment. Is it the experimental apparatus interfering with itself? Is it hidden degrees of freedom in the experiment itself? Or maybe it's all of reality, from the point of view of an observer trying to make sense of all historical evidence for the Born Rule. And it's unclear to me how carefully isolated an experiment would have to be for different orderings of its results to interfere with each other. Presumably the answer is "a lot", but what if it isn't?

Suffice to say I would love to know a) what's wrong with this argument (maybe it's circular, but I haven't figured out how), or b) if it exists in the literature somewhere, cause I haven't found anything, although admittedly I didn't look very hard.

I can think of some strange implications of this argument but I don't want to get ahead of myself.

I should go to graduate school.