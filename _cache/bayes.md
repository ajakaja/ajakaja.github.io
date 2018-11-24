---
layout: article
title: "Bayes notes"
math: true
aside: true
footnotes: true
---

## 1. Bayes

From basic probability we know that:

$$P(A \and B) = P(A | B) P(B) \\
= P(B | A) P(A)$$

Giving Bayes' Theorem:

$$P(A | B) = P(A) \frac{P(B | A) }{P(B)} \tag{1}$$

The first thing I have learned about "Bayesianism" is that it only shares a name with Bayes' Theorem. The theorem is more fundamental than any particular intepretation of probability theory; it is a simple mathematical relationship between formal values.

Another mathematical relationship is that we can expand the $$P(B)$$ term in the denominator via:

$$P(B) = P(B | A) P(A) + P(B | \neg A) P(\neg A)$$

This gives:

$$P(A | B) = \frac{P(B | A) P(A)}{P(B | A) P(A) + P(B | \neg A) P(\neg A)} \tag{Bayes}$$

----------------

Next, we formulate Bayesian _Inference_.

We interpret $$P(A \| B)$$ as "having learned the new information $$B$$, what do we think the probability of $$A$$ is?". Let's relabel: $$A \ra H$$ for 'hypothesis' and $$B \ra E$$ for 'evidence':

$$P(H | E) = P(H) \frac{P(E | H) }{P(E)}$$

$$P(H)$$ is called the **prior probability** of $$H$$: the probability we assume in a vacuum with no additional knowledge. Sometimes it's just called the **prior**.

$$P(H \| E)$$ is called the **posterior probability** of $$H$$: the probability after we have incorporated our knowledge of $$E$$.

The $$P(E \| H)$$ term is called the **likelihood**: supposing $$H$$ were true, how likely would evidence $$E$$ have been?

The term $$\frac{P(E \| H)}{P(E)}$$ together serves to _update_ the value of $$P(H)$$: formally we thought the probability was $$P(H)$$, now we think it's $$P(H \| E) = P(H) \frac{P(E \| H) }{P(E)}$$.

The process of incorporating this new information $$E$$ to compute $$P(H \| E)$$ is called a Bayesian Update. 

The classical example is in dealing with false positives from a diagnostic test:

If $$\frac{1}{6}$$ of a cohorot of people are sick, and the test identifies sick people as sick $$\frac{10}{11}$$ of the time, but identifies healthy people as sick $$\frac{1}{11}$$ of the time, then if you got a positive test, the probability you actually have are actually sick is:

$$\begin{aligned} 
P(H | E) &= P(H) \frac{P(E | H) }{P(E)} \\
&= \frac{1}{6} \frac{\frac{10}{11}}{\frac{1}{6} \frac{10}{11} + \frac{5}{6} \frac{1}{11}} 
= \frac{10}{10+5} = \frac{2}{3} 
\end{aligned}$$

But in fact, this turns out to be a fairly unwieldy way of thinking about the process. To my surprise, "odds" work way better.

---------

## 2. Odds

It is also possible to express probabilities in the form of _Odds_. I have long had trouble understanding why anyone would want to do this, but I might have figured it out: it's because it miraculously makes the Bayesian inference process much simpler.

If an event $$X$$ occurs with probability $$P(X) = \frac{1}{3}$$, then in $$N$$ tests you would expect (asympotically) to see $$X$$ occur $$\frac{N}{3}$$ times. This is equivalent to saying that the _odds_ of $$X$$ are $$1:2$$, which means that the rates of $$X$$ to $$\neg X$$ happen with a $$1:2$$ ratio -- for every $$X$$ you expect to see (asympotically) $$2$$ instances of $$\neg X$$.

In general, an odds $$O(X) = a:b$$ corresponds to a probability $$P(X) = \frac{a}{a+b}$$. $$P(X)$$ measures the rate of $$X$$ compared to _all outcomes_. $$O(X)$$ measures the rate of $$X$$ compared to $$\neg X$$. In a sense they're two versions of the same thing:

$$P(X) \lra  O(X : X \text{ or } \neg X)$$

