---
title: windowResized()
date: 2025-1-25
tags:
  - log
draft: true
---
Convenient function when designing mobile experience using p5.js:
call windowResized();

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