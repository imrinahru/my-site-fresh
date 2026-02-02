---
course: "Studio: Kniterate"
week: "-"
instructor: "-"
tags:
  - theory
  - practice
  - studio
  - digitalcraft
  - digitalfabrication
  - knitting
status: in-progress
date: 2025-12-17
draft: false
---

# Explore Kniterate
## Context & Facilities

Below is a quick memo on what I have learnt on the digital knitting machine housed in XFab. The machine became a knot that linked me to people from the Material Art and Design (MAAD), including Dr. [Lynne Heller,](https://www.lynneheller.com/) and Carson, class assistant from the Textile Studio. They are working on [Thinking Through Craft and the Digital Turn (CDT)](https://www.craftandthedigitalturn.com/)which resonated deeply with my interest in the digital craft. 

---

## Intro to Kniterate and Facility Overview

- **XFab**: Noted as having more _fluidity_ compared to studios at **100 McCaul**.
- Question of whether XFab includes or should include a textile area (of course it should!).
- Perceived distance from MAAD.
- **Kniterate** is an **industrial digital knitting machine**.
- Requires **training**, but many users are effectively **self‑taught**.
- Strong culture of **contributing back to shared resources** (tutorials, patterns, troubleshooting).
### Precedents & DIY Knitting Practices

#### Hand / Low‑Tech
- **DIY French knitting tubes**
- **DIY circular knitting machines**
#### Domestic Machines
- **Domestic flatbed knitting machines**
- _Singer Chunky Knitter 151_
    - Available in different gauges

### Open & Experimental Knitting Communities

- **AYAB (All Yarns Are Beautiful)** project
    - Open‑source project
    - Pattern sharing
    - Hardware‑specific (e.g., **Brother machines**)
- **Open Knit** (open knitting initiatives)    
- Liza Stark — sensor knitting
- Flie Blanchard
### From Domestic to Industrial: Kniterate

- **Industrial Kniterate** as a step change from DIY/domestic machines
- Single machine, digitally controlled, rapid iteration
#### Bed Types
- **Single bed**
    - Only stockinette
- **Double bed** can do
    - Ribs
    - Double jacquard
    - Back can become the front (reversible structures)
### Software & File Workflow

- Software login: **editor.kniterate.com**
#### File Types

- **.buck** — native Kniterate design file
- **.kc** — compiled machine command file
    - Must be named **command.kc**
- **.json** — can be loaded as a knit command
#### Machine View

- **Stitch view** indicates **front/back** structure

### Knitting Process (Operational Flow)

1.  **Waste yarn + cast-on**
2. Knitting until the rollers take fabric and the waste section is complete
3. Knit the **body**
4. **Cast off**

### Materials & Hardware

- **SD card**
    - File must be named **command.kc**
- **Kniterate‑compatible yarn**
- Importance of **yarn sourcing in Canada** (availability, specs)

### Speed & Machine Control

- **Speed is critical**
- Knowing **when to slow the machine down** affects:
    - Yarn tension
    - Stitch quality
    - Machine safety

### Learning Resources & Community Knowledge

- Official support documentation:
    - Kniterate Help Center (support.kniterate.com)
- **o!jolly!m —** _**Knitting in the Fast Lane**_
    - Shared tutorial videos
- Value of peer‑produced tutorials and informal knowledge

### Institutions Using Kniterate

- **TMU** — two Stoll knitting machines (contextual comparison)
- **Swedish School of Textiles**
- **TU Delft**
- **RISD**

### Practitioners & Research Contexts

- **Greta Grip & Lee Jones**
    - HCD at Carleton
    - Postdoc at Queen’s
- Research themes: 
    - **Resistant fibres**
    - Ottawa (current?)
- **Hamilton cotton factory** — historical/industrial textile context

---

## Knit basics (during the holiday)

The "jacquard" as called in Kniterate term mixes double-knitting with actual jacquard. 
Jacquard starts from a punch card system that allows people to create intricate images in weave. 
While double knit creates a thick, double sided knit. 
In kniterate, a color up to 6 can be used (or 5, since the detaching thread is also included) to create images from a small image. And the backing can have different patterns as well. The machine can do reverse color only when 2 color of threads are used.

Here is a sample of reverse color double-knitting sample that I did by hand to understand how it's made. The smaller one on the left hand-side is knitted with white conductive yarn with pink-purple normal yarn to test how a specific conductive area can be controlled. It turned our quite precise.
![doubleknitfront]({{ '/content/assets/img/doubleknitfront.png' | relative_url | uri_escape }})
![[doubleknitfront.png]]
![doubleknitback]({{ '/content/assets/img/doubleknitback.png' | relative_url | uri_escape }})
![[doubleknitback.png]]



---
## Details

- From pattern view window, can switch to different views
	- occupancy, number of stitches on a needle
- kc file
- params
	- miss: blank canvas
	- front bed (default)
	- rear bed ()
- Settings
	- compiler options
		- carrier spacing=#of needles between carriers/feeders when they are parked at the edge
		- default to 2 and 7.5
		- stopping distance=closest feeder sits from the edge
- 
![[halfpitch.png]]
- Needle pair on the front and rear bed
- blue: one knit stitch at front
- pink: knit both fr and rr
- yellow: knit at rear = purl stitch
- SO the pic above is first knitting at fr and then rr
- knitting bed differs by half pitch, the rr bed has been moved/racked half a needle position
	- rack setting: 0.5
- miss=slip stitch, the explicit miss can be helpful to force the carriage to move to a certain position
- tuck = yarn is placed on the needle but is not knitted through the pre-existing loop. it makes a fabric wider
![[Pasted image 20260130133938.png]]
![[Pasted image 20260130134135.png]]
- The beds are at pitch=transfer position
![[Pasted image 20260130134305.png]]
- 2 rows to transfer
	- kniterate never transfer adjacent needles
	- it goes one way and then goes the other way in the second row
	- front bed is transferred to the back (↑)
	- then 2 rows of back
	- then [from back transferred back to front](https://www.youtube.com/watch?v=SEzD8J5iZxs)

- Yarn
	- singles
	- ply = # of singles to create a yarn
	- ends =# of yarns in a single feed


## Reference

- [kniterate basic knitting concept](https://www.kniterate.com/2023/10/25/basic-knitting-concepts/)