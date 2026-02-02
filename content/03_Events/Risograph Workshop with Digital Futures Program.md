---
title: Risograph Workshop with Digital Futures Program
date: 2025-11-16
tags:
  - event
location: OCAD 667 Studio
draft: false
summary: This is a key memo for my workshop using Riso and p5.riso
---

## Overview  

This is a key memo for my workshop for a beginner to learn about Risograph and how to prepare the design files and operate the Riso machine. I have also talked about p5.js open-source coding environment and its p5.riso library, where people can easily create print-ready files on its web-browser based IDE. I'd love to create more contents that contribute to the bridging of the digital community and the printmaking community. 

The workshop has taken place twice in 2025, one to my Digital Futures cohort in OCAD, and one (more like a presentation) at InterAccess Creative Coding Community.

## Key takeaways  

### p5.riso

To prepare digital files for riso printing, images need to be separated into individual colors, each saved out as a file.
The p5.Riso Library helps automate color separation and lets you preview of how your prints will look

https://antiboredom.github.io/p5.riso/
#### Preparation
When using p5.js web browser:
1. Add a p5.riso.js file to the editor.
2. Add `<script src="p5.riso.js"></script>`to index.js


#### Colors
Colors predefined in p5.riso
![[p5.risocolor.png]]

Colors that we have in 667
Gail
- Fluorescent Pink
- Fluorescent orange
- Bright red
- Sunflower
- Yellow
- Light lime
- Hunter green
- Teal
- Aqua
- Medium blue
- Purple
- Black

Doris
- Fluorescent Pink
- Yellow
- Blue
- Red
- Kelly Green
- Violet
- Hunter Green
- Black


#### Demo
https://editor.p5js.org/imrinahru/sketches/RgIombjbY

```
// Adapted from code example provided by rachelhyman, original code is here: https://github.com/antiboredom/p5.riso/tree/master/examples/Smudge

//declare riso object
let aqua, fluorescentpink;

function setup() {
  // set pixel density to 1
  pixelDensity(1);
  createCanvas(8.5 * 300, 11 * 300); // create an 8.5x11 inch canvas at 300dpi

  // create 2 riso layers

  aqua = new Riso("aqua");
  fluorescentpink = new Riso("fluorescentpink");
}

function draw() {
  let s = 100;
  background(255);

  aqua.noStroke();
  fluorescentpink.noStroke();

  for (
    let x = 0.25 * 300 + 500;
    x < width - 0.25 * 300 - 500;
    x = x + (8.5 * 300) / 6
  ) {
    for (
      let y = 0.25 * 300 + 500;
      y < height - 0.25 * 300 - 300;
      y = y + (11 * 300) / 6
    ) {
      aqua.fill(random(0, 20));
      aqua.ellipse(
        x + random(-100, 100),
        y + random(-100, 100),
        s + random(-800, 800),
        s + random(-800, 800)
      );

      fluorescentpink.fill(random(0, 20));
      fluorescentpink.ellipse(
        x + random(-100, 100),
        y + random(-100, 100),
        s + random(-800, 800),
        s + random(-800, 800)
      );
    }
  }

  // make a small text graphic and cut it out of the image
  let textGraphic = createGraphics(width, height);
  textGraphic.fill(0);
  textGraphic.textStyle(BOLD);
  textGraphic.textFont("Helvetica");
  textGraphic.textAlign(CENTER, CENTER);
  textGraphic.textSize(150);
  textGraphic.text("PERFECTLY imperfect", mouseX, mouseY);

  aqua.cutout(textGraphic);
  fluorescentpink.cutout(textGraphic);

  drawRiso();
}

function mousePressed() {
  // when the user clicks, export the current image and stop
  exportRiso();
  noLoop();
}

```
#### Code
Treat riso objec similar to a graphic object
```
let blueChannel; //declare riso object

function setup(){
  createCanvas(500, 500);
  blueChannel = new Riso("blue"); // instantiate riso object as blue layer
  blueChannel.fill(128); //set opacity
  blueChannel.rect(20, 20, 100, 100); //draw rect to blue layer
  drawRiso(); //draw to screen
}
```


## Slides & media  
The slide belongs to the 667 Studio.  ![[667 Studio - Risograph workshop - October 2025 update.pdf]]

## Related notes  


https://www.riso.co.jp/product/risograph/feature/index.html

### Artists
https://wrenmcdonald.com/
https://www.natalieandrewson.com/
https://www.jasminesillustrations.co.uk/portfolio-collections/my-portfolio/project-title-1

### (Basic) Color Glossary
|Term|Meaning|
|---|---|
|**Hue**|Pure color (red, blue, green)|
|**Value / Lightness**|Light vs dark|
|**Saturation**|Intensity, vividness|
|**Tint**|Hue + white|
|**Shade**|Hue + black|
|**Tone**|Hue + gray|
|**Temperature**|Warm vs cool|
|**Complementary**|Opposites on wheel|
|**Analogous**|Neighbors on wheel|
|**Monochromatic**|Single hue variations|
|**Opacity**|Transparency level|

