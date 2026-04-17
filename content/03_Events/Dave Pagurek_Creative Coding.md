---
title: Dave Pagurek on Creative Coding
date: 2026-04-08
tags:
  - event
location:
draft: false
summary:
---
## Overview

**What / When / Where / Who**

- **What:** Workshop / talk on creative coding, tool-building, and career pathways
- **Who:** Dave Pagurek
- **Focus:** The relationship between making art and building tools, especially through creative coding frameworks like p5.js, WebGL, and shader-based systems
- **Themes:**
    - Tool-building as artistic practice
    - Systems for generative visuals
    - Open-source ecosystems and education in graphics

---

## Key Takeaways

- **Art and tool-making are intertwined**
    - Inspiration comes from _making art while building tools_.
    - Instead of only producing final outputs, design systems that _generate visuals_.
    - Delivering a tool can itself be the artwork.
- **Creative coding as system design**
    - Build modular systems (components, nodes, graphs) rather than isolated sketches.
    - Breaking visuals into smaller parts makes them easier to manipulate and recombine.
    - JSON-based structures can define relationships (nodes, edges, effects).
- **Limitations of current tools**
    - Many graphics tools are not intuitive for exploratory workflows.
    - Silhouette-based or isolated programs are restrictive.
    - There is a gap between research systems and usable creative tools.
- **Importance of workflow and interface**
    - “Code as interface”: how code is structured affects usability.
    - The _feeling of interaction_ matters more than technical correctness.
    - Designing scaffolding is key to making complex systems usable.
- **Open source as distribution and community**
    - Open source enables reach and trust.
    - Contribution culture (e.g., pull requests since ~2021) builds community learning.
    - Projects like OSACC (Open Source Art & Creative Coding) support shared growth.
- **Shaders and GPU thinking**
    - Shaders are functions executed in parallel per pixel or vertex.
    - They enable real-time visual transformations (e.g., gradients, warping).
    - GPU workflows (WebGL, emerging WebGPU) are powerful but still complex to teach.
- **Future direction: abstraction over complexity**
    - Hide low-level pipelines initially; reveal complexity gradually.
    - Make shaders and graphics programming more accessible.
    - Use higher-level systems to generate shader code (e.g., JavaScript → GLSL).

---

## Slides & Media

- ![Slide thumbnail](./img/slide.png)
- Recording: _(not provided)_

---

## Notes (Detailed)

### References & Inspirations

- Chris Landreth (2004)
    - Built abstract visuals in Autodesk Maya while making films
    - Example of blending artistic experimentation with production tools
- “The Pixar Shorts: A Short History”
    - Shows evolution of tools alongside artistic style
- Creative coding culture:
    - Processing
    - p5.js
    - Community-driven learning and experimentation

---

### Tooling & Systems

#### Butter (tool by Dave Pagurek)

- UI built with React
- Structure:
    - JSON-based graph (nodes, edges)
    - Effects layered on components
- Each component runs as a p5.js sketch
    - Allows integration of physics and generative behaviors
- Evolution:
    - Started as a **single-component editor (2020)**
    - Expanded into a **video editor-like system**
    - Supports:
        - Keyframes
        - Timeline / frame rewinding
        - Exporting (PNG, etc., though sometimes imperfect)

---

### Graphics & Technical Concepts

#### Vector and Stroke Systems

- Challenge: connecting digital vector strokes into continuous forms
- Not well supported in open-source ecosystems yet

#### Shaders

- Run in parallel on GPU
- Types:
    - Per-pixel (fragment shaders)
    - Per-vertex
- Used for:
    - Warping meshes
    - Generating gradients and filters
- Key idea:
    - Define a function → applied to every pixel

#### Mesh Warping

- Vertex shaders manipulate mesh geometry
- Normals define surface orientation
- Smoothness is simulated mathematically
- Tradeoff:
    - Too few slices → visible “kinks”
    - More subdivisions → smoother deformation

#### Performance

- Traditional loops (`for`) are too slow for large-scale visuals
- GPU parallelism is essential
- Threading allows multiple tasks simultaneously

---

### p5.Strands

- Experimental system extending p5.js
- Focus:
    - Color-based logic in shaders
    - Simplifying shader creation
- Abstracts away:
    - Positioning and other low-level logic
- Goal:
    - Make shader programming accessible

---

### Education & Pedagogy

- Teaching graphics is difficult because:
    - GPUs are powerful but complex
    - Traditional teaching (e.g., OpenGL) requires lots of boilerplate
- Historical context:
    - Early 2000s: OpenGL pipelines (coloring pixels on triangles)
- Need:
    - Better scaffolding for learners
    - Systems that allow immediate visual feedback
- Approach:
    - Hide complexity first
    - Introduce deeper concepts gradually

---

### Ecosystem & Technologies

- Web graphics:
    - three.js
    - WebGL
    - Emerging: WebGPU
- Other topics:
    - Gaussian splats (3D point-based rendering)
    - Luma AI (WebGL-based tools)

---

### Design & Interaction

- Motion design systems:
    - Easing functions (e.g., Apple-style kinematic easing)
    - Keyframes and timing control
- Interface design:
    - Inspired by tools like Figma
    - Also references older tools like Flash (timeline + panels)
- Key principle:
    - The _experience of interaction_ matters more than internal complexity

---

### Career & Practice

- Pathways:
    - Creative coding + commissions
    - Work such as Shopify themes, interactive pieces
- Skills:
    - Strong foundation in JavaScript and graphics
    - Understanding of systems, not just visuals
- Community:
    - Learning through contribution (pull requests, open source)
    - Trust builds over time through participation

---

## Related Notes

- Creative coding as **infrastructure, not just output**
- Tool-building as a **form of authorship**
- Shift from **making images → making systems that generate images**
- “Providing a ground for others to grow” as a creative goal