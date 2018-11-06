---
layout: article
title: "Bayes notes"
math: true
aside: true
footnotes: true
---

## 1

From basic probability we know that:

$$P(A,B) = P(A | B) P(B) = P(B | A) P(A)$$

Giving Bayes' Theorem:

$$P(A | B) = P(A) \frac{P(B | A) }{P(B)} \tag{1}$$

We can also expand the $$P(B)$$, giving:

$$P(A | B) = \frac{P(B | A) P(A)}{P(B | A) P(A) + P(B | \neg A) P(\neg A)}$$

It is often convenient to write this as an _odds ratio_:

$$P(B | A) P(A) : P(B | \neg A) P(\neg A) = P(B, A) : P(B, \neg A)$$

which gives the ratio between the frequencies of events that $$B$$ happens and $$A$$ happens, versus $$B$$ happens and $$A$$ doesn't.

In fact we could just write out a ratio of all four possibilities:

$$P(A,B) : P(A, \neg B) : P(B, \neg A) : P(\neg B, \neg A)$$

To find the probability of some predicate given some other predicate, such as $$P(x \| y)$$, compute $$P(x \| y) = \frac{P(x, y)}{P(y)}$$.

Note that treating these as ratios eliminates the need for using _probabilities_. They can be abstract _rates_ in any sense in which that makes sense. So we can just write:

$$(A, B) : (A,\neg B) : (\neg A,B) : (\neg A, \neg B)$$

---------

$$P(A)$$ is called the **prior probability** of $$A$$: the probability we assume in a vacuum with no additional knowledge. $$P(A) : P(\neg A)$$ is the **prior odds**.

$$P(A \| B)$$ is called the **posterior probability** of $$A$$: the probability after we have incorporated our knowledge of $$B$$. $$P(A \| B) : P(\neg A \| B)$$ is the **posterior odds**.

The odd ratio $$P(B \| A) : P(B \| \neg A) $$ is called the **relative likelihood**.

The process of incorporating new information $$B$$ to compute $$P(A \| B)$$ is called a Bayesian Update. In odds form, it looks like that:

$$\text{posterior odds} = \text{prior odds } \times \text{ relative likelihood}$$

The odds ratio form is useful because we can simply... multiply odds together (as odds or as fractions):

$$(a:b) \times (c:d) \ra \frac{a}{b} \frac{c}{d} = \frac{ac}{bd} \ra (ac : bd)$$

In probability-ratios:

$$\frac{P(A | B)}{P(A | \neg B)} = \frac{P(A)}{P( \neg A)} \times \frac{P(B | A)}{P(B | \neg A)}$$

Note that this also equals $$\frac{P(B, A)}{P(B, \neg A)}$$.

------

Classic example:

If people are sick with odds $$1:5$$ and positive results on a test come with rates $$10 : 1$$ then the rate of positive results is $$10 : 5$$, ie a positive result says you have probability $$\frac{2}{3}$$ to be sick. In the above formula:

* $$P(A) : P(\neg A)$$ is $$1:5$$, because there are 5 times as many healthy people as sick.
* $$P(B \| A) : P(B \| \neg A)$$ is $$10: 1$$, because sick people are 10 times as likely to get positive results.
* so $$P(A \| B) : P(A \| \neg B)$$ is $$10: 5$$, because $$10:5$$ is the "ratio of positive results from sick people to positive results from healthy people".

You can do it with probabilities, also, but it's clunker: $$P(A) = \frac{1}{6}$$ and $$P(B \| A) = \frac{10}{11}$$ and $$P(B \| \neg A) = \frac{1}{11}$$ so:

$$P(A | B) = \frac{\frac{1}{6} \frac{10}{11} } { \frac{1}{6} \frac{10}{11} + \frac{5}{6} \frac{1}{11}  } = \frac{10}{10 + 5} = \frac{2}{3}$$

------

## In practice

You usually begin with a guess (a prior) for the likelihood of some hypothesis $$H$$:

$$P(H) : P(\neg H)$$

Since it's a ratio of occurrences we don't care about it being normalized, so we just write this as a ratio $$(H) : (\neg H) = \frac{(H)}{(\neg H)}$$.

Then you go through your life finding observations $$\vec{O} = \{ O_i \} $$, which have different rates of occurring for $$H$$ vs. $$\neg H$$, causing updates:

