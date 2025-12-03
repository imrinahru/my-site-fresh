---
course: Course Name
week: Week
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

# {{title}} — Week {{week-number}}


## Lecture & Discussion Notes

#### Onboard sensors included in the Nano33 IOT. 3 axis accelerometer , 3 axis gyroscope.
- 6 dimension, xyz gyro, xyz acc
- roll, pitch, yaw dpesn't work great

![[Pasted image 20251121085213.png]]

IMU combination of acc and gyro
add library 
`# include <Arduino_LSM6DS3.h>`, to specify acc and gyro in arduino let arduino talk to the sensor
`#include "SensorFusion.h"`, feed data into orientation to calculate
When turned on the device will be calibrated as (0. 0. 0)
drift: change over time

#### Distance sensor + 10k resistor
echo: listen
trig: send signal
![[Pasted image 20251121091251.png]]
```
#include <HCSR04.h>

#define TRIGGER_PIN 2
#define ECHO_PIN 3

UltraSonicDistanceSensor distanceSensor(TRIGGER_PIN, ECHO_PIN);
```

```
  if (currentTime - lastDistanceReadTime >= distanceReadInterval) {
    // Read the distance
    float newDistance = distanceSensor.measureDistanceCm();
```

45 degree angle wave, further out = wider
Set max distance
Take rolling average, take the last x numbers of reading and average it out. less responsive vs. smooth
Versatile, it can measure the distance of an obj/person, distance to ground/ceiling, motion in activity, 

### Light sensor + 10k resistor
0-1023 resistance
calibrate it, and compare if its darker or lighter
![[Pasted image 20251121094327.png]]

### Potentiometer
0 to 180
(encoder : continuous)
don't require voltage circuit
the 2 side is ground and power, the middle pin in analog reading pin

### Pong 2buttons
```
#include <ArduinoBLE.h>

#include "ble_functions.h"

#include "buzzer_functions.h"
```

.h is header file
`.h` header file in C/C++ is a file that contains declarations of functions, macros, variables, and data types, and is included in other source files (`.c` or `.cpp`) using the `#include` directive. Header files separate the interface (what functions are available) from the implementation (the code that defines how they work), which is stored in the corresponding source file. This prevents multiple definitions and allows different parts of a program to use the same functions and types.

Change to device number





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
- [ ] Buy a USB powerbank
- [ ] Studio experiment to try:  
- [ ] Concept to develop further:  

---

## Links & Resources
- Related notes:  

---

## Tags
#class-notes #theory #practice
