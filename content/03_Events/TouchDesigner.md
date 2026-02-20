---
title: TouchDesigner Workshop
date: 2025-11-16
tags:
  - event
location: 115 McCaul
draft: true
summary: Key takeaway in 20 words.
---

## Overview  

TouchDesigner workshop by Derivative
115 McCaul
Greg


## Key takeaways  

After Effects Motion Graphics, mostly 2D
Blender, 3D modeling
Resolume, VJs
Processing, not first party support

TouchDesigner: Flexibility, Connectivity, Real-time Speed
LED, Concerts, Projection mapping, Immersive

**Money**
Microsoft, Car, Architecture, Smisonian, Museums, Military,want inhouse TouchDesigner, well-paying jobs
**Snake eater**
Make clients keep license, integrated into TouchDesigner ecosystem

Linux user needs windows to operator

How to use
tab/double click to show operator window

Network: a collection of operators
Operator: a node, with a viewer
Component operator: can go in, with gray outline

u: up the folder
i: into the folder
h: home
signal flow: left to right

TOP: texture, pixels, 2D, movie, images
CHOP: Channel, data points, numeric data and control signals, eg. audio, skeleton tracking, MIDI, OSC
DAT: Data, excel, strings, letter, scripting (Python), tables of data, for data visualization, csv
MAT: Materials, geometries to 2D, light, how to put texture
SOP: Surface operator, 3D geometry, procedural 3D, l-system, particle-system, 3D, driven by CPU
POP: Point operator, new family, GPU generate
COP: Components, only they make a folder, UI, simulation



middle-click drag to enlarge
right click to see the effect of different channels
![[Pasted image 20260207111542.png]]

p: to open parameter window
Play with parameters, control it dynamically

Value ladder: play with parameter
- use middle ring/left click, choose range, then move mouse right and left to try increments
![[Pasted image 20260207112237.png]]

Media pipe: by Google, use webcam to track body

https://github.com/torinmb/mediapipe-touchdesigner
take had data
use hand data
the tool also allowed separate data, convert them to separate POP, then combine

Put tox file in the project folder

null SOPs, checkpoints
![[Pasted image 20260207114705.png]]
SOP to POP, with drag and drop
![[Pasted image 20260207114846.png]]
Merge to merge 2 data

Particle POP
- max number
- birth rate
- life expect

It just froze because my GPU is not enough
![[Pasted image 20260207120701.png]]
Max my PC is able to do 
![[Pasted image 20260207120923.png]]

from null viewer, can bring up a separate viewer
right click on node to add operator
![[Pasted image 20260207121223.png]]

In active mode (click on sparkle) then right click
![[Pasted image 20260207121519.png]]

![[Pasted image 20260207133238.png]]
P1:x
p2:y
p3:z
n: normal
t: tangent
tex:text

Use to do math to be used at other parts

llm

mathmixPOP
![[Pasted image 20260207133828.png]]
Cache pop
![[Pasted image 20260207135412.png]]
Cache size 3, output -3
or 1 and -1
or 10 and -10 more dramatic

![[Pasted image 20260207135529.png]]
![[Pasted image 20260207135712.png]]
P: position

![[Pasted image 20260207135843.png]]
cache 3 or less since your memory does get full
Grab an element, particleDirection, target the built in parameter, initvelocity, set that as particle direction
![[Pasted image 20260207141020.png]]

hot key Q to turn on and off auto homing


Turn 3D geometry to 2D render
comp camera
geometry comp to house the 3d and turn into pixel
nest geometry sop in comp geometry (drag tail, release, then switch to comp)
![[Pasted image 20260207141756.png]]

MAT line, drop it on to the geo
![[Pasted image 20260207142040.png]]
Alt L
![[Pasted image 20260207143617.png]]

![[Pasted image 20260207151122.png]]
time domain to frequency domain: audio spectrum chop
![[Pasted image 20260207151233.png]]
![[Pasted image 20260207151343.png]]
![[Pasted image 20260207151535.png]]

Attributes
Cache hold data and release 1
Trail records all, save 2 seconds
![[Pasted image 20260207152908.png]]
Math mix
![[Pasted image 20260207152703.png]]
![[Pasted image 20260207153403.png]]
geometry comp, render, camera go together
constant line: par: material

![[Pasted image 20260207153814.png]]
![[Pasted image 20260207154422.png]]
![[Pasted image 20260207154507.png]]
Coloring: lookup table, depth goes to top and ramp goes to bottom
Add a color: ramp top, color generator
![[レコーディング 2026-02-07 160102.mp4]]

## Slides & media  
- ![Slide thumbnail](./img/slide.png)  
- Recording:

## Related notes  
- https://learn.derivative.ca
- 

