---
layout: blog
title: "Infinite Summations: A Rationality Litmus Test"
math: true
---

(copied from my [LessWrong](http://lesswrong.com/r/discussion/lw/oht/infinite_summations_a_rationality_litmus_test/) post for posterity)

-----

You may have seen that Numberphile video that circulated the social media world a few years ago. It showed the 'astounding' mathematical result:

$$1+2+3+4+5+\ldots = -\frac{-1}{12}$$

(quote: "the answer to this sum is, remarkably, minus a twelfth")

Then they tell you that this result is used in many areas of physics, and show you a page of a string theory textbook (*oooo*) that states it as a theorem.

<!--more-->

The video caused quite an uproar at the time, since it was many people's first introduction to the rather outrageous idea and they had all sorts of very reasonable objections.

Here's the 'proof' from the video:

First, consider $$P = 1 - 1 + 1 - 1 + 1\ldots$$
Clearly the value of P oscillates between 1 and 0 depending on how many terms you get. Numberphile decides that it equals $$\frac{1}{2}$$, because that's halfway in the middle.
Alternatively, consider P+P with the terms interleaved, and check out this quirky arithmetic:

$$1-1+1-1\ldots$$

$$+ 1-1+1\ldots$$

$$= 1 + (-1+1) + (1-1) \ldots = 1$$

so $$2P = 1$$, so $$P = \frac{1}{2}$$

Now consider $$Q = 1-2+3-4+5\ldots$$, and write out $$Q+Q$$ this way:

$$1-2+3-4+5\ldots$$

$$+ 1 -2+3-4\ldots$$

$$= 1-1+1-1+1 = \frac{1}{2} = 2Q$$

so $$Q = \frac{1}{4}$$

Now consider $$S = 1+2+3+4+5\ldots$$, and write $$S-4S$$ as

$$1+2+3+4+5\ldots$$

$$-0 -4 -0 -8 - 0 \ldots$$

$$=1-2+3-4+5\ldots = Q=\frac{1}{4}$$

So $$S-4S=-3S = \frac{1}{4}$$, so $$S=\frac{-1}{12}$$

How do you feel about that? Probably amused but otherwise not very good, regardless of your level of math proficiency. But in another way it's really convincing - I mean, string theorists use it, by god. And, to quote the video, "these kinds of sums appear all over physics".

So the question is this: when you see a video or hear a proof like this, do you *believe them*? Even if it's not your field, and not in your area of expertise, do you believe someone who tells you "even though you thought mathematics worked this way, it actually doesn't; it's still totally mystical and insane results are lurking just around the corner if you know where to look"? What if they tell you string theorists use it, and it appears all over physics?

I imagine this as a sort of rationality litmus test. See how you react to the video or the proof (or remember how you reacted when you initially heard this argument). Is it the 'rational response'? How do you weigh your own intuitions vs a convincing argument from authority plus math that seems to somehow work, if you turn your head a bit?

If you don't believe them, what does that feel like? How confident are you?

(spoilers below)

----------

#### The complaint

It's totally true that, as an everyday rationalist (or even as a scientist or mathematician or theorist), there will always be computational conclusions that are out of your reach to verify. You pretty much have to believe theoretical physicists who tell you "the Standard Model of particle physics accurately models reality and predicts basically everything we see at the subatomic scale with unerring accuracy"; you're likely in no position to argue.

But - and this is the point - it's highly unlikely that all of your tools are lies, even if 'experts' say so, and you ought to require extraordinary evidence to be convinced that they are. It's not enough that someone out there can contrive a plausible-sounding argument that you don't know how to refute, if your tools are logically sound and their claims don't fit into that logic.

(On the other hand, if you believe something because you heard it was a good idea from one expert, and then another expert tells you a different idea, take your pick; there's no way to tell. It's the personal experience that makes this example lead to sanity-questioning, and that's where the problem lies.)

In my (non-expert but well-informed) view, the correct response to this argument is to say "no, I don't believe you", and hold your ground. Because the claim made in the video is so absurd that, even if you believe the video is correct and made by experts and the string theory textbook actually says that, you should consider a wide range of other explanations as to "how it could have come to be that people are claiming this" before accepting that addition might work in such an unlikely way.

Not because you know about how infinite sums work better than a physicist or mathematician does, but because you know how mundane addition works just as well as they do, and if a conclusion this shattering to your model comes around -- even to a layperson's model of how addition works, that adding positive numbers to positive numbers results in bigger numbers --, then either "everything is broken" or "I'm going insane" or (and this is by far the theory that Occam's Razor should prefer) "they and I are somehow talking about different things".

That is, the unreasonable mathematical result is because the mathematician or physicist is talking about one "sense" of addition, but it's not the same one that you're using when you do everyday sums or when you apply your intuitions about intuition to everyday life. This is by far the simplest explanation: addition works just how you thought it does, even in your inexpertise; you and the mathematician are just talking past each other somehow, and you don't have to know what way that is to be pretty sure that it's happening. Anyway, there's no reason expert mathematicians can't be amateur communicators, and even that is a much more palatable result than what they're claiming.

(As it happens, my view is that any trained mathematician who claims that $$1+2+3+4+5\ldots = \frac{-1}{12}$$ without qualification is so incredibly confused or poor at communicating or actually just misanthropic that they ought to be, er, sent to a re-education camp.)

So, is this what you came up with? Did your rationality win out in the face of fallacious authority?

(Also, do you agree that I've represented the 'rational approach' to this situation correctly? Give me feedback!)

--------

#### Postscript: the explanation of the proof

There's no shortage of explanations of this online, and a mountain of them emerged after this video became popular. I'll write out a simple version anyway for the curious.

It turns out that there is a sense in which those summations are valid, but it's not the sense you're using when you perform ordinary addition. It's also true that the summations emerge in physics. It's also true that the validity of these summations is *in spite of* the rules of "you can't add, subtract, or otherwise deal with infinities, and yes all these sums diverge" that you learn in introductory calculus; it turns out that those rules are also elementary and there are ways around them but you have to be very rigorous to get them right.

An elementary explanation of what happened in the proof is that, in all three infinite sum cases, it is possible to interpret the infinite sum as a more accurate form (but STILL not precise enough to use for regular arithmetic, because infinities are very much not valid, still, we're serious):

$$S(\infty) = 1+2+3+4+5\ldots \approx \frac{-1}{12} + O(\infty)$$

Where $$S(n)$$ is a function giving the n'th partial sum of the series, and $$S(\infty)$$ is an analytic continuation (basically, theoretical extension) of the function to infinity. (The $$O(\infty)$$ part means "something on the order of infinity")

Point is, that $$O(\infty)$$ bit hangs around, but doesn't really disrupt math on the finite part, which is why algebraic manipulations still seem to work. (Another cute fact: the curve that fits the partial sum function also non-coincidentally takes the value $$\frac{-1}{12}$$ at $$n=0$$.)

And it's true that this series always associates with the finite part $$\frac{-1}{12}$$; even though there are some manipulations that can get you to other values, there's a list of 'valid' manipulations that constrains it. (Well, there are other kinds of summations that I don't remember that might get different results. But this value is not accidentally associated with this summation.)

And the fact that the series emerges in physics is complicated but amounts to the fact that, in the particular way we've glued math onto physical reality, we've constructed a framework that also doesn't care about the infinity term (it's rejected as "nonphysical"!), and so we get the right answer despite dubious math. But physicists are fine with that, because it seems to be working and they don't know a better way to do it yet.