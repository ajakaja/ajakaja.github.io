---
layout: blog
title: "The Case Against Geometric Algebra"
footnotes: true
math: true
aside: true
tags: notes
---

Every once in a while the internet gets talking about Geometric Algebra (henceforth GA) and how it's a new theory of math that fixes everything that's wrong with linear algebra and multivariable calculus. When I come across this stance I am compelled to respond with something like: "wait wait, it's not true! GA is clearly onto *something* but there's also a lot wrong with it. What you probably want is just the concepts of multivectors and the wedge product!" Which is not very effective, because it takes a long time to convince anyone why, and it's also not very productive, because this just keeps happening over and over without anything changing.

Many people agree with me on this, but they deal with it by mostly ignoring GA instead of complaining about it. But I actually like what GA is trying to do and I want it to succeed. So today I'm going to actually make those points in a longer article that I can link to instead. 

Specifically what I have a problem with is that the subject is pretty clearly flawed and needs serious work, and especially that the culture around it does not seem to realize this or be interested in addressing those flaws. In particular: **Hestenes' Geometric Product is not a very good operation and we should not be rewriting all of geometry in terms of it.** For some reason GA is obsessed with the geometric product, and it's causing all sorts of problems. They act like this is clearly the way that geometry should be done and everyone else can't just see it yet, and they have this weird religious zeal about it that is problematic and offputting. It's also just ineffective: treating certain models as if they are somehow canonical and obvious is wrong, mathematically and socially, and it puts people off right from the start. There probably is a place for the geometric product in a grand theory of geometry, but it's not front-and-center like GA has it today, and as a result the theory is a lot less compelling than it could be.

<!--more-->

If something like GA is to succeed, it will need to be improved. It will need to fix the problems with establishment mathematics better than it does now, in a way that everyone can get behind. Today it helps sometimes but often misses the mark, and people who can see that are alienated by the lack of self-awareness about this. 

As a result GA's relationship to mainstream mathematics is tenuous. It is considered a kooky, crackpotty sideshow. Even worse, as a result of being dubious and un-self-aware, the movement ends up losing everyone except for a particular type of... zealous person... who write about it with a sort of pseudooreligious zeal, as if the only reason GA is not mainstream is that they are being oppressed by close-minded traditionalism. When in fact it is just _not very compelling_ at the moment.

Yet GA continues to find more enthusiasts every year, because it really does address some real problems. And it will take those new people a while to realize what's going on. In the meantime they will go on selling other people on GA, repeating the cycle. This dynamic is causing GA to be stuck in a sort of perpetual mediocrity, where everyone's defending the surface-level philosophy and nobody's bothering to criticize or improve the underlying structural problems. My purpose in writing this is to push it to improve and address those problems.

The rest of this article substantiates my stance. It got very long, because I decided to include every argument I could think of. But I want to emphasize that, although this is my own long and opinionated rant, I am far from the only person who feels this way. Most of the people who roll their eyes at GA just move on and ignore it. But I actually _do_ believe in GA's philosophical project, just not in its approach, so I wanted to be precise about exactly what's wrong with it right now.

----------

Big disclaimer: I'm not a professional mathematician, and this is _not_ going to be the case that a serious mathematician would make, which would probably be something like "GA doesn't prove anything new so who cares?" (Fine, but the goals of research mathematics are rather unrelated to the goals of people who use mathematics for practical purposes.) Also, since I do more-or-less subscribe to the underlying program of GA, I am at least slightly on the crank side of the fence as well. Take me seriously at your own risk.

----------


# 1. A lot of background on GA

First I am going to describe my understanding of what GA is, how it got to be that way, and where it lives in relation to the rest of math and physics. This will be useful in order to pinpoint exactly what we're disagreeing about here. As far as I know the whole story isn't really documented anywhere else, so I'm just going off what I've picked up over the years. But I am no historian and don't really know how to check it against reality; I'd be happy to be corrected on anything in here.

### Where GA lives in mathematics

