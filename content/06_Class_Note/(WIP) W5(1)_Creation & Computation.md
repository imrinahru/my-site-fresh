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

# (WIP) W5(1)_Creation & Computation — Week {{week-number}}


## Lecture & Discussion Notes

### Physical modification on phone

https://www.instructables.com/1-Minute-Cardboard-Phone-Stand-no-Glue/

https://www.amazon.ca/Pieces-Double-Natural-Portable-Desktop/dp/B09M7GNTTN

https://www.instructables.com/Build-A-Smartphone-Projector/

https://killyourphone.com/
Cunductive material

https://player.vimeo.com/video/595314922

https://vandue.com/no-contact-sanitary-key-touchless-non-contact-door-opener-button-press-stylus-avoid-touching-door-handles-light-switches-atm-elevator-buttons-and-more/
Conductive rubber on the tip

https://ocaduniversity-my.sharepoint.com/:p:/g/personal/khartman_ocadu_ca/EUItV6cB_OpDqURHayY-2MABegPaJpUkyTH2jTHTeYhyAw?e=Ijo9up
Conductive rubber on the tip

https://variationsonnormal.com/2011/04/28/finger-nose-stylus-for-touchscreens/
![[Pasted image 20251007091507.png]]
Stylus, everything can be a stylus
Capture the scene that tells a story, how it lives in the real world.

### p5.js interactions for phone

#### Things to consider
- security concerns
- how to turn off phone auto response to gestures (like refresh)
- temporary debug on screen
#### p5 library that helps

Libraries
https://p5js.org/libraries/

