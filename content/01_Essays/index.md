---
title: Essays
layout: page
summary: Long-form reflections on life, design, and technology.
---

These essays capture what’s been on my mind lately and where I stand, newest ones first.

<ul>
{%- assign essays = site.pages
  | where_exp: "p", "p.path contains 'content/01_Essays/'"
  | sort: "path" -%}
{%- for p in essays -%}
  {%- if p.path != 'content/01_Essays/index.md' and p.draft != true -%}
    <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.name }}</a></li>
  {%- endif -%}
{%- endfor -%}
</ul>