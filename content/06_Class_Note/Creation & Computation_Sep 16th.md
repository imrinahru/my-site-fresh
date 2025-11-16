---
course: Creation & Computation
week: Week 3
instructor: Kate & Puckett
tags:
  - class-notes
  - theory
  - practice
  - studio
  - lecture
  - seminar
  - critique
status: ended
date: 2025-09-16
draft: true
---

# Creation & Computation — Week 3

# Lecture & Discussion Notes

## 1. Circuit Diagrams & Prototyping

- **Types of Circuit Representations**
    
    - **Circuit schematic**
        ![[C&C Sep16_diagram.png]]
        ![[C&C Sep6_more diagram.png]]
    - **Breadboard view**
        
    - **Printed Circuit Board (PCB)**
        
    - MOSFETs: used as **switches** or **amplifiers** in electronic circuits.
        
    - Fritzing
        
        - Used by Adafruit, Arduino; includes a parts library
            
        - Related tools: _Eagle, Picaxe, KiCad_
	        - Start with Fritzing
            
        - You can design small parts in Fritzing → CNC mill (xFab) can etch circuits
            
        - Ask **Gerald** about his fabrication process.
            

---

## 2. Variable Resistors & Analog Input

- Arduino reads **voltage**, not resistance.
    
- Use a **voltage divider** for analog input reading.
    ![[C&C Sep16_divider circuit.png]]
- Value ranges depend on the fixed resistor:
    
    - Choose one with the **same order of magnitude** as your sensor
        
        - e.g., If sensor is 0–1000 Ω, don’t pair with a 10kΩ resistor.
            
- For digital input especially using switches: uses **pull-up / pull-down** resistors.
    

---

## 3. Series vs Parallel

- In parallel, each LED drops ~2–3V.  
    With a 5V input, powering too many LEDs in parallel will cause voltage drop → LEDs won’t light.
    
- Best practice: limit to **2–3 LEDs** in parallel on a single pin.
    ![[Pasted image 20250916092324.png]]
- Reference: [https://arduinotogo.com/2016/10/07/chapter-4-components-in-parallel-and-series/](https://arduinotogo.com/2016/10/07/chapter-4-components-in-parallel-and-series/)
    

---

## 4. Arduino Workflow & Naming

- **File naming**: describe the system simply
    
    - _Squish1Sensor_1LEDBrightness_
        
    - _Foot_2Sensors_LEDBlinkThreshold_
        
- **Input naming**: describe the _action_
    
    - ❌ “Pressure Sensor 1”
        
    - ✔ “Pushing on the Left Side”
        
- Always record which sensors go to which pins.
    

### Input Table Example

|Description|Arduino Pin|
|---|---|
|Pushing on the Left Side|A0|
|Left Hand Squeeze|A1|

### Data Range

|Description|Pin|Min|Max|
|---|---|---|---|
|Pushing on the Left Side|A0|50|800|
|Left Hand Squeeze|A1|30|750|

### Output Table Example

|Description|Arduino Pin|Behavior|
|---|---|---|
|Status Indicator LED|D2|on/off|
|Left Side Response LED|D3|brightness|
|Squeeze Feedback LED|D4|blink|
|Activity Pulse LED|D5|pulse|

### Coding Conventions

- Use **camelCase** for variable names:
    
    - `pushingOnTheLeftSide`
        
    - `leftHandSqueeze`
        
    - `statusIndicatorLED`
        

---

## 5. Core Arduino Functions & Concepts

### Setup

- `Serial.begin(9600)`
    
    - Starts serial communication.
        
    - Both sides must use the same **baud rate**.
        

### Digital I/O

- `digitalWrite()`
    
    - `LOW / 0 / false` = off
        
    - `HIGH / 1 / true` = on
        
- `pinMode()`
    
    - Needed for **digital** pins
        
    - Some pins support both input/output; reference pin diagram:  
        [https://github.com/DigitalFuturesOCADU/CC2025/blob/main/experiment1/pinDiagram/nanoPinout.pdf](https://github.com/DigitalFuturesOCADU/CC2025/blob/main/experiment1/pinDiagram/nanoPinout.pdf)
        

### Data Types

- `int` – sensor readings, pin numbers
    
- `long` – Stores larger whole numbers. Use when working with `millis()` for timing calculations.
    
- `boolean` – on/off states
    

### LED Controls

- **On/Off:** any digital pin
    
- **Dimming:** use **PWM (~ pins)**
    
- `analogWrite()` outputs PWM for brightness control.
    

### Useful Functions

- `constrain(value, min, max)`
    
    - Keeps values within a safe range.
        
- `map(value, inMin, inMax, outMin, outMax)`
    
    - Rescales values (ex: pressure → 0–255 LED brightness)
        

### Timing

- `delay(ms)`
    
    - Pauses everything; simple but blocking.
        
- `millis()`
    
    - For non-blocking timing; allows multiple things to happen at different intervals.
        

Use `millis()` when:

- Reading sensors too rapidly
    
- LEDs appear to flicker
    
- Sensors require settling time
    
- You need multitasking behavior
    

---

## 6. Example Code Snippets

### Setup

```
// Pin assignments
int pressureLED = 2;  // Digital pin D2 for pressure-activated LED

// Pressure sensor thresholds
int lowPressureMin = 20;   // Minimum pressure to register as "low pressure"
int lowPressureMax = 260;  // Maximum pressure still considered "low pressure"

// Global variable for sensor reading
int pressureValue = 0;  // Current pressure sensor reading

void setup() 
{
    // Initialize serial communication for debugging
    Serial.begin(9600);
    
    // Configure LED pin as output
    pinMode(pressureLED, OUTPUT);
}
```

### Loop

```
void loop() 
{
    // Read analog value from pressure sensor on pin A0
    pressureValue = analogRead(A0);
    
    // Constrain pressure reading to functional range
    // This ensures values outside 20-500 range don't cause unexpected behavior
    constrainedPressure = constrain(pressureValue, pressureMin, pressureMax);
    
    // Map constrained pressure value to LED brightness range
    // Input range: 20-500, Output range: 0-255
    ledBrightness = map(constrainedPressure, pressureMin, pressureMax, brightnessMin, brightnessMax);
    
    // Set LED brightness using PWM
    analogWrite(pressureLED, ledBrightness);
    
    // Print values to serial monitor for debugging
    Serial.print("Raw Pressure: ");
    Serial.print(pressureValue);
    Serial.print(" | Constrained: ");
    Serial.print(constrainedPressure);
    Serial.print(" | LED Brightness: ");
    Serial.println(ledBrightness);
    
}
```

---

## 7. Processing Integration

- Tutorials:
    
    - [https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all](https://learn.sparkfun.com/tutorials/connecting-arduino-to-processing/all)
        
    - [https://www.arduino.cc/education/visualization-with-arduino-and-processing/](https://www.arduino.cc/education/visualization-with-arduino-and-processing/)
        

---

## Practice & Studio Work

### Exercises / Demos

- Clincher connector
    ![[C&C Sep16_clincher connector.png]]
    - Sparkfun guide: [https://learn.sparkfun.com/tutorials/force-sensitive-resistor-hookup-guide/all](https://learn.sparkfun.com/tutorials/force-sensitive-resistor-hookup-guide/all)
        
- Perforator demonstration
    ![[C&C Sep16_perforator.png]]

---

## Reflection & Connections

_(Write after class)_

---

## To-Do & Follow-up

-  Complete reading for next class
    
-  Try one studio experiment
    
-  Develop a concept further
    

---

## Links & Resources

- SparkFun tutorials and documentation
    
- Arduino references
    
- Class pin diagrams
    

