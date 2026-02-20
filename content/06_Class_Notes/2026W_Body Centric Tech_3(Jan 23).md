---
course: Course Name
week: Week 3
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

- MWE Chapter 6 - pp. 120-133; 143-146
    
- MWE Chapter 7 - pp. 154-158; 174-176

![[Pasted image 20260122221714.png]]
![[Pasted image 20260122222016.png]]

whereas an analog input pin reads a set range of voltages, despite what you might think, an analog output pin does not produce a range of voltages. Instead, it simulates a change in voltage to create an analog effect by pulsing 5 V in differing duty cycles. This effect is called pulse width modulation (PWM). If the pin is quickly switched back and forth between 0 V and 5 V, it creates the effect as if it were outputting 2.5 V, and so on.  
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:24:14.

an electromyography (EMG) sensor.  
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:29:34.

Sensors, look for
- voltage used
- connector type
- sensitivity
- accuravy


- Calibration is a way to fine-tune your code so it is responsive to a specific set of conditions. The range of what a sensor senses will differ based on its environment and context. The amount of light available in your bedroom or studio will differ greatly from that on the street or in a park. A forcesensing resistor will read different values when stepped on by a five-yearold compared to a fifty-year-old. If you know you’ll be using your project in varying contexts, it’s worth including a calibration routine in your code. You can determine the highest and lowest possible values and configure the rest of your program accordingly.  
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:37:47.

To see an example of this, in Arduino, go to File → Examples → 03.Analog → Calibration. In the code, change the analog input pin to A2 and the digital output pin to pin 11. Then upload the code to your Arduino board.  
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:39:12.

Smoothing
File → Examples → 03.Analog → Calibration

Constraining
```
constrainedLightSensorValue = constrain(lightSensorValue, 300, 650);
```

![[Make_Wearable_Electronics_----_(Pg_158--158).pdf]]

A stretch sensor is simply a conductive rubber cord whose resistance decreases the more it gets stretched. This is yet another example of a variable resistor.  
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:50:54.


FSR
- A stretch sensor is simply a conductive rubber cord whose resistance decreases the more it gets stretched. This is yet another example of a variable resistor.  
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:50:54.

Stretch
- Conductive rubber
- Similar to the pressure-sensor example, DIY stretch sensors can be created by knitting or crocheting resistive yarns. The more the knit is stretched or pressed, the more highly conductive it becomes.  
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:54:07.

CAPACITIVE TOUCH 
- 
- Capacitive touch sensors can turn any piece of conductive material into a touch-sensitive interface. This means you can use soft conductive materials such as fabrics and threads to create touch-responsive sensor pads. Capacitive touch sensors are available as stand-alone breakout boards. These boards can support one or more “keys” or touch pads that can behave as either momentary or toggle switches. Some offer on-board LEDs for a quick indication a sensor is activated. Capacitive sensing capabilities are also integrated into some microcontroller boards such as the CPX.  
- The tricky bit is that capacitive sensors are very sensitive. The wire or thread that connects the conductive material to the microcontroller or breakout board pin becomes touch-sensitive as well (unless properly shielded). Always be sure to press the Reset button on the board after adding conductive material to a capacitive sensor to make sure it is properly calibrated.  
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:56:17.
Hartman, Kate. _Make: Wearable Electronics_, Maker Media, Incorported, 2025. _ProQuest Ebook Central_, http://ebookcentral.proquest.com/lib/oculocad-ebooks/detail.action?docID=31873907.  
Created from oculocad-ebooks on 2026-01-23 03:55:31.
![[Pasted image 20260122225456.png]]


**Variable resistors**
- resistive materials
- sensors as components vs. sensors as materials
	- shelfed, predetermined
	- potential to play 
- conductive rubber
	- stretch less resist
- velostat or linqstat
	- anti-static, electronic packaging
	- changes resistance when pressed/flexed
- 
- 

**Voltage divider**
- start with 10k fixed resister 

Comeup with a sensor!

Felting
- Wool, use only a little conductive material and build up
- stainless steel fibre
- yarnex and french brand (more resistance, and changes with press)

Embroidery
- use something that changes resistance with length
- silver plated nylon, old, larger 


---

## Links & Resources
- [Lara Grant ](https://lara-grant.com/e-textiles/) 
- [Yarns!](https://unstable.design/projects/yarny/)
- 

---

## Tags
#class-notes #theory #practice
