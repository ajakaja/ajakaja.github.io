---
layout: blog
title: "Chaos Under Pressure"
math: true
footnotes: true
date: 2018-11-01 15:00
---

Here's an effect I've seen in various settings and don't know the name for. It's a property of the game theory of any game in which you can discretely lose but when the players are, well, human, or are otherwise playing imperfectly.
{: .indent }

It's the principle that:

> In a game with a win/loss outcome, the closer you are to losing, the more chaotically you should play.

On it's own this is fairly obvious: anyone who has played much, say, chess knows that when you're behind you should try to be tricky, because your opponent makes mistakes too and you might be able to eke out a win. And if you're about to lose in basketball, you take shots you probably can't make -- because why not? You're definitely going to lose if you don't.
{: .indent }

These things happen because all the ways of losing are _equally_ bad. Basically, there is an **outcome floor** -- you can lose badly or just by a little bit, but you lose either way. That means that if you're behind and probably going to lose anyway, you're incentivized to make high-variance moves, which might lead to you winning -- somehow -- because the alternative, losing by more, doesn't matter.
{: .indent }

This would _not_ be the way to play if you cared _how much_ you lost by. If your goal is to maximize the expected value of a score (like points in basketball), your best strategy is to play the same way until the end of the game. But because you're just aiming to _win_, the closer you get to losing, the more chaotically you want to play.
{: .indent }

<!--more-->

------

## 1. Examples


This effect is interesting because, I think, it turns up in lots of other places that don't look very much like win-or-lose games. Here are a bunch of examples.
{: .indent }

### 1

If the worst thing that can happen to a company is going out of business, then if you're doing badly, you can take more risks. Why not? May as well play to get lucky.

As a result, a small startup can take far more risks than a large multinational corporation. The startup can do something insane, like pour resources into a failing project, because when it fails the investors are out their money but the owners are (more-or-less) fine. But if the corporate project is failing, their other businesses can be pulled down with the failure if they overcommit to rescuing it.
{: .indent }

(Things are further skewed because, as far as I can tell, it tends to be true that the entrepreneurs come out way ahead in this scenario -- they get the prestige and connections and experience from the whole thing, but don't lose out financially. Except for the alternative outcome of making a lot of money in the meantime working somewhere else, maybe, but let's assume the entrepreneurs already decided they don't care so much about that. And of course except for the mental health toll of fighting to keep a sinking ship afloat. Whatever, it's just an example.)
{: .indent }

### 2

Equivalently, in personal finances, if it looks like you're definitely going to run out of money, you can take stupid risks as long as they don't jeopardize your ability to file bankruptcy and have debts forgiven, like making very disadvantageous gambles.
{: .indent }

But it's important that outcome floors interact with human fallibility. If you _think_ bankruptcy is the same if you lose by a little or a lot, but you're wrong, then you may make decisions which are empirically terrible ideas -- because you're confused about the correct utility function in the presence of a misunderstood outcome floor.
{: .indent }

Maybe you think that student loans are forgiven in bankruptcy (they're not, I'm told), and then up impoverished for decades.
{: .indent }

Or maybe you take a sketchy loan to survive from someone who enforces their loan "extrajudicially", and end up being punished, mafia-style, for the mistake.
{: .indent }

Basically you have to be sure you know where the floors _actually_ are, because real-life decisions are made in fuzzy situations and if you're wrong you'll make moves which aren't just less-than-perfect but are dramatically terrible.
{: .indent }

------

It's also important to realize how imposing an outcome floor on someone else changes their behavior:

### 3

If the death penalty is required for a certain crime, then a criminal who does commits that crime is incentivized to commit basically _any other crime_ in order to avoid the most extreme outcome.

