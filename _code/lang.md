---
layout: article
title: "Lang"
math: true
aside: true
footnotes: true
---

collection of ideas, loosely connected. Not written in a particular order.

<!--more-->


# 1. Context/Language Oriented Programming

The basic object is not "functions" but "languages". The default operation is not calling a function `f(x)`,  but rather running code in the context of a function: `f( x() )`. a variable `x` in a function means "fetch the value of `x`", and then this operation may be inlined to produce the function evoked with a particular value--but it could also come from a context, class body, environment, etc. Most functions are going to just be regular functions, of course, but you have the option of doing whatever you want here. For example you may run function with various substitutions made:

```
foo(
 arg1=x,
 arg2=y
 network=(stub)
)
```

All of the function's dependencies are either resolved by you or by the context you're running in. Often it will be desirable for functions to _not_ resolve dependencies from your context automatically: for example, to run a function in a "sandbox", disable its access to anything except its explicit imports, and require any external functionality be provided by the caller. It should be easy to do this. Also gives an easy way to create unit tests.

The concept of running a function is therefore a special case of running a subprogram. In many cases you really do want "call a function", so there should be a simple syntax for that... but you always have the option of running it as a subprogram instead. (e.g. you can run it async, run it in a time-sliced way, run it one step at a time, run it in a debugger, run it in a time-traveling way, etc).

This provides an interpretation of e.g. command line tools with their flags: `foo --bar` means "run `foo` but with the value of `bar` specified. it doesn't have to be an _argument_ to `foo`, instead it is a value used in the language `foo` that takes a default "unset" value but is therefore exported by the interface. naturally in many cases the options you pass in may be functions instead of flags.

The core idea: most of the time you should be inventing syntax that directly and elegantly captures the intension of your code. I call this "language-oriented programming" or LOP.

Related: it needs to be very easy to write new syntax and new languages embedded in the one you're already using.

Most of the time you should not be writing _runtime code_ for anything other than the core runtime logic of your program. Instead, your program should do exactly what it wants to do, and delegate to other "syntax" for anything that it needs to do that. Then _those_ get implemented in such a way that they could run at runtime or compile time or whatever you want.

"Comingling" levels is not okay because it breaks this abstraction. For example, a function should never refer to an environment variable in the course of doing something. Instead, it should refer to an _ambient_ variable, and then someone else explains that that ambient variable comes from the environment. A general principle:

* no procedure should both use a value and explain where it comes from

(not all of the ideas here are part of LOP or coupled to it. "Context-oriented" programming might be the better word, since it captures the whole list more effectively.)

In the extreme case, the language for a function may be unrelated to the language that the parent is in. For example, RegEx are a separate language that is often embedded in other programs. It should be possible to write your _own_ syntax for regex (which parses to the same internal structure) and then use that instead.

Examples of DSLs that are often embedded in larger programs:

* regex
* grammars
* markup formats (like markdown)
* file formats
* config file layouts
* format strings
* SQL and other query languages
* subcommands, such as invoking Awk or Curl or etc from a script
* producing one language in another, e.g. emitting HTML from Python
* passing configurations to another program. For instance if `foo()` calls `bar()`, then it might take `foo(bar_options={})`---these

The commonality across all languages is: some other piece of code (or equipment) is going to process this and produce a series of instructions that _it_ understands. Well: it should not matter how you _format_ that series of instructions; what's important is what it translates into. So the right export in a DSL is

1. the commands it actually runs
2. a convenient syntax for specifying those commands

And these should be factored apart: the function only cares about the commands; the syntax is there to make it easier to use.

I like to use the word "Slang" for a "function-specific programming language". If you write a function so that it accepts a DSL, and then write a syntax for that DSL, then call it using that DSL... that's a Slang. 

------

# 2. Coordinates

