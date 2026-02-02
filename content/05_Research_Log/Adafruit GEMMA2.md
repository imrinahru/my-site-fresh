---
title: Experiment with Adafruit GEMMA2
date: 2025-01-15
tags:
  - log
  - experiment
  - wearable
draft: false
---

# Experiment with Adafruit GEMMA2
## About GEMMA2
https://youtu.be/R5swa3C7OIY?si=-iNveK6-eR-3-K4t

https://beckystern.com/2015/03/11/gemma-2-update-adafruits-tiny-sewable-microcontroller/
https://beckystern.com/2014/03/19/flora-vs-gemma-which-board-should-i-use/
- 3 iopins
- dl arduino for adafruit gemma 
- at tiny 85chip, 5k flash,
- velostat
- switch
- sound sensitive
- vibration sensor: https://beckystern.com/2015/12/02/firewalker-2-0-sneakers-with-gemma/
![[Pasted image 20260115121741.png]]
![[Pasted image 20260115121759.png]]
Source: Adafruit

- doesn't have serial port, can't send data to computer (flora is better for debugging, you can debug in flora and comment out serial commands and load in gemma)

## History

https://www.sparkfun.com/about-lilypad

## Shopping list

- [ ] Nail polish
- [x] double-sided iron on inner facing, or fusible web, paper-backed (not interfacing, which is one-sided)
- [x] tiny iron
- [x] heat proof mat
- [ ] parchment paper
- [x] Sharp blade (for fabric)
- [ ] https://www.ifixit.com/products/minnow-driver-kit
- [x] cutting mat (62.5 * 21.5cm)
- [ ] bradawl (pick a thick foam board)
- [x] rotary cutter for fabric (straight line)
- [ ] Non-slip quilting ruler
- [x] aluminum foil
- [ ] silk painting materials:
	- [ ] dye-na-flow fabric paints
	- [ ] water-soluble clear gutta
	- [ ] adjustable frame to stretch the silk
	- [ ] thumb tacks


- [x] conductive thread
	- [x] [thin 2ply](https://www.adafruit.com/product/640?srsltid=AfmBOooVkUcJMkxkv4ku5wcWsX5DyVrM9sKxbT2g60brcLLxnDrrHItQ)
	- [x] [3 ply](https://www.adafruit.com/product/641)
- [x] [flora rgb neopixel](https://www.adafruit.com/product/1260)
	- [x] bought [these](https://www.adafruit.com/product/1758) tiny LEDs instead!
- [x] conductive fabric
	- [x] [nylon tape](https://www.adafruit.com/product/3960)
	- [x] [nylon 10cm2](https://www.adafruit.com/product/4762)
- [x] FLORA (3v, 28k memory, can be used for many sensor, including color, for arduino, download setup from adafruit)
- [x] GEMA (3v, 5k memory, recommended for velostat, tilt bar)
- [x] [multimeter](https://www.adafruit.com/product/850)
- [x] [nose plier](https://www.adafruit.com/product/1368)
- [x] [wire stripper](https://www.amazon.ca/dp/B00FZPHMUG/ref=as_li_ss_tl?psc=1&pd_rd_i=B00FZPHMUG&language=en_US&pf_rd_p=ef4dc990-a9ca-4945-ae0b-f8d549198ed6&pf_rd_r=NY6H3YDJ2HVGQEP45MTK&pd_rd_wg=q4Yxn&pd_rd_w=CHpA0&refRID=NY6H3YDJ2HVGQEP45MTK&pd_rd_r=e16e6ae4-1608-11e9-93a9-8d61c30beb18&linkCode=gs2&linkId=58993d69e63f8123c4345fad32fef1d2&tag=beneater00-20) (have one)
- [x] [logic probe](https://www.amazon.ca/dp/B000Z9HAP4/ref=as_li_ss_tl?keywords=logic+probe&language=en_US&ie=UTF8&sr=8-3&linkCode=gs2&linkId=27b12d1871c627514920ce1edf898070&tag=beneater00-20) (got the multi-meter)


## Experiement1: LED with fading (no sensors)

References
- https://www.kobakant.at/DIY/?p=6315
	- using gemma
- https://www.kobakant.at/DIY/?p=7040
	- Stitch->rip->add LED
- https://beckystern.com/2012/06/02/sewable-led-sequins/
- https://beckystern.com/2013/01/02/10-tips-for-conductive-thread/
	- 3 ply thread has a resistance of 10 ohms per foot for components that use under ~100mA. It is thicker than standard cotton/poly thread and can be used for hand sewing or in industrial sewing machines
- https://beckystern.com/2014/04/30/purse-light-with-gemma-led-sequins/

![[Pasted image 20260115103217.png]]

Code
```
//KOBAKANT example

int led[9] = {  
5, 6, 9, 10, 11, 16, 17, 18, 19  
}; // LED pins

void setup() {  
for (int i = 0; i < 9; i++) { 
pinMode(led[i], OUTPUT); 
digitalWrite(led[i], HIGH); 
delay(100); 
digitalWrite(led[i], LOW); 
} 
} 

void loop() { 
for (int i = 0; i < 5; i++) { 
for (int f = 0; f <= 254; f += 1) { 
analogWrite(led[i], f); 
delay(5); 
} 
for (int f = 254; f >= 0; f -= 1) {  
analogWrite(led[i], f);  
delay(5);  
}  
}  
for (int i = 5; i < 9; i++) { 
digitalWrite(led[i], HIGH); 
delay(600); 
digitalWrite(led[i], LOW); 
delay(600); 
} 
}


```




### Reference

- [tips for beginners](https://beckystern.com/2025/06/22/17-tips-for-electronics-beginners/)
- [how to sew](https://beckystern.com/2015/08/26/how-to-sew-the-perfect-neopixel-circuit/)
- [how to wash](https://beckystern.com/2014/01/21/washing-wearable-electronics/)

- Another option: [Trill craft](https://www.youtube.com/watch?v=ClBYyYEFkF0)
![[Bela_TRILL_sensors_datasheet.pdf]]

