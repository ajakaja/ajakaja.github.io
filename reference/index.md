---
layout: default
title: "References"
---

Reference Materials:

<div class="posts">
<ul class="list">
  {% for post in site.reference %}
    <li>
      <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
</div>