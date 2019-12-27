---
layout: blog
title: "Born from Many Worlds"
footnotes: true
math: true
aside: true
tags: notes
---

The Many-Worlds Interpretation (MWI) of quantum mechanics is probably roughly correct. There is no reason to think that the rules of atomic phenomena would stop applying at larger scales when an experimenter becomes entangled with their experiment (kooky interjections about consciousness notwithstanding...). However, MWI has the problem that it does not easily explain why quantum randomness leads to the probabilities that we observe. The [Born Rule](https://en.wikipedia.org/wiki/Born_rule) says that if a system is in a state $$\alpha \| 0 \> + \beta \| 1 \>$$, upon 'measurement' (in which we entangle with one or the other outcome), we measure the eigenvalue associated with the state $$\| 0 \>$$ with probability

$$P[0] = \| \alpha \|^2$$

The Born Rule is normally included as an additional postulate in MWI, and this is somewhat unsatisfying. Or at least, it is apparently difficult to justify, given that I've read a bunch of attempts, each of which talks about how there haven't been any other satisfactory attempts. I think it would be unobjectionable to say that there is not a consensus on how to motivate the Born Rule from MWI without any other assumptions.

Anyway here's an argument I found that I find somewhat compelling? See what you think.

<!--more-->

-------

## 1. A classical coin

First let's think about classical probability, but write it in a notation suggestive of quantum mechanics. Suppose we're flipping a biased coin, and let's call its states $$\| H \> $$ and $$\| T \>$$ -- so the results of a coin flip are $$a \| H \> + b \| T \>$$ with $$a + b = 1$$. Upon $$n$$ iterations of classical coin-flipping we end up in state

$$(a \| H \> + b \| T \>)^n = \sum_k {n \choose k} a^k b^{n-k} \| H^k T^{n-k} \>$$

Where $$\| H^k T^{n-k} \>$$ means a state in which we have observed $$k$$ heads and $$n-k$$ tails (in any order).

Now suppose this whole experiment is being performed by a poor experimenter who's, like, locked in a box or something. The experimenter does the experiment, writes down what they think the probability of heads is, and then transmits _that_ to us, outside of the box. So the only value we end up seeing is the value of their _measurement_ of $$P[H] = a$$, which we'll call $$\hat{P}[H]$$. The best estimate that the experimenter can give, of course, is their observed frequency $$\frac{k}{n}$$, so we might say that the resulting system's states are identified by the probability perceived by the experimenter:

$$(a \| H \> + b \| T \>)^n = \sum_k {n \choose k} a^k b^{n-k} \| \hat{P}[H] = k/n\>$$

If you let $$n$$ get very large, the system with $$\hat{P}[H] = a$$ will end up having the highest-magnitude amplitude, and so we expect to end up in a 'universe' where the measurement of the probability $$a$$ converges on the true value of $$a$$. This is easily seen, because for large $$n$$ the binomial distribution $$B(n, a, b)$$ converges to a normal distribution $$\mathcal{N}(na, nab)$$ with mean $$na$$. So, asymptotically, the state $$\| \hat{P}[H] = \frac{na}{n} = a \>$$ becomes increasingly high-amplitude relative to all of the others.  This is a way of phrasing the law of large numbers.

I think this is as good an explanation as any as to what probability 'is'. Instead of trying to figure out what it means for _us_ to experience an infinite number of events and observe a probability, let's just let an experimenter who's locked in a box figure it out for us, and then just have them send us their results! Unsurprisingly, the experimenter does a good job of recovering classical probability.

--------

## 2. A quantum coin

Now let's try it for a quantum coin (okay, a qubit). The individual experiment runs are now given by $$\alpha \| 0 \> + \beta \| 1 \>$$ where $$\alpha, \beta$$ are probabilities amplitudes with $$\| \alpha \|^2 + \| \beta \|^2 = 1$$. Note that normalizing these to sum to 1 doesn't predetermine what the experienced probabilities are, and as we will see the normalization isn't necessary.

As before we generate a state that's something like:

$$(\alpha \| 0 \> + \beta \| 1 \>)^n$$

Where are things going to go differently? It looks like there are two steps that can be affected by the fact that we are now dealing with amplitudes instead of probabilities:

1. Can we still sum up all of the different orders to just be their _counts_? It's not clear that all of the orderings of, say, n $$\| 1 \>$$s and k $$\| 0 \>$$s should be considered as one state $${n \choose k} \| 0^k 1^{n-k} \>$$.
2. Can we still interpret a state $$\| 0^k 1^{n-k} \>$$ as being interpreted by the experimenter as $$\| P[0] = \frac{k}{n} \>$$?

It seems to me that (2) should be answered with 'yes', because there's no other alternative -- if an experimenter measures $$n$$ events and sees $$\| 0 \>$$ $$k$$ times, then they're going to write down that $$P[0] = \frac{k}{n}$$, even if they are one slice of a big quantum state.

(1), however, is less clear. A potential problem is that each of these measurement results could have different phases, and there is no reason to think that they will add up neatly -- there could be interference between different ways of getting the same result. I'm not totally sure this is reasonable, but it leads to an interesting result, so let's assume it is.

Consider running the experiment twice, but letting each $$\| 0 \>$$ state have a different have a different phase $$\alpha_i = \| \alpha \| e^{i \theta_1}$$. (We can ignore the $$\beta$$ phase without loss of generality by treating it as an overall coefficient to the entire wave function) 

The state we generate will be:

$$\begin{aligned} 
&(\alpha_1 \| 0 \> + \beta \| 1 \>) (\alpha_2 \| 0 \> + \beta \| 1 \>) \\
&= \alpha_1 \alpha_2 \| 0 0 \> + \alpha_1 \beta \| 0 1 \> + \beta \alpha_2 \| 1 0 \> + \beta^2 \| 1 1 \> \\
\end{aligned}$$

This is no longer a clean binomial distribution. Writing $$a = \| \alpha \|$$ and $$b = \| \beta \|$$ for clarity, the two-iteration wave function is:

$$= e^{i (\theta_1 + \theta_2) }  a^2 \| 0^2 \> + ab (e^{i \theta_1} + e^{i \theta_2}) \| 0^1 1^1 \> + b^2 \| 1^2 \>$$

And $$ab (e^{i \theta_1} + e^{i \theta_2}) \| 0^1 1^1 \>$$ only has the same magnitude as $$2ab \| 0^1 1^1 \>$$ when $$\theta_1 = \theta_2$$. So, if I haven't done anything egregiously wrong, there appears to be a sort of damping factor on the probability of states with multiplicity (which is basically all of them), due to the fact that the different ways of getting the same result may be out of phase with each other. States with many phase factors involved end up having a lower amplitude than they would if we were doing classical probability.

------

Now let's consider what this looks like as $$n \ra \infty$$.


For a state with $$k$$ $$\alpha\| 0 \>$$ terms, we end up with a sum of exponentials with $$k$$ phases in them: 

$$E_{k, n} = \sum_{I \in S_{k,n}} e^{i \sum_{i \in I} \theta_i}$$

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

These don't tell us the constant of proportionality, since $$\bb{E}[ \| E_{k, n} \|^2] \neq \bb{E}[ \| E_{k, n} \|]^2$$, but fortunately we only need to compute the value of $$k$$ at the peak. $$\| \psi \|$$ is hard to work with, but $$\| \psi \|^2$$ isn't:

$$\| \psi \|^2  \sim \sum {n \choose k} (a^2)^k (b^2)^{n-k} $$

This is a binomial distribution $$B(n, a^2, b^2) = B(n, \|\alpha\|^2, \| \beta \|^2)$$, which asymptotically looks like a normal distribution $$\mathcal{N}(n \| \alpha \|^2, n \| \alpha \|^2 \| \beta \|^2)$$ with maximum $$k = n \| \alpha \|^2$$, which means that the highest-amplitude state measures is:

$$\begin{aligned}
\| \hat{P}[0]= \frac{n \| \alpha \|^2}{n} \> = \| \hat{P}[0] = \| \alpha \|^2 \>
\end{aligned}$$

Thus we conclude that the observed probability of measuring $$\| 0 \>$$ when interacting with a system in state $$\alpha \| 0 \> + \beta \| 1 \>$$ is centered around $$\| \alpha \|^2$$, as reported by an experimenter in a box who runs the measurement many times, which is what we probably are anyway. And that's the Born Rule.

Ultimately this seems to be because different ways of seeing the same result interfere with each other, suppressing the amplitudes of seeing less uniform results by a factor of the square root of their multiplicity.

(Note that this argument should still work if $$\|\alpha \|^2 + \| \beta \|^2 \neq 1$$; the resulting asymptotic normal distribution will end up having mean $$\frac{n \| \alpha \|^2}{\| \alpha \|^2 + \| \beta \|^2}$$.)

So that's interesting.

------

It's unclear to me how carefully isolated an experiment would have to be for different orderings of its results to interfere with each other. Presumably the answer is "a lot", but what if it isn't? I'm intrigued, either way, by the fact that this type of calculation produces the right answer through a relatively elementary manipulation. I'm especially intrigued because I suspected it would work before calculating, and it did, which never happens...

Suffice to say I would love to know a) what's wrong with this argument (I feel like could be circular, but I haven't figured out how), or b) if it exists in the literature somewhere, cause I haven't found anything, although admittedly I didn't look very hard.

I can think of some strange implications of this argument but I don't want to get ahead of myself.

I would also kinda like to go to graduate school.