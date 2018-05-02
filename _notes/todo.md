---
layout: article
title: "Math and Physics To-do list"
math: true
---

Because I am unsophisticated, and because I think it's the really important stuff, I am drawn to trying to perfectly understand lower-level mathematics, as opposed to learning really deep stuff.

Specifically, I want to formulate the intuition required to apply, say, arcane tricks around [differentiation](https://arxiv.org/abs/1507.04348) and, like, step- and delta- functions, correctly, _without_ going deep into analysis to prove every statement correct.

(I want to be able to use the analysis to prove the techniques work, and then put it aside to do computations).

For example, statements like $$\p_{x} \log x = \frac{1}{x} + i \delta(x)$$ and $$\int_{-\infty}^{\infty} f(x) dx = 2 pi \delta(\delta_{\e}) f(\e)$$ equations should make sense.

As the above-linked paper exemplifies, physicist's somewhat ad-hoc discussions of mathematical tricks tend to have to be presented alongside their physical usefulness (in their case, an improvement to path integration). This is nice but not important to me right now. Better intuition will eventually prove its usefulness everywhere.

I envision, someday, high-school calculus courses including delta functions (hopefully with a different symbol?) and multivectors without raising any eyebrows.

----------

Anyway, my program for now is to write expository notes on interesting subjects, to cast them in 'simpler' lights. This is a to-do list for things I want to write about soon:

* The calculus of Delta- and Step-functions
* Complex Analysis as 2d multivector calculus, without any special concept of $$i$$, plus higher-dimensional versions.
* The Isoperimetric Inequality $$L^2 \geq 4 \pi A$$, and (ideally) a derivation from something like 'first-principles'. 
	* The dream is to show that the value of $$\pi$$ is naturally determined by the metric of Euclidean space, including its value as an infinite sum (I suspect via $$\frac{\pi}{4} = 1 - \frac{1}{3} + \frac{1}{5} \ldots$$). I find this compelling because the Isoperimetric Inequality seems to force $$\pi$$ to appear in geometry even before there's any concept of a 'curve': it appears as a natural constraint on _any_ polygon, even those you draw only with straight line segments parallel to the axes.
* An exposition on 'signed angle vectors', through their duality (via projective geometry) with regular vectors, and extrapolation to higher dimensions.
* For that matter, an explanation on Solid Angles in general, which could stand to be just as intuitive as 2d angles, because why not?
* An exposition of Lagrangian (classical) Mechanics that does not invoke the Principle of Least Action as an esoteric physical law, cause I really think it's... bad. Particularly because, if you start from hand-waving a principle in classical mechanics, by the time you get to Quantum Field Theory, you have no hope of returning to intuition.
* An exploration of geometric and, particularly, the concept of [intrinsic volumes](https://en.wikipedia.org/wiki/Mixed_volume), which I suspect to be a far more important concept than is currently recognized.
	* Particularly, I want to understand the significance of measuring magnitudes -- length, area, quantity -- as a polynomial in a unit, like $$M = A m^2 + \frac{L}{2} m + \Chi$$, and how these quantities transform/are preserved under various projection operations.)
* An exploration of how to calculate polygon intersections, and how ... non-intrinsic... existing algorithms are for, say, collision detection.
* I've already written about intuition around classical Entropy. I'd like to keep thinking about that and try to understand quantum (Von-Neumann) entropy as well.
* I wonder about how Statistical Mechanics changes when you modify the assumption that all microstates are equally likely, and put more topology on the manifold of state space. But I'm not sure I'm mathematically ready for this one.