---
layout: page
permalink: /books/
title: "Books"
description: "Books we read"
tags: [books, recomendations]
---

<ul class="post-index unstyled-list">
{% for book in site.data.books %}
  <li>
    <div>
      <a href="{{ book.url }}" itemprop="url">
      <img src="{{ book.image }}" class="thumb" alt="{{ book.name }}" />
      <h4 itemprop="name">{{ book.name }}</h4>
      {% if book.description %}<p>{{ book.description }}</p>{% endif %}
      </a>
    </div>
  </li>
{% endfor %}
</ul>
