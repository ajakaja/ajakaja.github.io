---
layout: blog
title: "The Case Against Geometric Algebra"
footnotes: true
math: true
aside: true
tags: notes
---

I've been thinking about writing this post for a long time. Normally I haunt comment sections and reply on discussions about GA: "Wait, wait, GA is okay but it's not as good as those people say, there's something wrong with it, what you probably want is the wedge product on its own!" Which is not especially productive and probably slightly unhinged. So today I want to actually make that point in one central place that I can link to instead.

To be clear I'm not opposed to GA per se. What I (and, I think, a lot of other people) have a problem with is the culture around GA, and the fact that the proponents of GA haven't been fixing those problems. GA is producing more and more enthusiasts every year, and it will take those people a while to realize the things a lot of us have realized, and in the meantime they will go on selling other people on GA and repeating the cycle. As a result GA is stuck in a sort of mediocrity. My purpose in writing this is to push it to improve and address those problems.

In particular, **Hestenes' Geometric Product is not actually that good of an operation and it's not something we should be basing all of geometry on**. And GA's tendency to do so and then say "yes, this is _the_ way that geometry should be done" (with a sort of religious zeal) is problematic. It's also just ineffective: treating certain models as if they are somehow canonical and obvious and perfect when they're actually pretty weird and unnecessary puts people off right at the start. There probably is a place for the geometric/Clifford product in a grand theory of geometry, but it's not "front-and-center" like that, and as a result they lose people right way.

<!--more-->

----------

*Edit: after initially posting this I talked to some GA proponents who reminded me of a few things I had missed. In particular I found out that I hadn't really addressed the main defense of the geometric product directly, so I hadn't really refuted what I set out to refute. I haven't changed by stance, but I've revised this to address those arguments more directly. Generally my aim is both to criticize the bad parts of GA and to defend the good parts, so I want to do both tasks well!*


----------

# 1. Intro


Like the GA people, I am very excited about reformulating math into a simpler and more expressive conceptual language. Maybe this is because I'm not a mathematician, just another somewhat-knowledgeable amateur with strong opinions. This is _not_ going to be the case that a serious mathematician would make, which is probably something like  "GA doesn't say anything new so who cares?" (I disagree with that strongly but there's not much point in arguing it. Sometimes it feels like mathematician's goals are strangely divorced from the goals of people who actually _use_ mathematics).

And I agree with the GA folks that, as an atom of geometric intuition, the wedge product and some of the other concepts from Exterior Algebra are 100% amazing, S-tier stuff, definitely something everybody who uses mathematics should know about; we should be teaching wedge products in introductory linear algebra and multivariable calculus; we should not be getting rid of determinants but leaning into them; we should cast all of physics and engineering and mathematics in multivectors forever as soon as possible. _Yes._

But GA wants to put everything in terms of the geometric product (hereafter: GP), and it wants to declare some particular Clifford Algebra and all the operations that they build over it as "the" way to do geometry, which is ludicrous. There is nothing about that particular operation that makes it "more fundamental" than others, and if you are designing an intuitive algebra it is downright counterproductive to start with the GP, because a ton of the formulas that use it make very little sense and are much weaker, pedagogically, than alternatives which directly express the ideas they're trying to capture. Basically the fact that GA pedagogy emphasizes writing everything in terms of the geometric product, and then constructs a bunch of confusing operations to work around its weaknesses, is also weird and bad. The GP is _not_, in fact, "the" way to multiply vectors---if anything has that mantle it's the tensor product, after all. Nor is it it a particularly good way for most purposes.

Finally, the bizarre pseudoreligious air of GA enthusiasts is especially weird and bad, and bizarrely misplaced as well because it's contradictory to the confusing nature of what they're teaching. The project of reformulating geometry would work a lot better if they would (a) chill out about it and (b) produce something that is _actually_ as simple and unbojectionable and appealing as they are already claiming it is.

And if you don't know what I'm talking about, and don't think there's a pseudoreligious air around it? Sorry, but you're wrong. Go read or ask for the opinions of any other people who know about GA but _aren't_ espousing it as the next big thing. There is very much a rift between the GA community and everyone else. It is just not especially well documented at the moment.

The rest of this article will be substantiating these points. It's very long. That's because... I don't know, nobody else seems to be complaining about GA even though a lot of people have the same basic reaction to it, so I wanted to sort of provide all of the counterarguments in one place? And also because I got carried away. But I want to emphasize that, although this is my own long and opinionated rant, I am far from the only person who feels this way. Most of the people who roll their eyes at GA do so and then move on and ignore it. I have decided to air my grievances in hopes that it might help with something: because I really _do_ believe in the philosophical project that GA is trying to solve, just not in how it's doing it right now.

Also, disclaimer: I'm not a professional mathematician myself, and I think about math in a different (and probably worse) way than mathematics does. So this is not the position of, like, the mathematical establishment. Also, since I do more-or-less subscribe to the underlying program of GA, I am at least slightly on the crank side of the fence as well. Take me seriously at your own risk.

-----------

# 2. A lot of background on GA


It will be useful to understand what GA is, relative to the rest of math and physics, and how it got to be the way that it is, in order to establish exactly what it is that we're disagreeing with here. So first I am going to lay out the rough narrative that I have in my head. It is mostly just stuff I've pieced together over the years, and I admit that I don't really know how to check it against reality; I'd be happy to be corrected on any of this.

