---
layout: blog
title: "Data Science Mostly Isn't"
tags: tech
---

<!--more-->

A classic product experiment at a technology company is a feature A/B test which tries to improve revenue or engagement metrics. It goes like this:

1. Ask a question: can we drive more users to pay for our product by changing something, say the color of the sign-up button?
2. Come up with some hypotheses to test: what if we make it a big grey button? A big red button? A big *flashing* red button?
3. Do an A/B test experiment: implement each of the variants and randomly assign some visitors to each one, measuring the signup rate under each hypothesis.
4. Analyze the results: perform a mathematical ritual which determines if the changes made a "statistically significant" difference in sign-up rates. Interpret this to mean that the data is not simply due to random variation, and the winning variant actually caused more signups to happen.
5. If one of the variants clearly emerged as a winner, commit to that result and remove the others from code. Don't forget to also mass-email folks and show off the results of your experiment and claim credit for driving X% signups / revenue / whatever. Good on you, promotions all around.

We might call this the Data Science Scientific Method. It certainly looks like we did some Science. Isn't this how Science works? Like in those triptychs from school:

{% include image.html filename="2023-05-01/science.png" width="600px" %}

And Science is Good, as we know. Everybody knows that. In fact, everybody at the company knows that this is what science is, and that science is good and it's how you Be Right and Not Be Wrong, and they also know that everybody _else_ knows thatt so they don't even have to talk about it, they can just proceed with Doing Science and Making Money. And they know they're right, also, because it's working: they're getting good results, converting customers, getting promotions and whatnot, and, most importantly, making, yeah, lots of money. And they're all very pleased to be part of this big rational machine that's smarter than any of the individuals.

Two problems:

1. That's not what science is, like at all.
2. That big rational machine is somehow dumber than a single person.

You know what "data science" experiment I've never seen anyone do? Ask the question "can one person, using their intuition and maybe asking around a bit, make better decisions than our whole data science apparatus?". Cause if so, then maybe you should just give that person all the decision-making power and do whatever they say for a while.

Or maybe you should do better science. Science is, after all, about being _right_. Just because you did a thing that you called Science, and that everybody is pretty sure that it's Science at an I-read-the-New-York-Times level of understanding doesn't mean you're right. The fact that you made money successfully doesn't even make you right--- at best you were right at the small question of "which color gets more clicks over the next little while"; probably not on the bigger question of "what should we do to optimally make more money" and definitely not on the bigger question of "what's the best thing to do as a business". 

----------

## What Science Is

Let's get this out of the way. This is not science:

1. Ask a question
2. Formulate hypothesis
3. Do an experiment
4. Get a result
5. Conclude things

Science is not a formulaic process anyway, but anyway if it was it would have to be a process that converges on better understanding over time. Here's a better process that includes some important missing steps:

1. Learn, Observe, and Study
2. Conceivable of a model of the world that you think makes sense from what you know. If it's not obvious you might need to check it.
3. Ask a question (that your model has something interesting to say about...)
4. Formulate a hypothesis (about what answer your model would give if it were correct that other models would not give)
5. Do an experiment
6. Get a result
7. Conclude things (about the accuracy of your model)
8. Update your confidence in your model based on the result. Go back to step (2) until it's good.
9. Go and do things in the world using your model now that you know it's good.

If you’re not formulating a model *as you go*, and treating your experiments as tests of whether your model is good, you’re not really doing science. You're just doing... experiments, in a loop? Without ever learning anything? That doesn't even deserve to be called science.

Corporate data science doesn't even target producing models. It basically targets producing _decisions_. If you produced a model, the model would tell you what decision to make, but... that's scary. No one wants to just _pick_ what color the button should be. What if they're wrong? Instead we can let the experiment decide for us. No one ever got fired for staffing a data science team, or for making the button whichever color people clicked on most frequently for two weeks last June.

Science is, has to be, the process of studying things in a way that necessarily becomes more correct over time. Asymptotically it should figure out the true workings of whatever slice of reality you're looking at. This always involves building up theories of how reality works, and typically should require validating those theories with experiments to see how good they are. Although, strictly speaking, that's only as useful as it gets you closer to the truth, so you can get away without it sometimes if the experiment's result is obvious.

In business, the theories are answers to the question "how should we run our company?" That experiment to see what color the button should be? It assumes, but never tests, that the answer to that question is this: "we should run experiments like this one all day and then do whatever they say for the indefinite future." You could also do some science on _that_ hypothesis, if you wanted. I wouldn't bother. It's pretty obviously flawed. Anywhere you look, data-science-driven companies are doing fantastically dumb things, all the time, and everybody who works there seems to know it. And yet they do it anyway---because their collective understanding is that they're supposed to stay on that sacred data-driven path.

----------

## In the end it's an absence of...

Leadership. Like so:

