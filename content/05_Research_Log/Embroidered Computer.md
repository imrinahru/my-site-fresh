---
title: Embroidered Computer
date: 2025-10-11
tags:
  - idea
  - project
  - embroidery
  - materials
  - digital-craft
draft: false
---

# Embroidered Computer

## Context

https://ireneposch.net/stitching-worlds/

>  with the advent of electronically conductive fibres, it might be possible to adapt the use of textile machinery to translate patterns into electronic functions. Altered processes and materials can be used to produce electronic components such as resistors, capacitors, inductors, and eventually complete electronic appliances.

>  What if electronics emerged from knitting, weaving and embroidery? How would technology be different if craftspeople were the catalyst to the electronics industry, via textiles manufacturing?


## Plan

1. Try different types of stitching on the translucent organza material
2. Understand the basics of circuit board and schematics
3. Design the simplest circuit board
4. Test out a fabric circuit board
5. Expand the idea to 8-bit computer and machine learning demo
6. One layer
7. A layer + an object (just an idea: covering the infamous atomic bomb as both sides of computation)
8. Create a multi-layered silk installation


## Experiment with 1 tiny bit (1/0)



![[WhatsApp Video 2026-01-26 at 9.02.21 AM.mp4]]


## Reference

### Conventional 8-bit Computer
https://eater.net/8bit/parts

https://eater.net/8bit/kits
https://www.youtube.com/watch?v=HyznrdDSSGM
https://www.instructables.com/Making-an-8-Bit-Computer/
https://learn.sparkfun.com/tutorials/how-to-read-a-schematic/all


### Clock 
Why you need a clock
1. load input
2. multiply
3. add
4. threshold
5. output
Each step(eg. perceptron) needs a timing signal.
Industrially, 555 timer, microcontroller are used



### Machine Learning with 8-bit

The basic formula: 
y=sign(∑wi​xi​+b)

On an 8-bit system, that means:
- integer or fixed-point math
- very small input vector (2–8 inputs)
- _inference first_, training optional

### Inference, constant weight, and ROM

What is meant by inference?
In a classical perceptron, there are **two distinct phases**:
1. **Training**
    - Weights are updated
    - Learning rule applied
2. **Inference**
    - Weights are fixed
    - System only computes output

The fabric 8-bit computer is designed to perform **inference**, not training, since the program flow assumes weight₁, weight₂, … are **constants**.
So architecturally weights are _read-only parameters_, not variables.

This suggests **ROM, not RAM**.
with ROM weights:
- `MUL k` simply:
    - selects weight line `k`
    - feeds it into multiplier
    - no state change
k is based on material.

### Why inference rather than training?

The biggest reason is the feasibility, but there's also a philosophical choice that I consciously made. 

In normal computers, execution = interpreting symbolic instructions, where program and data live in the same abstract space.

learning-as-execution hides:
- effort
- material cost
- irreversibility

In fabric computer, execution = physical signal propagation. There is not material structural change, execution is time passing through a fixed textile structure.

One idea that can be explored is: Learning = changing the textile, not the execution
- The textile _is_ the model
- Updating the model means rebuilding part of the machine

This design makes explicit what modern ML hides:
- learning consumes resources
- learning changes infrastructure
- learning is not free
- learning leaves traces

In a fabric computer:
- every learned change has:
    - a tactile cost
    - a visible history
    - a labor footprint

“Visible history” refers to the fact that learning in the system produces irreversible material traces—stitches, patches, deformations, and repairs—that make the system’s past states and interventions legible in its present form.

In conventional machine learning:
- Weight updates are numbers in memory
- Old values are overwritten
- There is no trace of _how_ a model arrived at its current state
The system has **no memory of its past**, only its current parameters. But in a fabric-based ML system,
- Weights are not overwritten
- They are **physically altered**
- Previous states are not fully erased
In summary:

| Digital ML           | Fabric ML            |
| -------------------- | -------------------- |
| Weight update        | Material alteration  |
| Overwrite            | Accumulation         |
| Invisible training   | Legible intervention |
| Clean state          | Patched state        |
| Forgetting by design | Memory by residue    |

This aligns with:
- craft traditions (repairs are legible)
- feminist and care-centered technologies
- Illich’s critique of opaque tools
- post-digital material ethics

It is building a system where intelligence leaves marks.
And where those marks:
- slow future change
- constrain behavior
- demand care

Decision emerges from accumulated material interactions =
The output bit is not computed symbolically, but arises only after currents, delays, resistances, and physical propagation across the textile have collectively stabilized into a state that crosses a comparator boundary.
Philosophy = circuit diagram

(Generated with ChatGPT)



Different ways of doing:
1. Material computation
	- The _program_ is the textile topology
	- The weights are literally stitched
	- Reprogramming = re-stitching or patching
- It's not
	- Training (unless manual)
	- Precise repeatability
- Only need comparator IC (LM393 or similar) to output "neuron"

2. Digital fabric computer + perceptron in microcode
	- Hand-written assembly/microcode
	- 
	- 

|Opcode|Meaning|
|---|---|
|LOAD|Load input into register|
|MUL|Multiply input × weight|
|ADD|Add to accumulator|
|CMP|Compare with threshold|
|JMP|Jump to next step|

```
Step 1: LOAD input_1
Step 2: MUL weight_1
Step 3: ADD accumulator
Step 4: LOAD input_2
...
```



### Other readings:

https://petewarden.com/2015/05/23/why-are-eight-bits-enough-for-deep-neural-networks/
https://blog.lessaworld.com/2025/03/09/running-a-perceptron-on-an-8-bit-computer/
https://medium.com/data-science/ultra-tinyml-machine-learning-for-8-bit-microcontroller-9ec8f7c8dd12

> **The Challenge: Teaching an Old Computer New Tricks**

> I decided to implement Perceptrons, the most fundamental type of artificial neural network. Perceptrons are a supervised learning algorithm used in machine learning to classify data with simple binary decisions – perfect for a machine with limited power!
> 
> Now, let’s be real: running a Perceptron on an 8-bit computer is a serious limitation. But at its core, AI is just math, and I wanted to prove that you could implement the basic logic of artificial neural networks on even the most primitive hardware.
> 
> The goal? To use Perceptrons to model simple logic gates (AND, OR, NOT) – the building blocks of computation.

## Irene's Textile 8-bit Computer

![[レコーディング 2025-10-11 210533.mp4]]
![[assets/img/embroidered_computer.png]]
![[assets/img/embroidered_computer_signal_diagram.png]]

![[2851581.2891101.pdf]]
![[StitchingWorlds_Book_Kurbak_Ed__1_May2019_PDF-A.pdf]]

### Process reference

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

## Important questions/areas

- Goldwork, craft, history/narrative of the object: uselessness or richness? Flattened world
- Digital materiality, history/narrative of the digital: hidden, clean or disorderly


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

- Mending with embroidery
	- Create a model house with switches and other electronics rethought
	- light switch, a clock, a computer, a timer
