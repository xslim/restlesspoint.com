---
layout: page
permalink: /_about/
title: About
---

## Description

Have you ever sat at your desk, fidgeting in front of a clock that repetitively says, "no, not yet"? We all have. Restless Point takes us away from our computers and even comfortable apartments to new places around the globe. We'll tell you where to go and how to do it.

## Writers
<ul class="post-index unstyled-list">

{% for writer in site.data.writers %}
<li><article>
  {% avatar user=writer.github size=75 %}
  <h1 itemprop="name">{{writer.name}}<a href="{{writer.homepage}}"><i class="fa fa-external-link"></i></a></h1>
  <p itemprop="description">
    {{writer.bio}}
  </p>
</article></li>
{% endfor %}

</ul>
