---
layout: default
title: "Notes"
---

Notes on stuff.

<div class="posts">
<ul class="list">
  {% for post in site.notes %}
    <li>
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}

</ul>
</div>
