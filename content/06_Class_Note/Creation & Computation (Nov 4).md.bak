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

# Creation & Computation (Nov 4) — Week {{week-number}}


## Lecture & Discussion Notes
- **Main Concepts:**  
- **Important Terms / References:**  
- **Citations / Theorists:**  

![[Pasted image 20251104085809.png]]
![[Pasted image 20251104085953.png]]
yellow: signal wire to Arduino circuit
red: power
brown: ground

- operating voltage: 5.0~6.6V (narrow)
- stall torque: how much it can lift, kg/cm
	- (6v: 3.5kg/cm)
- operating speed
	- (6v: 0,08sec/60degree)

Use Servo.h library
call servo object

Servo mounts and brackets
https://www.canadarobotix.com/products/2891


507 Mechanical Movements
https://507movements.com/

Wearables by Kate
![[Pasted image 20251104092406.png]]
![[Pasted image 20251104091329.png]]

Lidar experimentation by Nick
https://puckettrand.com/drawings
Laser pointer sensing, spins the light as fast as possible
Standing wave, 
Calibrate wobble (weeks), super-industrial vopro 
Piano wire
heatshrink and attach the base to horn

```
/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 https://www.arduino.cc/en/Tutorial/LibraryExamples/Sweep
*/

#include <Servo.h> // call the library

Servo myservo;  // create ==servo object== to control a servo
// twelve servo objects can be created on most boards

int pos = 0;
```
variable to store the ==servo position==

void setup() {
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
}

void loop() {
  for (pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    myservo.write(pos);              // ==tell servo to go to position in variable 'pos'==
    delay(15);                       // waits 15 ms for the servo to reach the position
  }
  for (pos = 180; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    delay(15);                       // waits 15 ms for the servo to reach the position
  }
}
```




Servo speak the same language, only about oltage modulation which doesn't change, just voltage 

Convention: treating the pins as data, taking external power source
Use usb c to connect to an external power source
- safer
- ground to ground, power to power
![[2servoWithplug_bb-1.png]]
- add as many servos as needed
![[Pasted image 20251104093820.png]]

Input: 100~240V
Output: 5V, 3A
In parallel, so A is added up, 3000mA needs to be bigger than them added up

Before: Arduino has all the code
This time:
Moving all the control into p5, which should be easier
Arduino: listening, outputting
How to get p5 controlling the servos?
Use code below, nothing needs to be changed 
Arduino knows:
- angle 0~180 through dataString
- attach/detach
https://github.com/DigitalFuturesOCADU/CC2024/blob/main/experiment3/examples/example2_controlServos/webSerial_4Servo_CSV/webSerial_4Servo_CSV.ino

```
/*
Multi-Servo Control via Serial with Attach/Detach Support
---------------------------------------------------------
This sketch reads comma-separated values over Serial and applies them as angles to servos.
It also supports attaching and detaching servos dynamically.

Features:
---------
- Angle control: Send numeric CSV values (0-180 degrees)
- Attach/Detach control: Send true/false CSV values
- Intelligent filtering: Arduino only changes servo state when needed
- All servos attached by default for backward compatibility

Hardware Setup:
--------------
1. Connect servos to the following Arduino pins:
   - Servo 1: Pin 2
   - Servo 2: Pin 3
   - Servo 3: Pin 4
   - Servo 4: Pin 5
2. Power your servos appropriately (most servos need external power)
   - DO NOT power multiple servos directly from Arduino's 5V!
   - Use an external power supply or battery pack

Angle Data Examples:
-------------------
Send these strings over Serial (end with newline):
  "90"          -> Sets first servo to 90 degrees
  "90,180"      -> Sets first servo to 90, second to 180
  "90,180,45"   -> Sets first three servos
  "90,180,45,0" -> Sets all four servos

Attach State Examples:
---------------------
Send these strings over Serial (end with newline):
  "true,true,true,true"   -> All servos attached (default)
  "true,false,true,false" -> Servos 1&3 attached, 2&4 detached
  "false,false,false,false" -> All servos detached

How It Works:
------------
- Arduino detects data type automatically (numeric vs true/false)
- Attach state changes are filtered (only applied when different)
- Detached servos ignore angle commands (no jitter or power draw)
- You can send both data types in any order

Serial Configuration:
-------------------
- Baud Rate: 57600
- Line Ending: Newline (\n)

Note: You can modify maxServos constant to support fewer/more servos
(remember to update servoPins and servoAttached arrays accordingly)
*/
#include <Servo.h>

// Define maximum number of servos
const int maxServos = 4;

// Create servo objects
Servo servos[maxServos];  // Array to hold servo objects

// Define constants for servo pin numbers
const int servoPins[maxServos] = {2, 3, 4, 5};  // Pins for servos 1-4

// Track current attach state for each servo
bool servoAttached[maxServos] = {true, true, true, true}; // All attached by default, disengaging the servo for protection when not using

