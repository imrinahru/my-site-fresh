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



# (WIP) W4_Creation & Computation — Week {{week-number}}


## Lecture & Discussion Notes
- **Main Concepts:**  
  -  Heavily mediated experience, why we have the drive to capture it? Keep a piece of it with me? how about shared?
  -  p5.js, accessibility, inclusivity, it's the finest model
  - ctl+shift+f, tidy code
- **Important Terms / References:**  
  -  
- **Citations / Theorists:**  
  -  

> *Quick summary of readings, slides, or discussions goes here.*

---

## Practice & Studio Work
- **Exercises / Demos:**  
  - Utilize all phones (26), everybody should be able to play
  - Augment primarily by cardboard
  - the spec of phones matter
  - Wake them up
  - Creating tracks
  - Pet network, phone is the face of the creature and talk to each other, hand the physical object, there is a QR code
  - Can rent GoPro
  - It is about creating together, not creating the most complex thing, share tools, slow down, simplify is ok, see what happens with this new person


> [!NOTE] Ideas
> Can I make something running through all the screens? (maybe the person need to check the next phone and touch where the person will exit, but need to seamlessly appear in the next phone)


- **Process Documentation (sketches, images, links):**  
  -  
- **Technical Notes (software, materials, tools):**  
  -  Code

```
// Particle interaction with "hard shake" triggers.
// First shake: spawn particles at an edge (chosen based on current gravity tilt)
// - Second shake: send each particle out through its nearest edge


let particles = [];
const NUM_PARTICLES = 300;
const PARTICLE_RADIUS = 8;
const REST_DISTANCE = 8; // Target spacing betwen particles
const RELAXATION_ITER = 3;  // Times per frame for pushing particles apart

const EXIT_ACCEL = 5;     // How strongly particles accelerate when exiting
const SHAKE_COOLDOWN = 800; // ms. Ignore extra shakes within this time window after a shake.
let lastShakeTime = 0;

let gravity = { x: 0, y: 0.5 };
let gyroEnabled = false;

// Edge highlighting variables
let activeEdges = {
  spawn: null,    // Entry edge
  exit: null     // Exit edge
};
let edgeHighlightStartTime = 0;
const EDGE_HIGHLIGHT_DURATION = 3000; // 3 seconds highlight


function setup() {
  createCanvas(windowWidth, windowHeight);

  // iOS 13+ requires explicit permission to read motion sensors
  // Detect whether the browser/device requires explicit permission for motion sensors
  // If permission is required, show a button the user must tap; when they tap it, request permission and enable gyro input if granted.If permission is not required, enable gyro input immediately.
  
  if (
    typeof DeviceMotionEvent !== 'undefined' &&  // Check the event
    typeof DeviceMotionEvent.requestPermission === 'function'
  ) {  // Check the function Apple added for iOS 13+
    let btn = select('#gyro-btn'); // Find the btn defined in HTML and attach click handler
    if (btn) {
      btn.style('display', 'block');
      btn.mousePressed(() => {
        DeviceMotionEvent.requestPermission().then(response => {
          if (response === 'granted') {
            gyroEnabled = true;
            btn.style('display', 'none');
          }
        });
      });
    }
  } else {
    // Non-iOS or older devices don't need the permission prompt
    gyroEnabled = true;
  }

  // A "hard shake" threshold. Higher = needs stronger shake to trigger.
  if (typeof setShakeThreshold === 'function') {
    setShakeThreshold(30);
  }
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}


// pick the dominant axis (x or y), then spawn from the opposite side so they "pour in".
function chooseSpawnEdgeFromGravity() {
  const gx = gyroEnabled ? gravity.x : 0;
  const gy = gyroEnabled ? gravity.y : 0;
  const mag = Math.hypot(gx, gy);

  if (mag < 0.2) {
    // Not much tilt -> random edge
    const edges = ['left', 'right', 'top', 'bottom'];
    return random(edges);
  }

  if (Math.abs(gx) >= Math.abs(gy)) {
    // Horizontal dominates

    return gx >= 0 ? 'left' : 'right';
  } else {
    // Vertical dominates

    return gy >= 0 ? 'top' : 'bottom';
  }
}

// find nearest edge for a given position
function nearestEdgeForPosition(x, y) {
  const dLeft = x;
  const dRight = width - x;
  const dTop = y;
  const dBottom = height - y;

  const minD = Math.min(dLeft, dRight, dTop, dBottom);
  if (minD === dLeft) return 'left';
  if (minD === dRight) return 'right';
  if (minD === dTop) return 'top';
  return 'bottom';
}

// Spawn particles along a given edge
function spawnParticlesFromEdge(edge) {
  particles = [];
  
  // Clear previous highlight state, record entry edge and start highlight timer
  activeEdges.spawn = edge;
  activeEdges.exit = null; // Clear exit edge highlight
  edgeHighlightStartTime = millis();
  
  for (let i = 0; i < NUM_PARTICLES; i++) {
    let x, y;
    if (edge === 'left') {
      x = PARTICLE_RADIUS / 2;
      y = random(PARTICLE_RADIUS, height - PARTICLE_RADIUS);
    } else if (edge === 'right') {
      x = width - PARTICLE_RADIUS / 2;
      y = random(PARTICLE_RADIUS, height - PARTICLE_RADIUS);
    } else if (edge === 'top') {
      x = random(PARTICLE_RADIUS, width - PARTICLE_RADIUS);
      y = PARTICLE_RADIUS / 2;
    } else if (edge === 'bottom') {
      x = random(PARTICLE_RADIUS, width - PARTICLE_RADIUS);
      y = height - PARTICLE_RADIUS / 2;
    } else {
      x = width / 2;
      y = height / 2;
    }
    particles.push({
      pos: createVector(x, y),
      prev: createVector(x, y),
      vel: createVector(0, 0),
      exiting: false,
      exitDir: null
    });
  }
}

// Set each particle to exit via its nearest edge
function setParticlesToExitNearestEdge() {
  // Record exit edge and start highlight timer - highlight only one edge
  // Count all edges where particles will exit, choose the most common edge for highlighting
  const edgeCounts = { left: 0, right: 0, top: 0, bottom: 0 };
  
  for (let p of particles) {
    const edge = nearestEdgeForPosition(p.pos.x, p.pos.y);
    edgeCounts[edge]++;
    p.exiting = true;
    if (edge === 'left') {
      p.exitDir = createVector(-1, 0);
    } else if (edge === 'right') {
      p.exitDir = createVector(1, 0);
    } else if (edge === 'top') {
      p.exitDir = createVector(0, -1);
    } else {
      p.exitDir = createVector(0, 1); // bottom
    }
  }
  
  // Find the most common edge
  let maxCount = 0;
  let mostCommonEdge = 'left';
  for (let edge in edgeCounts) {
    if (edgeCounts[edge] > maxCount) {
      maxCount = edgeCounts[edge];
      mostCommonEdge = edge;
    }
  }
  
  // Clear previous highlight state, set highlight edge and start timer
  activeEdges.exit = mostCommonEdge;
  activeEdges.spawn = null; // Clear entry edge highlight
  edgeHighlightStartTime = millis();
}

// Draw a teardrop centered at (x, y), with overall "size" and rotation "angle" (radians).
function drawTeardrop(x, y, size, angle) {
  // Size tuning: width and height of the drop relative to size
  const w = size;        // bulb width
  const h = size * 1.6;  // drop height

  push();
  translate(x, y);

  // Our path is defined pointing upward (-y). Rotate so the tip points along "angle".
  // atan2 uses +x as 0 rad; since our tip points up (-y, which is -PI/2),
  // rotate by angle + PI/2 to align.
  rotate(angle + HALF_PI);

  noStroke();

  // Draw the teardrop as two symmetric cubic Bezier curves: tip -> bottom -> back to tip
  beginShape();
  // Tip of the teardrop (top)
  vertex(0, -h / 2);

  // Right side curve down to the bulb
  // Control points sculpt the curve; tweak 0.25 and 0.1 factors to change the silhouette.
  bezierVertex(
    +w / 2, -h / 2 + h * 0.25, // control 1
    +w / 2, +h * 0.10,         // control 2
    0, +h / 2                  // bottom point
  );

  // Left side curve back up to the tip (mirror of the right)
  bezierVertex(
    -w / 2, +h * 0.10,         // control 1
    -w / 2, -h / 2 + h * 0.25, // control 2
    0, -h / 2                  // close at tip
  );
  endShape(CLOSE);

  pop();
}

// Draw edge highlight effect
function drawEdgeHighlight() {
  const currentTime = millis();
  const elapsed = currentTime - edgeHighlightStartTime;
  
  // If highlight time exceeds duration, clear highlight state
  if (elapsed > EDGE_HIGHLIGHT_DURATION) {
    activeEdges.spawn = null;
    activeEdges.exit = null;
    return;
  }
  
  // Glow effect is handled in drawEdgeLine function, just ensure noFill here
  noFill();
  
  // Ensure only one edge is highlighted at a time: prioritize exit edge, show entry edge if no exit edge
  if (activeEdges.exit) {
    drawEdgeLine(activeEdges.exit);
  } else if (activeEdges.spawn) {
    drawEdgeLine(activeEdges.spawn);
  }
}

// Draw specified edge line (with strong glow effect)
function drawEdgeLine(edge) {
  // Draw multiple layers of lines to create strong glow effect
  const currentAlpha = map(millis() - edgeHighlightStartTime, 0, EDGE_HIGHLIGHT_DURATION, 255, 0);
  
  // Add flicker effect (flicker for first 1 second, then fade)
  const elapsed = millis() - edgeHighlightStartTime;
  const flickerAlpha = elapsed < 1000 ? 
    currentAlpha * (0.8 + 0.4 * sin(millis() * 0.02)) : // Flicker for first 1 second
    currentAlpha; // Normal fade afterwards
  
  // Outermost glow (thickest, most transparent)
  stroke(150, 200, 255, flickerAlpha * 0.2);
  strokeWeight(40);
  drawSingleEdgeLine(edge);
  
  // Fifth layer glow
  stroke(120, 180, 255, flickerAlpha * 0.4);
  strokeWeight(32);
  drawSingleEdgeLine(edge);
  
  // Fourth layer glow
  stroke(100, 170, 255, flickerAlpha * 0.6);
  strokeWeight(28);
  drawSingleEdgeLine(edge);
  
  // Third layer glow
  stroke(80, 160, 255, flickerAlpha * 0.8);
  strokeWeight(24);
  drawSingleEdgeLine(edge);
  
  // Second layer glow
  stroke(60, 150, 255, flickerAlpha * 0.9);
  strokeWeight(20);
  drawSingleEdgeLine(edge);
  
  // Inner core (brightest)
  stroke(40, 140, 255, flickerAlpha);
  strokeWeight(16);
  drawSingleEdgeLine(edge);
}

// Draw single edge line
function drawSingleEdgeLine(edge) {
  if (edge === 'left') {
    line(0, 0, 0, height);
  } else if (edge === 'right') {
    line(width, 0, width, height);
  } else if (edge === 'top') {
    line(0, 0, width, 0);
  } else if (edge === 'bottom') {
    line(0, height, width, height);
  }
}

function draw() {
  background(30);

  // Verlet integration: position-based motion using previous position
  for (let p of particles) {
    const temp = p.pos.copy();

    let ax = gravity.x + random(-0.1, 0.1);
    let ay = gravity.y + random(-0.1, 0.1);

    // If exiting, push strongly in the exit direction (ignores tilt)
    if (p.exiting && p.exitDir) {
      ax = p.exitDir.x * EXIT_ACCEL;
      ay = p.exitDir.y * EXIT_ACCEL;
    }

    // p.pos += (p.pos - p.prev) * damping (0.98 for a gentle slowdown) + acceleration
    p.pos.x += (p.pos.x - p.prev.x) * 0.98 + ax;
    p.pos.y += (p.pos.y - p.prev.y) * 0.98 + ay;
    p.prev = temp;
  }

  // Relaxation: keep particles from overlapping too much
  for (let iter = 0; iter < RELAXATION_ITER; iter++) {
    for (let i = 0; i < particles.length; i++) {
      let p1 = particles[i];
      for (let j = i + 1; j < particles.length; j++) {
        let p2 = particles[j];
        let delta = p5.Vector.sub(p1.pos, p2.pos);
        let d = delta.mag();
        if (d < REST_DISTANCE && d > 0) {
          let overlap = (REST_DISTANCE - d) / 2;
          delta.normalize();
          p1.pos.add(delta.copy().mult(overlap));
          p2.pos.sub(delta.copy().mult(overlap));
        }
      }
    }
  }

  // if exiting, remove when off-screen in exit direction; otherwise clamp to screen
  for (let i = particles.length - 1; i >= 0; i--) {
    let p = particles[i];
    if (p.exiting && p.exitDir) {
      if (
        (p.exitDir.x < 0 && p.pos.x < -PARTICLE_RADIUS) ||
        (p.exitDir.x > 0 && p.pos.x > width + PARTICLE_RADIUS) ||
        (p.exitDir.y < 0 && p.pos.y < -PARTICLE_RADIUS) ||
        (p.exitDir.y > 0 && p.pos.y > height + PARTICLE_RADIUS)
      ) {
        particles.splice(i, 1);
      }
    } else {
      // Normal edge constraints
      if (p.pos.x < PARTICLE_RADIUS / 2) p.pos.x = PARTICLE_RADIUS / 2;
      if (p.pos.x > width - PARTICLE_RADIUS / 2) p.pos.x = width - PARTICLE_RADIUS / 2;
      if (p.pos.y < PARTICLE_RADIUS / 2) p.pos.y = PARTICLE_RADIUS / 2;
      if (p.pos.y > height - PARTICLE_RADIUS / 2) p.pos.y = height - PARTICLE_RADIUS / 2;
    }
  }

  // Draw particles
fill(0, 150, 255, 180);
noStroke();
for (let p of particles) {
  const vx = p.pos.x - p.prev.x;
  const vy = p.pos.y - p.prev.y;
  let angle = Math.atan2(vy, vx);

  // If nearly stationary, aim along gravity; if gravity is tiny, default to 0
  const speed = Math.hypot(vx, vy);
  if (speed < 0.01) {
    const gmag = Math.hypot(gravity.x, gravity.y);
    angle = gmag > 0.001 ? Math.atan2(gravity.y, gravity.x) : 0;
  }

  drawTeardrop(p.pos.x, p.pos.y, PARTICLE_RADIUS, angle);
}

  // Draw edge highlight effect
  drawEdgeHighlight();
  
  // Show permission instruction if needed
  if (!gyroEnabled) {
    fill(255, 255, 255, 150);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Click 'Enable Motion' button to start", width / 2, height - 30);
  }
}


// Called whenever the device registers a "shake" above the threshold
function deviceShaken() {
  if (!gyroEnabled) return;

  const now = millis();
  if (now - lastShakeTime < SHAKE_COOLDOWN) return; // Debounce
  lastShakeTime = now;

  if (particles.length === 0) {
    // First shake -> spawn
    const edge = chooseSpawnEdgeFromGravity();
    spawnParticlesFromEdge(edge);
  } else {
    // If some particles are not yet exiting, trigger exit; if already exiting, do nothing.
    const anyNotExiting = particles.some(p => !p.exiting);
    if (anyNotExiting) {
      setParticlesToExitNearestEdge();
    }
  }
}

// Update gravity from tilt (continuous)
// This is separate from a shake, which only triggers deviceShaken()
function deviceMoved() {
  if (
    gyroEnabled &&
    typeof accelerationX !== 'undefined' &&
    typeof accelerationY !== 'undefined'
  ) {
    gravity.x = accelerationX * 0.5;
    gravity.y = accelerationY * 0.5;
  }
}

// Desktop fallback: move mouse to fake "gravity" (tilt)
function mouseMoved() {
  if (!gyroEnabled) {
    gravity.x = map(mouseX, 0, width, -1, 1);
    gravity.y = map(mouseY, 0, height, -1, 1);
  }
}


```