while if we just talk about the 'odds' of $$X$$, we mean:

$$O(X) \lra O(X : \neg X)$$

The $$\frac{P(E \| H) P(H)}{P(E \| H) P(H) + P(H \| \neg H) P(\neg H)}$$ term in Bayes' theorem can be written as an odds ratio like this: 

$$P(E \| H) P(H) : P(E \| \neg H) P(\neg H)$$

... which actually seems to clean up some of the redundancy in it, our first sign that odds might be useful here. In fact we prefer to factor it into two parts:

$$= \frac{P(E \| H)}{P(E \| \neg H)} P(H) : P(\neg H)$$

Like probabilities, we can divide through by factors without affecting the meaming of the result. In fact, let's do it again to rewrite $$P(H) : P(\neg H)$$ directly as an odds:

$$= \frac{P(E \| H)}{P(E \| \neg H)} O(H : \neg H)$$

This is **Bayes' Theorem, Odds Ratio form**:

$$O(H | E : \neg H \| E) = \frac{P(E | H)} {P(E | \neg H)} O(H : \neg H)$$

Read aloud:

The **posterior odds** $$O(H \| E : \neg H : E) $$ of $$H : \neg H$$ given evidence $$E$$ is equal to the **prior odds** $$O(H : \neg H)$$ times the **relative likelihood** $$\frac{P(E \| H)} {P(E \| \neg H)}$$.

Note: odds, in general, work something like _rates_. The term $$\frac{P(E \| H)} {P(E \| \neg H)}$$ is not exactly interpretable as an odds (the odds of what?), but it's interpretable as a rate: the rate _of_ "the rates of $$E$$ given $$H$$", vs "the rate of $$E$$ given $$\neg H$$". If we allow ourselves to write any ratio of rates as an odds:

$$O(H | E : \neg H \| E) = O (E | H : E | \neg H) O(H : \neg H)$$

Finally, I find it useful to just write odds as fractions anyway:

$$\frac{(H | E)}{(\neg H | E)} = \frac{(E | H)}{(E | \neg H)} \frac{(H)}{(\neg H)}$$



---------

$$\frac{(H)}{(\neg H)}$$ is the **prior odds**: the relative rates we initially think $$H$$ and $$\neg H$$ take.

$$\frac{(H \| E)}{(\neg H \| E)}$$ is the **posterior odds**: what do we think the rates of $$H : \neg H$$ are, having learned $$E$$?

The ratio $$\frac{(E \| H)}{(E \| \neg H)}$$ is called the **relative likelihood**, and tells us how to update the rates according to the evidence $$E$$.

Because we're using odds, the Bayesian update process is simple multiplication. Bayesian update in Odds form:

$$\text{posterior odds} = \text{prior odds } \times \text{ relative likelihood}$$

It's easy to do in our heads. The classic example gain:

$$\frac{1}{6}$$ of people are sick, so $$\frac{(H)}{(\neg H)}$$ = $$\frac{1}{5}$$. The test reports sick people as sick $$\frac{10}{11}$$ of the time, but healthy people as sick $$\frac{1}{11}$$ of the time, so $$\frac{(E \| H)}{(E \| \neg H)} = \frac{10/11}{1/11}$$. Finally:

$$\frac{(H \| E)}{(\neg H \| E)} = 10 \times \frac{1}{5} = 2$$

And $$2:1$$ odds means $$P(H \| E) = \frac{2}{3}$$.

This is _much easier_ to do on the fly then the probability version, and much more intuitive -- once you get the hang of thinking in terms of rates, which takes a bit of getting used to.

------

## In practice

You usually begin with a guess (a prior) for the probability of some hypothesis $$H$$, which you turn into an odds:

$$\frac{(H)}{(\neg H)} = O(H : \neg H) = P(H) : P(\neg H)$$

Then you go through your life or experiment or whatever, finding observations $$\vec{E} = \{ E_i \} $$, which have different rates of occurring for $$H$$ vs. $$\neg H$$, causing updates:

