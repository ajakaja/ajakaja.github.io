---
layout: article
title: "Trigonometric Identities"
math: true
footnotes: true
category: reference
---

<style>.equation { line-height: 3em; }</style>

{:toc}

## Definitions

Sine and Cosine give the y- and x- coordinates of angles:

$$\sin \theta  = \frac{opposite}{hypotenuse} = e^{i\theta}\cdot \mathbf{\hat{y}}$$

$$\cos \theta = \frac{adjacent}{hypotenuse} = e^{i\theta}\cdot \mathbf{\hat{x}}$$

$$\tan \theta  = \frac{\sin\theta}{\cos\theta}$$

$$\sec \theta = \frac{1}{\cos \theta}$$, $$\csc \theta = \frac{1}{\sin \theta}$$, $$\cot \theta = \frac{1}{\tan \theta}$$

$$e^{i \theta} = \cos \theta + i \sin \theta$$

$$\sin \theta = \frac{e^{i\theta} - e^{-i\theta}}{2i}$$

$$\cos \theta = \frac{e^{i\theta} + e^{-i\theta}}{2}$$

(Clearly it would make more sense for 'cosine' to be the simpler name and 'sine' to be the derivative one. Oh well.)

Since $$\sin \theta$$ and $$\cos \theta$$ are the x- and y- coordinates of the unit circle $$x^{2} + y^{2} = 1$$, we have:

$$\sin^{2} \theta + \cos^{2} \theta = 1$$

of course $$\sin \theta = \pm \sqrt{1 - \cos^{2} \theta}$$ and vice-versa. Also, $$1 + \tan^{2} \theta = \sec^{2} \theta$$ and $$1 + \cot^{2} \theta = \csc^{2} \theta$$.

-----

## Symmetries and Translation Formulas

$$\sin -\theta = -\sin \theta$$ (sine is odd)

$$\cos -\theta = \cos \theta$$ (cosine is even)

Therefore: $$\tan \theta$$ is odd because it's a ratio even to odd, etc.

Shifting $$\sin \theta$$ or $$\cos \theta$$ by quarter turns $$\theta \rightarrow \theta + \frac{pi}{2}$$ causes them to rotate through four functions:

$$\sin \theta = \cos (\theta - \frac{\pi}{2}) = -\sin (\theta - \pi) = -\cos (\theta- \frac{3\pi}{2})$$

Shifting $$\sin -\theta$$ or $$\cos -\theta$$ by quarter turns traverses the list in the opposite direction:

$$\sin (-\theta) = -\cos (-\theta - \frac{\pi}{2}) = -\sin (-\theta - \pi) = \cos (-\theta - \frac{3\pi}{2})$$

Both of these are just statements that the graphs of $$\sin \theta$$, $$\cos \theta$$, $$\sin -\theta$$, and $$\cos -\theta$$ look the same but are translated differently.

-------

## Angle formulas

Angle addition formulas:

$$\sin a \pm b = \sin a \cos b \pm \cos a \sin b$$

$$\cos a \pm b = \cos a \cos b \mp \sin a \sin b$$

$$\tan a \pm b = \frac{\tan a \pm \tan b}{1 \mp \tan a \tan b}$$

Double-angle formulas:

$$\sin 2a = 2\sin a \cos a$$

$$\cos 2a = \cos^{2} a - \sin^{2} a$$

$$\tan 2a = \frac{2 \tan a}{1 - \tan^{2} a}$$

General multiples are most easily handled through

$$(\cos n\theta + i\sin n\theta) = e^{in\theta} = (\cos \theta + i \sin \theta)^{n}$$

Half-angle:

$$\sin \frac{a}{2} = \sqrt{\frac{1}{2}(1-\cos a)}$$

(though the square root can be negative if $$\sin \frac{a}{2}$$ is negative, so if $$\frac{a}{2}$$ is in $$(\pi, 2\pi)$$, so only if $$a$$ is allowed to be greater than $$2\pi$$ without wrapping around.)

$$\cos \frac{a}{2} = \pm\sqrt{\frac{1}{2}(1+\cos a)}$$

(the sign is negative if $$\cos \frac{a}{2}$$ is negative, so, if $$\frac{a}{2}$$ is in $$(\frac{\pi}{2}, \frac{3\pi}{2})$$).

$$\tan \frac{a}{2} = \frac{\sin a}{1 + \cos a}$$

$$\tan \frac{a+b}{2} = \frac{\sin a + \sin b}{\cos a + \cos b}$$

Product-to-sum:

$$2 \cos a \cos b = \cos (a-b) + \cos (a+b)$$

$$2 \sin a \sin b = \cos (a-b) - \cos (a+b)$$

$$2 \sin a \cos b = \sin (a+b) + \sin (a-b)$$

Sum-to-product:

$$\sin 2a \pm \sin 2b = 2 \sin (a \pm b) \cos (a \mp b)$$

$$\cos 2a + \cos 2b = 2 \cos (a + b) \cos (a - b)$$

