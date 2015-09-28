---
layout: page
permalink: /books/
title: "Books"
---

<ul class="post-index unstyled-list">
{% for book in site.data.books %}
	<li>
		<article itemscope itemtype="http://schema.org/Article">
			<a href="{{ book.url }}" itemprop="url">
				{% if book.image %}<img src="{{ book.image }}" class="preview" alt="{{ book.name }}" itemprop="image">{% else %}<img src="/images/{{ site.logo }}" class="preview" itemprop="image">{% endif %}
				<h1 itemprop="name">{{ book.name }}</h1>
				{% if book.description %}<p itemprop="description">{{ book.description }}</p>
			</a>
		</article>
	</li>
{% endfor %}
</ul>
