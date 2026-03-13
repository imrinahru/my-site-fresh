---
title: TouchDesigner Workshop
date: 2026-02-16
tags:
  - event
location: 115 McCaul
draft: false
summary:
---

# TouchDesigner Beginner Workshop

**Instructor:** Greg  
**Location:** 115 McCaul  
**Organizer:** Derivative

---

# Overview

> [!summary]  
> **TouchDesigner** is a node-based visual programming environment used for **real-time interactive media**.

Common uses:

- LED installations
    
- Concert visuals
    
- Projection mapping
    
- Immersive environments
    
- Interactive museum exhibits
    

Industries hiring TouchDesigner developers:

- tech companies
    
- automotive companies
    
- architecture firms
    
- museums (e.g. Smithsonian)
    
- military visualization systems
    

> [!tip]  
> Many organizations prefer **in-house TouchDesigner specialists**, which makes it a **well-paid niche skill**.

---

# Context: Other Creative Tools

|Tool|Typical Use|
|---|---|
|Adobe After Effects|Motion graphics (mostly 2D)|
|Blender|3D modeling|
|Resolume|VJ visuals|
|Processing|Creative coding|

> [!info]  
> **TouchDesigner advantage:**  
> real-time computation + hardware connectivity + visual programming.

---

# Business Strategy Insight

Instructor described the ecosystem jokingly as **“Snake Eater.”**

Idea:

1. Studios build systems in TouchDesigner
    
2. Clients must keep TouchDesigner licenses
    
3. Clients remain within the ecosystem
    

---

# System Requirements

- Windows
    
- macOS
    

> [!warning]  
> Linux users often still need **Windows machines for production operations**.

---

# Interface Basics

## Network Structure

**Network:** collection of operators  
**Operator:** a node with a viewer

Signal flow:

Left → Right

---

## Component Operators

Component operators behave like **folders**.

Characteristics:

- contain other operators
    
- have **gray outlines**
    

---

# Navigation Shortcuts

|Shortcut|Function|
|---|---|
|Tab / Double Click|open operator menu|
|U|go up one level|
|I|go inside component|
|H|home view|
|P|open parameter window|
|Q|toggle auto-homing|

---

# Operator Families

|Operator|Meaning|
|---|---|
|TOP|texture operators (2D pixels)|
|CHOP|channel operators (signals / numbers)|
|DAT|data operators|
|SOP|surface operators (3D geometry)|
|POP|GPU point operators|
|MAT|materials|
|COMP|components / containers|

---

# TOP — Texture Operators

Handles **2D image data**

Examples:

- movies
    
- images
    
- render output
    

---

# CHOP — Channel Operators

Handles **time-based numeric signals**

Examples:

- audio signals
    
- skeleton tracking
    
- MIDI
    
- OSC
    
- control signals
    

---

# DAT — Data Operators

Handles structured data:

- tables
    
- CSV
    
- strings
    
- Python scripting
    

Used for:

- data visualization
    
- automation
    

---

# SOP — Surface Operators

Used for **3D geometry generation**

Examples:

- procedural geometry
    
- L-systems
    
- particle systems
    

Runs mostly on **CPU**.

---

# POP — Point Operators

New GPU-accelerated particle system.

Used for:

- particles
    
- large simulations
    
- high-performance effects
    

---

# Node Viewing

Enlarge viewer with **middle-click drag**.

Right-click nodes to inspect channel outputs.

![[Pasted image 20260207111542.png]]

---

# Parameter Window

Press **P** to open parameter panel.

This allows dynamic control of operators.

---

# Value Ladder

Interactive parameter editing.

Steps:

1. Left click parameter value
    
2. Select range ring
    
3. Move mouse left/right
    

![[Pasted image 20260207112237.png]]

---

# Mediapipe Hand Tracking

Using **Google MediaPipe integration**.

Repository:

[https://github.com/torinmb/mediapipe-touchdesigner](https://github.com/torinmb/mediapipe-touchdesigner)

Capabilities:

- webcam hand tracking
    
- extract hand coordinates
    
- convert hand data into particle systems
    

Setup:

1. download `.tox`
    
2. place in project folder
    
3. import into network
    

---

# Null SOP (Checkpoints)

Null nodes are used as **network markers**.

Purpose:

- organize networks
    
- reference important outputs
    

![[Pasted image 20260207114705.png]]

---

# SOP → POP Conversion

Convert geometry to particle systems.

Drag SOP output to POP input.

![[Pasted image 20260207114846.png]]

Use **Merge** nodes to combine multiple data streams.

---

# Particle POP Basics

Key parameters:

|Parameter|Meaning|
|---|---|
|Max Number|total particle limit|
|Birth Rate|particles per frame|
|Life Expect|particle lifetime|

---

# GPU Limits

Large particle systems depend heavily on GPU power.

My system froze when particle count exceeded GPU capacity.

![[Pasted image 20260207120701.png]]

Maximum particle load my computer handled:

![[Pasted image 20260207120923.png]]

---

# Node Interaction

You can open separate viewer windows from nodes.

![[Pasted image 20260207121223.png]]

Interactive editing mode:

1. click **sparkle icon**
    
2. right click elements
    

![[Pasted image 20260207121519.png]]

---

# Geometry Attributes

![[Pasted image 20260207133238.png]]

Common attributes:

|Attribute|Meaning|
|---|---|
|P|position|
|P1/P2/P3|X/Y/Z|
|N|normal|
|T|tangent|
|Tex|texture coordinate|

Attributes can be used for **mathematical operations** across nodes.

---

# Math Mix POP

Used to blend or modify particle attributes.

![[Pasted image 20260207133828.png]]

---

# Cache POP

Stores previous frames.

![[Pasted image 20260207135412.png]]

Example configurations:

|Cache|Output|
|---|---|
|3|-3|
|1|-1|
|10|-10|

Higher values create more dramatic temporal effects.

![[Pasted image 20260207135529.png]]

![[Pasted image 20260207135712.png]]

Position attribute example:

![[Pasted image 20260207135843.png]]

> [!warning]  
> Keep cache small (≤3) to avoid memory overload.

---

# Particle Direction Control

Attributes can drive parameters.

Example:

- particleDirection → initVelocity
    

![[Pasted image 20260207141020.png]]

---

# Rendering Pipeline

To convert **3D geometry → 2D image**

You need:

1. Geometry COMP
    
2. Camera COMP
    
3. Render TOP
    

Workflow:

- create SOP geometry
    
- place inside Geometry COMP
    
- render using camera
    

![[Pasted image 20260207141756.png]]

---

# Materials

Apply materials by dragging MAT nodes onto geometry.

![[Pasted image 20260207142040.png]]

Shortcut:

Alt + L

![[Pasted image 20260207143617.png]]

---

# Audio Analysis

Convert audio signal → frequency spectrum.

![[Pasted image 20260207151122.png]]

Using **Audio Spectrum CHOP**

Time domain → frequency domain.

![[Pasted image 20260207151233.png]]

![[Pasted image 20260207151343.png]]

![[Pasted image 20260207151535.png]]

Audio data can drive visuals.

---

# Cache vs Trail

|Node|Function|
|---|---|
|Cache|stores limited past frames|
|Trail|records motion history|

Example:

Trail storing **2 seconds of motion**.

![[Pasted image 20260207152908.png]]

---

# Math Mix

Blends attributes together.

![[Pasted image 20260207152703.png]]

![[Pasted image 20260207153403.png]]

---

# Rendering Pipeline Summary

Core structure:

Geometry COMP  
      ↓  
Camera  
      ↓  
Render TOP

Material parameters connect through **constant lines**.

![[Pasted image 20260207153814.png]]

![[Pasted image 20260207154422.png]]

![[Pasted image 20260207154507.png]]

---

# Coloring Techniques

Using **Lookup Tables**

Setup:

- depth → top input
    
- ramp → bottom input
    

Add color with:

- Ramp TOP
    
- Color Generator
    

![[レコーディング 2026-02-07 160102.mp4]]

---

# Resources

Official tutorials

[https://learn.derivative.ca](https://learn.derivative.ca)