$$\cos 2a - \cos 2b = -2 \sin (a+b) \sin (a-b)$$

Powers:

$$\sin^{2} a = \frac{1}{2}(1-\cos 2a)$$

$$\cos^{2} a = \frac{1}{2}(1+\cos 2a)$$

$$\sin^{2} a \cos^{2} a = \frac{1}{8}(1 - \cos 4a)$$

-------

## Geometric identities

For a triangle with angles $$a, b, c$$ and side lengths $$A, B, C$$:

$$\frac{\sin a}{A} = \frac{\sin b}{B} = \frac{\sin c}{C}$$

(Law of Sines)

$$C^{2} = A^{2} + B^{2} + 2AB \cos c$$

(Law of Cosines = general case of Pythagorean Theorem)

If $$a + b + c = \pi$$, then

$$ \sin 2a + \sin 2b + \sin 2c = 4 \sin a \sin b \sin c$$

$$ \tan a + \tan b + \tan c = \tan a \tan b \tan c$$

If $$a + b + c + d = \pi$$, then: (Ptolemy's Theorem)

$$\sin(a+b) + \sin(b+c) = \sin(a+c) \sin(b + d)$$

On spheres with radius R, the Pythagorean Theorem becomes

$$\cos \frac{C}{R} = \cos \frac{A}{R} \cos \frac{B}{R}$$

(as $$R \rightarrow \infty$$, $$\cos \frac{x}{R} \rightarrow 1 - \frac{1}{2} (\frac{x}{R})^{2}$$, so this becomes $$1 - \frac{C^{2}}{2R^{2}} = 1 - \frac{A^{2}}{2R^{2}} - \frac{B^{2}}{2R^{2}} - o(R^{4}) \rightarrow C^{2} = A^{2} + B^{2}$$

And the Law of Cosines becomes:

$$\cos \frac{C}{R} = \cos \frac{A}{R} \cos \frac{A}{R} + \sin \frac{A}{R} \sin \frac{B}{R} \cos c$$

or

$$\cos c = -\cos a \cos b + \sin a \sin b \cos \frac{C}{R}$$

--------

## Inverse functions

It's really antiquated to call these $$\arcsin$$ instead of $$\sin^{-1}$$, in my opinion, but whatever.

Domain and Range:

Inverse trig functions require some fanangling with their domains to keep things behaving like proper inverses. $$\arcsin x$$ takes values in $$(-1, 1)$$ (the range of $$\sin$$) and typically returns $$(-\frac{\pi}{2}, \frac{\pi}{2})$$, though that's a convention. $$\arccos x$$ has the same range and typically returns values in $$(0, \pi)$$.

$$\arctan x$$ gives real results for all real inputs (since the range of tangent is all reals) and typically has range $$(-\frac{\pi}{2}, \frac{\pi}{2})$$

I'll leave $$\text{atan2 } x$$, the oriented / two-argument / sign-preserved arctan [function](https://en.wikipedia.org/wiki/Atan2), to be discussed in a separate reference page.

-------

### Symmetries

These are, unsurprisingly, inverted forms of the regular trigonometric symmetry identities above.

$$\arcsin (-x) = - \arcsin x$$

$$\arccos (-x) = \pi - \arccos x$$

$$\arcsin x = \frac{\pi}{2} - \arccos x$$

$$\arccos x = \arcsin \sqrt{1- x^{2}}, x \in [0, 1]$$

$$\arccos x = \frac{1}{2} \arccos (2x^{2}-1), x \in [0, 1]$$

$$\arcsin x = \frac{1}{2} \arccos (1 - 2x^{2}), x \in [0,1]$$

$$\arctan x = \arcsin \frac{x}{\sqrt{1 + x^{2}}}$$

$$\arcsin x = 2\arctan \frac{x}{1 + \sqrt{1- x^{2}}}$$

$$\arccos x = 2\arctan \frac{\sqrt{1 - x^{2}}}{1 + x}, x \in (-1, 1]$$

--------

### Other Formulas

Inversions:

Relationships between trig and inverse trig functions can be thought of as relationships between parts of a triangle. For example, $$\arcsin x$$ is "the angle that gives $$\frac{opposite}{hypotenuse}$$ ratio x". Then $$\cos \arcsin x$$ must be the $$\frac{adjacent}{hypotenuse}$$ ratio such a triangle. If $$\frac{o}{h}=x$$, then let $$h=1$$, so $$o = x$$ and $$a = \sqrt{1-x^{2}}$$.

$$ \sin \arccos x = \cos \arcsin x = \sqrt{1-x^{2}}$$

$$ \sin \arctan x = \cos \arctan x = \frac{x}{\sqrt{1+x^{2}}}$$

$$ \tan \arcsin x = \frac{x}{\sqrt{1-x^{2}}}$$

$$ \tan \arccos x = \frac{\sqrt{1-x^{2}}}{x}$$

Logarithm definitions:

$$\arcsin x = -i \ln (ix + \sqrt{1-x^{2}})$$

$$\arccos x = i \ln (x - i\sqrt{1-x^{2}})$$

$$\arctan x = \frac{i}{2} \ln \frac{i+x}{i-x}$$

--------

## Calculus

Limits:

$$\lim_{x\rightarrow 0} \frac{\sin x}{x} = 1$$

$$\lim_{x\rightarrow 0} \frac{1 - \cos x}{x} = 0$$

---------

### Derivatives:

$$\sin' = \cos, \cos' = -\sin$$

$$\tan' = \sec^{2}, \cot' = -\csc^{2}$$

 (by the product / division rule)

$$\sec' = \tan \sec, \csc' = -\csc \cot$$

Inverse function derivatives (defined except where denominators would be 0):

$$(\arcsin z)' = \frac{1}{\sqrt{1-x^{2}}} = -(\arccos z)'$$

$$(\arctan z)' = \frac{1}{1+z^{2}} = -(\text{arccot } z)'$$


Inverse functions can also be defined as integrals:

$$\arcsin x = \int_{0}^{x} \frac{1}{\sqrt{1-z^{2}}} dz$$

$$\arccos x = \int_{x}^{1} \frac{1}{\sqrt{1-z^{2}}} dz$$

$$\arctan x = \int_{0}^{x} \frac{1}{1+z^{2}} dz$$

----------

### Non-trivial integrals:

$$\int \arcsin x dx = x \arcsin x + \sqrt{1-x^{2}} + C$$

$$\int \arccos x dx = x \arccos x - \sqrt{1-x^{2}} + C$$

$$\int \arctan x dx = x \arctan x - \frac{1}{2} \ln (1+x^{2}) + C$$

$$\int \frac{dx}{\sqrt{a^{2} - x^{2}}} = \sin^{-1}(\frac{x}{a}) + C$$

$$\int \frac{dx}{a^{2} + x^{2}} = \frac{1}{a}\tan^{-1}(\frac{x}{a}) + C$$

$$\int \frac{dx}{x\sqrt{a^{2} - x^{2}}} = \frac{1}{a}\sec^{-1}\vert \frac{x}{a} \vert + C$$

--------

### Taylor Series:

$$\sin x = x - \frac{x^{3}}{3!} \ldots = \sum \frac{(-1)^{n}}{(2n+1)!}x^{2n+1}$$

$$\cos x = 1 - \frac{x^{2}}{2!} \ldots = \sum \frac{(-1)^{n}}{(2n)!}x^{2n}$$

Clearly the sum of series for $$\cos x + i \sin x$$ gives the series for $$e^{ix} = \sum \frac{(ix)^{n}}{n!}$$

The series for other trig functions are awkward and use special functions. Some of the inverse ones are okay, though:

$$\arcsin x = \sum \frac{(2n)!}{4^{n}(n!)^{2}(2n+1)} x^{2n+1}, \vert x \vert \leq 1$$

$$\arccos x = \frac{\pi}{2} - \arcsin x, \vert x \vert \leq 1$$

$$\arctan x = \sum \frac{(-1)^{n}}{2n+1)} x^{2n+1}, \vert x \vert \leq 1, x \neq \pm i$$ 

Miscellaneous series:

$$\sin x = x \prod_{n=1}^{\infty} (1 - \frac{x^{2}}{\pi^{2} n^{2}})$$

$$\cos x = \prod_{n=1}^{\infty} (1- \frac{x^{2}}{\pi^{2}(n-\frac{1}{2})^{2}})$$

$$\sin x = x\prod \cos \frac{x}{2^{n}}$$

-------

## Hyperbolic functions

Hyperbolic trig functions are defined on hyperbolic angles the same way regular trig functions are defined on circular angles, with the *unit hyperbola* as the graph of the function $$x^{2} - y^{2} =1$$.

A 'hyperbolic angle' $$\phi$$ rotates from 0 to $$\infty$$ as the point on the unit hyperbola approaches the asymptote $$x=y$$, and towards $$-\infty$$ as it approaches $$x = -y$$. As with trig functions, $$\cosh x$$ gives the x-coordinate and $$\sinh y$$ gives the y coordinate.

Anyway, it's a chore to store a lot of intuition about hyperbolic functions, or to write down a lot of identities. The important ones are:

$$\tanh \phi = \frac{\sinh \phi}{\cosh \phi}$$

$$\cosh^{2} \phi - \sinh^{2} \phi = 1$$

$$e^{\phi} = \cosh \phi + \sinh \phi$$

$$\cosh \phi = \frac{1}{2}(e^{\phi} + e^{-\phi})$$

$$\sinh \phi = \frac{1}{2}(e^{\phi} - e^{-\phi})$$

$$\cosh \phi = \cos ix = \sum \frac{x^{2n}}{(2n)!}$$

$$\sinh \phi = -i \sin ix = \sum \frac{x^{2n+1}}{(2n+1)!}$$

$$\tanh \phi = -i \tan i\phi$$

And you can just grab the rest [here](https://en.wikipedia.org/wiki/Hyperbolic_function).