This is especially dire if massive punishments are assigned to things that will inevitably occasionally happen (maybe perpetrators think they definitely will not be caught, but they're also fallible and so sometimes wrong). It may seem rational to a policy-maker to assign a punishment which is proportional to _how much you want to disincentivize a behavior_, rather than just the severity of the crime. But this can get them in trouble:
{: .indent }

Suppose that the citizens of a city are _so incredibly tired of jaywalking_ that they decide that the penalty for jaywalking is unconditional life-imprisonment. Well, that might _seem_ like a good idea, but humans don't and never will make accurate utilitarian judgments. 
{: .indent }

Someone's going to jaywalk anyway, thinking they won't be caught, when they realize they're being tracked down they'll become incentivized to do _almost anything_ to evade capture, so long as the outcomes of that action aren't as bad as life-imprisonment. Pretty soon your jaywalkers are hijacking planes and escaping to South America, all becomes the harsh punishment was more of a dramatic distortion to incentivizes than was realized.
{: .indent }

### 4

In the game of trying to determine _what is true_, using your fallible senses and faculties of reasoning, there is an outcome floor created by the effect that: if you _completely_ disbelieve your own ability to reason about the world, then you are totally lost. You may as well give yourself some credit and then risk being wrong anyway, because completely disbelieving in yourself is a gauranteed failure, while being wrong is just a possibility.
{: .indent }

An example: while a person who is hallucinating may be correct to heavily prefer other people's descriptions over their own fallible ones, they have to at least believe _something_ about their own perception. If they disbelieve _everything_ then they'll have to disbelieve the communications of reality from less-fallible people around them, leaving them with no way to discern what is real at all.
{: .indent }

Another: in my [previous post]({{ site.baseurl }}{% post_url 2018-11-01-summations %}) I claimed that even if lots of experts swear that, somehow, the sum of positive numbers can equal a negative one: $$1 + 2 + 3 + \ldots \stackrel{?}{=} -\frac{1}{12}$$, a layperson should still reject that -- because if they can't reason intuitively about basic properties of addition, then all mathematical knowledge is essentially useless to them. If you're trying to be right you should believe yourself instead of them; and figure that somehow, no matter how small the probability, the experts are wrong (or -- more likely -- miscommunicating, somehow talking about something subtly different without being precise).
{: .indent }

This doesn't excuse a person from accepting expert consensus, though. If the entire body of climate scientists is telling you that the climate is getting warmer, you may _think_ that that sounds intuitively absurd, but you also have no reason to believe you have any meaningful intuition about how climates work -- whereas you do have practical understanding of addition, because you can test it out with coins or rocks or something.
{: .indent }


--------

Thinking in terms of outcome floors tends to reveal the danger of trying to make utilitarian-type decisions using a broken utility function.
{: .indent }

If your utility function for a decision assigns an "impossibly high magnitude" value to _any_ space of outcomes, then it warps the space of decisions to avoid that space at all costs. And it doesn't have to be infinite, just unreasonably higher than everything else, to have this effect. Examples:
{: .indent }


### 5

If being late for work one more time means you will be unconditionally fired, and that is 'maximally bad' to you, then you should rationally take _any_ action to be on time, including driving massively unsafely or baldly lying about the reason for your tardiness.
{: .indent }

Incidentally, take this as an example that treating being late as a dire outcome is a _bad_ idea. I find in life that whenever I'm running late for something, if I take risks to try to get there faster, I invariably end up later, no matter how good of an idea it seemed at the time. In real-life stressful situations it's often best to play to _minimize losses_, rather than _minimize the chance of loss_, and an in fact that's kind of the whole point here: if you optimize for the wrong thing you can do terrible suboptimal things by accident.
{: .indent }

### 6

If you think of being unemployed as maximally bad due to fear-of-uncertainty or the stigma of unemployment, you might stay at a job that is making you miserable because you're not correctly evaluating if having the job is the optimal move for your own interests in your life.
{: .indent }

### 7

If a self-driving car (or any AI) is programmed to avoid killing a human at all costs, but it is also not omniscient, then it may take exceedingly dangerous actions which risk human lives in ways it _can't_ predict -- like, say, driving off a bridge to avoid hitting a pedestrian.
{: .indent }

### 8

If a person's mental biology causes them to massively over-prioritize "avoiding embarrassment", then they might take behaviors which seem superficially to go dramatically against their own interests, like becoming a complete hermit who avoids all human interaction.
{: .indent }

------

Sometimes assigning an impossibly high magnitude to an outcome is a _good_ idea, though, and doing it honestly will give better results than your natural intuition will:
{: .indent }

### 9

If you are suicidal, but believe that death is the 'maximally bad' outcome (which certainly sounds reasonable), then you should rationally take _any_ action to avoid dying, including, say, things which seem incredibly uncomfortable according to the other preference-systems in your brain. Like -- I don't know, screaming in public for help, or running away from your life, or doing stigmatized things to improve your situation like being completely and utterly honest with everyone you meet.
{: .indent }

-------

And of course an 'outcome floor' could be an 'outcome ceiling' instead:

### 10

If you think of winning the lottery as being an "infinite utility" result, and fail to correspondingly think of it as having an "infinitesimally small chance of occurrence", then you may erroneously assign infinite value to the purchasing of lottery tickets with every available dollar, even though the expected value for you is actually (a) finite and (b) negative. (And even if it's a positive return in _dollars_, it may be a negative return in _utility_, due to diminishing returns in the marginal utility of successive dollars.)
{: .indent }

------

Basically I think that understanding this effect is a critically important part of human rationality. Being near an outcome floor can make utility calculations radically different, but you _must_ also consider the implications of your own irrationality and fallibility, because the gap between your approximate intuitive utility function and "the function that would actually be optimal for you" can lead to your making _dramatically suboptimal_ decisions in your actual life. And, well, it's pretty likely you're going to want to avoid that if you can see it coming.
{: .indent }

--------

## 2. Metagaming

Ultimately your brain is trying to succeed, and it knows that it's fallible, which means that even if you perceive an outcome floor, you might be wrong about where it is or what it compels you to do.

This gets complicated when you start trying to make good choices in an environment where you and everyone else are fallible to different degrees, and you're fallible about how fallible you and they are, and etc _ad infinitum_. These types of calculations are called "metagaming".

Here are some examples of how this works in chess, which I've been playing a lot of online lately (I'm still not very good, but I've shown a lot of improvement!)

### 1

In chess or any other two-player zero-sum game, if you are behind (down a piece of something), it begins to make strategic sense to make the board more complicated. 
{: .indent}

Both players are imperfect, of course, and have to run mental computations to make good moves, avoid bad moves, and exploit their advantage. If you are already losing, then you (presumably) have a disadvantage in subsequent computations -- so it becomes advantageous for you to make the _variance_ on outcomes higher, by complicating things so that there's a higher chance of getting lucky with your opponent making mistakes. So you don't trade down to fewer pieces (because that leaves fewer opportunities for errors), you add pressure instead of resolving it, and you make moves which prioritize locking everything up and making your opponent unable to exploit their advantage until you can find a way to equalize.
{: .indent}

Conversely, if you're _ahead_ in chess, your optimal play -- assuming you can't compute a way to exploit your advantage and win immediately -- is to do the opposite: simplify the situation until your numeric advantage is more valuable.
{: .indent}

A simple heuristic version of this is that the difference between "strengths" of, like, `40` to `45` is a much smaller ratio than `5` to `10`, so you try to 'cancel' out strengths on both sides so that your _relative_ strength is more overwhelming.
{: .indent}

Generally when you gain an advantage of your opponent, there's a sort of 'attenuation time' in which you can immediately exploit that advantage, wherein you're trying to make sure the advantage carries forward and your opponent is trying to freeze things up so that you can't quickly exploit your advantage, giving themselves more time to equalize.
{: .indent}

At higher-levels of play, everyone is usually so impeccable that once you're behind, if you can't turn things around in a few turns, you've definitely lost. In fact that is presumably one of the core aspects of 'higher-level' play. Your calculus of "maybe I can catch my opponent in an error" becomes less valid given more evidence that the opponent doesn't make those kinds of mistakes -- which is definitely encapsulating in your opponent's rating. This is why grandmasters often resign as soon as they lose one piece, or, conversely, why they agree to a draw as soon as the game gets too simple to find an advantage in.
{: .indent}

But at lower levels (where I am), even after a blunder there are going to multiple egregious mistakes on both sides before the game ends, so you can keep playing and hope that they work out in your favor. And this is where complicating things can be valuable, because the relative value of a numerical advantage is flattened out by the equalizing effect of both players having to not mistakes in their analysis. One curious effect is that a game when played by weak players can look and feel _nothing_ like the game does at higher-levels of play -- and it can be very satisfying to improve because it's delightful to get to play the "actual" game instead of the farcical imitation which is bad players blundering every other move.
{: .indent}

--------

### 2

The precisely opposite strategy becomes important if you're playing someone who is significantly _better_ than you. A much higher-rated opponent is, presumably, much higher-rated because on average they are going to make much better moves than you. Your best way of playing against a stronger opponent, in terms of "the highest expected value result", is to play for a draw, by eliminating complexity which eliminates situations they can exploit to beat you.
{: .indent}

Even in a game where drawing isn't an option, though, it makes the most sense to play in such a way that they _can't exploit their advantage_. Which means giving them fewer opportunities to make moves which will outsmart you, which means making the game _simple_. So you trade down, play for an endgame, and try not to end up in a situation in which they walk over you.
{: .indent}

At the same time, the argument for example (1) still applies: you're more likely to get lucky and find a winning move in a more complex situation than a simple one. So there is presumably some inflection point where, when you're sufficiently behind, it becomes better to play for a complex game than a simple one. And there must be an inflection point where if they're not _that_ much better than you, it is no longer valuable to play for a simple game, because the difference in the quality of their moves won't be sufficient to make that necessary.
{: .indent}

Again there is a converse strategy if you are the stronger opponent. If you know you calculate much better, you make the game complex so you come out ahead. If you are ahead, you make the game simple so they have fewer chances to get lucky.
{: .indent}

Whatever you do, though, when it comes down to it, your ability to handle the game-theoretic realities of the matchup ends up _determining_ your strength, which itself reflects your probability of winning the match.
{: .indent}

I think this is interesting because it is remarkably orthogonal to what I _think_ of as being measured by your 'strength' at a game like chess. It seems like 'strength' means 'making better moves'. But you end up metagaming regardless of your strength, playing to your advantages in each situation and vs each opponent, in ways that can recommend that you make moves which, _according to your imperfect algorithm_, you think _aren't_ the best moves! Which means that strength at a game (ELO rating, for chess players), is actually measuring a combination of several factors, including both your ability to make good moves and your ability to situationally metagame your move-making algorithm.
{: .indent}

I imagine there is some theorem that can be written down which bounds this behavior: given some type of knowledge about the quality of your and your opponent's moves, there is a bound on how suboptimally it can ever be reasonable to play on purpose, according to your own algorithm. But I don't know where to start with trying to make that precise.
{: .indent}

-------

### 3

There's yet another facet to this when _time pressure_ comes into play. Chess is usually played with a clock so games don't go on forever; regular tournmanents have time controls like "thirty minutes" or "an hour" for each player, but I mostly play online with about five minutes.
{: .indent}

When you run out of time, you lose -- even if you're winning by a lot. This changes the "optimal move calculus" once again. Now if you're behind you can try to play moves which _take a long time to deal with_; usually these are the moves which make things more complex. And when time is getting short, it becomes more optimal to _quickly make pretty-good moves_, rather than _slowly make optimal ones_ -- especially because you want to leave time banked up to deal with any surprising complexity later on.
{: .indent}

With time pressure included, if you're behind you want to make your opponent have to think, while leaving yourself time to think when they make suboptimal moves due to running out of time to think. If you're ahead, you want to use your advantage both to make your opponent lose directly, and to use your advantage to force them into using more time. 
{: .indent}

Being ahead in material only translates into a win if you do the work to make it win. But time is a 'continuous resource' -- it can pay out in any granularity, rather than only in the binary outcome of "win" or "lose". So one way to play speed chess is to try to balance two algorithms: one of making good moves that gain material advantages, and one that tries to "trade" abstract advantages like position or material for numeric advantages in time -- and part of your skill as a player is the "exchange rate" you can manage to bargain for in this.
{: .indent}

We might model time pressure as a bound on the computation time of the algorithms being used to make decisions. Then it's interesting and maybe mind-bending to consider: your algorithm has to use the resource of time to make a good decision, but it also has to compute what a reasonable tradeoff between time and move-quality is, plus it has to consider the error in its consideration of time and move-quality, etc. It's a miracle we ever get anything done at all.
{: .indent}

-----

## 3. Breaking Through the Floor


It is interesting to think how you would remove or lessen an outcome floor's utility-distorting effects. Given a game which collapses a score to a binary outcome, how do you get rid of the chaos-under-pressure effect?

One way is to remove the binary outcome entirely. This is pretty easy if the game uses a point system internally, like basketball or Go. If the game is played to achieve the highest possible point value, then your play doesn't change very much near the end of the game (only adjusting for something like "moves which won't pay off before the game ends"). But playing a game for points isn't very much fun, which is why almost no games do that. It might make sense over many repeated games, say in a tournament. The style of play will change to become much more greedy, as victors try to get as much value as possible out of each of their wins.
{: .indent}

More generally you could map the final score via any monotonic function of the final number of points -- so that, say, winning by $$0.5 + p$$ gives $$10 + p$$ points. Any function you choose will end up transforming the utility functions of moves in the game in complex ways, as well as transforming the utility function of a player who is trying to meta-reason about their own fallibility in score-keeping. But any reasonable choice of function should still make it very valuable to win at all, while making it marginally _more_ valuable to win by a lot. And what constitutes optimal play should vary smoothly with the choice of function -- such that when the game really is just win-or-lose you recover regular play, but play smooths out as the outcome space does.
{: .indent}

You could also keep the binary outcome but make the winning probabilistic: perhaps the higher-scoring player has a $$0.75 + 0.25 (1 - \frac{1}{p})$$ probability of winning, where $$p$$ is still how many points they've won by. Of course it would feel grossly unfair to lose when you came out ahead in any single game -- but over many games the better player would still win and the result would still reflect the players' skill. This, too, would distort the utility functions of moves in mathematically complex ways, but would no-matter-what "soften" the outcome-floor effect considerably.
{: .indent}

As far as I can tell, there is no good way to do this for a game like chess without imposing a 'scoring system' on the game as an intermediate step which drastically alters the gameplay. Of course any new utility function changes the game, but, in the case of a game like chess the resulting play is unrecognizable: if you probabilistically assign winners based on how many pawns you're up by, or something, then the game becomes very different, as players try to win material and then take all their opponent's pieces before checkmating them.
{: .indent}

What would happen if some smoothing-of-binary-outcomes were applied to the real-world examples listed above. Perhaps the more egregious your crime, the higher the _probability_ of a drastic utility-distorting outcome? Perhaps that's already how it works? Do you already mentally model it that way?
{: .indent}
