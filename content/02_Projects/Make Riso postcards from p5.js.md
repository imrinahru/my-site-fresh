---
title: Make Riso postcards from p5.js
date: 2025-12-15
tags:
  - project
  - printmaking
  - risograph
summary: A guide to make color separated postcard design in p5.js for riso printing.
status: in-progress
cover: "-"
draft: false
---


## Context

When making art using Riso, I like to print any design on a postcard size, since it's an easy format to host a design (unlike a packaging), it can be one off (as compared to zine), it is semi-functional, and it always felt more accessible than a poster or an art piece that may require a frame or even a space on the wall of some sort. 

So when I printed this poster for my program's Open Show, I was also tempting to create a postcard version of it.

**Poster** (Cute illustration by [Melanie](https://www.melanieyan.com/))

![[WhatsApp Image 2026-01-15 at 11.18.11 PM.jpeg]]
![[WhatsApp Image 2026-01-15 at 11.19.25 PM.jpeg]]
More than 50 posters were put around canvas, thanks to classmates and professors spreading them.

**Postcards!**

![[WhatsApp Image 2026-01-15 at 11.19.14 PM.jpeg]]
![[WhatsApp Image 2026-01-15 at 11.19.14 PM (1).jpeg]]
![[WhatsApp Image 2026-01-15 at 11.19.14 PM (3).jpeg]]
![[WhatsApp Image 2026-01-15 at 11.19.14 PM (2).jpeg]]

While the posters are gone, it's a pleasure to see that many students have kept their postcards displayed on their desks. 
## How to Prepare a Postcard File (Front)


I prepare data in p5.js, since my art work is mostly coded, sometimes using p5.riso library. And p5.js helps to freely change the paper size and resolution for my original artwork using buffer. Some useful concepts and functions to include:
### DPI PPI

How do I make an artwork at 300 DPI?

The ratio of the conversion from PPI to DPI is usually 1:1. This means that if an image is ten inches wide by ten inches high at 300 DPI, the pixel dimensions must be 3000px x 3000px. To obtain the proper pixel dimenbjecrsions (e.g., 3000 x 3000 px) to offer 300 DPI, you must multiply the print size (width and height in inches) by 300.

| **Print Size (Inches)** | **Pixel Dimensions** |
| ----------------------- | -------------------- |
| 4 x 6”                  | 1200px x 1800px      |
| 8 x 10"                 | 2400px x 3000px      |
| 12 x 18                 | 3600px x 5400px      |

### Change Canvas Preview Size

 Set up a canvas for preview, keeping aspect ratio
```
  let viewW = min(windowWidth, PX_W / 2);
  let viewH = (viewW * PX_H) / PX_W;
  createCanvas(viewW, viewH);
  pixelDensity(CANVAS_PIXEL_DENSITY);
```

OR,
the canvas can be of smaller resolution, and create high-res buffers for export only. But the design can be easily replaced if the scale/random seed is not managed properly. It's worth trying when the rendering is too slow.


### Using Buffer

Using p5.js buffer methods to draw design on a separate buffer, and then render on to the final postcard format (canvas).

- ✅ `createGraphics()` – create buffers
- ✅ `buffer.background()` – fill background
- ✅ `buffer.fill()`, `buffer.stroke()` – set colors
- ✅ `buffer.text()`, `buffer.circle()`, `buffer.rect()` – draw shapes
- ✅ `buffer.image()` – place postcards on letter
- ✅ `buffer.save()` – export PNG

(buffer. can also be expressed as g.)


### Convert Buffer to JPEG 

Using piexifjs library, a tool that lets you add "information labels" to JPEG files. So that DPI and canvas size set in p5.js will be correctly reflected in JPEG and Photoshop etc.

Turning to jpeg is good for later manipulation in Illustrator.
There is a way to export in PDF [[(WIP) Riso_3D (WEBGL)|as well]].

Steps:
```
┌─────────────────────────────────────────────────┐
│ 1. p5.Graphics Buffer (1800 × 1200 pixels)      │
└─────────────┬───────────────────────────────────┘
              │
              ↓
┌────────────��────────────────────────────────────┐
│ 2. canvas.toDataURL("image/jpeg", 0.95)         │
│    → JPEG with default 96 DPI                   │
└─────────────┬───────────────────────────────────┘
              │
              ↓
┌─────────────────────────────────────────────────┐
│ 3. setJPEGDPIInDataURL_JFIF(dataURL, 300)       │
│    → Edit JFIF bytes: 96 DPI → 300 DPI         │
└─────────────┬───────────────────────────────────┘
              │
              ↓
┌─────────────────────────────────────────────────┐
│ 4. piexif.insert(exifBytes, dataURL)            │
│    → Add EXIF metadata: 300 DPI, inches         │
└─────────────┬───────────────────────────────────┘
              │
              ↓
┌─────────────────────────────────────────────────┐
│ 5. downloadDataURL(filename, dataURL)           │
│    → Download JPEG with 300 DPI in BOTH places  │
└─────────────────────────────────────────────────┘
```

```
saveGraphicsAsJPEGWithDPI(buffer, "postcard.jpg", 300, 0.95);
//                        ↑       ↑               ↑    ↑
//                        |       |               |    Quality (95%)
//                        |       |               DPI to embed
//                        |       Filename
//                        Buffer to save

// This function:
// 1. Converts buffer → JPEG
// 2. Adds 300 DPI to JFIF header (manual binary edit)
// 3. Adds 300 DPI to EXIF metadata (piexifjs library)
// 4. Downloads the file

// Result: JPEG that prints at exactly 6" × 4"!
```

## Example

![[treering_letter.svg]]
![[treering.png]]

Code:

### **index.html**

Add
```
<script src="https://unpkg.com/piexifjs"></script>
```
To manipulates EXIF metadata in JPEG images
Used in `saveGraphicsAsJPEGWithDPI()` function to embed 300 DPI info
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>p5.js Postcard Generator</title>
    
    <!-- p5.js Core -->
    <script src="https://cdn.jsdelivr.net/npm/p5@1.11.10/lib/p5.js"></script>
    
    <!-- EXIF Metadata Library (for DPI embedding) -->
    <script src="https://unpkg.com/piexifjs"></script>
    
    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  <body>
    <main></main>
    <script src="sketch.js"></script>
  </body>
</html>

```

### **sketch.js**

Create 3 buffer layers, one line, another filled, the third is combined:
```
let filledLayer = createGraphics(PX_W, PX_H);
let linedLayer = createGraphics(PX_W, PX_H);
//      ↑ These are buffers (p5.Graphics objects)
```
Then pass buffers to functions
```
// Pass the buffer as the first parameter
drawFilledRings(filledLayer, cx, cy, r);
//              ↑ This buffer becomes 'g' inside the function

drawLinedRings(linedLayer, cx, cy, r);
//             ��� This buffer becomes 'g' inside the function
```
Then use g inside functions
```
function drawFilledRings(g, cx, cy, radius) {
  //                     ↑ 'g' is whatever buffer you passed in
  
  g.push();           // Same as filledLayer.push()
  g.noStroke();       // Same as filledLayer.noStroke()
  g.fill(180, 160);   // Same as filledLayer.fill(180, 160)
  g.beginShape();     // Same as filledLayer.beginShape()
  g.curveVertex(x, y);// Same as filledLayer.curveVertex(x, y)
  g.endShape(CLOSE);  // Same as filledLayer.endShape(CLOSE)
  g.pop();            // Same as filledLayer.pop()
}
```

```
// In setup():
let filledLayer = createGraphics(1800, 1200);
let linedLayer = createGraphics(1800, 1200);

// Call function:
drawFilledRings(filledLayer, 100, 100, 50);
//              ↓
//              This becomes 'g'

// Inside function:
function drawFilledRings(g, cx, cy, radius) {
  //                     ↑
  //                     g = filledLayer
  
  g.fill(255); // Actually drawing on filledLayer
}
```

The entire code (needs more cleaning after Copilot):
```
// Letter size at 300dpi
const DPI = 300;
const INCHES_W = 6;
const INCHES_H = 4;
const PX_W = INCHES_W * DPI;
const PX_H = INCHES_H * DPI;
const CANVAS_PIXEL_DENSITY = 1;
const BUFF_PIXEL_DENSITY = 1;

let hiResGraphics;   // composite preview/export (PNG)
let filledLayer;     // filled rings only (transparent background)
let linedLayer;      // lined rings only (transparent background)

function setup() {
  // Set up a canvas for preview, keeping aspect ratio
  let viewW = min(windowWidth, PX_W / 2);
  let viewH = (viewW * PX_H) / PX_W;
  createCanvas(viewW, viewH);
  pixelDensity(CANVAS_PIXEL_DENSITY);

  // Create the high-res graphics buffers
  hiResGraphics = createGraphics(PX_W, PX_H);
  hiResGraphics.pixelDensity(BUFF_PIXEL_DENSITY);
  hiResGraphics.clear(); // transparent composite

  filledLayer = createGraphics(PX_W, PX_H);
  filledLayer.pixelDensity(BUFF_PIXEL_DENSITY);
  filledLayer.clear();

  linedLayer = createGraphics(PX_W, PX_H);
  linedLayer.pixelDensity(BUFF_PIXEL_DENSITY);
  linedLayer.clear();

  // Draw a 3 (cols) x 2 (rows) grid of motifs (each one different: no seeding)
  const GRID_COLS = 3;
  const GRID_ROWS = 2;
  const cellW = PX_W / GRID_COLS;
  const cellH = PX_H / GRID_ROWS;
  const baseRadius = min(cellW, cellH) / 2 - 70;

  for (let row = 0; row < GRID_ROWS; row++) {
    for (let col = 0; col < GRID_COLS; col++) {
      const cx = col * cellW + cellW / 2;
      const cy = row * cellH + cellH / 2;
      const r = baseRadius * random(0.65, 1); // slight variation

      // Draw onto separate layers
      drawFilledRings(filledLayer, cx, cy, r);
      drawLinedRings(linedLayer, cx, cy, r);
    }
  }

  // Compose layers into the composite for preview/export
  hiResGraphics.image(filledLayer, 0, 0);
  hiResGraphics.image(linedLayer, 0, 0);

  // Render once
  noLoop();
}

function draw() {
  // Show a scaled-down preview of the hi-res composite image
  background(220);
  image(hiResGraphics, 0, 0, width, height);
}

// Save the image at full resolution when 's' is pressed
function keyPressed() {
  if (key === "s" || key === "S") {
    // Save combined composite as PNG (preserves transparency)
    hiResGraphics.save("postcard-6x4.png");

    // Save filled rings layer as JPEG on white background with 300 DPI in JFIF + EXIF
    let tmpFilled = createGraphics(PX_W, PX_H);
    tmpFilled.pixelDensity(BUFF_PIXEL_DENSITY);
    tmpFilled.background(255); // white background for JPEG
    tmpFilled.image(filledLayer, 0, 0);
    saveGraphicsAsJPEGWithDPI(tmpFilled, "postcard-6x4-filled-rings.jpg", 300, 0.95);

    // Save lined rings layer as JPEG on white background with 300 DPI in JFIF + EXIF
    let tmpLined = createGraphics(PX_W, PX_H);
    tmpLined.pixelDensity(BUFF_PIXEL_DENSITY);
    tmpLined.background(255); // white background for JPEG
    tmpLined.image(linedLayer, 0, 0);
    saveGraphicsAsJPEGWithDPI(tmpLined, "postcard-6x4-lined-rings.jpg", 300, 0.95);
  }
}

// Draw only the filled noisy rings (concentric, each randomly smaller)
function drawFilledRings(g, cx, cy, radius) {
  const colorRings = 24;
  const noiseScale = 50;
  const resolution = 0.002;
  const numPoints = 500;

  g.push();
  g.noStroke();
  let r = radius * random(0.98, 1.02); // start from the outer radius
  for (let c = 0; c < colorRings && r > 5; c++) {
    // Add transparency so overlaps show through
    if (c % 3 === 1) {
      g.fill(180, 160); // gray with alpha
    } else {
      g.fill(220, 160);
    }

    g.beginShape();
    for (let a = 0; a < TAU; a += TAU / numPoints) {
      const x = cx + r * cos(a);
      const y = cy + r * sin(a);
      const n = map(
        noise(x * resolution, y * resolution),
        0,
        1,
        -noiseScale,
        noiseScale
      );
      g.curveVertex(x + n, y + n);
    }
    g.endShape(CLOSE);

    // Randomly shrink radius for this ring (monotonic decrease)
    const ringR = r * random(0.86, 0.97);

    g.beginShape();
    for (let a = 0; a < TAU; a += TAU / numPoints) {
      const x = cx + ringR * cos(a);
      const y = cy + ringR * sin(a);
      const n = map(
        noise(x * resolution, y * resolution),
        0,
        1,
        -noiseScale,
        noiseScale
      );
      g.curveVertex(x + n, y + n);
    }
    g.endShape(CLOSE);

    // Next ring starts from the current ring's radius
    r = ringR;
  }
  g.pop();
}

// Draw only the stroked noisy rings
function drawLinedRings(g, cx, cy, radius) {
  const noiseScale = 50;
  const resolution = 0.002;
  const numPoints = 500;
  const numRings = 80;

  g.push();
  g.stroke(0);
  g.strokeWeight(1);
  g.noFill();
  for (let rr = 0; rr < radius; rr += radius / numRings) {
    if (random() > 0.45 + rr / 1000 - noise(rr - 0.001, rr)) {
      g.beginShape();
      for (let a = 0; a <= TAU; a += TAU / numPoints) {
        const ox = cx + rr * cos(a);
        const oy = cy + rr * sin(a);
        const q = map(
          noise(ox * resolution, oy * resolution),
          0,
          1,
          -noiseScale,
          noiseScale
        );
        g.curveVertex(ox + q, oy + q);

        if (random() > 0.75 - 0.25 * sin(a) * cos(a)) {
          g.endShape();
          g.beginShape();
        }
      }
      g.endShape();
    }
  }
  g.pop();
}

/**
 * Save a p5.Graphics as JPEG with explicit 300 DPI in BOTH:
 * - JFIF header (what Windows Explorer reads)
 * - EXIF XResolution/YResolution (what many editors read)
 *
 * Optionally include piexifjs on your page:
 * <script src="https://unpkg.com/piexifjs"></script>
 */
function saveGraphicsAsJPEGWithDPI(g, filename, dpi = 300, quality = 0.95) {
  const canvas = g.elt || g.canvas || g;
  // Encode to JPEG
  let dataURL = canvas.toDataURL("image/jpeg", quality);

  // Patch JFIF density to DPI so Windows Explorer shows 300 DPI
  dataURL = setJPEGDPIInDataURL_JFIF(dataURL, dpi);

  // Also add EXIF X/YResolution if piexif is available (nice-to-have)
  if (typeof piexif !== "undefined") {
    const exifObj = { "0th": {} };
    exifObj["0th"][piexif.ImageIFD.XResolution] = [dpi, 1];
    exifObj["0th"][piexif.ImageIFD.YResolution] = [dpi, 1];
    exifObj["0th"][piexif.ImageIFD.ResolutionUnit] = 2; // inches
    const exifBytes = piexif.dump(exifObj);
    dataURL = piexif.insert(exifBytes, dataURL);
  }

  downloadDataURL(filename, dataURL);
}

// Ensure JFIF APP0 has Units=1 (dpi) and X/Ydensity=dpi; insert if missing
function setJPEGDPIInDataURL_JFIF(dataURL, dpi) {
  const bytes = base64ToBytes(dataURL.split(",")[1]);
  if (bytes[0] !== 0xFF || bytes[1] !== 0xD8) {
    // Not a JPEG; return original
    return dataURL;
  }

  // Find existing APP0 JFIF
  let i = 2;
  let foundJFIF = false;
  while (i + 4 < bytes.length && bytes[i] === 0xFF) {
    const marker = bytes[i + 1];
    if (marker === 0xDA) break; // SOS - stop scanning headers
    const segLen = (bytes[i + 2] << 8) | bytes[i + 3];
    const segStart = i + 4;
    const segEnd = segStart + segLen;

    if (marker === 0xE0 && segStart + 5 <= bytes.length) {
      // APP0 - check for "JFIF\0"
      if (
        segStart + 5 <= bytes.length &&
        bytes[segStart] === 0x4A && // J
        bytes[segStart + 1] === 0x46 && // F
        bytes[segStart + 2] === 0x49 && // I
        bytes[segStart + 3] === 0x46 && // F
        bytes[segStart + 4] === 0x00
      ) {
        // Payload layout after length:
        // "JFIF\0"(5), ver(2), units(1), Xden(2), Yden(2), Xthumb(1), Ythumb(1) ...
        const payload = segStart;
        const unitsOffset = payload + 7;
        const xDenOffset = payload + 8;
        const yDenOffset = payload + 10;

        bytes[unitsOffset] = 0x01; // 1 = dpi
        bytes[xDenOffset] = (dpi >> 8) & 0xff;
        bytes[xDenOffset + 1] = dpi & 0xff;
        bytes[yDenOffset] = (dpi >> 8) & 0xff;
        bytes[yDenOffset + 1] = dpi & 0xff;

        foundJFIF = true;
        break;
      }
    }

    i = segEnd;
  }

  // If no JFIF found, insert one right after SOI (FFD8)
  let outBytes = bytes;
  if (!foundJFIF) {
    const app0 = new Uint8Array(20);
    app0[0] = 0xff; app0[1] = 0xe0; // APP0
    app0[2] = 0x00; app0[3] = 0x10; // length = 16 bytes of payload
    // "JFIF\0"
    app0[4] = 0x4a; app0[5] = 0x46; app0[6] = 0x49; app0[7] = 0x46; app0[8] = 0x00;
    // version 1.01
    app0[9] = 0x01; app0[10] = 0x01;
    // units = 1 (dpi)
    app0[11] = 0x01;
    // Xdensity
    app0[12] = (dpi >> 8) & 0xff; app0[13] = dpi & 0xff;
    // Ydensity
    app0[14] = (dpi >> 8) & 0xff; app0[15] = dpi & 0xff;
    // Xthumbnail, Ythumbnail
    app0[16] = 0x00; app0[17] = 0x00;
    // Note: payload length 16 matches standard JFIF header without thumbnail; the last two
    // bytes of the 20-byte block are marker+len; the 16 payload bytes end at offset 19.

    outBytes = new Uint8Array(bytes.length + app0.length);
    // SOI
    outBytes.set(bytes.subarray(0, 2), 0);
    // APP0 JFIF
    outBytes.set(app0, 2);
    // rest of original JPEG
    outBytes.set(bytes.subarray(2), 2 + app0.length);
  }

  const outBase64 = bytesToBase64(outBytes);
  return "data:image/jpeg;base64," + outBase64;
}

// Utilities
function base64ToBytes(b64) {
  const bin = atob(b64);
  const len = bin.length;
  const bytes = new Uint8Array(len);
  for (let i = 0; i < len; i++) bytes[i] = bin.charCodeAt(i);
  return bytes;
}
function bytesToBase64(bytes) {
  let bin = "";
  const chunk = 0x8000;
  for (let i = 0; i < bytes.length; i += chunk) {
    bin += String.fromCharCode.apply(null, bytes.subarray(i, i + chunk));
  }
  return btoa(bin);
}

// Trigger a download from a data URL
function downloadDataURL(name, url) {
  const a = document.createElement("a");
  a.href = url;
  a.download = name;
  document.body.appendChild(a);
  a.click();
  a.remove();
}

```


### Detailed Explanation (by Copilot)

The notes are quite helpful.

### What This Code Does

Code

```
1. Creates 3 BUFFERS (offscreen graphics)
   ├─ hiResGraphics: Combined preview
   ├─ filledLayer: Gray filled rings only
   └─ linedLayer: Black line rings only

2. Draws 3×2 grid of organic ring motifs
   ├─ Each motif centered in grid cell
   ├─ Filled rings → filledLayer
   └─ Lined rings → linedLayer

3. Composites layers for preview
   └─ hiResGraphics = filledLayer + linedLayer

4. Exports 3 print-ready files (press 'S')
   ├─ postcard-6x4.png (composite)
   ├─ postcard-6x4-filled-rings.jpg (300 DPI)
   └─ postcard-6x4-lined-rings.jpg (300 DPI)
```

---

### Architecture Breakdown

#### 1. **Print Dimensions (300 DPI)**

JavaScript

```
const DPI = 300;
const INCHES_W = 6;   // 6 inches wide
const INCHES_H = 4;   // 4 inches tall
const PX_W = INCHES_W * DPI;  // 1800 pixels
const PX_H = INCHES_H * DPI;  // 1200 pixels
```

**Why 300 DPI?** Professional print standard for sharp output.

---

#### 2. **Buffer Setup (Layer Separation)**

JavaScript

```
// THREE separate buffers for color separation
hiResGraphics = createGraphics(PX_W, PX_H);  // Composite
filledLayer = createGraphics(PX_W, PX_H);    // Layer 1: Fills
linedLayer = createGraphics(PX_W, PX_H);     // Layer 2: Lines
```

**Color Separation = Printing Layers**

- Each layer can be a different ink color (Risograph, screen printing)
- Or different printing passes (embossing, foil stamping)

---

#### 3. **Grid Layout System**

JavaScript

```
const GRID_COLS = 3;  // 3 columns
const GRID_ROWS = 2;  // 2 rows
const cellW = PX_W / GRID_COLS;  // 600px per cell
const cellH = PX_H / GRID_ROWS;  // 600px per cell

// Calculate center of each cell
for (let row = 0; row < GRID_ROWS; row++) {
  for (let col = 0; col < GRID_COLS; col++) {
    const cx = col * cellW + cellW / 2;  // Cell center X
    const cy = row * cellH + cellH / 2;  // Cell center Y
    const r = baseRadius * random(0.65, 1); // Vary size
    
    // Draw on SEPARATE layers
    drawFilledRings(filledLayer, cx, cy, r);
    drawLinedRings(linedLayer, cx, cy, r);
  }
}
```

**Result:** 6 unique motifs (no seeding = different every time)

---

#### 4. **Drawing Functions (Generative Art)**

#### A. Filled Rings (Organic Blobs)

JavaScript

```
function drawFilledRings(g, cx, cy, radius) {
  const colorRings = 24;      // Number of concentric rings
  const noiseScale = 50;      // How wavy the edges are
  const resolution = 0.002;   // Perlin noise detail
  const numPoints = 500;      // Smoothness of curves
  
  let r = radius;
  for (let c = 0; c < colorRings && r > 5; c++) {
    // Alternate gray shades with transparency
    if (c % 3 === 1) {
      g.fill(180, 160); // Medium gray, 160 alpha
    } else {
      g.fill(220, 160); // Light gray, 160 alpha
    }
    
    g.beginShape();
    for (let a = 0; a < TAU; a += TAU / numPoints) {
      // Position on circle
      const x = cx + r * cos(a);
      const y = cy + r * sin(a);
      
      // Add Perlin noise distortion
      const n = map(
        noise(x * resolution, y * resolution),
        0, 1,
        -noiseScale, noiseScale  // ±50 pixel wobble
      );
      
      g.curveVertex(x + n, y + n);  // Smooth curve point
    }
    g.endShape(CLOSE);
    
    // Shrink radius randomly for next ring
    r = r * random(0.86, 0.97);  // 86-97% of previous size
  }
}
```

**Effect:** Organic, hand-drawn looking concentric shapes

---

#### B. Lined Rings (Broken Circles)

JavaScript

```
function drawLinedRings(g, cx, cy, radius) {
  const numRings = 80;  // Many rings from center to edge
  
  g.stroke(0);        // Black lines
  g.strokeWeight(1);  // Thin lines
  g.noFill();
  
  for (let rr = 0; rr < radius; rr += radius / numRings) {
    // Randomly skip rings (adds variation)
    if (random() > 0.45 + rr / 1000 - noise(rr - 0.001, rr)) {
      g.beginShape();
      
      for (let a = 0; a <= TAU; a += TAU / numPoints) {
        const ox = cx + rr * cos(a);
        const oy = cy + rr * sin(a);
        
        // Add noise distortion
        const q = map(
          noise(ox * resolution, oy * resolution),
          0, 1,
          -noiseScale, noiseScale
        );
        
        g.curveVertex(ox + q, oy + q);
        
        // Randomly break the line (creates gaps)
        if (random() > 0.75 - 0.25 * sin(a) * cos(a)) {
          g.endShape();
          g.beginShape();  // Start new segment
        }
      }
      g.endShape();
    }
  }
}
```

**Effect:** Sketchy, hand-drawn concentric circles with gaps

---

#### 5. **Layer Compositing**

JavaScript

```
// Stack layers (like Photoshop layers)
hiResGraphics.image(filledLayer, 0, 0);  // Bottom layer
hiResGraphics.image(linedLayer, 0, 0);   // Top layer
```

---

#### 6. **Export with DPI Metadata**

JavaScript

```
function keyPressed() {
  if (key === "s" || key === "S") {
    // 1. PNG composite (preserves transparency)
    hiResGraphics.save("postcard-6x4.png");
    
    // 2. Filled layer as JPEG with white background
    let tmpFilled = createGraphics(PX_W, PX_H);
    tmpFilled.background(255);  // White (JPEGs can't be transparent)
    tmpFilled.image(filledLayer, 0, 0);
    saveGraphicsAsJPEGWithDPI(tmpFilled, "postcard-6x4-filled-rings.jpg", 300, 0.95);
    
    // 3. Lined layer as JPEG with white background
    let tmpLined = createGraphics(PX_W, PX_H);
    tmpLined.background(255);
    tmpLined.image(linedLayer, 0, 0);
    saveGraphicsAsJPEGWithDPI(tmpLined, "postcard-6x4-lined-rings.jpg", 300, 0.95);
  }
}
```

**Why temporary buffers?**

- Original layers have transparent backgrounds
- JPEGs don't support transparency
- Create temp buffer → add white background → export

---

#### 7. DPI Embedding
JavaScript

```
function saveGraphicsAsJPEGWithDPI(g, filename, dpi = 300, quality = 0.95) {
  // 1. Convert buffer to JPEG data URL
  let dataURL = canvas.toDataURL("image/jpeg", quality);
  
  // 2. Manually edit JPEG binary to set DPI in JFIF header
  dataURL = setJPEGDPIInDataURL_JFIF(dataURL, dpi);
  
  // 3. Add DPI to EXIF metadata (if piexifjs is loaded)
  if (typeof piexif !== "undefined") {
    const exifObj = { "0th": {} };
    exifObj["0th"][piexif.ImageIFD.XResolution] = [dpi, 1];  // X DPI
    exifObj["0th"][piexif.ImageIFD.YResolution] = [dpi, 1];  // Y DPI
    exifObj["0th"][piexif.ImageIFD.ResolutionUnit] = 2;      // 2 = inches
    const exifBytes = piexif.dump(exifObj);
    dataURL = piexif.insert(exifBytes, dataURL);
  }
  
  downloadDataURL(filename, dataURL);
}
```

**Two metadata locations:**

- **JFIF header** (Windows reads this)
- **EXIF tags** (Photoshop/printers read this)

How **EXIF Data Structure (Simplified)** is modified:

JavaScript

```
{
  "0th": {           // Main image info
    XResolution: [300, 1],      // 300 DPI horizontal
    YResolution: [300, 1],      // 300 DPI vertical
    ResolutionUnit: 2           // Units = inches
  },
  "Exif": {},        // Camera settings (we don't use)
  "GPS": {}          // Location data (we don't use)
}
```

## Appendix: Using Low Resolution Canvas

I tried to keep the canvas resolution low, and only render high resolution when saving the image, but the result is not satisfying as you can see the fine details/lines are mostly lost.
![[postcard-composite-300dpi.png]]
![[postcard-filled-300dpi.jpg]]

```
// ========================================
// CONFIGURATION
// ========================================
const DPI = 300;
const INCHES_W = 6;
const INCHES_H = 4;

// Dual resolution setup
const SCALE_FACTOR = 3;  // Print is 3× larger
const SCREEN_W = 600;
const SCREEN_H = 400;
const PRINT_W = SCREEN_W * SCALE_FACTOR;  // 1800
const PRINT_H = SCREEN_H * SCALE_FACTOR;  // 1200

// Design seed (for consistent random generation)
const DESIGN_SEED = 42;

let screenComposite, screenFilled, screenLined;

// ========================================
// SETUP
// ========================================
function setup() {
  // Canvas for preview
  let viewW = min(windowWidth, SCREEN_W);
  let viewH = (viewW * SCREEN_H) / SCREEN_W;
  createCanvas(viewW, viewH);
  pixelDensity(1);

  // Create SCREEN-RESOLUTION buffers
  screenComposite = createGraphics(SCREEN_W, SCREEN_H);
  screenFilled = createGraphics(SCREEN_W, SCREEN_H);
  screenLined = createGraphics(SCREEN_W, SCREEN_H);

  // Design at screen resolution
  designPostcard(screenFilled, screenLined, 1);  // scale = 1

  // Composite
  screenComposite.clear();
  screenComposite.image(screenFilled, 0, 0);
  screenComposite.image(screenLined, 0, 0);

  noLoop();
  
  console.log("Screen buffers: " + SCREEN_W + "×" + SCREEN_H);
  console.log("Memory: ~" + ((SCREEN_W * SCREEN_H * 4 * 3) / 1024 / 1024).toFixed(1) + " MB");
}

// ========================================
// PREVIEW
// ========================================
function draw() {
  background(220);
  image(screenComposite, 0, 0, width, height);
  
  // Show info
  fill(0);
  noStroke();
  textSize(10);
  text("Preview (press 'S' to export at 300 DPI)", 10, height - 10);
}

// ========================================
// DESIGN FUNCTION (Scale-Independent)
// ========================================
function designPostcard(filledLayer, linedLayer, scale) {
  // Grid setup
  const GRID_COLS = 3;
  const GRID_ROWS = 2;
  const cellW = (SCREEN_W * scale) / GRID_COLS;
  const cellH = (SCREEN_H * scale) / GRID_ROWS;
  const baseRadius = min(cellW, cellH) / 2 - (70 * scale);

  // Use seed for consistent randomness
  randomSeed(DESIGN_SEED);
  noiseSeed(DESIGN_SEED);

  for (let row = 0; row < GRID_ROWS; row++) {
    for (let col = 0; col < GRID_COLS; col++) {
      const cx = col * cellW + cellW / 2;
      const cy = row * cellH + cellH / 2;
      const r = baseRadius * random(0.65, 1);

      drawFilledRings(filledLayer, cx, cy, r, scale);
      drawLinedRings(linedLayer, cx, cy, r, scale);
    }
  }
}

// ========================================
// DRAWING FUNCTIONS (Scale-Aware)
// ========================================
function drawFilledRings(g, cx, cy, radius, scale) {
  const colorRings = 24;
  const noiseScale = 50 * scale;
  const resolution = 0.002 / scale;
  const numPoints = 500;

  g.push();
  g.noStroke();
  let r = radius * random(0.98, 1.02);
  
  for (let c = 0; c < colorRings && r > 5 * scale; c++) {
    if (c % 3 === 1) {
      g.fill(180, 160);
    } else {
      g.fill(220, 160);
    }

    g.beginShape();
    for (let a = 0; a < TAU; a += TAU / numPoints) {
      const x = cx + r * cos(a);
      const y = cy + r * sin(a);
      const n = map(
        noise(x * resolution, y * resolution),
        0, 1,
        -noiseScale, noiseScale
      );
      g.curveVertex(x + n, y + n);
    }
    g.endShape(CLOSE);

    const ringR = r * random(0.86, 0.97);

    g.beginShape();
    for (let a = 0; a < TAU; a += TAU / numPoints) {
      const x = cx + ringR * cos(a);
      const y = cy + ringR * sin(a);
      const n = map(
        noise(x * resolution, y * resolution),
        0, 1,
        -noiseScale, noiseScale
      );
      g.curveVertex(x + n, y + n);
    }
    g.endShape(CLOSE);

    r = ringR;
  }
  g.pop();
}

function drawLinedRings(g, cx, cy, radius, scale) {
  const noiseScale = 50 * scale;
  const resolution = 0.002 / scale;
  const numPoints = 500;
  const numRings = 80;

  g.push();
  g.stroke(0);
  g.strokeWeight(1 * scale);
  g.noFill();
  
  for (let rr = 0; rr < radius; rr += radius / numRings) {
    if (random() > 0.45 + rr / (1000 * scale) - noise(rr - 0.001, rr)) {
      g.beginShape();
      for (let a = 0; a <= TAU; a += TAU / numPoints) {
        const ox = cx + rr * cos(a);
        const oy = cy + rr * sin(a);
        const q = map(
          noise(ox * resolution, oy * resolution),
          0, 1,
          -noiseScale, noiseScale
        );
        g.curveVertex(ox + q, oy + q);

        if (random() > 0.75 - 0.25 * sin(a) * cos(a)) {
          g.endShape();
          g.beginShape();
        }
      }
      g.endShape();
    }
  }
  g.pop();
}

// ========================================
// EXPORT (Create High-Res on Demand)
// ========================================
function keyPressed() {
  if (key === "s" || key === "S") {
    console.log("Generating high-resolution images...");
    
    // Create PRINT-RESOLUTION buffers (temporarily!)
    let printComposite = createGraphics(PRINT_W, PRINT_H);
    let printFilled = createGraphics(PRINT_W, PRINT_H);
    let printLined = createGraphics(PRINT_W, PRINT_H);
    
    printComposite.clear();
    printFilled.clear();
    printLined.clear();

    // Re-render at PRINT scale
    designPostcard(printFilled, printLined, SCALE_FACTOR);  // scale = 3

    // Composite
    printComposite.image(printFilled, 0, 0);
    printComposite.image(printLined, 0, 0);

    // Export
    printComposite.save("postcard-composite-300dpi.png");
    
    let tmpFilled = createGraphics(PRINT_W, PRINT_H);
    tmpFilled.background(255);
    tmpFilled.image(printFilled, 0, 0);
    saveGraphicsAsJPEGWithDPI(tmpFilled, "postcard-filled-300dpi.jpg", 300, 0.95);

    let tmpLined = createGraphics(PRINT_W, PRINT_H);
    tmpLined.background(255);
    tmpLined.image(printLined, 0, 0);
    saveGraphicsAsJPEGWithDPI(tmpLined, "postcard-lined-300dpi.jpg", 300, 0.95);

    console.log("Exported at " + PRINT_W + "×" + PRINT_H + " (300 DPI)");
    alert("Export complete!");
  }
}

// ========================================
// DPI EMBEDDING FUNCTIONS
// ========================================

function saveGraphicsAsJPEGWithDPI(g, filename, dpi = 300, quality = 0.95) {
  const canvas = g.elt || g.canvas || g;
  // Encode to JPEG
  let dataURL = canvas.toDataURL("image/jpeg", quality);

  // Patch JFIF density to DPI so Windows Explorer shows 300 DPI
  dataURL = setJPEGDPIInDataURL_JFIF(dataURL, dpi);

  // Also add EXIF X/YResolution if piexif is available (nice-to-have)
  if (typeof piexif !== "undefined") {
    const exifObj = { "0th": {} };
    exifObj["0th"][piexif.ImageIFD.XResolution] = [dpi, 1];
    exifObj["0th"][piexif.ImageIFD.YResolution] = [dpi, 1];
    exifObj["0th"][piexif.ImageIFD.ResolutionUnit] = 2; // inches
    const exifBytes = piexif.dump(exifObj);
    dataURL = piexif.insert(exifBytes, dataURL);
  }

  downloadDataURL(filename, dataURL);
}

// Ensure JFIF APP0 has Units=1 (dpi) and X/Ydensity=dpi; insert if missing
function setJPEGDPIInDataURL_JFIF(dataURL, dpi) {
  const bytes = base64ToBytes(dataURL.split(",")[1]);
  if (bytes[0] !== 0xFF || bytes[1] !== 0xD8) {
    // Not a JPEG; return original
    return dataURL;
  }

  // Find existing APP0 JFIF
  let i = 2;
  let foundJFIF = false;
  while (i + 4 < bytes.length && bytes[i] === 0xFF) {
    const marker = bytes[i + 1];
    if (marker === 0xDA) break; // SOS - stop scanning headers
    const segLen = (bytes[i + 2] << 8) | bytes[i + 3];
    const segStart = i + 4;
    const segEnd = segStart + segLen;

    if (marker === 0xE0 && segStart + 5 <= bytes.length) {
      // APP0 - check for "JFIF\0"
      if (
        segStart + 5 <= bytes.length &&
        bytes[segStart] === 0x4A && // J
        bytes[segStart + 1] === 0x46 && // F
        bytes[segStart + 2] === 0x49 && // I
        bytes[segStart + 3] === 0x46 && // F
        bytes[segStart + 4] === 0x00
      ) {
        // Payload layout after length:
        // "JFIF\0"(5), ver(2), units(1), Xden(2), Yden(2), Xthumb(1), Ythumb(1) ...
        const payload = segStart;
        const unitsOffset = payload + 7;
        const xDenOffset = payload + 8;
        const yDenOffset = payload + 10;

        bytes[unitsOffset] = 0x01; // 1 = dpi
        bytes[xDenOffset] = (dpi >> 8) & 0xff;
        bytes[xDenOffset + 1] = dpi & 0xff;
        bytes[yDenOffset] = (dpi >> 8) & 0xff;
        bytes[yDenOffset + 1] = dpi & 0xff;

        foundJFIF = true;
        break;
      }
    }

    i = segEnd;
  }

  // If no JFIF found, insert one right after SOI (FFD8)
  let outBytes = bytes;
  if (!foundJFIF) {
    const app0 = new Uint8Array(20);
    app0[0] = 0xff; app0[1] = 0xe0; // APP0
    app0[2] = 0x00; app0[3] = 0x10; // length = 16 bytes of payload
    // "JFIF\0"
    app0[4] = 0x4a; app0[5] = 0x46; app0[6] = 0x49; app0[7] = 0x46; app0[8] = 0x00;
    // version 1.01
    app0[9] = 0x01; app0[10] = 0x01;
    // units = 1 (dpi)
    app0[11] = 0x01;
    // Xdensity
    app0[12] = (dpi >> 8) & 0xff; app0[13] = dpi & 0xff;
    // Ydensity
    app0[14] = (dpi >> 8) & 0xff; app0[15] = dpi & 0xff;
    // Xthumbnail, Ythumbnail
    app0[16] = 0x00; app0[17] = 0x00;

    outBytes = new Uint8Array(bytes.length + app0.length);
    // SOI
    outBytes.set(bytes.subarray(0, 2), 0);
    // APP0 JFIF
    outBytes.set(app0, 2);
    // rest of original JPEG
    outBytes.set(bytes.subarray(2), 2 + app0.length);
  }

  const outBase64 = bytesToBase64(outBytes);
  return "data:image/jpeg;base64," + outBase64;
}

// Utilities
function base64ToBytes(b64) {
  const bin = atob(b64);
  const len = bin.length;
  const bytes = new Uint8Array(len);
  for (let i = 0; i < len; i++) bytes[i] = bin.charCodeAt(i);
  return bytes;
}

function bytesToBase64(bytes) {
  let bin = "";
  const chunk = 0x8000;
  for (let i = 0; i < bytes.length; i += chunk) {
    bin += String.fromCharCode.apply(null, bytes.subarray(i, i + chunk));
  }
  return btoa(bin);
}

// Trigger a download from a data URL
function downloadDataURL(name, url) {
  const a = document.createElement("a");
  a.href = url;
  a.download = name;
  document.body.appendChild(a);
  a.click();
  a.remove();
}
```

Important changes:

### 1. **Scale Factor System**

JavaScript

```
const SCALE_FACTOR = 3;
const SCREEN_W = 600;
const PRINT_W = SCREEN_W * SCALE_FACTOR;  // 1800
```

### 2. **Scale-Independent Design Function**

JavaScript

```
// Works at ANY scale!
function designPostcard(filledLayer, linedLayer, scale) {
  // All sizes multiplied by scale
  const cellW = (SCREEN_W * scale) / GRID_COLS;
  const baseRadius = min(cellW, cellH) / 2 - (70 * scale);
}
```

### 3. **Consistent Random Sequence**

JavaScript

```
randomSeed(DESIGN_SEED);  // ← Same sequence every time
noiseSeed(DESIGN_SEED);
```

### 4. **Scale-Aware Parameters**

JavaScript

```
const noiseScale = 50 * scale;         // Bigger at high-res
const resolution = 0.002 / scale;      // Finer at high-res
g.strokeWeight(1 * scale);             // Thicker at high-res
```
