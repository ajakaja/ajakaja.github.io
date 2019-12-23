---
layout: blog
title: "Born from Many Worlds"
footnotes: true
math: true
aside: true
tags: notes
---

I'm not exactly a member the physics community, cause I just write blog posts for <strike>nobody</strike> myself, but I have gotten the impression that, these days, most physicists who care about the philosophical interpretations of quantum mechanics generally figure that the Many-Worlds Interpretation (MWI) is roughly correct, despite the fact that we haven't smoothed out some of the details around probabilities and decoherence. 

Basically MWI appears to apply to atomic phenomena and there is no reason to think it would stop applying at larger scales where an experimenter becomes entangled with their experiment (kooky interjections about consciousness notwithstanding...).[^note]

[^note]: Note: I'm referring to MWI as the idea that the universe is a superposition of states before, during, and after interactions, and that's all there is, with no special measurement process. I wouldn't phrase this as the universe "splitting into multiple universes", as is sometimes done.

However, MWI apparently does not easily explain why we observe the probabilities that we see in experiments. If a system is in state $$\alpha \| 0 \> + \beta \| 1 \>$$, upon 'measurement' (in which we entangle with one or the other outcome), we observe the outcome $$\| 0 \>$$ with probability

$$P[\, \| 0 \> \, ] = \frac{\| \alpha \|^2}{\| \alpha \|^2 + \| \beta \|^2}$$

(Or just $$\| \alpha \|^2$$ if the coefficients are normalized).

