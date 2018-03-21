---
layout: article
title: "XML and Nesting Languages"
math: true
aside: true
footnotes: true
---

Please think about this. I'm sorry that you don't like my writing style. I don't know how to do better on short notice, and I'm not going to spend a week trying to make something public-worthy to share it. I'm writing it here because I have more notations at hand than in Slack.



## 1
This article on why [Lisp is great](http://www.defmacro.org/ramblings/lisp.html) starts by talking about how XML is like an extensible programming language. The example is from Ant, which is Java's build system from the 90s (in the 90s, everyone learned about OOP and XML around the same time and became obsessed with doing things using them):

```xml
<copy todir="../new/dir">
    <fileset dir="src_dir"/>
</copy>
```

It corresponds to Java code like:

```java
CopyTask copy = new CopyTask();
Fileset fileset = new Fileset();

fileset.setDir("src_dir");
copy.setToDir("../new/dir");
copy.setFileset(fileset);

copy.execute();
```

And the article says that ought to correspond, if Java supported it, to:

```java
copy("../new/dir")
{
    fileset("src_dir");
}
```

(Thought if you ask me it's really just that one of `Copy`'s arguments is a string, while the other is a `fileset` structure, and you have to nest structure declarations, so the _actual_ version should be:

```java
copy("../new/dir", fileset("src_dir"));
```

which, of course, Java totally does support.)

But also, in XML you're free to define your own funny structures like `<unless>`, which would require syntax extension in Java and are thus not available to you. It's true that Java can't do this: you can't pass a function a block that it can optionally execute. Wait, yes, you can:

```java
unless(condition, () -> {...stuff...})
```

(in Java 8, at least. But, sure, it's not quite the same. That `() =>` is definitely clunky.)

Lisp, of course, lets you define `unless` if you want, no problem.

In Lisp the earlier example gets slightly reformatted to:

```lisp
(copy
    (todir "../new/dir")
    (fileset (dir "src_dir")))
```

And all is well. That is so incredibly nicer than using Ant in XML because... well... it's a programming language, not XML, and you're writing code, so you want a programming language. Yeah, if XML was deleted in favor of Lisp the world would come out ahead. Closing tags are awful.

...Except... 

**Key point**: As far as I can tell there is nothing about Lists and endless parens that is necessary for this benefit of Lisp to be realized. It's this fluidity between data<->code and language constructs<->user-defined constructs that's important. No reason that couldn't be done in a C-like syntax, I think.

But, everyone says that once you start using the parens they vanish and stop bothering you. I **don't** buy this: I want to have the Lisp philosophy of 'syntax fluidity' with a C-like syntax overlaid, because I believe that's how the $"One True Language Of 2018" should look. Partly for accessibility and ease of learning, partly to give the finger to Lisp advocates who don't think the language should be made easy to use, and partly because non-List syntaxes are actually great and I want to have fluidity of syntax *without* everything be a List because I believe everything should be as close to reality as possible, so trees should be trees and arrays should be arrays and etc.

---------

The article also says: look, the C preprocessor could just have been C-code, right? Like this:

```c
<%
    cout << "Enter a number: ";
    cin >> n;
%>
for(int i = 0; i < <%= n %>; i++)
{
    cout << "hello" << endl;
}
```

And imagine that `<% %>` blocks run at compile time, so by the time this code is compiled `n` has a value. Easy. Beautiful.

This is obviously sort-of good, in the sense that it's strictly better to have the same language for pre-processing and regular processing than having _two_. Why? The easiest argument is: suppose you need to debug the preprocessing code. Don't you want to be able to use the same tools?

We might think of preprocessing instructions as "code that gets run at compilation to produce our binary". Or we might think of it as "running code at compile-time, which emits more code (as data), which we can compile again to get the binary."


----------

The article says that:

>Lisp is executable XML with a friendlier syntax. 

This is good.

Then it talks a bunch about how Lisp works. I don't care about that.

## 2 My own example

I got sidetracked this week trying to create, for my Lagrangian post, some physics drawings. These are embedded in a website so the options are: static graphics (bad -- I _never_ want to import something that was made in an editor), or offline-programmed graphics (ie with LaTeX plugins) (should not be necessary in 2018), or drawing in JS (Canvas or WebGL) or drawing in HTML with CSS (no!) or SVG.

The obvious choice should be SVG, I think, except that:

```xml
<svg version="1.1"
     baseProfile="full"
     width="300" height="200"
     xmlns="http://www.w3.org/2000/svg">
  <rect width="100%" height="100%" fill="red" />
  <circle cx="150" cy="100" r="80" fill="green" />
  <text x="150" y="125" font-size="60" text-anchor="middle" fill="white">SVG</text>
</svg>
```

is a moronic way to 'draw'.

To be specific:
1. you can't debug it; I know of no way run SVG code incrementally
2. it's a data format, rather than a programming language. You would need to draw in an editor for this to be casually usable
3. there's no reason this *should* not be comfortably doable in an editor (and, admittedly, you can make vector drawings in like Gimp and save them as SVG, no problem -- 
4. there is a specialized syntax for everything you could possible do, which you have to go find yourself
5. it's stringly typed, so half your time is spent finding out that arguments did not work where they should have if you're writing by hand
6. it gets awful quickly when structures are referenced... (coming up next)

Next I tried to add an SVG filter to make my drawings look hand-drawn. Check out this example from the SVG filter docs:

```xml
<filter id="MyFilter" filterUnits="userSpaceOnUse" x="0" y="0" width="200" height="120">
  <desc>Produces a 3D lighting effect.</desc>
  <feGaussianBlur in="SourceAlpha" stdDeviation="4" result="blur"/>
  <feOffset in="blur" dx="4" dy="4" result="offsetBlur"/>
  <feSpecularLighting in="blur" surfaceScale="5" specularConstant=".75" 
                      specularExponent="20" lighting-color="#bbbbbb" 
                      result="specOut">
    <fePointLight x="-5000" y="-10000" z="20000"/>
  </feSpecularLighting>
  <feComposite in="specOut" in2="SourceAlpha" operator="in" result="specOut"/>
  <feComposite in="SourceGraphic" in2="specOut" operator="arithmetic" 
               k1="0" k2="1" k3="1" k4="0" result="litPaint"/>
  <feMerge>
    <feMergeNode in="offsetBlur"/>
    <feMergeNode in="litPaint"/>
  </feMerge>
</filter>
```

Note that everything refers to the results of other things. SVG is **declarative**, meaning that these references are all resolved at once and it figures out how to get what it needs. But, seriously, why not just do it in a scripting language that has a concept of variables?

Here's a quick and obvious pass in Javascript:

```javascript
params = {filterUnits: "userSpaceOnUse", x: 0, y: 0, width: 200, height: 200, desc: "Produces a 3D lighting effect."}
MyFilter = new Filter(params)
MyFilter.add(source => {
	blur = new GaussianBlur(source.alpha, 4)
	offsetBlur = new Offset(blur, 4, 4)
	specOut = new SpecularLighting(blur, 5, .75, 20, "#bbbbbb", new PointLight(-5000, -10000, 20000));
	specOut = new Composite.In(specOut, source.alpha);
	litPaint = new Composite.arithmetic(source, specOut, [0, 1, 1, 0]);
	return merge(offsetBlur, litPaint);
});
```

Now, JS is an imperative language, normally, so you would not think of this as being as powerful as the XML version. The XML version can be compiled by the graphics card to whatever form for optimization it wants. But really, this version can to, as long as we imagine restricting the JS syntax to 'the kinds of things that the XML version can do'.

I strongly believe that the XML version should be purged with fire and replaced with the latter. And then that should be purged and **replaced with a _type-safe_ version of the latter**, because string typing is insane.


<aside class="toggleable" placeholder="<b>Aside</b>: Project idea 1">
The closest thing to this for the browser is the library [SVG.js](http://svgjs.com/) and for filters [SVG.filter.js](https://github.com/svgdotjs/svg.filter.js).

Unfortunately both seem to assume you already know SVG to use them, and (additionally) do a crappy job of documenting how to do SVG things (like named arguments) correctly in their method-parameter-version of calling things. And neither is strongly typed. But it's the right direction.

It would be a productive thing for the world if:

**Project Idea:**

> SVG was documented from scratch for these JS libraries, with no reference to XML at all

This is a project I could undertake. Not yet but someday-maybe?

It would be good if people were told "look, want to do SVG? use this JS library", and the fact that it emits `<svg>` XML under the hood was entirely ignored. Yes. Dear god it would be so much better. Everybody could just start using it to do stuff. And libraries on top of it can definitely absolutely do things like draw graphics.

	* qualification: I don't know why canvas was also invented. There must be arguments against SVG. But, anyway, SVG is really nice in some ways (such as: you can style elements with CSS? weird... but also nice?), and it's already there, and editors like photoshop support it.

</aside>

## 3 HTML, CSS, JS

Question:

What is the difference between code like:

```
let f = () => console.log(5);
f();
```

and HTML that delegates to another programming language and then does the same thing:

```html
<script type="text/javascript">
console.log(5)
</script>
```


I would say "not very much". It happens that in the first example, the code inside `f(..)` is in the same language as its wrapper -- but that is _almost_ unimportant!

So I wonder: what could we do with a programming language that lets you embed syntax from other languages within it? Well.. we already have one (HTML), but it only supports a few other languages. Which is almost amusing, because XML, which it's some kind of subtype of, in principle supports _arbitrary_ sub-languages -- as long as they're constrained to writing in an XML-like syntax.

(See, XML is like a meta language for writing languages. It's just a...shitty one. String types and no debugging? Why would anyone... ever... want that?)

HTML is also XML-based and also seems like a terrible way to write code (hence why half of JS frameworks extend it with `data-` tags or JSX-type templating). Whenever you actually want to do anything programmatic with it you delegate to another language -- but you leave the XML world, even though XML can in principle express everything you want!

Picture if: inside every `<script>` tag, you wrote Javascript out as an XML representation of its abstract syntax tree. That's essentially isomorphic to what we're already doing, if we imagine `js -> xml` as a compile step. Not that you would ever want to do this, but here's what it would look like:

```xml
<script type="text/javascript">
	<call>
		<method target="console" name="log"/>
		<arg>5</arg>
	</call>
</script>
```	

(Note that it's completely confusing whether things should be attributes `target="console"` or tags `<target>console</target>` in XML, but, they're basically isomorphic anyway so who cares?)

You wouldn't ever, like, _want to do that_. But it seems like you should be 'able to', right? Because it's completely isomorphic to what we did anyway! And, hell, that's exactly what we're already doing inside `<svg>` tags, too.

(Also, remember that HTML delegates to JS not only in `<script>` tags but also in, like, `<button onclick="click()">`. And it delegates to CSS in `<link>` and `<div style="x: 10px;>`. So we'd want to cover those too.)

Therefore I propose that, _apparently_, what people want to be able to do in websites is nest _different programming languages_, in such a way that each can have a very different syntax and even different assumptions like 'imperative vs declarative' and 'ordered vs unordered', and have everything interact in the right way.

<aside class="toggleable" placeholder="<b>Aside</b>: Project idea 2">

Project idea:

> fork webkit or firefox and implement a Lisp markup version of HTML that just immediately gets compiled to HTML, as a proof of concept.

(both to prove that it's a good way to do it and to prove that implementing your own alternatives to HTML is, maybe, something that people should do!)

</aside>


## 4 Nested Languages

Suppose we have a function signature in some Java-like language:

```java
Int f(Int x)
```

This is a function that, when used in a larger program, should be passed a value of type `Int`. right?

```
console.log(2 + f(3))
```

So I wonder: what would it look like to define the `<script>` tag from HTML, except as a function that takes Javascript code? Remember, XML is a data format from _describing a syntax tree_, when used to express a programming language (like in the JS example above). So perhaps it's something like:

```
Html script(Javascript js)
```

You would then go write HTML code in this Java-like language, which would include, somewhere inside:

```js
div(
	script(
		console.log(5); //javascript code
	)
)
```

Or if you prefer a Lispy version, to make it more obvious that _the outer and inner languages are completely unrelated_:

```
(div
	(script
		"console.log(5); //javascript code"
	)
)
```

This is, essentially, what's already being done in HTML, albeit in a less user-friendly and self-aware way. Is this what HTML should look like? I'm not sure.

I wonder if this is _good_?

## 5. One final point

Consider a language that considers function invocations `f(args...)`, mathematical expressions like `x + 5`, and inline arrays `[1, 2, 3]` as valid expressions.

Suppose we viewed these as _three different languages_: ie, every place that expects a function expects an instance of type

```
expression -> functionLang | expressionLang | arrayLang
```

where each of those is the language of expressions in their respective syntaxes.

Well! That's just a formal grammar, isn't it?

Is there _any_ difference between a grammar for a single language, and supporting multiple nested languages?

There are a couple, I think:

1. nested languages rarely or _never_ let you debug both the inside and outside langauges simultaneously
2. or use any of the same APIs without considerable shimming 
3. grammars tend to involve mutually recursive nesting: you can go into an alternate syntax (say, for arrays, or string interpolation), and then get back to the original language syntax.
4. outer languages usually treat content in the internal language as meaningless, untyped strings.
5. ...except for XML, which treats the internal language as meaningless, untype XML documents.

I think this can be improved upon, if only it was done _on purpose_.