---
title: Embroidered Electronics (and a Computer)
date: 2025-10-11
tags:
  - idea
  - project
  - embroidery
  - materials
  - digital-craft
draft: false
---

## Context

https://ireneposch.net/stitching-worlds/

>  with the advent of electronically conductive fibres, it might be possible to adapt the use of textile machinery to translate patterns into electronic functions. Altered processes and materials can be used to produce electronic components such as resistors, capacitors, inductors, and eventually complete electronic appliances.

>  What if electronics emerged from knitting, weaving and embroidery? How would technology be different if craftspeople were the catalyst to the electronics industry, via textiles manufacturing?


## Rough Plan

1. Try different types of stitching on the translucent organza material
2. Understand the basics of circuit board and schematics
3. Design the simplest circuit board
4. Test out a fabric circuit board
5. Expand the idea to 8-bit computer and machine learning demo
6. One layer
7. A layer + an object (just an idea: covering the infamous atomic bomb as both sides of computation)
8. Create a multi-layered silk installation

## 8-bit Computer
- [ ] https://eater.net/8bit/parts

https://eater.net/8bit/kits
https://www.youtube.com/watch?v=HyznrdDSSGM
https://www.instructables.com/Making-an-8-Bit-Computer/
https://learn.sparkfun.com/tutorials/how-to-read-a-schematic/all


## Machine Learning with 8-bit

https://petewarden.com/2015/05/23/why-are-eight-bits-enough-for-deep-neural-networks/
https://blog.lessaworld.com/2025/03/09/running-a-perceptron-on-an-8-bit-computer/
https://medium.com/data-science/ultra-tinyml-machine-learning-for-8-bit-microcontroller-9ec8f7c8dd12

> **The Challenge: Teaching an Old Computer New Tricks**

> I decided to implement Perceptrons, the most fundamental type of artificial neural network. Perceptrons are a supervised learning algorithm used in machine learning to classify data with simple binary decisions – perfect for a machine with limited power!
> 
> Now, let’s be real: running a Perceptron on an 8-bit computer is a serious limitation. But at its core, AI is just math, and I wanted to prove that you could implement the basic logic of artificial neural networks on even the most primitive hardware.
> 
> The goal? To use Perceptrons to model simple logic gates (AND, OR, NOT) – the building blocks of computation.

## Textile 8-bit Computer

![[レコーディング 2025-10-11 210533.mp4]]
![[assets/img/embroidered_computer.png]]
![[assets/img/embroidered_computer_signal_diagram.png]]

![[2851581.2891101.pdf]]
![[StitchingWorlds_Book_Kurbak_Ed__1_May2019_PDF-A.pdf]]

## Process

1 Bit
- https://www.kobakant.at/DIY/?p=5915

- [textile relays (prototype)](https://www.stitchingworlds.net/experimentation/textile-relays/)

- https://www.kobakant.at/DIY/?p=8059

	- what is pnp and npn
	- what is h-bridge circuit
	- what are transistors

- ==enameled copper wire (0.1mm diameter)==
- ![[Pasted image 20260115080614.png]]
- used a pen which is about 1cm diameter and wind 80 times each. Use tape to hold them together when finished winding.
- small pieces of copper fabric with fusible interface on the back
- fix it to the base fabric by ironing it on. This will serve as a connection point to the power source.
- ![[Pasted image 20260115080846.png]]
- The magnet wire has enamel coating in order to isolate. We need to take out this isolation layer on the ends to make an electrical connection to the conductive fabric we added. For this, use lighter to burn the coating and scrape it off with ==fine gauge sand paper==. Check with multimeter if the isolation layer is taken out properly.
- Heat up the fabric with soldering iron short time and add the solder to it. The solder will stick to the fabric like a paint. Then place the end of the coil wire on the applied solder and melt them together.
- ![[Pasted image 20260115081605.png]]
- polymorph + neodymium magnet (5mm diameter, 2mm high, axially magnetized) +thread or
- ==magnetic bead (magnetite beads, hematite beads, polarised exactly around the through hole axis) if there is==
- Place the finished “dot” on the coil, and thread the two end of the thread coming out of the dot to the back of the fabric. Make sure to give some extra length on the thread so there are a space to flip for the dot.
- ![[Pasted image 20260115082107.png]]
-  2-3V from bench power supply. You can also use 2xAA battery or lipo battery.
- For multiple, The magnetic beads need sufficient distance to each other in order to be controlled individually
- ![[Pasted image 20260115082737.png]]
-  automatic pullback in putting a small magnet underneath the bead. The magnets force is overwritten by the active electromagnet, but has enough strength to pull the magnetic bead back in its original position ((S-015-01-N2-Ni magnet, 0,01g underneath the flipping pearl)
- Relays are electrically actuated switches. […] For a typical mechanical relay, a current sent through a coil magnet acts to pull a flexible, spring-loaded conductive plate from one switch contact to another. (Scherz 2007)


Array
- [display](https://www.stitchingworlds.net/experimentation/pearl-embroidery-display/)

Community
- [Crochet in Turkey](https://www.stitchingworlds.net/experimentation/towards-crafting-a-computer-crochet-in-turkey/)
- [documentation](https://www.stitchingworlds.net/experimentation/towards-crafting-a-computer-testing-the-alu/)
![[Pasted image 20260115070407.png]]




## General Links and Resources
- [KOBAKANT](https://www.kobakant.at/DIY/?cat=179)
- https://www.stitchingworlds.net/
- http://ireneposch.net/the-embroidered-computer/
- https://turtlestitch.org/

## Other ideas

Things that got me interested in:
- lifting![[Pasted image 20260115083245.png]]
- flipping like eyes

[Other mechanisms](https://www.kobakant.at/DIY/?p=5878)

Mending with embroidery
- Create a model house with switches and other electronics rethought
- light switch, a clock, a computer, a timer