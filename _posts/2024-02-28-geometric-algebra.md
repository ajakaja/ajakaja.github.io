---
layout: blog
title: "The Case Against Geometric Algebra"
footnotes: true
math: true
aside: true
tags: notes
---

I've been thinking about writing this post for a long time. Normally I haunt the comment section on Hacker News and whenever an article about GA comes up I post something to the effect of: "GA is okay but it's not as good as those people say, there's something wrong with it, what you really want is the wedge product on its own!" Which is not especially productive and probably slightly unhinged. So today I want to make actually argue that point in one central place that I can link to instead.

To be clear I'm not opposed to GA per se. What I have a problem with is some of the details of GA, and the fact that the proponents of GA haven't fixed those details yet.

In particular **Hestenes' "geometric product" is a bad mathematical operation that needs to be discarded**, and that doing so is way overdue. Meanwhile GA is producing more and more enthusiasts every year, and it will take those people a while to realize the things a lot of us have realized, and in the meantime they will go on selling other people on GA and repeating the cycle. As a result GA is stuck in a sort of mediocrity. My purpose in writing this is to push it to improve and address those problems.

<!--more-->

Here's my basic stance:

1. The wedge product and the rest of Exterior Algebra is 100% amazing, S-tier stuff, definitely something everybody who uses mathematics should know about; we should be teaching wedge products in introductory linear algebra and multivariable calculus; we should not be getting rid of determinants but learning into them; we should cast all of physics and engineering and mathematics in multivectors forever as soon as possible. _Yes._
2. The geometric product, though, is kinda weird and bad.
3. A lot of other parts of GA are working around the fact that the geometric product is weird and bad.
4. The "better" version of Geometric Algebra, that will eventually be taught to everyone who learns calculus and linear algebra, and which I/we are... slowly unearthing... will be mostly the same as GA but it will discard the geometric product as a basic operation, to everyone's benefit. Plus it will probably involve some other stuff that hasn't been discovered yet. Let's hope.

The rest of this article will try to substantiate these points. I should warn you: I'm not a professional mathematician myself, just another somewhat-knowledgeable amateur with strong opinions. This is _not_ going to be the case that a serious mathematician would make, which is probably something like  "GA doesn't say anything new so who cares?" (I disagree with that strongly but there's not much point in arguing it. Sometimes it feels like mathematician's goals are strangely divorced from the goals of people who actually _use_ mathematics.) I am quite sympathetic, as you can already see, to GA's "rewrite the mathematical world to make things easier to think about" stance, which puts me slightly on the crank side of the fence anyway. I just don't think GA is very good at it, and I want it to do better.

----------

# 1. A lot of background on GA


It will be useful to understand what GA is, relative to the rest of math and physics, and how it got to be the way that it is, in order to establish exactly what it is that we're disagreeing with here. So first I am going to lay out the rough narrative that I have in my head. It is mostly just stuff I've pieced together over the years, and I admit that I don't really know how to check it against reality; I'd be happy to be corrected on any of this.

### Where GA lives in Mathematics