**Touch Events:**
- [`touchStarted()`](https://p5js.org/reference/p5/touchStarted/) - Called when a touch begins
- [`touchEnded()`](https://p5js.org/reference/p5/touchEnded/) - Called when a touch ends
- multiple fingers (iOS=5, Android=10)
- touch point and release point, but not in between

**Device Motion & Orientation:**
- [`rotationX`](https://p5js.org/reference/p5/rotationX/) - Device tilt forward/backward
- [`rotationY`](https://p5js.org/reference/p5/rotationY/) - Device tilt left/right
- [`rotationZ`](https://p5js.org/reference/p5/rotationZ/) - Device rotation around screen
- [`accelerationX`](https://p5js.org/reference/p5/accelerationX/) - Acceleration left/right
- [`accelerationY`](https://p5js.org/reference/p5/accelerationY/) - Acceleration up/down
- [`accelerationZ`](https://p5js.org/reference/p5/accelerationZ/) - Acceleration forward/back
- [`deviceShaken()`](https://p5js.org/reference/p5/deviceShaken/) - Shake detection event
- [`deviceMoved()`](https://p5js.org/reference/p5/deviceMoved/) - Movement detection event
- [`setShakeThreshold()`](https://p5js.org/reference/p5/setShakeThreshold/) - Set shake detection sensitivity
- [`setMoveThreshold()`](https://p5js.org/reference/p5/setMoveThreshold/) - Set movement detection sensitivity

**Audio Input (requires p5.sound):**
- [`p5.AudioIn()`](https://p5js.org/reference/p5.sound/p5.AudioIn/) - Audio input object
- [`getLevel()`](https://p5js.org/reference/p5.sound/p5.AudioIn/getLevel/) - Current audio input level

CDN
- Script tag to direct the call to the p5.js server and respond back
- <!-- Minified version (recommended) -->
<script src="https://cdn.jsdelivr.net/npm/mobile-p5-permissions@1.4.4/dist/p5.mobile-permissions.min.js"></script>

<!-- Development version (larger, with comments) -->
<!-- <script src="https://cdn.jsdelivr.net/npm/mobile-p5-permissions@1.4.4/dist/p5.mobile-permissions.js"></script> -->


Model index.html file

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mobile p5.js App</title>
  
  <!-- Basic CSS to remove browser defaults and align canvas -->
  <style>
    body {
      margin: 0;
      padding: 0;
      overflow: hidden;
    }
  </style>
  
  <!-- Load p5.js library -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.11.10/p5.min.js"></script>
  
  <!-- Load p5.sound library for microphone -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.11.0/addons/p5.sound.min.js"></script>
  
  <!-- Load the mobile p5.js permissions library -->
  <script src="https://cdn.jsdelivr.net/npm/mobile-p5-permissions@1.4.4/dist/p5.mobile-permissions.min.js"></script>
  
</head>
<body>
  <!-- Load the p5.js sketch -->
  <script src="sketch.js"></script>
</body>
</html>
```
### API reference

*message= Whatever the message you want to show on the phone.

```

// Essential mobile setup
lockGestures()  // Prevent browser gestures (call in setup())

// Motion sensor activation  
enableGyroTap(message)    // Tap anywhere to enable sensors
enableGyroButton(text)    // Button-based sensor activation

// Microphone activation
enableMicTap(message)     // Tap anywhere to enable microphone  
enableMicButton(text)     // Button-based microphone activation

// Sound output activation (no microphone input)
enableSoundTap(message)   // Tap anywhere to enable sound playback
enableSoundButton(text)   // Button-based sound activation

// Status variables (check these in your code)
window.sensorsEnabled     // Boolean: true when motion sensors are active
window.micEnabled         // Boolean: true when microphone is active
window.soundEnabled       // Boolean: true when sound output is active

// Debug system (enhanced in v1.4.0)
showDebug()       // Show on-screen debug panel with automatic error catching
hideDebug()       // Hide debug panel
toggleDebug()     // Toggle panel visibility
debug(...args)    // Console.log with on-screen display and timestamps
debugError(...args) // Display errors with red styling
debugWarn(...args)  // Display warnings with yellow styling
debug.clear()     // Clear debug messages
```


#### Github

![[Pasted image 20251007100839.png]]
Download code to view on desktop

#### Share
share->create QR code

#### Code

```
function setup() 
{
    createCanvas(windowWidth, windowHeight);
    
    // ★Show debug panel FIRST
    showDebug();
    //Can be turned off
    
    // ★Lock mobile gestures
    lockGestures();
    
    debug("Touch Count - Minimal Version");
    debug("Use multiple fingers to touch the screen");
    debug("Waiting for touches...");


```

[touches](https://p5js.org/reference/p5/touches/)
dist()
[atan2()](https://p5js.org/reference/p5/atan2/)
degrees()

+Library
<script src="https://cdn.jsdelivr.net/npm/mobile-p5-permissions@1.4.4/dist/p5.mobile-permissions.min.js"></script>

showDebug() *lib*
debug() *lib*
- Put in setup, right after creating the screen

lockGestures() *lib*

```
// Prevent default touch behavior and unwanted gestures
function touchStarted() 
{
    return false;  // Prevents default behavior
}

// Prevent default touch behavior and unwanted gestures
function touchEnded() 
{
    return false;  // Prevents default behavior
}
```

Gyroscope example

```

function setup() 
{
    createCanvas(windowWidth, windowHeight);
    
    // Show debug panel FIRST
    showDebug();
    
    // ★Enable motion sensors with tap permission (iOS)
    enableGyroTap();
    
    // Lock mobile gestures
    lockGestures();

    // Set to show in Degrees
    angleMode(DEGREES);
    
    debug("Orientation Basic - Minimal Version");
    debug("Tilt your device to see orientation values");
    debug("Waiting for sensor data...");
}

function draw() 
{
    // No visual feedback in minimal version
    
    // ★Check if motion sensors are enabled
    if (window.sensorsEnabled) 
    {
        // ★Get current orientation values
        let rx = rotationX;
        let ry = rotationY;
        let rz = rotationZ;
        
        // Output to debug panel
        debug("--- Device Orientation ---");
        debug("Rotation X (Tilt Forward/Back): " + int(rx) + "°");
        debug("Rotation Y (Tilt Left/Right): " + int(ry) + "°");
        debug("Rotation Z (Turn/Compass): " + int(rz) + "°");
        

    }
    else 
    {
        debug("Waiting for sensor permissions...");
        debug("Tap the screen to enable sensors");
    }
}
```

Audio example

```
// MINIMAL VERSION - Mic Level
// No visual feedback - data displayed in debug panel only
// Demonstrates: Reading microphone input level with threshold detection

// Global variables for microphone
let mic;
let micLevel = 0;
let micMultiplier = 3;  // Increase sensitivity
let threshold = 0.3;    // Threshold for loud sound detection

function setup() 
{
    createCanvas(windowWidth, windowHeight);
    
    // Show debug panel FIRST
    showDebug();
    
    // Enable microphone with tap permission
    enableMicTap("Press to sing to your");
    
    // Lock mobile gestures
    lockGestures();
    
    debug("Mic Level - Minimal Version");
    debug("Tap to enable microphone");
    debug("Threshold: " + threshold);
    debug("Waiting for microphone...");
}

function draw() 
{
    // No visual feedback in minimal version
    
    // Check if microphone is enabled
    if (mic && mic.enabled) 
    {
        // Get current microphone level (0.0 to 1.0)
        micLevel = mic.getLevel() * micMultiplier;
        
        // Constrain to 0-1 range
        micLevel = constrain(micLevel, 0, 1);
        
        // Output to debug panel
        debug("--- Microphone Level ---");
        debug("Raw Level: " + nf(micLevel, 1, 3));
        debug("Percentage: " + int(micLevel * 100) + "%");
        
        // Check against threshold
        if (micLevel > threshold) 
        {
            debug("STATUS: LOUD! (Above threshold)");
        }
        else 
        {
            debug("STATUS: Quiet (Below threshold)");
        }
        
        // Add visual bar representation using text
        let barLength = int(micLevel * 20);
        let bar = "";
        for (let i = 0; i < barLength; i++) 
        {
            bar = bar + "▮";
        }
        debug("Level: " + bar);
    }
    else 
    {
        debug("Waiting for microphone permissions...");
        debug("Tap the screen to enable microphone");
    }
}
```



> [!NOTE] Idea
> Throwing the phone, the highest number person win
> Show different shapes, one shape more likely to appear than the other, 


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
- https://www.youtube.com/@pattvira
- https://aesthetic-programming.net/
- https://available-anaconda-10d.notion.site/That-Creative-Code-Page-c5550ef2f7574126bdc77b09ed76651b
- https://prepositionprogramming.com/
- https://digitalfuturesocadu.github.io/atelier1-fall2025/Workshop2/pages/gifInteraction.html
- https://digitalfuturesocadu.github.io/mobile-p5-permissions/
- https://github.com/DigitalFuturesOCADU/P5-Phone-Interactions
---

## Tags
#class-notes #theory #practice