How do you do better than a bunch of one-off experiments that pretend to be science? For starters, write down and aggregate all the results of your little experiments, in a way that can be used for future decisions. And then use them. If making every "no thanks I don't want to buy your shit" button grey and invisible presses the right psychological buttons to make you more money, you don't have to really test the next one. You already know! It will work! 

That sounds nice, you think, and yet... when the next product update comes around... somehow you're back where you were, doing that same experiment again. Why?

Well, it turns out there's another reason people do "science", and it's probably the main reason: it's that they need to be able to take _credit_. If you knew the button color would help the business and your job was just a regular job where your responsibility is to do a good job at something, you'd just change the color to the color it should be and that would be it. But if you need to argue about getting a promotion, you need to _attribute_ that revenue to something you did, because your annual review is gonna say "drove X% revenue growth via a series of changes" and if you don't know how much you drove you can't put it in there. Even if, and this is the painful part, the thing you did was _obvious_ and the experiment was _a total waste of time and money_.

This train of thought leads... to... a weird subterranean viewing-chamber, where you gaze into an obsidian boulder and see reflected in it one of those dark truths of modern capitalism that underpins everything: that everything, products and performance reviews and promotions and the rest, are all doing this fake thing they call "science", in lieu of making any kind of decisions whatsoever. Everybody has... offloaded... responsibility... for everything... to _math_.

Once the fog is lifted it is all clearly a farce. Is this person a good manager? No idea. Did they help people grow, or build something that will last? Can't remember. Does it matter how good their management was? Who cares, what we want to know is, did they do measurable things to benefit the company? Heck yes, and we proved it with science! Definitely promotion material. Annual bonus secured.

Maybe the only people who are in a position to put a stop to it is the people doing the evaluating. They should be smarter, smart enough to see that the experiments were a waste of time, smart enough to enough to see that good work doesn't mean good measurable results and is in fact probably the opposite of it (because good work most often consists of what you build or grow or polish, and those are all (a) easy to see and (b) hard to quantify).

But as long as the evaluators don't _believe_ this is their job, you're stuck. Even if they did they're probably accountable to someone else who wants everything in numbers too, and they're beholden to some rubric for evaluation, and anyway there's no culture, none whatsoever, of evaluating things on their _merits_, in fact they'll get ridiculed and reprimanded if they do that. What about their boss? Same thing. And the buck stops... the buck stops at... the shareholders? An amorphous machine that feeds only on numbers, and criminally-aggregated, fake, massaged, manipulated, a-whole-team-of-people-put-this-together numbers at that, and they all know it and keep playing? Good lord.

--------------

## But aren't people dumb?

Don't get me wrong: suddenly letting people "make decisions" would probably spell disaster. People can be really, really dumb. Especially if they got the decision-making power without having to prove themselves by making lots of smaller decisions first.

If anything, the modern cargo-cult data-science age is probably a reaction to the _last_ age, a time when tyrannical executives roamed the earth, doing whatever insanely dumb shit they wanted, checked only by the control of their also-tyrannical superiors. And no one had heard of "systematic bias" or "logical fallacies" so there wasn't even a language to explain why they were so wrong. (And they had those positions not because they were the best at what they did, not because they earned it with hard work, but because they were, like, the right type of well-groomed white man who looks good in a sportcoat. Or whatever.) I've heard it's still like that in many parts of the world. But, you know, not in modern corporate America---we're better than that now, right? We use data.

So in a way, handing decision-making over to what is essentially an algorithm is a way of _taking power away from powerful people_, and getting them to somehow go along with it. Which doesn't really sound so bad. If anything that's the theme of the last century of progressivism.

Yet the result is, in a way, shameful. The organization is _still_ clueless, only now it can't as easily blame a single-decision maker for being a dumbass, and so it actually affords the people in power _more_ protection. They're less culpable for the consequences of their actions, because they don't *take* actions. They still fail... but everything was the data's fault. In fact everybody, in power or not, can say this: we just did what the data told us! We did everything right! Especially in tech, where money and therefore validation just blows in your door if you leave it open, these organizations can't even tell how dumb they're being. Because, heck, it seems to be working. We're still getting customers. It says here that people are clicking on ads. The stock price is good. The actual test of your hypothesis about how to run a business happens on far too slow a scale to get any feedback (decades, I guess. However long it takes a company to rot at its core, wither for a while, and finally go bankrupt).

Well, fine. I, for one, don't enjoy being part of this money-grubbing idiot machine at all. It's no fun to spend your one life's effort on stupid work. And even if you avoid that, every product you use has already been half-ruined by it anyway. You would have to go live by yourself in the woods to get away from decisions that are obviously bad but looked good in the metrics. And don't get me started on things that are actually really good ways to make money but <s>are totally evil</s> you'd be ashamed telling your kids about. "The data told us to do it!" I bet it did.

But hey, maybe it's a good thing that we're getting comfortable with the idea of offloading all responsibility onto a machine we built to rule us. :thinking-face:


