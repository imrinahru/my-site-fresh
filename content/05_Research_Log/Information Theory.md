---
title: Information Theory
date: 2026-04-05
tags:
  - log
draft: false
---


## Research Theme

Based on information theory established by practices and theories leading up to Claude Shannon, the idea can be applied to weaving pattern as an alternative speculative means for encoding information. Ideas that can be incorporated: 

- how 1st order, 3rd order entropy translates into patterns (based on study by Hartley, Shannon, and later Brenda McCowan Laurence R Doyle)
- What information structure will translates into aesthetically strong weaving pattern? or does cultural language correlates with that?
- Huffman's minimum redundancy
- Hamming's error check redundancy
- Does weaving afford cryptography as well?


## Reference

https://www.youtube.com/watch?v=p0ASFxKS9sg&list=PLbg3ZX2pWlgKDVFNwn9B63UhYJVIerzHL
How do you weigh an idea? From ancient cave paintings to DNA, from bee dances to binary code - discover how all forms of communication can be measured using a single unit: the bit. Join us on a journey through Information Theory, where we'll uncover the surprising way that coins can help us understand the fundamental nature of information itself.


Information theory
Somewhere around 50000 years ago, sudden explosion of diverse cultural artifacts, creative outputs to externalize thoughts, language, tools, music, 

pictogram, ideogram, symbolic merging (Sumerians), protowriting, rebus principle (the use of existing symbols to represent the sound of a word rather than its literal meaning)
![[Pasted image 20260405150959.png]]
alphabet
language: arranging symbols in specific patterns
3000bce
Egypt: Hieroglyphics, with word signs(1500) sound signs (140)
form changed for time, swiftness of writing.. and reduced to 700
Demotic, 600bce, ease of rapid writing, symbol space reduced to 10% as before, using sound symbols


Mesopotamia, Cuneiform
Sumerian (7000) to Akkadian (600), symbol space reduced by phonetics again

Sainai inscription, sound sign only

Phoenician alphabet (22)
Faster, efficient ways to send info across greater space


Signal and Noise 
Discrete source
capacity is determined by the medium, such as 2 pluck per sec on a wire
Change coding strategy 
![[Pasted image 20260405153014.png]]
![[Pasted image 20260405153053.png]]
maps the most common symbol to 1 pluck
![[Pasted image 20260405153140.png]]
![[Pasted image 20260405153221.png]]
![[Pasted image 20260405153257.png]]
![[Pasted image 20260405153309.png]]


Fire signal: one difference, two states communicated, but it can only account for simple message space
Polybius (200bce), history on communication technology
Aeneas Tacticus used time difference to send message
Democritus, polibius square ( it maps letters to numerical pairs to transform text for, originally, fire-signaling.)
![[Pasted image 20260405154332.png]]
power of multiplication!!!!

![[Pasted image 20260405154508.png]]

Francis Bacon, bilateral cipher
![[Pasted image 20260405154603.png]]

![[Pasted image 20260405154624.png]]
![[Pasted image 20260405154718.png]]
![[Pasted image 20260405154734.png]]
![[Pasted image 20260405154746.png]]

Lord George Murrays Shutter Telegraph + telescope (longer distance)

![[Pasted image 20260405155016.png]]
![[Pasted image 20260405155107.png]]

![[Pasted image 20260405155400.png]]

Using a binary system, the most important question to ask is, what is the minimum number of questions needed to get the message in a situation.
![[Pasted image 20260405155653.png]]

![[Pasted image 20260405155815.png]]
![[Pasted image 20260405155838.png]]
![[Pasted image 20260405155908.png]]
For alphabets, we don't need to ask more than 5 questions
![[Pasted image 20260405160048.png]]
![[Pasted image 20260405160125.png]]
Which is around 4.7

Height of the decision tree = minimum number of questions to transmit an exact message
known as bit (= binary digit)
![[Pasted image 20260405160507.png]]
![[Pasted image 20260405160546.png]]
Bell labs
![[Pasted image 20260405160625.png]]
Information = H 
number of symbols = n
S = how many symbols we can choose each time

Predicatability of our language can save the length of transmission time, more prediction is possible

Above is optical telegraph

then comes the electrical telegraph, using capacitor to store charges and release a larger spark
bubble telegraph using first battery by Volta


![[Pasted image 20260405162609.png]]

Galvanometer,
with permeability, larger magnetic field was possible

Sending alphabets using a line
![[Pasted image 20260405163311.png]]
With slow signal rate, 6 per minute
![[Pasted image 20260405163438.png]]
Letter rate (and cost) is improved by Morse
![[Pasted image 20260405163641.png]]
![[Pasted image 20260405163704.png]]
Interaptions to create meanings!!!
dot
dash = 3 dots
![[Pasted image 20260405163935.png]]
![[Pasted image 20260405163949.png]]
![[Pasted image 20260405164011.png]]
![[Pasted image 20260405164033.png]]
![[Pasted image 20260405164057.png]]
timing is intertwined 
![[Pasted image 20260405164215.png]]
![[Pasted image 20260405164333.png]]
135 ~ letter rate per minute
![[Pasted image 20260405164456.png]]
![[Pasted image 20260405164546.png]]
![[Pasted image 20260405164612.png]]Information is elastic!!!!