This is the [Born Rule](https://en.wikipedia.org/wiki/Born_rule), and it is apparently difficult to justify it from MWI, given that I've read a bunch of attempts, each of which talks about how there haven't been any other satisfactory attempts. At minimum it would be unobjectionable to say that there is not a consensus on how to motivate the Born Rule from MWI without any other assumptions.

Anyway here's an argument I found for it that I find kind of compelling? See what you think.

<!--more-->

-------

## 1. A classical coin

First let's think about classical probability, but write it in quantum notation because it's suggestive. Suppose we're flipping a biased coin, and let's call its states $$\| H \> $$ and $$\| T \>$$ -- so the results of a coin flip are $$a \| H \> + b \| T \>$$ with $$a + b = 1$$. Upon $$n$$ iterations of classical coin flipping we end up in state

$$(a \| H \> + b \| T \>)^n = \sum_k {n \choose k} a^k b^{n-k} \| H^k T^{n-k} \>$$

Where $$\| H^k T^{n-k} \>$$ means a state in which we have observed $$k$$ heads and $$n-k$$ tails.

Now suppose this whole experiment is being performed by a poor experimenter who's, like, locked in a box or something. The experimenter does the experiment, writes down what they think the probability of heads is, and then transmits _that_ to us, outside of the box. So the only value we end up seeing is the value of their _measurement_ of $$P[H] = a$$, which we'll call $$\hat{P}[H]$$ and is given by $$\hat{P}[H] = k/n$$. So the resulting system is

$$(a \| H \> + b \| T \>)^n = \sum_k {n \choose k} a^k b^{n-k} \| \hat{P}[H] = k/n\>$$

If you let $$n$$ get very large, the system with $$\hat{P}[H] = a$$ will end up having the largest 'amplitude', and so we expect to end up in a 'universe' where the measurement of $$a$$ converges on the value of $$a$$. This is easily seen, because for large $$n$$ the binomial distribution $$B(n, a, b)$$ converges to a normal distribution $$\mathcal{N}(na, nab)$$ with mean $$na$$. So, asymptotically, the state $$\| \hat{P}[H] = \frac{na}{n} = a \>$$ becomes increasingly high-amplitude relative to all of the others.

To me, this is as good an explanation as any as to what probability 'is'. Instead of trying to figure out what it means for _us_ to experience an infinite number of events and observe a probability, let's just let an experimenter who's locked in a box figure it out for us, and then just compute what result we see when they send us their results! Unsurprisingly, the experimenter does a good job of recovering classical probability.

--------

## 2. A quantum coin

Now let's try it for a quantum coin (okay, a qubit). The individual experiment runs are now given by $$\alpha \| 0 \> + \beta \| 1 \>$$ where $$\alpha, \beta$$ are probabilities amplitudes with $$\| \alpha \|^2 + \| \beta \|^2 = 1$$. Note that normalizing these to sum to 1 doesn't predetermine what the experienced probabilities are, and as we will se the normalization isn't necessary.

As before we generate a state that's something like:

$$(\alpha \| 0 \> + \beta \| 1 \>)^n$$

Where are things going to go differently? There are basically two steps that can be affected by the fact that we are now dealing with amplitudes instead of probabilities:

1. Can we still sum up all of the different orders to just be their _counts_? It's not clear that all of the orderings of, say, n $$\| 1 \>$$s and k $$\| 0 \>$$s should be considered as one state $${n \choose k} \| 0^k 1^{n-k} \>$$.
2. Can we still interpret a state $$\| 0^k 1^{n-k} \>$$ as being interpreted by the experimenter as $$\| P[0] = \frac{k}{n} \>$$?

It seems to me that (2) should be answered with 'yes', because there's no other alternative -- if an experimenter measures $$n$$ events and sees $$\| 0 \>$$ $$k$$ times, then they're going to write down that $$P[0] = \frac{k}{n}$$, even if they are one slice of a big quantum state.

(1), however, is less clear. A potential problem is that each of these measurement results could have phases, and there is no reason to think that they will add up neatly.[^crux] Consider running the experiment twice. The state we general will be:

[^crux]: This is the crux of the whole argument, and it directly induces the result. I'm really not sure that it's credible but let's proceed as though it is.

$$\begin{aligned} 
&(\alpha_1 \| 0 \> + \beta_1 \| 1 \>) (\alpha_2 \| 0 \> + \beta_2 \| 1 \>) \\
&= \alpha_1 \alpha_2 \| 0 0 \> + \alpha_1 \beta_2 \| 0 1 \> + \beta_1 \alpha_2 \| 1 0 \> + \beta_1 \beta_2 \| 1 1 \> \\
\end{aligned}$$

But this is _not_ a clean binomial distribution. It's clearer if we separate the phases out, writing $$\alpha = a e^{i \theta_{\alpha}}$$ and $$\beta = b e^{i \theta_{\beta}}$$.

$$\alpha_1 \| 0 \> + \beta_1 \| 1 \> = a e^{i \theta_{\alpha}} \| 0 \> +  b e^{i \theta_{\beta}} \| 1 \> $$

Without loss of generality we can let factor out all of the $$\theta_{\beta}$$ phases by writing this as 

$$e^{i \theta_{\beta}} [ e^{i \theta}  a  \| 0 \> +   b\| 1 \>]$$

Where $$\theta = \theta_{\alpha} - \theta_{\beta}$$. The $$e^{i \theta_{\beta}}$$ term can just be ignored entirely, because it just multiples the resulting state of the whole experiment by that phase. So our two-iteration experiment wavefunction is:

$$e^{i (\theta_1 + \theta_2) }  a^2 \| 0^2 \> + ab (e^{i \theta_1} + e^{i \theta_2}) \| 0^1 1^1 \> + b^2 \| 1^2 \>$$

And $$ab (e^{i \theta_1} + e^{i \theta_2}) \| 0^1 1^1 \>$$ only has the same magnitude as $$2ab \| 0^1 1^1 \>$$ when $$\theta_1 = \theta_2$$. So, if I haven't done anything egregiously wrong, there appears to be a sort of damping factor on the probability of states with multiplicity (which is almost all of them), due to the fact that the different results may be out of phase with each other. States with many phase factors involved end up having a lower amplitude than they would if we were doing classical probability.

This has the effect of making the amplitudes of states closer to the center of the distribution _lower_ -- but by how much? 

------

## 3. A calculation

For a state with $$k$$ copies of $$a$$, we end up with a sum of exponentials with $$k$$ phases in them: 

$$E_{k, n} = \sum_{I \in S_{k,n}} e^{i \sum_{i \in I} \theta_i}$$

Here $$S_{k,n}$$ is the set of $$k$$-element subsets of $$n$$ elements. For instance if $$k=2, n=3$$:

$$E_{2, 3} = e^{i(\theta_1 + \theta_2)} + e^{i(\theta_2 + \theta_3)} + e^{i(\theta_1 + \theta_3)}$$

Our distribution for $$n$$ iterations of the experiment is given by

$$\psi = \sum_k a^k b^{n-k} E_{k, n} \| 0^k  1^{n-k} \> = \sum_k a^k b^{n-k} E_{k, n} \| \hat{P}[0] = \frac{k}{n} \>$$

The classical version of this is a binomial distribution because $$E_{k, n}$$ is replaced with $${n \choose k}$$. The quantum version observes some cancellation. Still, we want to know: as $$n \ra \infty$$, what value of $$k$$ dominates?

We are assuming that all of the $$\theta_i$$ are randomly distributed, which gives $$\bb{E}[e^{i \theta}] = 0$$ and therefore $$\bb{E}[E_k] = 0$$ for all $$k$$. But this doesn't mean that the expected _amplitude_ is 0, just like how the expected magnitude of displacement in a random walk is not $$0$$.

For $$k=1$$ this is just a random walk in the complex plane, and the expected amplitude of a random walk is [well-known](http://mathworld.wolfram.com/RandomWalk2-Dimensional.html) to be given by $$\bb{E}[ \| E_{1, n} \|^2 ] = n$$. Briefly, this comes from the fact that

$$\begin{aligned}

\< \sum_i e^{i \theta_i} \| \sum_j e^{i \theta_j} \> &= \sum \| e^{i \theta_i} \|^2 + \sum_{i < j} e^{- i \theta_i} e^{i \theta_j} \\
&= n + \bb{E}[ \< e^{-i \theta_1} \| e^{i \theta_2} \> ] \\
&= n
\end{aligned}$$

(The second term drops out because it is just the expectation of $$e^{i (\theta_2 - \theta_1)}$$). This is also basically a complex version of linearity of variance: $$\bb{E} [ \| E_{1, n} \|^2 ] = n \bb{E} [ \| e^{i \theta} \| ^2 ] = n$$.

This means that the magnitude of the $$k=1$$ term for our quantum coin is proportional to $$\sqrt{n}$$. For comparison, in classical probability it is $${ n \choose 1 } = n$$.

For $$k > 1$$, the same argument applies, except that there are $${ n \choose k }$$ terms in the sum, so in every case we get an expected amplitude $$\bb{E} [ \| E_{k, n} \|] = \sqrt{ n \choose k}$$.

------

Therefore, for large $$n$$, our poor experimenter's wave function goes like

$$\psi = \sum_k a^k b^{n-k} \sqrt{n \choose k} \| \hat{P}[0] = \frac{k}{n} \>$$

So...

What's the value of $$k$$ at the peak? I have no idea how to compute the maximum value of a binomial distribution whose coefficients are square-rooted, but I do know how to compute the max of $$\| \psi \|^2$$:

$$\< \psi, \psi \> = \sum {n \choose k} (a^2)^k (b^2)^{n-k} $$

This is a binomial distribution $$B(n, a^2, b^2) = B(n, \|\alpha\|^2, \| \beta \|^2)$$, which asymptotically looks like a normal distribution $$\mathcal{N}(n \| \alpha \|^2, n \| \alpha \|^2 \| \beta \|^2)$$, and has its maximum at $$n \| \alpha \|^2$$, which means that at the peak the experiment measures the probability as:

$$\begin{aligned}
&\| \hat{P}[0]= \frac{n \| \alpha \|^2}{n} \> \\
&= \| \hat{P}[0] = \| \alpha \|^2 \>
\end{aligned}$$

Thus we conclude that the probability of measuring $$\| 0 \>$$ when interacting with a system in state $$\alpha \| 0 \> + \beta \| 1 \>$$ is $$\| \alpha \|^2$$, as reported by an experimenter in a box who runs this many times, which is what we probably are anyway. 

Ultimately this seems to be because different ways of seeing the same result interfere with each other, suppressing the amplitudes of seeing less uniform results by a square-root factor.

Note that this argument works if $$\alpha^2 + \beta^2 \neq 1$$; the resulting asymptotic normal distribution will end up having mean $$\frac{n \| \alpha \|^2}{\| \alpha \|^2 + \| \beta \|^2}$$.

If this is valid, there are some strange implications that I'll try to explore another time. Among other things it certainly casts frequentism in a strange light.

-----

## 4. Addendum

Suffice to say I would love to know a) what's wrong with this argument (I feel like it is probably circular, but I'm not sure how), or b) if it exists in the literature somewhere, cause I haven't found anything, although admittedly I didn't look very hard.

I would also kinda like to go to graduate school.