$$\frac{(H | \vec{O} )}{(\neg H | \vec{O} )} = \frac{(H)}{(\neg H)} \prod_i \frac{(O_i, H)}{(O_i, \neg H)}$$

Which amounts to:

$$\text{currently belief ratio} = \text{prior} \times \prod_i \text{ratios from } O_i$$

Some entailments:

1. If each thing you see occur is more likely to occur for $$H$$ than for $$\neg H$$, then your belief in $$H$$ gets higher and higher, approaching but never reaching infinity.
2. If you ever see something happen which is _impossible_ if $$H$$, ie has odds $$0: x$$, then you no longer believe in $$H$$, no matter what. 
3. Your prior permanently weights your resulting probabilities, no matter how many observations you see.
4. To make an unlikely claim $$H$$ seem _more_ likely than you started out, you need likelihood ratios which at least the inverse of your current believe. IE if you currently think the ratio is $$2:5$$, you need ratios $$> 5:2$$ to start inverting that.

There is no requirement, either, that you only consider $$H$$ and $$\neg H$$. You can have an entire family of (exlcusive) hypotheses $$H_j$$. Fractions are only good at expressing one or the other, but ratios, in general, can be between more than two terms: $$H_1 : H_2 : H_3$$.

The procedure of 'inference' as performed by human intuition is assumed / understood to be an analog approximation to this. One useful fact though, is that you can perform the calculation even if you don't have 'every available hypothesis'. Bayesian updating updates the _relative likelihoods_ of hypotheses, but it doesn't make any claim as to their absolute likelihood. If you get a new hypothesis later you are free to re-evaluate old evidence in light of it and add it to the mix.

---------

It can be easier to think in **log odds**, which makes all the math additive:

$$\log (H | \vec{O}) - \log (\neg H | \vec{O}) = \log H - \log \neg H + \sum_i \log(O_i, H) - \log(O_i, \neg H)$$

This will be easiest is your rates are all given as ratios of powers of the same number. How would that work?

It's not too difficult if you think of counting the number of ways things can happen. If there are $$2$$ ways that $$H$$ can happen and $$4$$ ways that $$\neg H$$ can happen, then $$\log_2 \frac{H}{\neg H} = 
log 2 - \log 4 = -1$$. To get back to an odds ratio, compute $$2^{-1} = \frac{1}{2} = 1:2 \lra P(H) = \frac{1}{3}$$.

In log odds, if $$A$$ is "twice as likely as" $$B$$, then $$\log (A) = 1 + \log (B) $$; you're doing something like adding up "how many times is $$A$$ twice as likely as $$B$$", which isn't too bad to do in your head.

-------

## Conservation of Expected Evidence

Given a current belief ratio $$H : \neg H$$, after a test observation in which we see $$O$$ we update the posterior probability to:

$$P(H | O) = P(O | H) P(H) + P(O | \neg H) P(\neg H)$$

If we instead see $$\neg O$$, then we update to:

$$P(H | \neg O) = P(\neg O | H) P(H) + P(\neg O | \neg H) P(\neg H)$$

We also know, though, that $$P(H)$$ is:

$$P(H) = P(H | O) P(O) + P(H | \neg O) P(\neg O)$$

We can interpret this in an interesting way. Since $$P(O)$$ and $$P(\neg O)$$ are fixed constants, this is an expectation value of $$P(H)$$ after the observation of $$O$$ or $$\neg O$$: $$\bb{E}[P(H)]$$. $$P(H)$$, our _prior_ for $$H$$, is also fixed, though. That means that if $$P(H \| O)$$ increases, then $$P(H \| \neg O)$$ _decreases_ proportionally. Specifically:

$$\D P(H | O) P(O) = - \D P(H | \neg O) P(\neg O)$$

This has been called **conservation of expected evidence**. If seeing $$O$$ makes you think that $$H$$ is _more_ likely, then seeing $$\neg O$$ _must_ make you think that $$H$$ is _less_ likely. Moreover, if you already believe that $$P(H)$$ is the true probability of $$H$$, then you don't _expect_ evidence to change your opinion on that _at all_ -- the expected change $$\D P(H)$$ is $$0$$.

Of course, if you're _wrong_ about $$P(H)$$, then on average in reality you will change your mind after $$O$$. The point is, though, that if you _expected_ to change your mind upon observing $$O$$ in one direction or another, you could just imagine testing $$O$$ and make the change anyway. You already know enough to update your prior without doing another experiment.

