---
title: Class Notes
layout: default
summary: Week-by-week notes across courses (Creation & Computation, Digital Fabrication, Digital Theory, etc.).
---

Class notes from OCAD University courses including Creation & Computation, Digital Fabrication, Digital Theory, and more.

<ul>
{%- assign classnotes = site.pages
  | where_exp: "p", "p.path contains 'content/06_Class_Note/'"
  | sort: "path" -%}
{%- for p in classnotes -%}
  {%- if p.path != 'content/06_Class_Note/index.md' and p.draft != true -%}
    <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.name }}</a></li>
  {%- endif -%}
{%- endfor -%}
</ul>