### Where GA lives in Mathematics

[Geometric Algebra](https://en.wikipedia.org/wiki/Geometric_algebra) (GA) is a branch of mathematics which rephrases vector algebra in a way that treats the "geometric product" $$\b{ab} = \b{a} \cdot \b{b} + \b{a} \^ \b{b}$$ as fundamental and derives everything else from it. Confusingly, it has _nothing_ to do with "Algebraic Geometry". GA is essentially the same thing as [Clifford Algebra](https://en.wikipedia.org/wiki/Clifford_algebra), which is a somewhat-obscure descendent of the subject of [Exterior Algebra](https://en.wikipedia.org/wiki/Exterior_algebra) (EA), which is sort of like chapter two of linear algebra if undergraduate linear algebra is chapter one. EA at this point is basically well-known to mathematicians and physicists.

I think it is important to distinguish "which parts" of GA are actually GA, which parts are EA, and which parts are Clifford Algebra.

EA includes the ideas of the wedge product $$\b{a} \^ \b{b}$$ and multivectors and Hodge star $$\star$$ and an interior product that generalizes the dot product to mulveictors. Clifford Algebra actually adds in the Clifford Product, which is what is now also called the geometric product, as an additional operation. Geometric Algebra then goes further and takes those two and tries to rephrase everything in terms of the geometric product in a somewhat-ideological way. 

Specifically, GA refers **mostly to a particular platform and social movement which descends from the work of David Hestenes in the 1950s**. Specifically, it does _not_ refer to the underlying material of Clifford Algebras, but rather how they are used, conceptualized, and taught. Sometimes GA people will defend GA by saying "it's just Clifford Algebra which is really important in math, how can you have a problem with it?", and that misses the point. GA is not the material itself; it's the ideology and framework that is draped over the material.[^ga] 

[^ga]: Doubling down: this is _definitely_ how the term "GA" is used in colloquial parlance, so don't tell me it's wrong :p. This is despite the fact that Clifford himself called the operation the "geometric product". That said, this is all shifting over time, especially as the GA "movement" and the Clifford Algebra research world do more cross-pollination.

The Exterior and Clifford Algebras are quite well-established in mathematics already. EA moreso: Clifford is, as far as I know, generally obscure but widely used in certain subsets of research. Exterior Algebra, on the other hand, is gradually becoming ubiquitous, at least at the graduate level.

In mathematics EA comes up naturally in abstract algebra (the exterior algebra is a basic quotient of the tensor algebra which is a basic construction on vector spaces), and in various fields downstream of abstract algebra, such as algebraic topology. It also shows up in combinatorics and random other places (I believe entirely due to Gian-Carlo Rota?) although from what I've seen the version they use is quite muddled. Also, more generally, EA provides the only actually good way of looking at linear algebra concepts like determinants and matrix minors, by modeling them as multivectors in an explicit vector space $$\^^k \bb{R}^n$$, and this perspetive seems to be gradually infiltrating any literature that touches those subjects.

Physicists know EA specifically from its ubiquitous use in General Relativity, where it shows up as the "exterior calculus of differential forms", which are used to express Differential Geometry in a coordinate-free way. For some reason, for the later half of the 20th century, physics mostly treated EA as _just_ a thing you do with differential forms, instead of a general theory of vector algebra.[^forms] I am really not sure why. It would have been really nice to have in e.g. classical electromagnetism.

[forms]: Specifically, they dealt with only the exterior algebra of cotangent vectors on a manifold (the differentials) and not at all with the exterior algebra of tangent vectors (which they equate with partial derivative operators on functions).

A Clifford Algebra is a generalization of complex and quaternion number systems. They are formally constructed as a quotient of a tensor algebra, but the procedure is very intuitive. To multiply two multivectors like $$(\b{xxy})(\b{xy})$$, you are allowed to exchange elements using $$\b{xy} = -\b{yx}$$ and to cancel out elements using a bilinear form $$Q$$, such that $$\b{xx} = Q(\b{x}, \b{x})$$ (usually $$1$$, $$0$$, or $$-1$$). As a result you get an associative algebra where most elements are invertible, allowing you to take a bunch of objects, expressed as sums of multivectors, and basically do polynomial algebra on them (plus a few weird rules). (The resulting algebra is labeled $$Cl_{p,q}$$ or $$Cl_{p,q,r}$$ where $$p$$ is the number of elements that square to $$1$$, $$q$$ the number that square to $$-1$$, and $$r$$ the number that square to $$0$$.)

I am primarily aware of Clifford Algebras because they are the algebra of the Gamma matrices from quantum mechanics, although from what I've seen it's relatively rare that physicists actually refer to them by name. I've been told that they are widely used in theoretical research (e.g. in the proof of the Atiyah-Singer Index Theorem). Clifford Algebras are also apparently heavily connected with the theoretical frameworks that underly spinors in a way that I don't quite understand yet; the Gamma matrices are part of this but they are also core to e.g. Penrose's Twistor theory and subjects like that. Generally, as far as I can tell, research that involves Clifford Algebras tends to work at a very high level of mathematical abstraction (quotients, universal properties, etc) compared to anything under the name GA which operates closer to the "quotidian" level of everyday geometry and calculus. They are at some level talking about the same thing, but they go in totally different directions.

Probably both GA and EA could be considered as members of the larger subject of "multilinear algebra" which would include tensor analysis and all of linear algebra as well. There's an argument to be made that they are really just "the rest of linear algebra", the big part of it that isn't included in introductory texts and hasn't entered the mainstream yet. Perhaps in 100 years they will be fully folded into the standard curriculum.

----------

### An Approximate History of GA

GA is mostly less well-known in mathematics and physics than EA. Yet has a strangely large number of people advocated for it, particularly online in communities, articles, videos, and conference talks. Why? Well, here's a basic history that sort-of explains why it was unknown in the first place, and why it is increasingly not.

GA was more-or-less invented in the 1959 by [David Hestenes](https://en.wikipedia.org/wiki/David_Hestenes), who made it his project to popularize it for the next fifty years. The underlying ideas date back to Clifford around 1878, who himself was extending Grassmann's "Extensive Algebra" from the 1840s. (I'm told that Clifford coined the term "geometric product" for the operation.) As the story goes, in 1959 Hestenes came across some 1958 lecture notes by Riesz in the UCLA library about Clifford Algebras and immediately realized/decided that they could used to reformulate all of vector algebra.[^story] Hestenes then wrote a book called "Spacetime Algebra" in 1966 which popularized it quite a bit. Hestenes' contribution was to transform Clifford Algebra, otherwise a piece of math exotica, into a sort of ideological platform: that everything should be reformulated in terms of multivectors and in particular the geometric product. IMO that switch is what changes the subject of "Clifford Algebra" into the subject of "Geometric Algebra".

[^story]: The story is from "Grassmann’s legacy" from the 2011 book "From Past to Future: Grassmann's Work in Context". Riesz's lecture notes are available most readily in a 1993 book "Clifford Numbers and Spinors".

GA floated around for the next few decades and slowly gained traction. Hestenes says that the momentum started to pick up with a conference started by Chisholm in 1984 that lent it some momentum. As far as I can tell it really got going in the 90s. I _believe_ the spike in popularity was mostly attributable to a group out of Cambridge ([website](http://geometry.mrao.cam.ac.uk/)) who got involved around 1988. In particular this was Chris Doran and Anthony Lasenby, although there were a lot of other names who started writing papers around the same time (e.g. Dorst, Mann, Gull, Chisholm, MacDonald, Lounesto. I don't know anything about the relative size of their contributions). The Cambridge group began putting out papers in the 90s with names like "Imaginary Numbers are not Real" and "A unified mathematical language for physics and engineering in the 21st century" which appealed a lot to people (like me) who had, for instance, lingering reservations about the use of complex numbers in physics, or about the philosphical interpretations of Pauli matrices and spinors. I have no idea where I first came across them myself but knowledge of GA was ambiently floating around online by the time I was learning about differential forms in ~2010, and tended to show up if you went googling for intuitive explanations about, forms, spinors, or quaternions.

For physics dissidents like me, some of the underlying assumptions of theoretical physics were very philosophically unsatisfying---as was the fact that the previous generation of physicists seemed to act like this was not a problem. For instance the simple usage of complex numbers to describe the wavefunctions of qunautum mechanics,[^complex] or the use of [Pauli matrices](https://en.wikipedia.org/wiki/Pauli_matrices) $$\sigma_i$$ for the generators of spinor rotations and the [gamma matrices](https://en.wikipedia.org/wiki/Gamma_matrices) $$\gamma^{\mu}$$ for bispinor rotations. (Pauli matrices, at least, could be recast in terms of the quaternions $$\bb{H}$$, but that doesn't help, given that quaternions are just a higher-dimensional version of $$\bb{C}$$.)

[^complex]: The answer, at minimum, is at least trying to name what space they're supposed to be rotations in, even if to just give it in a name like $$X$$, and then write $$R_{X}$$ instead of $$i$$. Are all the $$i$$s of QM experimentally proven to be in the same space? I'm not sure anybody knows. Is it the $$U(1)$$ gauge field of E&M? Your intro quantum book doesn't mention it; it treats them as axiomatic.

Doran and Lasenby and contemporaries' writing was appealing because they were at least _trying_ to fix these problems. They proceeded to publish a bunch of papers and books that reformulated most of the the foundations of physics in GA, and a lot of people who came across them got interested and started speaking the gospel. Compared to them the mainstream physicists seemed dogmatic: bizarrely accepting of things that should be up for debate. (Of course, that is how fringe ideas always view mainstream ideas.)

Unfortunately, while the GA folks were clearly onto _something_, in practice their reformulations have not struck me as especially useful for actually doing or understanding physics other than spinors (My opinion, but seriously, go read them.) It turns out that writing everything in terms of the geometric product does not make it easier to understand. (The valuable parts, I think, were the parts that were using the _wedge product_ more liberally than physics had before. But that's the point I'm going to make in detail later.)

Around the same time, a lot of new people were learning computer graphics programming, and they also tended to encounter quaternions. Invariably they got frustrated for many of the same reasons: quaternions are frustrating and unintuitive. By the 90s it had been understood for a long time that quaternions were the better way of modeling rotations in 3d space, compared to e.g. Euler Angles, because they treated every axis of rotation equally and allow for smooth interpolation between any two points (and also they avoid "gimbal lock", as nobody ever forgets to mention). In hindsight, it turns out that when you want to model an unfamiliar noncommutative algebra like $$SO(3)$$, it is very important to use an actual algebraic model of it instead of a poor approximation.

But quaternions are a pedagogical nightmare (go look how many Youtube videos there are explaining them!). So when the GA people came along and started talking about bivectors and rotations in a way that actually made some sense, a lot of people got interested. (No doubt there are other things in graphics programming that GA makes easier as well. I wouldn't know, but computer graphics involves a _lot_ of the geometry.)

Finally, I would speculate that there's one more reason that GA is less well-known in mathematics: even by the 90s/00s, GA had gotten a bad reputation because of its tendency to attract bad mathematicians and crackpots. It makes sense, really. There are a lot of people who found it appealing for the reason I did: because the existing models of vector algebra and quaternion rotation were deeply unsatisfying. But it turns out that those reasons _disproportionately_ attract people who are not actually capable of rigorous mathematics, or are slightly prone to conspiratorial thinking, or are otherwise slightly deranged (also like me? TBD).

I guess there are more people who can tell when math is weird or unsatisfying or bad... than can do good math themselves. So GA ended up appealing to a lot of fringes: people who only had undergraduate degrees, people who had dropped out of PhDs, people with PhDs from unrigorous programs, people who had been good at math but were perhaps going a bit senile, random passerbies from engineering or computer programming, run-of-the-mill circle-squarers, people who had a bone to pick with establishment mathematics and felt like all dissenting views were being unfairly suppressed... And these were the people who started publishing a lot of stuff about GA, often dressed up to look like more serious research than it was. Indeed, if you look around for papers that explicitly GA, they are _very_ disproportionately (a) non-theoretical, (b) poorly-written, (c) trivial, i.e. restating widely-known results as if they're novel, and (d) just plain crackpotty.[^vixra]

[^vixra]: For instance try searching [viXra](https://vixra.org/), that is, crank ArXiv, for the phrase "geometric algebra". (Aside: if I ever have a beautiful Theory of Everything to share with the world it has occurred to me that it would be funny to post it on ViXra instead of somewhere reputable, just to confuse everyone. Don't write them off completely!)

It didn't help that a lot of the texts by the _actually_-competent GA people, like the Cambridge group, tended to say things that sounded (and still sound) kind of crackpotty as well. LIke they would constantly say things like "this new theory is going to fix everything", which is exactly what the crackpots also say, and for the same reasons (the validity of a statement like that is completely conditional on a person's ability to actually distinguish truth from fiction). Or they were just filled with unnecessary ostentatiousness, such as (quoting here) "we have now reached the part which is liable to cause the greatest intellectual shock". Or acting like results in GA are new and novel when they're clearly just using wedge products the same way that physicists had regularly done for decades. Or, worst of all, saying things like "these new GA equations are simpler than the old ones" while referring to equations which were _clearly not simpler than the old ones_.

So I suspect that what has happened is that competent mathematicians have tried to distance themselves from Geometric Algebra due to its dubious reputation. Which of course leaves GA with an even higher ratio of cranks, because most of the non-cranks left. In fact I suspect that mathematicians sometimes publish papers about "Clifford Algebra" when they want to talk about the _exact same material_, not even the super-theoretical version, but without the negative associations. And some of the serious GA-adjacent research on ArXiv is just under the name Clifford Algebra instead.

To be clear, I don't think it has been wrong to disassociate from the name "Geometric Algebra". GA's dubious reputation among mathematicians is _well-deserved_. I'm doing it too---that's why all of my posts on related subjects are about Exterior Algebra instead. 

But that doesn't mean GA isn't _also_ onto something. It just means that there's a lot of low-quality stuff under the same label, which has made that label questionable, and if you want to sift through it you have to be ready to filter for quality yourself.

Also, as a result of its popular appeal and fringe status, there are a lot of online discussions dedicated to GA. Actually a shocking number, if you go look for them. off the top of my head there's a website called [Bivector.net](https://bivector.net/) which has forums and a Discord that (as of this moment) has 200+ people online, which I guess feels like a lot for a _community about a fringe mathematical theory_. Plus a few other forums. Plus people show up talking about GA in the comment sections on every other math-related forum if anyone asks any questions about quaternions or bivectors. Plus there are the countless Youtube videos, conference talks, expository PDFs, standalone websites, etc. And then there are whole offshoots of GA, like Conformal Geometric Algebra and Plane-Based Geometric Algebra, that have their own enthusiasts and sometimes their own websites as well. Etc.

This is not really a bad thing either. If anything what it shows is _how many_ people are passionate to see math reformulated in a way that makes more sense---so many that they'll convene and talk about it on every one of the bizarrely-inadequate social networks we have in 2024. And that's part of what is motivating me to write this article (which is getting very long now...). GA has got something of the right idea and people recognize that and latch onto it. I happen to think that it is almost certainly right that modern mathematics needs a more intuitive foundation. Research math knows a _lot_ about geometry, but although most of the knowledge required to do all the things people actually want to do with geometry is out there _somewhere_, it's not accessible or intuitive and the details are only really available to specialists.[^reddit] At some level GA is trying to "democratize" geometry.

[^reddit]: For instance the most common stance on the r/math subreddit looks like [this one](https://www.reddit.com/r/math/comments/1ghw4b/why_isnt_geometric_algebra_more_widely_taught/): "From what I have seen, Geometric Algebra is just a rehashing of existing math.". Which, yes, I agree, but the point is to make the existing math more intuitive, not to discover new results. The fact that research mathematics is generally _not_ concerned with making calculation and intuition easier to think about is, I think, a giant failure that it will eventually regret. There's as much value in making things easy to use as there is in discovering them. At this point probably more. Picture if nobody had started teaching non-mathematicians calculus because it was just for experts---it feels like that.

So basically I _do_ agree with them: GA is onto something, which is that geometry deserves more intuitive foundations, and multivectors and the like are probably a big part of it. The problem is that... GA isn't quite it.

----------

# 3. The Actual Case Against GA

As I wrote above: _Exterior Algebra_ is clearly valuable and widely used already in graduate-level math and physics. Clifford Algebra is clearly widely used in theoretical mathematics and anything that has to do with spinors. _Geometric Algebra_ ought to be evaluated on what it adds on top of those.

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

Where the first part is a scalar and the second part is a vector written in the basis $$(\b{i}, \b{j}, \b{k}) = (\b{jk}, \b{ki}, \b{ij})$$. (Don't mind the minus sign, that's quaternions being weird.)[^quaternion]

[^quaternion]: The actual implementation of quaternions in geometric algebra regards it as the even subalgebra of the geometric algebra on $$\bb{R}^3$$, with elements given by e.g. $$\b{i} = -I\b{x}$$, that is, $$\b{i} = \b{zy}$$, $$\b{j} = \b{xz}$$, $$\b{k} = \b{yx}$$. This is of course totally weird but it's equivalent to how quaternions are implemented in Pauli matrices: $$\b{x} \mapsto -i \sigma_1$$, etc. Quaternion multiplication follows from the GP: $$\b{ij} = (\b{zy})(\b{xz}) = \b{yx} = \b{k}$$ and $$\b{ii} = (\b{zy})(\b{zy}) = -1$$. But this mapping is basically arbitrary, and other mappings would also implement the same underlying algebra.

Still, you have to explain what your geometric algebra is doing with mixed-grade objects. Do they... mean something? What is the scalar part? What would it mean to have a sum of a scalar, vector, bivector, and pseudoscalar? Or are they just formal linear combinations of things with no meaning? What is going on?

Not only that, you need the mixed-grade objects to actually be _better_ than they were before you wrote them that way. For instance you _can_ write the electromagnetic field as $$\b{F} = \b{E} + \b{I} \b{B}$$. But should you? Probably not. $$\b{E}$$ is better understood as being a $$\b{x} \^ \b{t}$$ bivector while $$\b{B}$$ is an $$\b{x} \^ \b{y}$$ bivector, so they're both bivectors. The mixed-grade interpretation only makes sense if you confine yourself to $$\bb{R}^3$$ for some reaseon. There are [other examples](https://math.stackexchange.com/questions/3805595/are-there-any-geometrically-meaningful-useful-mixed-grade-objects-in-geometric-a) of rewriting things as mixed-grade objects, but, notably, none of them... seem good? Writing equations in terms of mixed-grade multivectors in general doesn't _tell you anything useful_. You can't "think in them". Or at least, I can't.

The approximate answer to "why is GA using mixed-grade objects and multiplying them" is that it tends to end up expressing a lot of _operations_ on multivectors as multivectors themselves. For example it will regard a unit vector as a reflection operator, or a scalar + bivector as a rotation operator. In this scheme, the product of to multivectors is generically interpreted as the composition of these operators.

However, GA is not very forthright about the fact that it is doing this, and will happily go on talking about mixed-grade multivectors that refer to geometry primitives, often by just saying "multiply these with the GP, then take only the grade-2 part to get their area" and things like that. As far as I know there is no reason to do this except that they really like the GP! And it is very offputting when it is used this way: if you wanted their wedge product, just write their wedge product; don't tell me to apply the GP to produce something that's partly meaningless and then extract the meaningful part from that. (And anyway, if your goal is to pre-multiply vectors in a generic way and then extract useful components out of the result... you should be using the tensor product, not the geometric product, right?)

So that's a problem: **there is no good general interpretation or usage for the geometric product or mixed-grade multivectors**. There are usages and interpretations in special cases, but the generic operation is not meaningful. Yet it is used everywhere as the fundamental object of the theory. (For instance [here](https://math.stackexchange.com/questions/1535878/visualizing-the-geometric-product) are some people struggling to find to find a general interpretation of the GP.) It is very awkward that the basic geometric operation in the geometric algebra that people espouse because they're trying to make everything geometrically intuitive... is not very geometrically meaningful on its own.

Incidentally, the geometric product is a terrible way to actually implement the operations that defined in terms of it. If you want to calculate dot products, wedge products, rotations, reflections, etc, or especially if want to program them into a computer, the last thing you want to do is implement them as arbitrary products of mixed-grade-multivectors and then project out certain terms at the end that you care about. Because of course you don't: you really want to just implement the actual operation you were trying to use; doing it that way would be both tedious and a giant waste of memory and computational power. The reason you would use the GP is when all your objects are geometric operations that are already expresses as mixed-grade multivectors, so you can commute and anti-commute the terms in their components to compose them. In that case, go for it. But it is not like you want to be actually using the GP on a computer to perform operations that GA defines in terms of it, such as dot or wedge products, nor would you want to use it to perform basic operations by hand.

---------

### Rotations and Reflections

As I've said, the main place that the GP's behavior makes some sense is when treating your multivectors as operators instead of geomtric primitives. For instance:

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

This becomes more clear in some of the more "exotic" geometric algebras out there: in practice GA people like to add more basis vectors, creating Clifford algebras like $$Cl_{3,1}$$ which has three basis vectors that square to $$+1$$ and one that squares to $$-1$$, or $$Cl_{3,0,1}$$ that has three $$+1$$s and one that squares to $$0$$. Each of these produces a different sort of "algebra of operations", and in each case the geometric product is used to compose them. Versions of this produce geometric algebras that include as primitives things like Lorentz transformations or screw-motions.

For instance in a thing called [Plane-Based Geometric Algebra](https://en.wikipedia.org/wiki/Plane-based_geometric_algebra) (PBGA) the signature is $$Cl_{3,0,1}$$, but the 1-vectors are taken to be "reflection operations" rather than linear vectors, so each basis vector refers to a particular (hyper)plane it is normal to (which, working in homogenous coordinates, is allowed to be any plane in space, not just planes through the origin). Then the composition of 1-vectors becomes the composition of two reflections. If the reflections are parallel then this composes two reflections into a translation; if they are not then they compose two reflections into something that acts like a rotation or skew+rotation. 

The _fact that you can do this_ is certainly cool and neat, and profitable for things like composing transformations of those sorts. **But GA pretends like this algebra which it has constructed perform operations on a geometry is the "right" way to do geometry**. If GA replaces all the vectors with planar reflections... well, vectors are still a thing, as is their wedge product. The fact that you built operators out of a quirky reinterpretation doesn't make the old things go away. GA's tendency to act like it is "better" than other approaches is very alienating: they all the same thing, and GA has just picked a few things and turned them into primitives, at the cost of making other things more complex. The GA in use is _not_ the canonical algebra of basic vectorial objects, but the algebra of a certain class of vectorial transformations on those objects that were chosen for the problem.

I strongly believe that if GA would make this distinction they would lose a lot fewer people. It is a completely interesting and useful thing to talk about "a representation of a particular class of operations that makes composition and inversion easy", and completely offputting to treat this like it's some sort of fundamental divine truth that should replace every other approach.

------------

To belabor this point: all of those transformations, actually, exist in _every_ representation of geometry. There is nothing about working in $$\bb{R}^3$$ that gets rid of "reflections over hyperplanes", or their composition properties. And in the same way there is nothing fundamental about formulating space in terms of $$Cl_{3,0,1}$$; it is a _representation_ of those operations that has particularly facile algebraic properties for some purposes.

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

None of any of this is necessary if you don't use mixed-grade multivectors and the GP in the first place. And absolutely nobody wants to learn any identies involving these things. So that's another complaint: **there are way too many confusing products required when you base everything on the geometric product**. I have to imagine that every single person who has gone to learn GA has been taken aback by this, and by the fact that the people writing about it don't seem to have much of a problem with it. And actually I have only shown the tip of the iceberg here. Take a look, for instance, at the list of operations on the website [Projective Geometric Algebra.org](https://projectivegeometricalgebra.org/).

To be fair, the proliferation of operations is somewhat a problem in EA also: the [Interior Product]({% post_url 2019-01-27-exterior-4 %}), for instance, is fairly awkward to use, and like $$\lfloor$$ and $$\rfloor$$ above, there kinda needs to be two versions of it if you want to apply from either the left or right. But at least it is has a fairly elementary interpretation of a simpler operation in the algebra, as the adjoint of the wedge product under the inner product. And there are other operations that show up, like the Meet $$\vee$$ which is dual to the wedge product. But GA has all of these _plus_ its extra unnecessary stuff.

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

But if you made the geometric product operate left-to-right, it doesn't work, because the wedge product part actually _does_ care about the ordering. That's how it works in regular exterior algebra already: the dot product and wedge product are different operations that associatve differently; the dot product is left-to-right while the wedge product associates.

You end up making a choice between two conventions for your algebra:

1. Make every basis multivector have norm $$1$$, so that they all work according to basic linear algebra in intuitive ways, for instance projecting components out of a bivector with $$\b{B} \cdot (\b{x} \^ \b{y}) = B_{xy}$$. Then add in some operators to implement the things that have to square to $$-1$$, such as rotation operators $$R_{xy}^2 = -I$$. Or,
2. Let basis multivectors square to $$\pm 1$$ using the weirdy-associating geometric product, and then add more operations to the algebra that recover the idea of multivectors squaring to $$+1$$ so you can do basic things like projecting bivectors onto their basis vectors $$\b{B} \cdot (\b{x} \^ \b{y}) \? -B_{xy}$$ again.

To me (1) sounds way better. Let linear algebra work like it should and just add in the parts you need to make operators that compose differently. Don't break linear algebra just to make it look more like complex numbers!

And really, some of GA's definitions of things in terms of the GP work _better_ if you use left-to-right contraction. For example the weird minus sign in the rotation (where $$e^{(\b{x \^ y} )\theta} (\b{x}) = \b{x} \cos \theta - \b{y} \sin \theta$$) up above goes away if $$\b{xy}(\b{x}) = \b{y}$$. The definition of the cross product in terms of wedge product becomes $$\b{a} \times \b{b} = I \cdot (\b{a} \^ \b{b}) $$ instead of $$-I (\b{a} \b{b})$$.

The way GA recovers the standard multivector inner product is with the "reversion operator", which looks like

$$A^{\dagger} = \< A \>_0 + \<A\>_1 - \<A\>_2 - \<A\>_3 + \<A\>_4 + \ldots$$

Which just means that it reverses the order of vectors in a product:

$$\b{xyz}^{\dagger} = \b{zyx} = - \b{xyz}$$

Such that the "standard" dot product of two multivectors (the one that returns $$1$$ if they are the basis element) is implemented as

$$(\b{xyz}) \cdot (\b{xyz}) = (\b{xyz})^{\dagger} (\b{xyz}) = 1$$

It seems to me that they defined their operation to associate in the wrong way and then have had to construct this operation to undo the mistake.

Incidentally, reversion is basically a generalization of complex conjugation. GA likes the way that the GP associates because it preserves the "square root of $$-1$$" behavior of complex numbers and quaternions: $$i^2 = j^2 = k^2 = -1$$. Then reversion is used to construct the vector norm again, which for complex numbers and quaternions is implemented with complex conjugation: $$\| a \|^2 = \bar{a} a = (a_x  - a_y i) (a_x + a_y i) = a_x^2 + a_y^2$$. I find it strange. It's hard to just say that complex conjugation is not an important operation, but it's also hard to say why it's so important---that is, I can't see a great philosophical argument for it. It is not an operation we really "want" to be using if we're trying to make geometry simple and intuitive.[^conjugation]

[^conjugation]: My rough understanding is that when $$\bb{R}$$ gets algebraically completed by $$i = \sqrt{-1}$$, there are really two possible values $$i$$ and $$-i$$ that satisfy $$i^2 = -1$$. Therefore if we are solving any proble in $$\bb{R}$$ with this value $$i$$, the solution can't care about the difference between $$+i$$ and $$-i$$, and you can interchange the two. That part is fine. But why, then, does multiplying $$z \bar{z}$$ give a "magnitude" that works in a reasonable way? It is very strange, and certainly not direct compared to $$z \cdot z$$.

I think once again the problem is the conflationg of "vectors" and "operators on vectors". Vectors themselves, or any multivectors, ought to have have normal norms that square to $$1$$. Operators on vectors, such as rotations and reflections, can square to whatever they need to square to; naturally $$R_{xy}^2 = -I$$, which, fine, write as $$-1$$ if you want to use a Clifford Algebra to represent it, and implement a version of complex-conjugation to extend this to your mixed-grade operators. But don't go around telling people that for some reason bivectors that represent units of surface area _also_ square to $$-1$$, because that's crazy.[^partial]

[^partial]: Aside: I wonder sometimes if EA is missing an operation in its toolbox which allows for contracting only _some_ components of multivectors together while multiplying the rest, such that $$(\b{x} \^ \b{y}) \cdot_1 (\b{x} \^ \b{y}) = - (\b{x} \o \b{x} + \b{y} \o \b{y}) = - I$$. I wrote about this operation some [here](({% post_url 2020-10-15-ea-operations %})), where I called it the "partial trace" because it is somewhat like [that operation](https://en.wikipedia.org/wiki/Partial_trace) on tensors. But it is hard to think about because it clearly has to be able to create _non_-wedge product results (such as $$I$$), which are hard to incorporate into the overall algebra. (That is generally part of my stance on GA and EA both: there are some missing parts of the theory that are needed to make all the properties of vector algebra make sense, and they're going to solve real intuitive problems a lot better than the GP does.)

----------

## Vector Division

One other thing that GA emphasizes from early on is the fact that most of the time you can divide vectors and multivectors:

$$\b{v}^{-1} = \frac{\b{v}}{\|\b{v} \|^2}$$

This is another one of the properties of complex numbers and quaternions that it attempts to extend to all vectorial objects. It almost makes sense: _if_ you are treating all multivectors as operators on other multivectors under multiplication, then naturally they have an inverse (if they are not an implementation of a projection) which is given by something that looks like division. I'm fine with that part. My objection is just that blurring the distinction between the multivectors and operators in the first place is weird, so inverting them is weird also. If you describe this as "inverting a vector", it is mysterious and weird. If you describe it as "inverting an operator (which is implemented as a vector in this particular algebra)" it is completely intuitive. So just do that!

For instance a rotation operator $$R_{xy}: \b{v} \mapsto \b{v} \cdot (\b{x} \^ \b{y})$$ has inverse $$R^{-1}_{xy}$$, which is of course a rotation in the same plane with the opposite orientation, hence implemented as $$R^{-1}_{xy} = R_{yx} = R_{-xy}$$. Meanwhile the inverse of $$\b{x} \^ \b{y}$$ under the dot product is the object $$(\b{x} \^ \b{y})/\|\b{x} \^ \b{y}\|^2$$. Etc. This perspective seems a lot more orderly and sensible to me, and it makes it completely clear how each inverse object should work with no magic.

I will say that at least one type of vector division shows up all over math. It is basically part of the operation of "projection":

$$(\b{v} \cdot \b{a}^{-1}) \b{a} = (\frac{\b{v} \cdot \b{a}}{\| \b{a} \|^2}) \b{a} = \text{proj}_{\b{a}}(\b{v})$$

It might seem weird to call this "division" since it does not exactly invert a particular multiplication operation. But I think it is a good _generalization_ of division. In particular it has the correct behavior if the vectors are parallel ($$(a \b{x}) \cdot (b \b{x})^{-1} = a/b$$), and in other cases its behavior is fairly easy to interpret: basically it divides the parallel parts and drops the non-parallel parts. (In other metrics there are also some concerns about zero-divisors, but whatever, just don't try to invert those.) But really even this is the inversion of a particular _operation_ on vectors: $$\b{v} \cdot \b{a}^{-1} = v_a$$ partially inverts scalar multiplication $$v_a \b{a}$$ (in the sense of a [pseudoinverse](https://en.wikipedia.org/wiki/Moore%E2%80%93Penrose_inverse)).

Of course anything you might do with the $$\b{a}^{-1}$$ notation you can also do without it,, but I think it's rather elegant how it takes care of handling the factors of $$\| \b{a} \|$$ for you. For instance it gives a neat way to factor a vector $$\b{v}$$ into components along an orthogonal set of vectors $$\{\b{a}, \b{b}, \b{c}\}$$ even if they are not unit vectors:

$$\b{v} = (\b{v} \cdot \b{a}^{-1}) \b{a} + (\b{v} \cdot \b{b}^{-1}) \b{b} + (\b{v} \cdot \b{c}^{-1}) \b{c}$$

Which may as well be written as

$$\b{v} = v_a \b{a} + v_b \b{b} + v_c \b{c}$$

By using this "vector division" instead of just a regular dot product, we cancel out the magnitude of the $$\{ \b{a}, \b{b}, \b{c} \}$$ elegantly. In a way this is treating $$\{ \b{a}, \b{b}, \b{c} \}$$ as a matrix $$\text{diag}(a,b,c)$$ in a certain basis, then inverting it to get $$\text{diag}(a^{-1}, b^{-1}, c^{-1})$$ in the same basis. (Of course, this only works due to the fact that the three vectors are orthogonal; otherwise you would get cross terms.)

Anyway, I am just trying to make the case that GA's notion of vector division is not on its own necessarily a bad idea.[^division]  And certainly it helps a lot when you are actually dealing with operators whose representations in a certain Clifford Algebra are actually invertible! But it is would be nice if they treated particular operations as invertible, not "vectors" in general". "Inverting a vector" is basically not meaningful, and pretending like it is is pedagogically and philosophically unsound. But a perfectly sound interpretation is waiting just a few steps away.

[^division]: Personally I suspect that there's a beautiful theory of this stuff, which I have written a bit hesitantly about [here]({% post_url 2023-09-25-inverses %}); I have a lot more thoughts on it but they're hard to write out without sounding... kooky... so I've been stewing on them for a few months instead. For instance there are a lot of places where it seems like it would be helpful to regard "covectors" (that is, dual vectors) as being the same thing as multiplicative inverses of regular vectors, and many equations are very well-behaved if you additionally regard them as having negative grades, so a $$(-1)$$-vector is a covector. But this is more of a perspective than an actual definition, and it's hard to be sure it's actually a good idea without a really compelling example.


-----------

# 4. Summary

I have given a lot of reasons why I think GA is problematic: the Geometric Product is a bad operation for most purposes. It really implements operator composition and is not a very fundamental or intuitive thing. Using a Clifford Algebra to implement geometry is an implementation detail, appropriate for some problems but not for general understandings of vector algebra and all of geometry. Giving it first-class status and then bizarrely acting like _that is not weird_ is weird and alienating to people who can see through this trick. 

Nor should we be trying to make everything look more like complex numbers and quaternions. Those are already weird and confusing; we should be moving away from them! Don't call the geometric product "the" way to multiply vectors. Stop fixating on the geometric product or on some particular $$Cl_{p,q,r}$$ that solves everything with a bunch of funky formula for basic stuff. Just teach wedge products and operators and keep it simple; stick to the good parts! Treat the Clifford Algebras as what they are: implementations of the compositions of particular operations in a particular notation. Not a replacement for the rest of geometry.

So for the time being I have to reject GA as a thing that I identify with. Fortunately, it is a philosophy, not a mathematical theory, so it's easy to reject. That's why when I write blog posts about the same basic ideas, and which align with the same basic philosophy of recasting mathematics in a more geometric and multivectorial form, I use the phrase "Exterior Algebra" instead.

That I said, I really do think there's a lot more to discover here. I'm convinced that there's some unifying theory of vector algebra that will tie this all together with a bow, and I'm hoping someone finds it, preferably soon. Among other things it will explain exactly why the geometric product _does_ work, when it does, and also why so many other formulas end up looking suggestive and interesting and imply that for instance we can sometimes divide and multiply vectors like they're numbers in a bunch of cases. When it does come along maybe we can call it "Geometric Algebra" again; it's a good name. Or maybe "Geometric Algebra 2.0", or "New Geometric Algebra", or "Geometrical Algebra". Or maybe we drag the name "Clifford Algebra" down out of the clouds and make it accessible to everyone. Whatever you want! But in the meantime, I'm not calling what I'm studying GA, because I want us to stop alienating people with all literature under that name. The geometric product, its associated ontology, and the culture around it... are just mucking everything up. Thanks.

