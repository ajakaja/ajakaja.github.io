---
layout: default
title: "Notes"
---

I find it useful to return to previous subjects I've studied when I've learned more elegant machinery. As such, here are some abbreviated notes which might be useful on a few undergraduate-level subjects.

<div class="posts">
<ul class="list">
  {% for post in site.notes %}
    <li>
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
</div>
