---
title: "Riso: Experimenting with Photo"
date: 2025-11-16
tags:
  - project
summary: |
  Elevator-pitch description (appears on the card).
status: idea
cover: ./img/<image>.png
draft: true
---
Pixel manipulation done in p5.js and printed.



Next:
pixelated color schemes based on an image, change the pigment size, print them and display in a series


If you are using a photo, render by image(), reference as below:
```
#Syntax
image(img, x, y, [width], [height])
image(img, dx, dy, dWidth, dHeight, sx, sy, [sWidth], [sHeight], [fit], [xAlign], [yAlign])

#Example
let img;

// Load the image.
function preload() {
  img = loadImage('/assets/moonwalk.jpg');
}

function setup() {
  createCanvas(100, 100);

  background(50);

  // Draw the image and scale it to fit within the canvas.
  image(img, 0, 0, width, height, 0, 0, img.width, img.height, CONTAIN);

  describe('An image of an astronaut on the moon. The top and bottom borders of the image are dark gray.');
}

#Note
The ninth parameter, `fit`, is also optional. It enables a subsection of the source image to be drawn without affecting its aspect ratio. If `CONTAIN` is passed, the full subsection will appear within the destination rectangle. If `COVER` is passed, the subsection will completely cover the destination rectangle. This may have the effect of zooming into the subsection.

The tenth and eleventh parameters, `xAlign` and `yAlign`, are also optional. They determine how to align the fitted subsection. `xAlign` can be set to either `LEFT`, `RIGHT`, or `CENTER`. `yAlign` can be set to either `TOP`, `BOTTOM`, or `CENTER`. By default, both `xAlign` and `yAlign` are set to `CENTER`.

```
![[image().png]]

