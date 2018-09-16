---
layout: article
title: "Wedge Product reference"
math: true
footnotes: true
category: reference
---

[Book](http://www.math.umaine.edu/~weiss/books/linear_algebra_via_exterior_products.pdf)

## interior product

Exterior product map: 

$$L_{\b{a}} : \wedge^k V \ra \wedge^{k+1} V$$

$$L_{\b{a}} \beta = \b{a} \wedge \beta$$

Insertion map / [interior product](https://en.wikipedia.org/wiki/Interior_product)

$$\iota_{\b{a}^*} : \wedge^k V \ra \wedge^{k-1} V$$

$$\iota_{\b{a}^{*}} (\b{u} \wedge \b{v}) = \iota_{\b{a}^{*}} (\b{u} \otimes \b{v} - \b{v} \otimes \b{u}) = \b{a}^{*}(\b{u}) \b{v} - \b{a}^{*}(\b{v}) \b{u}$$

aka: left-multiplication on each term! miraculous.

For multivector:

$$\iota_{\b{a}^*} (\b{v} \wedge \beta) = (\b{a}^* (\b{v})) \wedge \beta - \b{v} \wedge \iota_{\b{a}^*} (\beta)$$

Should be written as $$\b{a}^* \vee \beta$$, and if with a vector: $$\b{a} \cdot \beta$$.

---------

Properties:

* antisymmetric

$$\iota_X \iota_Y \beta = - \iota_Y \iota_X \beta$$

$$\iota_X^2 = 0$$

* graded derivation

* plays well with $$L_{\b{b}}$$, becoming a scalar multiplication!:

$$L_{\b{b}} \iota_{\b{a}^*} \beta = \iota_{\b{a}^*} L_{\b{b}} \beta = \b{a}^*(\b{b}) \beta$$

--------

If $$\omega$$ is the unit pseudoscalar, then the Hodge Dual of $$\b{e}_i$$ is:

$$ *(\b{e}_i) = \iota_{\b{e}_i}(\omega)$$

$$ *(\b{x}) = \iota_{\b{x}}(\omega)$$

(nb: $$**$$ picks up a minus sign sometimes! todo)

## dual space

The difference between $$\wedge^2 (V^*)$$ and $$(\wedge^2 V)^*$$:

$$\begin{aligned} 
(\b{a}^* \^ \b{b}^*) (\b{u} \wedge \b{v}) &= (\b{a}^* \otimes \b{b}^* - \b{b}^* \otimes \b{a}^*) (\b{u} \otimes \b{v} - \b{v} \otimes \b{u})\\ &= 2(\b{a}^*(\b{u}) \b{b}^* (\b{v}) - \b{a}^* (\b{v}) \b{b}^* (\b{u}))
\end{aligned}$$

Meanwhile, $$(\wedge^2 V)^*$$ ... would be the same thing? Not sure. I think the basic idea is that the action on tensor products of vectors isn't necessarily canonically defined?

Unclear.

----------

## scalar product...

???

$$\det \langle \b{u}_i , \b{v}_k \rangle$$

