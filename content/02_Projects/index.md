---
title: Projects
layout: default
summary: Hands-on initiatives—toolkits, prototypes, workshops—that bring ideas into practice.
---

Click a title to dive into a project’s goals, progress logs and resources.

<ul>
{%- assign projects = site.pages
  | where_exp: "p", "p.path contains 'content/02_Projects/'"
  | sort: "path" -%}
{%- for p in projects -%}
  {%- if p.path != 'content/02_Projects/index.md' and p.draft != true -%}
    <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.name }}</a></li>
  {%- endif -%}
{%- endfor -%}
</ul>