---
course: Course Name
week: Week {{week-number}}
instructor: Instructor Name
tags:
  - class-notes
  - theory
  - practice
  - studio
  - lecture
  - seminar
  - critique
status: in-progress
date:
draft: true
---

# W5_Creation & Computation — Week {{week-number}}

## Question

- https://digitalfuturesocadu.github.io/mobile-p5-permissions/, How this is implemented?
- https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.11.10/p5.js

## Additional Experiment

- GIF creator
  - Put JPEG files in an `images/` folder.
  - Name them `frame0.jpg`, `frame1.jpg`, `frame2.jpg`, etc.
  - Set `numFrames` to the number of frames you have.
  - Add HTML file.
  - Press **‘c’** to record and **‘s’** to save your GIF.

   1. Load Your JPEG Frames

```
let frames = [];
let numFrames = 10; // Change this to your number of frames
let currentFrame = 0;
let playing = false;
let delayTime = 200; // ms per frame

function preload() {
  // Load all frames
  for (let i = 0; i < numFrames; i++) {
    frames[i] = loadImage('images/frame' + i + '.jpg');
  }
}

function setup() {
  createCanvas(400, 400);
  frameRate(60);
}

function draw() {
  background(220);
  image(frames[currentFrame], 0, 0, width, height);
  text(`Frame: ${currentFrame + 1}/${numFrames}`, 10, height - 10);

  // Animation playback
  if (playing && frameCount % int(delayTime / (1000 / 60)) === 0) {
    currentFrame = (currentFrame + 1) % numFrames;
  }
}

// Controls
function keyPressed() {
  if (key === 'ArrowRight') {
    currentFrame = (currentFrame + 1) % numFrames;
  }
  if (key === 'ArrowLeft') {
    currentFrame = (currentFrame - 1 + numFrames) % numFrames;
  }
  if (key === ' ') {
    playing = !playing; // Toggle play/pause
  }
  if (key === 'r') {
    currentFrame = 0; // Reset to first frame
    playing = false;
  }
}
/*
Arrow keys: Scrub frames.
Spacebar: Play/pause animation.
‘r’ key: Reset animation.
‘s’ key: Save as GIF (if using p5.gif.js).
*/

```

