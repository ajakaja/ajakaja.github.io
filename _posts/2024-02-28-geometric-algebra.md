---
layout: blog
title: "The Case Against Geometric Algebra"
footnotes: true
math: true
aside: true
tags: notes
---

Normally I show up in the comment sections of the internet when they talk about Geometric Algebra saying something like: "wait wait, don't believe these people who tell you GA is the way to fix all of math. It's clearly onto something but really there's a lot wrong with it. What you probably want is just the wedge product and the concept of multivectors!" Which is not especially productive and probably a bit unhinged. So, today I'm going to actually make those points in one central place that I can link to instead.

I'm not opposed to GA per se. What I (and a lot of other people) have a problem with is that the subject is pretty clearly flawed... and that the culture around it does not seem to realize this or be interested in addressing those flaws. 

In particular, **Hestenes' Geometric Product is not a very good operation and we should not be rewriting all of geometry in terms of it**. For some reason GA wants to do this and it loses almost everybody else. And then they say "clearly this is the way that geometry should be done, everyone else just doesn't see it yet" with a sort of religious zeal that is problematic and offputting. It's also just ineffective: treating certain models as if they are somehow canonical and obvious and perfect is wrong, mathematically and socially, and it puts people off right from the start. There probably is a place for the geometric/Clifford product in a grand theory of geometry, but it's not "front-and-center" like GA treats it today, and as a result the theory is a lot less compelling than it could be.

<!--more-->

If something like GA is to succeed, it will need to be improved. It will need to fix the problems with establishment mathematics better than it does now, in a way that everyone can get behind. Today it helps sometimes, but often misses the mark, and people who can see that are alienated by the lack of self-awareness about this. This means that the movement ends up accumulating a particular type of... zealous person... and loses almost everyone else.

As a result GA's relationship to mainstream mathematics is tenuous. It is considered a kooky, crackpotty sideshow. And it _really_ doesn't help that a lot of GA proponents write about it in a pseudoreligious way, as if the reason GA is not mainstream is that they are being oppressed by close-minded traditionalism (when in fact it is just _not very compelling_ at the moment).

Yet GA does find more enthusiasts every year, and it will take those new people a while to realize what's going on, and in the meantime they will go on selling other people on GA and repeating the cycle. I think this is causing GA to be stuck in a sort of perpetual mediocrity. My purpose in writing this is to push it to improve and address those problems and help it get out of there.

The rest of this article substantiates my stance. It's very long. That's because... I don't know, nobody else seems to be complaining about GA even though a lot of people have the same basic reaction to it, so I wanted to sort of provide all of the counterarguments in one place? And also because I got carried away. But I want to emphasize that, although this is my own long and opinionated rant, I am far from the only person who feels this way. Most of the people who roll their eyes at GA just move on and ignore it. But I actually _do_ believe in the philosophical project that GA is trying to solve, just not in how it's doing it right now, so I want to try to help it along.

----------

Disclaimer: I'm not a professional mathematician, and I think about math in a different and more dubious than research mathematics does. This is _not_ going to be the case that a serious mathematician would make, which is probably something like "GA doesn't prove anything new so who cares?". (The goals of research mathematics are rather unrelated to the goals of people who use mathematics for practical purposes.) Also, since I do more-or-less subscribe to the underlying program of GA, I am at least slightly on the crank side of the fence as well. Take me seriously at your own risk.

----------


# 1. A lot of background on GA

First I am going to describe my understanding of what GA is, where it lives in relation to the rest of math and physics, and how it got to be the way that it is. This will be useful in order to pinpoint exactly what we're disagreeing about here. Also it might be nice just because as far as I know the whole story isn't well-documented anywhere else. So I am going to lay out the rough narrative that I have in my head. It is mostly just stuff I've pieced together over the years, and I admit that I am no historian and don't really know how to check it against reality. I'd be happy to be corrected on any of this.

### What is Geometric Algebra?

