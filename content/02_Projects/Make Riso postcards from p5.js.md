---
title: Make Riso postcards from p5.js
date: 2025-11-15
tags:
  - project
  - printmaking
  - risograph
summary: |
  Elevator-pitch description (appears on the card).
status: idea
cover: ./img/<image>.png
draft: true
---

## Goal  
Describe the change this project aims to create.


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
![[Pasted image 20251023085936.png]]

```
- The native 2D API is the object you get with canvas.getContext('2d') (or in p5, buffer.canvas.getContext('2d') or buffer.drawingContext). It exposes methods like beginPath(), arc(), fillRect(), drawImage(), getImageData(), createLinearGradient(), etc.
- p5.js is a JavaScript library that wraps and builds on that native API. Functions like buffer.ellipse(), buffer.image(), buffer.text(), buffer.push()/pop() are p5 convenience functions that internally call the native context (and also manage p5’s own state like colorMode, angleMode, shapeMode, and pixelDensity).

Why the distinction matters

- Control: The native API exposes lower‑level features p5 may not wrap (pixel access, advanced compositing, Path2D, patterns).
- Behavior/state: p5 keeps its own drawing state and defaults; native ctx has its own state (ctx.save()/restore()). When you mix them you must manage both.
- Performance: For some heavy or very specific operations the native calls can be more direct and sometimes faster; p5 adds a small abstraction layer.
- Context type: "Native" could also mean a WebGL context (getContext('webgl')) rather than 2D — p5’s WEBGL mode uses a different rendering pipeline.

Small equivalence example

- p5: buffer.fill(255, 0, 0); buffer.noStroke(); buffer.ellipse(50, 50, 40, 40);
    
- native: const ctx = buffer.drawingContext; // same as buffer.canvas.getContext('2d') ctx.fillStyle = 'rgb(255,0,0)'; ctx.beginPath(); ctx.arc(50, 50, 20, 0, Math.PI*2); ctx.fill();
    

How to get it in p5

- buffer.drawingContext — p5’s reference to the underlying context (recommended).
- buffer.canvas.getContext('2d') — the standard browser call to obtain the native 2D context.
  
#Example
let buffer;
let buffer_ctx;

function setup() {
  createCanvas(400, 200);

  // create an offscreen graphics buffer
  buffer = createGraphics(400, 200);

  // get the underlying HTMLCanvasElement's 2D context
  // (buffer.canvas is the actual <canvas> element behind the p5.Graphics)
  buffer_ctx = buffer.canvas.getContext('2d');

  // Use p5 drawing on the buffer
  buffer.background(220);
  buffer.fill(0, 100, 200);
  buffer.noStroke();
  buffer.ellipse(80, 80, 120, 120); // drawn using p5 onto the buffer

  // Now use the native Canvas 2D API on the same buffer
  buffer_ctx.save();                // save native context state
  buffer_ctx.fillStyle = 'rgba(255,100,0,0.8)';
  buffer_ctx.fillRect(200, 40, 120, 80); // native rectangle
  buffer_ctx.beginPath();
  buffer_ctx.moveTo(200, 140);
  buffer_ctx.lineTo(320, 140);
  buffer_ctx.lineTo(260, 100);
  buffer_ctx.closePath();
  buffer_ctx.fill();
  buffer_ctx.restore();             // restore native context state
}

function draw() {
  background(30);

  // draw the whole buffer onto the main canvas
  image(buffer, 0, 0);
}
```

```
Code placed in the body of `windowResized()` will run when the browser window's size changes. It's a good place to call [resizeCanvas()](https://p5js.org/reference/p5/resizeCanvas/) or make other adjustments to accommodate the new window size.

function setup() {
  createCanvas(windowWidth, windowHeight);

  describe('A gray canvas with a white circle at its center. The canvas takes up the entire browser window. It changes size to match the browser window.');
}

function draw() {
  background(200);

  // Draw a circle at the center.
  circle(width / 2, height / 2, 50);
}

// Resize the canvas when the
// browser's size changes.
function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
```

## Buffer as a texture
```
let buffer_texture;
let buffer_dim = 400

function setup() {
	
	createCanvas(400, 400, WEBGL);
	
	buffer_texture = createGraphics(400, 400)
	createTexture()
}

palette = ["#0077e1", "#f5d216", "#fc3503"]

function createTexture(){
	shuffle(palette, true)
	buffer_texture.background(palette[0])
	buffer_texture.strokeWeight(15)
	for(let x = 20; x < 400; x+=20){
		for(let y = 20; y < 400; y+=20){
			buffer_texture.point(x, y)
		}
	}
}

function draw() {
	background(220);
	
  rotateZ(frameCount * 0.01);
  rotateX(frameCount * 0.01);
  rotateY(frameCount * 0.01);
  //pass image as texture
  texture(buffer_texture);
  box(100);
}
```

```
/*
https://github.com/zenozeng/p5.js-svg/

To get this to work properly you must include the p5.pdf.js script in your files and link in your .html file 
*/

var pdf; // create a variable for a pdf object
var record = false; // set this to false so it doesn't start recording until you tell it to

function setup() {
	createCanvas(600, 600);
	pdf = createPDF(); // initialize the PDF creation
}

function draw() {
  ellipse(100,100,mouseX,mouseY);
	if (record) { // when record is true, it will begin recording the PDF
		pdf.beginRecord();
	}
	
	//
	// do your thing here
	//

	if (record) { // if recording began, save it.
		record = false;
		pdf.save({
			filename: 'itworks',//change filename to whatever makes sense
		});
	}
}

function mousePressed() {
	record = true;
}
// this would work best with a keyPress function since mousePressed can get annoying. Using mousePressed here to show functionality
```

### About multiple files configuration
https://github.com/copilot/share/8a134012-0be0-8097-9812-304e802168d6

### DPI PPI

How do I make a picture 300 DPI?

The ratio of the conversion from PPI to DPI is usually 1:1. This means that if an image is ten inches wide by ten inches high at 300 DPI, the pixel dimensions must be 3000px x 3000px. To obtain the proper pixel dimensions (e.g., 3000 x 3000 px) to offer 300 DPI, you must multiply the print size (width and height in inches) by 300.

|   |   |
|---|---|
|**Print Size (Inches)**|**Pixel Dimensions**|
|4 x 6”|1200px x 1800px|
|8 x 10"|2400px x 3000px|
|12 x 18|3600px x 5400px|

## Log  
<% tp.date.now("YYYY-MM-DD") %> — Kick-off note.
