---
title: Take Digital Craft Seriously
date: 2025-09-24
tags:
  - project
  - digitalcraft
  - textile
summary: Take digital craft seriously
status: in-progress
cover: ./img/<image>.png
draft: true
---
![[display_quarter.jpg]]


The project is part of the experimentation I did in Creation & Computation class at OCADU, in fall 2025.


# Haptic Kumihimo: Measuring Force in Braiding
## Concept

When I knit or braid, keeping a consistent texture means constantly judging whether the string is too tight or too loose. With Kumihimo—a Japanese braiding craft known for its intricate patterns—this consistency requires skill and experience. I was especially struck by a Kumihimo artist who said the braid reflects the maker’s inner state. It made me wonder: what if the tension on each string could be sensed and expressed back to the maker in real time?

When I finally created a simple, intuitive feedback system, I was surprised by how natural and useful it felt. In the video, for example, when a white light signaled that the string was too tight, I immediately adjusted the tension before moving on to the next cycle.

![[interaction.mp4]]
# Technical aspect

Several technical considerations proved essential throughout the making process.
## Iteration

Capturing tension in a thin thread required multiple iterations.

- **Slit design:** A 0.5 pt slit with a straight-bottom triangle cut best held the string without slipping, nor too tight.
    ![[slit.jpg]]
- **Pressure sensing:** Detecting tension directly at the slit edge was unreliable because the contact area was too small. Adding a small bump so the string could press more firmly onto the surface made the DIY FSR respond consistently. A quick prototype with a felt ball confirmed the idea worked.
	![[dirtyprototype.mov]]


## Attention to detail

Because the concept depends on subtle feedback, the final design focused on detail.

- **Lighting feedback:** I replaced abrupt blinking with a smooth fade-in/fade-out cycle. This reduced distraction and gave the tool a calming, “breathing” feel.
    ![[fade effect.mov]]
- **Tactile quality:** Traditional Kumihimo uses wooden bobbins that create a rhythmic sound. I recreated this effect by crafting simple wooden bobbins from sticks at the wood shop.
	![[display_bobbins.jpg]]


## Material behavior

The biggest challenge came before the exhibition. I treated the piece as a static design and didn’t anticipate how much stitching and assembly would affect the sensing capacity of the DIY FSR. Although I tested it during the build, I only noticed the growing noise and random lighting once everything was fully enclosed and difficult to adjust.

![[stitch_before.jpg]]

After the exhibition, I disassembled the piece and monitored the data in real time while reassembling it. I found that even small changes, such as taping over copper and velostat layers or adding felt balls, dramatically reduced resistance, even before stitching.

![[serial monitor.jpg]]
Continuous testing revealed how quickly the material responded to every modification. As a result, I:

- Stopped using tape and used thin paper to sandwich the DIY FSR to stay in place instead.
    Before: ![[taping_before.jpg]]
    After: ![[taping_after.jpg]]
- Replaced bulky felt balls with light cotton string to apply pressure, it turned out to be enough to function as a bump.
    Before:![[bump_before.jpg]]
    After:![[bump_after.jpg]]
- Switched from 1/16" styrene to light fabric, attaching it without tension to preserve the sensor’s sensitivity.
    Before: ![[at exhibition.jpg]]
    After:![[final.jpg]]
These adjustments kept the sensing consistent and responsive in the final build, as shown in the previous videos.
# Circuit

The circuit connects an Arduino Nano to the FSR with a simple voltage divider circuit using resistors, reads analog values from the FSR (A6), and switches the LEDs accordingly based on the measured force for real-time visual feedback (~11, ~12):

- **Low pressure** lights up green LED (~11) that signals "Good, carry on",
- **High pressure** lights up the white LED (~12) to demand attention and "Be gentle".

![[FSR_2LEDs_bb.png]]

# Code Narrative


Find the entire code here: [a1_kumihimo_pressure_sensing.ino](https://github.com/imrinahru/creation-computation-assignment1/blob/main/a1_kumihimo_pressure_sensing.ino)

How it works:
1. Reads analog values from `A6`. Values are scaled to 0–100 and compared to a `threshold`.
2. Uses decision logic to decide which LED is active:
    - Above threshold ( **70** on the 0–100 scale)→ White LED fades in
    - Below threshold → Green LED fades in
3. Brightness increases or decreases between 0–255 using `analogWrite()`. Direction flips at each limit for a smooth pulse.
4. `millis()` timer updates brightness every 10 ms (`fadeInterval`).
5. Prints raw and mapped sensor values for debugging purposes.
## Log  
<% tp.date.now("YYYY-MM-DD") %> — Kick-off note.
