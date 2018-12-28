---
layout: article
title: "Formal Languages"
math: true
footnotes: true
category: notes
---

An outline of formal language concepts and cached intuitions, for my reference.

## 1

* An **alphabet** is a finite set of elements, which we will refer to as 'letters', even if they are not represented by single letters.
	* `(H,T)` can be an alphabet of 2 letters
	* `(HH, HT, TH, TT)` can be an alphabet of 4 letters
* A **string** or **word** over an alphabet $$A$$ is a finite sequence of symbols of $$A$$.
	* The empty string "" is also considered a string.
* The set of all possible words over an alphabet $$A$$ is denoted as $$A^{*}$$
	* We may define a binary option on strings via concatenation, with the empty string acting as an identity element. In this sense words over a set $$A$$ form a [free monoid](https://en.wikipedia.org/wiki/Free_monoid) on $$A$$.
* A **language** $$L$$ over an alphabet $$A$$ is a subset of $$A^{*}$$.
* $$A^{n}$$ denotes the language of *n*-letter strings over $$A$$. 

Some examples of languages:

* `H|T`, the results of a coin flip
* $$\tt{a}^{+}$$ = `{a, aa, aaa, aaaa, ...}`, strings of at least one `a`.
* `{}`, the trivial empty language
* $$\tt{a}^{n}\tt{b}^{n}$$, any string of of `a`s followed by the same number of `b`s
* The strings of correctly-matched parentheses, such as `{"", "()", "(())", "()()", etc}`
* The language of all syntactically valid Java programs
* The language of "PGN notations for chess positions"
* The language of "Chess positions in which white can win with perfect play in PGN notation"

Clearly it is possible for 'testing for membership in a language' to be *as algorithmically complex as any decision problem*, since for any boolean function `f -> T|F` you can ask for "the language of `x` such that `f(x) = T`"!

--------

Languages can be represented in many ways. The usual methods are:
* A string from a higher level language, like `(a+)` to represent the language 'strings of at least one `a`' (plus, implicitly, a mapping between the higher-level description language and the lower level 'actual' language!)
* A handwavey description, like "syntactically valid Java programs", with details omitted because they're rarely important.
* A **formal grammar**, consisting of a start symbol `S` and a series of _production rules_ through which S can be translated into all possible valid strings in the language.
	* `S -> H | T` trivially describes the language `(H|T)`
	* `S -> aS | a` describes the language `(a+)`
	* `S -> S S | "(" S ")" | ""` describe the language of properly nested parentheses
* A **formal automaton**, which is some sort of mathematical object that represents the algorithm for generating strings in the language or testing membership of strings in the language. Usually these are represented as a graph of states where the algorithm moves between states as inputs are processed. They can be augmented also with memory (called a 'tape', historically). These create, essentially, primitive models of computation that are easier to reason about that actual computers.

Grammars tend to be the most convenient way to represent a complex language. Almost all programming languages (and even parts of many human languages!) tend to be stored as formal grammars which are then fed to algorithms (called [Compiler-Compilers](https://en.wikipedia.org/wiki/Compiler-compiler)) for parsing code.

-------

No matter how we're representing languages, allowing ourselves more powerful syntaxes increases the 'complexity' of the languages we can represent. 

In a sense that can be made rigorous, the language of nested parentheses is *more* complicated than the language `(a+)`, and the language of valid Java programs is more complex than that. 

Turing Machines are the most famous example: using a state machine (a graph with transition functions) and a single infinite row of data, they can represent (tediously) any (pure) mathematical function (the [Church-Turing Thesis](https://en.wikipedia.org/wiki/Church%E2%80%93Turing_thesis)). They are the mathematical apparatus that corresponds to 'what computers can do, not including IO' (though: note that no computer is a true Turing machine as that requires infinite memory). Once you get to the power of Turing Machines, adding *more* power doesn't help as much -- you can simulate, for instance, a 2-tape TM with a 1-tape TM. Adding more power may still make computations faster or easier to implement, of course.

One of the most important results in computer science is the proof that there exist algorithms which _cannot_ be decided by Turing Machines, by [showing](https://en.wikipedia.org/wiki/Halting_problem) that a Turing Machine that answers the question "Does the input Turing Machine ever not halt on any input?" cannot exist (using a [diagonal argument](https://en.wikipedia.org/wiki/Cantor%27s_diagonal_argument), which is essentially a more sophisticated version of asking for the truth of a statement like "this statement is false").

This reveals the mathematical quality of _undecidability_: that there exist questions for which there "is" an answer, conceptually, but no (terminating) algorithm can be written down to find it. (Though you're free to just brute-force it by testing every input. Good luck!) Many mathematical problems now are 'solved' by finding a way to transform them into a known _undecidable_ problem, meaning "if you had a proof of this, you could solve the Halting Problem; therefore there is no proof!". This is probably the coolest thing that happened in mathematics in the 20th century.

Clearly the theory of languages and computation begin to quickly get at the roots of mathematics. That's why I like 'em. It feels like discovering cosmic truths about the universe.

-----

We classify languages according to the complexity of strings they can process. There are many (_many_) classes. The simple classification theme is called the [Chomsky Hierarchy](https://en.wikipedia.org/wiki/Chomsky_hierarchy).

Important classes are:

* **Finite Languages**: all words are finite length, so can simply be enumerated. 
* **Regular Languages**: languages with no 'memory'. They can represent strings like $$\tt{a}^{n}\tt{b}^{m}$$ amd $$(\tt{ab})^{n}$$ and $$(\tt{a}\vert \tt{b})^{n}$$, but _not_ $$\tt{a}^{n}\tt{b}^{n}$$ -- they have no mechanism to 'store the value $$n$$ while parsing the $$\tt{b}$$s'.
	* [Regular expressions](https://en.wikipedia.org/wiki/Regular_expression), such as "`\a+b(cd)+\`"" available in almost every programming language take their name from (originally) being shorthands for representing regular languages. Real-life implementations are considerable more powerful than regular languages, though.
	* Regular languages correspond to representations by [finite state automata](https://en.wikipedia.org/wiki/Finite-state_machine).
		* It is pretty easy to see that the automaton would have become _non_-finite in order to represent arbitrary memory, such as a previously seen number of `a`s in $$\tt{a}^{n}\tt{b}^{n}$$: one copy of the graph would be needed for each possible value of *n*.
	* Regular grammars have productions like `S -> aA` and `S -> Bb`, which require you to see an `a` or `b` but don't require you remember that fact as parsing continues inside `A` or `B`.
* **Context-Free Languages**: a superset of regular languages, which have 'local' but not 'global' memory: for instance, the language of nested parens `S -> S S | (S) | "")` works, because you have to remember that you're 'inside a paren' -- a local fact), but the language of non-interacting parens and braces, with strings like `([)]`, does not. The language of equal-numbers-of-two-variables $$(\tt{a}^{n}\tt{b}^{n})$$ works, but three variables does not.
	* The state machine of a CF language is a finite automaton plus a 'stack' data structure it can use for memory and modify on transitions (these have the unforunate name of [Pushdown Automata](https://en.wikipedia.org/wiki/Pushdown_automaton)).
	* CF grammars have productions like `S -> aAa`, which can require seeing an `a` _now_, and seeing another `a` _later_, though anything else can be done in the meantime. Since `A` itself is also a context free language, so we might think of this as languages that can be built from _recursive nesting_, while regular languages were only created by _recursive concatenation_.
	* When real-life programming languages are context free, they're easy to parse. When they're not context-free, they're not. CF is the last 'easy' level.
* **Recursively-Enumerable Languages** are completely unrestricted. This is the class of languages that a Turing Machine (read: an arbitrarily powerful algorithm) is capable of recognizing, if it is allowed to *fail to halt* when run on a string not in the language.
	* Turing Machines are still not all-powerful, though, and languages that encode undecidable problems (like the Halting Problem) will fail. So "the language of binary-encoded Turing Machines that never halt" is not recursively enumerable.
	* The name refers to the fact that the elements of such a language can be *enumerated*: A Turing-like Machine can be contrived that will run forever but will generate in some order every string in the language (basically, by generating every possible input string and running the membership algorithm on each one incrementally.)
	* Their grammars can consist of any wild things, like `abSBAc -> SABcab`.

There are many other types of languages that fall in between and around these ones. These are just the most popular names. It's worth being vaguely aware of them if you like this stuff.