---
title: Research Log
layout: default
summary: Explorations notes.
---

Research logs documenting explorations, findings, and insights from various studies and investigations.

<ul>
{%- assign research = site.pages
  | where_exp: "p", "p.path contains 'content/05_Research_Log/'"
  | sort: "path" -%}
{%- for p in research -%}
  {%- if p.path != 'content/05_Research_Log/index.md' and p.draft != true -%}
    <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.name }}</a></li>
  {%- endif -%}
{%- endfor -%}
</ul>