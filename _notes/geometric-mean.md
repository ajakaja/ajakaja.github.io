---
layout: article
title: "Geometric Mean and Standard Deviation"
footnotes: true
math: true
aside: true
---

A friend is writing her master's thesis in a subfield where all the statistics are reported in geometric means and geometric standard deviations (GSD), or even in geometric standard... errors? (GSE)... or sometimes in confidence intervals, and sometimes in, heck, interquartile ranges.

I tried to help her normalize these all into GSDs, but it's a nightmare and I really couldn't find a great reference online for it, so I'm writing one.


## 1. When do you use geometric means, anyway?

Reminder: the [geometric mean](https://en.wikipedia.org/wiki/Geometric_mean) of a dataset $$\b{x} = \{x_i\}$$ is given by:

$$GM[\b{x}]] = (\prod x_i)^{\frac{1}{n}}$$ 

Though it is better understood through this equation:

$$GM[\b{x}] = e^{AM[\log \b{x}]}$$

(The base of the exponent and logarithm can be anything. It cancels out -- if you use $$log_b$$, you raise $$b$$ to the power afterwards: $$GM[\b{x}] = b^{AM[\log_b \b{x}]}$$)

This means that you compute the average _logarithm_ of the data, and then just rescale it back to the numbers you were actually using so that the units work out.

The simplest case where this is useful is if we are dealing with data where logarithm of the data is more meaningful than the value itself, which is the case when our data's values range over many orders of magnitudes. 

