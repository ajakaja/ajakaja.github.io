---
layout: default
title: "Miscellaneous"
---

Miscellaneous things

<div class="posts">
<ul class="list">
  {% for post in site.misc %}
    <li>
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
</div>
