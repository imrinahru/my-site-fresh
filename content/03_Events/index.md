---
title: Events
layout: default
summary: Notes and reflections from conferences, meetups, and workshops.
---

Recaps usually include key insights, my takes and links when available.

<ul>
{%- assign events = site.pages
  | where_exp: "p", "p.path contains 'content/03_Events/'"
  | sort: "path" -%}
{%- for p in events -%}
  {%- if p.path != 'content/03_Events/index.md' and p.draft != true -%}
    <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.name }}</a></li>
  {%- endif -%}
{%- endfor -%}
</ul>