This is true are for things that we already use logarithmic scales for, like [brightness of stars](https://en.wikipedia.org/wiki/Apparent_magnitude), [loudness of sounds](https://en.wikipedia.org/wiki/Decibel), [acidity/basicity of solutions](https://en.wikipedia.org/wiki/PH), [sound frequency](https://en.wikipedia.org/wiki/Octave), or [power of earthquakes](https://en.wikipedia.org/wiki/Richter_magnitude_scale). 

In all these cases we don't really know what the original measurements were. They're logarithms of _something_, but for reporting data we don't care as much what the 'something' is. If that's the case, I think you may as well just log-transform all your data and then be done with it.

The geometric mean and related statistics are for when you log-transform your data for analysis, and then want to transform it _back_. For instance: if it's in very sensible units like "parts per million" or "growth %", it would not be useful to log-transform that into something unrecognizable.

It is tricky to get a general sense of _when_ the geometric mean makes more sense for summarizing data. [Some people](https://medium.com/@JLMC/understanding-three-simple-statistics-for-data-visualizations-2619dbb3677a) think the answer is 'almost always'. I'll give it a go, though:

The fundamental reason you would want to use a geometric mean is if it makes more sense to multiply your data than add it.

Here are some signs that that might be true:

* the data varies 'multiplicatively', instead of 'additively', and its corollary:
* the logarithm of the data looks more like a normal distribution than the data itself (ie your data is [lognormal](https://en.wikipedia.org/wiki/Log-normal_distribution))
* the data definitely not go below 0, by definition of what you're measuring
* and never goes _to_ 0 (though see note, below)
* the data does not have a constant translation factor (ie, if you could just as easily have measured `x + 50` instead of `x`, then the logarithm is going to be meaningless.)
	* so probably don't take the GM of temperature scales that aren't Kelvin
* the data _does_ have an arbitrary multiplicative factor (if you could have just as easily measured `50` instead of `x`, by changing units)
* the data is normalized against some constant value (so, if it is a % of _anything_)
* the variations in the data would be more intuitively explained as resulting from _multiplicative_ factors, rather than additive ones
	* for example, increasing the performance of a company might increase its revenue by 10%, rather than by a literal dollar amount. 

The simplest example of where a geometric mean make sense: if something increases by $$x_i$$ percents for $$i = 1 \ldots 10)$$, then its total increase is by $$GM(x_i)^{10}$$, ten times. So: multiplying by 10 different numbers gives the same result as multiplying by their geometric mean ten times. If this makes sense for your data, then, the geometric mean is going to be good.

In practice, many quantities vary this way. Probably many more than are being currently summarized using geometric means!

I'd say a general rule is: if you feel like, for your data, a reasonable average of $$10^8$$ and $$10^-8$$ is $$1$$, rather than $$\frac{10^8}{2}$$, use a geometric mean.

## 1b. Note on zeroes

If your data includes $$0$$, then your geometric mean is 0.

But wait. Lots of people are ... [working around this](http://www.arpapress.com/Volumes/Vol11Issue3/IJRRAS_11_3_08.pdf)?

It is _possibly_ reasonable to do this. Particularly if your measurements are not sensitive to the smallest realistic inputs and report 0, you may want to just consider them as "something very small that it is not 0", like $$10^{-10}$$ or $$1$$ or whatever is much smaller than the other inputs. But if there are enough points like this that your choice of exponent is changing the result, you are probably doing something wrong.

By the way: if you are geometric-meaning a bunch of annual growth rates, like $$(-20\%, 0\%, 50\%, 120\%)$$, your 0s are wrong -- those are actually (as multiplicative factors) $$(0.8, 1.0, 1.5, 2.2)$$, which has no zeroes.

## 2. Statistics

Once again, the **geometric mean** is the log-transformed arithmetic mean:

$$GM[x] = \exp(AM[\log x])$$

(I've seen a lot of different symbols for these things. For clarity, since we're talking about multiple means at once, I'll just keep writing $$GM$$ and $$AM$$).

By [AM-GM](https://en.wikipedia.org/wiki/Inequality_of_arithmetic_and_geometric_means) it is _always_ less than the arithmetic mean (if the inputs are all positive. Otherwise all bets are off. Don't use GM on negative numbers!).

The **geometric standard deviation** GSD is the same concept:

$$GSD[x] = \exp(SD[\log x])$$

This is only meaningful when the data is _fundamentally_ logarithmic, so that the central limit theorem will cause `log x` to become normally distributed, rather than `x`. Particularly, after log-transforming back, it does not equal the same things on each side of the mean:

$$\begin{aligned} \exp{AM \pm SD} &= e^{AM}e^{\pm SD} \\
  &= GM[x] GSD[x]^{\pm 1} \\
  & \stackrel{!}{\neq} GM[x] \pm GSD[x] \end{aligned} $$

Note that $$ GM[x] GSD[x]^{\pm 1}$$ means the two values are $$(GM[x] GSD[x], \frac{GM[x]}{GSD[x]})$$. Clearly the $$GSD$$ is a ratio that should be _pretty close to 1_, such that (for a large enough sample) $$68.2\%$$ of values fall in the range of $$GSD[x]^{\pm 1}$$. If that's not true for your large-enough dataset, you did something wrong.

If reporting confidence intervals for a given $$P$$-value, using geometric statistics, they will also not be the same distance from the geometric mean. For $$P=0.95$$, with z-score $$z = 1.96$$ (ie laughably permissible, false positives everywhere), the confidence intervals are:

$$CI = GM[x] e^{\pm 1.96 SD[x]} = GM[x] GSD^{\pm 1.96}$$

---

What about **geometric standard error**? This would say "how far is the sample geometric mean $$GM[x_i]$$ from the true geometric mean of the data $$GM[\b{x}]$$?"

Recall that for a $$N$$ samples drawn from a normal distribution, $$SE = \frac{\sigma}{N}$$, ie, the sample mean is closer to the true mean than the samples are by a factor of $$\frac{1}{\sqrt{N}}$$.

<aside class="toggleable" id="stderr" placeholder="<b>Aside</b>: Standard error of the mean derivation">

The **standard error of the mean** of a sample of $$N$$ values $$\{y_i\}$$ from a normal distribution $$\cal{N}(\mu, \sigma)$$ is the _standard deviation of the sample mean_, ie, it answers the question of "how far does the mean of a sample tend to be from the true mean?" Specifically, it is the standard deviation of the difference in the sample mean and the true mean:

$$\begin{aligned} SE^2 = \E[(\bar{y} - \mu)^2]
&= \E[ \big[(\frac{1}{N}\sum_N y_i)  - \mu \big] ^2] \\
&= \frac{1}{N^2}\E[ (\sum_N (y_i - \mu))^2]\\
\end{aligned}$$

Since each $$y_i$$ are _independent_ random variables,all the cross terms vanish:

$$\E [(y_i - \mu)(y_j - \mu)] = \E[y_i - \mu] \E[y_j - \mu] = 0$$.

This gives:

$$= \frac{1}{N^2} N \E[ (y - \mu)^2] = \frac{1}{N} \sigma^2$$

Meaning that:

$$SE = \frac{\sigma}{\sqrt{N}}$$

(There is a more heuristic argument [here](https://en.wikipedia.org/wiki/Standard_error) that I had trouble believing without writing it out above, because I don't have as much intuition for random variables as I should. It's that, for sums of independent variables, the variances necessarily add:

$$\Var( \frac{1}{N} \sum (y_i - \mu) ) = \frac{1}{N^2} \Var \sum (y_i - \mu) = \frac{N}{N^2} \Var (y)  = \frac{1}{N} \sigma^2$$

Which makes the result obvious.)

</aside>

I did some research to figure out what this means for geometric distributions. This derivation is adapted from [Norris](https://projecteuclid.org/download/pdf_1/euclid.aoms/1177731830) with some jargon and theory removed.

Writing $$\mu_G = GM[y] = e^{\E [\log y]}$$, the true geometric mean of the distribution (assuming our data's logarithm is normally distributed, as above):

$$\begin{aligned} GSE^2 &= \E[(GM[y_i] - \mu_G )^2] \\
&= \mu_G^2 \E [ (\frac{GM[y_i]}{\mu_G} - 1)^2] \\
\end{aligned}$$

First we simplify the first term in the expectation:

$$\frac{GM[y_i]}{\mu_G} = \frac{e^{\frac{1}{N} \sum \log y_i }}{e^{\E [\log y]}} = e^{\frac{1}{N} \sum \log y_i - \E[\log y]}$$

Next we argue that, because for sufficiently large $$N$$, $$\frac{1}{N} \sum \log y_i - \E[\log y] \Ra 0$$, ie, as the sample log mean approaches the true log mean, we can approximate the exponential with its Taylor series $$e^x \approx 1 + x + O(x^2)$$. 


To first order this gives:

$$\begin{aligned} GSE^2 
&\approx \mu_G^2 \E [ (\frac{1}{N} \sum \log y_i - \E[\log y])^2 ] \\
&=\frac{\mu_G^{2}}{N^2} \E [\sum (\log y_i - \E[\log y]))^2 ] \\
&= \frac{\mu_G^2}{N} \E [(\log y_i - \E[\log y])^2] \\
&=  \frac{\mu_G^2}{N} \sigma^2_{\log y}\end{aligned}$$


<aside class="toggleable" id="analysis" placeholder="<b>Aside</b>: Analysis of this approximation"> 

----

When $$f(X)$$ is analytic over the range of $$X$$ we can compute $$\E[f(X)]$$ by writing it as a Taylor series around the mean $$\E[X] = \bar{X}$$:

$$\E[f(X)] \approx \E[f(\bar{X}) + f'(\bar{X}) (X - \bar{X})) + f''(\bar{X}) (X - \bar{X})^2 + \ldots]$$

But since expectations are linear we can write this as:

$$\E[f(X)] \approx f(\bar{X}) + 0 + f''(\bar{X}) \sigma^2_X + \ldots$$

(Where the second term disappeared because $$\E[X - \bar{X}] = \E[X] - \E[X] = 0$$.)

But it is _not_ always valid to truncate this expression at the second-order term. The higher order terms each have a factor of $$\E[(X- \bar{X})^n]$$, and there is no particular reason this should not be huge or even infinite. For $$\E[f(X)] \approx f(\bar{X}) + f''(\bar{X}) \sigma^2_X$$, we require that the remaining terms in the series be small enough to ignore:

$$\frac{f^{(n)}}{n!}(\bar{X}) \E[(X - \bar{X})^n] \ra 0 $$



---------

In our case, let's write the exponent as $$\D = \frac{1}{N} \sum_N (\log y_i - \E[\log y])$$. By the [Central Limit Theorem](https://en.wikipedia.org/wiki/Central_limit_theorem), as $$N \ra \infty$$, $$\D$$ converges to a normal distribution with $$\mu = 0$$, $$\sigma_{\D}^2 = \frac{\sigma^2}{N}$$, even if $$\log y$$ is not normally distributed, as long as $$\sigma_{\log y}^2$$ is finite.

As it happens, for a normal distribution $$X \sim \cal{N}(0, \sigma^2)$$, the [moments](https://en.wikipedia.org/wiki/Normal_distribution#Moments) $$\E[X^n]$$ are given by $$\sigma^n n!!$$ when $$n$$ is even (and $$0$$ if $$n$$ is odd), making the condition on our Taylor series terms be that $$\frac{\sigma^n f^{(n)} n!! }{n!} \ra 0 \; [n \text{ even}]$$ .

Finally, we have $$f(\D) = (e^\D - 1)^2 = (\D + \frac{\D^2}{2!} + \frac{\D^3}{3!} + \ldots)^2$$, which shows that $$f''(\D) = f'''(\D) = 1$$ and all higher-order terms have coefficients $$< 1$$. This means our even Taylor series terms go as:

$$(\frac{\sigma}{\sqrt{N}})^n \frac{f^{(n)} n!!}{n!} < (\frac{\sigma}{\sqrt{N}})^n = \sigma^n N^{\frac{-n}{2}} $$

Therefore the higher-order terms rapidly become 0, and the lowest order term $$n=2$$ is proportional to $$\frac{\sigma^2}{N}$$.

... This is not entirely precise because I'm bad at this asymptotic analysis stuff, but it's good enough for me. I did not follow the argument in my source at all so I needed my own version.

</aside>


Giving:

$$GSE = \mu_G  \frac{\sigma_{\log y}}{\sqrt{N}}$$

Where $$\sigma_{\log y}$$ is the standard deviation of $$\log y$$, _not_ the 'geometric standard deviation'. 



On the one hand, this is weird to compute. Until now we did not care about $$\sigma_{\log y}$$. But it does, for sufficiently high $$N$$, give the correct numerical difference between $$GM[y_i]$$ and the true $$GM[y]$$. 

(Note that according to Norris, when you have $$G$$ as an estimate of the true $$\mu_G$$, the formula you should use is $$GSE = G \frac{\sigma_{\log y}}{\sqrt{N-1}}$$. Just like the off-by-one in the standard deviation formula.)

Until now we have been computing statistics on the log transformed data and then just exponentiating. It seems to me that it would make a lot more sense to define the geometric standard error as the expected _ratio_ between $$GM[y_i]$$ and $$GM[y]$$, which would just be $$=e^{SE[\log y]}$$, instead of the expected _difference_. But I don't get to choose. Suffice to say, it strikes me as a bit weird.

## Other Means

By the way, there are other means than AM and GM. You can create all sorts of means using the same formula:

$$\E_f [ X ] = f^{-1} \E [ f(X) ]$$

* AM: $$f(x) = x$$
* GM: $$f(x) = \log x$$
* [Harmonic Mean](https://en.wikipedia.org/wiki/Harmonic_mean): $$f(x) = x^{-1}$$
	* Good for averaging _rates_ of things, like the rates of a car over different legs of a trip. (cf those tricky math questions like "a car travels 40 mph one way and 60 mph the other, what is it's average speed?")
* [Root Mean Square](https://en.wikipedia.org/wiki/Root_mean_square): $$f(x) = x^2$$
	* Used in electrical engineering, especially to average the strength of signals. For an alternating current, with $$AM=0$$, then $$RMS(x) = \sigma_x$$, the standard deviation.
* [Generalized means](https://en.wikipedia.org/wiki/Generalized_mean): screw it, $$f(x) = x^p$$ for any $$p$$.
	* $$\infty$$-mean: set $$p=\infty$$ and you get, weirdly $$\E_{\infty}[x] = \max(x)$$.
	* $$-\infty$$-mean: is just $$\min(x)$$
	* basically turn $$p$$ up to get more contributions from higher values and turn it down to get more contributions from lower ones.
	* just kidding, don't actually use anything except the first four, no one will know what you're talking about.

Generally speaking if you find yourself with data of the form $$y = f(x)$$, and you _know_ it's of the form $$y =f(x)$$, it probably will be a good idea to summarize it with statistics on $$f^{-1} y$$. These are just specific implementations of that idea.

