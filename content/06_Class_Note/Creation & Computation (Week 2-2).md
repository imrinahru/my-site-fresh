---
course: Creation & Computation
week: Week 2
instructor: Kate Hartman, Nicholas Puckett
tags:
  - class-notes
  - creation
  - physical-computing
  - arduino
  - electronics
status: completed
date: 2025-09-12
draft: true
---

# Creation & Computation — Week 2
## Lecture & Discussion Notes

- **Physical Computing (2004):**
    - Begins with the human body and its capabilities.
    - Interfaces (hardware + software) designed to sense and respond to physical human actions.
    ![[Pasted image 20250912084410.png]]
    
- **Key Points:**
    - Computers interpret us through digits, vision, and audio.
    - Arduino (2006): Open-source platform for kids, artists, and hobbyists.
    - Analogue vs. Digital Inputs:
        - **Analogue:** Wide range (A0…); can read continuous data.
        - **Digital:** On/off states.
            
- **Materials & Components:**
    - **Conductors:** Metal, conductive thread, aluminum foil, copper tape.
    - **Resistors:** Fixed & variable (e.g., force-sensing, light-sensing).
    - **Diodes:** LEDs (polarized).
    - **Insulators:** Glue, scotch tape.
    - Circuits can be washed; fabrics wear over time.
        
- **Tools & Techniques:**
    - Multimeter: continuity tester, resistance check (20, 200, 2k…).
    - Cardboard materials: white/school glue options.
        
- **Electronic Textiles:**
    - Publish early, open process.
    - Materials: conductive thread, conductive fabric, snaps, velostat, machine knitting.
    - Goal: Move from generic designs → specific use cases.


---

## Arduino Code Example
```
// Step 1: Define the pin numbers for the pressure sensors
int pressureSensorPin1 = A0;
int pressureSensorPin2 = A1;
int pressureSensorPin3 = A2;

// Step 2: Variables to store sensor data
int pressureSensorValue1;
int pressureSensorValue2;
int pressureSensorValue3;

// Step 3: Setup - runs once
void setup() {
  Serial.begin(9600);  // Initialize serial monitor
}

// Step 4: Loop - runs continuously
void loop() {
  // Read analog values
  pressureSensorValue1 = analogRead(pressureSensorPin1);
  pressureSensorValue2 = analogRead(pressureSensorPin2);
  pressureSensorValue3 = analogRead(pressureSensorPin3);

  // Print sensor values
  Serial.print("Sensor 1: "); Serial.println(pressureSensorValue1);
  Serial.print("Sensor 2: "); Serial.println(pressureSensorValue2);
  Serial.print("Sensor 3: "); Serial.println(pressureSensorValue3);

  // Short delay before next reading
  delay(100);
}

```

---

## Links & Resources

- [Civic Tech Toronto](https://civictech.ca/)
- [Creative Coding Toronto](https://www.meetup.com/creative-code-toronto/)
- [Beginner Electronics — Adafruit](https://learn.adafruit.com/guides/beginner)
- [Best Glues for Cardboard — Bob Vila](https://www.bobvila.com/articles/best-glues-for-cardboard/)

---

## Tags

#class-notes #physical-computing #arduino #electronics