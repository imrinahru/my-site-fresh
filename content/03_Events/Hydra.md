---
title: Hydra for all!
date: 2025-10-25
tags:
  - event
location: InterAccess
draft: false
summary: Beginner's notes on Hydra
---
![[hydra-2025-10-25-14.31.1.png]]
## Overview  

https://www.interaccess.org/workshop/live-coding-audioreactive-visuals-with-hydra

The article is about a workshop on Hydra that's happened in InterAccess. I joined it as a total beginner and came out with an interesting sound-reactive visual, even presented the result in a live-coding manner in front of the class. 
The rich experience happened really thanks to the instructor, [**Sarah Imrisek**](https://www.artcodelove.com/) (**cymatiste**). She is such a lovely, approachable, humble person, but doing the most beautiful thing that I resonate so much. 


## History
Hydra is inspired by analog video synthesis, taking input and mixing/modulating visual signals in real-time. Created by Olivia Jack, it's designed for jamming and live performances.

## Getting Started

### Keyboard Shortcuts
- `Ctrl + Shift + S` - Save/export code
- `Ctrl + Shift + Enter` - Run multiple blocks of code
- `Alt + Enter` - Run a single block
- `Ctrl + Shift + H` - Hide/show code
- `Ctrl + Shift + (+/-)` - Scale text size

## Core Concepts

### Basic Operations

```javascript
osc()        // oscillator - generates patterns
out()        // renders to the screen (default output)
.            // chains commands together (like a pipe/direct connector)
src()        // uses a source (webcam, image, another output buffer)
```

### Simple Example
```javascript
osc(20, 0.1, 0.8).out()  // frequency, sync, offset
```

### Chaining (Method Chaining)
Functions are chained with `.` to create complex visuals:
```javascript
osc(10, 0.1, 1.5)
  .kaleid(4)
  .rotate(0.1)
  .out()
```

## Sources

### Webcam
```javascript
s0. initCam()           // initialize webcam in source buffer s0
src(s0).out()          // render source buffer s0

// With effects
src(s0)
  .kaleid(4)
  .out()               // render the webcam as a kaleidoscope
```

### Using Other Outputs as Sources
```javascript
osc().out(o1)          // render to output buffer o1
src(o1).kaleid(4).out() // use o1 as source
```

## Audio Reactivity

### Setup Audio Input

**Windows:**
1. Download [VB-Audio Virtual Cable](https://vb-audio.com/Cable/)
2. Set virtual cable as audio input in Hydra
3. Use another app (like OBS, Spotify, etc.) to play audio from the same PC (I didn't arrive to do it with OBS, still don't know how to solve)

**In Hydra:**
```javascript
a.show()               // show audio waveform
a.setBins(4)           // set number of FFT bins (frequency bands)
```

### Using Audio Data

`a.fft[]` takes the waveform and converts it to **frequency data** (Fast Fourier Transform)

```javascript
// Array indices for different frequency ranges
a.fft[0]  // bass/low frequencies
a.fft[1]  // low-mid frequencies
a.fft[2]  // mid-high frequencies
a.fft[3]  // high frequencies
```

### Audio-Reactive Examples

```javascript
// Scale shape based on bass
shape(3)
  .scale(() => a.fft[0] * 4)
  .out()

// Rotate based on audio - arrow function syntax
shape(3)
  .rotate(() => a.fft[0] * Math.PI)
  .out()
```

**Arrow Function Syntax:**
```javascript
() => a.fft[0]         // arrow function returns audio value
() => Math.sin(time)   // arrow function for animation over time
```
Arrow function is a modern javascrip, where
```
// Traditional function
function add(a, b) {
  return a + b;
}

// Arrow function (compact)
(a, b) => a + b

// With no parameters
() => 10

// With one parameter (parentheses optional)
x => x * 2
(x) => x * 2  // same thing
```
By using arrow function, you can use a dynamic value in place of a static one
**Animation over time**
```
// STATIC - shape rotates at fixed angle: "Set rotation to 0.5"
shape(3).rotate(0.5).out()


// DYNAMIC - rotation changes over time: "Every frame, calculate what rotation should be"
shape(3).rotate(() => Math.sin(time * 0.001)).out()


// Pulsing scale
osc(10).scale(() => Math.sin(time * 0.001) * 0.5 + 1).out()
```


**Audio reactivity**
```
// WITHOUT arrow function - evaluated ONCE
shape(3).scale(a.fft[0]).out()  
// This captures audio value at the moment code runs, then stays frozen! 

// WITH arrow function - evaluated EVERY FRAME
shape(3).scale(() => a.fft[0]).out()
//or
shape(3).scale(() => a.fft[0] * 2).out()
// This reads audio value 60 times/second - shape breathes with music!  ✨
```

**Mouse interaction**
```
// Shape follows mouse X position
shape(3)
  .rotate(() => (mouse.x / window.innerWidth) * Math.PI * 2)
  .out()
```


## Output Buffers

Hydra has 4 output buffers:  `o0`, `o1`, `o2`, `o3`

```javascript
osc().out(o0)          // default output (can omit:  . out() = . out(o0))
osc().out(o1)          // output to buffer 1

render(o1)             // render a specific buffer to screen
```

## Common Functions

### Sources
- `osc(frequency, sync, offset)` - oscillator
- `noise(scale, offset)` - noise pattern
- `voronoi(scale, speed, blending)` - voronoi pattern
- `shape(sides, radius, smoothing)` - polygon shapes
- `gradient(speed)` - gradient
- `src(source)` - use external source

### Geometry
- `shape(3)` = **△** triangle
- `shape(4)` = **□** square
- `shape(5)` = **⬠** pentagon
- `shape(6)` = **⬡** hexagon
- Higher numbers = closer to a circle
- `.rotate(angle, speed)` - rotate
- `.scale(size, xMult, yMult)` - scale
- `.pixelate(x, y)` - pixelate
- `.repeat(repeatX, repeatY, offsetX, offsetY)` - repeat/tile
- `.repeatX(reps, offset)`
- `.repeatY(reps, offset)`
- `.kaleid(nSides)` - kaleidoscope

### Color
- `.color(r, g, b)` - colorize
- `.invert(amount)` - invert colors
- `.contrast(amount)` - adjust contrast
- `.brightness(amount)` - adjust brightness
- `.saturate(amount)` - adjust saturation
- `.hue(amount)` - shift hue
- `.colorama(amount)` - shift HSV

### Blending
- `.add(texture, amount)` - add two sources
- `.mult(texture, amount)` - multiply
- `.blend(texture, amount)` - blend
- `.diff(texture)` - difference
- `.mask(texture)` - mask

### Modulation
- `.modulate(texture, amount)` - modulate coordinates
- `.modulateScale(texture, amount)` - modulate scale
- `.modulateRotate(texture, amount)` - modulate rotation
- `.modulateKaleid(texture, nSides)` - modulate kaleidoscope

## Variables & Functions

| Name | Description | Example |
|: --|:--|:--|
| `bpm` | Change BPM of Hydra cycles | `bpm = 120` |
| `time` | Elapsed time in milliseconds | `() => Math.sin(time * 0.001)` |
| `Math.PI` | Pi constant (3.14159...) | `() => Math.PI * 2` |
| `Math.abs` | Keep values positive | `Math.abs(-1) // returns 1` |
| `Math.random` | Random float between 0 and 1 | `Math.random() * 2` |
| `Math.sin` | Sine wave for smooth animation | `Math.sin(time * 0.001)` |
| `Math.cos` | Cosine wave | `Math.cos(time * 0.001)` |
| `mouse.x` | X position of mouse | `() => mouse.x / window.innerWidth` |
| `mouse.y` | Y position of mouse | `() => mouse.y / window.innerHeight` |
| `window.innerWidth` | Width of browser window | - |
| `window.innerHeight` | Height of browser window | - |
| `screencap()` | Save an image of your sketch | `screencap()` |

## Tips & Tricks

### Using External Images
```javascript
s0.initImage("https://url-to-image.jpg")
src(s0).out()
```

### Image Hosting
Upload images to [imgbb.com](https://imgbb.com/upload) for use in Hydra

### Feedback Loop
```javascript
osc(10, 0.1, 1)
  .add(o0, 0.9)        // add output back to itself
  .scale(0.99)         // slightly shrink to prevent overflow
  .out()
```

### Mouse Interaction
```javascript
shape(3)
  .rotate(() => Math.PI * mouse.x / 180)
  .repeatX(3)
  .repeatY(3)
  .scale(() => a.fft[0] * 4)
  .out(o0)
```

## Example:  Audio-Reactive Shape
```javascript
a.show()
a.setBins(4)

shape(3)
  .rotate(() => Math.PI * mouse.x / 180)
  .repeatX(3)
  .repeatY(3)
  .scale(() => a.fft[0] * 4)
  .out(o0)

render(o0)
```


## Key Takeaways
1. Everything chains with `.`
2. Use `() =>` for dynamic/animated values
3. `a.fft[]` for audio reactivity
4. Experiment and jam - there's no wrong way! 

## My first Hydra code

```
osc(10, 0.5, 1)
.rotate(10, 0.5)
.modulate(noise())
.add(shape(2, 0.01, 0.1))
// .pixelate(20, 20)
.out(o0)

a.show()


noise(5, 0.2)
.add(
  shape(4, 0.5, 0.1)
  .scrollY(()=>a.fft[0])
  .add(noise(()=>5*a.fft[0]))
       .mult(osc(0.5,0.1,5).hue(()=>a.fft[0]))
  
  )
.out(o1)

s0.initCam()
src(s0)
.modulate(noise(()=>50*a.fft[3]),0.1,0.5)
.blend(o0, 0.2)
.add(o1)
.hue(() => Math.sin(time))
.luma(0.5, 0.1)
.out(o2)


render(o2)


```

## Related links 
- [Hydra Official Site](https://hydra.ojack.xyz/)
- [Function Reference](https://hydra.ojack.xyz/api/)
- - [Example Gallery](https://twitter.com/hydra_patterns)
- https://github.com/hydra-synth/hydra#using-p5js-with-hydra
- https://hydra-book.glitches.me/#/
- https://github.com/zachkrall/hydra-examples/tree/master/examples
- https://hydra.ojack.xyz/garden/