void setup() {
  // Initialize serial communication at 57600 baud rate
  Serial.begin(57600);
  
  // Attach all servos to their pins
  for(int i = 0; i < maxServos; i++) {
    servos[i].attach(servoPins[i]);
  }
}

void loop() {
  // Check if data is available on the serial port
  if (Serial.available() > 0) {
    // Read the incoming data until a newline character
    String input = Serial.readStringUntil('\n');
    // If the input is not empty, process it
    if (input.length() > 0) {
      // Detect if this is attach state data or angle data
      if (input.indexOf("true") != -1 || input.indexOf("false") != -1) {
        // Contains "true" or "false" = attach state data
        processAttachState(input);
      } else {
        // Regular numeric data = angle data
        processAngleData(input);
      }
    }
  }
}

void processAngleData(String input) {
  int lastIndex = 0;
  int servoIndex = 0;
  
  // Keep finding commas until we run out or hit our servo limit
  while(servoIndex < maxServos) {
    int nextComma = input.indexOf(',', lastIndex);
    String valueString;
    
    // Extract the value string
    if(nextComma == -1) {
      // Last value
      valueString = input.substring(lastIndex);
      // Only write to servo if it's attached
      if(servoAttached[servoIndex]) {
        // Convert to int, constrain, and apply to final servo
        servos[servoIndex].write(constrain(valueString.toInt(), 0, 180));
      }
      break;  // No more values to process
    } else {
      // Not the last value
      valueString = input.substring(lastIndex, nextComma);
      // Only write to servo if it's attached
      if(servoAttached[servoIndex]) {
        // Convert to int, constrain, and apply to current servo
        servos[servoIndex].write(constrain(valueString.toInt(), 0, 180));
      }
      // Move to next value
      lastIndex = nextComma + 1;
      servoIndex++;
    }
  }
}

void processAttachState(String input) {
  int lastIndex = 0;
  int servoIndex = 0;
  
  // Parse comma-separated true/false values
  while(servoIndex < maxServos) {
    int nextComma = input.indexOf(',', lastIndex);
    String stateString;
    
    if(nextComma == -1) {
      // Last value
      stateString = input.substring(lastIndex);
      updateServoAttachState(servoIndex, stateString);
      break;
    } else {
      // Not the last value
      stateString = input.substring(lastIndex, nextComma);
      updateServoAttachState(servoIndex, stateString);
      lastIndex = nextComma + 1;
      servoIndex++;
    }
  }
}

void updateServoAttachState(int servoIndex, String stateString) {
  // Trim whitespace
  stateString.trim();
  
  // Determine desired state (support both "true" and "1")
  bool shouldAttach = (stateString == "true" || stateString == "1");
  
  // INTELLIGENCE: Only make changes if state is different
  if (shouldAttach && !servoAttached[servoIndex]) {
    // Need to attach
    servos[servoIndex].attach(servoPins[servoIndex]);
    servoAttached[servoIndex] = true;
  } 
  else if (!shouldAttach && servoAttached[servoIndex]) {
    // Need to detach
    servos[servoIndex].detach();
    servoAttached[servoIndex] = false;
  }
  // If state is already correct, do nothing (filters redundant calls)
}
```

This code allows you to send data from P5 to Arduino to control between 1 - 4 Servos.(If you need more servos it can be easily updated). It uses the same comma separated value (CSV) format as the previous examples. It is important to remember that servos can only respond to values between 0 - 180 so the code needs to ensure it stays within that range. 

Sending Servo Angle Data

```
function sendDataToArduino() {  
  // Send comma-separated angles with newline  
  let dataString = servoAngle1 + "," + servoAngle2 + "\n";  
  port.write(dataString);
// serial divided by comma, return
}
```

Sending Servo Attach/Detach

```
function sendAttachStateToArduino() {

// Format attach states as CSV string with newline

// Example: "true,false\n"

let stateString = servoAttach1 + "," + servoAttach2 + "\n";

port.write(stateString);

}
```

https://editor.p5js.org/creationcomputation/sketches/z8cgrhuuN
```
/*
Mouse Position Servo Wave Control Example with Angle Constraints
This sketch demonstrates controlling two servo motors with oscillating waves based on mouse position.
It shows how to:
1. Split the canvas into two interactive zones for independent servo control
2. Use sin waves to create smooth servo oscillation patterns within defined limits
3. Send different angles to Arduino based on mouse position
4. Provide visual feedback for active zones, servo positions, and angle limits

To extend this example:
- Add more zones for additional servo control
- Modify the oscillation patterns (try square waves or other patterns)
- Add mouse Y position for speed control
- Add interactive controls for oscillation speed and limits
- Add keyboard controls for different patterns

Arduino expects data in format: "angle1,angle2\n"
Servos should be connected to pins 2 and 3 
*/

let port;
let connectBtn;
let servoAngle1, servoAngle2;    // Values to send to Arduino (0-180)
let btnX = 20;                   // Button X position
let btnY = 20;                   // Button Y position
let waveSpeed1 = 2000;          // Wave speed for left servo (milliseconds)
let waveSpeed2 = 2000;          // Wave speed for right servo (milliseconds)

// Servo 1 constraints
let servo1Min = 45;            // Minimum angle for servo 1
let servo1Max = 135;           // Maximum angle for servo 1
let servo1Center;              // Will be calculated as middle of min/max

// Servo 2 constraints
let servo2Min = 30;            // Minimum angle for servo 2
let servo2Max = 150;           // Maximum angle for servo 2
let servo2Center;              // Will be calculated as middle of min/max

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(220);
  angleMode(DEGREES);  // Use degrees for easier servo angle calculations
  
  // Calculate center positions based on constraints
  servo1Center = (servo1Min + servo1Max) / 2;
  servo2Center = (servo2Min + servo2Max) / 2;
  
  // Initialize serial connection
  port = createSerial();
  let usedPorts = usedSerialPorts();
  if (usedPorts.length > 0) {
    port.open(usedPorts[0], 57600);
  }
  
  // Create connection button
  connectBtn = createButton('Connect to Arduino');
  connectBtn.position(btnX, btnY);
  connectBtn.mousePressed(connectBtnClick);
}

function draw() {
  background(220);
  
  // Update button text based on connection
  if (port.opened()) {
    connectBtn.html('Disconnect');
  } else {
    connectBtn.html('Connect to Arduino');
  }
  
  if (port.opened()) {
    // Draw dividing line
    stroke(0);
    strokeWeight(1);
    line(width/2, 0, width/2, height);
    
    // Check mouse position and update values
    if (mouseX < width/2) {
      // Left side active - wave servo 1
      servoAngle1 = getWaveAngle(waveSpeed1, servo1Min, servo1Max, servo1Center);
      servoAngle2 = servo2Center;  // Keep servo 2 centered
      drawActiveZone(true);
    } else {
      // Right side active - wave servo 2
      servoAngle1 = servo1Center;  // Keep servo 1 centered
      servoAngle2 = getWaveAngle(waveSpeed2, servo2Min, servo2Max, servo2Center);
      drawActiveZone(false);
    }
    
    // Send values to Arduino
    sendDataToArduino();
    
    // Display current values and visualizations
    displayText();
    drawServoVisualizations();
  }
}

function getWaveAngle(speedMS, minAngle, maxAngle, centerAngle) {
  // Calculate amplitude based on min/max constraints
  let amplitude = (maxAngle - minAngle) / 2;
  
  // Create a sin wave that oscillates between minAngle and maxAngle
  let value = sin(360 * (millis() / speedMS)) * amplitude + centerAngle;
  
  // Constrain the value to ensure it stays within limits
  return round(constrain(value, minAngle, maxAngle));
}

function drawActiveZone(isLeft) {
  // Draw rectangle around active zone
  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  
  if (isLeft) {
    // Left side indicator
    rect(0, 0, width/2, height);
  } else {
    // Right side indicator
    rect(width/2, 0, width/2, height);
  }
}

function drawServoVisualizations() {
  // Draw servo position indicators
  let centerY = height - 100;
  
  // Left servo visualization
  stroke(200);
  fill(255);
  arc(width/4, centerY, 80, 80, 0, 180);  // Full range arc
  
  // Draw constraint arcs for servo 1
  noFill();
  stroke(255, 200, 200);
  arc(width/4, centerY, 90, 90, servo1Min, servo1Max);  // Valid range arc
  
  // Draw min/max lines and labels for servo 1
  stroke(255, 0, 0, 100);
  line(width/4, centerY,
       width/4 + cos(servo1Min - 90) * 45,
       centerY - sin(servo1Min - 90) * 45);
  line(width/4, centerY,
       width/4 + cos(servo1Max - 90) * 45,
       centerY - sin(servo1Max - 90) * 45);
       
  // Current position line for servo 1
  stroke(255, 0, 0);
  strokeWeight(2);
  line(width/4, centerY,
       width/4 + cos(servoAngle1 - 90) * 40,
       centerY - sin(servoAngle1 - 90) * 40);
  
  // Right servo visualization
  stroke(200);
  fill(255);
  arc(3*width/4, centerY, 80, 80, 0, 180);  // Full range arc
  
  // Draw constraint arcs for servo 2
  noFill();
  stroke(200, 200, 255);
  arc(3*width/4, centerY, 90, 90, servo2Min, servo2Max);  // Valid range arc
  
  // Draw min/max lines and labels for servo 2
  stroke(0, 0, 255, 100);
  line(3*width/4, centerY,
       3*width/4 + cos(servo2Min - 90) * 45,
       centerY - sin(servo2Min - 90) * 45);
  line(3*width/4, centerY,
       3*width/4 + cos(servo2Max - 90) * 45,
       centerY - sin(servo2Max - 90) * 45);
       
  // Current position line for servo 2
  stroke(0, 0, 255);
  strokeWeight(2);
  line(3*width/4, centerY,
       3*width/4 + cos(servoAngle2 - 90) * 40,
       centerY - sin(servoAngle2 - 90) * 40);
       
  // Add min/max labels
  textSize(12);
  textAlign(CENTER);
  
  // Servo 1 labels
  fill(255, 0, 0);
  text(servo1Min + "°", 
       width/4 + cos(servo1Min - 90) * 55,
       centerY - sin(servo1Min - 90) * 55);
  text(servo1Max + "°",
       width/4 + cos(servo1Max - 90) * 55,
       centerY - sin(servo1Max - 90) * 55);
       
  // Servo 2 labels
  fill(0, 0, 255);
  text(servo2Min + "°",
       3*width/4 + cos(servo2Min - 90) * 55,
       centerY - sin(servo2Min - 90) * 55);
  text(servo2Max + "°",
       3*width/4 + cos(servo2Max - 90) * 55,
       centerY - sin(servo2Max - 90) * 55);
}