![[Pasted image 20260405164931.png]]
![[Pasted image 20260405165001.png]]
![[Pasted image 20260405165101.png]]
![[Pasted image 20260405165125.png]]
the key is translated to DC impulses
now the time is limited by the phyical space between impulses, pulse rate

![[Pasted image 20260405165422.png]]

Symbol rate
signaling events per second

Edison combine low and high battery, reverse current
![[Pasted image 20260405165806.png]]
electrical noise

![[Pasted image 20260405170021.png]]

Only how many possible messages possible matters here

Markov

![[Pasted image 20260405171239.png]]
![[Pasted image 20260405171340.png]]
Shannon
Communication is a mix of randomness and statistical dependencies
![[Pasted image 20260405171750.png]]
![[Pasted image 20260405171935.png]]
![[Pasted image 20260405172055.png]]
![[Pasted image 20260405172114.png]]
![[Pasted image 20260405172134.png]]
![[Pasted image 20260405172416.png]]
concept of entropy!
![[Pasted image 20260405173005.png]]
![[Pasted image 20260405173120.png]]
![[Pasted image 20260405173411.png]]
![[Pasted image 20260405173448.png]]

![[Pasted image 20260413204526.png]]



entropy goes down as the info becomes more predictable
bit is the measurement of information, or the surprise in that information

![[Pasted image 20260405173701.png]]
![[Pasted image 20260405173800.png]]
If predictable, the transmission can be compressed
What is the optimal coding strategy?
![[Pasted image 20260405173915.png]]
![[Pasted image 20260405173940.png]]
![[Pasted image 20260405174045.png]]
anything else will need spacing in between, but with this no space is needed!!!!!

![[Pasted image 20260405174222.png]]
Shannon: Limit of compression is the entropy of the information source
ability to compress increases as entropy decreases
vice versa

Hamming
Bell lab
Computers stored info on punch cards
![[Pasted image 20260405174652.png]]
![[Pasted image 20260405174739.png]]
Using repetition when the chance of corruption presents
A parity bit: a single bit added to the end of a message to indicate 1s in the message is odd or even
error will be detected if the parity doesn't match
More parity bits are needed to detect where the error lies
![[Pasted image 20260405175020.png]]
![[Pasted image 20260405175044.png]]
![[Pasted image 20260405175137.png]]
3 parity bits match 4 data bits
one error bit will render 2 parity bits incorrect, and the intersection is the error, then that error will be flipped automatically
![[Pasted image 20260405175342.png]]
![[Pasted image 20260405175425.png]]

![[Pasted image 20260413205355.png]]


Shannon: We must have redundancy to communicate error free


Intelligent signal
Brenda McCowan
Laurence R Doyle
looking for common trait between human and non-human communication
analyzing long vocal sequences of adults, baby and dolphins
random in babble, then 45 degree in human language
![[Pasted image 20260405180140.png]]
![[Pasted image 20260405180227.png]]
Zipf's law
![[Pasted image 20260405180323.png]]
And same for dolphins!!!!

Deeper structure?
Due to the structure of a language, the freedom of choice decreases, entropy decreases, same for dolphins when looking at longer sound signals
a random info will provide a flat line on this graph

![[Pasted image 20260405180659.png]]The decrease of entropy is essential to transmit knoweledge
regardless of meaning, Claude Shannon's entropy allow us to see common traits of language as cultural trait





ASCII

https://www.ascii-code.com/articles/Beginners-Guide-to-ASCII

>  Before the inception of ASCII, computers were largely custom-built, and each machine had its own unique way of representing text and numbers. This made it incredibly challenging to share information between different computers—it was almost like trying to hold a conversation between people who speak different languages without a translator.

In the 1960s, as computers started becoming more common, this issue became critical. We needed a standardized language that every computer could understand, a kind of 'universal translator' for machines. That's when ASCII was created.

The primary purpose of ASCII was to ensure compatibility across different devices. It provided a common language, assigning unique numbers to various text characters, making it possible for computers to exchange information without misinterpretation. As a result, ASCII played a pivotal role in the early days of the digital revolution, allowing computers to communicate effectively and laying the foundation for many modern technologies we take for granted today.



Comparison

|Feature|ASCII|Unicode|UTF-8|Huffman|
|---|---|---|---|---|
|Type|Encoding|Standard|Encoding|Compression|
|Purpose|Represent text|Define all characters|Store Unicode|Reduce size|
|Length|Fixed|N/A|Variable|Variable|
|Language support|Very limited|Universal|Universal|Any data|
|Frequency-based|❌|❌|❌ (mostly)|✅|
|Decoding|Trivial|N/A|Structured|Requires tree|