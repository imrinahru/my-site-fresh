---
course: Course Name
week: Week {{week-number}}
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

# Untitled — Week {{week-number}}


## Lecture & Discussion Notes

Don't believe the hype. "Technology is not enough".
Red Burns, ITP

adjacent: ml5: friendly open source

### What is ml?
Teaching a computer to perform a task without explicitly programming an algorithm for that task

Using pretrained models
focusing on models that track and interpret data related to positioning of different points on the body

### ml5
JavaScript library built on top of TensorFlow.js
can be used with any other JavaScript apps
Friendly ml
What data to use?
	Teachable machine
TensorFlow: python/c++
wrapper
Tensorflow.js
wrapper
no memory management etc
![[Pasted image 20251031090644.png]]
Pose estimation
handpose estimation
facemesh

distance of eyes: how far a person is
distance of shoulders: how far a person is

threshold using the location of a body part
statechange calculation

error checking functions in the examples
- how many points are there in one frame: are we getting all the points?
- if statement, is there a person in the video?
- confidence threshold 0~1, let confidenceLevel = 0.2
- for each data point (x, y, confidence)
- points are numbered, always the same, key point indices
- video=createCapture(flipped)
space bar to not show the video
let bodyPointIndex =2

let handpose
function preload
set video
create canvas

https://docs.ml5js.org/#/reference/handpose
also classifier, teachable machine that you can train the neural network

### [handPose.getConnections()](https://docs.ml5js.org/#/reference/handpose?id=handposegetconnections)

This method returns the skeletal connection information between the hand keypoints in array format.

```
const connections;
function setup() {
  ...
  connections = handPose.getConnections();
  ...
}
```

**Returns:**

- **Array**: An array of arrays representing the connections between keypoints.
    
    ```
    [[0, 1], [1, 2], [2, 3], ...[17, 18], [18, 19], [19, 20]];
    ```
    

Please refer to this image to understand the connections:

![[Pasted image 20251031101153.png]]





---

## Practice & Studio Work
- **Exercises / Demos:**  
- **Process Documentation (sketches, images, links):**  
- **Technical Notes (software, materials, tools):**  

---

## Critique & Feedback
- **Instructor Feedback:**  
- **Peer Feedback:**  

---

## Reflection & Connections
- **How does this link theory + practice?**  
- **Personal Insights / Questions:**  


---

## To-Do & Follow-up
- [ ] Reading for next class:  
- [ ] Studio experiment to try:  
- [ ] Concept to develop further:  

---

## Links & Resources
- Related notes:  

---

## Tags
#class-notes #theory #practice