function sendDataToArduino() {
  // Send comma-separated angles with newline
  let dataString = servoAngle1 + "," + servoAngle2 + "\n";
  port.write(dataString);
}

function displayText() {
  // Display current angles
  fill(0);
  noStroke();
  textAlign(LEFT);
  textSize(16);
  text("Left Servo Angle: " + servoAngle1 + "° (Range: " + servo1Min + "° - " + servo1Max + "°)", 20, height - 40);
  text("Right Servo Angle: " + servoAngle2 + "° (Range: " + servo2Min + "° - " + servo2Max + "°)", 20, height - 20);
}

function connectBtnClick() {
  // Handle connection button
  if (!port.opened()) {
    port.open('Arduino', 57600);
  } else {
    port.close();
  }
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
```

Motion, custom speed and angle
https://editor.p5js.org/creationcomputation/sketches/1p-q9uf3D
```
/*
Servo Control with Mouse Click and Smooth Movement via WebSerial
This sketch demonstrates controlling two servo motors using mouse clicks over WebSerial.
It maps the mouse X and Y coordinates to a 0-180 degree range suitable for servo control
and visualizes the servo positions using interactive lines. Each servo moves smoothly
to its target position in a specified time, regardless of the distance to travel.
The visualization shows both current and target positions in real-time.

Key variables:
- port: WebSerial port object
- connectBtn: Button for connecting/disconnecting WebSerial
- servo1, servo2: Servo objects managing position and movement
- moveSpeed: Time in milliseconds that any movement should take, regardless of distance
- moveStartTime: Timestamp when a movement begins, used for interpolation
- moveStartAngle: Starting position of a movement, used for interpolation
- isMoving: Flag indicating if a servo is currently in motion

Key functions:
- Servo.setTarget(): Sets new target position and initiates movement
- Servo.update(): Calculates current position using linear interpolation
- mousePressed(): Sets new target positions when mouse is clicked
- sendDataToArduino(): Sends current servo angles as CSV over WebSerial
- drawVisualElements(): Draws current and target positions with visual feedback


Movement behavior:
- Each movement takes exactly the specified time (default 1000ms)
- New targets can be set while servos are moving
- Smooth interpolation between positions
- Position updates sent continuously to Arduino

Arduino code:
https://github.com/DigitalFuturesOCADU/CC2024/blob/main/experiment3/examples/example2_controlServos/webSerial_4Servo_CSV/webSerial_4Servo_CSV.ino
*/



let port;
let connectBtn;
let servo1;
let servo1Speed = 1000;
let servo2;
let servo2Speed = 1000;

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(220);
  angleMode(DEGREES);
  
  // Initialize servos with starting position and movement speed
  servo1 = new Servo(90, servo1Speed);  // 1000ms for any movement
  servo2 = new Servo(90, servo2Speed);
  
  initializeSerial();
  createConnectButton();
}

function draw() {
  background(220);
  updateConnectButton();
  
  if (port.opened()) {
    servo1.moveSpeed = servo1Speed;
    servo2.moveSpeed = servo2Speed;
    servo1.update();
    servo2.update();
    sendDataToArduino();
    drawVisualElements();
    displayText();
  }
}

////***Servo Class
class Servo {
  constructor(startAngle, moveSpeed) {
    this.currentAngle = startAngle;   // Current angle of the servo
    this.targetAngle = startAngle;    // Target angle to move to
    this.moveSpeed = moveSpeed;       // Time in ms for any movement
    this.moveStartTime = 0;           // When the current movement began
    this.moveStartAngle = startAngle; // Starting angle of current movement
    this.isMoving = false;           // Whether servo is currently moving
  }
  
  setTarget(newTarget) {
    newTarget = constrain(newTarget, 0, 180);
    if (newTarget !== this.currentAngle) {
      this.targetAngle = newTarget;
      this.moveStartAngle = this.currentAngle;
      this.moveStartTime = millis();
      this.isMoving = true;
    }
  }
  