---

## Critique & Feedback
- **Instructor Feedback:**  
  -  
- **Peer Feedback:**  
  -  

---

## Reflection & Connections
- **How does this link theory + practice?**  
  -  
- **Personal Insights / Questions:**  
  -  

---

## To-Do & Follow-up
- [ ] No class next tuesday
- [ ] Studio experiment to try:  
- [ ] Concept to develop further:  

---

## Links & Resources
- https://minimaforms.com/project/facebreeder
- https://www.sonyarapoport.org/shoefield
- https://ryanlintott.com/portfolio-item/wcmc-discovery-wall/
- https://met.andreasrau.eu/, https://log.fakewhale.xyz/andreas-rau-symphony-for-n-metronomes-a-shared-time-a-distributed-gesture/
	- Accessing all the functions embedded in a phone
	- Wayfinder, Gysin Vanetti, worked backward, made a media for this specific function
- https://www.simonweckert.com/googlemapshacks.html
- https://en.wikipedia.org/wiki/A_(For_100_Cars)
- Deflectron, Niklas Roy, https://www.niklasroy.com/deflektron/
- Frank, Seth Brown
	- swipe gesture, an instagram watching hot dog
- https://kuehfuss.com/nintendogs/
- https://www.arnaudpfeffer.com/
	- penplotter
