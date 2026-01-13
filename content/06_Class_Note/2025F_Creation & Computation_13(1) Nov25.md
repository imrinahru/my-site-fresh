---
course: Creation & Computation
week: Week 13(1)
instructor: Kate Hartman, Nicholas Puckett
tags:
  - class-notes
  - theory
  - practice
  - lecture
  - bluetooth
status: completed
date: 2025-11-25
draft: false
---
# Creation & Computation — Week 13-1 (Nov25)

Below contents almost entirely comes from the class held by Kate Harman and Nicholas Puckett at OCADU.


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

|                 | BLE                                                   | USB (WebSerial)              |
| --------------- | ----------------------------------------------------- | ---------------------------- |
| Connection      | Wireles                                               | Wired                        |
| Range           | ~10-30 m (but pillows, metal wall, bodies can change) | simpler, cable length        |
| Mobile Use      | works on phones                                       | phones don't have usb host   |
| Data format     | structured (characteristics have types)               | text-based(csv/JSON strings) |
| p5.js lbrary    | p5.ble.js                                             | p5.webserial.js              |
| Arduino library | ArduinoBLE                                            | built-in                     |

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
	- chunks of associated data
- Characteristics
	- containers that hold data within service
	- Read or write, like variable, notify
	Both use UUID
- UUID: Universal Unique Identifiers, 
	- like a channel for p5.js


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
## Links & Resources
- https://craphound.com/
- Enshitification, downfall of the Internet
	Make something novel, attract
	Get return, squeeze the users
	Every platform goes through this
- EFF: https://www.eff.org/
