---
title: "Riso: Experimenting with Photo/Image"
date: 2025-11-16
tags:
  - project
summary:
status: idea
cover: "-"
draft: false
---
Image manipulation in p5.js and printed in riso.


## Works

---
### Image Crops
[sketch](https://editor.p5js.org/imrinahru/sketches/1GKac7sVo)
![[20250513_150458.png]]
![[20250513_153119.png]]

When randomMode=true, it adds another layer of story.

![[20250513_151505.png]]
![[Pasted image 20260306210432.png]]
![[20250513_151759.png]]
![[20250513_151601.png]]


Print out using Riso, duotone.
![[fly.jpg]]




---
### Pixelated Colors
[sketch](https://editor.p5js.org/imrinahru/sketches/v9TaHc1q2)

![[Pasted image 20260228233622.png]]

Thoughts: 
pixelated color schemes based on an image, change the pigment size, print and display in a series



## Start with image()

If you are using a photo, render by image(), p5js reference as below:
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

