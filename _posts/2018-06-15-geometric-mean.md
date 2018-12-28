---
layout: blog
title: "Geometric Mean and Standard Deviation"
footnotes: true
math: true
aside: true
category: notes
---

A friend is writing her master's thesis in a subfield where data is typically summarized using _geometric_ statistics: geometric means and geometric standard deviations (GSD), and sometimes even geometric standard errors -- whatever those are. And occasionally 'geometric confidence intervals' and 'geometric interquartile ranges'.

Most of which are (a) not something anyone really has intuition for and (b) surprisingly hard to find references for online, compared to regular 'arithmetic' statistics.

I was trying to help her understand these, but it took a lot of work to find easily-readable references online, so I wanted to write down what I figured out.

<!--more-->


## 1. What's the point of using a Geometric Mean?

The [geometric mean](https://en.wikipedia.org/wiki/Geometric_mean) of a dataset $$\b{x} = \{x_i\}$$ is given by:

$$\GM[\b{x}] = (\prod x_i)^{\frac{1}{n}}$$ 

Though it is easier to understand through this equation[^log]:

[^log]: I'm using $$\log x\equiv \log_e x \equiv \ln x$$ throughout this page. This is normal in some fields and totally weird in others. Sorry if it's weird.

$$\GM[\b{x}] = e^{\AM[\log \b{x}]}$$

For example:

$$\GM[1,2,3,4,5] = \sqrt[5]{1\cdot 2 \cdot 3 \cdot 4 \cdot 5} = e^{\frac{1}{n}(\log 1 + \log 2 + \log 3 + \log 4 + \log 5)} \approx 2.61 $$

A more meaningful example: if something increases by $$x_i$$ percents for $$i = (1 \ldots 10)$$, then its total increase is by $$\GM(x_i)^{10}$$. Multiplying by 10 different numbers gives the same result as multiplying by their geometric mean ten times.

(The base of the exponent and logarithm can be anything. It cancels out -- if you use $$\log_b$$, you raise $$b$$ to the power afterwards: $$\GM[\b{x}] = b^{\AM[\log_b \b{x}]}$$.)

(By the way: using $$\GM[]$$ and $$\AM[]$$ as notations for these things is definitely not conventional, but I think it makes it easier to read in settings where you're using both.)

This formula means that you are computing "the average of the _logarithms_ of your data", and then rescaling that back so the units work out. The same process is used for the geometric standard deviation / confidence intervals / interquartile ranges / whatever: (a) calculate the regular statistic on the log data, like $$\text{SD}[\log x]$$, then rescale back: $$\text{GSD}[x] = e^{SD[\log x]}$$.

The simplest case where log-transformed statistics are more useful is if we are dealing with data whose values range over many orders of magnitudes. This is true for things that we already use logarithmic scales for, like [brightness of stars](https://en.wikipedia.org/wiki/Apparent_magnitude), [loudness of sounds](https://en.wikipedia.org/wiki/Decibel), [acidity/basicity of solutions](https://en.wikipedia.org/wiki/PH), [sound frequency](https://en.wikipedia.org/wiki/Octave), or [power of earthquakes](https://en.wikipedia.org/wiki/Richter_magnitude_scale).

In all these cases, notice that you don't really know what the original measurements were. Like, presumably Richter measures the energy of the earthquake, but who knows what the values actually look like. Is a 7.5 Richter earthquake $$10^{15} J$$ of energy? $$10^{20} J$$? Who knows?[^richter] If we did statistics on the non-transformed values themselves, a single huge value like $$10^{20}$$ would become the mean of any data set, so our summary statistics would not summarize much of anything.

Basically, each of these scales is measuring the logarithms of _something_, but for reporting data we don't care as much what the 'something' is. If that's the case, I think you may as well just log-transform all your data and then be done with it. Don't worry about geometric means, just logarithm everything and take arithmetic means.

[^richter]: Actually I looked this up and Richter is totally different: it measures the _amplitude of the local tremor_, as recorded on a seismograph (the displacement of a needle, or whatever) which is then normalized based on the distance from the measurement to the epicenter of the earthquake. It turns out there are [tons of](https://en.wikipedia.org/wiki/Seismic_magnitude_scales) other scales, and some of them do a better job of measuring the actual energy of the earthquake.

The geometric mean and related statistics are for when you log-transform your data for analysis, and then want to transform it _back_. For instance, if you wanted to report the power of an earthquake in _Joules_, not in Richter, maybe because you're comparing it to other numbers reporting in Joules. Or, say, if the original data came in very sensible units like `parts per million` or `growth % year-over-year`, and you don't want to report a value that's been log-transformed to be unrecognizable.


---------


## 1b. But actually: when do you use it?

It's turning out to be surprisingly tricky to get a straight answer. [Some people](https://medium.com/@JLMC/understanding-three-simple-statistics-for-data-visualizations-2619dbb3677a) think the answer is 'almost always'. But it appears to be pretty subjective. 

Here's the basic reason, though:

* You want to use a geometric mean if it makes more sense for your data to be multiplied together, rather than added together.

(In fact, it may as well just be called a 'multiplicative mean', and then let's call the arithmetic mean the 'additive mean' at the same time.)

Here are some signs that this might be true:

- the factors that cause your data to vary at all apply 'multiplicatively', instead of 'additively'
	* that is, a factor's effect is proportional to the size of your data. This would be anything like an 'increase in efficiency' or an 'increased rate of occurrence'
	* in practice _most things_, apparently, work this way. Growth rates, heights, densities, power outputs, dollar amounts, disease rates, ...
	* but generally you may not be sure, or able to tell, if this is true, so here are some more signs:
* corollary: the logarithm of the data looks more like a normal distribution than the data itself (ie your data is [log-normal](https://en.wikipedia.org/wiki/Log-normal_distribution))
* the data definitely cannot go below 0, by definition of what you're measuring
* and effectively never goes _to_ 0, either, since that would make the geometric mean 0 also (though see note, below)
* the data do not have a constant translation factor (ie, if you could just as easily have measured $$x + 50$$ instead of $$x$$, then the logarithm is going to be meaningless.)
	* so don't take the GM of temperature scales, unless you translate them to Kelvin first
* the data _do_ have an arbitrary multiplicative factor (if you could have just as easily measured $$50x$$ instead of $$x$$, by changing units)
* the data are normalized against some constant value (so, if it is a % of _anything_)
* or, generally, the data are ratios, such as concentrations of a substance, rates of occurrence of an event, or changes in a value per some unit of time.

People online seem to think that many -- maybe even __most__ -- quantities turn out to vary multiplicatively, more or less. Probably many more than are being currently summarized using geometric means!

I'd say a general rule of thumb is: if you feel, for your type of data and some value of $$N$$, that a reasonable average of $$10^N$$ and $$10^{-N}$$ is $$1$$ rather than $$\frac{10^N}{2}$$, you should use a geometric mean. 

**Examples**:

* Company growth? Doubling revenue and halving revenue should average to $$1$$, not $$1.25$$. _Geometric_.
* Disease incidence? 1-in-100 and 1-in-10000 should probably average to 1-in-1000, not 1-in-200. _Geometric_.
* Microbe concentration? 1 part-per-million and 10000 parts-per-million should probably be 100 parts-per-million. _Geometric_. One bad lake shouldn't mess up them all.
* Heights of kids in a classroom? a bunch of 5.somethings and some 6.somethings --- it doesn't really matter, they'll be really close.
* Distances of fire stations to homes in a city? Tricky. I'd say _arithmetic_; you want your mean to be sensitive to that small cluster of houses that is weirdly 10x as far from service as everyone else.
* Split times on a 10km race? _Arithmetic_, you almost certainly want the mean to be one tenth of the total time.
* Speeds on each leg of a road trip, like $$60$$ mph and $$45$$ mph. Trick question, _neither_, you want the harmonic mean, which is pretty much only for speeds; see the end of this article.

Put differently: if massive values that are many orders of magnitude higher than others are _expected_ and should not basically delete all your other data, then use a geometric mean.

--------

## 1c. Important note about 0

If your data includes $$0$$, then the geometric mean is 0.

But wait. What if you measure, like, bacteria concentration in a lake (a definitely order-of-magnitude-based value), and get 0 because you don't detect anything? Or you detect 'no earthquakes' on some particular day?

And indeed, it turns out lots of scientists have data with 0s in it, and they've just been ... [working around it?](http://www.arpapress.com/Volumes/Vol11Issue3/IJRRAS_11_3_08.pdf)

Okay. Maybe it is _possibly_ reasonable to either:
* delete 0 values from your data, or 
* replace 0s with 'very small numbers that aren't 0', such as $$\e = 10^{-k}$$ for some $$k$$ that makes them smaller than all your non-zero values

...in order to keep your geometric mean from being literally 0. Why: maybe your instruments aren't sensitive to detect values that are very near 0 and just report 0 instead. Or maybe your data is a ratio like 'counts of a molecule per million liters', and it is assumed that, no matter what, if you sampled _enough_, the thing you're counting would show up at least once, if you kept looking, so it can't 'really' be 0.

But, and **this is important**: if there are enough zero data points that your _choice of $$\e$$_ for rounding is changing your geometric mean significantly, you are probably doing something wrong.

And if you decide instead of _delete_ the 0 values, you better report the result as "the average X when X was present", rather than just "the average X", or you're just [lying with statistics](https://www.amazon.com/How-Lie-Statistics-Darrell-Huff/dp/0393310728).

It's pretty confusing, though. You aren't wrong for being unsure. People use geometric means all the time with data that can be zero, maybe doing one of the above workarounds, and I _really_ doubt they're all handling it correctly or reporting it correctly afterwards.

Oh, and by the way: if you are geometric-meaning a bunch of, say, annual company growth percentages, and getting 0 -- say, for example, the data $$x = (-20\%, 0\%, 50\%, 120\%)$$ -- you're doing it wrong. Those growth rates are percentages and need to be changed to actual multiplicative factors $$x = (0.8, 1.0, 1.5, 2.2)$$, which gets rid of the zeroes. The only $$0\%$$ growth is your company going out of business.

----------

## 2. Equations for Geometric Statistics

Once again, the **geometric mean** is the log-transformed arithmetic mean:

$$\GM[x] = e^{\AM[\log x]} = \sqrt[n]{\prod_i x_i} = \prod_i \sqrt[n]{x_i}$$

By the [AM-GM inequality](https://en.wikipedia.org/wiki/Inequality_of_arithmetic_and_geometric_means), which is often just referred to as AM-GM, the geometric mean is _always_ less than the arithmetic mean (if the inputs are all positive. Otherwise all bets are off. Don't use GM on negative numbers!):

$$\AM[x] \geq \GM[x]$$

Another important relationship, which explains why GM works so well for _ratios_:

$$\GM \Big[ \frac{x_i}{y_i} \Big] = \frac{\GM[x_i]}{\GM[y_i]}$$

<div class="box">

**Important note on doing statistics with a computer**:

For the love of all things that are good, _do not program the formula $$\GM[x] = \sqrt[n]{\prod x_i}$$ into a computer (if you do not know what you are doing)_. Use a built-in library for it, or use one of the other two formulas ($$= e^{\AM[\log x]}$$ or $$= \prod \sqrt[n]{x_i}$$). Multiplying arbitrarily long lists of numbers together can overflow the data values in some programming languages, causing them to wrap around to negative numbers, rendering all your math utterly wrong. In particularly unfortunate cases, the resulting value will look _close_ to what it should be, yet have been computed an entirely incorrect way.

(If you're in a data-science-oriented language like R, you'll probably get away with it, cause they tend to avoid including [footguns](https://en.wiktionary.org/wiki/footgun). If you're in C, you won't.)

</div>


The **geometric standard deviation** (GSD) is the same transformation, applied to the regular standard deviation.

$$\text{GSD}[x] = e^{\text{SD}[\log x]}$$

This is going to be useful if and only it was a good idea to use a geometric mean on your data, and particularly if your data is _positively skewed_. Make sure you realize what this is saying. When using a Geometric Standard Deviation, the phrase "68.2% of values fall within one standard deviation of the mean" _means something different_:

The GSD, instead of giving an equal range on either side of the mean, gives an equal _factor_:

$$\begin{aligned} e^{AM \pm SD} &= e^{AM}e^{\pm SD} \\
  &= \GM[x] \text{GSD}[x]^{\pm 1} \\
  &= \GM[x] \; {}_{\div}^{\times} \; \text{GSD}[x] \\ 
  & \stackrel{!}{\neq} \GM[x] \pm \text{GSD}[x] \end{aligned} $$

Note that $$ \GM[x] \text{GSD}[x]^{\pm 1}$$ means the two values are $$(\GM[x] \text{GSD}[x], \frac{\GM[x]}{\text{GSD}[x]})$$. Clearly the GSD should be not too different from $$1$$, such that 68.2% of values fall in the range of $$\text{GSD}[x]^{\pm 1}$$.

Analogously, if your data is well-described by a GM + GSD, it's _not_ well-described by an AM + SD, because it should be positively skewed, while your SD would suggest that the data is spread evenly around the mean. (Consider how weird it would be to say that "X% of the data falls within $$\frac{\mu}{2}$$ and $$2 \mu$$" for non-skewed data like a normal distribution!)

If reporting confidence intervals for a given $$P$$-value, using geometric statistics, they will also not be the same distance from the geometric mean. For $$P=0.95$$, with z-score $$z = 1.96$$ (ie laughably permissible, false positives everywhere), the confidence intervals are:

$$\text{CI}_{0.95} = \GM[x] e^{\pm 1.96 \text{SD}[x]} = \GM[x] GSD^{\pm 1.96}$$

For interquartile ranges, it's:

$$\text{IQR} = \GM[x] e^{\pm 0.67 \text{SD}[x]} = \GM[x] GSD^{\pm 0.67}$$


---

What about **geometric standard error**? This would say "how far is the sample geometric mean $$\GM[x_i]$$ from the true geometric mean of the data $$\GM[\b{x}]$$?"

Reminder, since this one is a little less common: the [standard error](https://en.wikipedia.org/wiki/Standard_error) (or more precisely, the "standard error of the mean") of a set of $$N$$ samples drawn from a normal distribution $$\cal{N}(\mu, \sigma^2)$$ is the "standard deviation of the mean of $$N$$ values from the _true_ mean of the distribution" and is given by $$\text{SE}[x,N] = \frac{\sigma_x}{\sqrt{N}}$$. Intuitively, as we sample more values from the normal distribution, our computed mean is also a normally distributed random variable, but has a _smaller_ standard deviation, by a factor of $$\frac{1}{\sqrt{N}}$$.


This measurement is actually reported in papers sometimes (apparently), but hard to find a good equation for online. It turns out that it's given by:

$$\text{GSE}[x, N] = \frac{\mu_G}{\sqrt{N}} \sigma_{\log x}$$

Where $$\sigma_{\log x}$$ is the standard deviation of $$\log x$$, _not_ the 'geometric standard deviation', and $$\mu_G$$ is the _true_ geometric mean of $$x$$ (or at least, one that you have _way_ more confidence in, like from a separate and much larger study). 

<aside class="toggleable" id="analysis" placeholder="<b>Aside</b>: Derivation of Geometric Standard Error"> 

This derivation is adapted from [Norris](https://projecteuclid.org/download/pdf_1/euclid.aoms/1177731830) with some jargon and theory removed, and replaced with my inexpert and likely faulty analysis.

Writing $$\mu_G = \GM[x] = e^{\E [\log x]}$$, the true geometric mean of the distribution (assuming our data's logarithm is normally distributed, as above):

$$\begin{aligned} GSE^2 &= \E[(\GM[x_i] - \mu_G )^2] \\
&= \mu_G^2 \E [ (\frac{\GM[x_i]}{\mu_G} - 1)^2] \\
\end{aligned}$$

First we simplify the first term in the expectation:

$$\frac{\GM[x_i]}{\mu_G} = \frac{e^{\frac{1}{N} \sum \log x_i }}{e^{\E [\log x]}} = e^{\frac{1}{N} \sum \log x_i - \E[\log x]}$$

Next we argue that, because for sufficiently large $$N$$, $$\frac{1}{N} \sum \log x_i - \E[\log x] \Ra 0$$, ie, as the sample log mean approaches the true log mean, we can approximate the exponential with its Taylor series $$e^x \approx 1 + x$$. 


To first order this gives:

$$\begin{aligned} GSE^2 
&\approx \mu_G^2 \E [ (\frac{1}{N} \sum \log x_i - \E[\log x])^2 ] \\
&=\frac{\mu_G^{2}}{N^2} \E [\sum (\log x_i - \E[\log x]))^2 ] \\
&= \frac{\mu_G^2}{N} \E [(\log x_i - \E[\log x])^2] \\
&=  \frac{\mu_G^2}{N} \sigma^2_{\log x} \\
GSE &= \frac{\mu_G}{\sqrt{N}} \sigma_{\log x} \end{aligned}$$

----

**Analysis of the approximation**:

When $$f(X)$$ is analytic over the range of $$X$$ we can compute $$\E[f(X)]$$ by [writing it as a Taylor series](https://en.wikipedia.org/wiki/Taylor_expansions_for_the_moments_of_functions_of_random_variables) around the mean $$\E[X] = \bar{X}$$:

$$\E[f(X)] \approx \E[f(\bar{X}) + f'(\bar{X}) (X - \bar{X})) + \frac{f''(\bar{X})}{2}  (X - \bar{X})^2 + \ldots]$$

But since expectations are linear we can write this as:

$$\E[f(X)] \approx f(\bar{X}) + 0 + \frac{f''(\bar{X})}{2}  \sigma^2_X + \ldots$$

(Where the second term disappeared because $$\E[X - \bar{X}] = \E[X] - \E[X] = 0$$.)

But it is _not_ always valid to truncate this expression at the second-order term. The higher order terms each have a factor of $$\E[(X- \bar{X})^n]$$, and there is no particular reason this should not be huge or even infinite. For $$\E[f(X)] \approx f(\bar{X}) + f''(\bar{X}) \sigma^2_X$$, we require that the remaining terms in the series be small enough to ignore:

$$\frac{f^{(n)}}{n!}(\bar{X}) \E[(X - \bar{X})^n] \approx 0 \; [\text{ for } n > 2] $$

---------

In our case, let's write the exponent as $$\D = \frac{1}{N} \sum_N (\log x_i - \E[\log x])$$, and use $$\sigma = \sigma_{\log x}$$ for the standard deviation of $$\log x$$. By the [Central Limit Theorem](https://en.wikipedia.org/wiki/Central_limit_theorem), as $$N \ra \infty$$, $$\D$$ converges to a normal distribution with $$\mu = 0$$, $$\sigma_{\D}^2 = \frac{\sigma^2}{N}$$, even if $$\log x$$ is not normally distributed, as long as $$\sigma^2$$ is finite.

In this case, is it reasonable to truncate $$\E[f(\D)] = \E[(e^\D - 1)^2]$$ to its first-order Taylor series $$\E[f(\D)] \approx f(\bar{\D}) + \frac{f''(\bar{\D})}{2} \frac{\sigma^2}{N} = \frac{\sigma^2}{N}$$?

I tried to work this out for a while, but realized that we don't necessarily know _how_ fast the distribution of $$\D$$ converges to $$\cal{N}(0, \frac{\sigma^2}{N})$$, so we can't say what the error is for a particular value of $$N$$. However, if $$\log x$$ is already normally distributed (ie, we are dealing with truly lognormal data), then we can compute the size of the terms of we are dropping using the equation for the [moments](https://en.wikipedia.org/wiki/Normal_distribution#Moments) of a normal distribution:

$$\E[X^n]= \sigma^n n!! \; [n \text{ even}]$$

$$\Ra \E[\D^n] = (\frac{\sigma}{\sqrt{N}})^n n!! \; [n \text{ even}]$$

And because $$\bar{\D} = 0$$, $$f(\bar{\D}) = 0$$ and $$f^{(n)}{(\bar{\D})} = 2^n - 2$$. Writing $$n = 2k$$ :

$$f(\D) \approx \sum_{n \geq 2, \text{ even}} \frac{(2^{n} - 2) n!!}{n!} (\frac{\sigma}{\sqrt{N}})^n < \sum_{n \geq 2, \text{ even}} \frac{2^n n!!}{n!} (\frac{\sigma}{\sqrt{N}})^n $$

The ratio between successive terms is $$\frac{f_{n+2}}{f_n} = \frac{1}{n+1}(\frac{2\sigma}{\sqrt{N}})^2$$ so the series requires $$N > 4 \sigma^2$$ to converge and $$N \gg 4 \sigma^2$$ to converge rapidly enough to ignore later terms. Specifically, the first term we are dropping is $$n=4$$, which is $$\frac{16}{3} (\frac{\sigma^{2}}{N})^2$$, in case you want to compute an exact value to be sure it's trivial. Which I guess doesn't tell us much more: just that we need $$N \gg \sigma^2$$.

Disclaimer: I am not a mathematician. Please don't trust me.

</aside>

Since you don't normally know $$\mu_G$$, you can use the sample mean $$\GM[x]$$, but then, like with the regular standard deviation and error formulas, you have to [change](https://en.wikipedia.org/wiki/Bessel%27s_correction) $$N \ra N-1$$:

$$\text{GSE}[x, N] =  \frac{\GM[x]}{\sqrt{N-1}} \text{SD}[\log x]$$

What this means is that the distribution for "our calculation of $$\GM[x]$$ from $$N$$ samples" has probability distribution:

$$\GM_N[x] \sim \cal{N}[\mu_G, \frac{\mu_G}{\sqrt{N}} \sigma_{\log x}]$$

And the previous formula is our best estimate of it, given a sample of $$N$$ values.

On the one hand, this is weird to compute. Until now we did not care about $$\sigma_{\log x}$$. (And I assume, but am actually not sure, that $$\sigma_{\log x}$$ has another factor of $$\frac{1}{N-1}$$ in it, since it's _also_ computed from the sample?) But it should, for sufficiently high $$N$$, give the correct numerical difference between $$\GM[x]$$ and the true $$\mu_x$$. 

I'm not sure it's a good idea to use the GSE, because I don't think people will know how to think about it. It is a bit unintuitive: it is the only statistic we've talked about that is _additive_ (so it's talking about the difference between $$\GM_N[x] - \mu_G$$, rather than $$\frac{GM_N[x]}{\mu_G}$$). It's based on the idea that, even for log-normal data, the sample geometric mean $$\GM_N[x]$$ is normally distributed (notice that I did not say _log_-normal, though it may also be that! Even log-normal distribution samples are normally distributed for high-enough $$N$$! They are just also massively skewed). Maybe some subfield thinks this makes perfect sense as a summary statistic -- I don't know. I'd avoid it.


## Trivia: Some Other Means

By the way, there are other ways to summarize data than AM and GM. You can create all sorts of means using the same formula:

$$\E_f [ X ] = f^{-1} \E [ f(X) ]$$

For instance:

* AM: $$f(x) = x$$
* GM: $$f(x) = \log x$$
* [Harmonic Mean](https://en.wikipedia.org/wiki/Harmonic_mean): $$f(x) = x^{-1}$$
	* Good for averaging _rates_ of things, like the rates of a car over different legs of a trip. If you travel $$60$$ mph one way and $$40$$ mph the other way over the same distance cause of some traffic, then your average speed is $$\frac{2}{\frac{1}{60} + \frac{1}{40}} \approx 48 \text{ mph}$$, because it takes the same times as if you went $$48$$ mph the whole time.
* [Root Mean Square](https://en.wikipedia.org/wiki/Root_mean_square): $$f(x) = x^2$$
	* Used in electrical engineering, especially to average the strength of electrical signals. Interestingly, when $$\AM[x]=0$$ (such as for an alternating current), then $$\text{RMS}(x) = \sigma_x$$, the regular standard deviation.
* [Generalized means](https://en.wikipedia.org/wiki/Generalized_mean): screw it, $$f(x) = x^p$$ for any $$p$$.
	* $$\infty$$-mean: set $$p=\infty$$ and you get, weirdly, $$\E_{\infty}[x] = \max(x)$$.
	* $$-\infty$$-mean: it's just $$\min(x)$$
	* basically turn $$p$$ up to get more contributions from higher values and turn it down to get more contributions from lower ones.
	* just kidding, don't actually use anything except the first four, no one will know what you're talking about if you use this.

Generally speaking if you find yourself with data of the form $$y = f(x)$$, and you _know_ it's of the form $$y =f(x)$$, it probably will be a good idea to summarize it with statistics on $$f^{-1} (y)$$. These are just specific implementations of that idea. The geometric mean turns out to be the safest option, in general, because $$x \mapsto \log x$$ has the nice property of smoothing out any kind of polynomial $$\ra p \log x$$ and exponential $$e^x \mapsto x$$.

*[disclaimer: I am not a mathematician. What I wrote here is my best understanding at the time. Let me know if you think something is wrong or incomplete.]*