Programming languages are to programs as coordinates are to functions. The program, after all, is a function from inputs to outputs. The fully _covariant_ specification of it only knows about its effects and not how it is run, but also it doesn't know about how it is _called_ or _implemented_ or _who runs it_. 

This means that conceptually we can call a function with another function `foo(bar)` and one function could be in principle written in a different language. Runtimes and compilers function as transformations from one coordinate system to another: "given this code, run it in this setting". they are generally very restricted at this, but they don't have to be.

in particular it should be possible to update the syntax of a language and rewrite all the old code in the new syntax. As long as the underlying functionality is the same, it's the same _program_. This should be generally automatic.

To get to that we need for:

* syntax to be extremely 1:1 with its behavior
* the right way to do anything complicated is to invent syntax that makes it simple --- long complicated expressions are hard to transpile but also conceptually bad; they show that the syntax is not well-suited to the task. it should, in general, be possible to express _only the idea_ of a computation, and not its individual steps. (with in principle runtime cost---the idea is expressed, then it's translated to the implementation in a compilation step, and then you get the same result as if you had implemented it in the complicated way)

In LOP you expect to write new syntax down all the time. But you will need, eventually, to update that syntax: maybe somebody else implemented the same idea and you want for there to be only one version of it. To do this you want to be able to automatically transform your syntax into theirs (assuming it obeys all the same types). 

A simple example of this: if you copy-paste a data structure from one programming language to another, it should be possible to automatically reformat it as you go. I just had an example of this: I copy-pasted a JSON representation of a CSS style into a CSS document. Although the CSS doc is key-value just like Json, the format is different, I had to remove quotes, replace commas with semicolons, etc. This is fundamentally wrong, though. It should be possible to get it go like this:

1. The JS representation of the style is 1:1 with the style (of course)
2. When copied, instead of the JS _text_, the thing that is copied is "the style itself"
3. when pasted into CSS, the style gets rendered into the format the CSS file happens to use for that object (which happens to be CSS itself)
4. had we pasted it somewhere else --- Python, say -- it would get rendered into Python instead.

That is: in each case, the textual representation is "coordinates" for the actual object, and the thing that is modeled is the object itself.

-------

# 3. Universal Programming

Obviously the above "copy-pasting" process requires a lot of pieces to work together in a clockwork fashion: all the grammars and text-transformers for each language have to be able to talk to each other. Probably that's an intractable engineering problem. But I can't help but imagine that in a greenfield ecosystem it should be possible to solve it up front: 

1. the equivalent of the CSS language was defined by its grammar in the first place
2. the scripting language that represents it _uses CSS directly_ instead of a data-structure representation _of_ CSS
3. all of the syntactic sugars are defined as two-way correspondences instead of one, e.g. not only does JSON (text) parse into a JS object (data), but the data renders back as the exact same text.

Actually that's an interesting example. Keeping with the theme of thinking of "code" as "coordinates"---given a block of code like a JSON object

```javascript
{
  'x': 1,
  'y': "two",
  'z': [3,4]
}
```

There's an good way to think of this in terms of lienar algebra. You can think of this as a mathematical object in a space $$j \in J$$, which factors into two "orthogonal" pieces, the "Lang" piece plus the "Free" piece.

$$J = L \oplus F$$

Meaning that the code $$j$$ can be written as $$j = (j_L, j_F)$$.

$$j_L$$ represents the part of the code that specifies a concept in the language's internal model. In this case, upon parsing, the program constructs a projection $$j \ra j_l$$ of the _relevant_ pieces of information in $$j$$: the names of the keys and the values on each key. _Maybe_, depending on the implementation, it could also keep track of the order of the keys, if it wants to enforce a contract of adding the elements in exactly the same order (although it should not; JSON is expressly unordered).

Any time a projection occurs there is always a kernel: the $$F$$-component of $$j$$, $$j_F = j - j_L$$, consisting of "all the information in $$j$$ that was not in $$j_L$$". In this case: the order of the keys, whether single or double quotes were used, whether the concluding comma occurred, etc.

The idea then is:

1. is that when we copy $$j \in J$$, what we actually want to paste is the data in $$j_L$$
2. there is a parser that functions as map $$F: J \ra L$$.
3. the parser should be _pseudoinvertible_: $$L^{-1}L = I_{J_L}$$, so $$L^{-1}$$ produces _one_ piece of code that has $$F \circ L^{-1} = I_L$$
4. $$L^{-1} \circ L$$ can then be used "code formatter" (like `gofmt`) for the language: by parsing and unparsing the same code, you produce an invariant form.
5. All of the other variation in $$J$$ therefore lives in $$F = L_{\perp}$$

Something to note is that the actual "data" of $$j_L$$ and $$j_F$$ does not have to come in a form you recognize. You can use any "coordinate system" for them you want---what's important about them is their definition:

1. $$j_L$$ labels the image of $$L(j)$$. All vectors $$j_i$$ which have $$L(j_i) = L(j)$$ have the same $$j_L$$ component. 

  The value of the coordinate _is_ $$L(j)$$, is my point: it's not like a vector $$\b{a} = 3 \x + 5 \y$$ which has an $$\x$$ coordinate. Instead it's a vector $$\b{a}$$ which has $$L(\b{a}) = 3 \x$$, therefore you _say_ it has the $$\x$$ coorddinate of $$a_x = 3$$, and if $$L(\b{b}) = 3 \x$$ also then you say $$b_x = a_x$$. But it could just as easily be $$L(\b{a}) = $$\< some impenetrable binary representation of $$\b{a}$$\>; it is the same concept of a "coordinate". And it's completely possible that somebody else with a slightly different implementation of $$L$$, call it $$L'$$< will find out that $$L'(\b{b}) \neq L'(\b{a})$$, even though they are the same for you.
2. $$j_F = j_{\perp L}$$ labels "everything else in $$j$$". The only fully general way to represent this is as $$j - j_L$$, which is to say: store the value of $$j$$ (as text) plus the value of $$j_L$$, treat the result as coordinates on $$j_F$$. Obviously this overspecifies things a bit, but that's what compression is for. 
  For example, suppose the only "degrees of freedom" in the value of $$j$$ are the things mentioned before:
  * the order of the keys
  * single vs double quotes on each key and value
  * whether there's a trailing comma
  Then you could use just this data as coordinates on $$F$$ and therefore store the result in a reduced form. But if someone comes along and adds another degree of freedom (e.g. how many trailing zeroes in each number `3.14000...`) then that piece of information becomes a coordinate as well. No matter how the information is _represented_, the full data of $$L \oplus F$$ is exactly $$J$$.

You might have to decide, for each language, which degrees of freedom you _care_ about. For example, in JSON, order of keys might be useful for readability, while the trailing comma, or indent levels, or tabs vs spaces, is something you decide you don't care about. You can "factor" $$F$$ apart like this:

$$F(j) = [f_1, f_2, f_3, \ldots](j)$$

Once you've done this, you can additionally decide that you want some of the information on $$F$$ to be included in $$L$$ instead. For example, maybe you decide that the order of keys is useful, and should be preserved by the formatter. Suppose $$f_1(j)$$ refers to the order of the keys in $$j$$. Then you can think about "preserving" the order as updating your language $$L$$ to a new language $$L'$$. Originally

$$(L, F)(j) = [L \oplus (f_1, f_2, \ldots)](j)$$

After the update:

$$(L', F')(j) = [(L, f_1) \oplus (f_2, \ldots)](j) = [L \oplus f_1, F \ominus f_1](j)$$

Now $$L$$ is parsing your code but making note of the order of the keys in each object in order to be able to reproduce them. Now, if you copy-paste this object into another _language_, you can paste a version that has the keys in the same order, even though that is not part of the original invariant representation $$L(j)$$.

In a full general programming setting, there is not going to be a single $$L$$ or $$F$$. Instead there's a whole pipeline of translations, each of which has its own instance of the same linear algebra. In a simple model suppose you are thinking of a block of code $$j$$ as being run by a single language $$L$$, so the resulting space is $$L(j)$$. Well, it may turn out that $$L = A \circ B \circ C$$. Each individual step will have its own projection operation, inverse, and kernel. Our job is to model each stage correctly. It should be possible, upon each step of transformation $$j_i \ra j_{i+1} = L_i (j_i)$$, to use a **common format** for understanding the "gestalt" of the value of $$j_{i+1}$$---that is, to agree on a coordinate system. Every language has most of the same data structures, after all. A list is a list.

And even in cases where the structures aren't the same, they usually should be. Suppose there are three different languages that each represent, say, a block of CSS. In CSS itself some value might be in CSS-specific units like `10px`, which show up in the grammar of CSS itself---the string `10xp` might literally not parse at all in this language. In Json, the units are stored as a string, and `10p` and `10px` are equally allowed. Maybe there is a third representation in a parser: maybe you have a parser which reads the Json and transforms `10px` into (a data structure represented by) `Unit(10, PIXEL)` but turns `10p` into `Error('<some string', line 10, pos 5)`. 

The point is: now there are three _inequivalent_ representations of the same language. In fact there should only _ever_ have been one. Every time somebody has a representation of CSS, it should be using _the actual type of CSS_ as early as possible in the process. Your IDE should be debugging your CSS code with the CSS debugger, _even if it is embedded as text in another program_.

Of course we cannot say that there is "only one" CSS grammar. Specs change, implementations vary, and any mainstream language is inevitably going to be extended in special usecases (for example, augmenting CSS with syntax specific to some project; abstracting over CSS like SCSS or css-modules does, or pre-processing CSS with textual or programmatic substitutions). The key is that **all of these should be implemented the same way**: adding a processing language over another language should be represented as a "transformation of parsers" in a consistent way that can also model

* updating the version of a parser
* changing the type of an object
* changing a piece of code
* representing a data structure in another language
* translating the textual representation of a data structure to its internal AST inside a parser
* translating an internal AST to a binary representation
* translating the binary representation into actual bits in memory
* serializing those bits for transmission over a wire

In full generality, we might say that "it's parsers all the way down". All code functions as coordinates, all transformations from one representation to another function as parsers, and it _should_ be possible to leverage this universality to get rid of a lot of the muck out there. "Universal programming" is my word for this idea: that there is an incredible amount of redundancy in the way programming works, and by stepping out and mathematically modeling what's going on, we might be able to eliminate 99% of the complexity.

After all I just wanted to copy a list of keys and values from one file to another. There is no reason why that should be hard!



------

# 4. Types

Kinds of types:

1. Structural: types that assert the memory layout of objects, e.g. "`foo` is actually a `struct { x: int, y: int }`, which allows `foo.x` to be meaningful and to be typed.
  * Duck typing: no type declarations at all, only use-types.
  * Runtime duck typing: you just use it and hopefully it works
2. Assertion/Refinement: types that assert some property holds for an object, e.g. `x: prime` means `x: int` and `prime(x) == true`. usable in inferences, but it's uncomputably hard.
3. Algebraic: types which assert the, well, type of an object: `foo : X | Y` or `f: X & Y`. This may be seen as an extension of (2) to logic relationships. `foo: X | Y` means
  a. one of `X(foo)` or `Y(foo)` is true and can be used in conditionals
  b. `foo` definitely has the intersection of the properties of `X` and `Y`.
4. Contextual: types that assert the relationship of an object to the enviroment. `foo: userId` can mean "`foo` is a valid `userId`, and `getUser(foo)` will work" also, sort of, an assertion about the object, especially if `getUser` is treated as an opaque function, no different from `isPrime.
5. Nominal types: `foo: userId` and `userId < String` can just label `foo` as an "opaque" `string`: it has "unknowable" qualities that make it into a userId, so act like it is a subtype of string, and not all strings can be made userIDs.
6. Contractual: `foo: { x }` means that `foo.x` is defined.
7. Template: instead of `new foo(x,y)` creating a foo object with a certain layout, it gets textual processed into another block of code.

Many of these are functionally the same. Really there are only three things going on here.

1. Assertions, which say that some properties hold for the object. Note that nominal types are just this where the function is never allowed to be called.
2. Name-binding: defining the meaning of `foo.x` to mean "access the first memory slot of `foo`".
3. When typechecking happens. Options are
  * "compile time": valid programs are ones that typecheck.
  * "runtime ahead-of-time": programs don't check all types; to call a function its properties are checked at runtime
  * "runtime just-in-time": its properties are used and may fail mid-function. This is the least sound because you end up with invalid states.
  * manual: you write code that checks the properties yourself before using them.
  Code tends to be a mix of all of these.


Another type of type that might be considered is a "guardrail": a type that is not actually checked by the program itself, but which the caller is welcome to check. For instance we might say "this value is supposed to be small" but not actually assert that--the Context is welcome to watch it and see (or error, or record, or whatever) if the guardrail is violated.

(It will also be useful in some cases for the Context to impose its own guardrails without the Program knowing about them.)

One usecase for this is to make sure something isn't eating up all your CPU or spending all your money. A program that automatically calls the network / a service / an AI / etc might have a guardrail of staying under a certain number of calls or a certain price. The Context is then allowed to set up alerts and concerns on that.

Sometimes guardrails will be networked: "this function should only be called X much across the whole fleet" or "per user" or "per day" or something. the context will have to have a way to do something with that.

Similarly monitoring and alerting consists of setting up wires between the Context and whatever data repository you want. You generally want the guardrails in the code if they're conceptually part of the code, and outside it if they're not. For instance if a function should not be lasting longer than one 16ms frame---that's part of the code itself (and may be used to timeslice it?). But calling a function per-user so many times is more part of the caller. (There should be a way to massage this to dynamically set up guardrails based on things going wrong... also, set up guardrails on guardrails: how do you avoid spending too much time on monitoring?)

Unit tests, assertions, and guardrails may be seen as three flavors of the same concept.

Note that "grammars" for DSLs (as in the previous section) may be seen as types as well. We claim that all of the following are conceptually equivalent:

1. types
2. grammars
3. unit tests
4. (blocking) linters
4. assertions

The differences are in implementation: how they work, the sorts of types they can express, and where in the development process they happen.

------

# 5. Security

Trusted code is code that typechecks. Untrusted code is code that doesn't. To cross the untrusted->trusted barrier, say while calling into a server-side routine, all of the relevant assertions need to be made: do all the variables truly have the types they say they have? In the case of something like `userId`, this amounts to looking up either (a) the actual `getUser(userId)` value to see if it exists, or (b) a _proof_ that it was already called, e.g. something stored in a session token. Likewise for looking up authentication or authorization.

This means that the concept of "proof" needs to exist at runtime: a value can exist and be saved which _represents a valid proof of something_. Of course this is only as good as the user. But the general idea is that when you write e.g. a cookie, you're serializing a proof that something was checked, and loading it again amounts to remembering that proof. An access token that lets you access such a proof amounts to a proof.

Example: logging into a system looks like this.

```
login(user, password) {
  proof = validate(user, password)
  proofToken = save(proof)
  return proofToken
}

authenticate(user, token) {
  proof = check(token)
  // continue doing things that 
}
```

note that `proof = check(token)` is only as good as the system's actual security: if that returns the wrong answer, then you end up incorrectly authenticated. If you prove a false thing then you've broken the system, after all.

(can "proof" be called "witness" or "certificate"? Maybe, but I think I prefer "proof". although it doesn't actually act like the proof itself... more like it is a "badge". Hmm)

--------

# 6. Parse chains

Parsing should be seen as similar to styling.

Whether math is written out as \$$equations\$$ or as a parsed block is a choice of _representation_, not a choice of content. the parser should therefore be "included" in the presentation --- it can happen server-side, but is free to happen client-side also, be edited, be viewed, etc.

A "living document" is one whose _parse chain_ is available to the user. (This generalizes e.g. Jupyter, as well as a lot of the concept of devtools, particularly its source mapping, manipulatable diagrams (like pictures you can rotate), etc.)

Changes can be pushed up or down the parse chain, producing diffs at each level. This is what Git implements at one level.

Parser chain stages may commute or not (and their failure to commute can be quantified as a diff as well).

The choice of "textual" representation versus some other format is purely a question of interoperability, choosing the same coordinate system. A parser implements an _abstract_ transformation from A->B, which has to be quantified in some coordinate system.

Bazel and similar are part of the same principle. 

This should also allow a generalized version of including one language inside another: for instance nesting math in markdown should be equivalent to nesting images in markdown, etc. "Living documents" should contain all of their children in whatever language they're in. The two ideas are separate, though. Maybe we give them different names:

1. A living document includes all (or at least a functional amount) of its parser chain. It doesn't have to provide this out of the box: instead, it should be possible to "drill down" into where it came from, produce diffs, at different levels, etc. Also, a website may be interpreted as a living document _of_ that website, so you can e.g. make edits on top of it and then send those to somebody else.
2. A generalized document just includes the static results of the parse chain, which still may be a big mixture of languages.

Obviously this is something of a spectrum. But what we definitely _don't_ want is for the default representation of everything to be a text file, if that is not the _best_ way to represent it. If a markdown file has an image in it, we should (conceptually):

a. include the image in it directly
b. choose to represent it as a link or an image, based on preference

_Rather than_ fixing this in the code itself. This is another instance of "choosing coordinates" on a language.


Another thing you can do: if it's possible to "munge" an input from an invalid format to a valid one, you can do this:

1. call a program with invalid input
2. intermediate step munges to valid input
3. munger additionally sends a diff back to the caller that says how to format their input correctly
4. ignoring this should be not an option. the caller should always have to provide the munger (so it doesn't waste receiver's resources), and they should send messages back to _their_ caller, if there are layers.

(This is similar to the functionality in browsers where very valid HTML is allowed to be processed. Sure, but it should be held accountable!)

This is also a generalization of the usual process of deprecating / migrating features: the pipeline needs to be two-way (not just warning messages) so that updates can propagate backwards.

(Indeed, this is case for any program that dependences on a versioned dependency: the dependency needs an out-of-band ability to communicate back to the caller. Normally it's "print to the console" but we can do a better job by designing for this.)

--------

# 7. Declarative Structure

The natural structure of programs is often not textual. Since parsing text is styling, however, this is fine: we can use whatever the most natural representation is for each component of a system.

Often a system is best represented as a _schematic_ (or "blueprint"): a bunch of components with wires connecting them, plus some external components. Upon running the program the schematic is instantiated, creating the actual program, with whatever components swapped in/out you want. Often _working_ on a program is better thought of as working on the schematic: dropping in new parts, for instance.

As I've said elsewhere: a program ought to be as easy to understand from the top-down as a car engine when you open the hood. Which is to say: not that easy, but you can see how it works and you know what further questions to ask if you want to actually understand it.

Note that this is close to how declarative programming with HTML / React JSX works. but obviously we want to lean into it quite a bit.

----

# 8. Version Control

It should be possible to make all updates to a program as modelable as diffs to the program's logical structure. Instead of "added these lines of code", it's "added this module (which has textual representation = these lines of code"). 

In particularly it should be possible to commute logical changes. $$[B,A] = BA - AB$$ provides the diff required to make the change $$B$$ happen before the change $$A$$.

(aside: we need a better word for "check for commutativity" or "fix commutativity". To commute two things is to swap them: $$BA = AB + [B,A]$$ (nevermind the awkwardness of AB meaning "do B then A"---we are free to interpret it as the opposite). Maybe "decommute" means to factor them apart such that $$[A,B] = 0$$ (something to do with factoring into intersection and union also..). )

Similarly it should be possible to check if two pieces of code commute, e.g. to determine if they can be run in parallel, on different cores, etc.

A program's functionality is partly defined by its types and partly defined by "whatever its types don't specify" (which includes things like runtime length, side effects, the exact properties of the resulting data, the degrees of freedom in the input, etc). It should be possible to detect changes in side effects from a program change:

* you have a program $$P$$, represented by code $$C$$
* a code change $$dC$$ happens, generating a program change $$dP$$
* this change involves changing some of the explicit type $$dT$$ of the program
* it also changes the behavior in ways not captured in the type: $$dP = dT \oplus dT_{\perp}$$
* these changes can be expressed as the type $$dT_{\perp} = dP - dT$$
* some subset of this can be computed or represented: we can sample it
* this can identify bugs and things that should be captured in types

Note that this is conceptually similar to various kinds of testing:

* sanity testing
* acceptance testing
* smoke testing
* "pixel comparison" tests for e.g. generated graphics

------

# 8. BYOC

Bring-your-own-controls

For example: VS code has tabs, Chrome has tabs; both have to implement their own hotkey systems, which can be different, overlap in different ways, differ across devices, clash with plugins, are modal depending on the state of application, etc.

This is wrong. Applications should not be providing hotkeys _at all_. Applications should present their information and then the _user_ provides the hotkeys. The idea of copying a selection, after all, is a universal concept: it makes no sense for it to be handled separately by each application. Likewise for tabbing around.

This doesn't mean applications won't deal with hotkeys at all. But they should factor it apart into two steps:

1. an action (verbs and nouns and adjectives etc)
2. a binding for that action

Such that one can operate on the bindings alone, or the actions alone. 

For instance: do you have to implement selecting many items at once in a list? No: you have a concept of selection, it is not unique to one item at a time, therefore all the items can be selected. The user might click on multiple items with shift, or drag, or use a screen-reader, or use arrow keys, or automate the selection. It doesn't matter how they do it: your job is to select things when they ask you to.

(In the extreme case this would also apply to video games: why does every game manage its own hotkeys? Instead make some suggestions but let people "bring their own configurations" / download them online / etc).

(Note: a hotkey configuration file is another type of Slang)

----

# 9. Recording 

A youtube video of a game records the pixels of the game. However, the pixels of the game are vastly more data than the game actually requires to render the game's UI: there is a smaller stream of data that could be used to reproduce the UI exactly (at any resolution), if the 3d assets / etc were already loaded and available.

Some form of this type of "recording" should be possible: given an program which streams updates to a UI, it should be possible to record only the stream of updates, then replay them to another UI. I don't imagine this to replace video streaming---but it should be possible, and it should exist by default, for any application you make using this architecture.

Similarly it should be possible to use that data to:

* render the same UI in a different resolution / format
* restyle the UI
* record the UI as text and replay it
* also record other data about the game, say internal state
* forward that UI over the network and play in real time (like google stadia etc)
* stream inputs back to the server, allowing playing a game remotely with the game engine on one machine and the UI on another 
* etc

(This is very idealistic ofc: presumably it is not possible to get a realtime streaming game "for free"; netcode will still be a thing. but some form of it should be possible, at least for recording/replaying.)

It should be possible to do similar things for other applications:

* "screenshot" the state of an application and send it to someone in an email etc
* save a _diff_ to the state of an application by diffing two screenshots
* screenshot part of a website, returning the code used to produce it