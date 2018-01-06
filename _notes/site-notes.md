---
layout: article
title: "Site-building notes"
category: notes
---

After experimenting with some other ways of running person blogs I'm convinced that using Jekyll on Github pages is by far the easiest way to go.

I like Markdown; I think it's a Good Thing and it's amazing it took so long to come around. Markup languages like html are clutzy and hard to write articles in. Wysiwyg editors are generally garbage, and do things like mess up copy-pasting. Markdown is the first web-ready way of writing that I've actually wanted to write in.

I like Jekyll. Almost-all websites don't need more than the most basic of "parse templates" functionality. It's excellent to not be using anything like PHP. It's excellent to have it more-or-less work out of the box.

I've borrowed heavily from [Jekyll Now](http://github.com/barryclark/jekyll-now) for the initial setup. I've installed MathJax and set up an RSS atom.xml that might work.

Github Pages is lovely. Simple text-only websites don't 'feel' like they should require managing a server, which is fairly easy to do badly but a nightmare to Do Right. Most "host your site for you" platforms, though, are rich applications (WordPress, Blogger, any of a zillion blog-making sites) that are very much masking the fact that you're making a website. I like control over the site; I just don't want to do the labor of configuring a webserver and running a host.

Not having to pay for hosting is a gracious move on their part, as well, though it's not as important to me. An earlier attempt at running a personal blog was hosted on a small EC2 instance and I was very sad to have to do a lot of effort in setting up/configuring Apache and whatnot, and in having to figure out if/how I would solve the host swapping out

I tried to use [KaTeX](https://github.com/Khan/KaTeX), which is Khan Academy's faster version of MathJaX's LaTeX rendering for websites. MathJax is great (other ways of writing math, like MathML or inline images, are so awful they're not worth considering), but the latency and re-flows that occur when the page is rendered are very blatant. I had, I realize, accepted them as a fact of life when using math until KaTeX talked about solving them. However, I found that MathJax is integrated with Kramdown (Jekyll's markdown processor), which does some pre-processing by turning equations in $$ $$'s into \<script type="math/tex"> tags, which KaTeX expects to do for itself. There's an issue on Github to implement a Kramdown math engine for incorporating KaTeX, which I'd consider trying to do someday that's not now (since my project is getting this blog together).

I found that I wish my site was in a subfolder of the root git directory, but cursory googling showed that it was tricky to get that to work with Github Pages. The reason this would be nice is that I could download KaTeX or other JS libraries as Git submodules and then not have to specifically direct Jekyll to not serve the entire Git directory on the website. (I suppose I would also need a makefile of some type to copy the files over into my /js folder but that usually happens eventually anyway.)

I installed [jquery-inline-footnotes](http://andrew.pilsch.com/blog/2014/12/05/stylish-markdown-footnotes-w-jquery/) in an effort to visible 'aside' boxes on the side of the screen, with the bonus feature that they turn into inline accordion footnotes on smaller devices. It seems to work well enough, though the customization is a little wonky because you have to set your screen width for the transition between footnote and sidenote manually in two places. I had to copy the un-minified .scss file into my site so I could modify it more. I changed a line so the footnote would be on the right side of the text instead of the left, and made (fixed?) superscripts so they were actually super-scripted in the main text, but not in the footnote.

Found some bugs:
If you have use the same footnote twice, (undefined) appears in the margin, the link to go to the footnote doesn't work, and the numbering becomes different between the body and the footnotes.Also observing footnotes overlapping - need a way to spread them out.

"Uncaught TypeError: footnotes.overlaps is not a function"

Might be missing a module.

For now I've copied the JS, CSS, and font files for these plugins over. What I'd prefer to do is have them included as Git submodules, but, as far as I know I would need a build or deployment script that then copies them into the correct /css, /js, etc folders before running the site. I'd rather not do that (definitely because Github Pages won't let me, but also because it's annoying.)

Kramdown + MathJax with KateX as the actual parser has some weird effects. Namely, MathJax creates script tags where KateX creates spans; I've got some JS that runs on the page to rewrite MathJax output into KateX input. Also, MathJax puts CDATA tags around math that includes, among other things, < and > signs. I haven't figured out how to disable this, so I've instead got the JS just deleting the CDATA tags using the worst method, string.replace() calls. This witchcraft is to avoid figuring out a more elegant way to handle Katex + Kramdown until someone (maybe me?) makes a plugin for it.

I figured out, mostly, how to do image includes in Jekyll from [this article](https://eduardoboucas.com/blog/2014/12/07/including-and-managing-images-in-jekyll.html). I had some issues with included HTML being escaped, though.

----------

Issues with KateX:
* commas after equations often flow onto the next line
* fraction lines disappear randomly depending on the zoom. It's subpixel something or another in Chrome, but, yeah, it's pretty annoying. It's an [open bug](https://github.com/Khan/KaTeX/issues/824) in KateX)
* macros would be *super useful*, since I write \mathbf{} 100x a page.
* as mentioned above, the KateX integration with MathJax is wonky. But it still looks pretty good.
