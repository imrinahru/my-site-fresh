---
title: Game of Life
date: 2025-07-07
tags:
  - log
  - research
  - hypothesis
draft: false
---
This is my note on Conway's GOL. It's the simplest rule-based mechanism that mimics life of a colony that genuinely make you feel like something is alive in there.

In thinking about symbiotic human-machine (AI) relationship, I sometimes think about GOL as a simplified testing ground that can simulate human-machine co-living/working. 

A good analogy here is "maintaining a garden", that contains many different forms of lives, some compete with each other, some flourish with each other. And humans are used to be a care giver and give a tiny little helping hand in keeping things alive in the garden. 

What if a machine is also working on our side? How do we want it to behave?

---

# Concept

_“Using the Game of Life to simulate the act of working—a higher-order representation of human effort and emergent complexity.”_

### The Living Ecology

Instead of a static grid, aim for a "Life Ecology." A region that absorbs chaos and continues moving indefinitely.

- **Glider Guns:** The "Data Factory" (continuous motion).
    
- **Puffers:** The "Expansion Colony" (leaves debris/history).
    
- **Still Lifes:** The "Stabilizers" (absorbing noise).
    
- **Oscillators:** The "Heartbeat" (metabolism).
    

---

# Part II: The Engine (Conway’s Rules)

_Quick reference for the 2D cellular automaton logic._

**The 4 Core Rules:**

1. **Underpopulation:** Alive + <2 neighbors = **Dies**.
    
2. **Sustainability:** Alive + 2 or 3 neighbors = **Lives**.
    
3. **Overpopulation:** Alive + >3 neighbors = **Dies**.
    
4. **Reproduction:** Dead + Exactly 3 neighbors = **Born**.
    

### Taxonomy of Behavior

|**Pattern Type**|**Artistic Metaphor**|**Examples**|
|---|---|---|
|**Oscillators**|Metabolism / Heartbeat|Blinker, Pulsar|
|**Spaceships**|Locomotion / Travel|Glider, LWSS|
|**Breeders**|Exponential Growth|Rakes, Switch Engine|
|**Logic Machines**|Cognition / Computation|Universal Turing Machine|
|**Metacells**|"Life within Life"|OTCA Metapixel|

---

# Part III: The AI Brain (LifeNet)

_Designing the "Actor" (FastAPI) and the "Learner" (Python Process)._

### 1. Hybrid Training Strategy

To ensure the AI is interesting from Day 1 but improves over time:

- **Phase 1: Neuro-evolution (Offline):** Use `evolution.py` to "bootstrap" the brain. It evolves through 2,000 generations to find a "good enough" starting state.
    
- **Phase 2: Gradient Descent (Online):** Use `learner.py` to fine-tune the brain in real-time based on actual user interactions.
    

### 2. Choosing the Architecture

|**Model**|**Use Case**|**Verdict**|
|---|---|---|
|**MLP (Multilayer Perceptron)**|Small grids (≤ 64²), mutation-friendly, fast.|**Best for prototypes.**|
|**CNN (Convolutional Net)**|Spatial awareness, detects "gliders" and "edges."|**Best for 128²+ grids.**|
|**GNN (Graph Neural Net)**|Models cell adjacency directly.|**Overkill for GoL.**|

### 3. Novelty Search (The "Curiosity" Factor)

Instead of rewarding the AI for just "keeping cells alive," reward it for **Novelty**:

- **Behavior Descriptor:** A numeric fingerprint of the grid (population + center of mass).
    
- **Novelty Score:** How different the current state is from the "Archive" of seen patterns.
    
- **Formula:** `Total Reward = Novelty_Score + (0.3 * Quality_Score)`
    

---

# Part IV: Technical Implementation Map

### 1. Folder Structure

Plaintext

```
life_ai/
├─ backend/
│  ├─ life.py        # Vectorized Conway logic
│  ├─ model.py       # Neural Net (MLP/CNN) definition
│  ├─ evolution.py   # Offline bootstrap trainer
│  ├─ api.py         # FastAPI (The Actor/Server)
│  └─ learner.py     # Online fine-tuning (The Learner)
└─ frontend/
   ├─ index.html     # p5.js container
   └─ sketch.js      # Visual grid & user interaction
```

### 2. Workflow Commands

|**Step**|**Action**|**Command**|
|---|---|---|
|**1**|Initialize Environment|`python -m venv venv && source venv/bin/activate`|
|**2**|Install Dependencies|`pip install torch numpy fastapi uvicorn pydantic`|
|**3**|Bootstrap Brain|`python backend/evolution.py`|
|**4**|Start Server (Actor)|`uvicorn backend.api:app --reload`|
|**5**|Start Learning|`python backend/learner.py`|

---

# Part V: Design Philosophy & Human Autonomy

_Stepping outside a human-centric view to bridge AI and ALife._

- **The Mirroring Concept:** The AI shouldn't just copy the human. It should provide a "Complementary Move."
    
- **Goal:** Maintain "Liveliness." If the grid becomes static, the "culture" dies.
    
- **User Autonomy:** The AI acts as a "mysterious landscape" or a "supportive tool," but the user's click is the catalyst for change in the ecosystem.
    

### Maintenance & Data Growth

- **`grid_state.npy`:** Constant size (~1KB). Survives reboots.
    
- **`best_model.pt`:** Constant size (~1MB). Hot-swapped by the API when updated.
    
- **`experience.pkl`:** **Warning:** Grows linearly. Cap the RAM queue at 10,000 items to prevent crashes.


# Visualization
### 1. Risograph Print Palette (The Transformation)

Use this color-overprint logic for your physical prints or digital shaders to simulate the Risographic process.

|**Layer Logic**|**C1: Yellow**|**C2: Aqua**|**C3: Purple**|
|---|---|---|---|
|**Simple**|[Yellow, Aqua]|[Aqua, Purple]|[Yellow, Purple]|
|**Complex**|[Yellow, Aqua, Purple]|[Yellow, Purple]|[Aqua, Purple]|

---
The writing is based on my thoughts, numerous back-and-forth search with ChatGPT, Copilot (Github), editing, questioning. It is a preliminary plan that needs to be tested.