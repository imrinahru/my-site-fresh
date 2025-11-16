---
title: 2025-10-25 — Hydra
date: 2025-10-25
tags:
  - event
location:
draft: true
summary: |
  Key takeaway in 20 words.
---

## Overview  
**What / When / Where / Who**  

## Key takeaways

History: inspired by analog video synthesis, taking input and jam

Ctl+shift+s

osc()
out(): renders to the screen
. is chaining the 2 together

(holds variables)

to run: ctl shift enter multiple blocks

Alt enter a block

chain commands 
. is like a pipe, direct connector
If wanting to use a source, need src()to be followed by .

For sound,
if you want to pick sound from the pc,
1. Windows 
- [https://vb-audio.com/Cable/](https://vb-audio.com/Cable/)
- use above as input
- another app to play through: OBS

a.fft[] takes the wave form to 
()=>a.fft[], with arrow function

https://imgbb.com/upload

ctl shift H
ctl shift + - scale


[Access](https://hydra.ojack.xyz/?code=JTJGJTJGJTIwbGljZW5zZWQlMjB3aXRoJTIwQ0MlMjBCWS1OQy1TQSUyMDQuMCUyMGh0dHBzJTNBJTJGJTJGY3JlYXRpdmVjb21tb25zLm9yZyUyRmxpY2Vuc2VzJTJGYnktbmMtc2ElMkY0LjAlMkYlMEElMkYlMkYlMjBGbG9yJTIwZGUlMjBGdWVnbyUwQXNoYXBlKDIwMCUyQyUyMDAuNSUyQyUyMDEuOTIpJTBBJTA5LnNjYWxlKDAuNjA3JTJDJTIwMC4wNTgpJTBBJTA5LmNvbG9yKCU1QjAuNSUyQyUyMDQlNUQuc21vb3RoKDEpJTJDJTIwMC4yMyUyQyUyMDAuMDAxKSUwQSUwOS5yZXBlYXQoMy4wNTUlMkMlMjAyKSUwQSUwOS5tb2R1bGF0ZVNjYWxlKG9zYygwLjI1MyUyQyUyMDAuNSklMkMlMjAtMC40NTcpJTBBJTA5LmFkZChvMCUyQyUyMDAuNSklMEElMDkuc2NhbGUoMC45KSUwQSUwOS5vdXQoKSUzQiUwQSUwQW9zYygyMCUyQyUyMDAuMSUyQyUyMDAuOCkub3V0KCklMEElMEFzMC5pbml0Q2FtKCklMjAlMkYlMkYlMjBpbml0aWFsaXplJTIwYSUyMHdlYmNhbSUyMGluJTIwc291cmNlJTIwYnVmZmVyJTIwczAlMEFzcmMoczApLm91dCgpJTIwJTJGJTJGJTIwcmVuZGVyJTIwc291cmNlJTIwYnVmZmVyJTIwczAlMEElMEFzMC5pbml0Q2FtKCklMjAlMkYlMkYlMjBpbml0aWFsaXplJTIwYSUyMHdlYmNhbSUyMGluJTIwc291cmNlJTIwYnVmZmVyJTIwczAlMEFzcmMoczApLmthbGVpZCg0KS5vdXQoKSUyMCUyRiUyRiUyMHJlbmRlciUyMHRoZSUyMHdlYmNhbSUyMHRvJTIwYSUyMGthbGVpZG9zY29wZSUwQSUwQWEuc2hvdygpJTNCJTBBYS5zZXRCaW5zKDQpJTNCJTBBJTBBc2hhcGUoJTIwMyUyMCklMEEucm90YXRlKCUwQSUwQSUyMCUyMCgpJTIwJTNEJTNFJTIwTWF0aC5QSSUyMColMjBtb3VzZS54JTIwJTJGJTIwMTgwJTBBJTBBKSUwQS5yZXBlYXRYKCUyMDMlMjApJTBBLnJlcGVhdFkoJTIwMyUyMCklMEEuc2NhbGUoJTBBJTBBJTIwJTIwKCklMjAlM0QlM0UlMjBhLmZmdCU1QjAlNUQqNCUwQSUwQSklMEEub3V0KCUyMG8wJTIwKSUzQiUwQSUwQXJlbmRlcihvMCklM0I%3D)
## Variables & Functions

|name|description|example|
|:--|:--|:--|
|bpm|change bpm of hydra cycles|`bpm( 120 );`|
|Math.abs|keep values position|`Math.abs(-1) // returns 1`|
|Math.random|creates a random float between 0 and 1|`Math.random()*2`|
|Math.sin|sin wave for more fluid animation|`Math.sin(value)`|
|mouse.x|x position of mouse|`mouse.x / window.innerWidth * 100`|
|mouse.y|y position of mouse|`mouse.y / window.innerHeight * 100`|
|time|elapse time in milliseconds|`() => Math.sin(time)`|
|window.innerWidth|width of window||
|window.innerHeight|height of window||
|screencap|eval this function to save an image of your hydra sketch|`screencap();`|

## Slides & media  
- ![Slide thumbnail](./img/slide.png)  
- Recording: <https://youtu.be/…>  

## Related links 
- https://hydra.ojack.xyz/api/
- https://github.com/hydra-synth/hydra#using-p5js-with-hydra
- https://hydra-book.glitches.me/#/
- https://github.com/zachkrall/hydra-examples/tree/master/examples
- https://hydra.ojack.xyz/garden/



