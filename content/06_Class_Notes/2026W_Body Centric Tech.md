---
course: Body Centric Technologies
week:
instructor: Kate Hartman
tags:
  - class-notes
  - theory
  - practice
  - lecture
status: completed
date: 2026-01-18
draft: true
---
# Body-Centric Technologies — Class Notes

---

# Week 1 — Introduction to Body-Centric Technology

## Overview

**Body-centric technology** refers to technologies designed **on, around, or inside the human body**.

### Categories

- **Environmental**
    
- **Wearable**
    
- **Electronic textiles (e-textiles)**
    
- **Computer vision / body tracking**
    
- **Implantable**
    
- **Ingestible**
    

These systems integrate **electronics, sensing, and computation** into bodily contexts.

---

## Tools Introduced

### Circuit Playground

Two common versions:

- **Circuit Playground Express (CPX)**
    
- **Circuit Playground Classic**
    

Resources:  
[https://learn.adafruit.com/search?q=Circuit%2520Playground](https://learn.adafruit.com/search?q=Circuit%2520Playground)

The board integrates:

- sensors
    
- LEDs
    
- microphone
    
- capacitive touch
    
- accelerometer
    

This makes it a **good beginner platform for wearable electronics**.

---

### Conductivity Tester for Textile Work

[https://ireneposch.net/tooling/](https://ireneposch.net/tooling/)

The **Pin Probe** tool supports textile electronics workflows.

Key features:

- pins attach to fabric
    
- allows **hands-free measurement**
    
- continuous multimeter feedback while stitching
    

This enables **aesthetic-driven electronics crafting**, where makers can **adjust stitches while monitoring conductivity in real time**.

---

## Basic Tools & Materials

### Electronics Tools

- Multimeter
    
- Breadboard
    
- Jumper cables
    
- USB sync cable (data cable, not charging only)
    
- Battery holder
    

Completed tasks:

-  Battery holder (shop)
    
-  Micro-USB to USB-C/A syncing cable for CPX
    

---

## Readings & Resources

- Watkins, Susan M.  
    _Functional Clothing Design: From Sportswear to Spacesuits_ (2015)
    
- Farion, Christine  
    _The Ultimate Guide to Informed Wearable Technology_ (2022)
    
- Kate Hartman  
    _Make: Wearable Electronics_ (2025)
    
- [https://arduinotogo.com/category/chapter-3/](https://arduinotogo.com/category/chapter-3/)
    
- [https://www.pishop.ca/](https://www.pishop.ca/)
    

---

# Week 2 — Conductivity, Switches, and E-Textile History

## Core Electronics Concepts

### Conductivity

Conductivity depends on:

- **material**
    
- **length**
    
- **environment**
    
- **moisture**
    

Even materials like **water or body sweat** affect conductivity.

---

### Digital vs Analog

**Digital**

- binary
    
- ON / OFF
    

**Analog**

- continuous range of values
    

Example: sensors measuring pressure, light, stretch.

---

## Electrical Material Types

### Conductive

Very low resistance in the application.

Examples:

- copper wire
    
- conductive thread
    
- conductive fabric
    

---

### Resistive Materials

Resistance changes depending on interaction.

Examples:

- velostat
    
- conductive rubber
    
- stretch sensors
    
- pressure sensors
    

---

### Non-Conductive

Examples:

- most fabrics
    
- plastic
    
- insulation materials
    

---

## Wiring Materials

### Cables

Examples:

- speaker cable
    
- ethernet cable
    
- coaxial cable (shielded)
    

Connections often require:

- terminal blocks
    
- headers
    
- tinning
    

---

### Prototyping Platforms

|Tool|Purpose|
|---|---|
|Breadboard|rapid prototyping|
|Protoboard|permanent circuits|
|Flexible protoboard|wearable electronics|

Breadboards are **not suitable for wearables**.

---

# Electronic Textile Pioneers

## Early E-Textile Researchers

### Maggie Orth

- MIT Media Lab
    
- **Soft Interface Circuit**
    
- **Interactive Fashion Machine**
    
- Textile light controllers
    
- Dimmer pom-pom
    

---

### Joanna Berzowska

- Founder of **XS Labs**
    
- Early 2000s wearable research
    

---

### Sarah Diamond

- Banff New Media Center
    

---

### Leah Buechley

Major innovations:

- **LilyPad Arduino (2006)**
    
- sewable electronics
    
- non-rectangular circuit boards
    
- lighter components
    

Goals:

- manufacturable
    
- beginner-friendly
    
- integrated into textiles
    

---

### Hannah Perner-Wilson & Mika Satomi

Group: **KOBAKANT**

Location:

- Berlin
    

Known for:

- Electronic Textile Summer Camp
    
- systematic exploration of e-textile techniques
    
- iterative making practices
    

---

### Jie Qi

Founder of **Chibitronics**

Innovations:

- circuit stickers
    
- conductive tape
    
- Z-tape (3M directional conductive adhesive)
    

---

### Becky Stern

- wearable electronics educator
    
- online tutorials and maker content
    

---

### Madison Maxey

Founder of **Loomia**

Focus:

- conductive fabrics
    
- heating textiles
    
- touch sensors
    
- textile integration for fashion designers
    

---

### Rachel Freire

Technique:

- **iron-on adhesive circuits**
    

---

# E-Textile Materials

## Conductive Thread

Characteristics vary:

- hairy vs smooth
    
- metal type
    
- oxidation
    
- resistance per length
    

Common material:

- **stainless steel thread**
    

Tips:

- stitch tightly
    
- shorter paths reduce resistance
    

---

## Conductive Fabric

Examples:

- rip-stop conductive fabric
    
- ShieldIt Super Fabric  
    [https://lessemf.com](https://lessemf.com)
    

Features:

- iron-on circuits
    
- copper conductive fabric
    

Suppliers:

- Sparkfun
    
- Adafruit
    
- European manufacturers
    

Limitations:

- often only silver color
    

---

### Stretch Conductive Fabrics

Examples:

- conductive organza
    
- conductive yarn
    

Properties:

- conductivity in one direction
    
- anisotropic behavior
    

---

### Emerging Materials

- TPU conductive printing
    
- stainless steel fibre
    
- silver yarns
    

---

# Textile-Based Switches

Common switch designs:

### Mechanical

- tilt switch
    
- micro switch
    
- latching switch
    

---

### Textile Switches

#### Bridge Switch

- two conductive surfaces
    
- pressed together to connect
    

---

#### Soft Button

Made using:

- conductive fabric
    
- thread
    
- foam
    

---

#### Snap Switch

Example: **Open Softwear**

---

#### Zipper Switch

Two configurations:

- across fabric
    
- along zipper
    

---

#### Brauswitch

Wearable switch system using bra clasp hardware.

---

## Key Electrical Concept

### Default State

Switches have a **normally open** or **normally closed** state.

"Normally" means:

> the state without human interaction.

---

# Sensors and Analog Input

## Pulse Width Modulation (PWM)

![[Pasted image 20260122221714.png]]
![[Pasted image 20260122222016.png]]
Analog output pins **simulate voltage changes** using PWM.

Explanation:

- the pin rapidly switches between **0V and 5V**
    
- varying duty cycles create the **illusion of intermediate voltages**
    

Example:

- 50% duty cycle ≈ 2.5V effect.
    

Source:

Hartman, _Make: Wearable Electronics_.

---

## Sensors

Example sensors:

- light sensor
    
- force sensing resistor (FSR)
    
- stretch sensor
    
- EMG sensor
    


---

### EMG Sensors

Electromyography sensors detect **muscle activation signals**.

Example:

- shrug
    
- bicep flex
    

---

## Sensor Calibration

Calibration adjusts code to fit environmental conditions.

Example:

- lighting conditions
    
- body weight differences
    
- movement variability
    

Example Arduino path:

File → Examples → 03.Analog → Calibration

Recommended modifications:

- analog input → **A2**
    
- output → **Pin 11**
    

---

### Sensor Smoothing

Reduce noisy readings.

Arduino example:

File → Examples → 03.Analog → Smoothing

---

### Constrain Function

Limits sensor values.
Constraining
```
constrainedLightSensorValue = constrain(lightSensorValue, 300, 650);
```

![[Make_Wearable_Electronics_----_(Pg_158--158).pdf]]

---

## A stretch sensor

>  Similar to the pressure-sensor example, DIY stretch sensors can be created by knitting or crocheting resistive yarns. The more the knit is stretched or pressed, the more highly conductive it becomes.  

- conductive rubber cord
    
- resistance decreases when stretched.
    

DIY version:

- knit resistive yarn
    
- crochet conductive fibres
    

---
## Capacitive Touch

![[Pasted image 20260122225456.png]]

>  Capacitive touch sensors can turn any piece of conductive material into a touch-sensitive interface. This means you can use soft conductive materials such as fabrics and threads to create touch-responsive sensor pads. Capacitive touch sensors are available as stand-alone breakout boards. These boards can support one or more “keys” or touch pads that can behave as either momentary or toggle switches. Some offer on-board LEDs for a quick indication a sensor is activated. Capacitive sensing capabilities are also integrated into some microcontroller boards such as the CPX.  
>  The tricky bit is that capacitive sensors are very sensitive. The wire or thread that connects the conductive material to the microcontroller or breakout board pin becomes touch-sensitive as well (unless properly shielded). Always be sure to press the Reset button on the board after adding conductive material to a capacitive sensor to make sure it is properly calibrated.  


Capacitive sensors allow **any conductive material** to become a touch interface.

Examples:

- conductive fabric pads
    
- conductive threads
    

Important note:

The **connecting wire also becomes sensitive** unless shielded.

Reset the board after modifying sensor area for recalibration.


---

# Variable Resistors

Examples:

|Material|Behavior|
|---|---|
|conductive rubber|stretch → lower resistance|
|velostat|pressure → resistance change|
|resistive yarn|tension sensitive|

---

## Voltage Divider

Typical starting resistor (for etextile):

**10kΩ**

Voltage dividers allow sensors to be read by analog pins.

---

## DIY Sensor Ideas

Possible fabrication techniques:

### Felting

Materials:

- wool
    
- stainless steel fibre
    

Build gradually using small conductive amounts.

---

### Embroidery

Materials:

- silver plated nylon thread
    

Resistance changes based on:

- thread length
    
- tension
    

---

# Week 3 — Haptics

## Kinesthesia

Also called **proprioception**.

Definition:

> the body's sense of position and movement.

Interaction with technology can be **bidirectional**:

- the user touches the device
    
- the device alters bodily perception.
    

---

## Haptic Illusions

Examples:

- **Sensory funneling illusion**
    
- **Phi phenomenon**
    
- **Sensory saltation illusion**
    

These manipulate the brain’s perception of touch.

---

## Haptic Applications

Examples:

- posture correction buzzers
    
- haptic car handles
    
- **BrainPort**
    
- **SUBPAC** (feel bass frequencies)
    
- haptic gloves
    

Example performance:

[Music Not Impossible](https://www.notimpossible.com/projects/music-not-impossible)

Concept: **haptic musical score**.

---

## Vibrotactile Motors

Two common types:

### ERM

**Eccentric Rotating Mass**

- traditional vibration motor
    
- spinning weight
    

---

### LRA

**Linear Resonant Actuator**

- behaves like speaker
    
- used in **Apple Taptic Engine**
    

Research reference:

Camille Moussette — _Simple Haptics_

---

## Current Limits of Microcontrollers

Examples:

|Board|Current|
|---|---|
|Arduino UNO|~40 mA|
|Nano IoT 33|~7 mA|
|Circuit Playground Express|~10 mA|

To drive stronger motors:

→ use **transistor circuits**.

---

## Transistor Motor Control

3.3v or 5v from VOUT

![[Pasted image 20260130103900.png]]
Use TIP120
![[Pasted image 20260130094446.png]]

Transistor pins takes small current as trigger:

- **Base** → microcontroller signal
    
- **Collector** → power + motor
    
- **Emitter** → ground
    

Add a **flyback diode** to protect the circuit from motor voltage spikes.



---

## Motor Driver Boards

Examples:

- Haptic Motor Driver
- LilyPad Vibe Board
- MOSFET Driver 

Drivers allow:

- programmable vibration patterns
    
- waveform libraries
    

---

## DIY Vibration Modules

Possible constructions:

- polymorph housing
- magnetic snap motors
- heat-shrink encapsulation
- silicone wire arrays
- sealed plastic vibration packs
- Amazon, motor with transistor circuit on





---

# Week 4 — Actuators and Wearable Interaction

## Shape Memory Alloy (SMA)

Actuators made from metal wires that:

- contract when heated
    
- return when cooled
    

Example project:

[https://www.instructables.com/Caress-the-Gaze-3D-Printed-Structures-Using-SMA-Ac/](https://www.instructables.com/Caress-the-Gaze-3D-Printed-Structures-Using-SMA-Ac/)

---

## Other Actuators

Common types:

- **Stepper motors**
    
- **Solenoids**
    
- **Servo motors**
    

![[Pasted image 20260206092737.png]]

---

## Wearable Interaction Design

Two core components:

### Sensing

Detect:

- movement
    
- touch
    
- pressure
    
- muscle signals
    

---

### Actuation

Produce outputs:

- vibration
    
- movement
    
- heat
    
- sound
    

Wearable systems combine **sensing and actuation loops**.

---

## Social Signaling

Wearable devices influence **social behavior**.

Effects include:

- signaling emotional states
    
- augmenting body language
    
- creating ripple effects in social interaction
    

---

## Design Challenge

Wearables are rarely built alone.

Typical team includes:

- hardware engineer
    
- software engineer
    
- textile designer
    
- fashion maker
    

Kits and platforms help **bridge the skill gap**.

---

## Placement of Wearable





---

## Heartrate display

Panda



---

SSD1306 0.91" OLED
- Self emissive OLED (each pixel is one led)
- only on and off

ESP32-C3 (XIAO/SuperMini)
- single core
- 3.3v logic  (same as display)
- doesn't work with arduino ide

Library
- platform IO as manager
- Adafruit SSD1306

- Monochrome
- framebuffer lives in RAM

No excessive animation
o as organic LED, better contrast, brighter


---


## CircuitPython

- create a file
- edit code
- press reset button twice
- download the newest v of CP
- drag and drop .UF2 to the drive
- when drive name changed to CIRCUITPY, its done
- create copy.py
- code.txt, code.py, main.txt, main.py

---

protocol: MIDI
- input, sensor, plays samples in a computer
- 5-pin DIN, USB cable
- 3 bytes, 8bits
- Status byte, data byte, ...
- cpg as MIDI set in MIDI Studio (Mac)
- TouchDesigner, Dialogue->MIDI mapper->check MIDI devices, choose cpg->eg. gyro
- Bjork, embroidered LED strings
- 


---

Design stages
Ver1: Functional prototype, how to do base. circuit layout, putting whatever possible on body in 10min,getting quick learnings. One hour wearable
- agency, why wearable matters, what is meant to make something that enters body space, what's the responsibility, social contract and care is involved
- collaboration vs. solo
- protecting circuits
- wireless communication (BLE)
- where you can make a contribution

Shielded cable: 2 grounds
[Capacitive sensing](https://github.com/socialbodylab/Textile-Game-Controller-Jam?tab=readme-ov-file#capactive-fab)


---

# Additional References

### Haptics

- Lynette A. Jones — _Haptics_ (2018)
    
- David Parisi — _Archaeologies of Touch_
    
- Camille Moussette — _Simple Haptics_
- Fashioning Technology, Suzy 
- Switch Craft 

Think about writing books


- ==Soft Circuit, crafting e-fashion with DIY electronics , curriculum for kids, steam education==
- advanced cosplay lights
- ==Fashion and technology, a guide to materials, for fashion students, interview with people (in digital library)==
- Textile messages, essays and projects
- functional clothing design, Lucy
- See Yourself
- Stitching Worlds
- ==Garments of Paradise, sociology==
- Ready to Wear, A rhetoric..
- XS Lab, Montreal, 10 year catalog
- Clement Zheng, Colorado, Everyday material
- ==Angela Mackey, Rethinking Dynamic Fabric, autobiographic style writing==
- ==Glitching the Fabric, fabric and software==
- Radiant textiles designing electromagnetic textile systems, erin lewis


[Block language](https://makecode.adafruit.com/#editor)
[Instructables](https://www.instructables.com/)
[Rachel ](https://www.rachelfreire.com/etextile-data-gloves), layering
[Kay wasil](https://kwasil.com/costumegallery.html)

---

### Labs

- MIT Tangible Media Group
    
- MIT Media Lab
- MIT [Cutaneous Sensory Lab](https://cutaneous.mit.edu/)
    
- KOBAKANT
    

---

### Online Resources

- [https://lara-grant.com/e-textiles/](https://lara-grant.com/e-textiles/)
    
- [https://unstable.design/projects/yarny/](https://unstable.design/projects/yarny/)
    

---

# Tags

#body-centric-tech  
#wearables  
#etextiles  
#haptics  
#sensors  
#actuators  
#class-notes