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

Access editor via: https://editor.kniterate.design/app/

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

## Knit basics 

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
## Editor

-  Switch to different views from the pattern view window
	- ==occupancy = number of stitches on a needle==
- Select file format, kc file is the default. 
- Select params
	- miss: blank canvas
	- front bed (default)
	- rear bed 
- Settings
	- ==compiler options==
		- ==carrier spacing=== number of needles between carriers/feeders when they are parked at the edge
		- default to 2 and 7.5
		- ==stopping distance===closest feeder sits from the edge
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
- tuck = yarn is placed on the needle but is not knitted through the pre-existing loop. it makes a fabric wider, it does not add to length
![[Pasted image 20260130133938.png]]
![[Pasted image 20260130134135.png]]

> [!Miss vs. drop stitch]
>
> ![[Pasted image 20260227131758.png]]

- The beds needs to be at pitch for transfer position
![[Pasted image 20260130134305.png]]
- 2 rows to transfer
	- kniterate never transfer adjacent needles
	- it goes one way and then goes the other way in the second row
	- front bed is transferred to the back (↑)
	- then 2 rows of back
	- then [from back transferred back to front](https://www.youtube.com/watch?v=SEzD8J5iZxs)

- ==Yarn==
	- singles, not recommended on kniterate
	- ply = # of singles to create a yarn
	- ends =# of yarns in a single feed (eg. two yarns might be correct weight)
	- Yarn per pound (ypp)
	- Woolen count/ wool run
	- Ne (cotton count) cc 2ply
	- wc  (worsted count) wc 2ply
	- NM (metric count) 1000m/kg
		- nm 6.00 to 8.00
		- run 1.86 to 2.48
		- ne 3.50 to 4.70
			- In 4.00 (8/2), 8 is weight, 2 is ply for cotton
		- wc 5.30 to 7.10
			- In 6.00 (2/12), 12 is weight, 2 is ply for wool
			- 
		- 3000 ypp to 4000 ypp
	- Handknitting, its around the range for lace
	- thinner as the number goes up
	- Yarn balance: Use Beesley/McMoran to check weight of a yarn
- [Options in option column](https://support.kniterate.com/hc/en-us/articles/11675168630045-THE-OPTIONS-COLUMN)
	- **Row number:** to be read from bottom to top
	- **Rack:** -4.0 to +4.0 range, each step is 0.5 (half-needle)
	- **Speed**: up to 800 mm/sec
	- **Roll (Roller pull-down)**: 0 to 999 
	- **S/F (Stitch size for front) and S/R (Stitch size for rear)**: 0 to 15, it controls **loop size / yarn tension** on each bed.
	- **Dir (Carriage direction)**:**** Dir tells the machine **which direction the row will knit**. (no change in this case)
		- 0>  Left to right
		- <1  Right to left
		- <2 / 2> Any (as per arrow)
	- **Yarn (yarn carrier):** 1 to 6
### Design example 

- 1 by 1 rib: 1 welt of knitting on the front, 1 welt at back


> [!NOTE] Welt?
> 


- garter stitch
	- transfer stitches to the opposite bed after every row
- ridges

![[Pasted image 20260206121535.png]]
- width = # of needles
- height = # of rows
1. Add a free edit layer
![[Pasted image 20260206121729.png]]
![[Pasted image 20260206122403.png]]
![[Pasted image 20260206122429.png]]
- Transitioning from rib to garter, transferring rear bed stitches to front bed is needed so that already knited stitch do not build up at unused needles
![[Pasted image 20260206122638.png]]
- {10, 10}: 1st place = needle #, 2nd place = row #
- Yarn: yarn used
- Code: what stitch is used
2. To transfer beds, add a row from layers
![[Pasted image 20260206122833.png]]
- A quicker way to do transfer
![[Pasted image 20260206124934.png]]


3. Adjusting settings and repeats

![[Pasted image 20260313031731.png]]

- Either add a layer named: edit options column, or for free edit layer, you can change setting directly in left-side actions column
![[Pasted image 20260313031808.png]]

- know the yarn weight, nm 6 wool. 
-  Set the speed. It's important to knit slowly when you are testing a new yarn
-  Set the roller. Roller serves the same purpose as a weight in domestic knitting machine, preventing the stitches on the needles from jumping up and drop
- Rows with knit symbols must have a yarn carrier assigned.
- Transfer rows must have NO yarn carrier assigned.
- If creating an "edit options column" , insert layer right after the structure , select the fabric yarn availability
- .

>  Right underneath the needle beds, two rollers catch the fabric and pull it down. The amount of force with which they pull the fabric down is called the takedown.

>  How much takedown is needed?
>  The amount of takedown you need is highly dependent on the yarn and knitting technique you're using. Below are some tips for how to adjust the rollers to solve certain issues:
>  - If stitches are dropping during transfers, try increasing the takedown in the row before the transfer.
>  - If stitches are breaking during transfers, try decreasing the takedown.
>  - If you are using stitch sizes higher than 10, use more takedown. (not for transferring stitches)
>  - For jacquard knits use a high takedown.
>  - Here are some guidelines for you to use:

| **Situation**                                                                                                         | **Suggested initial takedown** |
| --------------------------------------------------------------------------------------------------------------------- | ------------------------------ |
| Plain single jersey or double jersey                                                                                  | 450                            |
| Jacquards:<br><br>2-color<br><br>Multicolored                                                                         | 500-700<br><br>600-800         |
| Rows with transferring stitches                                                                                       | 0-50                           |
| Row before rows with transferring stitches                                                                            | 0-50% of takedown              |
| Last row after many consecutive rows with transferring stitches (This little tug can help to avoid dropping stitches) | 50-100                         |
(Excerpt from [support.kniterate](https://support.kniterate.com/hc/en-us/articles/360019405297-Adjusting-the-rollers))


## Pattern design


>  Posting a couple of mesh fabric test swatches, prime examples of things I rarely did on my own domestic machines, because they can be tedious so tedious. So much more fun on the Kniterate! The swatches use basic 1x1 transfers. I'm hoping that [plasmatopia](https://support.kniterate.com/hc/en-us/profiles/375199403737-plasmatopia) will post some of her amazing lace swatches and scarves (with more interesting transfers) here.

(Excerpt from https://support.kniterate.com/hc/en-us/community/posts/360014900197-Knitting-textures)



Drop off, checks, and compiler settings

A course
Wale

Waste knitting: interlock or tubular knitting (stitches solely on the front followed by stitches solely on the back)
draw yarn is knitted between the waste and the product.

buck only holds an image file, use cstack format instead to keep al the layer information

[A guide to Kniterate with Tom Catling](https://www.youtube.com/watch?v=Z3aL_rB2pro) 2:20, where the carrier needs to be to be picked up by the machine?
A: As long as the carrier is not at the far right. 
Also, a gogd position to start is having carriers not overlapping each other and form a diagonal line, but also not positioned into the knitting area

Centering the knit
It's good to have knit in the middle .
Do all the work (waste, image, all the edits then add a layer of "center on bed".
It's done at the very end because if that is done in the beginning, the whole line will be automatically filled with stitches


Dropping

Eyelet knitting: transferring stitches to one next to it

## Reference

- [kniterate basic knitting concept](https://www.kniterate.com/2023/10/25/basic-knitting-concepts/)
- [kniterate youtube](https://www.youtube.com/@Kniterate)
- 