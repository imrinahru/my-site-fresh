---
title:
date: 2025-11-16
tags:
  - event
location:
draft: false
summary: |
  Key takeaway in 20 words.
---

## Overview  
**What / When / Where / Who**  

## Key takeaways  
-   
- 

## Slides & media  
- ![Slide thumbnail](./img/slide.png)  
- Recording:

## Related notes  
- 

|     |        |                                                                     |                                                                                  |
| --- | ------ | ------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| 1   | Dave   | Creative code in your video editor (+ if time, blender fill bucket) | [https://www.usebutter.com/](https://www.usebutter.com/)                         |
| 2   | Aaryan | publication design tool (the parts)                                 | [https://feed.a-p.space/](https://feed.a-p.space/)                               |
| 3   | Nehir  | lidar scans                                                         |                                                                                  |
| 4   | Juan   | How are random numbers made?                                        |                                                                                  |
| 5   | Rina   | About p5.riso                                                       | [https://antiboredom.github.io/p5.riso/](https://antiboredom.github.io/p5.riso/) |
| 6   | Alex   | pushup.club and the most overengineered button on the web           | [https://pushup.club](https://pushup.club/)                                      |
| 7   | Luc    | Cargo Poetry - AR Fridge Magnet Poetry                              | [https://cargopoetry.reflektor.digital](https://cargopoetry.reflektor.digital/)  |
https://www.usebutter.com/templates
A really cool project by Aaryan, it seems to have great synergy with both p5.zine and p5.riso.
https://feed.a-p.space/
https://github.com/munusshih/p5.genzine/blob/main/docs/intro/quickstart.md

random() in p5.js 
linear congruential generator
randomGaussian()

https://cargopoetry.reflektor.digital/
[8th wall](https://www.8thwall.com/docs/), AR on the web, from camera feed tells the position of the camera, then map, VPS to specify the location
[cross.stream](https://www.cross.stream/), multiplayer setup, no conflict resolution (for google doc-like use crdt)


Debugging

1. Add debugger in front of the code you want to see
![[Pasted image 20251120125549.png]]

2. ctl+shift+i to bring up developer's tool
3. run the sketch again now that the dev tools are open, it should stop at the debugger statement and show you a copy of the source code in the console
4. Click on downward arrow step in to enter the halftoneImage call
![[Pasted image 20251120130021.png]]

5. once it enters it, you should see the p5.riso source code
6. you can step over each statement (the arc arrow just to the left of the "step in" arrow) which just goes to the next line
7. you could switch from the sources tab to the Console tab (or I think hitting escape also brings up the console while in the Sources tab) and you can write and run some code if you want to print the current state of something

8. the debugger, when you run code, it's like read only
    
9. I don't think it lets you actually change the state of the running code
    
10. so to test out a change you end up updating the source code and rerunnin

![[Pasted image 20251120125504.png]]

![[Pasted image 20251120131620.png]]

![[Pasted image 20251120141413.png]]