  update() {
    if (this.isMoving) {
      // Calculate how much time has passed since movement started
      let elapsed = millis() - this.moveStartTime;
      
      // Calculate movement progress as a value from 0 to 1
      // 0 = movement just started
      // 0.5 = halfway through movement
      // 1 = movement complete
      let progress = min(elapsed / this.moveSpeed, 1);
      
      // Use linear interpolation (lerp) to calculate current position
      // lerp formula: start + (target - start) * progress
      // Example: If moving from 0° to 180° and progress is 0.5:
      //   currentAngle = 0 + (180 - 0) * 0.5 = 90 degrees
      this.currentAngle = lerp(this.moveStartAngle, this.targetAngle, progress);
      
      // Check if movement is complete
      if (progress >= 1) {
        // Stop moving
        this.isMoving = false;
        // Ensure we're exactly at target
        this.currentAngle = this.targetAngle;
      }
    }
  }
  
  getCurrentAngle() {
    return round(this.currentAngle);
  }
  
  getTargetAngle() {
    return round(this.targetAngle);
  }
}
////***Servo Class

function mousePressed() {
  if (port.opened()) {
    let targetX = map(mouseX, 0, width, 0, 180);
    let targetY = map(mouseY, 0, height, 0, 180);
    
    servo1.setTarget(targetX);
    servo2.setTarget(targetY);
  }
}

function initializeSerial() {
  port = createSerial();
  let usedPorts = usedSerialPorts();
  if (usedPorts.length > 0) {
    port.open(usedPorts[0], 57600);
  }
}

function createConnectButton() {
  connectBtn = createButton('Connect to Arduino');
  connectBtn.position(80, 120);
  connectBtn.mousePressed(connectBtnClick);
}

function updateConnectButton() {
  if (!port.opened()) {
    connectBtn.html('Connect to Arduino');
  } else {
    connectBtn.html('Disconnect');
  }
}

function sendDataToArduino() {
  let dataString = (servo1.getCurrentAngle() + "," + 
                   servo2.getCurrentAngle() + "\n");
  port.write(dataString);
}

function drawVisualElements() {
  // Draw crosshairs for mouse tracking
  stroke(0, 100);  // Semi-transparent crosshairs
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
  
  let centerX = width / 2;
  let centerY = height / 2;
  
  // Servo 1 (Red)
  // Draw target angle as semi-transparent line
  stroke(255, 0, 0, 100);
  let targetAngle1 = servo1.getTargetAngle();
  let targetX1 = centerX - 100 + cos(targetAngle1) * 50;
  let targetY1 = centerY - sin(targetAngle1) * 50;
  line(centerX - 100, centerY, targetX1, targetY1);
  
  // Draw current angle as solid line
  stroke(255, 0, 0);
  let currentAngle1 = servo1.getCurrentAngle();
  let currentX1 = centerX - 100 + cos(currentAngle1) * 50;
  let currentY1 = centerY - sin(currentAngle1) * 50;
  line(centerX - 100, centerY, currentX1, currentY1);
  
  // Draw labels and angles
  noStroke();
  fill(255, 0, 0);
  textAlign(CENTER);
  text("Servo 1", centerX - 130, centerY - 60);
  text(`Current: ${currentAngle1}°`, 
       centerX - 100 + cos(currentAngle1) * 65,
       centerY - sin(currentAngle1) * 65 + 15);
  fill(255, 0, 0, 100);
  text(`Target: ${targetAngle1}°`,
       centerX - 100 + cos(targetAngle1) * 65,
       centerY - sin(targetAngle1) * 65 + 30);
  
  // Servo 2 (Blue)
  // Draw target angle as semi-transparent line
  stroke(0, 0, 255, 100);
  let targetAngle2 = servo2.getTargetAngle();
  let targetX2 = centerX + 100 + cos(targetAngle2) * 50;
  let targetY2 = centerY - sin(targetAngle2) * 50;
  line(centerX + 100, centerY, targetX2, targetY2);
  
  // Draw current angle as solid line
  stroke(0, 0, 255);
  let currentAngle2 = servo2.getCurrentAngle();
  let currentX2 = centerX + 100 + cos(currentAngle2) * 50;
  let currentY2 = centerY - sin(currentAngle2) * 50;
  line(centerX + 100, centerY, currentX2, currentY2);
  
  // Draw labels and angles
  noStroke();
  fill(0, 0, 255);
  text("Servo 2", centerX + 70, centerY - 60);
  text(`Current: ${currentAngle2}°`, 
       centerX + 100 + cos(currentAngle2) * 65,
       centerY - sin(currentAngle2) * 65 + 15);
  fill(0, 0, 255, 100);
  text(`Target: ${targetAngle2}°`,
       centerX + 100 + cos(targetAngle2) * 65,
       centerY - sin(targetAngle2) * 65 + 30);
}