[Geometric Algebra](https://en.wikipedia.org/wiki/Geometric_algebra) is both a social movement and a branch of mathematics.

As a social movement, it's a group of people who believe that (a) mathematics writing and pedagogy ought to be reformulated to be more useful, especially to its users who are not research mathematicians, and (b) this reformulation ought to be done in terms of a particular set of primitives. This would mean rewriting multivariable calculus, linear algebra, differential geometry, etc into a new language which is (somewhat) an alternative to vector and matrix algebra. The argument for doing this is that it would make a lot of math simpler, easier to understand, and easier to use for practical purposes.

As a branch of mathematics, it is a recasting of a subject called [Clifford Algebra](https://en.wikipedia.org/wiki/Clifford_algebra) (CA), which is a somewhat-obscure descendent of the subject of [Exterior Algebra](https://en.wikipedia.org/wiki/Exterior_algebra) (EA), which is sort of like chapter two of linear algebra if undergraduate linear algebra is chapter one. EA is basically well-known to mathematicians and physicists but not commonly taught at the undergraduate level; my impression is that it is gradually becoming ubiquitous at the graduate level. Clifford Algebra is sort of like a more advanced version of EA; it is much less widely known but it is well-established in certain subfields of math and physics. Geometric Algebra attempts to take the ideas of Clifford Algebra and Exterior Algebra and spread them much more broadly, rephrasing other aspects of math in terms of those new concepts and operations. Exactly which ideas and operations those are depends on the author, but everyone who uses the phrase "geometric algebra" pretty much agrees that operations from CA and EA are useful and ought to be more widely used.

Because it's important to understand which parts are GA and which parts aren't, here is how the various algebras relate to each other:

Exterior Algebra is built on the 'exterior product', denoted $$\b{a} \^ \b{b}$$, commonly called the 'wedge product' because it looks like a wedge. It incorporates the concept of 'multivectors' in a vector space, and some other natural operations that those imply (the Hodge star $$\star$$ and an interior product, which generalizes the dot product to multivectors.)

EA comes up naturally in abstract algebra (the exterior algebra is a basic quotient of the tensor algebra which is a basic construction on vector spaces), and in various fields downstream of abstract algebra, such as algebraic topology. It also seems to exist in combinatorics literature with a somewhat different set of notations.  More generally, EA provides the only actually good way of looking at vector algebra concepts like determinants, matrix minors, and cross products, by modeling them as multivectors in an explicit vector space $$\^^k \bb{R}^n$$; this perspective seems to be gradually infiltrating the literature that touches those subjects, but it mostly has not made its way into the undergraduate curriculum yet.

Clifford Algebra is, roughly, an extension of EA which allows it to generalize the complex and quaternion number systems. They are formally constructed as a quotient of a tensor algebra, but the procedure is very intuitive. To multiply two multivectors like $$(\b{xxy})(\b{xy})$$, you are allowed to exchange elements using $$\b{xy} = -\b{yx}$$ and to cancel out elements using a bilinear form $$Q$$, such that $$\b{xx} = Q(\b{x}, \b{x})$$. $$Q(\b{x}, \b{x})$$ is almost always defined to be $$1$$, $$0$$, or $$-1$$. The resulting algebra is labeled $$Cl_{p,q}$$ or $$Cl_{p,q,r}$$ where $$p$$ is the number of elements that square to $$1$$, $$q$$ the number that square to $$-1$$, and $$r$$ the number that square to $$0$$. As a result you get an associative algebra where most elements are invertible (so you can talk about the multiplicative inverse of a vector $$\b{a}^{-1}$$). This allowing you to take a bunch of objects, expressed as sums of multivectors, and basically do polynomial algebra on them.

Physicists probably know EA specifically from its ubiquitous use in General Relativity, where it shows up as the "exterior calculus of differential forms", which are used to express differential geometry in a coordinate-free way. (For some reason, for the later half of the 20th century, physics mostly treated EA as _just_ a thing you do with differential forms, instead of a general theory of vector algebra.) Physicists also have usually used Clifford Algebras, because they're the algebra of the Pauli and Gamma matrices from quantum mechanics, although at least at the undergraduate level it's rare that physics actually refers to them by name (my quantum course did not even mention that the Pauli matrices were quaternions). Clifford Algebras are also apparently heavily connected with the theoretical frameworks that underly spinors and more generally representation theory in a way that I don't quite understand yet.

Point is, GA does not have any claim to the wedge product or even the Clifford/geometric product per se. GA's main difference is that it attempts to go back to lower-level math---vector algebra, calculus, basic physics like mechanics and electromagnetism---and rephrase them in terms of the Clifford/Geometric product, plus the other concepts of EA.

In practice GA refers to **the particular platform and social movement which descends from the work of David Hestenes in the 1960s**. Specifically, it does _not_ refer to the underlying material of Clifford Algebras, which predate Hestenes and are also found in several other subfields of math and physics, but rather how they are used, conceptualized, and taught. Sometimes GA people will defend GA by saying "it's just Clifford Algebra which is really important in math, how can you have a problem with it?", and that misses the point. GA is not the material itself; it's the material plus the ideology and framework that is draped over the material.[^ga] 

[^ga]: Because some people disagree about this is _definitely_ how the term "GA" is used in colloquial parlance, I swear. This is despite the fact that Clifford himself called the operation the "geometric product". Quoting Hestenes: "Do not confuse Geometric Algebra (GA) with Clifford Algebra (CA)!" That said, this is all shifting over time, especially as the GA movement and the Clifford Algebra research world do more cross-pollination, and as more people learn about GA without interacting with the movement itself (particularly in computer graphics).

Probably both GA and EA could be considered as members of the larger subject of "multilinear algebra" which would include tensor analysis and all of linear algebra as well. There's an argument to be made that they are really just "the rest of linear algebra", the big part of it that isn't included in introductory texts and hasn't entered the mainstream yet. Perhaps in 100 years they will be fully folded into the standard curriculum.

----------

### An Approximate History of GA

GA is mostly less well-known in mathematics and physics than EA. Yet has a strangely large number of people advocated for it, particularly online in communities, articles, videos, and conference talks. Why? Well, here's a basic history that sort-of explains why it was unknown in the first place, and why it is increasingly not.

GA was more-or-less invented in the late 1950s by [David Hestenes](https://en.wikipedia.org/wiki/David_Hestenes), who made it his project to popularize it for the next fifty years. The underlying ideas date back to Clifford around 1878, who himself was extending Grassmann's "Extensive Algebra" from the 1840s. (I'm told that Clifford coined the term "geometric product" for the operation.) The story is that 1959 Hestenes, unsure what original research to do in graduate school, randomly came across some published lecture notes of Marcel Riesz in the UCLA library on the subject of Clifford Algebras, immediately realized the similarity to the gamma matries of quantum mechanics, and decided that this was the right way to reformulate all of vector algebra.[^story] Half of his thesis became about the subject,and most of the content was later published in a 1066 book called "Space-Time Algebra" which gradually popularized his ideas quite a bit. Hestenes' plan was to transform Clifford Algebra, otherwise a fairly niche part of mathematics, into the main language in which all of physics was expressed: that everything should be reformulated in terms of multivectors, wedge products, and especially the geometric product. IMO that switch is what changes the subject of "Clifford Algebra" into the subject of "Geometric Algebra".

[^story]: The story is from "Grassmann’s legacy" from the 2011 book "From Past to Future: Grassmann's Work in Context".Riesz's lecture notes are available most readily in a 1993 book "Clifford Numbers and Spinors".

Hestenes slowly popularized his ideas and published more papers on the stuff for a few decades,[^traction] but it sounds like things really started to pick up with a conference at the University of Kent which was started by Roy Chisholm in 1985, as well as with the various works of Pertti Lounesto.[^lounesto] Momentum picked up when a group out of Cambridge ([website](http://geometry.mrao.cam.ac.uk/)) got interested around 1988, in particular Anthony Lasenby, Joan Lasenby, Steve Gull, and Chris Doran. The Cambridge group began putting out papers in the 90s with names like "Imaginary Numbers are not Real" and "A unified mathematical language for physics and engineering in the 21st century" which appealed a lot to people who had, for instance, lingering reservations about the use of complex numbers in physics, or about the philosphical interpretations of Pauli matrices and spinors.

Over the years Hestenes and especially the Cambridge group seem to have published papers which reformulate every part of physics in terms of GA. They were refreshing when compared to mainstream physics, which seemed dogmatic and bizarrely willing to accept things that should have still been up for debate. (Of course, that is how fringe ideas always view mainstream ideas.) So the appeal, and the reason that keeps catching more people's interest, is that it is at least trying to solve things that are legitimately bothersome (to a certain type of person).

By the time I was learning about differential forms in college around ~2010, knowledge of GA was ambiently floating around online and I came across it at some point, and a bunch of fairly accessible books had been published (I'm thinking of Doran/Lasenby's *Geometric Algebra for Physicists* in 2003, Fontijne/Mann/Dorst's *Geometric Algebra for Computer Science* in 2007, and Macdonald's *Linear and Geometric Algebra* in 2010). The ideas of GA tended to show up if you went googling for intuitive explanations about forms, spinors, quaternions, or gamma matrices.

[^traction]: Many details are available in Hestenes' essay "The Genesis of Geometric Algebra: A Personal Retrospective", although dang do I wish he would stop acting like all his work is the greatest stuff on earth.

[^lounesto]: Lounesto is kind of hilarious. He's apparently a very blunt Finnish guy who went around finding errors in everyone else's publications about Clifford Algebras and collecting them all on [his website](https://users.aalto.fi/~ppuska/mirror/Lounesto/counterexamples.htm).

There is a type of person (of which I am one) who will never be happy with the way that complex numbers are used in quantum mechanics,[^complex] while everybody else goes on not worrying about it because the theories do, at least, get the right answers. Such people also tend to be displeased with the arbitrariness of the Pauli and Gamma matrices, and all of the index-juggling manipulations of general relativity, and the use of commutators in quantum mechanics and analytic mechanics, and other such "non-geometrical" operations. Most frustrating, though, is the fact that most of the physics literature seems to not regard these things as problems, and that you are just supposed to learn and use them and so you don't find a lot of sympathy when you want to make sense of them. (Pauli matrices, at least, could be recast in terms of the quaternions $$\bb{H}$$, but that doesn't help, given that quaternions are just a higher-dimensional version of $$\bb{C}$$.)

[^complex]: The answer, at minimum, is at least trying to name what space they're supposed to be rotations in, even if to just give it in a name like $$X$$, and then write $$R_{X}$$ instead of $$i$$. Are all the $$i$$s of QM experimentally proven to be in the same space? I'm not sure anybody knows. Is it the $$U(1)$$ gauge field of E&M? Your intro quantum book doesn't mention it; it treats them as axiomatic.

Unfortunately, while the GA folks were clearly onto _something_, the response has not been all that enthusiastic and the uptake is slow. Why? Well, I think it's because in practice their reformulations are not all that useful for actually doing or understanding physics. (My opinion, but seriously, go read them.) It turns out that writing everything in terms of the geometric product does not make it easier to understand. The valuable parts, I think, were the parts that were using the _wedge product_ more liberally than physics had before; the usage of the geometric/Clifford product was always quite a bit more suspect (but that's the point I'm going to make in detail later). As a result a lot of physicists are probably aware of geometric algebra but not a lot of people are publishing papers in that language, and very few people are teaching, like, undergraduate classes about it.

------

Okay, that's the physics angle. But there is another part of the story in more applied fields: computer graphics and robotics.

Around the same time time period (1990s-2010s), a lot of new people were writing code that had to handle rigid motion in space, and invariably they tended to encounter quaternions as well. By the 90s it had been understood for a long time that quaternions were the better way of modeling rotations in 3d space, compared to e.g. Euler Angles, because they treated every axis of rotation equally and allow for smooth interpolation between any two points (and also they avoid "gimbal lock", as nobody ever neglects to mention). In hindsight, it turns out that when you want to model an unfamiliar noncommutative algebra like $$SO(3)$$, it is very important to use an actual algebraic model of it instead of a poor approximation. But quaternions are a pedagogical nightmare (go look how many Youtube videos there are explaining them!) So when the GA people came along and started talking about bivectors and rotations in a way that actually made some sense, a lot of people were interested. 

And there are many more difficult computations in these fields which are more complex than simple rotations. Rigid motions of objects, for instance, involve moving a lot of lines, planes, tangent vectors, etc in space, plus interpolating between their positions smoothly, plus doing all kinds of intersection tests, sidedness tests, for e.g. culling objects which are occluded or offscreen, plus all of this has to be projectively transformed according to the position of a camera or sensor. Quite a bit of literature on GA has come out of translating these operations into GA terms, and there are a number of vocal proponents of doing it this way: a good chunk of the GA literature you come across is in graphis or robotics papers and conference proceedings.

These applications tend to focus on particular choices of Clifford algebras which are suited to different types of geometric problems. It was already widely understood that projective geometry allowed one to represent rotations and translations in $$\bb{R}^3$$ with a single linear operator on $$\bb{R}^4$$. Geometric algebra extends this by starting from $$\bb{R}^3$$ and adding some number of additional basis vectors that allow modeling various kinds of objects with Clifford-Algebraic operations. These theories attempts to replace the existing quaternion-like formulations of rigid geometric, such as [screw theory](https://en.wikipedia.org/wiki/Screw_theory) or [dual quaternions](https://en.wikipedia.org/wiki/Dual_quaternion).

I believe the first of these was Projective Geometric Algebra (PGA) from a paper by Jonathan Selig in 1999 (in a robotics journal). (I'm not sure which ideas are attributable to him, though: he cites Ian Porteous's 1969 book *Topological Geometry* which has a bunch of Clifford-Algebra-based geometric algorithms, although in general it's written in the much more technical "Clifford Algebra" style instead of the "Geometric Algebra" style; also it mention that Clifford himself studied biquaternions to implement rigid body motions.) Selig's PGA uses $$Cl_{0,3,1}$$, but it seems like later authors use $$Cl_{3,0,1}$$ instead. "Conformal Projective Geometric" follows shortly after and uses $$Cl_{4,1,0}$$ to model the objects but now also includes circles and rotations as multivectorial objects with the help of an additional basis vector. I don't know a lot about these, except that the texts on them are strangely difficult to read because they use very unorthodox representations for basic objects like planes and points: for instance in CGA a point $$\b{x}$$ is modeled as $$\b{x} + \frac{1}{2} \b{x}^2 (e_{-} + e_{+})$$? Seems weird to me but some people seem get very excited about it.

-----------

As for pure math---it seems like research mathematics readily talks about and uses "Clifford Algebra", but is uninterested in or specificaly avoids the terms and concepts that are specific to Hestenes' "Geometric Algebra". I can speculate as to why: even by the 90s/00s, GA had gotten a bad reputation because of its tendency to attract bad mathematicians and full-on crackpots (Hestenes honestly sounds like one a lot of the time, and I'm not really sure whether he is or isn't). It makes sense, really. There are a lot of people who found it appealing for the reason I did: because the existing models of vector algebra and quaternion rotation were deeply unsatisfying. But it turns out that those reasons _disproportionately_ attract people who are not actually capable of rigorous mathematics, or are slightly prone to conspiratorial thinking, or are otherwise slightly deranged (also like me? TBD).

I guess there are more people who can tell when math is weird or unsatisfying or bad... than can do good math themselves. So GA ended up appealing to a lot of fringes: people who only had undergraduate degrees, people who had dropped out of PhDs, people with PhDs from unrigorous programs, people who had been good at math but were perhaps going a bit senile, random passerbies from engineering or computer programming, run-of-the-mill circle-squarers, people who had a bone to pick with establishment mathematics and felt like all dissenting views were being unfairly suppressed... And these were the people who started publishing a lot of stuff about GA, often dressed up to look like more serious research than it was. Indeed, if you look around for papers that explicitly talk GA, they _very_ disproportionately (a) are non-theoretical, (b) are poorly-written, (c) are trivial, i.e. restating widely-known results as if they're novel, (d) only cite other GA papers, and of course (e) are just plain crackpotty.[^vixra]

[^vixra]: For instance try searching [viXra](https://vixra.org/), that is, crank ArXiv, for the phrase "geometric algebra". (Aside: if I ever have a beautiful Theory of Everything to share with the world it has occurred to me that it would be funny to post it on ViXra instead of somewhere reputable, just to confuse everyone. Don't write them off completely!)

It didn't help that a lot of the texts by the _actually_-competent GA people, like the Cambridge group, tended to say things that sounded and still sound kind of crackpotty as well. LIke they would constantly say things like "this new theory is going to fix everything", which is exactly what the crackpots also say, and for the same reasons (the validity of a statement like that is completely conditional on a person's ability to actually distinguish truth from fiction). Or they were just filled with unnecessary ostentatiousness, such as (quoting here) "we have now reached the part which is liable to cause the greatest intellectual shock". Or acting like results in GA are new and novel when they're clearly just using wedge products the same way that physicists had regularly done for decades. Or acting aggrieved that the rest of mathematics is ignoring them. Or, worst of all, claiming that all the new GA equations are simpler than the old ones, while referring to equations which were _clearly not simpler than the old ones_.

So I suspect that what has happened is that competent mathematicians have tended to distance themselves from the term Geometric Algebra due to its dubious reputation (a sort of adverse selection). Which of course leaves GA with an even higher ratio of cranks, because most of the non-cranks left. In fact I suspect that mathematicians sometimes publish papers about "Clifford Algebra" when they want to talk about the _exact same material_, not even the super-theoretical version, but without the negative associations. And some of the serious GA-adjacent research on ArXiv is just under the name Clifford Algebra instead.

To be clear, I don't think it has been wrong to disassociate from the name "Geometric Algebra". GA's dubious reputation among mathematicians is _well-deserved_. I'm doing it too---that's why all of my posts on related subjects are about exterior algebra instead (well, that and I am not trying to talk about the Clifford/geometric product).

But that doesn't mean GA isn't _also_ onto something. It just means that there's a lot of low-quality stuff under the same label, which has made that label questionable, and if you want to sift through it you have to be ready to filter for quality yourself.

Also, as a result of its popular appeal and fringe status, there are a lot of online discussions dedicated to GA. Actually a shocking number, if you go look for them. off the top of my head there's a website called [Bivector.net](https://bivector.net/) which has forums and a Discord that (as of this moment) has 200+ people online, which I guess feels like a lot for a _community about a fringe mathematical theory_. Plus a few other forums. Plus people show up talking about GA in the comment sections on every other math-related forum if anyone asks any questions about quaternions or bivectors. Plus there are the countless Youtube videos, conference talks, expository PDFs, standalone websites, etc. And then there are whole offshoots of GA, like Conformal Geometric Algebra and Plane-Based Geometric Algebra, that have their own enthusiasts and sometimes their own websites as well. Etc.

This is not really a bad thing either. If anything what it shows is _how many_ people are passionate to see math reformulated in a way that makes more sense---so many that they'll convene and talk about it on every one of the bizarrely-inadequate social networks we have in 2024. And that's part of what is motivating me to write this article (which is getting very long now...). GA has got something of the right idea and people recognize that and latch onto it. I happen to think that it is almost certainly right that modern mathematics needs a more intuitive foundation. Research math knows a _lot_ about geometry, but although most of the knowledge required to do all the things people actually want to do with geometry is out there _somewhere_, it's not accessible or intuitive and the details are only really available to specialists.[^reddit] At some level GA is trying to "democratize" geometry.

[^reddit]: For instance the most common stance on the r/math subreddit looks like [this one](https://www.reddit.com/r/math/comments/1ghw4b/why_isnt_geometric_algebra_more_widely_taught/): "From what I have seen, Geometric Algebra is just a rehashing of existing math.". Which, yes, I agree, but the point is to make the existing math more intuitive, not to discover new results. The fact that research mathematics is generally _not_ concerned with making calculation and intuition easier to think about is, I think, a giant failure that it will eventually regret. There's as much value in making things easy to use as there is in discovering them. At this point probably more. Picture if nobody had started teaching non-mathematicians calculus because it was just for experts---it feels like that.

So basically I _do_ agree with them: GA is onto something, which is that geometry deserves more intuitive foundations, and multivectors and the like are probably a big part of it. The problem is that... GA isn't quite it.


----------

# 2. The Actual Case Against GA

As I wrote above: _Exterior Algebra_ is clearly valuable and widely used already in graduate-level math and physics. _Clifford Algebra_ is clearly widely used in theoretical mathematics and anything that has to do with spinors. So _Geometric Algebra_ ought to be evaluated on what it adds on top of those.

So what does GA specifically say?

As I see it, GA is not so much a subject as an ideological position, consisting of basically two ideological claims about the world:

1. **Claim 1**: That the concepts of EA (so, wedge products, multivectors, duality, contraction) are incredibly powerful and ought to be used everywhere, starting at a much lower level of math pedagogy---basically rewriting classical linear algebra and vector calculus.
2. **Claim 2**: That the Geometric Product (henceforth: GP) should be added to that list as the most "fundamental" operation, where by "fundamental" I mean that they would have all of the other operations constructed in terms of it and generally state theorems in terms of it.

Claim (1), I believe, is completely correct, and is responsible for much of the reason GA _has_ gotten so popular. Exterior algebra and the general idea of doing geometry with multivectors is incredibly powerful and intuitive and it ought to be widely used and taught to everybody, and we should all be reading and writing new textbooks that incorporate it. It's so obviously true that I'm not even going to talk about it after this paragraph. _Of course_ $$n$$-vectors make more sense than determinants. _Of course_ differential forms make more sense than nested integrals and mysterious Jacobians. _Of course_ wedge products make more sense than cross products. _Of course_ bivectors make more sense than $$\bb{C}$$. _Of course_ we should use multivectors instead of "pseudovectors" and "pseudoscalars". Why are we even talking about it? Just go rewrite all the books, the theory is (mostly) there.[^communication]

[^communication]: Well, communicating it at the right level and in the right notations is the trick. And also, arguably the theory _isn't_ quite there and that's part of the problem, too. But with all these interested people surely we can work on that?

Claim (2), I believe, is nonsense.

And with that, it's time to talk about the geometric product.

---------------

### The Geometric Product

The geometric product of two vectors gives a mixed-grade object consisting of a scalar part (their dot product) and a bivector part (their wedge product). GA likes to write this product as juxtaposition:

$$\b{a} \b{b} = \b{a} \cdot \b{b} + \b{a} \^ \b{b}$$

(The general geometric product between two mixed-grade multivectors follows by writing them all out as sums of products of vectors like the above, then cancelling everything out according to $$\b{xx} = 1$$ and $$\b{xy} = -\b{yx}$$ for all choices of $$\b{x} \neq \b{y}$$.)

Right away we're confronted by the first problem. What does it even mean to have a "mixed-grade" multivector? The product of two vectors has a scalar part and a bivector part. Why?

I assume that the actual reason it happened, historically, is that it's roughly what complex numbers and quaternions do already. Complex multiplication seems to involve two objects with different types:

$$
\begin{aligned}
(a + bi) (c + di) = (ac - bd) + (ad + bc)i
\end{aligned}
$$

And quaternion multiplication of e.g. two vectors seems to produce objects of mixed grades:

$$
\begin{aligned}
(a_1 \b{i} + a_2 \b{j} + a_3 \b{k}) (b_1 \b{i} + b_2 \b{j} + b_3 \b{k}) &= a_1 b_1 \b{i}^2 + a_2 b_2 \b{j}^2 + a_3 b_3 \b{k}^2 \\
&+ (a_1 b_2 - a_2 b_1) \b{ij} + (a_2 b_3 - a_3 b_2) \b{jk} + (a_3 b_1 - a_1 b_3) \b{ki} \\
&= - \b{a} \cdot \b{b} + \b{a} \times \b{b}
\end{aligned}
$$

Where the first part is a scalar (don't mind the minus sign, that's quaternions being weird[^quaternion]) and the second part is a vector written in the basis $$(\b{i}, \b{j}, \b{k}) = (\b{jk}, \b{ki}, \b{ij})$$.

[^quaternion]: The actual implementation of quaternions in geometric algebra regards it as the even subalgebra of the geometric algebra on $$\bb{R}^3$$, with elements given by e.g. $$\b{i} = -I\b{x}$$, that is, $$\b{i} = \b{zy}$$, $$\b{j} = \b{xz}$$, $$\b{k} = \b{yx}$$. This is of course totally weird but it's equivalent to how quaternions are implemented in Pauli matrices: $$\b{x} \mapsto -i \sigma_1$$, etc. Quaternion multiplication follows from the GP: $$\b{ij} = (\b{zy})(\b{xz}) = \b{yx} = \b{k}$$ and $$\b{ii} = (\b{zy})(\b{zy}) = -1$$. But this mapping is basically arbitrary, and other mappings would also implement the same underlying algebra.

Still, you have to explain what your geometric algebra is doing with mixed-grade objects. Do they... mean something? What is the scalar part? What would it mean to have a sum of a scalar, vector, bivector, and pseudoscalar? Or are they just formal linear combinations of things with no meaning? What is going on?

Not only that, you need the mixed-grade objects to actually be _better_ than they were before you wrote them that way. For instance you _can_ write the electromagnetic field as $$\b{F} = \b{E} + \b{I} \b{B}$$. But should you? Probably not. $$\b{E}$$ is better understood as being a $$\b{x} \^ \b{t}$$ bivector while $$\b{B}$$ is an $$\b{x} \^ \b{y}$$ bivector, so they're both bivectors. The mixed-grade interpretation only makes sense if you confine yourself to $$\bb{R}^3$$ for some reaseon. There are [other examples](https://math.stackexchange.com/questions/3805595/are-there-any-geometrically-meaningful-useful-mixed-grade-objects-in-geometric-a) of rewriting things as mixed-grade objects, but, notably, none of them... seem good? Writing equations in terms of mixed-grade multivectors in general doesn't _tell you anything useful_. You can't "think in them". Or at least, I can't.

The approximate answer to "why is GA using mixed-grade objects and multiplying them?" is that it tends to end up expressing a lot of _operations_ on multivectors as multivectors themselves. For example it will regard a unit vector as a reflection operator, or a scalar + bivector as a rotation operator. In this scheme, the product of two multivectors is generically interpreted as the composition of these operators. That is fine!

However, GA is not very forthright about the fact that it is doing this, and will happily go on talking about mixed-grade multivectors that refer to geometry primitives, often by just saying "multiply these with the GP, then take only the grade-2 part to get their area" and things like that. As far as I know there is no reason to do this except that they really like the GP! And it is very offputting when it is used this way: if you wanted their wedge product, just write their wedge product; don't tell me to apply the GP to produce something that's partly meaningless and then extract the meaningful part from that. (And anyway, if your goal is to pre-multiply vectors in a generic way and then extract useful components out of the result... you should be using the tensor product, not the geometric product, right?)

So that's a problem: **there is no good general interpretation or usage for the geometric product or mixed-grade multivectors**. There are usages and interpretations in special cases, but the generic operation is not meaningful. Yet it is used everywhere as the fundamental object of the theory. (For instance [here](https://math.stackexchange.com/questions/1535878/visualizing-the-geometric-product) are some people struggling to find to find a general interpretation of the GP.) It is very awkward that the basic geometric operation in the geometric algebra that people espouse because they're trying to make everything geometrically intuitive... is not very geometrically meaningful on its own.

Incidentally, you would not want to actually use the geometric product to do these calculations, like, numerically. If you want to calculate dot products, wedge products, rotations, reflections, etc, or especially if want to program them into a computer, the last thing you want to do is implement them as arbitrary products of mixed-grade-multivectors and then project out certain terms at the end that you care about. Because of course you don't: you really want to just implement the actual operation you were trying to use; doing it that way would be both tedious and a giant waste of memory and computational power. The reason you would use the GP is when all your objects are geometric operations that are already expressed as mixed-grade multivectors, so you can commute and anti-commute the terms in their components to compose them. In that case, go for it. But it is not like you want to be actually using the GP on a computer to perform operations that GA defines in terms of it, such as dot or wedge products. Nor would you want to use it to perform basic operations by hand. Basically the GP is useful for algebraic manipulations, not numeric ones.

---------

### Rotations and Reflections

As I said above, the main place that the GP's behavior makes some sense is when the multivectors are being regarded as operators on geometric objects, rather than the geometric objects themselves. For instance:

(1) A basic rotation as implemented by exponentiating a bivector:

$$e^{\theta (\b{xy})} = \cos \theta + (\b{xy}) \sin \theta$$

Which operators on vectors like so:

$$e^{\theta (\b{xy})}(\b{x}) = \b{x} \cos \theta - \b{y} \sin \theta$$

(2) Or a better type of rotation is implemented by sandwiching an object between two "rotors", which are half-angle rotations (which is necessary to produce the correct [Rodrigues formula](https://en.wikipedia.org/wiki/Rodrigues%27_rotation_formula) for rotations in $$>2$$ dimensions[^Rodrigues]):

[^Rodrigues]: In general rotating with $$e^{\theta \b{B}}$$ doesn't work to rotate vectors, because---well look at it, it multiplies every term in the vector by either $$\cos \theta$$ or $$\sin \theta$$, and rotating a vector _should_ leave an axis unchanged! The problem is that it only implements the rotation part of a rotation matrix, but not the $$1$$ on the diagonal. Modeling rotations as rotors, on the other hand, handles things correct: $$R_{\theta}(\b{v}) = e^{i \b{B}/2} \b{v} e^{-i\b{B}/2}$$. That's also how quaternions do rotations correctly. Note the similarity to a change of basis $$A \ra P A P^{-1}$$ in linear algebra. Some people treat these rotors as example of "spinors", since they themselves rotate with only one rotor instead of two, which also makes people sometimes call spinors a sort of "square root of vectors".

$$\b{v} \mapsto e^{\theta \b{B}/2} \b{v} e^{-\theta \b{B}/2}$$

The intermediate object in this case is $$e^{\theta \b{B}/2} \b{v} = \cos (\theta/2 )\b{v} + \sin (\theta/2) \b{B} (v_{\parallel} + v_{\perp})$$. If $$v_{\perp}$$ is perpendicular to the plane of rotation then $$\b{B} \b{v}_{\perp}$$ becomes a trivector temporarily before being turned back into a vector by the second copy of $$\b{B}$$.

(3) The reflection operator $$-\b{n} \b{v} \b{n} = \b{v}_{\perp n} - \b{v}_{\parallel n}  $$ which reflects a vector along the unit $$\b{n}$$.

In each case we are using multivectors, and constructing intermediate mixed-grade multivectors, in order to transform a vector in some way (and there are extensions to multivectors). What seems to happen is that the scalar terms that show up in the geometric product in each case is responsible for performing the "identity" part of the operation which leaves its argument unchanged, while the bivector (or whatever) term is responsible for the part that gets transformed. Then the GP implements "composition" of these operators.

This becomes more clear in some of the more "exotic" geometric algebras out there: in practice GA people like to add more basis vectors, creating Clifford algebras like $$Cl_{3,1}$$ which has three basis vectors that square to $$+1$$ and one that squares to $$-1$$, or $$Cl_{3,0,1}$$ that has three $$+1$$s and one that squares to $$0$$. Each of these produces a different sort of "algebra of operations", and in each case the geometric product is used to compose them. Versions of this produce geometric algebras that include as primitives things like translations, Lorentz transformations, or screw-motions, and then their geometric product composes those operations.

The _fact that you can do this_ is certainly cool and neat, and profitable if you need to compose a lot of those operations. **But GA tends to act like this algebra which it has constructed to perform operations on a geometry... "is" the "right" way to do geometry**. Really it's just an implementation detail. If GA replaces all the vectors with planar reflections... well, vectors are still a thing, as is their wedge product. The fact that you built operators out of a quirky reinterpretation doesn't make the old things go away. GA's tendency to act like it is "better" than other approaches is very alienating: they all the same thing, and GA has just picked a few things and turned them into primitives, at the cost of making other things more complex. The GA in use is _not_ the canonical algebra of basic vectorial objects, but the algebra of a certain class of vectorial transformations on those objects that were chosen for the problem at hand.

I strongly believe that if GA would make this distinction they would lose a lot fewer people. It is a completely interesting and useful thing to talk about "a representation of a particular class of operations that makes composition and inversion easy", and completely offputting when you blur the distinction between operators and geometric objects themselves, and write every operation in terms of the geometric product when only a few of them are really compositions of operators.

------------

It's worth considering what things would look like in a different model. The normal non-GA way to model a rotation operation, for instance, is with the [exponential map](https://en.wikipedia.org/wiki/Exponential_map) of a generator $$R_{xy}$$:

$$
\begin{aligned}
e^{\theta R_{xy}} (\b{x}) &= (I \cos \theta + R_{xy} \sin \theta) \b{x} \\
&= I(\b{x}) \cos \theta + R_{xy}(\b{x}) \sin \theta \\
&= \b{x} \cos \theta + \b{y} \sin \theta \\
\end{aligned}
$$

Where $$I$$ is the identity operator. (Don't mind the sign change compared to GA's version, it's basically a choice of convention.) $$R_{xy}$$ is the generator of rotation that simply performs the basic operation, while the exponential map "smears it out" and applies it over and over in infinitesimal amounts. $$R_{xy}$$ may be written as a matrix:

$$\begin{pmatrix} 0 & 1 & 0 \\ -1 & 0 & 0 \\ 0 & 0 & 1\end{pmatrix}$$

but it's fine and perhaps better, to leave it as a symbol: the matrix is just a representation of it in a particular basis.

The operator version of the exponential map produces an object whose two components have the same type: both are "operators that map vectors to vectors". Whereas the GA versions produce two objects with different types: a scalar and a bivector, which both happen to give a vector when multiplying a vector. In the operator version, the first term happens to be identity operator which you _could_ write as a scalar $$1$$... but it seems more natural to me that both $$e^{\theta R_{xy}}$$ and its expansion in terms of $$\cos \theta$$ and $$\sin \theta$$ are of the "same type" throughout. And although the identity operator $$I$$ could be written as $$1$$, it is just as good to regard it as a tensor product $$\b{x} \o \b{x} + \b{y} \o \b{y} + \b{z} \o \b{z}$$. Either way, GA's trick of "removing the vector part, then putting it back" is just... weird, I guess?

More to the point, these objects have the same algebra. If you write out your rotations as operators or geometric-products of mixed-grade multivectors, they do the same thing. The choice of representation is there for its utility, not for its underlying mathematical truth, and _pretending_ like it is mathematical truth is disingenuous and offputting.

Also, I happen to find the operator version a lot more appealing. Sure, it is interesting that GA's version works, but since the intermediate objects aren't interpretable as actual geometric primitives (like: a sum of a scalar and a bivector is not a thing in the world of "vectorial directions, areas, and volumes"---only in the world of "operators"), it is unsatisfying. Operators are a slightly different thing than multivectors, and the distinction is important. They have different "types". Conceptually, vectors are not rotations or reflections or translations on their own; multivectors are not rotations on their own. But they can be put in _correspondence_ with rotations or reflections or translations, yes, for instance we use unit bivectors for the purposes of defining the planes that rotations happen in. But I think it is a mistake to _identify_ them with rotations and other operators, and everything else goes awry as a result. 

This also happens in $$\bb{C}$$ as well, by the way. We learn to regard $$a + bi$$ as an operation on other complex numbers $$r e^{i \theta}$$, which rotates and scales them, but really that is actually... pretty weird? Most of the time we think of complex numbers as vectors in $$\bb{R}^2$$ or as rotation+scaling operators, but rarely do we actually we want them in both roles at the same time. So it is not very natural to equate the two objects, as opposed to finding a correspondence between them. 

Well, GA would phrase this as the vector interpretation being $$a \b{x} + b \b{y}$$ and the operator interpretation as $$a + b I$$. But I would argue that even the bivectors and scalars should not be interpreted as operators either. Bivectors are not operators: they're elements of a vector space that models units of area in planes. If the plane is created by two geometric rays then the unit of area is a vectorial representation of a patch of area. If the plane is created by two operations on vectors, then the unit of area is a vectorial representation of some sort of antisymmetrized product of those operators. That's all fine! They're just _different spaces_ that have similar algebras. Rotations can be _implemented_ with them, yes, because rotations take place in planes, but they are not the same thing: bivectors-as-vectorial-areas only become rotation operators _when you contract with one of their indexes_, which is a separate step that you would perform on purpose.

So GA ends up being very stuck because it equates "vectorial objects" and "operators that act on vectorial objects". It would be better to express all the geometric objects you care about in their most natural forms, and then find isomorphisms between them when it's necessary to do so. Otherwise all the meanings get blurred together and it's very confusing. So that's another problem with geometric algebra: **eliding the distinction between vectors and operators is undesirable, confusing, and disingenuous**.  The GP is only geometrically meaningful, to my knowledge, in the context of "representations of certain classes of geometric operators as implemented in particular Clifford Algebras", and treating it like it is some general-case thing turns a lot of people away from the start. 

--------

### Weird Formulas

A related problem is that even when you _do_ treat multivectors as operators, the interpretations are... kinda weird? Consider the reflection operation:

$$P_{\b{n}}: \b{v} \mapsto - \b{n} \b{v} \b{n}$$

Where $$\b{n}$$ is a unit vector that we're reflecting along the axis of. This works because if you decompose $$\b{v} = \b{v}_{\parallel n} + \b{v}_{\perp n}$$ you can see that it flips the parallel part but not the perpendicular part (recall that parallel vectors have zero wedge product while perpendicular vectors have zero dot product, or in GA terms, parallel vectors commute while orthogonal vectors anticommute):

$$
\begin{aligned}
P_{\b{n}}(\b{v}) &= - \b{n} \b{v} \b{n} \\
&= - \b{n}( \b{v}_{\parallel n} + \b{v}_{\perp n}) \b{n} \\
&= - \b{n} \b{n} \b{v}_{\parallel n} + \b{n} \b{n} \b{v}_{\perp n} \\
&=  \b{v}_{\perp n} - \b{v}_{\parallel n}
\end{aligned}
$$

It's neat that that works. But is it a good formula; does it make any sense? Not... really? Why would you reflect a vector by sandwiching it with a unit vector and adding in a minus sign? I doubt you could have guessed that formula without already knowing that it works, or by fiddling around with the geometric product for a while. And knowing it doesn't really teach you how to write down any other formulas. The operator version is something you can build out of primitives that you know (I mean, if we were developing geometric algebra with operators we would have already defined the projection $$\b{v}_{\parallel n}$$ and rejection $$\b{v}_{\perp n}$$ operators at this point.) 

$$P_{\b{n}}(\b{v}) = \b{v}_{\perp n} - \b{v}_{\parallel n} $$

A bit cludgy, but the meaning is clear. The GA representation is just that: a _representation_, in a particular algebra, that happens to work. But it is not a "natural" way to express the operation for most people's purposes.

So that's another complaint: **Geometric Algebra's sleek formulas, when it has them, don't provide much useful geometric intuition**. They're just things you memorize. _Maybe_ there's a way to intuit the reflection formula if you think of all unit vectors as being reflection operations, but why bother? You'll get more intuition out of operators. 

-----------

### GA in Physics: Pauli and Gamma Matrices

In the standard GA over $$\bb{R}^3$$, once you have defined the weird GP on vectors, the next step is to define the regular useful operations of EA in terms of it:

$$\b{a} \cdot \b{b} = \frac{1}{2}(ab + ba)$$

$$\b{a} \^ \b{b} = \frac{1}{2}(ab - ba)$$

This construction is appealing to people who came from physics because their first exposure to exterior algebra was probably in the form of the [Pauli matrices](https://en.wikipedia.org/wiki/Pauli_matrices) (which show up in the quantum mechanics of a non-relativistic electron) and the [Gamma matrices](https://en.wikipedia.org/wiki/Gamma_matrices) (which show up in the [Dirac Equation](https://en.wikipedia.org/wiki/Dirac_equation) for relativistic electrons and positrons).

The gamma matrices, famously, have their symmetric product equal to the (Minkowski) metric $$\eta^{\mu \nu} = \text{diag}(1, -1, -1, -1)$$:

$$\{ \gamma^\mu, \gamma^\nu \} = \gamma^\mu \gamma^\nu + \gamma^\nu \gamma^\mu = 2 \eta^{\mu \nu}$$

Which, after some unpacking of the notation, says that $$\gamma^0 = \b{t}$$ and $$\gamma^i = \b{x}^i$$ and that $$\b{t} \cdot \b{t} = +1$$ while $$\b{x} \cdot \b{x} = \b{y} \cdot \b{y} = \b{z} \cdot \b{z} = -1$$. Essentially these are the objects you need if you want to "square root" the Laplacian $$\p_t^2 - \p_x^2 - \p_y^2 - \p_z^2 = (\gamma^0 \p_t + \gamma^1 \p_x + \gamma^2 \p_y + \gamma^3 \p_z)^2$$. Somehow it works but good look figuring out what it means! It turns out that the total set of Gamma matrices has 16 elements which correspond to the 16 elements of $$\^^4 \bb{R}^{1, 3}$$: one scalar (the identity), four vectors (the regular Gamma matrices), six bivectors (the commutators of Gamma matrices), four trivectors (etc), and one pseudoscalar (the object usually written $$\gamma^5$$). And their multiplication rule is exactly the Clifford algebra on those objects with metric signature $$(+1, -1, -1, -1)$$. That is actually cool and interesting: apparently the Gamma matrices _do_ implement the Clifford algebra $$\text{Cl}_{1,3}$$, which GA calls the "spacetime algebra". Evidently whatever a bispinor "is", vectors act on them by multiplication using the Gamma matrices as their representation.

So if you were coming from knowing about Pauli matrice and Gamma matrices, finding out that there's a way to interpret them all as basic elements of an intuitive algebra is very appealing. This, I think, is the reason Hestenes, Doran, Lasenby, etc were very interested in the geometric product as a generic tool for building vector algebra in the first place; their early papers are very targeted at physicists who are frustrated with spinors and bispinors not making much sense.

I agree that rewriting the objects in terms of their Clifford Algebra is a good idea. But I don't agree that this means you should rephrase all of geometry in terms of the Clifford Product / Geometric Product. The GP is provisionally useful for complex numbers, quaternions/Pauli matrices, and Gamma matrices, and fantastically useful in general for spinors (apparently!)... but that doesn't apply anywhere else. So why would you go rewrite all of vector algebra in terms of it? Anyway I'm counting it as another problem with GA: **The fact that the GP shows up for mysterious reasons in the physics of spinors is no reason to use it for the rest of geometry.** For purposes other than spinor-related algebra, an operator-first formulation does everything you want without a magic bizarre product, and it's not like the spinor algebra makes a lot of intuitive sense anyway. Writing everything the way that they are produced in spinor algebra is not providing any intuition for anything. 

(Incidentally, the fact that the Gamma matrices which convert between spinors and real numbers also obey a Clifford algebra is... really weird, isn't it? I have trouble thinking of any kind of possible explanation that would lead to that. Each gamma matrix corresponds to a cardinal direction, their antisymmetric product gives a bivector, but also their symmetric product gives the identity---what could that possibly mean? It feels like it's closely related to the, um Divine Understanding of Spinors, the interpretation that Atiyah was talking about not having when he said "No one fully understands spinors.". Whatever they are, their symmetrization becomes the identity operator. It's so _weird_.)

------------

### A Proliferation of Operations

Not only are the GP and mixed-grade multivectors weird, they have to invent a bunch of weird other operators just to _undo_ their awkwardness. Such as the grade projection operator

$$\<A\>_k = \text{(grade-k component of )}A$$

Or the "even" and "odd" grade projections:

$$\<A\>^+ = \< A \>_0 + \< A \>_2 + \< A \>_4 + \ldots \\ 
\<A\>^- = \< A \>_1 + \< A \>_1 + \< A \>_3 + \ldots \\$$

Or some really awkward definitions of every other kind of product:

$$
\begin{aligned}
A \, \lfloor \, B &= \sum_{r,s} \< \<A\>_r \<B\>_s \>_{s-r} \\
A \, \rfloor \, B &= \sum_{r,s} \< \<A\>_r \<B\>_s \>_{r-s} \\
A \ast B &= \sum_{r,s} \< \<A\>_r \<B\>_s \>_{0} \\
A \bullet B &= \sum_{r,s} \< \<A\>_r \<B\>_s \>_{\| s - r \|}
\end{aligned}
$$

None of any of this is necessary if you don't use mixed-grade multivectors and the GP in the first place. And absolutely nobody wants to learn any identies involving these things. So that's another complaint: **there are way too many confusing definitions required when you base everything on the geometric product**. I have to imagine that every single person who has gone to learn GA has been taken aback by this, and by the fact that the people writing about it don't seem to have much of a problem with it. And actually I have only shown the tip of the iceberg here. Take a look, for instance, at the list of operations on the website [Projective Geometric Algebra.org](https://projectivegeometricalgebra.org/).

To be fair, the proliferation of operations is somewhat a problem in EA also: the [Interior Product]({% post_url 2019-01-27-exterior-4 %}), for instance, is fairly awkward to use, and like $$\lfloor$$ and $$\rfloor$$ above, there kinda needs to be two versions of it if you want to apply it from either the left or right. But at least it is has a fairly elementary interpretation of a simpler operation in the algebra, as the adjoint of the wedge product under the inner product. And there are other operations that show up, like the Meet $$\vee$$ which is dual to the wedge product. But GA has all of these _plus_ its extra unnecessary stuff.

More generally I think it is better construct all of these operations directly from the tensor algebra. I suspect that the "right way" (inasmuch as that phrase means anything) to think about vector algebra is to think of the two fundamental operations as being (1) the tensor product $$\b{a} \o \b{b}$$ and (2) the dot product/trace $$\b{a} \cdot \b{b}$$. Everything else is really constructed from these, and despite [what people will say](https://youtu.be/htYh-Tq7ZBI?t=1411), it is actually rather intuitive that the product of $$(a_x \b{x} + a_y \b{y})(b_x \b{x} + b_y \b{y})$$ would be $$a_x b_x \b{xx} + a_x b_y \b{xy} + a_y b_x \b{yx} + a_y b_y \b{yy}$$. Or at least, it is certainly more intuitive than the geometric product. It is weird _at first_ that multiplying two vectors would make a rank-$$2$$ tensor, but it is not really different from the fact that multiplying two scalars with one unit each gives a scalar with two units: $$5 \text{m} \cdot 3 \text{s} = 15 \text{ m}\cdot\text{s}$$.[^units] True, it is not invertible, but it shouldn't be: it's a very generic operation whose inverse is not a single value. If you produce a version of vector multiplication that _is_ invertible, you have definitely erased information somewhere to make that possible, so it is certainly not the "true" meaning of vector multiplication.

[^units]: Actually, I think it is _exactly_ the same as that, and whenever I finally write my book on all this I'm going to introduce the tensor algebra as a way of juggling multiple units at once rather than any sort of universal free multilinear multiplication...

Anyway, if you start with the tensor product, then your pedagogical task is to explain why anybody would then go and invent the exterior product from that, but that isn't too bad: in some sense the dot product asks "what happens if you multiply two vectors and ignore the terms that aren't parallel?" and then the wedge product asks "What happens if you multiply two vectors and ignore the terms that are parallel?". Those are at least philosophical constructions, and although they're not completely satisfying, they do pretty well.

----

### Weird Associativity

Here's an objection I've never seen elsewhere: **geometric product's associativity is actually really awkward for doing basic linear algebra**. 

A geometric algebra is what you get when you take the tensor algebra on basis vectors $$\{\b{x}, \b{y}, \ldots \}$$ and assert that $$\b{xx} = 1$$ and $$\b{xy} = -\b{yx}$$ everywhere (so, quotienting by relations of those forms)[^definition]. (Or in other metric signatures, that $$\b{xx} = Q(x,x)$$ or whatever.) The geometric product itself is what the tensor product $$\o$$ becomes under this mapping. Naturally it is associative because $$\o$$ is:

[^definition]: Strangely, the texts on GA do a bad job of actually explaining that [that's how it works](https://math.stackexchange.com/questions/444988/looking-for-a-clear-definition-of-the-geometric-product). Quoting MacDonald who wrote a well-known book on GA: "I do not think it possible to give a quick definition of the general geometric product." Hmm.

$$(\b{ab})(\b{c}) = \b{a}(\b{bc}) = \b{abc}$$

But this definition is actually really awkward. Look what it does to the "squares"" of the multivectors:

$$
\begin{aligned}
(1)(1) &= 1 \\
(\b{x})(\b{x}) &= 1 \\
(\b{xy})(\b{xy}) &= -1 \\ 
(\b{xyz})(\b{xyz}) &= -1 \\
(\b{wxyz})(\b{wxyz}) &= 1 
\end{aligned}
$$

What is going on? Well, every time you switch the position of two args, you get a minus sign, and... the pattern is weird. You know what would work _way better_ than that? If the product operated left-to-right, like tensor contraction i.e. the dot product already does:

$$
\begin{aligned}
(1) \cdot (1) &= 1 \\
(\b{x}) \cdot (\b{x}) &= 1 \\
(\b{xy}) \cdot (\b{xy}) &= 1 \\ 
(\b{xyz}) \cdot (\b{xyz}) &= 1 \\
(\b{wxyz}) \cdot (\b{wxyz}) &= 1 
\end{aligned}
$$

But if you made the geometric product operate left-to-right, it doesn't work, because the wedge product part actually _does_ care about the ordering. That's how it works in regular exterior algebra already: the dot product and wedge product are different operations that associate differently; the dot product is left-to-right while the wedge product associates. So you end up making a choice between two conventions for your algebra:

1. Make every basis multivector have norm $$1$$, so that they all work according to basic linear algebra in intuitive ways, for instance projecting components out of a bivector with $$\b{B} \cdot (\b{x} \^ \b{y}) = B_{xy}$$. Then add in some operators to implement the things that have to square to $$-1$$, such as rotation operators $$R_{xy}^2 = -I$$. Or,
2. Let basis multivectors square to $$\pm 1$$ using the weirdy-associating geometric product, and then add more operations to the algebra that recover the idea of multivectors squaring to $$+1$$ so you can do basic things like projecting bivectors onto their basis vectors $$\b{B} \cdot (\b{x} \^ \b{y}) \? -B_{xy}$$ again.

To me (1) sounds way better. Let linear algebra work like it should and just add in the parts you need to make operators that compose differently. Don't break linear algebra just to make it look more like complex numbers!

And really, some of GA's definitions of things in terms of the GP work _better_ if you use left-to-right contraction. For example the weird minus sign in the rotation $$e^{(\b{x \^ y} )\theta} (\b{x}) = \b{x} \cos \theta - \b{y} \sin \theta$$ up above goes away if $$\b{xy}(\b{x}) = \b{y}$$. The definition of the cross product in terms of wedge product becomes $$\b{a} \times \b{b} = I \cdot (\b{a} \^ \b{b}) $$ instead of $$-I (\b{a} \b{b})$$.

The way GA recovers the standard multivector inner product is with the "reversion operator", which looks like

$$A^{\dagger} = \< A \>_0 + \<A\>_1 - \<A\>_2 - \<A\>_3 + \<A\>_4 + \ldots$$

Which just means that it reverses the order of vectors in a product:

$$(\b{xyz})^{\dagger} = \b{zyx} = - \b{xyz}$$

Such that the "standard" dot product of two multivectors (the one that returns $$1$$ if they are the basis element) is implemented as

$$(\b{xyz}) \cdot (\b{xyz}) = (\b{xyz})^{\dagger} (\b{xyz}) = 1$$

It seems to me that they defined their operation to associate in the wrong way and then have had to construct this operation to undo the mistake.

Incidentally, reversion is basically a generalization of complex conjugation. GA likes the way that the GP associates because it preserves the "square root of $$-1$$" behavior of complex numbers and quaternions: $$i^2 = j^2 = k^2 = -1$$. Then reversion is used to construct the vector norm again, which for complex numbers and quaternions is implemented with complex conjugation: $$\| a \|^2 = \bar{a} a = (a_x  - a_y i) (a_x + a_y i) = a_x^2 + a_y^2$$. I find it strange. It's hard to just say that complex conjugation is not an important operation, but it's also hard to say why it's so important---that is, I can't see a great philosophical argument for it. It is not an operation we really "want" to be using if we're trying to make geometry simple and intuitive.[^conjugation]

[^conjugation]: My rough understanding is that when $$\bb{R}$$ gets algebraically completed by $$i = \sqrt{-1}$$, there are really two possible values $$i$$ and $$-i$$ that satisfy $$i^2 = -1$$. Therefore if we are solving any problem in $$\bb{R}$$ with this value $$i$$, the solution can't care about the difference between $$+i$$ and $$-i$$, and you can interchange the two. That part is fine. But why, then, does multiplying $$z \bar{z}$$ give a "magnitude" that works in a reasonable way? It is not very clear and certainly not natural compared to $$z \cdot z$$.

I think once again the problem is the conflationg of "vectors" and "operators on vectors". Vectors themselves, or any multivectors, ought to have have normal norms that square to $$1$$. Operators on vectors, such as rotations and reflections, can square to whatever they need to square to; naturally $$R_{xy}^2 = -I$$, which, fine, write as $$-1$$ if you want to use a Clifford Algebra to represent it, and implement a version of complex-conjugation to extend this to your mixed-grade operators. But don't go around telling people that for some reason bivectors that represent units of surface area _also_ square to $$-1$$, because that's crazy.[^partial]

[^partial]: Aside: I wonder sometimes if EA is missing an operation in its toolbox which allows for contracting only _some_ components of multivectors together while multiplying the rest, such that $$(\b{x} \^ \b{y}) \cdot_1 (\b{x} \^ \b{y}) = - (\b{x} \o \b{x} + \b{y} \o \b{y}) = - I$$. I wrote about this operation some [here](({% post_url 2020-10-15-ea-operations %})), where I called it the "partial trace" because it is somewhat like [that operation](https://en.wikipedia.org/wiki/Partial_trace) on tensors. But it is hard to think about because it clearly has to be able to create _non_-wedge product results (such as $$I$$), which are hard to incorporate into the overall algebra. (That is generally part of my stance on GA and EA both: there are some missing parts of the theory that are needed to make all the properties of vector algebra make sense, and they're going to solve real intuitive problems a lot better than the GP does.)

----------

## Vector Division

One other thing that GA emphasizes from early on is the fact that most of the time you can divide by vectors and (usually) multivectors:

$$\b{v}^{-1} = \frac{\b{v}}{\|\b{v} \|^2}$$

This is another one of the properties of complex numbers and quaternions that it attempts to extend to all vectorial objects. It almost makes sense: _if_ you are treating all multivectors as operators on other multivectors under multiplication, then naturally they have an inverse (if they are not an implementation of a projection) which is given by something that looks like division. I'm fine with that part. My objection is just that blurring the distinction between the multivectors and operators in the first place is weird, so inverting them is weird also. If you describe this as "inverting a vector", it is mysterious and weird. If you describe it as "inverting an operator (which is implemented as a vector in this particular algebra)" it is completely intuitive. So just do that!

For instance a rotation operator $$R_{xy}: \b{v} \mapsto \b{v} \cdot (\b{x} \^ \b{y})$$ has inverse $$R^{-1}_{xy}$$, which is of course a rotation in the same plane with the opposite orientation, hence implemented as $$R^{-1}_{xy} = R_{yx} = R_{-xy}$$. Meanwhile the inverse of $$\b{x} \^ \b{y}$$ under the dot product is the object $$(\b{x} \^ \b{y})/\|\b{x} \^ \b{y}\|^2$$. Etc. This perspective seems a lot more orderly and sensible to me, and it makes it completely clear how each inverse object should work with no magic.

I will say that at least one type of vector division shows up all over math. It is basically part of the operation of "projection":

$$(\b{v} \cdot \b{a}^{-1}) \b{a} = (\frac{\b{v} \cdot \b{a}}{\| \b{a} \|^2}) \b{a} = \text{proj}_{\b{a}}(\b{v})$$

It might seem weird to call this "division" since it does not exactly invert a particular multiplication operation. But I think it is a good _generalization_ of division. In particular it has the correct behavior if the vectors are parallel, because $$(a \b{x}) \cdot (b \b{x})^{-1} = a/b$$, and in other cases its behavior is fairly easy to interpret: basically it divides the parallel parts and drops the non-parallel parts. (In other metrics there are also some concerns about zero-divisors, but whatever, just don't try to invert those.)

Of course anything you might do with the $$\b{a}^{-1}$$ notation you can also do without it,, but I think it's rather elegant how it takes care of handling the factors of $$\| \b{a} \|$$ for you. For instance it gives a neat way to factor a vector $$\b{v}$$ into components along an orthogonal set of vectors $$\{\b{a}, \b{b}, \b{c}\}$$ even if they are not unit vectors:

$$\b{v} = (\b{v} \cdot \b{a}^{-1}) \b{a} + (\b{v} \cdot \b{b}^{-1}) \b{b} + (\b{v} \cdot \b{c}^{-1}) \b{c}$$

Which may as well be written as

$$\b{v} = v_a \b{a} + v_b \b{b} + v_c \b{c}$$

By using this "vector division" instead of just a regular dot product, we cancel out the magnitude of the $$\{ \b{a}, \b{b}, \b{c} \}$$ elegantly. In a way this is treating $$\{ \b{a}, \b{b}, \b{c} \}$$ as a matrix $$\text{diag}(a,b,c)$$ in a certain basis, then inverting it to get $$\text{diag}(a^{-1}, b^{-1}, c^{-1})$$ in the same basis. (Of course, this only works due to the fact that the three vectors are orthogonal; otherwise you would get cross terms.)

Anyway, I am just trying to make the case that GA's notion of vector division is not on its own necessarily a bad idea. The baisc construction shows up a lot in vector algebra, and if you are writing your operators as multivectors of course it is meaningful to invert them. But it gets confusing when you start conflating operators nad primitives and doing a bunch of algebra on the primitives."Inverting a vector" is basically not meaningful, while "inverting a translation" is, and pretending like they are the same is pedagogically and philosophically unsound. But it seems to me like a perfectly sound interpretation is waiting just a few steps away.

-----------

# 3. Summary

I have given a lot of reasons why I think GA is problematic: the Geometric Product is a bad operation for most purposes. It really implements operator composition and is not a very fundamental or intuitive thing. Using a Clifford Algebra to implement geometry is an implementation detail, appropriate for some problems but not for general understandings of vector algebra and all of geometry. Giving it first-class status and then bizarrely acting like _that is not weird_ is weird and alienating to people who can see through this trick. 

Nor should we be trying to make everything look more like complex numbers and quaternions. Those are already weird and confusing; we should be moving away from them! Don't call the geometric product "the" way to multiply vectors. Stop fixating on the geometric product or on some particular $$Cl_{p,q,r}$$ that solves everything with a bunch of funky formula for basic stuff. Just teach wedge products and operators and keep it simple; stick to the good parts! Treat the Clifford Algebras as what they are: implementations of the compositions of particular operations in a particular notation. Not a replacement for the rest of geometry.

So for the time being I have to reject GA as a thing that I identify with. Fortunately, it is a philosophy, not a mathematical theory, so it's easy to reject. That's why when I write blog posts about the same basic ideas, and which align with the same basic philosophy of recasting mathematics in a more geometric and multivectorial form, I use the phrase "Exterior Algebra" instead.

That I said, I really do think there's a lot more to discover here. I'm convinced that there's some unifying theory of vector algebra that will tie this all together with a bow, and I'm hoping someone finds it, preferably soon. Among other things it will explain exactly why the geometric product _does_ work, when it does, and also why so many other formulas end up looking suggestive and interesting and imply that for instance we can sometimes divide and multiply vectors like they're numbers in a bunch of cases. When it does come along maybe we can call it "Geometric Algebra" again; it's a good name. Or maybe "Geometric Algebra 2.0", or "New Geometric Algebra", or "Geometrical Algebra". Or maybe we drag the name "Clifford Algebra" down out of the clouds and make it accessible to everyone. Whatever you want! But in the meantime, I'm not interested in using the name GA, because I think that name is attached to a bunch of bad ideas. The geometric product, its associated ontology, and the culture around it... are just mucking everything up. Thanks.

