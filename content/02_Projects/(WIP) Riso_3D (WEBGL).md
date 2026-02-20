---
title: "Riso: Print 3D!"
date: 2025-11-16
tags:
  - project
summary:
status: in progress
cover: "-"
draft: false
---

## Context

As an attempt to try more color mixing and gradation in riso, I tried to directly capture 3D render with buffer texture in p5.js, and also separate colors in the same program using p5.riso.

![[img002.jpg]]![[img001.jpg]]

## Code

**Global Variables:**

- `purple, aqua, orange`: Riso color layer objects (from p5.riso library)
- `cubeGraphics[]`: Array of 6 graphics buffers (one per cube face)
- `rotationAngle`: Controls 3D rotation
- `autoRotate`: Toggle for automatic/manual rotation
- `cubeSize`: Dimension of cube faces

1. Uses **WEBGL** mode for 3D rendering
2. Initializes **Riso color layers** for export
3. Creates separate **graphics buffers** for each face
```
  // Create graphics buffers for each cube face
  for (let i = 0; i < 6; i++) {
    cubeGraphics[i] = createGraphics(cubeSize, cubeSize);
  }
  
  renderCubeFaces();  // Generate textures
}

```




https://editor.p5js.org/imrinahru/sketches/_rCc5P8hT


## More things to try for buffer gradation texture


## Use vertex for any forms

## Buffer as a texture

Sample code:

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
	buffer_texture.strokeWeight(100)
	for(let x = 100; x < 400; x+=100){
		for(let y = 100; y < 400; y+=100){
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


## Alpha

Mindful when using alpha, as it's only reflected when color is given in terms of r, g, b

![[Pasted image 20260218131016.png]]


## Shader ver.

I tried the same design using shader.

https://editor.p5js.org/imrinahru/sketches/UyZNR9p6c