More [here](https://www.lesswrong.com/posts/jiBFC7DcCrZjGmZnJ/conservation-of-expected-evidence), including the delightful real-life example that if living a sinful life makes a medieval woman more likely to be a witch, then living a virtuous life _must_ make a medieval woman _less_ likely to be a witch.

------

## Frequentism

Inference is sometimes framed as having two ideological camps: frequentist and Bayesian. Frequentist statistics includes such ideas as $$p$$-values and confidence intervals and the like.

I hold the view (acquired from various more learned sources) that frequentism is more-or just a subset of Bayesianism that says less but doesn't mention priors. That is: there's not really an ideological battle at all; Bayesian is just better and can say anything that frequentist statistics does.

Precisely: frequentist statistics only give the probability of results conditioned on hypotheses, never the _probability of hypotheses_. 

The hypothesis probability is commonly then _deduced via intuition_, which can be dangerous. Bayesian makes this step mathematical.

Here is how you represent frequentism in light of Bayes:

A $$p$$-value fundamentally says that "Given hypothesis $$H$$, the observed data $$O$$ has probability $$P(O \| H)$$". A study which reports a $$p$$-value implicitly says "see how small that number is? surely that makes you doubt that $$H$$ is true!". In fact, what's omitted is the _explicit_ step of computing, using that value:

$$P(H | O) = P(O | H) \frac{P(H)}{P(O)}$$

Since this step is omitted, it's not necessary to ever discuss the prior probability $$P(H)$$. Your intuitive inference, upon reading the $$p$$-value $$P(O \| H)$$, is to imagine that $$P(H)$$ is maybe sort of likely, maybe not, but regardless having seen the (hopefully miniscule) value of $$P(O \| H)$$, you certainly should change your perceived value of $$P(H)$$ by that factor.



Of course, it's enormously important what $$P(O)$$ is. Or rather, it's important how much higher $$P(O \| H)$$ is than $$P(O \| \neg H)$$. If $$P(O \| H) = P(O) = P(O \| \neg H)$$, ie, $$O$$ would be observed whether or not $$H$$ is true, then observing $$O$$ actually tells you nothing. If $$\frac{P(O \| H)}{P(O \| \neg H)} = q$$, though, then:

$$P(H | O) = \frac{ P(O | H) P(H)  }{P(O | H)P(H) + P(O | \neg H) P(\neg H)} = \frac{1}{1 + \frac{P(O \| \neg H)}{P(O \| H)} \frac{P(\neg H)}{P( H)}}$$

The values other than $$P(O \| H)$$ are not usually reported for something like this. But we can imagine: supposing that the $$p$$-value is very low, with some additional assumptions:

1. $$P(O \| \neg H)$$ is not very small compared to $$P(O \| H)$$, so $$\frac{P(O \| \neg H)}{P(O \| H)} \gg 1$$
2. the prior odds $$ \frac{P(\neg H)}{P( H)}$$ are _not_ small enough to matter, in the sense that $$\frac{P(O \| \neg H)}{P(O \| H)} \frac{P(\neg H)}{P( H)} \gg 1$$.

.. _only then_ is it true that $$P(H \| O) =\frac{1}{1 + \frac{P(O \| \neg H)}{P(O \| H)} \frac{P(\neg H)}{P( H)}} \ll 1$$, from which you conclude that "evidence $$O$$ indicates that $$H$$ is very likely not to be true.

What this shows is that frequentism doesn't manage to _avoid_ dealing with priors; it just avoids the issue entirely by leaving you to do that step in your head. Which is fine if the priors are obvious, or if you collect enough information that $$ \frac{P(O \| \neg H)}{P(O \| H)}$$ is so massive that your prior probability almost doesn't matter at all.


This is also slightly complicated by the fact that, often $$H$$ is a null hypothesis ($$O$$ is not effected by $$X$$), which means that $$\neg H$$ is just $$O$$ is affected by $$X$$, which _doesn't tell you much_, because a correlation of $$0.001$$ is still $$\neg H$$. Instead, if you want to run Bayesian inference on $$H$$, you'll want to consider a family or distribution of possible hypotheses other than the null $$H$$, and calculate the likelihood of each.

-------

## Priors

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