---
layout: page
published: true
permalink: /travel/
title: Spots
---

A travel articles

<ul class="post-index unstyled-list">
{% for post in site.categories.travel %}
{% assign readtime = post.content | number_of_words | divided_by:200 %}
	<li>
		<article itemscope itemtype="http://schema.org/Article">
			<a href="{{ post.url }}" itemprop="url">
				{% if post.image.thumb %}<img src="/images/{{ post.image.thumb }}" class="preview" alt="preview image" itemprop="image">{% else %}<img src="/images/{{ site.logo }}" class="preview" alt="preview image" itemprop="image">{% endif %}
				<h1 itemprop="name">{{ post.title }}</h1>
				<p itemprop="description">{{ post.description }}</p>
				<p class="entry-meta">
					<i class="fa fa-clock-o"></i> Reading time ~{% if readtime <= 1 %}1 min{% else %}{{ readtime }} min{% endif %} &#8901; <span class="entry-date"><time datetime="{{ post.date | date_to_xmlschema }}" itemprop="datePublished" class="published{% unless page.modified %} updated{% endunless %}">{{ post.date | date: "%B %d, %Y" }}</time></span>
				</p><!-- /.entry-meta -->
			</a>
		</article>
	</li>
{% endfor %}
</ul><!-- /.unstyled-list -->