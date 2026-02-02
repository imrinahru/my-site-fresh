---
title: "Riso: Print 3D!"
date: 2025-11-16
tags:
  - project
summary: Elevator-pitch description (appears on the card).
status: idea
cover: ./img/<image>.png
draft: true
---

## Context  


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

## Milestones  
| Date | Target | Done? |
|------|--------|-------|
|      |        |       |

## Stakeholders  
- Community / partner 1  
- 

## Log  
- Kick-off note.