2. (Optional) Export as GIF: 

  - p5.js does **not** export GIFs natively, but you can display image sequences like an animated GIF and **capture/export GIFs** using libraries like [gif.js](https://github.com/jnordberg/gif.js/) or [p5.gif.js](https://github.com/antiboredom/p5.gif.js).

| Library   | How to use           | Start capturing | Save GIF  | Notes                |
| --------- | -------------------- | --------------- | --------- | -------------------- |
| gif.js    | gif.addFrame(canvas) | Press ‘c’       | Press ‘s’ | Opens GIF in browser |
| p5.gif.js | gifMaker.addFrame()  | Press ‘c’       | Press ‘s’ | Downloads GIF file   |


Add to index.html:
```
<script src="https://cdn.jsdelivr.net/npm/gif.js.optimized/dist/gif.js"></script>
<script src="https://cdn.jsdelivr.net/npm/gif.js.optimized/dist/gif.worker.js"></script>
```
The whole code:
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>JPEG Sequence Animation & GIF Export (p5.js + gif.js)</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.6.0/p5.min.js"></script>
    <!-- gif.js libraries -->
    <script src="https://cdn.jsdelivr.net/npm/gif.js.optimized/dist/gif.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gif.js.optimized/dist/gif.worker.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
      body { font-family: sans-serif; }
    </style>
  </head>
  <body>
    <main>
      <h2>JPEG Sequence Animation & GIF Export</h2>
      <p>
        <b>Controls:</b><br>
        Arrow keys: Scrub frames<br>
        Spacebar: Play/pause animation<br>
        ‘r’ key: Reset animation<br>
        ‘c’ key: Start GIF capture<br>
        ‘s’ key: Save GIF<br>
        <span style="color:green;">Your JPEG files must be in an <b>images/</b> folder, named frame0.jpg, frame1.jpg, ...</span>
      </p>
    </main>
    <script src="sketch.js"></script>
  </body>
</html>
```
Add c/s key command to sketch.js:

```
let frames = [];
let numFrames = 10; // Change this to match your number of JPEGs
let currentFrame = 0;
let playing = false;
let delayTime = 200; // ms per frame

// GIF export variables
let gif;
let capturing = false;
let captureCount = 0;

function preload() {
  // Load all frames
  for (let i = 0; i < numFrames; i++) {
    frames[i] = loadImage('images/frame' + i + '.jpg');
  }
}

function setup() {
  createCanvas(400, 400);
  frameRate(60);

  // Setup GIF object
  gif = new GIF({
    workers: 2,
    quality: 10,
    width: width,
    height: height,
    workerScript: 'https://cdn.jsdelivr.net/npm/gif.js.optimized/dist/gif.worker.js'
  });

  // Download GIF when finished
  gif.on('finished', function(blob) {
    let url = URL.createObjectURL(blob);
    let a = document.createElement('a');
    a.href = url;
    a.download = 'animation.gif';
    a.click();
  });
}

function draw() {
  background(220);
  image(frames[currentFrame], 0, 0, width, height);
  textSize(16);
  fill(0);
  text(`Frame: ${currentFrame + 1}/${numFrames}`, 10, height - 10);

  // Animation playback
  if (playing && frameCount % int(delayTime / (1000 / 60)) === 0) {
    currentFrame = (currentFrame + 1) % numFrames;
  }

  // GIF capture playback, advances just like playing animation
  if (capturing) {
    if (frameCount % int(delayTime / (1000 / 60)) === 0) {
      currentFrame = (currentFrame + 1) % numFrames;
      gif.addFrame(canvas, {copy: true, delay: delayTime});
      captureCount++;
      // Stop after one loop
      if (captureCount >= numFrames) {
        capturing = false;
        gif.render();
      }
    }
  }
}

// Controls
function keyPressed() {
  if (key === 'ArrowRight') {
    currentFrame = (currentFrame + 1) % numFrames;
  }
  if (key === 'ArrowLeft') {
    currentFrame = (currentFrame - 1 + numFrames) % numFrames;
  }
  if (key === ' ') {
    playing = !playing; // Toggle play/pause
  }
  if (key === 'r') {
    currentFrame = 0; // Reset to first frame
    playing = false;
    capturing = false;
    captureCount = 0;
  }
  if (key === 'c') {
    // Start GIF capture from first frame
    capturing = true;
    playing = false;
    captureCount = 0;
    currentFrame = 0;
    console.log('Started GIF capture...');
  }
  if (key === 's') {
    // Stop GIF capture and save immediately
    capturing = false;
    gif.render();
    console.log('Rendering and saving GIF...');
  }
}
```

## Lecture & Discussion Notes
- **Main Concepts:**  
  - image(), can deal with video, gif, graphic objects
  - for video, remember to add sound.js
  - let amplitude
  - 
- **Important Terms / References:**  
- **Citations / Theorists:**  

> *Quick summary of readings, slides, or discussions goes here.*

---

## Practice & Studio Work
- **Exercises / Demos:**  
- **Process Documentation (sketches, images, links):**  
- **Technical Notes (software, materials, tools):**  

---

## Critique & Feedback
- **Instructor Feedback:**  
- **Peer Feedback:**  

---

## Reflection & Connections
- **How does this link theory + practice?**  
- **Personal Insights / Questions:**  


---

## To-Do & Follow-up
- [ ] Reading for next class:  
- [ ] Studio experiment to try:  
- [ ] Concept to develop further:  

---

## Links & Resources

### Collaborative coding

- https://teddavis.org/
- https://teddavis.org/p5live/?cc=blbwo
 - live coding for DJ community
 - x


### P5.js Website

The newly redesigned site has an amazing set of examples and tutorials. It additionally hosts the code reference for the language and all supported libraries.

These are links that you will use repeatedly. Add them to your bookmarks in your web browser.

- [p5.js Website](https://p5js.org/) - This is the hub for most of the things you need to know.
- [p5.js Web Editor](https://editor.p5js.org/)- This is where you will write and run your code. Be sure to create an account and log in so you can save your work!
- [p5.js Reference](https://p5js.org/reference/) - This page provides the description and syntax for all functions in p5.js. Many of the examples are editable on the reference page so you can make changes and see the result! Very cool.
- [p5.js ExamplesLinks to an external site.](https://p5js.org/examples/) - Wide range of examples of projects that use P5
- [p5.js CommunityLinks to an external site.](https://p5js.org/community/) This is a great place to see recent work that people have created using p5.js from all over the world! It should give you a sense of the possibilities.
- [p5.js LibrariesLinks to an external site.](https://p5js.org/libraries/) User contributed libraries that extend the functionality
- [p5.js TutorialsLinks to an external site.](https://p5js.org/tutorials/) A Great place to start when learning P5

### Books

- [McCarthy, Lauren., Reas, Casey., Fry, Ben. Getting Started with P5.js: Making Interactive Graphics in JavaScript and Processing. United States: Make Community, LLC, 2015. (Available through Canvas )Links to an external site.](http://mccarthy,%20lauren.,%20reas,%20casey.,%20fry,%20ben.%20getting%20started%20with%20p5.js:%20making%20interactive%20graphics%20in%20javascript%20and%20processing.%20united%20states:%C2%A0Make%20Community,%20LLC,%C2%A02015./)
- Shiffman, Daniel. The Nature of Code: Simulating Natural Systems with JavaScript. United States: No Starch Press, 2024.
- Soon, Winnie., Cox, Geoff. Aesthetic Programming: A Handbook of Software Studies. United Kingdom: Open Humanities Press, 2020.

### Websites

- [The Coding TrainLinks to an external site.](https://thecodingtrain.com/) - Shiffman et al. A large collection of video tutorials and examples
- [Aesthetic ProgrammingLinks to an external site.](https://aesthetic-programming.net/) - Same as the book listed above, but in website form
- [The Nature of CodeLinks to an external site.](https://natureofcode.com/) - Website accompanying the book. Describes using p5 to create 'natural' systems and movements
- [That Creative Code PageLinks to an external site.](https://available-anaconda-10d.notion.site/That-Creative-Code-Page-c5550ef2f7574126bdc77b09ed76651b) - Useful database of common coding algorithms
- [Preposition ProgrammingLinks to an external site.](https://prepositionprogramming.com/) - Framing interactions in P5 as prepositions
- [Animating GIFsLinks to an external site.](https://digitalfuturesocadu.github.io/atelier1-fall2025/Workshop2/pages/gifInteraction.html) - Investigating methods for controlling GIFs in P5
- [Experimental UXLinks to an external site.](https://digitalfuturesocadu.github.io/mobile-p5-permissions/) - Comparing standar UI with Phone-specific inputs

### Youtube Channels

- [The Coding TrainLinks to an external site.](https://www.youtube.com/@TheCodingTrain) - Shiffman. Extensive range of topics from beginning to advanced
- [Make Art With CodeLinks to an external site.](https://www.youtube.com/@pattvira) - Patt Vira. Extensive range of topics that also engage aesthetics of the work
- [Coding with P5Links to an external site.](https://www.youtube.com/channel/UCufOCDs5G1A4AffwmeV0XBw) - xin xin. Good introduction to p5 and a focus on typography






#class-notes #theory #practice