function displayText() {
  fill(0);
  noStroke();
  textAlign(LEFT, TOP);
  textSize(16);
  text(`Mouse X: ${mouseX} px`, 10, 10);
  text(`Mouse Y: ${mouseY} px`, 10, 30);
  text('Click to set new servo positions', 10, 50);
  text(`Servo 1 speed : ${servo1.moveSpeed}`, 10, 70);
  text(`Servo 2 speed : ${servo2.moveSpeed}`, 10, 90);
}

function connectBtnClick() {
  if (!port.opened()) {
    port.open('Arduino', 57600);
  } else {
    port.close();
  }
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
}
```

Attach/detach to make servo life longer

Collision p5 library
https://github.com/bmoren/p5.collide2D
```
var hit = false;

function setup() {
    createCanvas(400, 400);
}

function draw() {
    background(255);
    circle(200, 200, 100);
    point(mouseX, mouseY);

    hit = collidePointCircle(mouseX, mouseY, 200, 200, 100);

    // Use vectors as input:
    // const mouse  = createVector(mouseX, mouseY);
    // const circle = createVector(200, 200);
    // const diam   = 100;
    // hit = collidePointCircleVector(mouse, circle, diam);

    stroke(hit ? color('red') : 0);
    print('colliding?', hit);
}
```
Divide zones, return collision, create threshold
https://editor.p5js.org/creationcomputation/sketches/f_ScJGH7B
```
/*
Box-Based Servo Wave Control Example with Angle Constraints
This sketch demonstrates controlling two servo motors with oscillating waves based on box collision.
It shows how to:
1. Use p5.collide2D library for collision detection with rectangles
2. Split the canvas into two interactive zones for independent servo control
3. Use sin waves to create smooth servo oscillation patterns within defined limits
4. Automatically attach servos when active and detach when idle
5. Provide visual feedback for active zones, servo positions, and angle limits

To extend this example:
- Add more zones for additional servo control
- Modify the oscillation patterns (try square waves or other patterns)
- Add interactive controls for oscillation speed and limits
- Add keyboard controls for different patterns

Arduino expects data in format: "angle1,angle2\n" and "true,false\n"
Servos should be connected to pins 2 and 3 
*/

let port;
let connectBtn;
let servoAngle1, servoAngle2;    // Values to send to Arduino (0-180)
let btnX = 20;                   // Button X position
let btnY = 20;                   // Button Y position
let waveSpeed1 = 2000;          // Wave speed for left servo (milliseconds)
let waveSpeed2 = 2000;          // Wave speed for right servo (milliseconds)

// Servo 1 constraints
let servo1Min = 45;            // Minimum angle for servo 1
let servo1Max = 135;           // Maximum angle for servo 1
let servo1Center;              // Will be calculated as middle of min/max

// Servo 2 constraints
let servo2Min = 30;            // Minimum angle for servo 2
let servo2Max = 150;           // Maximum angle for servo 2
let servo2Center;              // Will be calculated as middle of min/max

// Servo attach state variables (default: all attached)
let servoAttach1 = true;
let servoAttach2 = true;

// Box definitions for collision detection
let box1X, box1Y, box1W, box1H;  // Left box (servo 1)
let box2X, box2Y, box2W, box2H;  // Right box (servo 2)

function setup() {
  createCanvas(windowWidth, windowHeight);
  background(220);
  angleMode(DEGREES);  // Use degrees for easier servo angle calculations
  
  // Calculate center positions based on constraints
  servo1Center = (servo1Min + servo1Max) / 2;
  servo2Center = (servo2Min + servo2Max) / 2;
  
  // Initialize serial connection
  port = createSerial();
  let usedPorts = usedSerialPorts();
  if (usedPorts.length > 0) {
    port.open(usedPorts[0], 57600);
  }
  
  // Create connection button
  connectBtn = createButton('Connect to Arduino');
  connectBtn.position(btnX, btnY);
  connectBtn.mousePressed(connectBtnClick);
  
  // Define boxes - visible areas on canvas (different sizes)
  box1X = 100;
  box1Y = 150;
  box1W = 200;
  box1H = 150;
  
  box2X = width - 350;
  box2Y = 200;
  box2W = 250;
  box2H = 120;
}