$$\frac{(H | \vec{E} )}{(\neg H | \vec{E} )} = \frac{(H)}{(\neg H)} \prod_i \frac{(E_i, H)}{(E_i, \neg H)}$$

Which amounts to:

$$\text{currently belief ratio} = \text{prior} \times \prod_i \text{ratios from } E_i$$

Some entailments:

1. If each thing you see occur is more likely to occur for $$H$$ than for $$\neg H$$, then your belief in $$H$$ gets higher and higher, approaching but never reaching infinity.
2. If you ever see something happen which is _impossible_ if $$H$$, ie has odds $$0: x$$, then you no longer believe in $$H$$, no matter what. 
3. Your prior permanently weights your resulting odds, no matter how many observations you see.
4. There is no difference between seeing one or many observations if they multiply out to the same rates of occurence for $$H$$ vs $$\neg H$$.
5. To make an unlikely claim $$H$$ seem _more_ likely than you started out, you need likelihood ratios which at least the inverse of your current believe. IE if you currently think the ratio is $$2:5$$, you need ratios $$> 5:2$$ to start inverting that.

There is no requirement, either, that you only consider $$H$$ and $$\neg H$$. You can have an entire family of (exlcusive) hypotheses $$H_j$$. Fractions are only good at expressing one or the other, but ratios, in general, can be between more than two terms: $$H_1 : H_2 : H_3$$.

The procedure of 'inference' as performed by human intuition is assumed / understood to be an analog approximation to this. One useful fact though, is that you can perform the calculation even if you don't have 'every available hypothesis'. Bayesian updating updates the _relative likelihoods_ of hypotheses, but it doesn't make any claim as to their absolute likelihood. If you get a new hypothesis later you are free to re-evaluate old evidence in light of it and add it to the mix.

---------

It can be easier to think in **log odds**, which makes all the math additive:

$$\log (H | \vec{E}) - \log (\neg H | \vec{E}) = \log H - \log \neg H + \sum_i \log(E_i, H) - \log(E_i, \neg H)$$

This will be easiest is your rates are all given as ratios of powers of the same number. How would that work?

It's easy if you're counting the number of ways things can happen. If there are $$2$$ ways that $$H$$ can happen and $$4$$ ways that $$\neg H$$ can happen, then $$\log_2 \frac{H}{\neg H} = 
\log 2 - \log 4 = -1$$. To get back to an odds ratio, compute $$2^{-1} = \frac{1}{2} = 1:2 \lra P(H) = \frac{1}{3}$$.

In log odds, if $$A$$ is "twice as likely as" $$B$$, then $$\log (A) = 1 + \log (B) $$; you're doing something like adding up "how many times is $$A$$ twice as likely as $$B$$", which isn't too bad to do in your head.

-------

## 3. Conservation of Expected Evidence

Given a current belief ratio $$H : \neg H$$, after a test observation in which we see $$E$$ we update the posterior probability to:

$$P(H | E) = P(E | H) P(H) + P(E | \neg H) P(\neg H)$$

If we instead see $$\neg E$$, then we update to:

$$P(H | \neg E) = P(\neg E | H) P(H) + P(\neg E | \neg H) P(\neg H)$$

We also know, though, that $$P(H)$$ is:

$$P(H) = P(H | E) P(E) + P(H | \neg E) P(\neg E)$$

We can interpret this in an interesting way. Since $$P(E)$$ and $$P(\neg E)$$ are fixed constants, this is an expectation value of $$P(H)$$ after the observation of $$E$$ or $$\neg E$$: $$\bb{E}[P(H)]$$. $$P(H)$$, our _prior_ for $$H$$, is also fixed, though. That means that if $$P(H \| E)$$ increases, then $$P(H \| \neg E)$$ _decreases_ proportionally. Specifically:

$$\D P(H | E) P(E) = - \D P(H | \neg E) P(\neg E)$$

This has been called **conservation of expected evidence**. If seeing $$E$$ makes you think that $$H$$ is _more_ likely, then seeing $$\neg E$$ _must_ make you think that $$H$$ is _less_ likely. Moreover, if you already believe that $$P(H)$$ is the true probability of $$H$$, then you don't _expect_ evidence to change your opinion on that _at all_ -- the expected change $$\D P(H)$$ is $$0$$.

