---
course: Creation & Computation
week: Week 12(1)
instructor: Kate Hartman, Nicholas Puckett
tags:
  - class-notes
  - theory
  - practice
  - lecture
  - bluetooth
status: completed
date: 2025-11-18
draft: true
---
# Creation & Computation — Week 12-1 (Nov18)


Below contents almost entirely comes from the class held by Kate Harman and Nicholas Puckett at OCADU.

## Lecture & Discussion Notes

Web-based, controllers connected with bluetooth
#### DFpong_controller_startTemplate

When you open either of the examples, you must set the number to match your assigned Player Number in the code. _If you do not set this correctly, your controller will not be able to connect._

// ============================================

// IMPORTANT: SET YOUR DEVICE NUMBER HERE (1-25)

// ============================================

const int DEVICE_NUMBER = 0; // ← CHANGE THIS TO YOUR ASSIGNED NUMBER!

// ============================================

Use this code as the starting point for your controller. It allows you to interface different types of sensors to the DF Pong game utilizing the game's protocol:

int currentMovement = 0; // Current movement value (0=none, 1=up, 2=down, 3=handshake)


.h files are also necessary to do Bluetooth connection

---

## To-Do & Follow-up

- _**In Exp 3**_, we learned how p5.js could analyze camera data to instruct an Arduino to initiate movement in the physical environment. _**In Exp 4**_, we will do the reverse – use Arduino to collect and analyze sensor data in the physical environment and use decisions based on that data to control what is happening on a screen.  
- _**In Exp 3**_, we distanced components in our system through longer cables and design. _**In Exp 4**_, we will “cut the cord” and replace our USB cable with wireless communication. 
- _**In Exp 3**_, most programming was done in p5.js. _**In Exp 4**_, all programming will be done in Arduino.
- Do not simply mimic existing controller typologies, focus on experimental interactions that have a clear conceptual focus.

---

## Links & Resources
- https://tomgerhardt.com/mudtub/
- https://www.wobblylabs.com/line-wobbler
- https://tomgerhardt.com/mudtub/expre
- https://hhayeon.com/Expressive-Tactile-Controls 
	personality of different interfaces that we take for granted and expect them not to have any personlaity
- Long pooong
	Use Arduino to switch 7 TVs
	Only old TV works because new ones turn on too slow
- https://shakethatbutton.com/
- Jackson McConnell, knock knock, quantum butt
- Thermacromatic chromatic dye
- Squash, Octave Perrault
