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

## Editor

- ctl+scroll wheel to zoom in
- Switch to different views from the pattern view window
	- pattern
	- stitch view
	- occupancy (number of stitches on a needle?)
- Select file format, kc file is the default. 
- Select params
	- miss: blank canvas
	- front bed (default)
	- rear bed 
- Check button to see errors
- buck file will merge all the layer
- cstack will preserve all layers, saved as json file
- kc file 
- Settings
	- compiler options
		- carrier spacing (number of needles between carriers/feeders when they are parked at the edge?)
		- stopping distance (closest feeder sits from the edge?)
		- these are helpful for certain racking, plating and interweaving designs, or heavier yarns
		- space the carriers further apart when plating, racking, interweaving to knit both sides of necklines, or when using heavier yarns
		- if the tension settings are correct but the right-hand edge stitches are too loose, lowing carrier spacing and stopping distance can help
		- start carrier spacing at 3 and stopping distance at 3.5 and adjust from there
	- validation option
		- float distance, lower this for fairisle

![[halfpitch.png]]
- Needle pair on the front and rear bed
- blue: one knit stitch at front
- pink: knit both fr and rr
- yellow: knit at rear = purl stitch
- SO the pic above is first knitting at fr and then rr
- knitting bed differs by half pitch, the rr bed has been moved/racked half a needle position
	- rack setting: 0.5
- miss=slip stitch, yarn skips the needle all together the explicit miss can be helpful to force the carriage to move to a certain position
- tuck = yarn is placed on the needle but is not knitted through the pre-existing loop. it makes a fabric wider, it does not add to length
![[Pasted image 20260130133938.png]]

- drop stitch
![[Pasted image 20260227131758.png]]

- The beds needs to be at pitch for transfer position

- 2 rows to transfer
	- kniterate never transfer adjacent needles
	- it goes one way and then goes the other way in the second row
	- front bed is transferred to the back (↑)
	- then 2 rows of back
	- then [from back transferred back to front](https://www.youtube.com/watch?v=SEzD8J5iZxs)

- Yarn
	- singles, not recommended on kniterate
	- ply = # of singles to create a yarn
	- ends =# of yarns in a single feed, can be used to experiment with colors and shades (eg. two yarns might be correct weight)
	- Yards per pound (ypp)
	- Woolen count/ wool run
	- Ne (cotton count) cc 2ply
	- wc  (worsted count) wc 2ply
	- NM (metric count) 1000m/kg
		- recommended: nm 6.00 to 8.00
		- = run 1.86 to 2.48
		- = ne 3.50 to 4.70
			- In 4.00 (8/2), 8 is weight, 2 is ply for cotton
		- = wc 5.30 to 7.10
			- In 6.00 (2/12), 12 is weight, 2 is ply for wool
		- = 3000 ypp to 4000 ypp
	- thinner as the number goes up
	- Kniterate is good at yarn range for lace, less than fingering
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

- 1 by 1 rib welt: 1 welt of knitting on the front, 1 welt at back bed
- garter stitch
	- transfer stitches to the opposite bed after every row
- ridges

![[Pasted image 20260206121535.png]]
- width = # of needles
- height = # of rows
- pencil tool for freely drawing different stitches
- move tool to adjust view
- line tool to draw a line of stitches

1. Add a free edit layer
![[Pasted image 20260206121729.png]]
2. Use tiling copy command
	use selection tool to quick drag and release
	right click, copy and past->tile copy
	In this 64 stitch swatch, 2 stitches need to multiplied by 32, 10 is for the height
![[Pasted image 20260206122403.png]]
3. Now that the tiling is saved in the clip board, right click again, copy&paste, then paste, place in position
![[Pasted image 20260206122429.png]]

> [!NOTE] Transfers necessary
> Transitioning from rib to garter, transferring rear bed stitches to front bed is needed so that already knitted stitch do not build up at unused needles

![[Pasted image 20260206122638.png]]

- pop-up information of each stitch:
	- {10, 10}: 1st place = needle #, 2nd place = row #
	- Yarn: yarn used
	- Code: what stitch is used

4. To transfer beds, add a row from layers, then ADD ANOTHER FREE EDIT LAYER to add transfer stitches in that new row.
![[Pasted image 20260206122833.png]]
- A quicker way to do transfer
- a garter ridge is created
![[Pasted image 20260206124934.png]]


3. Adjusting settings and repeats

![[Pasted image 20260313031731.png]]

- Either add a layer named: edit options column, or for free edit layer, you can change setting directly in left-side actions column
![[Pasted image 20260313031808.png]]

- know the yarn weight, nm 6 wool. 
-  Set the speed. It's important to knit slowly when you are testing a new yarn (<200), and start transfer at 80. A new swatch should also be < 300
-  Set the roll distance. Roller serves the same purpose as a weight in domestic knitting machine, preventing the stitches on the needles from jumping up and drop
	- lower the roll distance to half its regular value in the row before transfers begin. If stitches drop during transfers, increase the roll distance. Heavier yarn requires greater takedown (roll distance)
	- [see support document](https://support.kniterate.com/hc/en-us/articles/360019405297-Adjusting-the-rollers)


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

- stitch size: for transfers it should be smaller than the knitting stitch size. when knitting, the heavier the yarn, the larger the stitch size is needed
	- [see support document](https://support.kniterate.com/hc/en-us/articles/360019551738-Adjusting-the-stitch-size)
- test only the roll or test only the stitch size for each swatch

![[Kniterate - yarn weight, stitch size notes - Sheet1.pdf]]

- Rows with knit symbols must have a yarn carrier assigned.
- Transfer rows must have NO yarn carrier assigned.
- If creating an "edit options column" , insert layer right after the structure , select the fabric yarn availability
- .



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
- [Templates for clothes](https://support.kniterate.com/hc/en-us/articles/31065978102813-KNITERATE-TEMPLATE-EDITOR)
- [Sample files](https://drive.google.com/drive/folders/1vg18m5ncPSLsavk9fHaXB05OGaXO9L9g)

- https://drive.google.com/drive/folders/1U4TjTEtWXodjYFfDgUo7WInB1N-A_Scw