---
course: Course Name
week: Week
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

# {{title}} — Week {{week-number}}


## Lecture & Discussion Notes

How do we get devices to talk to each other?
How do we wirelessly share data
radio chips, with combo-units, low wifi amplitude?

Wireless options (Adafruit)
- ble
- cellular
- ir remotes: infra red
- LoRa: long range radio communication
- RF: frequency radio, potential for interference
- RFID/NFC: credit card, retail
- Wifi: using wifi protocol to have devices connect without connecting to outside, for kilometers, how much, how fast (radio wave can only send tiny data)
- XBee/Zigbee or 802.15.14
- ultra-wide band: setting up radio posts and you can check the position

Considerations when you select a wireless protocol (you get to pick!)
- distance
- message size
- speed
- number of devices
	- wifi: 20
- cost (PC have BLE and wifi built in)
- privacy
- network topology
	unidirectional/bidirectional
	broadcast
	permutations
	central device
	star topology
	all-talk-to-all
	mesh-networking
	self-heal even if one node is down

Accessibility
Protocol is too complex
library, tutorial, community

BLE vs. Web Serial
- Both are browser-based communication
- Both need a button to connect
- p5.js compatible
- Bidirectional

|     | BLE                                                   |     |
| --- | ----------------------------------------------------- | --- |
|     | Wireles                                               |     |
|     | ~10-30 m (but pillows, metal wall, bodies can change) |     |
|     |                                                       |     |

Bluetooth
- replaced RS-232 from 1960s
- Bluetooth classic is slower, higher power consumption
- BLE(Bluetooth ) is optimized for low power, connect, no paring required

Distances
- radio needs more power when range gets wider
- BLE is for low range
- 2~5 m

Services and Characteristics
- Services
- Characteristics
	- Read or write, like variable, notify
	- 
- UUID: Universal Unique Identifiers, 
	- like a channel for p5.js
	- 


Libraries
-
-

Central device vs. peripheral device
- Central can only read
- Smartphone can only be central
- Arduino can be either central/periphery
- you can't do phone to phone p5.js (web-based) data sending, since both will be read only

Comparison and Boolean Operators
- www.arduino.cc/reference/tr/#structure

BLE
`BLEByteCharacteristic ledChar("UUID", BLERead | BLENotify)`

Designate property:
- Read
- Write
- Notify
- Combined




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
- https://craphound.com/
- Enshitification, downfall of the Internet
	Make something novel, attract
	Get return, squeeze the users
	Every platform goes through this
- EFF

---

## Tags
#class-notes #theory #practice
