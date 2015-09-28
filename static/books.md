---
layout: page
permalink: /books/
title: "Books"
---

<ul class="post-index unstyled-list">
{% for book in site.data.books %}
  <li>
    <article>
      <a href="{{ book.url }}" itemprop="url">
      <img src="{{ book.image }}" class="preview" alt="{{ book.name }}" />
      <h1 itemprop="name">{{ book.name }}</h1>
      {% if book.description %}<p>{{ book.description }}</p>{% endif %}
      </a>
    </article>
  </li>
{% endfor %}
</ul>
