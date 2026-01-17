---
title: Pull Up Pull Down
date: 2025-01-15
tags:
  - log
draft: false
---
Personally I struggled the most with the concept of pull up and pull down when I first used Arduino. These 2 diagrams that I draw to myself often help me to make sure that I'm doing what I want to do:
![[InkspaceFile.png]]

- [pullup/down](https://www.kobakant.at/DIY/?p=838)

>  You need a pull-up or pull-down resister when you want to read a contact switch or button (i.e. push button). If you have pull-up resister, you will see 0V(LOW) when you push the button. If you have pull-down resister, you will see 5V(HIGH) when you push the button on your digital pin reading.

- simply set internal pull-up resistors using a single line of code!
- Atmel chips that Arduino uses have internal resistors that can be toggled on or off for every digital and analog input pin (except A6 and A7 on some boards)
	- **Examples of Atmel Chips:**
	- **[ATmega328P](https://www.google.com/search?q=ATmega328P&oq=what+is+atmel+chip&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQABjvBTIHCAIQABjvBTIHCAMQABjvBTIHCAQQABjvBdIBCDk5MDhqMGo3qAIIsAIB8QWkriDNV5zWeg&sourceid=chrome&ie=UTF-8&mstk=AUtExfA9c7NlYQiEQ3RnKiWCVzZYjrDR6zGC2yWhtiOHxtHmeUS0-qfHKmMLr_HEI6DYxHNF0RKOJAWPxed7skkV0QLxVKtD_2Yi8RXLoIaJK5wmsMZFe5Pr3-CQehcyk8R5GIGi7twFUmaFUQUekDm3DV_iZHoNER63D5JAAzLPLG4kfu1h0LVpevxV7rlk5ACyG_RA-epiv9p3LkVHFVfbMPQYhSkgvFKER3tTlwpTxnpH1bWYVFnjBSHmqMlsGQCjvSY9WFo0Q00uQzAF_W1a9w2u-89B3Gym--rBQBLo6GwqVA&csui=3&ved=2ahUKEwjFlMGD242SAxWCCTQIHZYFJi4QgK4QegQIBRAB):** The heart of the Arduino Uno, known for 8-bit processing and low power (picoPower).
	- **ATmega88/168:** Other popular 8-bit AVRs with varying memory sizes.
	- **ARM-based:** Atmel also produced 32-bit ARM Cortex-M microcontrollers.
- **Digital**  
For setting the internal pull-up resistors for digital input pins, the code will look like the following:  
_pinMode(2, INPUT);  
digitalWrite(2, HIGH); // turn on internal pullup resistor for digital pin 2_  
*NEW*: _pinMode(2, INPUT_PULLUP);_
![[Pasted image 20260115090834.png]]

https://medium.com/free-code-camp/a-simple-explanation-of-pull-down-and-pull-up-resistors-660b308f116a
![[Pasted image 20260115092331.png]]
- General Purpose Input Output ([GPIO](https://en.wikipedia.org/wiki/General-purpose_input/output))
>  There is also electromagnetic frequencies in the air that could draw your GPIO to `0` or `1`. It could even fluctuate between the two! This way, we can’t be positive it’s a `0` (I’m so bad at puns). This is also known as a logical `0`.
- pull-down resistors
- GPIO will now register a `1` when the button is pressed.
- Since electricity flows to the least resist path
![[Pasted image 20260115092221.png]]
- pull-up resistors
- While the button is not pressed, the GPIO will register a `1`. When you pressed the button, the GPIO will be `0`.
- Since electricity wants to got o ground
![[Pasted image 20260115092210.png]]

