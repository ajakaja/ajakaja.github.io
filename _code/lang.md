---
layout: article
title: "Lang"
math: true
aside: true
footnotes: true
code: true
---

collection of ideas, loosely connected. Not written in a particular order.

<!--more-->


# 1. Context/Language Oriented Programming

I imagine an alternate programming paradigm in which the basic object is not "functions" but "languages". In places were you would normally call a function `f(x)`, the behavior of `f()` is instead open a context in which you can run code in another language. So if you are writing code in language $$A$$, the arguments to the function is a block of code in $$B$$, which may be related or totally unrelated to $$A$$:


 
```js
// example language A
const x = 2 + 2;
foo(
  // example language B
  // notice this uses the value of x (somehow translated into a format B can use)
  // syntax highlighting and typechecking should work in language B here
  <div>x</div>
  // it may also make sense for A and B to be interleaved
  <div>{x+1}</div>
)
```

This may be seen as a generalization of constructions like JSX, which interops Javascript with something like HTML.

The "function" `foo()` here may be interpreted as a translation from the syntax and internal AST of HTML to the syntax/AST of JS. It doesn't necessarily need to be implemented as such---maybe it is just a placeholder, and the compiler takes care of the translation. But it functions that way.

A regular function call is therefore a trivial language in which the allowed language $$B$$ is "expressions in $$A$$"

```js
const x = foo(2 + 2);
```

Other familiar examples of this construct include string formatters and interpolations

```js
x = "a + \\b";
y = `a + ${2+2}`;
```

and regex

```js
z = /[a-z]+/;
```

The symbols `"`, `'`, and `/` are interpolated as "language calls" that kick you over into a new syntax (which may or may not allow interleaving expressions in the host language).

Another familiar example is invocations of other programs, which usually have a special syntax for their calling parameters:

```js
z = exec("ls -a");
```

and also the various ways of creating queries like SQL commands at runtime

```js
db.exec("select * from foo");
// or
db.selectAll.from("foo");
```

In fact all sorts of specialized language syntaxes may be seen as "sublanguages". A list comprehension in Python is a temporary "other language" that you jump into to compactly represent a list:

```python
[x for x in foo if x % 2 = 0]
```

And a `for` loop is a "function" that takes a list-comprehension-like condition plus a code block and uses the list to run the block.

```js
for (x in y) {
  foo(x)
}
```


In each case, what is sort of happening is that one language is being embedded inside another. 

So the argument goes: this pattern shows up everywhere, but in an ad-hoc and janky way that you can't implement yourself; it only works if the language provides the syntax for you. Therefore we should formalize it as a basic construction that you can extend with your own languages and syntaxes. The arguments to a function should be able to be _an actual program in the other language_, just, hosted by the language you're working in. And that program could be a known language, like SQL, or it could be some DSL you made up yourself.

