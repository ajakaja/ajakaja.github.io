---
layout: article
title: "Ontological Programming"
math: true
aside: true
footnotes: true
---

I want to write an RPG that feels more like a living world than what I've experienced, and -- and this is perhaps more important -- is built on an *authoring tool* that lets the creator create 'living worlds'. This article is about how that might work.

For inspiration, check out the demo game [Insignificant Little Vermin](https://egamebook.com/vermin/v/latest/). Play it. It takes an hour.

Also read [this blog post](https://medium.com/@filiph/skyrim-rendered-in-text-1899548ab2c4) about it. It's really good.

Insignificant Little Vermin is cool because it does something like Skyrim-style [Radiant AI](https://en.wikipedia.org/wiki/Radiant_AI), except that it kinda... works? (For what it's worth, I thought Skyrim failed pretty badly at this. But I should probably play Fallout 4 to see if it does better, since it's more modern.)

Or at least, it distills Radiant AI to its essence: rather than simulating the physics of a 3D world and then, in the background, running scripts for characters that say things like "go pick up that sword and fight", ILV just does it all in text -- there's a sword on the ground and a character will simply, in text, "go pick up that sword and fight".

That is: ILV attempts to disentangle the _physical simulation_ aspect of the game from the _conceptual story_ aspect. (And then it removes the physical simulation entirely and just does it in text).

I want to do exactly this, except also, maybe, put the physical aspect back in. Yes, this is a lot of work. It's more of a research project than a game.

## 1. Conceptual Programming vs Simulation

I want to be able to write the story of a game entirely in the 'conceptual story' layer, and, perhaps, if it suits me, 'implement' it on the physical simulation layer -- rather than having to do both at once.

I'm using the word [ontology](https://en.wikipedia.org/wiki/Ontology_(information_science)) to describe "a language system that attempts to model knowledge". Therefore, the goal is to make a game that can be authored at the concept-knowledge level _separately_ from its implementation on a physics engine.

(Really, any language system does this, but the higher our level of abstraction the more it becomes similar to the philosophical notion of Ontology). In order to do this idealized conceptual programming, we need a type system that can expression _conceptual relationships_ accurately.

Particularly, I want to be able to write the game in a 'top-down' conceptual style. That means, say, being able to **write some code that is equivalent to this 'dialogue' with the engine**:

```
> Add Goldshire at X,Y
What is Goldshire?
> Town
What is a town?
> I'll tell you later
How big is a town?
> Depends on the town
Well, how big is Goldshire?
> Radius = ~1km
```

...Resulting in the knowledge "there's a town called Goldshire at (X, Y) and its footprint is a circle with radius `1km`".

This causes the engine to:

* add a placeholder for Goldshire at the correct location, such that, if I go there, I just see the placeholder (until I tell the physical simulation how to make a town, or elaborate on the conceptual description)
* perhaps add the town to the world map, which knows to draw all the towns in their correction locations and sizes
* perhaps, if I try to 'publish' my game, remind me that there is an unrealized physical object called `Goldshire`, because I haven't told it what a `Town` is yet, or how to make one.

I imagine, ideally, **being able to do this in a console while I am in the game world and watching the results in real time**, instead of in a text file that I then have to compile and run to see the results of.

Then, at a later time in development, I would:

1. write additional models that explain "what a `Town` is"
2. write an algorithm that randomly generates towns given a footprint...
3. ...and save the outputs as a physical model so this work doesn't have to be redone (ie: random generation as a compile step, not a runtime step)...
4. ...and let me press "try again", while looking at the outputs of the algorithm _in the physical simulation_, which causes it to try again with a different random seed, until I get a result I'm happy with

This seems like the most efficient possible way to author a dynamic game world: top-down drawing while looking at the game world as a player would, which gets saved into assets to cache work -- but could, in principle, be done live.

Why do things this way? For one thing, it just sounds like the most comfortable and enjoyable ecosystem to "draw" in: an editing environment that lets you riff and doodle an experiment, instead of writing code and opening tools to make 3d models and jumping between different tools and having a slow edit-result feedgback loop.

But, also, there are other benefits:

1. Once you've made all the ontological definitions ("what's a town" "what's a building" "what's a tree"), and written the algorithms for generating these things once, you can rapidly expand on world by reusing old definitions, or just **go write a new game world from scratch**.
2. This is the only way I could ever imagine **making a game whose world feels as expansive as reality**. I mean, Skyrim was considered a 'massive open world' and it's about 14 square miles in real space. No one's going to make a world that feels like an _actual world_ at that rate.
3. This is the only way I could ever imagine **using a physical simulation as a platform for a tabletop game**: the DM would be, basically, 'live-authoring' the world in a simple language, to give instructions to NPCs, in an expressive high-level language they're already comfortable in.
4. This is the only way I could ever imagine **procedurally generating** a world without it being a nightmarish amount of work. Because PCG in this paradigm consists of just running the generation code during gameplay instead of beforehand!

## 2. Ontological Authoring

This model of first writing the world _conceptually_, and then fleshing it out physically, can apply to behaviors as well. That is: we can try to model verbs and time too.

Consider telling the game the statement `John walks to Goldshire`. The game engine is told, then, how to update John's position accordingly, in an implementation.

Additionally, the game engine is written to parse the player's *physical* actions back to *ontological* actions: if John physically walk to Goldshire, the ontology updates with `John walked to Goldshire`.

More examples:
* If you walk to the town of Goldshire, the ontology updates with "Player walks to about Goldshire".
* If you successfully pull off a combo in combat repeatedly, the game can learn that `the player knosw how to do that Combo`, and then have your character start doing it automatically.
* If you kill an NPC, the game world (and people in it) may learn that you murdered them. But if you cast an illusion of an animal killing them, they may think it was a freak accident. Compare this to, like, existing RPGs, which test "if X is dead, do Y" in the scripts.
* If we have a language for ontologically modeling knowledge about the world, we can express NPCs' knowledge in this language as well: `X knows where Goldshire is`, `Y knows that you killed Z`, `Q knows how to smith an iron dagger`. Ideally we could model NPC's behavior as having _desires_ and _goals_ in this language, rather than just scripting what they're supposed to do manually.

A litmus test for success at this: can my RPG generate a 'story version' of your character's history, that includes macroscopic events like "goes to X town" and "finds Y treasure" and "barely defeats Z monster", from your gameplay?

All of this should be viewed as writing code in extremely high-level scripting language. In fact, it's the highest level _possible_: you say exactly your conceptual goals with 0 syntax for how to realize them. Then an implementation in a lower-level language covers the rest.

I imagine the following architecture:

```
<highest-level conceptual language A>
* used to author the world and character behaviors
* stored as data to express character's knowledge
* mapped to physical actions
* probably a custom-made DSL

<middle layer language for implementation B>
* likely an existing scripting language (ie C# in Unity)
* use to implement the concepts and relationships from A

<low level language for graphics implementation C>
* it's probably C++.
* Or, leave the game loop / physics simulation to an engine like Unity
```

And consider the following 'commutative diagram':

```
<Current knowledge Q> <-----f-----> <Physical world P>
           |                                   |
           |                                   |
           dQ         <-----g----->            dP
           |                                   |
           |                                   |
           V                                   V
<Updated knowledge Q'> <----f-----> <Updated world P'>          
```

Physical changes in the world -- like, say `the player literally physically walks to Goldshire` -- correspond to ontological changes `<The player walks to Goldshire>`.

That is, our job is implement `f`, which maps physical states to knowledge states and back, AND `g`, which maps physical _changes_ to _knowledge changes_, and back.

* if you walk to Goldshire, `g` updates `Q -> Q'` to say where the game knows you are.
* but also, you could 'instruct your character to `walk to Goldshire`'. Perhaps you want to walk there while you watch. Or the game supports fast travel and you teleport there. Or slow travel: the AI walks you there while you're offline. Or the game author writes a script which tells an NPC to walk to Goldshire. All of these are the same concept and need _both_ a physical and ontological expression, and a mapping between the two.

------

Now, for something more abstract.

## 3. Type-Language correspondence and "why this requires a programming language"

There's a well known [symmetry](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence) between Types and Proofs. I think this symmetry can be extended to Languages -- in that Types and Languages are the same thing, abstractly. Roughly speaking, a type is a (formal) language for producing elements of that type.

This is relevant because, in order to produce a high-level language for describing conceptual interactions, we need to _be able to express complex relationships_ in a programming language, meaning that it has to have types that can say what needs to be said.

I have a somewhat more formal approach to this idea that I'll write about another time. For now, I just want to say that: I believe the right way to implement this 'conceptual language' is in a DSL or in a Lisp-like language that is conducive to ad-hoc DSLs. If you represent it directly in the language in which game interactions are authored, you're going to have to write the relationships out as _data_ instead of _code_.

(Actually, I imagine the language being more like Prolog than Lisp, since Prolog also does the thing where you write out relationships and then it figures out how to satisfy them!)

We do not want:

```
NPC.knowledge.add(new WantsTo(NPC, new TravelTo(GoldShire))
```

We want, at minimum, a language that can write:

```
NPC thinks "I Want-To Travel-To Goldshire"
```

...Even if that just compiles to the former. (The hyphens are to avoid having to actually parse English: if concepts are compound words we may as well just pre-join them to eliminate any potential ambiguity!)

More importantly, we want to be able to _typecheck_ and _debug_ such an expression. If "Goldshire" is not a 'place', 'Travel-To' should fail. But we don't want to _mix this_ with the base language's type system. We need a separate type-checker that checks the validity of expressions in the Modeling Language, and a separate debugger that lets us run them stepwise _while running the game_ (say, so we can see how each line of a longer script modifies the world).

Reiterating, **the reasons for using a DSL inside a game engine**:

1. High-level scripting is easier to write/fix/understand when not conflating with lower-level implementation.
2. Ontological Modeling needs a _separate debugger and typechecker_, unrelated to the debugger/typechecker for either (a) the physical simulation or (b) the code which implement the model's concepts.

In fact, it's a reasonable heuristic that you want to use one programming language per "thing you want to be able to simultaneously"

Finally, **the reason for using a custom language instead of an existing one**:

* For fun and profit
* I don't know of any existing language that can do what I want. Namely:
	1. custom syntax, on the fly, for writing new knowledge structures (requires, basically, something Lisp-y)
	2. embeddable, with an embeddable debugger, in a game environment (no idea what's good for this)
	3. strongly-typed (... Typed Lisp is not popular)

And, basically, I don't know of any modern typed Lisp variants that I would want to use. And I'd rather write console commands in a C-style anyway. And, to be honest, a simple Lisp dialect is considered _not hard to implement_, and I think a C-syntax-style version that provides a little more flexibility should not be _much_ more difficult.

(nb: either way, embedding a language + debugger is going to end up being a massive undertaking in practice. But I don't think C-style is going to be much harder than Lisp style.)

A reasonable first pass, though, would be importing some sort of typed Lisp dialect into a game engine and running it from the console. Maybe that'll turn out to be fine.
	
## 4. The larger goal: AI research

There's a bigger reason to want to do all this besides "dropping a mind-blowing game that does things no one has seen before": Because I think it's a useful microcosm in which to tackle a larger problem in AI.

I strongly believe this:

> The next major advance in AI -- both in games and, like, machine learning -- requires better Ontological Modeling of the world.

Justification: it seems necessarily true that a neural network can be said to have a type of "expressions it is capable of expressions" -- the type that its "space of possible configurations" _enumerates_ -- and the reason that NNs get [strange](https://distill.pub/2017/feature-visualization/) results is that the types they can recognize/classify don't come anywhere close to matching the "human types" that they are trying to approximate.

By way of example: a normal human brain would never mistake, say, an image that's a mesh of fur and eyes as a dog. But a NN happily will.

That's because the human model of dogs is very similar to _actual dogs_: it requires the parts of a dog, or an understanding of why some of the parts aren't visible, plus recognizing something like the right relative dimensions between dog parts. Our model of 'dog-ness' is _a lot like actual dogs_, while a NN for processing images and identifying dogs has _nothing like an actual concept of a dog_. Instead it has a weird medley type of "patterns that were common among its training images of dogs".

(I suspect that NN's capabilities today are most similar to those of "humans, but only getting to look at the picture for a quarter of a second, and only with our peripheral vision", such that _only_ rapid-fire image processing gets to work, instead of conceptual mapping.)

But I don't think this it's _impossible_ for NN's to have concepts of dogs! It's just that their ontological primatives -- arctan activation functions and float-valued correlations between layers and whatnot -- suck at expressing real-life concepts. Especially binary concepts and 'partial matches' and being able to say "I'm not sure".

Emphasizing this:

**For Neural Networks to not be wildly wrong, they need to be able to express types that better reflect reality**

In principle, if a NN _can_ express realistic (ontological) types, then, with enough training data, it will be _truly_ as good as a human.

And in fact, we would guess that a perfect neural network for recognizing dogs would, when inverted to find inputs that maximally activate it, generate _pictures of dogs_. Basically: **drawings**!

To get closer to such an idealized network, we have some basic requirements:
* the NN should be able to express "components" of ideas and then build high-level concepts out of lower-level ones. For example, an `8`s should have two things that almost are shaped like loops.
	* NB: my mental algorithm for identifying `8`s does not look for two loops. In handwriting, instead, I try to imagine the muscle movements to draw the shape I see, and I _pattern-match those muscle movements_ against my own ways of drawing an 8. That's why I can recognize a 'collapsed loop' as part of an 8.
* the NN should be able to express "closeness" to a match?
	* Like, it needs to be able to say "it's doglike, but not a dog", and this should, for instance, pass on partial images of dogs, or images of dogs but in the wrong configuration (such as chopped into quarters and shifted around).

Existing NNs don't tend to be able to say things like "this is almost a dog, but it's definitely not one because it's missing components", or to understand, say "this is a dog with its head concealed". They use unsuited languages for 'true' descriptions of dogs, but (surprisingly) can 'mostly succeed'. But if you want true success, you need a language that can say what you want it to be able to say. (Our brains do this for free.)

It seems _obvious_ that this is both why NNs work: even a bad language can do a pretty good job, especially if inputs are constrainted to be 'realistic', ie, not pathologically bad, and why they're also so bad sometimes: because they encode a space of language that _can't even write_ concepts in a way that would be good.

In summary, I want to make this game partly as an excuse to develop a language that _can_ express these concepts, with the later goal of trying to make NNs that pattern match against programs in this language.