- https://specialprojects.studio/project/aperture/ %% too clean %%
- https://www.designboom.com/art/three-kinetic-generative-sculptures-internal-psychological-states-digital-poems-models-crisis-jakub-kozniewski-05-31-2025/
- https://www.gabebc.com/
- https://marcteyssier.com/projects/mobilimb/


---

## Tags
#class-notes #theory #practice
### Readings & Context

These are all short articles and talks that reference important issues we will cover

### **Essays**

_**[We Need to ReWild the InternetLinks to an external site.](https://www.noemamag.com/we-need-to-rewild-the-internet/)**_ – Maria Farrell and Robin Berjon

Core text of the Atelier that describes the current state of the internet as an anemic walled garden.

_**[Tell, Don't Show : Algorithmic Thinking for BeginnersLinks to an external site.](https://inventionofdesire.com/feature/tell-dont-show-algorithmic-thinking-for-beginners/38446)**_ - Veronique Vienne

Algorithmic thinking: the ability to state precisely what you only know intuitively.

_**[Tiktok’s EnshittificationLinks to an external site.](https://pluralistic.net/2023/01/21/potemkin-ai/#hey-guys)**_ – Cory Doctorow

Description of how online platforms grow and die

_**[Games, Play, JoyLinks to an external site.](https://jfriedhoff.medium.com/games-play-and-joy-part-1-75991ff32e69)**_ – Jane Friedhoff

Collection of short essays that discuss strategies for creating Joy in playful interactions

[_**Expanding Software**_Links to an external site.](https://www.lerandom.art/editorial/casey-reas-lauren-lee-mccarthy-chandler-mcwilliams-on-expanding-software) - Casey Reas, Lauren Lee McCarthy & Chandler McWilliams

How digital technologies intersect with art and society along with the importance of preserving the history of Internet-based art.

_**[Lessons for Students Links to an external site.](https://zachlieberman.medium.com/lessons-for-students-cf1acf200ee "Link")-**_ Zach Lieberman

A general guide to grad school when working with technologies

### **Talks**

[_**Designing With Code**_Links to an external site.](https://www.youtube.com/watch?v=gg-eN5GtCBA) - Talia Cotton

[_**A Circuitous History of Print**_Links to an external site.](https://www.youtube.com/watch?v=73iBaIu2RTg&list=FLFEOyBbznJsOwmO5dDa3YTQ) - Jennifer Roberts

### **Contemporary Web**

_**[A.I. Can’t Give You Good TasteLinks to an external site.](https://www.itsnicethat.com/articles/elizabeth-goodspeed-column-taste-technology-art-280224)**_ – Elizabeth Goodspeed

Essay describing the role of designers in an age where content creation is “easy”

_**[Everyone’s a Sellout NowLinks to an external site.](https://www.vox.com/culture/2024/2/1/24056883/tiktok-self-promotion-artist-career-how-to-build-following)**_ – Rebecca Jennings

A depressing, but accurate description of the contemporary relationship between creative practice, social media, and self-promotion

### **Web History**

_**[Evolving Out of the Virtual MudLinks to an external site.](https://www.cabinetmagazine.org/issues/19/wertheim_burton.php)**_ – Margaret Wertheim & Ed Burton

Interview on the creation of Soda Constructor. An early example of virtual creatures that could be created online.

_**[Le Random Timeline, 1990s Net EraLinks to an external site.](https://timeline.lerandom.art/#/chapter-7)**_

Timeline of key interactive works from the 1990s

_**[Le Random Timeline, 2000s Tooling EraLinks to an external site.](https://timeline.lerandom.art/#/chapter-8)**_

Timeline of key interactive works from the 2000s

### **Readings About p5.js** 

_**[Learn to Leverage the p5.js Javascript Library for Art and Design](https://makezine.com/2015/12/07/getting-started-p5-js/)**_ - Lauren McCarthy

_**[Making Space for the Future of p5.js](https://medium.com/processing-foundation/making-space-for-the-future-of-p5-js-d3c6bd3da9ac)**_ - Lauren McCarthy

_**[Always look at where you want to go — not where you don’t want to be.](https://medium.com/processing-foundation/always-look-at-where-you-want-to-go-not-where-you-dont-want-to-be-69f82ba58762)**_  - Moira Turner