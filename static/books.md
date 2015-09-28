---
layout: page
permalink: /books/
title: "Books"
description: "Books we read"
tags: [books, recomendations]
a_tag: personblog000-20
---

<ul class="post-index unstyled-list">
{% for book in site.data.books %}
{% assign url = book.url %}
{% assign img = book.image %}
{% if book.asin %}
  {% capture url %}http://amzn.com/{{ book.asin}}/?tag={{ page.a_tag }}{% endcapture %}
  {% capture img %}http://images.amazon.com/images/P/{{ book.asin }}.01.THUMBZZZ.jpg{% endcapture %}
{% endif %}
  <li>
    <div>
      <a href="{{ url }}" itemprop="url">
      <img src="{{ img }}" class="thumb" alt="{{ book.name }}" />
      <h4 itemprop="name">{{ book.name }}</h4>
      {% if book.description %}<p>{{ book.description }}</p>{% endif %}
      </a>
    </div>
  </li>
{% endfor %}
</ul>
