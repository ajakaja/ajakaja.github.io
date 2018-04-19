---
layout: article
title: "Welcome to Slang"
math: true
category: notes
footnotes: true
---

*[The dream is for everything on this page to be true.]*

Welcome to Slang!

Slang is an statically typed interpreted language.

Its core design philosophy is to make reading and writing code feel as _natural_ as possible, to eliminate cognitive overhead in software development.

Another goal is to to flexible, customizable syntax, as so as to be used to make DSLs and to be invoked from within other languages _without_ compromising debuggability. An example usecase would be to implement a custom DSL inside a larger application, separating application logic from underlying implementation.

Another goal is to be as honest as possible about types and names, so, for instance, what's called a `String` in other languages is called `Text`. Self-documentation is encouraged; for instance, it's better to verbose in libraries (`Integer` rather than `Int`, say), but then alias shorter names to the longer ones to make code concise.

Similarly, whenever possible, objects are given the type that most conceptually matches their human interpretation. If a concept can't be faithfully represented in the type system, it's a deficiency of the language.

Here's what it looks like:

## 1 Basic Usage


In Slang we can refer to blocks of code inside curly braces as _data_:

```
{print 5}
```
When this executes, it does nothing -- the curly braces mean that the block is treated only as data, until passed to the built-in `exec` function:

```
exec {print 5} //prints 5
```