Of course, if you're _wrong_ about $$P(H)$$, then on average in reality you will change your mind after $$E$$. The point is, though, that if you _expected_ to change your mind upon observing $$E$$ in one direction or another, you could just imagine testing $$E$$ and make the change anyway. You already know enough to update your prior without doing another experiment.

More [here](https://www.lesswrong.com/posts/jiBFC7DcCrZjGmZnJ/conservation-of-expected-evidence), including the delightful real-life example that if living a sinful life makes a medieval woman more likely to be a witch, then living a virtuous life _must_ make a medieval woman _less_ likely to be a witch.

------

## Frequentism

Inference is sometimes framed as having two ideological camps: frequentist and Bayesian. Frequentist statistics includes such ideas as $$p$$-values and confidence intervals and the like.

Regardless of that ideological battle, it's useful to figure out where frequentist statistics like confidence intervals and P-values fit into the framework of Bayesian inference. I believe the explanation is: frequentist statistics only give the probability of results conditioned on hypotheses, never the _probability of hypotheses_. The hypothesis's probability is commonly then _deduced via intuition_, using the frequentist statistic as the 'experiment'. Bayesianism can make this step mathematical.

Here is how you represent frequentism in light of Bayes:

A $$p$$-value fundamentally says that "Given a (null) hypothesis $$H$$, the observed data $$E$$ has probability $$P(E \| H)$$". A study which reports a $$p$$-value implicitly says "see how small that number is? surely that makes you doubt that $$H$$ is true!". In fact, what's omitted is the _explicit_ step of computing, using that value:

$$P(H | E) = P(E | H) \frac{P(H)}{P(E)}$$

Since this step is omitted, it's not necessary to ever discuss the prior probability $$P(H)$$. Your intuitive inference, upon reading the $$p$$-value $$P(E \| H)$$, is to imagine that $$P(H)$$ is maybe sort of likely, maybe not, but regardless having seen the (hopefully miniscule) value of $$P(E \| H)$$, you certainly should change your perceived value of $$P(H)$$ by that factor.



Of course, it's enormously important what $$P(E)$$ is. Or rather, it's important how much higher $$P(E \| H)$$ is than $$P(E \| \neg H)$$. Assuming $$P(E \| H) \neq 0$$ and $$P(H) \neq 0$$:

$$P(H | E) = \frac{ P(E | H) P(H)  }{P(E | H)P(H) + P(E | \neg H) P(\neg H)} = \frac{1}{1 + \frac{P(E \| \neg H)}{P(E \| H)} \frac{P(\neg H)}{P( H)}}$$

This forms makes it somewhat easier to see what's going on. The value $$P(E \|H )$$ is the $$p$$-value; but the other values are not usually available.

But we can imagine: supposing that the $$p$$-value is very low, with some additional assumptions:

1. $$P(E \| \neg H)$$ is not very small compared to $$P(E \| H)$$, so $$\frac{P(E \| \neg H)}{P(E \| H)} \gg 1$$
2. the prior odds $$ \frac{P(\neg H)}{P( H)}$$ are _not_ small enough to matter, meaning that it's also true that $$\frac{P(E \| \neg H)}{P(E \| H)} \frac{P(\neg H)}{P( H)} \gg 1$$.

.. _only then_ is it true that $$P(H \| E) =\frac{1}{1 + \frac{P(E \| \neg H)}{P(E \| H)} \frac{P(\neg H)}{P( H)}} \ll 1$$, from which you conclude that

> evidence $$E$$ indicates that $$H$$ is very likely not to be true

What this shows is that frequentism doesn't manage to _avoid_ dealing with priors; it just avoids the issue entirely by leaving you to do that step in your head. Which is fine if the priors are obvious, or if you collect enough information that $$ \frac{P(E \| \neg H)}{P(E \| H)}$$ is so massive that your prior probability almost doesn't matter at all.

-------

## 4. Priors

How do you calculate a prior if it _does_ matter?

For scientific experiments like "determining which hypothesis is true", I tend to take the opinion that if your precise choice of prior matters, then you're already in dangerous territory. If a statement $$H$$ about reality is _unequivocally true_, then you should be able to collect, given enough time and money, _enough_ information supporting $$H$$ to overcome _any_ prior probability. If you find your results' persuasiveness to be dependent on whether your prior odds are $$1:2$$ or $$1:20$$, then it seems likely that you really don't have enough data to say anything convincing anyway. When choosing what to _believe_ that you really want to just have one theory rise to the top and be obviously the best.

But suppose you're gambling, or doing _anything_ which has numeric values expected with probabilities, and you want to win. Well, you don't get to just say "well, priors shouldn't matter". In _real_ calculations, they do matter. When choosing _what the distribution of possible states of the world is_, then you start with a distribution of hypotheses and update your way to a better one, and then take action based on it, and if you do this perfectly you will have the highest possible expected returns.

Suppose you have narrowed everything down to two theories about the stock price of a company, $$A$$ and $$B$$. You start with priors and update on evidence and eventually compute $$P(A)$$ and $$P(B)$$.

At this point, if your goal is to choose _what to believe about the world_, then you wait until $$P(A)$$ is overwhelmingly higher than $$P(B)$$, and then you declare "$$P(A)$$ is higher by a lot, so I believe that", and you're fine. Human belief only requires getting an obvious theory.

But if you're actually trying to _make money_ (or maximize any quantity $$Q$$) with your theories, then you don't operate on the assumption that the most likely theory is true; you pick the strategy which maximizes $$\bb{E}[Q]$$. It's entirely possible that you may believe $$P(A)$$ to be vastly greater than $$P(B)$$, but the returns on $$B$$ are _so high_ that betting on it is still worth it.

In this case priors might matter, because if you pick them wrong you'll pick strategies suboptimally.

(Note that in practice, if you, as a human, accept theory $$A$$, you might not want to pick a strategy around $$B$$, because you're also optimizing to minimize embarrassment and taking big risks on something you don't believe in can be _socially_ wrong even if it is _mathematically_ optimal.)

------

So how do you pick a prior distribution?

Well, if you know things about what it _should_ be, you estimate it from that. If you _don't_, you can try to find an _uninformative prior_. Fortunately of the rules of probability still apply. Specifically:

1. $$P(A \cap B) \leq P(A)$$: your prior for any composite result should be strictly less than your prior for its components
2. The central limit theorem: if $$A$$ is the sum or average of many values, the result should be normally distributed, even if constituent values aren't
3. $$0 < P(A) < 1 $$: [Cromwell's Rule](https://en.wikipedia.org/wiki/Cromwell%27s_rule): nothing can have probabilities $$0$$ or $$1$$
	* This can be relaxed sometimes for _definitional_ statements. If you're trying to assign probabilities to propositions, then the logical entailment of a premise has $$P=1$$ given the premise. For instance $$P(2+2=4)$$ may be said to have probability $$1$$.
	* And if you protest that "what if you're computing things wrong!" then maybe stop trying to optimize probabilities anyway. Otherwise it gets _really_ complicated.
4. Arguments from symmetry: if two states are identical up to relabeling, they should have the same probability. More generally, the prior distribution should reflect the underlying _symmetry group_ of the system in question.
	* Special case: argument from indifference. If we have $$N$$ states and there's no reason to prefer one over the other, they should each have prior probability $$\frac{1}{N}$$.

-----

Finally if none of these works, there is one "correct" -- but theoretically uncomputable -- way to do it, which is called [Solomonoff Induction](https://en.wikipedia.org/wiki/Solomonoff%27s_theory_of_inductive_inference), and amounts to a mathematical formulation of Occam's Razor.

Heuristically:

> Simpler theories are more likely than complicated ones

Algorithmic complexity theory promises us that the concept of a theory being 'simple' is not a feature of what language you write it down in, but it's somehow not actually possible to tell given a theory how complex it is. Whatever. Point is, you order theories by complexity and prefer simpler ones, and that is the most natural prior you can get.