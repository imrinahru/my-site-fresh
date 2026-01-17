---
title:
date:
tags:
  - log
draft: true
---
PWM Fading uses [Pulse Width Modulation](https://www.google.com/search?q=Pulse+Width+Modulation&oq=PWM+Fading&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgIGB4yBwgCEAAY7wUyBwgDEAAY7wUyBwgEEAAY7wUyBwgFEAAY7wUyBwgGEAAY7wXSAQczMDlqMGo3qAIIsAIB8QXQ6igpSqElkA&sourceid=chrome&ie=UTF-8&ved=2ahUKEwjh1LHu5Y2SAxWHMzQIHasDM74QgK4QegQIARAE) to create a gradual dimming or brightening effect (like fading) by rapidly switching a digital output on and off, changing the _[duty cycle](https://www.google.com/search?q=duty+cycle&oq=PWM+Fading&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgIGB4yBwgCEAAY7wUyBwgDEAAY7wUyBwgEEAAY7wUyBwgFEAAY7wUyBwgGEAAY7wXSAQczMDlqMGo3qAIIsAIB8QXQ6igpSqElkA&sourceid=chrome&ie=UTF-8&ved=2ahUKEwjh1LHu5Y2SAxWHMzQIHasDM74QgK4QegQIARAF)_ (on/off ratio) to simulate analog brightness levels.

How it Works

- **[PWM](https://www.google.com/search?q=PWM&oq=PWM+Fading&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgIGB4yBwgCEAAY7wUyBwgDEAAY7wUyBwgEEAAY7wUyBwgFEAAY7wUyBwgGEAAY7wXSAQczMDlqMGo3qAIIsAIB8QXQ6igpSqElkA&sourceid=chrome&ie=UTF-8&ved=2ahUKEwjh1LHu5Y2SAxWHMzQIHasDM74QgK4QegQIAxAB) (Pulse Width Modulation):** Instead of a steady voltage, a digital pin rapidly toggles between HIGH (on) and LOW (off).
- **[Duty Cycle](https://www.google.com/search?q=Duty+Cycle&oq=PWM+Fading&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgIGB4yBwgCEAAY7wUyBwgDEAAY7wUyBwgEEAAY7wUyBwgFEAAY7wUyBwgGEAAY7wXSAQczMDlqMGo3qAIIsAIB8QXQ6igpSqElkA&sourceid=chrome&ie=UTF-8&ved=2ahUKEwjh1LHu5Y2SAxWHMzQIHasDM74QgK4QegQIAxAD):** The percentage of time the signal stays HIGH within one cycle determines the perceived brightness. A 50% duty cycle (e.g., `analogWrite(pin, 127)` on Arduino) means it's on half the time, appearing half as bright.
- **Fading Effect:** A program uses loops to slowly increase (fade in) or decrease (fade out) the duty cycle value over many small steps, creating a smooth transition. 

Common Application (Arduino)

1. **Hardware:** Connect an LED (with a resistor) to a PWM-capable digital pin (marked with a ~ on Arduino boards, like Pin 9).
2. **Code ([analogWrite()](https://www.google.com/search?q=analogWrite%28%29&oq=PWM+Fading&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIICAEQABgIGB4yBwgCEAAY7wUyBwgDEAAY7wUyBwgEEAAY7wUyBwgFEAAY7wUyBwgGEAAY7wXSAQczMDlqMGo3qAIIsAIB8QXQ6igpSqElkA&sourceid=chrome&ie=UTF-8&mstk=AUtExfDzHCifZN7lkh84bwRRoieCunv7Ue-_BOZtS5lpJ5hsz5mfFlXDxpBls7LwRd4klvCegmjWq29Hc8BS2I5jnw6Nq5I3WIC6pNlI-xV99xYqhpaeK6U36DgQAT2KqGtLZeyG49o0dEfNsq33ITXh5BNNXWud0EemZjpK9N75dJ9I7TA&csui=3&ved=2ahUKEwjh1LHu5Y2SAxWHMzQIHasDM74QgK4QegQIBRAC)):** Use `analogWrite(pin, brightnessValue)` where `brightnessValue` goes from 0 to 255.
3. **Loops:**
    - **Fade In:** A `for` loop increases `brightnessValue` from 0 to 255.
    - **Fade Out:** Another `for` loop decreases `brightnessValue` from 255 to 0.
    - **Delay:** A small `delay()` between steps makes the fade smooth rather than instant flickering.

```

// Fade In (0 -> 255)
for (int brightness = 0; brightness <= 255; brightness++) {
  analogWrite(LED_PIN, brightness);
  delay(10); // Small delay
}

// Fade Out (255 -> 0)
for (int brightness = 255; brightness >= 0; brightness--) {
  analogWrite(LED_PIN, brightness);
  delay(10); // Small delay
}

```

Substitute delay for better methods

Delay stops the code during that amount of time, and sometimes we want to continuously running a different function even at the background.

In the code for [[Take digital craft seriously|this]] project, 