[Geometric Algebra](https://en.wikipedia.org/wiki/Geometric_algebra) (GA) is a branch of mathematics which rephrases vector algebra in a way that treats the "geometric product" $$\b{ab} = \b{a} \cdot \b{b} + \b{a} \^ \b{b}$$ as fundamental and derives everything else from it. Confusingly, it has _nothing_ to do with "Algebraic Geometry". GA is essentially the same thing as [Clifford Algebra](https://en.wikipedia.org/wiki/Clifford_algebra), which is a somewhat-obscure descendent of the subject of [Exterior Algebra](https://en.wikipedia.org/wiki/Exterior_algebra) (EA), which is sort of like chapter two of linear algebra if undergraduate linear algebra is chapter one. EA at this point is basically well-known to mathematicians and physicists.

I think it is important to distinguish "which parts" of GA are actually EA and which parts are EA. EA also deals with some new operations on vectors, the wedge product $$\b{a} \^ \b{b}$$ and Hodge star $$\star$$ and interior product $$\iota_{\alpha}$$. GA's difference is that it takes EA, adds in the geometric product, and then rephrases everything else in terms of it. 

The rest of mathematics and physics already use the EA with some regularity (although arguably not as much as they should). In mathematics EA comes up naturally in abstract algebra (the exterior algebra is a quotient of the tensor algebra which is a basic construction on vector spaces), and in various fields downstream of abstract algebra, such as algebraic topology. It also shows up in combinatorics and random other places (I believe entirely due to Gian-Carlo Rota) although from what I've seen the version they use is quite muddled. Also, more generally, EA provides the only actually good way of looking at linear algebra concepts like determinants and matrix minors and it seems to be gradually infiltrating the literature that touches those subjects.

Physicists know EA specifically from its ubiquitous use in General Relativity, where it shows up as the "exterior calculus of differential forms", which are used to express Differential Geometry in a coordinate-free way. For some reason, for the later half of the 20th century, physics mostly treated EA as _just_ a thing you do with differential forms, instead of a general theory of vector algebra.[^forms] I am really not sure why. It would have been really nice to have in e.g. classical electromagnetism.

[forms]: Specifically, they dealt with only the exterior algebra of cotangent vectors on a manifold (the differentials) and not at all with the exterior algebra of tangent vectors (which they equate with partial derivative operators on functions).

The geometric product of GA is the same operation as the product in a Clifford Algebra, which also shows up here and there in math. Clifford Algebras are a generalization of complex and quaternion number systems which are used primarily because they are the Gamma matrices in quantum mechanics, although from what I've seen it's relatively rare that physicists actually refer to them by name. For the most part "Geometric Algebra" and "Clifford Algebra" refer to the same material, but from a different ideological angle: GA is specifically focused on making elementary geometry easier, while Clifford Algebra refers to things that look more like standard research mathematics.

Probably both GA and EA could be considered as members of the larger subject of "multilinear algebra" which would include tensor analysis and all of linear algebra as well. There's an argument to be made that they are really just "the rest of linear algebra", the big part of it that isn't included in introductory texts and hasn't entered the mainstream yet. Perhaps in 100 years they will be fully folded into the standard curriculum.

----------

### An Approximate History of GA

GA is mostly less well-known in mathematics and physics than EA. Yet has a strangely large number of people advocated for it, particularly online in communities, articles, videos, and conference talks. Why? Well, here's a basic history that sort-of explains why it was unknown in the first place, and why it is increasingly not.

GA was more-or-less invented in the 1950s by [David Hestenes](https://en.wikipedia.org/wiki/David_Hestenes), who made it his project to popularize it throughout the next fifty years. The underlying ideas date back to Clifford around 1878, who himself was extending Grassmann's Exterior Algebra from the 1840s. Hestenes' contribution was to transform Clifford Algebra, otherwise a piece of math exotica, into a sort of ideological platform: that everything should be reformulated in terms of multivectors and in particular the geometric product. IMO that switch is what changes the subject of "Clifford Algebra" into the subject of "Geometric Algebra".

As far as I can tell, GA was mostly unknown until the 1990s. In the interim Hestenes was plugging it here and there, and a few other people had gotten on board, but it really got going with a surge of interest in the 90s. I _believe_ the spike in popularity was mostly attributable to some papers from a group out of Cambridge ([website](http://geometry.mrao.cam.ac.uk/)), in particular Chris Doran and Anthony Lasenby (although there were a lot of other names who started writing papers around the same time: e.g. Dorst, Mann, Chisholm, MacDonald, Lounesto). The Cambridge group began putting out papers with names like "Imaginary Numbers are not Real" and "A unified mathematical language for physics and engineering in the 21st century" which appealed to _a lot_ of people (like me!) who had lingering reservations about the use of complex numbers in physics. I have no idea where I first came across them myself, but they were sort of ambiently floating around online by ~2010, and tended to show up if you went googling for intuitive explanations about spinors and quaternions.

For physics dissidents like me, the use of imaginary numbers in quantum mechanics is _very philosophically unsatisfying_---as was the fact that the previous generation of physicists seemed to think this was not a problem.[^complex] Likewise was the use of [Pauli matrices](https://en.wikipedia.org/wiki/Pauli_matrices) $$\sigma_i$$ for the generators of spinor rotations and the [gamma matrices](https://en.wikipedia.org/wiki/Gamma_matrices) $$\gamma^{\mu}$$ for bispinor rotations. (Pauli matrices, at least, could be recast in terms of the quaternions $$\bb{H}$$, but that doesn't help, given that they're basically a higher-dimensional version of $$\bb{C}$$.)

[^complex]: The answer, at minimum, is at least trying to name what space they're supposed to be rotations in, even if to just give it in a name like $$X$$, and then write $$R_{X}$$ instead of $$i$$. Are all the $$i$$s of QM experimentally proven to be in the same space? I'm not sure anybody knows. Is it the $$U(1)$$ gauge field of E&M? Your intro quantum book doesn't mention it; it treats them as axiomatic.

Doran and Lasenby and contemporaries' writing appealed because they were at least _trying_ to fix these problems. They proceeded to publish a bunch of papers and books that reformulated most of the the foundations of physics in GA, and a lot of people who came across them got interested and started speaking the gospel. Compared to them the mainstream physicists seemed dogmatic: bizarrely accepting of things that should be up for debate. (Of course, that is how fringe ideas always view mainstream ideas.)

Unfortunately, while the GA folks were clearly onto _something_, in practice their reformulations are not that useful for actually doing or understanding physics. (My opinion, but seriously, go read them.) It turns out that writing everything in terms of the geometric product does not make it easier to understand.( The valuable parts, I think, were the parts that were using the _wedge product_ more liberally than physics had before. But that's the point I'm going to make in detail later.)

Around the same time, a lot of new people were learning computer graphics programming, and they also tended to encounter quaternions and get frustrated for much of the same reasons. It had been understood for a long time that quaternions were the better way of modeling rotations in 3d space, compared to e.g. Euler Angles, because they treated every axis of rotation equally and allow for smooth interpolation between any two points (and also they avoid "gimbal lock", as nobody ever forgets to mention). In hindsight, it turns out that when you want to model an exotic noncommutative algebra like $$SO(3)$$, it is very important to use an actual algebraic model of it instead of something else entirely.

But quaternions are a pedagogical nightmare (go look how many Youtube videos there are explaining them!). So when the GA people came along and started talking about bivectors and rotations in a way that actually made some sense, a lot of people got interested. (No doubt there are other things in graphics programming that GA makes easier as well. I wouldn't know, but computer graphics involves a _lot_ of the geometry.)

Finally, I would speculate that there's one more reason that GA is less well-known in mathematics: even by the 90s/00s, GA had gotten a bad reputation because of its tendency to attract bad mathematicians and crackpots. It makes sense, really. There are a lot of people who found it appealing for the reason I did: because the existing models of vector algebra and quaternion rotation were deeply unsatisfying. But it turns out that those reasons _disproportionately_ attract people who are not actually capable of research-level rigorous mathematics, or are slightly prone to conspiratorial thinking, or are otherwise slightly deranged (also like me? TBD).

I guess there are more people who can tell when math is bad or weird than can do good math themselves. So GA ended up appealing to a lot of fringes: people who only had undergraduate degrees, people who had dropped out of PhDs, people with PhDs from unrigorous programs, people who had been good at math but were perhaps going a bit senile, random passerbies from engineering or computer programming, run-of-the-mill circle-squarers, people who had a bone to pick with establishment mathematics and felt like all dissenting views were being unfairly suppressed... And these were the people who started publishing a lot of stuff about GA, often dressed up to look like serious research even when it was not. Indeed, if you look around for papers that explicitly GA, they are _very_ disproportionately (a) non-theoretical, (b) poorly-written, (c) trivial, i.e. restating widely-known results as if they're novel, and (d) just plain crackpotty.[^vixra]

[^vixra]: For instance try searching [viXra](https://vixra.org/), that is, crank ArXiv, for the phrase "geometric algebra". (Aside: if I ever have a beautiful Theory of Everything to share with the world it has occurred to me that it would be funny to post it on ViXra instead of somewhere reputable, just to confuse everyone. Don't write them off completely!)

It didn't help that a lot of the texts by the _actually_-competent GA people, like the Cambridge group, tended to say things that sounded (and still sound) kind of crackpotty as well. Things which were morally equivalent to "this new theory is going to fix everything", which is exactly what the crackpots also say, and for the same reasons (the validity of a statement like that is completely conditional on a person's ability to actually distinguish truth from fiction). Or just ostentatiousness, such as (quoting here) "we have now reached the part which is liable to cause the greatest intellectual shock". Or acting like results in GA are new and novel when they're clearly just using wedge products the same way that physicists had regularly done for decades. Or, worst of all, saying things like "these new GA equations are simpler than the old ones" while referring to equations which were _clearly not simpler than the old ones_.

So I suspect that what has happened is that competent mathematicians have tried to distance themselves from Geometric Algebra due to its dubious reputation. Which of course leaves GA with an even higher ratio of cranks, because most of the non-cranks left. In fact I suspect that mathematicians will tend to publish papers about "Clifford Algebra" when they want to talk about the exact same material but without the negative association, and some of the serious GA-adjacent research on ArXiv is just under the name Clifford Algebra instead.

To be clear, I don't think it's wrong to disassociate from the name "Geometric Algebra". GA's dubious reputation among mathematicians is _well-deserved_. I'm doing it too---that's why all of my posts refer to Exterior Algebra instead. But that doesn't mean GA isn't _also_ onto something. It just menas that that there's a lot of low-quality stuff under the same label, which has made that label questionable, and if you want to sift through it you have to be ready to filter for quality yourself.

Also, as a result of its popular appeal and fringe status, there are a lot of online discussions dedicated to GA. Actually a shocking number, if you go look for them. off the top of my head there's a website called [Bivector.net](https://bivector.net/) which has forums and a Discord that (as of this moment) has 200+ people online, which I guess feels like a lot for a _community about a fringe mathematical theory_. Plus a few other forums. Plus people show up talking about GA in the comment sections on every other math-related forum if anyone asks any questions about quaternions or bivectors. Plus there are the countless Youtube videos, conference talks, expository PDFs, standalone websites, etc. And then there are whole offshoots of GA, like Conformal Geometric Algebra and Plane-Based Geometric Algebra, that have their own enthusiasts and sometimes their own websites as well. Etc.

This is not really a bad thing. If anything what it shows is _how many_ people are passionate to see math reformulated in a way that makes more sense---so many that they'll convene and talk about it on every one of the bizarrely-inadequate social networks we have in 2024. And that's part of what is motivating me to write this article (which is getting very long now...). GA has got something of the right idea and people recognize that and latch onto it. I happen to think that it is almost certainly right that modern mathematics needs a more intuitive foundation. Research math knows a _lot_ about geometry, but although most of the knowledge required to do all the things people actually want to do with geometry is out there _somewhere_, it's not accessible or intuitive and the details are only really available to specialists.[^reddit] At some level GA is trying to "democratize" geometry.

[^reddit]: For instance the most common stance on the r/math subreddit looks like [this one](https://www.reddit.com/r/math/comments/1ghw4b/why_isnt_geometric_algebra_more_widely_taught/): "From what I have seen, Geometric Algebra is just a rehashing of existing math.". Which, yes, I agree, but the point is to make the existing math more intuitive, not to discover new results. The fact that research mathematics is generally _not_ concerned with making calculation and intuition easier to think about is, I think, a giant failure that it will eventually regret. There's as much value in making things easy to use as there is in discovering them. At this point probably more. Picture if nobody had started teaching non-mathematicians calculus because it was just for experts---it feels like that.

So basically I _do_ agree with them: GA is onto something, which is that geometry deserves more intuitive foundations, and multivectors and the like are probably a big part of it. The problem is that... GA isn't quite it.

----------

# 2. The Actual Case Against GA

As I wrote above: _Exterior Algebra_ is clearly valuable and widely used already in graduate-level math and physics; _Geometric Algebra_ ought to be evaluated on what it adds on top of that.

So what does GA specifically say? As I see it, GA is not so much a subject as an ideological position, consisting of basically two ideological claims about the world:

1. That the concepts of EA (so, wedge products, multivectors, duality, contraction) are incredibly powerful and ought to be used everywhere, starting at a much lower level of math pedagogy---basically rewriting classical linear algebra and vector calculus.
2. That the Geometric Product (henceforth: GP) should be added to that list as the most "fundamental" operation, where by "fundamental" I mean that they would have all of the other operations constructed in terms of it and generally state theorems in terms of it.

**Claim (1), I believe, is completely correct**, and is responsible for much of the reason GA _has_ gotten so popular. Exterior algebra and the general idea of doing geometry with multivectors is incredibly powerful and intuitive and it ought to be widely used and taught to everybody, and we should all be reading and writing new textbooks that incorporate it. It's so obviously true that I'm not even going to talk about it after this paragraph. _Of course_ $$n$$-vectors make more sense than determinants. _Of course_ differential forms make more sense than nested integrals and mysterious Jacobians. _Of course_ wedge products make more sense than cross products. _Of course_ bivectors make more sense than $$\bb{C}$$. _Of course_ we should use multivectors instead of "pseudovectors" and "pseudoscalars". Why are we even talking about it? Just go rewrite all the books, the theory is (mostly) there.[^communication]

[^communication]: Well, communicating it at the right level and in the right notations is the trick. And also, arguably the theory _isn't_ quite there and that's part of the problem, too. But with all these interested people surely we can work on that?

**Claim (2), I believe, is insane.**

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

Where the first part is a scalar and the second part is a vector written in the basis $$(\b{i}, \b{j}, \b{k}) = (\b{jk}, \b{ki}, \b{ij})$$. (Nevermind the minus sign, that's quaternions being weird.)[^quaternion]

[^quaternion]: The actual implementation of quaternions in geometric algebra regards it as the even subalgebra of the geometric algebra on $$\bb{R}^3$$, with elements given by e.g. $$\b{i} = -I\b{x}$$, that is, $$\b{i} = \b{zy}$$, $$\b{j} = \b{xz}$$, $$\b{k} = \b{yx}$$. This is of course totally weird but it's equivalent to how quaternions are implemented in Pauli matrices: $$\b{x} \mapsto -i \sigma_1$$, etc. Quaternion multiplication follows from the GP: $$\b{ij} = (\b{zy})(\b{xz}) = \b{yx} = \b{k}$$ and $$\b{ii} = (\b{zy})(\b{zy}) = -1$$. But this mapping is basically arbitrary, and other mappings would also implement the same underlying algebra.

Still, you have to explain what your geometric algebra is doing with mixed-grade objects. Do they... mean something? What is the scalar part? What would it mean to have a sum of a scalar, vector, bivector, and pseudoscalar? Or are they just formal linear combinations of things with no meaning? What is going on?

Not only that, you need the mixed-grade objects to actually be _better_ than they were before you wrote them that way. For instance you _can_ write the electromagnetic field as $$\b{F} = \b{E} + \b{I} \b{B}$$. But should you? Probably not. $$\b{E}$$ is better understood as being a $$\b{x} \^ \b{t}$$ bivector while $$\b{B}$$ is an $$\b{x} \^ \b{y}$$ bivector, so they're both bivectors. The mixed-grade interpretation only makes sense if you confine yourself to $$\bb{R}^3$$ for some reaseon. There are [other examples](https://math.stackexchange.com/questions/3805595/are-there-any-geometrically-meaningful-useful-mixed-grade-objects-in-geometric-a) of rewriting things as mixed-grade objects, but, notably, none of them... seem good? Writing equations in terms of mixed-grade multivectors in general doesn't _tell you anything useful_. You can't "think in them". Or at least, I can't.

So that's one problem: **there is no good general interpretation or usage for mixed-grade multivectors** yet for some reason they are one of the fundamental objects of the theory. Why not just get rid of them? And perhaps more to the point: The **geometric product has no geometric interpretation in general**. Seriously, it doesn't. Look at people [trying](https://math.stackexchange.com/questions/1535878/visualizing-the-geometric-product) to find one. It is very awkward that the basic geometric operation in the geometric algebra that people espouse because they're trying to make everything geometrically intuitive... is not geometrically meaningful on its own.

Another problem is that **the geometric product is a terrible way to actually implement the operations that defined in terms of it**. If you want to calculate dot products, wedge products, rotations, reflections, etc, or especially if want to program them into a computer, the _last_ thing you want to do is implement them as arbitrary products of mixed-grade-multivectors and then project out certain terms at the end that you care about. Because of course you don't: you really want to just implement the actual operation you were trying to use; doing it that way woudl be both tedious and a giant waste of memory and computational power. Phrasing everything in terms of the geometric product is neither easier to do by hand nor on a computer. It is just a huge pain.

---------

### Rotations and Reflections

There are a few specific examples of mixed-grade vectors in GA that do, at least, something. I'm aware of roughly three, which are all related to each other:

(1) A rotation as implemented by exponentiating a bivector:

$$e^{\theta (\b{xy})} = \cos \theta + (\b{xy}) \sin \theta$$

Which operators on vectors like so:

$$e^{\theta (\b{xy})}(\b{x}) = \b{x} \cos \theta - \b{y} \sin \theta$$

(2) The intermediate object that you get when implementing a rotation with two rotors, that is, rotating a vector by sandwiching it between two half-angle rotations (which is necessary to produce the correct [Rodrigues formula](https://en.wikipedia.org/wiki/Rodrigues%27_rotation_formula) for rotations in $$>2$$ dimensions[^Rodrigues]). :

$$\b{v} \mapsto e^{\theta \b{B}/2} \b{v} e^{-\theta \b{B}/2}$$

The intermediate object in this case is $$e^{\theta \b{B}/2} \b{v} = \cos (\theta/2 )\b{v} + \sin (\theta/2) \b{B} (v_{\parallel} + v_{\perp})$$. If $$v_{\perp}$$ is perpendicular to the plane of rotation then $$\b{B} \b{v}_{\perp}$$ becomes a trivector temporarily before being turned back into a vector by the second copy of $$\b{B}$$.

(3) The intermediate object $$\b{n} \b{v} = v_{\parallel n} + \b{v}_{\perp n} \^ \b{n}$$, a scalar plus bivector, which you get when reflecting a vector over a unit vector $$\b{n}$$:

$$\b{v} \mapsto -\b{n} \b{v} \b{n}$$

[^Rodrigues]: In general rotating with $$e^{\theta \b{B}}$$ doesn't work to rotate vectors, because---well look at it, it multiplies every term in the vector by either $$\cos \theta$$ or $$\sin \theta$$, and rotating a vector _should_ leave an axis unchanged! The problem is that it only implements the rotation part of a rotation matrix, but not the $$1$$ on the diagonal. Modeling rotations as rotors, on the other hand, handles things correct: $$R_{\theta}(\b{v}) = e^{i \b{B}/2} \b{v} e^{-i\b{B}/2}$$. That's also how quaternions do rotations correctly. Note the similarity to a change of basis $$A \ra P A P^{-1}$$ in linear algebra. Curiously, spinors rotate with only one rotors instead of two, which makes people sometimes call them a sort of "square root of a vector".

In each case we are using a mixed-grade object as an operator on vectors, and there are extensions to act on other generic multivectors. What seems to happen is that the scalar term in each case is responsible for performing the part of the operation that leaves its argument unchanged, while the bivector term is responsible for the part that gets transformed.

It's worth considering what this would look like if we instead implemented the operations as an [exponential map](https://en.wikipedia.org/wiki/Exponential_map) of a generic rotation operator:

$$
\begin{aligned}
e^{\theta R_{xy}} (\b{x}) &= (I \cos \theta + R_{xy} \sin \theta) \b{x} \\
&= I(\b{x}) \cos \theta + R_{xy}(\b{x}) \sin \theta \\
&= \b{x} \cos \theta + \b{y} \sin \theta \\
\end{aligned}
$$

Where $$I$$ is the identity operator. (Nevermind the sign change compared to GA's version, it's basically a choice of convention.) The interesting part is that the operator version of the exponential map produces two objects with the _same_ type: both are "operators that map vectors to vectors". Whereas the GA versions produce two objects with different types: a scalar and a bivector, which both happen to give a vector when multiplying a vector. In the operator version, the first term happens to be identity operator which you _could_ write as a scalar $$1$$... but it seems more natural to me that both $$e^{\theta R_{xy}}$$ and its expansion in $$\cos \theta$$ and $$\sin \theta$$ are of the "same type" throughout. And although the identity operator $$I$$ could be written as $$1$$, it is just as good to regard it as a tensor product $$\b{x}^* \o \b{x} + \b{y}^* \o \b{y} + \b{z}^* \o \b{z}$$. Either way, GA's trick of "removing the vector part, then putting it back" is just... weird, I guess?

Basically, I find the operator version a lot more appealing. It is _interesting_ that GA's version works, for sure, but since the intermediate objects are pretty much uninterpretable I don't really that they can be said to be better.

I suspect that this is where GA goes wrong with mixed-grade objects. To implement rotation with multivectors, you need some way of applying an identity and a rotation at the same time. You might think: oh, I know, I'll use a mixed-grade object, where a scalar will act like the identity and the bivector will act like a rotation. But "really" what you want is to build your rotation out of _operators_, not multivectors.

Operators are a slightly different thing than multivectors, and I think the distinction is important. On their own, vectors are _not_ rotations or reflections or translations. Multivectors are not rotations. They can be put in _correspondence_ with rotations or reflections or translations, yes, for instance it is very helpful to talk about unit bivectors for the purposes of defining the planes that rotations happen in. But I think it is a mistake to _equate_ them with rotations and with operators, and everything else goes wrong downstream as a result. 

To be frank, even the interpretation of complex numbers as operators is confusing, geometrically. We learn to regard $$a + bi$$ as an operation $$r e^{i \theta}$$, where it acts on other complex numbers by rotating and scaling them, but that is actually pretty weird?. Most of the time we think of complex numbers as vectors in $$\bb{R}^2$$ _or_ as rotation+scaling operators. Rarely do we actually we want them in both roles at the same time. So it is not, really, all that natural to equate the two objects, as opposed to finding a correspondence between them.

GA would phrase this as the vector interpretation being $$a \b{x} + b \b{y}$$ and the operator interpretation as $$a + b I$$, by the way, which is a fair point. But I would argue that even the bivectors and scalars should not be interpreted as operators _either_. Bivectors are not operators either: they're elements of a vector space that models units of area in planes. Rotations can be _implemented_ with them, yes, because rotations take place in planes, but they are not "the same thing". Bivectors become rotation operators _when you contract with one of their indexes_, which is a separate step. You should have to actually write $$R_{xy}(\b{v}): \b{v} \mapsto \b{v} \cdot (\b{x} \^ \b{y})$$ in order to turn a bivector into a rotation operator. After all, a bivector is not a rotation operator on other bivectors or multivectors _on its own_---it only has that behavior on vectors when used in a certain way, when it acts on them via contraction.

So it seems to me that GA ends up being very strangely fixated on equating "vectorial objects" and "operators that act on vectorial objects" because it worked once (for rotations), when in fact there is no philosophically agreeable reason to do so. Instead what you want to do is play with all of the geometric objects you care about in their most natural forms, and then find isomorphisms between them when it's convenient to do so. Otherwise you smush your completely meaningful algebra of actually-intuitive geometric objects and operators... into a bunch of unintuitive overlapping objects.

So that's another problem with geometric algebra: **mixed-grade multivectors don't really mean anything except for in rotations and reflections, which have a better interpretation anyway**. It is a philosophical quibble, though, and I could understand disagreeing with it; my preference for using explicit operators for rotations is going to be somewhat cludgy anyway. Still it is hard to ignore the fact that there is no intuitive picture whatsoever for an arbitrary mixed-grade multivector.

A related problem is that even when you _do_ treat multivectors as operators, the interpretations are... weird? Consider the reflection operation:

$$P_{\b{n}}: \b{v} \mapsto - \b{n} \b{v} \b{n}$$

Where $$\b{n}$$ is a unit vector that we're reflecting over. This works because if you decompose $$\b{v} = \b{v}_{\parallel n} + \b{v}_{\perp n}$$ you can see that it flips the parallel part but not the perpendicular part (recall that parallel vectors have zero wedge product while perpendicular vectors have zero dot product):

$$
\begin{aligned}
P_{\b{n}}(\b{v}) &= - \b{n} \b{v} \b{n} \\
&= - \b{n}( \b{v}_{\parallel n} + \b{v}_{\perp n}) \b{n} \\
&= - \b{n} \b{v}_{\parallel n} \b{n} - \b{n} \b{v}_{\perp n} \b{n} \\
&= - \b{n} (\b{v}_{\parallel n} \cdot \b{n}) - \b{n} ( \b{v}_{\perp n} \^ \b{n}) \\
&= - \b{n} v_{\parallel n} + \b{n} ( \b{n} \^ \b{v}_{\perp n}) \\
&= - \b{v}_{\parallel n} + \b{v}_{\perp n}
\end{aligned}
$$

It's neat that that works. But is it a good formula? Does it make any sense? _Not really_. Why would you reflect a vector by sandwiching it with a unit vector and adding in a minus sign? Is there any way you could have guessed that formula without already knowing that it works? Does knowing it teach you how to find any new formulas? Not for me. And part of the problem is that the intermediate object $$v_{\parallel n}  - \b{n} \^ \b{v}$$ doesn't mean anything, so factoring this operation as $$-\b{n} (\b{v} \b{n})$$ doesn't turn it into two meaningful objects whose behavior I can understand. It is, basically, a trick. Compare to how you would write this with operators:

$$P_{\b{n}}(\b{v}) = \b{v}_{\perp n} - \b{v}_{\parallel n} $$

At least you can tell what it's doing. (If we were developing geometric algebra with operators we would have of course already defined the projection $$\b{v}_{\parallel n}$$ and rejection $$\b{v}_{\perp n}$$ operators at this point.) 

So that's another complaint: **Geometric Algebra's sleek formulae, when it has them, don't provide any useful geometric intuition**. They're just things you have to memorize. There is _maybe_ a way to intuit out the reflection formula if you think of all unit vectors as being reflection operations, but... good luck. I don't think it really works.

-----------

### GA in Physics: Pauli and Gamma Matrices

Once you have defined the weird GP on vectors, the next step in GA is to define the regular useful operations of EA in terms of it:

$$\b{a} \cdot \b{b} = \frac{1}{2}(ab + ba)$$

$$\b{a} \^ \b{b} = \frac{1}{2}(ab - ba)$$

This construction is appealing to people who came from particle physics because, again, their first exposure to exterior algebra was probably in the form of Pauli matrices (which show up in the quantum mechanics of a non-relativistic electron) and Gamma matrices (which show up in the [Dirac Equation](https://en.wikipedia.org/wiki/Dirac_equation) for relativistic electrons and positrons).

The gamma matrices, famously, have their symmetric product equal to the (Minkowski) metric $$\eta^{\mu \nu} = \text{diag}(1, -1, -1, -1)$$:

$$\{ \gamma^\mu, \gamma^\nu \} = \gamma^\mu \gamma^\nu + \gamma^\nu \gamma^\mu = 2 \eta^{\mu \nu}$$

Which, after some unpacking of the notation, says that $$\gamma^0 = \b{t}$$ and $$\gamma^i = \b{x}^i$$ and that $$\b{t} \cdot \b{t} = +1$$ while $$\b{x} \cdot \b{x} = \b{y} \cdot \b{y} \cdot \b{z} \cdot \b{z} = -1$$. And when you keep going, it turns out that the total set of Gamma matrices has 16 elements corresponding to the 16 elements of $$\^^4 \bb{R}^{1, 3}$$: one scalar (the identity), four vectors (the regular Gamma matrices), six bivectors (the commutators of Gamma matrices), four trivectors (etc), and one pseudoscalar (the object usually written $$\gamma^5$$). And their multiplication rule is exactly the Clifford algebra on those objects with metric signature $$(+1, -1, -1, -1)$$. That is actually cool and interesting: apparently the Gamma matrices _do_ implement the Clifford algebra $$\text{Cl}_{1,3}$$, that is, the geometric algebra $$\mathcal{G}_{1,3}$$. Evidently whatever a bispinor "is", vectors act on them by multiplication using the Gamma matrices as their representation.

So if you were coming from knowing about Pauli matrice and Gamma matrices, finding out that there's a way to interpret them all as basic elements of an intuitive algebra (which GA calls the "spacetime algebra") is very appealing. This, I think, is the reason Hestenes, Doran, Lasenby, etc were very interested in the geometric product as a generic tool for building vector algebra in the first place; their early papers are very targeted at physcists who are frustrated with spinors and bispinors not making much sense.

I agree that rewriting the objects in terms of their Clifford Algebra is a good idea. But I don't agree that this means you should rephrase all of geometry in terms of the Clifford Product / Geometric Product. The GP is provisionally useful for complex numbers, quaternions/Pauli matrices, and Gamma matrices... and _nowhere else_. So why would you go rewrite all of vector algebra in terms of it?  Anyway I'm counting it as another problem with GA: **The GP is only really natural in certain places in physics and even there it doesn't make a lot of sense. Yet GA is trying to use it everywhere, for everything, when other operations do a better job.**


Moreover, if you do want to do physics in terms of basis vectors instead of Gamma matrices, it's not actually that helpful replace all the $$\gamma^\mu$$s with $$\b{x}^\mu$$s without actually having a physical interpretation for the operations that you're doing. You're multiplying coordinate vectors together---why? If your only purpose was to write wedge products and dot products you could just do that and use exterior algebra without the GP. The only reason the GP enters is that you specifically want to _keep_ using your matrices as matrices, with ordinary matrix multiplication. But as soon you move them all over to $$\b{x}^\mu$$s, why not just write $$\b{x}^\mu \cdot \b{x}^\nu = \eta^{\mu \nu}$$? Why leave them in terms of $$\b{a} \cdot \b{b} = \frac{1}{2}(ab + ba)$$? Well, I guess the answer is that you do need the matrix form in order to compute their action on spinors---but still. It leaves a lot of open questions.

I will admit that there is something suspicious about it. Why does physics work well with these matrices that obey a Clifford algebra? Why do they turn out to model bispinors correctly? Is it confused, or am I? I'm not sure. I need to learn more about relativistic QM, at least. But anyway, for now I'm sticking with my stance: even if physics wants us to use the GP for a couple specific cases, that's not a justification for teaching it to everybody and phrasing all of vector calculus and projective geometry in terms of it when it _has no geometric meaning otherwise_. Let's keep the mysterious unintelligible operation confined to the places that need it and insulate everyone else from it for now, okay?

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

More generally I think it is better construct all of these operations directly from the tensor algebra. I suspect that the "right way" (inasmuch as that phrase means anything) to think about vector algebra is to think of the two fundamental operations as being (1) the tensor product $$\b{a} \o \b{b}$$ and (2) the dot product/trace $$\b{a} \cdot \b{b}$$. Everything else is really constructed from these, and despite [what people will say](https://youtu.be/htYh-Tq7ZBI?t=1411), it is actually rather intuitive that the product of $$(a_x \b{x} + a_y \b{y})(b_x \b{x} + b_y \b{y})$$ would be $$a_x b_x \b{xx} + a_x b_y \b{xy} + a_y b_x \b{yx} + a_y b_y \b{yy}$$. Or at least, it is certainly more intuitive than the geometric product. It is weird _at first_ that multiplying two vectors would make a rank-$$2$$ tensor, but it is not really different from the fact that multiplying two scalars with one unit each gives a scalar with two units: $$5 \text{m} \cdot 3 \text{s} = 15 \text{ m}\cdot\text{s}$$.[^units]

[^units]: Actually, I think it is _exactly_ the same as that, and whenever I finally write my book on all this I'm going to introduce the tensor algebra as a way of juggling multiple units at once rather than any sort of universal free multilinear multiplication...

Anyway, if you start with the tensor product, then your pedagogical task is to explain why anybody would then go and invent the exterior product from that, but that actually not too bad: in some sense the dot product asks "what happens if you multiply two vectors and ignore the terms that aren't parallel?" and then the wedge product asks "What happens if you multiply two vectors and ignore the terms that _are_ parallel?". Those are at least philosophical constructions, and although they're not completely satisfying, nature clearly indicates that they're meaningful and powerful.

----

### Weird Associativity

Here's an objection I've never seen elsewhere: **geometric product's associativity is actually really awkward**. 

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

But if you made the geometric product operate left-to-right, it doesn't work, because the wedge product part actually _does_ care about the ordering. Of course that's how it works in regular exterior algebra already: the dot product and wedge product are just _different operations_, both of which work fine on their own, and the dot product is left-to-right while the exterior product associates. But anyway, in proper covariant exterior algebra, the dot product is conceptualized as being a pairing between multivectors and dual multivectors, while the wedge product is between multivectors and multivectors, so their types are actually different. Another good reason to not combine them into one operation.

Amusingly, a bunch of GA's definitions of things in terms of the GP work _better_ if you use left-to-right contraction! For example the weird minus sign in the rotation up above goes away if $$\b{xy}(\b{x}) = \b{y}$$. The definition of the cross product in terms of wedge product becomes $$\b{a} \times \b{b} = (\b{a} \^ \b{b}) \cdot I$$ instead of $$-I (\b{a} \b{b})$$. Not to mention any formula that uses the "reversion" operator. Once GA has defined its basic product to associate, they invent another operator called "reversion" in order to recover the actual left-to-right contraction that is used in the typical tensor-algebra-inherited dot product. It looks like this:

$$A^{\dagger} = \< A \>_0 + \<A\>_1 - \<A\>_2 - \<A\>_3 + \<A\>_4 + \ldots$$

Which just means that it reverses the order of vectors in a product:

$$\b{xyz}^{\dagger} = \b{zyx} = - \b{xyz}$$

Such that actual tensor contraction of two multivectors is implemented as

$$(\b{xyz}) \cdot (\b{xyz}) = (\b{xyz})^{\dagger} (\b{xyz}) = 1$$

It seems to me that, having defined their product to associate in the wrong way, they have had to construct this operation to "undo" the mistake. When in fact defining left-to-right contraction in the first place would just not have this problem.

Well, there is an argument for it. The reversion operation is basically a generalization of complex conjugation. GA likes the way that the GP associates because it preserves the "square root of $$-1$$" behavior of complex numbers and quaternions: $$i^2 = j^2 = k^2 = -1$$. But once you have that you end up wanting to construct the vector norm again, which for complex numbers and quaternions is implemented with complex conjugation: $$\| a \|^2 = \bar{a} a = (a_x  - a_y i) (a_x + a_y i) = a_x^2 + a_y^2$$. But complex conjugation is not a particularly intuitive operation either (why is it a basic operation to reflect a vector over the $$x$$ axis, but not the $$y$$ axis?). Mathematics is filled with operations that act like it (at some level it is the same thing as the transpose of a matrix or the adjoint of an operator). But it is not a natural _geometric_ operation. So I cannot see a reason why you would want your vector algebra system to treat it as first-class.

Really, I think this is another casualty of their preference for conflating "multivectors" with "operators on multivectors" instead of distinguishing the two classes of objects. In my version of GA that would prefer left-to-right rotation, the "square root of $$-1$$" property is a property of the rotation operators that I talked about above, rather than bivectors themselves. This means that $$(\b{x} \^ \b{y}) \cdot (\b{x} \^ \b{y}) = 1$$ because every basis element is given norm $$1$$, but the operator $$R_{xy}: \b{v} \mapsto \b{v} \cdot (\b{x} \^ \b{y})$$ when composed with itself gives $$R_{xy} \o R_{xy}: \b{v} \ra - \b{v}$$, that is, $$R_{xy}^{\circ 2} = -I$$.

I admit that this is a bit strange: why is it the case that the object $$i$$ that algebraically completes $$\bb{R}$$ happens to be a rotation operator that is implemented as contraction with a bivector? I don't know. But is it reason enough to use a product that associates in a way that is bad for everything else? Not to me.

I wonder sometimes if part of the problem is that EA is missing an operation in its toolbox which allows for contracting only _some_ components of multivectors together while multiplying the rest, such that $$(\b{x} \^ \b{y}) \cdot_1 (\b{x} \^ \b{y}) = - (\b{x} \o \b{x} + \b{y} \o \b{y}) = - I$$. I wrote about this operation some [here](({% post_url 2020-10-15-ea-operations %})), where I called it the "partial trace" because it is somewhat like [that operation](https://en.wikipedia.org/wiki/Partial_trace) on tensors. But it is hard to think about because it clearly has to be able to create _non_-wedge product results (such as $$I$$), which are hard to incorporate into the overall algebra.

That is generally part of my stance on GA and EA: there are some missing parts of the theory that are needed to make all the properties of vector algebra make sense, and they're going to solve real intuition problems a lot better than the GP is. Like, I don't think the GP's version is working any _better_ than this. Really it just further obscures the problem by glossing over the difference between multivectors and rotation operators.

----------

## Vector Division

One other thing that GA emphasizes from early on is the fact that most of the time you can divide vectors and multivectors:

$$\b{v}^{-1} = \frac{\b{v}}{\|\b{v} \|^2}$$

This is another one of the properties of complex numbers and quaternions that it attempts to extend to all vectorial objects. It almost makes sense: _if_ you are treating all multivectors as operators on other multivectors under multiplication, then naturally they have an inverse (if they are not an implementation of a projection) which is given by something that looks like division. I'm fine with that part.

My objection, as I have mentioned already, is that treating all the multivectors as operators in the first place is _weird_, so inverting them is weird also. Despite that I actually think vector division is a very real operation that shows up all over math but which people have been reluctant to call by that name. It is basically part of the operation of "projection":

$$(\b{v} \cdot \b{a}^{-1}) \b{a} = (\frac{\b{v} \cdot \b{a}}{\| \b{a} \|^2}) \b{a} = \text{proj}_{\b{a}}(\b{v})$$

Admittedly, this operation is not the inverse of a particular multiplication operation, so it might seem weird to call it division. But I think it is a good _generalization_ of division. In particular it has the correct behavior if the vectors are parallel ($$(a \b{x}) \cdot (b \b{x})^{-1} = a/b$$), and in other cases its behavior is fairly easy to interpret: basically it divides the parallel parts and drops the non-parallel parts. (In other metrics there are also some concerns about zero-divisors, but whatever, just don't try to invert those.)

Of course anything you might do with the $$\b{a}^{-1}$$ notation you can also do without it,, but I think it's rather elegant how it takes care of handling the factors of $$\| \b{a} \|$$ for you. For instance it gives a neat way to factor a vector $$\b{v}$$ into components along an orthogonal set of vectors $$\{\b{a}, \b{b}, \b{c}\}$$ even if they are not unit vectors:

$$\b{v} = (\b{v} \cdot \b{a}^{-1}) \b{a} + (\b{v} \cdot \b{b}^{-1}) \b{b} + (\b{v} \cdot \b{c}^{-1}) \b{c}$$

Which may as well be written as

$$\b{v} = v_a \b{a} + v_b \b{b} + v_c \b{c}$$

By using this "vector division" instead of just a regular dot product, we cancel out the magnitude of the $$\{ \b{a}, \b{b}, \b{c} \}$$ elegantly. In a way this is treating $$\{ \b{a}, \b{b}, \b{c} \}$$ as a matrix $$\text{diag}(a,b,c)$$ in a certain basis, then inverting it to get $$\text{diag}(a^-1, b^-1, c^-1)$$ in the same basis. Of course, this only works due to the fact that the three vectors are orthogonal; otherwise you would get cross terms.

Anyway, I am just trying to make the case that GA's notion of vector division is not on its own necessarily a bad idea. Personally I suspect that there's a beautiful theory of this stuff, which I have written a bit hesitantly about [here]({% post_url 2023-09-25-inverses %}); I have a lot more thoughts on it but they're hard to write out without sounding... kooky... so I've been stewing on them for a few months instead.[^division] 

(Actually, I suspect that the reason some of the GA formulas work is that they are "secretly" doing vector division in the middle and then undoing it. For instance the reflection formula $$-\b{n} \b{v} \b{n}$$ might be viewed as more like $$\b{n} (\b{v} / \b{n})$$, and then there might be an interpretation of _that_ that actually makes sense. But that's a long conversation with a lot of hand-waving in it.)

[^division]: For instance there are a lot of places where it seems like it would be helpful to regard "covectors" (that is, dual vectors) as being the same thing as multiplicative inverses of regular vectors, and many equations are very well-behaved if you additionally regard them as having negative grades, so a $$(-1)$$-vector is a covector. But this is more of a perspective than an actual definition, and it's hard to be sure it's actually a good idea without a really compelling example.

Keeping with my operator-first stance, I would generally prefer for the things that have inverses to be _particular operators_ that you implement with multivectors, rather than the multivectors itself. For instance a rotation operator $$R_{xy}: \b{v} \mapsto \b{v} \cdot (\b{x} \^ \b{y})$$ has inverse $$R^{-1}_{xy}$$, which it turns out is the same as a rotation in the same plane with the opposite orientation, hence is implemented as $$R^{-1}_{xy} = R_{yx} = R_{-xy}$$. Meanwhile the inverse of $$\b{x} \^ \b{y}$$ under the dot product is the object $$(\b{x} \^ \b{y})/\|\b{x} \^ \b{y}\|^2$$. Etc. This perspective seems a lot more orderly and sensible to me, and it makes it completely clear how each inverse object should work with no magic. But I don't feel ready to strongly endorse this idea yet; it's just a hunch.

-----------

# 3. In Summary

I have given a lot of reasons why I think the Geometric Product is a bad operation. Yes, there are clearly a couple of places where it might live on, for instance in quantum mechanics, but in general there's no reason we should be teaching it to random people who want to learn how to do computer graphics or vector calculus. It's the _wedge_ product that is doing all of the valuable work in the theory, and carrying all the weight. Nor should we be trying to make everything look more like complex numbers and quaternions. Those are already weird and confusing; we should be moving away from them!

Yet Geometric Algebra has really coupled itself to the Geometric Product: every exposition is starting from this unintuitive and mostly meaningless operation and expecting new learners to wade through those problems and ignore them. Just teach the wedge product! Stick to the good parts!

And along with the geometric product have come a number of other compromises of intuition that we have to also undo. Stop trying to treat every multivector as though it's an operator and a vector at the same time; instead just separate the operations and the vectors out into their own objects and show the isomorphisms between them as they come up. Stop pretending like formulas are simple and intuitive when they're clearly not. And instead of producing a bewildering array of formulas and operations and new types of objects (especially in the really esoteric offshoots like Conformal Projective GA...), figure out some sort of general calculus that makes this stuff obvious and systematic, and present it as such.

So for the time being I have to reject GA as a thing, and that's why when I write blog posts about the same basic ideas, and which align with the same basic philosophy of recasting mathematics in a more geometric and multivectorial form, I use the phrase "Exterior Algebra" instead.

But as I have mentioned in a bunch of places in this long-winded article, I _do think_ that there's more to discover here. I'm convinced that there's some unifying theory of vector algebra that will tie this all together with a bow, and I'm hoping someone finds it, preferably soon. Among other things it will explain exactly why the geometric product _does_ work, when it does, and also why so many other formulas end up looking suggestive and interesting and imply that for instance we can sometimes divide and multiply vectors like they're numbers in a bunch of cases.

When it does come along maybe we can call it "Geometric Algebra" again. It's a good name. Or maybe "Geometric Algebra 2.0", or "New Geometric Algebra", or "Geometrical Algebra". Whatever you want. But in the meantime, I'm not calling what I'm doing GA, because I want us to stop talking about the geometric product and sounding like fools. Stick with the wedge product and tensor product and dot product; that's the good stuff. The geometric product and all the weird other stuff that was invented to work around its shortcomings are just in there mucking everything up. Thanks.