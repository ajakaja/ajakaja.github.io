---
layout: blog
title: "Infinite Summations and You"
math: true
footnotes: true
date: 2018-11-01 14:00
---

You may have seen that [Youtube video](https://www.youtube.com/watch?v=w-I6XTVZXww) by Numberphile that circulated the social media world a few years ago. It showed the 'astounding' mathematical result:

$$1+2+3+4+5+\ldots = -\frac{1}{12}$$

(quote: "the answer to this sum is, remarkably, minus a twelfth")

...Then they tell you that this result is used in many areas of physics, and show you a page of a string theory textbook (*oooo*) that states it as a theorem.

The video caused a bit of an uproar at the time, since it was many people's first introduction to the (rather outrageous) idea and they had all sorts of (very reasonable) objections.

I'm interested in talking about this because: something about how mathematicians have shared it with the world _irks_ me. It's fine to get excited about strange mathematical results. But it's not fine to present something that requires a lot of asterixes and disclaimers as simply "true". The equation is _true_ only in the sense that if you subtly change the meanings of lots of symbols, it can be shown to become true. But that's not the same thing as quotidian, useful, everyday truth.


<!--more-->

The Numberphile video came much later and had a bunch of other people "believing" this, or, like, doubting their sanity because they were being told to believe it.

Some years later I eventually learned more mathematics and went out of my way to understand the real explanation for closure.

-----

## The Proof

First, here's the 'proof' from the video:

Start with the simpler sum:

$$P = 1 - 1 + 1 - 1 + 1\ldots$$

Clearly the value of P oscillates between 1 and 0 depending on how many terms you include. Numberphile decides that it equals $$\frac{1}{2}$$, because that's halfway in the middle. Alternatively, consider P+P with the terms interleaved, and then check out _this_ quirky arithmetic:

$$\begin{aligned}
P+P = 1&-1+1-1\ldots \\
&+ 1-1+1\ldots \\
= 1 &+ (-1+1) + (1-1) \ldots \\
= 1 &+ 0 + 0 + \ldots \\
= 1 &\, \end{aligned} $$

So $$2P = 1$$, so $$P = \frac{1}{2}$$ we guess?

Now consider $$Q = 1-2+3-4+5\ldots$$, and write out $$Q+Q$$ this way:

$$\begin{aligned}

Q+Q = 1&-2+3-4+5\ldots \\
&+ 1 -2+3-4\ldots \\
= 1&-1+1-1+1 \\
\Ra 2Q = \frac{1}{2} &\, \end{aligned}$$

So $$Q = \frac{1}{4}$$.

Now consider $$S = 1+2+3+4+5\ldots$$, and write $$S-4S$$ as

$$\begin{aligned} S - 4S &= (1+2+3+4+5\ldots) \\
&- (0 + 4 + 0 + 8 +  \ldots) \\
&=1-2+3-4+5\ldots  \\
-3S &= Q=\frac{1}{4} \\
\Ra S &= \boxed{-\frac{1}{12}}\end{aligned}$$


How do you feel about that? Probably amused but otherwise not very good, regardless of your mathematical background. But in another way it's really convincing - I mean, by god! -- string theorists use it! And, to quote the video, "these kinds of sums appear all over physics" (which I think isn't really true, but they do appear occasionally).
{: .indent}

So the question is this: when you see a video or hear a proof like this, do you *believe them*? Even if it's not your field, and not in your area of expertise, do you believe someone who tells you "even though you thought mathematics worked this way, it actually doesn't; it's still totally mystical and insane results are lurking just around the corner if you know where to look"? What if they tell you string theorists use it, and it appears all over physics?
{: .indent}

I imagine this as a sort of rationality litmus test. See how you react to the video or the proof (or remember how you reacted when you initially heard this argument). Is it the 'rational response'? How do you weigh your own intuitions vs a convincing argument from authority plus math that seems to somehow work, if you turn your head a bit sideways?
{: .indent}

If you don't believe them, what does that feel like? How confident are you?
{: .indent}

----------

## The Problem

It's totally true that, as an everyday thinker (or even as a professional scientist or mathematician), there will always be computational conclusions that are out of your reach to verify. You pretty much have to believe theoretical physicists who tell you "the Standard Model of particle physics accurately models reality and predicts basically everything we see at the subatomic scale with unerring accuracy"; you're likely in no position to argue, and if you are there's something else you're not equipped to argue about.
{: .indent}

But - and this is the point - it's **highly unlikely that all of your cognitive tools are lies**, even if 'experts' say so, and you ought to require extraordinary evidence to be convinced that they are. It's not enough that someone out there can contrive a plausible-sounding argument that you don't know how to refute, if your tools are logically sound and their claims don't fit into that logic.[^lies]
{: .indent}


[^lies]: Incidentally, if all your cognitive tools _are_ lies, then you also don't have much to worry about, because you've lost the ability to rationally process reality, so it's not going to make a big difference who you believe about abstruse things because you're going to be wrong about everything anyway.

On the other hand, if you believe something because you heard it was a good idea from one expert, and then another expert tells you a contradictory thing, then, all other things being equal, you have essentially no way of choosing. Take your pick; there's no way to tell. If one is more convincing than the other, that's _evidence_, but still not useful if you can't understand the argument enough to validate it. But $$1+2+3+\ldots = -\frac{1}{12}$$ isn't like that. It's the personal experience -- our ability to also _naively_ reason on the problem -- that makes this example important.
{: .indent}