function draw() {
  background(220);
  
  // Update button text based on connection
  if (port.opened()) {
    connectBtn.html('Disconnect');
  } else {
    connectBtn.html('Connect to Arduino');
  }
  
  if (port.opened()) {
    // Check mouse collision with boxes
    let box1Active = collidePointRect(mouseX, mouseY, box1X, box1Y, box1W, box1H);
    let box2Active = collidePointRect(mouseX, mouseY, box2X, box2Y, box2W, box2H);
    
    if (box1Active) {
      // Box 1 active - wave servo 1, detach servo 2
      servoAngle1 = getWaveAngle(waveSpeed1, servo1Min, servo1Max, servo1Center);
      servoAngle2 = servo2Center;  // Keep servo 2 centered
      servoAttach1 = true;   // Attach servo 1 (moving)
      servoAttach2 = false;  // Detach servo 2 (stationary)
    } else if (box2Active) {
      // Box 2 active - wave servo 2, detach servo 1
      servoAngle1 = servo1Center;  // Keep servo 1 centered
      servoAngle2 = getWaveAngle(waveSpeed2, servo2Min, servo2Max, servo2Center);
      servoAttach1 = false;  // Detach servo 1 (stationary)
      servoAttach2 = true;   // Attach servo 2 (moving)
    } else {
      // No box active - keep servos centered and detached
      servoAngle1 = servo1Center;
      servoAngle2 = servo2Center;
      servoAttach1 = false;
      servoAttach2 = false;
    }
    
    // Draw boxes
    drawBoxes(box1Active, box2Active);
    
    // Send values to Arduino
    sendDataToArduino();
    sendAttachStateToArduino();
    
    // Display current values and visualizations
    displayText();
    drawServoVisualizations();
  }
}

function getWaveAngle(speedMS, minAngle, maxAngle, centerAngle) {
  // Calculate amplitude based on min/max constraints
  let amplitude = (maxAngle - minAngle) / 2;
  
  // Create a sin wave that oscillates between minAngle and maxAngle
  let value = sin(360 * (millis() / speedMS)) * amplitude + centerAngle;
  
  // Constrain the value to ensure it stays within limits
  return round(constrain(value, minAngle, maxAngle));
}

function drawBoxes(box1Active, box2Active) {
  // Draw box 1 (Servo 1 control)
  if (box1Active) {
    fill(255, 200, 200);
    strokeWeight(4);
    stroke(255, 0, 0);
  } else {
    fill(255, 200, 200, 100);
    strokeWeight(2);
    stroke(200);
  }
  rect(box1X, box1Y, box1W, box1H, 10);
  
  // Box 1 label
  fill(0);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(16);
  text("Servo 1 Zone", box1X + box1W/2, box1Y + box1H/2);
  
  // Draw box 2 (Servo 2 control)
  if (box2Active) {
    fill(200, 200, 255);
    strokeWeight(4);
    stroke(0, 0, 255);
  } else {
    fill(200, 200, 255, 100);
    strokeWeight(2);
    stroke(200);
  }
  rect(box2X, box2Y, box2W, box2H, 10);
  
  // Box 2 label
  fill(0);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(16);
  text("Servo 2 Zone", box2X + box2W/2, box2Y + box2H/2);
}

function drawServoVisualizations() {
  // Draw servo position indicators
  let centerY = height - 100;
  
  // Left servo visualization
  stroke(200);
  fill(255);
  arc(width/4, centerY, 80, 80, 0, 180);  // Full range arc
  
  // Draw constraint arcs for servo 1
  noFill();
  stroke(255, 200, 200);
  arc(width/4, centerY, 90, 90, servo1Min, servo1Max);  // Valid range arc
  
  // Draw min/max lines and labels for servo 1
  stroke(255, 0, 0, 100);
  line(width/4, centerY,
       width/4 + cos(servo1Min - 90) * 45,
       centerY - sin(servo1Min - 90) * 45);
  line(width/4, centerY,
       width/4 + cos(servo1Max - 90) * 45,
       centerY - sin(servo1Max - 90) * 45);
       
  // Current position line for servo 1
  stroke(servoAttach1 ? color(255, 0, 0) : color(150));
  strokeWeight(servoAttach1 ? 3 : 2);
  line(width/4, centerY,
       width/4 + cos(servoAngle1 - 90) * 40,
       centerY - sin(servoAngle1 - 90) * 40);
  
  // Right servo visualization
  stroke(200);
  fill(255);
  arc(3*width/4, centerY, 80, 80, 0, 180);  // Full range arc
  
  // Draw constraint arcs for servo 2
  noFill();
  stroke(200, 200, 255);
  arc(3*width/4, centerY, 90, 90, servo2Min, servo2Max);  // Valid range arc
  
  // Draw min/max lines and labels for servo 2
  stroke(0, 0, 255, 100);
  line(3*width/4, centerY,
       3*width/4 + cos(servo2Min - 90) * 45,
       centerY - sin(servo2Min - 90) * 45);
  line(3*width/4, centerY,
       3*width/4 + cos(servo2Max - 90) * 45,
       centerY - sin(servo2Max - 90) * 45);
       
  // Current position line for servo 2
  stroke(servoAttach2 ? color(0, 0, 255) : color(150));
  strokeWeight(servoAttach2 ? 3 : 2);
  line(3*width/4, centerY,
       3*width/4 + cos(servoAngle2 - 90) * 40,
       centerY - sin(servoAngle2 - 90) * 40);
       
  // Add min/max labels
  textSize(12);
  textAlign(CENTER);
  
  // Servo 1 labels
  fill(255, 0, 0);
  text(servo1Min + "°", 
       width/4 + cos(servo1Min - 90) * 55,
       centerY - sin(servo1Min - 90) * 55);
  text(servo1Max + "°",
       width/4 + cos(servo1Max - 90) * 55,
       centerY - sin(servo1Max - 90) * 55);
       
  // Servo 2 labels
  fill(0, 0, 255);
  text(servo2Min + "°",
       3*width/4 + cos(servo2Min - 90) * 55,
       centerY - sin(servo2Min - 90) * 55);
  text(servo2Max + "°",
       3*width/4 + cos(servo2Max - 90) * 55,
       centerY - sin(servo2Max - 90) * 55);
}