[Geometric Algebra](https://en.wikipedia.org/wiki/Geometric_algebra) is both a social movement and a branch of mathematics.

As a social movement, it's a group of people who believe that (a) mathematics research and pedagogy ought to be reformulated to be more useful, especially to its users who are not research mathematicians, and (b) this reformulation ought to be done in terms of a particular set of new primitives, which is the branch of mathematics side. The argument for doing this is that it would make a lot of math simpler, easier to understand, and easier to use for practical purposes.

As a branch of mathematics, it is a recasting of a subject called [Clifford Algebra](https://en.wikipedia.org/wiki/Clifford_algebra) (henceforth CA), which is a somewhat-obscure descendent of another subject called [Exterior Algebra](https://en.wikipedia.org/wiki/Exterior_algebra) (henceforth EA). 

Because it's important to understand which parts are GA and which parts aren't, here is how the various algebras relate to each other:

If an undergraduate linear algebra class is chapter one of the larger subject of linear algebra, then EA is chapter two. It's already well-known to mathematicians and physicist, and my impression is that it is gradually becoming ubiquitous at the graduate level but is mostly not taught to undergraduates. 

Exterior Algebra is built on the 'exterior product', denoted $$\b{a} \^ \b{b}$$, commonly called the 'wedge product' because it looks like a wedge. It incorporates the concept of 'multivectors' in a vector space, such as bivectors that form a vector space of oriented areas, or trivectors which form a vector space of oriented volumes. It also includes some other natural operations that you need to do math with those: the Hodge star $$\star$$ and an interior product, which generalizes the dot product to multivectors.

EA comes up naturally in abstract algebra, and in various downstream fields, such as algebraic topology. It also seems to exist in combinatorics literature with a somewhat different set of notations. More generally, EA provides the only actually good way of looking at a lot of the concepts in linear algebra, such as determinants, matrix minors, and cross products, a perspective which seems to be gradually infiltrating the literature that touches those subjects but mostly has not made its way into the undergraduate curriculum yet.

Most physicists and mathematicians will first learn about EA from its ubiquitous use in the field of Differential Geometry or its application in General Relativity, where it shows up as the "exterior calculus of differential forms", which are used to do differential geometry in a coordinate-free way. (For some reason physics has mostly treated EA as _just_ a thing you do with differential forms, instead of a general theory of vector algebra.) 

Clifford Algebra is like a more advanced version of EA. It is much less widely-known, but it is well-established in certain subfields of math and physics, and a lot of physicsists in particular use it without knowing what it's called when studying spin in quantum mechanics. 

Clifford Algebra is, roughly, an extension of EA which generalizes the complex and quaternion number systems. A Clifford Algebra is formed by taking vectors in space and allowing them to be multiplied: $$\b{x} \b{x}$$, $$\b{x} \b{y}$$, etc. Then there are some simple rules of algebra: two copies of the same vector can be cancelled out, so $$\b{xx} = 1$$, and two copies of different vectors can be exchanged with a minus sign: $$\b{xy} = - \b{yx}$$.  As a result you get an associative algebra where most elements are invertible, so you can talk about the multiplicative inverse of a vector $$\b{a}^{-1} = \frac{\b{a}}{\| \b{a} \|^2}$$. This allowing you to take a bunch of objects, expressed as sums of multivectors, and basically do polynomial algebra on them. 

There are also more general versions of Clifford Algebras which allow the product of a vector by itself to take different values, such as $$\b{xx} = 0$$ or $$\b{xx} = -1$$, and you end up with a construction called $$Cl_{p, q}$$ or $$Cl_{p, q, r}$$ where $$p$$ is the number of elements that square to $$+1$$, $$q$$ is the number that square to $$-1$$, and $$r$$ is the number that square to $$0$$, which are useful in various contexts.

Quantum mechanics uses the Clifford Algebra of Pauli matrices, which are roughly the bivectors in $$Cl_{3,0}$$, and the gamma matrices, which are vectors in $$Cl_{3, 1}$$. But at least at the undergraduate level it's rare that physics actually refers to them by name (my quantum course did not even mention that the Pauli matrices were quaternions). More generally a lot of the literature on spinors and representation theory heavily involves Clifford Algebras in a way that I haven't learned yet.

Geometric Algebra then attempts to take the ideas of Clifford Algebra and Exterior Algebra and spread them much more broadly, rephrasing other aspects of math in terms of those new concepts and operations. Exactly which ideas and operations those are depends on the author, but everyone who uses the phrase "Geometric Algebra" pretty much agrees that operations from CA and EA are useful and ought to be more widely used.

I mention all this to make the point that GA does not have any claim to the wedge product or even the Clifford/geometric product per se. GA's main difference is that it attempts to go back to lower-level math---vector algebra, calculus, basic physics like mechanics and electromagnetism---and rephrase them in terms of the Clifford/Geometric product, plus the other concepts of EA.

In practice, though, GA refers to **the particular platform and social movement which descends from the work of David Hestenes that began in the 1960s**. It specifically does _not_ refer to the underlying material of Clifford Algebras, which predate Hestenes and are also found in several other subfields of math and physics, but rather how they are used, conceptualized, and taught by Hestenes and others in his school of thought. Sometimes GA people will defend GA by saying "it's just Clifford Algebra which is really important in math, how can you have a problem with it?", and that misses the point. GA is not the material itself; it's the material plus the ideology and framework that is draped over the material. 

This is a point that some people disagree with, but I swear that it's true. Although Clifford himself called the operation the "geometric product", Hestenes explicitly wrote: "Do not confuse Geometric Algebra (GA) with Clifford Algebra (CA)!"  That said, this is all shifting over time, especially as the GA movement and the Clifford Algebra research world do more cross-pollination, and as more people learn about GA without interacting with the movement itself, especially in computer graphics and robotics.

Probably both GA and EA could be considered as members of the larger subject of "multilinear algebra" which would include tensor analysis and all of linear algebra as well. There's an argument to be made that they are really just "the rest of linear algebra", the big part of it that isn't included in introductory texts and hasn't entered the mainstream yet. Perhaps by the next century they will be fully folded into the standard curriculum.

----------

### An Approximate History of GA

GA is mostly less well-known in mathematics and physics than EA. Yet has a strangely large number of people advocated for it, particularly online in communities, articles, videos, and conference talks. Why? Well, here's a basic history that sort-of explains why it was unknown in the first place, and why it is increasingly not.

GA was more-or-less invented in the late 1950s by [David Hestenes](https://en.wikipedia.org/wiki/David_Hestenes), who made it his project to popularize it for the next fifty years. The underlying ideas date back to Clifford around 1878, who himself was extending Grassmann's "Extensive Algebra" from the 1840s, and, I'm told, coined the "geometric product" terminology. Then, in 1959, Hestenes, who was unsure what original research to do in graduate school, randomly came across  in the UCLA library some recently-published lecture notes of Marcel Riesz on the subject of Clifford Algebras. He immediately realized their similarity to the gamma matries of quantum mechanics, decided that this was the right way to reformulate all of vector algebra, and began working on it as his research project.[^story] Ultimately half of his thesis was about the subject, and most of the content was later published as a book in 1966 entitled [Space-Time Algebra](https://link.springer.com/book/10.1007/978-3-319-18413-5) which gradually popularized his ideas quite a bit. Hestenes' plan was to transform Clifford Algebra, otherwise a fairly niche part of mathematics, into the main language in which all of physics was expressed: that everything should be reformulated in terms of multivectors, wedge products, and especially the geometric product. In my opinion this stance is what changes the mathematical subject of "Clifford Algebra" into the ideological platform of "Geometric Algebra".

[^story]: The story is from an article called "Grassmann’s legacy" in the 2011 book "From Past to Future: Grassmann's Work in Context". Also, Riesz's lecture notes can be found in a 1993 book called "Clifford Numbers and Spinors".

Over the next few decades Hestenes slowly popularized his ideas and published more papers on the stuff, but it seems like things didn't really start picking up until the 1980s: particularly, with a 1985 conference at the University of Kent in 1985, started by Roy Chisholm in 1985, as well as with various publications of Pertti Lounesto.[^lounesto] Then momentum picked up when a group out of Cambridge (here's their [website](http://geometry.mrao.cam.ac.uk/)) got interested around 1988, in particular Anthony Lasenby, Joan Lasenby, Steve Gull, and Chris Doran, whose names will be familiar to anyone who has studied GA. The Cambridge group began putting out papers in the 90s with names like "Imaginary Numbers are not Real" and "A unified mathematical language for physics and engineering in the 21st century" which began to appeal a lot to people who had, for instance, lingering reservations about the use of complex numbers in physics, or about the philosphical interpretations of Pauli matrices and spinors.

Since then Hestenes and the Cambridge group seem to have published papers which reformulate every part of physics in terms of GA. They were refreshing when compared to mainstream physics, which seemed dogmatic and bizarrely willing to accept things that should have still been up for debate. (Of course this is how fringe ideas always view mainstream ideas.) So the appeal, and the reason that keeps catching more people's interest, is that they were at least *trying* to solve things that are legitimately bothersome (to a certain type of person) instead of ignoring them.

By the time I was learning about differential forms in college around ~2010, knowledge of GA was ambiently floating around online, and a bunch of fairly accessible books had been published (I'm thinking of Doran/Lasenby's *Geometric Algebra for Physicists* in 2003, Fontijne/Mann/Dorst's *Geometric Algebra for Computer Science* in 2007, and Macdonald's *Linear and Geometric Algebra* in 2010). The ideas of GA tended to show up if you went googling for intuitive explanations about forms, spinors, quaternions, or gamma matrices, which is what I was doing after finding the algebra of general relativity and quantum mechanics very opaque and frustrating.

[^traction]: Many details are available in Hestenes' essay "The Genesis of Geometric Algebra: A Personal Retrospective", although dang do I wish he would stop acting like all his work is the greatest stuff on earth.

[^lounesto]: Lounesto is kind of hilarious. He's apparently a very blunt Finnish guy who went around finding errors in everyone else's publications about Clifford Algebras and collecting them all on [his website](https://users.aalto.fi/~ppuska/mirror/Lounesto/counterexamples.htm).

Many of the people who latch onto GA are, like me, very and perhaps overconcerned with the soundness of the philosophical underpinnings of physics, while everybody else goes on not worrying about it because the theories do, at least, get the right answers. In particular it's very hard to be happy with the way that complex numbers are used in quantum mechanics[^complex]. We also tend to be displeased with the arbitrariness of the Pauli and Gamma matrices, and all of the index-juggling manipulations of general relativity, and the use of commutators in quantum mechanics and analytic mechanics, and other operations which are hard to interpret geometrically. Most frustrating, though, is the fact that most of the physics literature seems to not regard these things as problems, and that you are just supposed to learn and use them ("shut up and calculate") and so you don't find a lot of sympathy when you want them to make more sense.

[^complex]: The answer, at minimum, is at least trying to name what space they're supposed to be rotations in, even if to just give it in a name like $$X$$, and then write $$R_{X}$$ instead of $$i$$. Are all the $$i$$s of QM experimentally proven to be in the same space? I'm not sure anybody knows. Your intro quantum book doesn't mention it; it treats them as axiomatic.

Unfortunately, while the GA folks were clearly onto _something_, the response has not been all that enthusiastic. Why? Well, I think it's because in practice their reformulations are not all that useful for actually doing or understanding physics. My opinion, but seriously, go read them. It turns out that writing everything in terms of the geometric product does not make it easier to understand. The valuable parts, I think, were the parts that were using the _wedge product_ more liberally than physics had before; the usage of the geometric/Clifford product was always quite a bit more suspect. As a result a lot of physicists are probably aware of geometric algebra but not a lot of people are publishing papers in that language, and very few people would consider teaching undergraduate classes using it. It's really only used right now in the cases where it _has_ to be used, which is in the algebra of spinors and bispinors.

------

Okay, that's the physics angle. But there is another part of the story in more applied fields: computer graphics and robotics.

Around the same time time period (1990s-2010s), a lot of new people were learning code that had to handle rigid motion in space, and invariably they tended to encounter quaternions. By the 90s it had been understood for a long time that quaternions were the better way of modeling rotations in 3d space, compared to e.g. Euler Angles, because they treated every axis of rotation equally and allow for smooth interpolation between any two points (and also they avoid "gimbal lock", as nobody ever neglects to mention). In hindsight, it turns out that when you want to model an topologically-nontrivial algebra like $$SO(3)$$, it is very important to use an actual algebraic model of it like the quaternions, instead of a poor approximation like Euler Angles. But quaternions are a pedagogical nightmare---just go look how many Youtube videos there are to explain them! So when the GA people came along and started talking about bivectors and rotations in a way that actually made some geometric sense, a lot of people were interested. 

There are also many more difficult computations in these fields which are more complex than simple rotations. Rigid motions of objects, for instance, involve moving a lot of lines, planes, tangent vectors, etc around in space, plus interpolating between their positions smoothly, plus doing all kinds of intersection tests, sidedness tests, for e.g. culling objects which are occluded or offscreen, plus all of this has to be projectively transformed according to the position of a camera or sensor. Quite a bit of literature on GA has come out of translating these operations into GA terms, and there are a number of vocal proponents of doing it this way. A good chunk of the GA literature you come across is in papers and conference proceedings about computer graphics and robots.

These applications tend to focus on particular choices of Clifford algebras which are suited to different types of geometric problems. It was already widely understood that projective geometry allowed one to represent rotations and translations in $$\bb{R}^3$$ with a single linear operator on $$\bb{R}^4$$. Geometric algebra extends this by starting from $$\bb{R}^3$$ and adding some number of additional basis vectors that allow modeling various kinds of objects with Clifford-Algebraic operations. These theories attempts to replace the existing quaternion-like formulations of rigid geometric, such as [screw theory](https://en.wikipedia.org/wiki/Screw_theory) or [dual quaternions](https://en.wikipedia.org/wiki/Dual_quaternion), with GA versions such as "projective geometric algebra", "conformal projective geometric algebra", or "plane-based geometric algebra".

I believe the first of these was Projective Geometric Algebra (PGA), which was introduced in a 1999 paper by Jonathan Selig in a robotics journal. (I'm not sure which ideas are attributable to him, though: he cites Ian Porteous's 1969 book *Topological Geometry* which has a bunch of Clifford-Algebra-based geometric algorithms, although in general it's written in the much more technical "Clifford Algebra" style instead of the "Geometric Algebra" style. It also mention that Clifford himself studied biquaternions to implement rigid body motions.) Selig's PGA uses $$Cl_{0,3,1}$$, but it seems like later authors use $$Cl_{3,0,1}$$ instead. "Conformal Projective Geometric Algebra" follows shortly after and uses $$Cl_{4,1,0}$$ to model the objects but now also includes circles and rotations as multivectorial objects with the help of an additional basis vector. I don't know a lot about these, except that the texts on them are strangely difficult to read because they use very unorthodox representations for basic objects like planes and points. For instance in CGA a point $$\b{x}$$ is modeled as $$\b{x} + \frac{1}{2} \b{x}^2 (e_{-} + e_{+})$$ where the $$\b{e}_{\pm}$$s are two additional basis vectors to make the algebra work out? Seems weird to me but some people seem to get very excited about it.

-----------

As for pure math---it seems like research mathematics readily talks about and uses Clifford Algebra, but is uninterested in or specificaly avoids the terms and concepts that are specific to Hestenes' "Geometric Algebra". I can speculate as to why: even by the 90s/00s, GA had gotten a bad reputation because of its tendency to attract bad mathematicians and full-on crackpots. Hestenes honestly sounds like one a lot of the time, and I'm not really sure whether he is or isn't. It makes sense, really. There are a lot of people who found it appealing for the reason I did: because the existing models of vector algebra and quaternion rotation were deeply unsatisfying. But it turns out that those reasons _disproportionately_ attract people who are not actually capable of rigorous mathematics, or are slightly prone to conspiratorial thinking, or are otherwise slightly deranged.

I guess there are more people who can tell when math is weird or unsatisfying or bad... than can do good math themselves. So GA ended up appealing to a lot of fringes: people who only had undergraduate degrees, people who had dropped out of PhDs, people with PhDs from unrigorous programs, people who had been good at math but were perhaps going a bit senile, random passerbies from engineering or computer programming, run-of-the-mill circle-squarers, people who had a bone to pick with establishment mathematics and felt like all dissenting views were being unfairly suppressed... And these were the people who started publishing a lot of stuff about GA, often dressed up to look like more serious research than it was. Indeed, if you look around for papers that explicitly talk GA, they are _very_ disproportionately (a) non-theoretical, (b) poorly-written, (c) trivial, i.e. restating widely-known results as if they're novel, (d) only citing other GA papers, and of course (e) just plain crackpotty.[^vixra]

[^vixra]: For a fun time, search [viXra](https://vixra.org/), that is, crank ArXiv, for the phrase "geometric algebra". Aside: if I ever have a beautiful Theory of Everything to share with the world it has occurred to me that it would be funny to post it on ViXra instead of somewhere reputable, just to confuse everyone. Don't write them off completely!

It didn't help that a lot of the texts by the _actually_-competent GA people, like the Cambridge group, tended to say things that sounded and still sound kind of crackpotty as well. LIke they would constantly talk about how their new theory is going to fix everything, which is exactly what the crackpots also say. Or they would just write with totally-unnecessary ostentatiousness, such as (quoting here) "We have now reached the part which is liable to cause the greatest intellectual shock". Or acting like results in GA are new and novel when they're clearly just using wedge products the same way that physicists and differential geometers had regularly done for decades. Or acting aggrieved that the rest of mathematics is ignoring them. Or, worst of all, claiming that all the new GA equations are simpler than the old ones, while referring to equations which were _clearly not simpler than the old ones_.

So I suspect that what has happened is that competent mathematicians who have heard of GA still ted to distance themselves from the term due to its dubious reputation in a sort of adverse selection. Which of course leaves GA with an even higher ratio of cranks: because most of the non-cranks left. In fact I suspect that mathematicians sometimes publish papers about "Clifford Algebra" when they want to talk about the _exact same material_, not even the super-theoretical version, but without the negative associations. And some of the serious GA-adjacent research on ArXiv is just under the name Clifford Algebra instead.

And I think GA's dubious reputation among mathematicians is _well-deserved_. But that doesn't mean GA isn't _also_ onto something. It just means that there's a lot of low-quality stuff under the same label, which has made that label questionable, and if you want to sift through it you have to be ready to filter for quality yourself.

Incidentally, as a result of its popular appeal and fringe status, there are a lot of online discussions dedicated to GA. Off the top of my head there's a website called [Bivector.net](https://bivector.net/) which has a forums full of discussions and a Discord that (as of this moment) has 200+ people online, which I guess feels like a lot for a _community about a fringe mathematical theory_. Plus a few other forums. Plus people show up talking about GA in the comment sections on every other math-related forum if anyone asks any questions about quaternions or bivectors. Plus there are the countless Youtube videos, conference talks, expository PDFs, standalone websites, etc. And then there are whole offshoots of GA, like Conformal Geometric Algebra and Plane-Based Geometric Algebra, that have their own enthusiasts and sometimes their own websites as well. Etc.

This is not really a bad thing either. If anything what it shows is _how many_ people are passionate to see math reformulated in a way that makes more sense---so many that they'll convene and talk about it on every one of the bizarrely-inadequate social networks we have in 2024. And that's part of what is motivating me to write this article (which is getting very long now...). GA has got something of the right idea, and people recognize that and latch onto it, even if the details aren't right. Research math knows a _lot_ about geometry, but although most of the knowledge required to do all the things people actually want to do with geometry is out there _somewhere_, it's not accessible or intuitive and the details are only really available to specialists.[^reddit] At some level GA is trying to "democratize" geometry.

[^reddit]: For instance the most common stance on the r/math subreddit looks like [this one](https://www.reddit.com/r/math/comments/1ghw4b/why_isnt_geometric_algebra_more_widely_taught/): "From what I have seen, Geometric Algebra is just a rehashing of existing math.". Which, yes, I agree, but the point is to make the existing math more intuitive, not to discover new results. The fact that research mathematics is generally _not_ concerned with making calculation and intuition easier to think about is, I think, a giant failure that it will eventually regret. There's as much value in making things easy to use as there is in discovering them. At this point probably more. Picture if nobody had started teaching non-mathematicians calculus because it was just for experts---it feels like that.

So GA is probably onto something. Probably geometry deserves more a more intuitive and accessible foundation, and multivectors and the like are probably a big part of it. The problem is that... GA isn't quite it.


----------

# 2. The Actual Case Against GA

As I wrote above: _Exterior Algebra_ is clearly valuable and widely used already in graduate-level math and physics. _Clifford Algebra_ is clearly widely used in theoretical mathematics and anything that has to do with spin. _Geometric Algebra_ ought to be evaluated on what it adds on top of those.

So what does GA specifically say?

As I see it, GA is not so much a subject as an ideological position, consisting of basically two ideological claims about the world:

1. **Claim 1**: That the concepts of EA (so, wedge products, multivectors, duality, contraction) are incredibly powerful and ought to be used everywhere, starting at a much lower level of math pedagogy---basically rewriting classical linear algebra and vector calculus.
2. **Claim 2**: That the Geometric Product (henceforth: GP) should be added to that list as the _most_ fundamental operation, where by "fundamental" I mean that other operations should be constructed in terms of it, and theorems should be stated using it.

Claim (1), I believe, is completely correct, and is responsible for much of the reason GA _has_ gotten so popular. Exterior algebra and the general idea of doing geometry with multivectors is incredibly powerful and intuitive and it ought to be widely used and taught to everybody, and we should all be reading and writing new textbooks that incorporate it. It's so obviously true that I'm not even going to talk about it after this paragraph. _Of course_ $$n$$-vectors make more sense than determinants. _Of course_ differential forms make more sense than nested integrals and mysterious Jacobians. _Of course_ wedge products make more sense than cross products. _Of course_ bivectors make more sense than $$\bb{C}$$. _Of course_ we should use multivectors instead of "pseudovectors" and "pseudoscalars". Why are we even talking about it? Just go rewrite all the books, the theory is pretty much there.

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

Not only that, you need the mixed-grade objects to actually be _better_ than they were before you wrote them that way. For instance you _can_ write the electromagnetic field as $$\b{F} = \b{E} + \b{I} \b{B} \in Cl_{3,0}$$, and then Maxwell's equations as $$\del \b{F} = \del \cdot \b{F} + \del \^ \b{F} = J$$. But should you? Probably not. $$\b{E}$$ is better understood as being a $$\b{x} \^ \b{t}$$ bivector while $$\b{B}$$ is an $$\b{x} \^ \b{y}$$ bivector, both $$\in \^^2 \bb{R}^{3,1}$$ Minkowski space, so they're both bivectors in the same space. The mixed-grade interpretation only makes sense if you really want to stay in $$\bb{R}^3$$ for some reason. There are [other examples](https://math.stackexchange.com/questions/3805595/are-there-any-geometrically-meaningful-useful-mixed-grade-objects-in-geometric-a) of rewriting things as mixed-grade objects, but, as far as I can tell, none of them seem... good? Writing equations in terms of mixed-grade multivectors in general doesn't _tell you anything useful_. You can't "think in them". Or at least, I can't. [Here](https://math.stackexchange.com/questions/1535878/visualizing-the-geometric-product) are some other people struggling to find a general interpretation of the GP as well.

The actual reason why GA so often uses mixed-grade objects and multiplies them together is that it is often using multivectors to represent various sorts of operators, rather than as geometric primitives like units of direction or area. For example they will use a unit vector to represent a reflection operator, or a scalar + bivector to represent a rotation operator. In this scheme, the product of two multivectors is generically interpreted as the composition of these operators. 

This approach allows one to model a limited number of operations as elements of a single algebra. For the regular $$Cl_{n, 0, 0}$$ Clifford Algebra, the basis vectors are interpreted as reflections and then their bivectors give rotations (more on this in a sec). But as far as I know there is not a great interpretation of the trivectors and higher. As an example, one might interpret the trivector $$\b{xyz} \in \^^3\bb{R}^3$$, which maps $$\b{x}$$ to $$\b{yz}$$, as giving the complementary subspace to a vector. But what would it mean in $$\^^3 \bb{R}^4$$? Its action on, say, $$\b{x} + \b{w}$$ returns $$\b{yz} + \b{xyzw}$$. As a unit of volume $$\b{xyz}$$ is perfectly reasonable, but as an operator it doesn't make much sense.

The larger issue is that, even if the reason GA sometimes works is that it is implementing certain operators, very few users of GA understand that this is what is happening. As a result all the texts I have seen conflate the two concepts: they'll use mixed-grade multivector operators but then also use mixed-grade multivectors for simple geometric primitives. Often they'll prioritize the GP even when it makes no sense, such as creating the area of two vectors $$\b{a}$$ and $$\b{b}$$ by multiplying them with the GP and then extracting the grade-2 part, via $$\b{a} \^ \b{b} = (\b{ab} - \b{ba})/2$$. This makes no sense! Even if vectors *can be used* as operators, they are still used for the basic primitives of e.g. displacements between points and areas of triangles. There is no reason to define the primitive operations in terms of operators, and there's no additional insight gained from doing it. Instead it leaves you wondering: what in the world is the meaning of $$\b{ab}$$ on two displacements? And since there's no satisfactory answer to that, you're left completely confused.

So that's a problem: **there is no good general interpretation or usage for the geometric product or mixed-grade multivectors**. There are usages and interpretations in special cases, but the generic operation is not meaningful. Yet it is used everywhere as the fundamental object of the theory. It is very awkward that the basic geometric operation in the geometric algebra that people espouse because they're trying to make everything geometrically intuitive... is not very geometrically meaningful on its own.

---------

### Rotations and Reflections

Rotations and reflections are the simplest examples of how the geometric product implements operations on vectors.

A basic rotation in a plane is implemented by exponentiating a bivector

$$e^{\theta (\b{xy})} = \cos \theta + (\b{xy}) \sin \theta$$

Which operators on vectors via

$$e^{\theta (\b{xy})}(a \b{x} + b \b{y}) = (a \b{x} + b \b{y}) \cos \theta + (b \b{x} - a\b{y}) \sin \theta$$

But this doesn't work for vectors which don't lie in the $$\b{xy}$$ plane, because $$e^{\theta (\b{xy})} \b{z} = \b{z} \cos \theta + (\b{xyz}) \sin \theta$$. Instead one has to use the [Rodrigues formula](https://en.wikipedia.org/wiki/Rodrigues%27_rotation_formula) for rotations in $$>2$$ dimensions. GA accomplishes this the same way quaternions did, which is by which sandwiching a vector between two half-angle rotations instead, which GA calls "rotors":

$$\b{v} \mapsto e^{\theta \b{B}/2} \b{v} e^{-\theta \b{B}/2}$$

This works correctly on $$\b{z}$$:

$$
\begin{aligned}
R_{xy} (\b{z}) &= e^{\theta \b{B}/2} \b{z} e^{-\theta \b{B}/2} \\
&= [\b{z} \cos (\frac{\theta}{2}) + (\b{xyz}) \sin(\frac{\theta}{2})] [\cos (-\frac{\theta}{2}) + \b{xy} \sin (-\frac{\theta}{2})] \\
&= \b{z} [ \cos^2 (\frac{\theta}{2}) + \sin^2(\frac{\theta}{2}) ] + \b{xyz} [\sin \frac{\theta}{2} \cos \frac{\theta}{2} - \cos \frac{\theta}{2} \sin \frac{\theta}{2} ]\\
&= \b{z}
\end{aligned}
$$

We can split the action on a general vector $$\b{v}$$ into a part which is parallel to the plane of rotation and a part of which is orthogonal to it: $$\b{v} = \b{v}_{\parallel} + \b{v}_{\perp}$$. Then the rotation works by temporarily turning $$\b{v}_{\perp}$$ into a trivector with one multiplication and then back into a vector with the second. Strange.

A reflection is similarly performed by sandwiching a vector, but between two other vectors instead of two exponentials. To reflect a vector $$\b{v}$$ along a unit vector $$\b{n}$$, we split $$\b{v} = \b{v}_{\perp n} + \b{v}_{\parallel n} $$ and then the goal is to reflect only the part along $$\b{n}$$: $$\b{v} \mapsto \b{v}_{\perp n} - \b{v}_{\parallel n}$$. This is implemented by $$-\b{n} \b{v} \b{n}$$, because

$$
\begin{aligned}
-\b{n} \b{v} \b{n} &= - (\b{n} \b{v}_{\perp n} + \b{n} \b{v}_{\parallel n}) \b{n} \\
&= - (-\b{v}_{\perp n} \b{n} + \b{v}_{\parallel n} \b{n}) \b{n} \\
&= \b{v}_{\perp n} - \b{v}_{\parallel n}
\end{aligned}
$$

Where we use the fact that the geometric products of parallel vectors commute, which orthogonal vectors anticommute.

In each case we are using multivectors, and constructing intermediate mixed-grade multivectors, in order to transform a vector in some way. Various other geometric algebras augment the usual $$\bb{R}^n$$ basis with additional basis elements which allow one to represent and compose more operations such as translations, Lorentz transformations, or screw-motions.

------------

It's worth comparing this to how its done in a different model. The normal non-GA way to model a rotation is with the [exponential map](https://en.wikipedia.org/wiki/Exponential_map) of a generator $$R_{xy}$$:

$$
\begin{aligned}
e^{\theta R_{xy}} (\b{x}) &= (I \cos \theta + R_{xy} \sin \theta) \b{x} \\
&= I(\b{x}) \cos \theta + R_{xy}(\b{x}) \sin \theta \\
&= \b{x} \cos \theta + \b{y} \sin \theta \\
\end{aligned}
$$

Where $$I$$ is the identity operator; the sign change compared to GA is just a choice of convention. $$R_{xy}$$ may be written as a matrix:

$$\begin{pmatrix} 0 & 1 & 0 \\ -1 & 0 & 0 \\ 0 & 0 & 1\end{pmatrix}$$

but it's better to leave it as a symbol; the matrix is just a representation of it in a particular basis.

The operator version of a rotation produces an object whose two components have the same type: both $$I$$ and $$R_{xy}$$ are linear maps $$\bb{R}^n \ra \bb{R}^n$$. The GA version instead says that a rotation has a scalar term and a bivector term, which both happen to give a vector when multiplying a vector. I dunno. Personally the operator version feels much more reasonable to me. Without a clear geometric interpretation for what the geometric product is doing, why would you want a version that uses it like that? And it's very strange how the GP version temporarily creates a trivector to perform a rotation.

More to the point, these objects have the same algebra. If you write out your rotations as operators or geometric-products of mixed-grade multivectors, they do the same thing. The choice of representation is there for its utility, not for its underlying mathematical truth, and _pretending_ like it is mathematical truth is disingenuous and offputting.

Also, I happen to find the operator version a lot more appealing. Sure, it is interesting that GA's version works, but since the intermediate objects aren't interpretable as actual geometric primitives (like: a sum of a scalar and a bivector is not a thing in the world of "vectorial directions, areas, and volumes"---only in the world of "operators"), it is unsatisfying. Operators are a slightly different thing than multivectors, and the distinction is important. They have different "types". Conceptually, vectors are not rotations or reflections or translations on their own; multivectors are not rotations on their own. But they can be put in _correspondence_ with rotations or reflections or translations, yes, for instance we use unit bivectors for the purposes of defining the planes that rotations happen in. But I think it is a mistake to _identify_ them with rotations and other operators, and everything else goes awry as a result. 

This also happens in $$\bb{C}$$ as well, by the way. We learn to regard $$a + bi$$ as an operation on other complex numbers $$r e^{i \theta}$$, which rotates and scales them, but really that is actually... pretty weird? Most of the time we think of complex numbers as vectors in $$\bb{R}^2$$ or as rotation+scaling operators, but rarely do we actually we want them in both roles at the same time. So it is not very natural to equate the two objects, as opposed to finding a correspondence between them. 

Well, GA would phrase this as the vector interpretation being $$a \b{x} + b \b{y}$$ and the operator interpretation as $$a + b I$$. But I would argue that even the bivectors and scalars should not be interpreted as operators either. Bivectors are not operators: they're elements of a vector space that models units of area in planes. If the plane is created by two geometric rays then the unit of area is a vectorial representation of a patch of area. If the plane is created by two operations on vectors, then the unit of area is a vectorial representation of some sort of antisymmetrized product of those operators. That's all fine! They're just _different spaces_ that have similar algebras. Rotations can be _implemented_ with them, yes, because rotations take place in planes, but they are not the same thing: bivectors-as-vectorial-areas only become rotation operators _when you contract with one of their indexes_, which is a separate step that you would perform on purpose.

So GA ends up being very stuck because it equates "vectorial objects" and "operators that act on vectorial objects". It would be better to express all the geometric objects you care about in their most natural forms, and then find isomorphisms between them when it's necessary to do so. Otherwise all the meanings get blurred together and it's very confusing. So that's another problem with geometric algebra: **eliding the distinction between vectors and operators is undesirable, confusing, and disingenuous**.  The GP is only geometrically meaningful, to my knowledge, in the context of "representations of certain classes of geometric operators as implemented in particular Clifford Algebras", and treating it like it is some general-case thing turns a lot of people away from the start. 

--------

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

(If you want to read more criticisms of GA literature, also check out Eric Lengyel's [Poor Foundations in Geometric Algebra](https://terathon.com/blog/poor-foundations-ga.html). I can't vouch for its accuracy but it sounds about right. He's much more of an expert in this stuff, anyway, than I am. I only got involved because I was tired of there not being any vocal criticism out there.)