The symbol `=~`, or just `≅`, means "is isomorphic to", and can be use for many kinds of data. In particular (and this is why I'm introducing it first!), it can compare two blocks of code and see if they _say the same thing_. This means we can use it in the rest of our examples to make them into executable code.

(Generally speaking, in Slang we prefer to use the best available symbol for an operation, like `≅`, and then alias shorthands for it that are easier to type. Someday IDEs will do the translation for us!)

So we can write:

```scala
{ print 5 } ≅ { exec {print 5} }
```

Which be false if they're not the same (but they are!)

(Note that `≅` asks if its arguments are _isomorphic as data_, and works here _because_ the two sides of the argument are compiled to the same structure. It's not, in general, possible to tell if two pieces of code do the same thing (or you could solve the Halting Problem!), but it works for small examples that don't involve any potentially infinite loops.)

The built-in function `fail()` immediately, well, fails. Code that does not compile is isomorphic to `fail()`. The build-in function `assert: Boolean -> ()` `fail`s if its argument is false. Using these we can make all of our examples assert the behavior that we claim they have!

Slang's comments are C-style: `//` for line-comments and `/* */` for multiline.

```scala
assert({ // comment 
	} ≅ { })
assert({ /* comment */ } ≅ {})

```

Indentation is not syntactically meaningful. Newlines are: they are the only way line-ending comments `\\`are terminated, and are otherwise interpreted identically to commas `,`, so lists can be written without trailing commas if each element is written on its own line. A comma followed by a newline, though, is treated as a single comma.

(This means that a file of code separated by newlines may be interpreted as a _comma-separated list_ of lines of code, which is exactly how it's treated by the parser.)

Types are created through the `Type name = value` syntax. Types and Type Variables have uppercase names; variables have lowercase names.

```scala
Int x = 5
Type X = Int
```

All values are _immutable_ by default, and the type can be omitted since it's not really meaningful for immutable variables:

```scala
assert({x = 5} ≅ {Int x = 5}) 
```

but mutable values can be created using the tilde `~` symbol:

```scala
~Int x = 5
assert not {x = 6} ≅ {fail()}
y = 5
assert {y = 6} ≅ {fail()}
```

For mutable types, types _are_ required on the left side, because the inferred type in '`x=5`'' is actually not '`Int`', it's '`Int = 5`', and making that mutable doesn't let you set it to any value other than 5! More on that later when we get to _refinement types_.

Some internal types, like `$compile`, begin with dollar signs, so that they don't pollute the namespace for user-defined operations. You are free to define your own dollar-sign symbols, but because names are immutable by default, you won't be able to overwrite the in-built ones. Dollar signs are for functions that you probably _won't_ use in regular usage. Other built-in functions, like `loop`, are regularly used and therefore have regular names, and thus constitute keywords. It's not possible to override keywords in regular code.

Slang is mostly a functional language, and every syntactic structure that isn't explicitly function invocation desugars to function invocation. `Int x` is referencing first the value of the type variable `Int`, which acts like a function that receives a value of type `$Identifier`, `x`, and returns a `$Value<Int>`. `=` is equivalent to the function `$assign`, which takes a value of type `Int` (in this case).

```scala
assert {Int x = 5} ≅ {$scope $assign (Int x) 5 }
```

Mutable variables, on the other hand, take a type and returns a mutable reference to that type (actually an instance of `$Var<T>`, which has a different `assign` function that will not fail if called more than once.

A usage of an identifier like `Int` or `x`, when the value is already declared, is equivalent to retrieving its value from the local-scope, represented as the `$scope` object.

In Slang, parentheses around function arguments are optional (like in, say, Scala), but function invocations associate left-to-right, so

```scala
assert {f g x} ≅ { (f(g))(x) }
```

There are two ways to compose the other direction: composition with `.` and streaming with `|`:

```scala
assert { f.g x} ≅ { f(g(x)) }
assert { x | g | f} ≅ { f(g(x)) }
```

In these syntaxes, values act like functions which return themselves, so:

```scala
assert { f.g.x } ≅ { f.g x }
```


## 2 CLI

The `slang` command passes all of its inputs directly into its interpreter.
```bash
$ slang 'print "hello world"'
$ hello world
```

The single-quotes are to escape the double-quotes for the shell, so, this does the same thing:

```bash
$ slang print '"hello world"'
$ hello world
```

Many of the commands normally reserved for shell arguments (like `help`) are instead functions in the language, which can be invoked in this way:

```bash
$ slang help
$ <help>
```

And even compilation:

```bash
$ slang $compile 'open("hello.s")'
$ <compiler output, as data>
$ slang run 'open("hello.s")'
$ hello world
```

It is not an accident that invocation of `slang` looks a lot like function invocation. In Slang, you can delegate to code _in other languages_, and in the (hypothetical) Slang shell, the `slang` command just asks the shell to delegate to Slang code. More on this later!


## 3 "Compilation"

Slang is mostly _homoiconic_, like Lisp and similar: its code is data that can be used and inspected in the language. Lisp is very direct about this: you enter your code directly in the data format. Slang, like some other recent languages (such as Julia), still have a translation phase to an abstract syntax tree -- but it's not far from the surface, and easily accessible in code.

Unlike Lisp, macros are not a separate compilation step. Rather, Compilation is just running the Slang `$compile` function anyway, with its input as other Slang code, so you are free to insert more steps for syntactic transformations, if you like.

The function `$compile` emits, as data, the desugared and typechecked instructions from a string of `Slang` code. The function `$run` is just the composition `$exec.$compile`.

`$compile` is not traditional compilation, as the result is not a bytecode format usable to anything besides the function `$exec` -- but if you wanted to compile `Slang` code and run it later, the way to do that would be to perform additional transformations on the output of the `$compile` function (and maybe save them into a file, or stream them to another lower-level program!).

The full execution process is:

```
$run = $exec.$compile
```

With:[^really]

[^really]: I want to figure out how to _literally, actually_ make forms like these true. (They might not be the exact final form, but they should be close)

```
$compile = $lex . $parse . $desugar . $typecheck . $optimize
$exec = $loop ($emit . $step) . $compile
```

There's also a Read-Eval-Print-Loop:

```
repl = $loop ($read . $exec . $print)
```

So you can type `slang repl` in the console to start hacking.

There's also a debugger:

```
debug = $loop ($pause . $emit . $step) $compile
```

There's a builtin-function called:

```
$inspect
``` 

which digs one-layer deeper into any function composition -- in case you want to see these relationships on the fly. But `$inspect` goes one level further than most languages: it will show you the raw source code _inside the compiler_, even if the compiler is not implemented in Slang. The long-term goal is to let `$inspect` drill all the way down to bytecode. Whatever is getting run is what inspect should show you -- because it should not be prohibitively difficult to figure out if a bug is coming from the compiler or from your own code, or to learn how system interactions (syscalls and the like) work 'under the hood'.

```bash
> slang $inspect debug
> debug = $loop ($pause . $emit . $step) $compile
```

Slang code should be designed so that `$inspect` gives intelligible results. Let that guide your architecture. If code only makes sense inside massive context (multiple threads and other processes), it's probably not very good.

## 4 Types

Important types:

```java
Any //parent of all types
Nothing //uncreatable-type
Tuple //tuple of any size
Tuple<A, B> //tuple of one element of each type
Integer
Boolean
Text
Block //anything inside curly braces {} -- executable code
Function 
Array
```

Slang's most newfangled idea is _refinement typing_, which lets you create types like "integers greater than 0". There are several ways to do this. The easiest is to use the type in an expression that its values could be used in which returns a boolean:

```scala
(Int>0) x = 5
```

This is a shorthand for the separate statements:
```scala
x = 5
assert {x > 5}
```

Whenever a _block that returns a boolean_ is `assert`ed, the compiler will maintain that block as a piece of `Knowledge`. If a function `f` requires an `Int > 0` as its input, that is equivalent to requiring that, prior to invoking this function, the following assertions are made:

```scala
f = ((Int>0) x) -> {}
//becomes
assert {x : Int}
assert {x > 0}
```

But if the value of 'x' is a constant, or if the compiler is able to _infer_ the validity of these assertions, then the assertions can be omitted. So this is allowed:

```scala
x = 5
f(x)
```

And this isn't:

```scala
assert {x = -5 ; f(x)} =~ {fail()}
```

Generally speaking, it's undecidable to compute _arbitrary_ relationships between data -- it is not possible for any algorithm that can check arbitrary refinement types to work on all inputs. However, the compiler is capable of relatively small automatic inferences. In other cases, you'll just have to check manually. Fortunately that's as easy as manually making assertions before invoking a function:

```scala
f = (Int x | isPrime(x)) -> {...}
if( isPrime(x)) {
	f(x)
} else {
	// x is known to have property `!isPrime(x)`
}