function sendDataToArduino() {
  // Send comma-separated angles with newline
  let dataString = servoAngle1 + "," + servoAngle2 + "\n";
  port.write(dataString);
}

function sendAttachStateToArduino() {
  // Format attach states as CSV string with newline
  // Example: "true,false\n"
  let stateString = servoAttach1 + "," + servoAttach2 + "\n";
  port.write(stateString);
}

function displayText() {
  // Display current angles and attach states
  fill(0);
  noStroke();
  textAlign(LEFT);
  textSize(16);
  
  // Servo 1 info with attach state
  let servo1Status = servoAttach1 ? " [ATTACHED - MOVING]" : " [DETACHED - IDLE]";
  text("Left Servo Angle: " + servoAngle1 + "° (Range: " + servo1Min + "° - " + servo1Max + "°)" + servo1Status, 20, height - 60);
  
  // Servo 2 info with attach state
  let servo2Status = servoAttach2 ? " [ATTACHED - MOVING]" : " [DETACHED - IDLE]";
  text("Right Servo Angle: " + servoAngle2 + "° (Range: " + servo2Min + "° - " + servo2Max + "°)" + servo2Status, 20, height - 40);
  
  // Instructions
  fill(100);
  textSize(14);
  text("Hover over boxes to control servos. Idle servos are automatically detached.", 20, height - 15);
}

function connectBtnClick() {
  // Handle connection button
  if (!port.opened()) {
    port.open('Arduino', 57600);
  } else {
    port.close();
  }
}

function windowResized() {
  resizeCanvas(windowWidth, windowHeight);
  
  // Update box 2 position to stay on right side
  box2X = width - 350;
}

```

![[Pasted image 20251104103248.png]]
*Needs the overcome bridge operation on arduino beforehand

- Tracked points allow for simultaneous 'cursors'
- Points can be compared to specific areas within the view
    - Divided using if statements on an axis
    - Created zones using collision detection
- Velocity of a point can be measured
- Points (both tracked and fixed) can be compared
    - Distance
    - Angle

Make sure what happens when there are things to draw
```
        // Eyes: Check if both points are valid and measure
        if (facePointData1 && facePointData2) {
            showPoint(facePointData1, color(255, 0, 0));  // Red
            showPoint(facePointData2, color(0, 0, 255));  // Blue
            eyesDistance = measureDistance(facePointData1, facePointData2);
            eyesAngle = measureAngle(facePointData1, facePointData2);
        }
```
Get both index and data
```
    if (faces.length > 0) {
        // Update global variables with current point data
        facePointData1 = getKeypoint(facePointIndex1, 0);
        facePointData2 = getKeypoint(facePointIndex2, 0);
        facePointData3 = getKeypoint(facePointIndex3, 0);
        facePointData4 = getKeypoint(facePointIndex4, 0);
```

```
        // Eyes: Check if both points are valid and measure
        if (facePointData1 && facePointData2) {
            showPoint(facePointData1, color(255, 0, 0));  // Red
            showPoint(facePointData2, color(0, 0, 255));  // Blue
            eyesDistance = measureDistance(facePointData1, facePointData2);
            eyesAngle = measureAngle(facePointData1, facePointData2);
        }
        
        // Lips: Check if both points are valid and measure
        if (facePointData3 && facePointData4) {
            showPoint(facePointData3, color(0, 255, 0));  // Green
            showPoint(facePointData4, color(255, 0, 255));  // Magenta
            lipsDistance = measureDistance(facePointData3, facePointData4);
            lipsAngle = measureAngle(facePointData3, facePointData4);
        }
        
```

```
        // Update servo values and send to Arduino if connected
        if (port.opened()) {
            updateServoValues();
            sendDataToArduino();
            sendAttachStateToArduino();
        }
    } else {
        // No face detected - center servos and detach
        if (port.opened()) {
            servoAngle1 = 90;
            servoAngle2 = 90;
            servoAttach1 = false;
            servoAttach2 = false;
            sendDataToArduino();
            sendAttachStateToArduino();
        }
    }
```

Mounting hardware, webcam, tripod mount, long usb

Hand collider
https://editor.p5js.org/creationcomputation/sketches/06AfzCoep

Calibrate, change max/min of the value

```

11/11 workflow by the end of today, scale back keep it simple, demonstrate ideas
It can be facing passers by vs. wall
11/14 Guest speaker from TMU and Concordia