In languages a construction like regex or string interpolation usually looks like special nodes in the grammar that kick you into what might be called a "sublanguage". For instance, Regex form a sublanguage of Javascript, Python, or C, with their own grammar, parser, typechecker, and runtime. We would like to be able to implement the same construction in user code. (This is somewhat similar to languages with powerful macro systems (like Lisp), or with powerful template systems (C++), or which otherwise that allow you to extend their syntax at runtime (e.g. Scala, although I don't know much about that)).

In this paradigm still have the option of calling a function in the classic sense: `foo()` can still mean "go execute the text of the function `foo`", and `foo(x)` can still mean "go execute `foo()` with the value of its first argument set to `x`". In those cases the "program" is trivial, while the "interpreter" (i.e. the function) does all the work.

But, if "invoking languages" is treated as more primitive than calling functions, then we may think of ways to extend the `foo(x)` syntax. We interpret `foo(x)` as being a sugar for `eval(foo, [x]))`. We have the option of swapping out the choice of the function `eval`: instead of running the function the normal way---line by line, with `x` substituted for its argument---we could run it some other way. We could

* replace all of its imports with stubs (as in a unit test)
* run it in an async manner, blocking on I/O
* run it in a sandbox that doesn't have access to anything except an explicit list of dependencies
* run it with only some of its arguments filled out, producing some kind object that represents a partially-completed computation
* run it until one of its arguments is actually used, then pause waiting for that argument to be provided
* record every state change it makes as it goes and have the option of playing them all back later
* provide a function `x()` instead of a value, which returns a different value every time it is invoked
* or whatever else 

We end up thinking about `foo(x)` like this:

1. The caller of this function is _already_ a language, running in some sort of `eval()` function
2. The default meaning of `foo(x)` is: "tell my own language to jump over to running `foo` with the value `x` substituted into its arguments, then replaced this value with the return value of that function"
3. The meaning of `(x)` is that it is a very simple DSL for producing the one-element list `[x]`. We could easily assign variables by name instead, however
3. But other meanings of `eval` are also possible, which we should have the option of writing out explicitly.

The goal here is to make a programming paradigm that makes all of this _possible_, in order to get away from the "linear, imperative" mode of programming. Actually writing a debugger should be as simple as replacing the default `eval` with another one; actually writing a unit test should be as simple as running a function in a sandbox; these things should not be seen as large technical undertakings but throwaway tasks you could implement in fifteen minutes.

The core idea: most of the time you should be inventing DSLs or DSL-evaluators that directly and elegantly captures the intension of your code. I call this "language-oriented programming" or LOP.

I like to use the word "Slang" for a "function-specific programming language". If you write a function so that it accepts a DSL, and then write a syntax for that DSL, then call it using that DSL, then that's a Slang. 

The trick of course is making this all easy, ergonomic, typesafe, etc. I don't know how to do that yet (although see below). It is clear that you need a way for the type systems and data structures of the languages to interop with each other. It seems likely that what happens is, in order to implement these structures, you have to provide some kind of mapping (implemented as code) between the two languages: program `b \in B` gets translated to some abstract construct `b_A \in A` in order to be used by the host. 

Here's sortof a way of thinking about that...

------

# 2. Coordinates

Programming languages are to programs as coordinates are to functions. In math if a function $$f: X \ra Y$$ is defined on a particular coordinate system $$(x)$$ for $$X$$, then it assigns to each value $$x$$ a value $$f(x) = y \in Y$$. But, there is something fundamentally arbitrary about the coordinate system: you can map it to another coordinate system $$x'$$, and the function should do the exact same thing, meaning that it gets a new definition $$f'(x')$$ defined by

$$f'(x') = f(x)$$

If $$x' = Ax$$ (for some transformation $$A$$; you can think of $$A$$ as a matrix or something, for example, maybe it rotates the coordinate system $$x$$) then

$$f'(x') = f(A^{-1}(x')) = f(A^{-1} A x) f(x)$$

The function $$f$$ is said to be coordinate _invariant_ (since the choice of $$x$$ or $$x'$$ doesn't affect its result). When the coordinates vary $$x \ra Ax$$, the function is said to be _contravariant_, because it "contravaries", that is, it varies according to the inverse transformation $$f' \equiv f \circ A^{-1}$$. (One can also write down objects that are _covariant_, meaning that they vary $$g' = A g$$). The general rule is that functions that map _into_ the $$x$$ coordinates have covariant representations in coordinates, and functions that map _out of_ the $$x$$ coordinates have contravariant representations in coordinates. 

(Even though the "contravariant" is often the correct term for what functions arewe generally say that representing an object in either of these ways is called being "covariant" or "generally covariant"---basically, covariant objects are ones that "adapt themselves" to changes of coordinate system. This idea is perhaps the most concept in physics; see [general covariance](https://en.wikipedia.org/wiki/General_covariance). Essentially: physics predicts things about reality and only incidentally uses any particular representation in math to do so. Therefore any mathematical representation of a physical system must be generally covariant: switching representations must not change the predictions the theory makes..)

All of this can be translated to programming. A program, after all, is a function from inputs to outputs. The fully covariant model of a program views it only in terms of its externally-visible effects, not how it is implemented. In full generality we think of the program as being invariant with respect to how it is written, how it is called, or who runs it. Essentially: the actual text of a program, and to some extent the details of its runtime, are a choice of (arbitrary) "coordinates" for the program itself. (This is a bit leaky as an abstraction, since you can e.g. get an error or attach a debugger and interact with a program in a way that reveals details of its underlying syntax, and of course the implementation details and runtime determine things like the layout in memory or ordering of internal operations. But it is still useful to think of the program's behavior as being more 'fundamental' than these implementation-specific details.)

All sorts of odd ideas pop up when you start thinking about program this way. Off the top of head:

Conceptually we should be able to call a function from another function with one function could be in principle written in a different language. The two programs are just coordinates for behaviors, after all. Runtimes and compilers function as transformations from one coordinate system to another: "given this code, run it in this setting". At present they are generally very restricted at this, but they don't have to be. In a code block `foo(){ bar() }`, as long as we have 'a' way to run `bar` it shouldn't matter that it is a program in the same language as `foo`. If there are interoperability problems, there should be a general way to fix them.

in particular it should be possible to update the syntax of a language and rewrite all the old code in the new syntax. As long as the underlying functionality is the same, it's the same _program_. This should be generally automatic.

To get to that we need for:

* syntax to be extremely 1:1 with its behavior
* the right way to do anything complicated is to invent syntax that makes it simple --- long complicated expressions are hard to transpile but also conceptually bad; they show that the syntax is not well-suited to the task. it should, in general, be possible to express _only the idea_ of a computation, and not its individual steps. (with in principle runtime cost---the idea is expressed, then it's translated to the implementation in a compilation step, and then you get the same result as if you had implemented it in the complicated way)

In LOP you expect to write new syntax down all the time. But you will need, eventually, to update that syntax: maybe somebody else implemented the same idea and you want for there to be only one version of it. To do this you want to be able to automatically transform your syntax into theirs (assuming it obeys all the same types). 

A simple example of this: if you copy-paste a data structure from one programming language to another, it should be possible to automatically reformat it as you go. I just had an example of this: I copy-pasted a JSON representation of a CSS style into a CSS document. (For some reason that example is prompted me to write this whole set of notes.) Although the CSS doc is key-value just like Json, the format is different, so I had to remove quotes, replace commas with semicolons, etc. This is fundamentally wrong. It should be possible to get it go like this:

1. The JS representation of the style is 1:1 with the style (of course)
2. When copied, instead of the JS _text_, the thing that is copied is "the style itself", a representation in "abstract CSS".
3. when pasted into a CSS file, the style gets rendered into the format the CSS file happens to use for that object (which happens to be the CSS text format itself)
4. had we pasted it somewhere else --- Python, say -- it would get rendered into Python instead.
5. sublanguages (say, if we have some CSS extension that lets us include variables in it) should "come along for the ride" in this translation.

That is: in each case, the textual representation is "coordinates" for the actual object, and the thing that is modeled is the object itself.

-------

# 3. Universal Programming

Obviously the above "copy-pasting" process requires a lot of pieces to work together in a clockwork fashion: all the grammars and text-transformers for each language have to be able to talk to each other. Probably that's an intractable engineering problem. But I can't help but imagine that in a greenfield ecosystem it should be possible to solve it up front (in a language-oriented-programming paradigm)

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

There's a way to think of this in terms of linear algebra. You can think of this as a mathematical object $$j$$ in a space $$J$$, which factors into two "orthogonal" pieces, the "Lang" piece plus the "Free" piece.

$$J = L \oplus F$$

And then the code $$j$$ can be factored as $$j = (j_L, j_F)$$.

$$j_L$$ represents the part of the code that specifies a concept in the language's internal model. In this case, upon parsing, the program constructs a projection $$J \ra L$$ of the _relevant_ pieces of information in $$j$$: the names of the keys and the values on each key. (Let's assume that this is all it uses. JSON might sometimes include other details like the order of the keys, (although it shouldn't). But this is just an example.)

Any time a projection occurs there is always a kernel: the $$F$$-component of $$j$$, $$j_F = j - j_L$$, consisting of "all the information in $$j$$ that was not used in $$j_L$$". In this case: the order of the keys, whether single or double quotes were used, whether the concluding comma was there; how the numbers were specified, etc.

Note that we do not have a representation for $$j_L$$ or $$j_F$$. There is not (a priori) a _text_ format for them. Instead, $$j_L$$ is "the stuff that affects the results" and $$j_F$$ is "the stuff that doesn't. We _could_ invent a syntax for them, but that's a completely separate problem.

The idea then is:

1. when we copy $$j \in J$$, what we actually want to paste is the data in $$j_L$$
2. therefore the parser that functions as map $$P: J \ra L$$
3. (in practice the actual thing it produces is a data representation $$D$$, such as an AST (at parse time) or in memory (at runtime) for the value of $$j_L$$. We'll ignore this and say that it just produces the behavior, abstractly; we don't care what happens on the other side of parsing.)
4. The parser should be _pseudoinvertible_: inverting the parsing should produce _one_ piece of code $$P^{-1}(j_L)$$ that has $$P(P^{-1}(j_L)) = j_L$$.
5. A pseudoinverse produces projections: $$P P^{-1} = I_L$$, the projection onto $$L$$---$$I_L (j) = j_L$$. This gives a textual representation for $$j_L$$: it's a subspace of the overall programming language $$J$$, which has a single unique representation for all programs that map to the same output.
6. Therefore $$L$$ has a textual representation as a subspace of $$J$$.
7. $$P^{-1} \circ P$$ can then be used "code formatter" (like `gofmt`) for the language: by parsing and unparsing the same code, you produce an invariant form.
8. All of the other variation in $$J$$ therefore lives in $$F = L_{\perp}$$, which is the kernel of $$P$$. If two programs with different text have the same behavior, $$P(j_1) = P(j_2)$$, then they have the same $$L$$ coordinate but different $$F$$ coordinates: $$j_1 = (j_{L}, j_{1F}) \neq j_2 = (j_L, j_{2F})$$

Note that even though $$P^{-1} P (j) = j_L$$ produces a textual representation of the space $$L$$, this should still be seen as _coordinates_ for $$L$$, rather than the space itself. The space itself is completely abstract, and refers only to the behavior.

(aside: much of actual linear algebra, and also non-linear algebra for that matter can be understood in the same way, and it's a very valuable perspective---every function may be viewed as factoring its input into a "sum" of a component that does something and a component that doesn't)

1. $$j_L$$ labels the nontrivial part of the image of $$P(j)$$. All vectors $$j_i$$ which have $$L(j_i) = L(j)$$ have the same $$j_L$$ component. 

  The value of the component _is_ $$P(j)$$, which we can represent with $$j_L$$. In the linear algebra picture: it's not like a vector $$\b{a} = 3 \x + 5 \y$$ which "has" an $$\x$$ coordinate. Instead it's a vector $$\b{a}$$ combined with a function $$X(\b{a}) = 3 \x$$, therefore you _say_ it has the $$\x$$ coorddinate of $$a_x = 3$$, and if $$X(\b{b}) = 3 \x$$ also then you say $$b_x = a_x$$. But it could just as easily be that $$X(\b{a}) = $$ produces some other object, not a number. We would still call this the "coordinate" associated with $$X$$. Two objects whose image under $$X$$ are the same are said to have the same $$X$$ coordinate, and if two people have different definitions of $$X$$, they may "see" different $$X$$ coordinates on different objects where we would see the same ones.
2. $$j_F = j_{\perp L}$$ labels "everything else in $$j$$". The only fully general way to represent this is as $$j - j_L$$, which is to say: store the value of $$j$$ (as text) plus the value of $$j_L$$, treat the result as coordinates on $$j_F$$. Obviously this overspecifies things a bit, but that's what compression is for. 
  For example, suppose the only "degrees of freedom" in the value of $$j$$ are the things mentioned before:
  * the order of the keys
  * single vs double quotes on each key and value
  * whether there's a trailing comma
  Then you could use just this data as coordinates on $$F$$ and therefore store the result in a reduced form. But if someone comes along and adds another degree of freedom (e.g. how many trailing zeroes in each number `3.14000...`) then that piece of information becomes a coordinate as well. No matter how the information is _represented_, the full data of $$L \oplus F$$ is exactly $$J$$. Probably it will be very useful to find a compact representation of $$F$$, but it's not necessary: you can always include the full text of $$j$$, and treat all the differences between it and $$j_L$$ as the coordinates for $$j_F$$.
3. My hunch is that it should be possible to write a parser in a way that allows storing the free parameters in a very compact way. If the only possible variation in JSON is the order of the keys, then you can store, for instance, $$j = (j_L, \sigma)$$ where $$\sigma$$ is a permutation of the keys. That would then be completely isomorphic to $$j$$ because it is possible to reconstruct the full text of $$j$$ from those two pieces of data.

You might have to decide, for each language, which degrees of freedom you care about. For example, in JSON, order of keys might be useful for readability, while the trailing comma, or indent levels, or tabs vs spaces, is something you decide you don't care about. You can "factor" $$F$$ apart like this:

$$F(j) = [f_1, f_2, f_3, \ldots](j)$$

where each term is one "fact" about $$j$$---maybe $$f_1$$ is the order of the keys, $$f_1$$ is whether there's a single vs double quote vs neither on each key and value, etc.

Once you've done this, you can additionally decide that you want some of the information on $$F$$ to be included in $$L$$ instead. For example, maybe you decide that the order of keys is useful, and should be preserved by the formatter. Suppose $$f_1(j)$$ refers to the order of the keys in $$j$$. Then you can think about "preserving" the order as updating your language $$L$$ to a new language $$L'$$. Originally

$$(L, F)(j) = [L \oplus (f_1, f_2, \ldots)](j)$$

After the update:

$$(L', F')(j) = [(L, f_1) \oplus (f_2, \ldots)](j) = [L \oplus f_1, F \ominus f_1](j)$$

Now $$L$$ is parsing your code but making note of the order of the keys in each object in order to be able to reproduce them. Now, if you copy-paste this object into another _language_, you can paste a version that has the keys in the same order, even though that is not part of the original invariant representation $$L(j)$$.

In a full general programming setting, there is not going to be a single $$L$$ or $$F$$. Instead there's a whole pipeline of translations, each of which has its own instance of the same linear algebra. In a simple model suppose you are thinking of a block of code $$j$$ as being run by a single language $$L$$, so the resulting space is $$L(j)$$. Well, it may turn out that $$L = A \circ B \circ C$$. Each individual step will have its own projection operation, inverse, and kernel. Our job is to model each stage correctly. It should be possible, upon each step of transformation $$j_i \ra j_{i+1} = L_i (j_i)$$, to use a **common format** for understanding the "gestalt" of the value of $$j_{i+1}$$---that is, to agree on a coordinate system. Every language has most of the same data structures, after all. A list is a list, regardless of whether you use square brackets or parens, or whether you represent default to representing it internally by a linkedlist or an arraylist or something else.

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