I think that the correct response to this argument is to say "no, I don't believe you", and hold your ground. Because the claim made in the video is so absurd that, even if you believe the video is correct and made by experts and the string theory textbook actually says that, you should consider a wide range of other explanations as to "how it could have come to be that people are claiming this" before accepting that addition might work in such an unlikely way.
{: .indent}

Not because you know about how infinite sums work better than a physicist or mathematician does, but because you know how mundane addition works just as well as they do, and if a conclusion this shattering to your model comes around -- even to a layperson's model of how addition works, that adding positive numbers to positive numbers results in bigger numbers --, then either "everything is broken" or "I'm going insane" or "they and I are somehow talking about different things". If they're definitely reputable and you're definitely thinking clearly, Occam's Razor should dictate that the third option be the most appealing.
{: .indent}

That is, the unreasonable mathematical result is because the mathematician or physicist is talking about one "sense" of addition or equality, but it's not the same one that you're using when you do everyday sums or when you apply your intuitions about intuition to everyday life. This is by far the simplest explanation: addition works just how you thought it does, even in your inexpertise; you and the mathematician are just talking past each other somehow, and you don't have to know what way that is to be pretty sure that it's happening. Anyway, there's no reason expert mathematicians can't be amateur communicators, and even that is a much more palatable result than what they're claiming.
{: .indent}

This is basically one of the subtleties to how we instinctively apply [Bayes' Theorem](https://en.wikipedia.org/wiki/Bayes%27_theorem) to real experiences. We incorporate new evidence about the world naturally -- but we also have to incorporate our own ability to process that evidence correctly, and our confidence in the sources of the evidence, and our confidence in the ability of the sources to process and _communicate_ that evidence correctly. And, of course, in our [ability to correctly apply Bayes' Theorem](https://xkcd.com/2059/) at all. And it's important that, in the process of trying to hang on through this mess of evidence-evaluation, that we can be _confident about the basics_-- or we get into situations like this one, where we're told something absurd but have been worn down to the point of not being sure that we are epistemologically 'allowed' to reject it.
{: .indent}

(As it happens, my view is that any trained mathematician who claims that $$1+2+3+4+5\ldots = -\frac{1}{12}$$ without qualification is so incredibly confused or poor at communicating or actually just misanthropic that they ought to be, er, re-educated, but who's asking me?)


--------

## Postscript: The Explanation

There's no shortage of explanations of this online, and a mountain of them emerged after this video became popular.

I'll write out a simple heuristic version anyway for the curious.

It turns out that, yes, there is a _sense_ in which those summations are valid, but it's not the sense you're using when you perform ordinary addition. It's also true that the summations emerge in physics. It's also true that the validity of these summations is *in spite of* the rules of "you can't add, subtract, or otherwise deal with infinities, and yes all these sums diverge" that you learn in introductory calculus; it turns out that those rules are also elementary and there are ways around them but you have to be very rigorous to get them right.
{: .indent}

An elementary explanation of what happened in the proof is that, in all three infinite sum cases, it is possible to interpret the infinite sum in a more accurate form (but STILL not precise enough to use for regular arithmetic, because infinities are very much not valid, still, we're serious), which is by understanding that the result is "actually" something like this:
{: .indent}

$$S(\infty) = 1+2+3+4+5\ldots \approx -\frac{1}{12} + O(\infty)$$

where $$S(n)$$ is a function giving the n'th partial sum of the series, and $$S(\infty)$$ is what happens you formally extend $$S(n)$$ to take a limit at $$n \ra \infty$$. The $$O(\infty)$$ part means "something on the order of infinity".

(Technically we're talking about the [analytic continuation](https://en.wikipedia.org/wiki/Analytic_continuation) of $$S(n)$$ to $$+\infty$$.)

Point is, that $$O(\infty)$$ bit is in there, but doesn't necessarily disrupt arithmetic on the finite part, which is why algebraic manipulations still seem to work. And it's true that this series is always found to have the finite part $$-\frac{1}{12}$$, if you stick to a certain type of 'valid' manipulations. (Well, there may be other kinds of summation techniques that I don't know about that get different results. But this value is not just randomly one among many associated with this summation; you can get this same answer in different ways.)
{: .indent}

In fact, if you just graph the partial sums $$S(n)$$, the curve which approximates this [apparently](https://en.wikipedia.org/wiki/1_%2B_2_%2B_3_%2B_4_%2B_%E2%8B%AF) intercepts the $$y$$ axis at $$(0, -\frac{1}{12}$$).
{: .indent}

And the fact that the series emerges in physics is complicated but amounts to the fact that, in the particular way we've glued math onto physical reality, we've constructed a framework that also doesn't care about the infinity term (it's rejected as "nonphysical!" and it's a nightmare), and so we get the right answer despite dubious math. But physicists are fine with that, because it seems to be working and they don't know a better way to do it yet.
{: .indent}

So there you go. The sense in which it is true is: when you go mucking about with infinity, you make new rules and new definitions, and weird facts emerge. Until we've got a new theory of infinity, it remains "kind of true" that $$1+2+3+\ldots = - \frac{1}{12}$$, but please don't go telling anyone that to blow their mind, because you'd probably be more wrong than right.
{: .indent}

-----

(This is adapted from something I posted on [LessWrong](http://lesswrong.com/r/discussion/lw/oht/infinite_summations_a_rationality_litmus_test/) a few years ago. Copied here for posterity and improvement.)
