---
title: Reading Notes
layout: default
summary: Highlights, critiques, and work-in-progress notes from books, essays, and articles.
---

Below you’ll find books and readings that I'm made of.

<ul>
{%- assign readings = site.pages
  | where_exp: "p", "p.path contains 'content/04_Reading_Notes/'"
  | sort: "path" -%}
{%- for p in readings -%}
  {%- if p.path != 'content/04_Reading_Notes/index.md' and p.draft != true -%}
    <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.name }}</a></li>
  {%- endif -%}
{%- endfor -%}
</ul>
