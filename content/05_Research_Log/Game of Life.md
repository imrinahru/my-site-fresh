---
title: 2025-07-07 — Untitled
date: 2025-07-07
tags:
  - log
draft: true
---

The **Game of Life**, created by John Conway, is a zero-player cellular automaton where simple rules can produce complex, lifelike behavior. It operates on a grid of cells that are either **alive** or **dead**, and they evolve over time based on the state of their neighbors.

The **Game of Life** is a cellular automaton on a 2D grid. Each cell is:

- `alive (1)` or `dead (0)`
    
- At each time step (generation), each cell updates according to **4 rules**:
    

|State|Rule (Based on 8 neighbors)|Result|
|---|---|---|
|Alive|< 2 live neighbors → dies (underpop)|Dies|
|Alive|2 or 3 live neighbors → stays alive|Lives|
|Alive|> 3 live neighbors → dies (overpop)|Dies|
|Dead|Exactly 3 live neighbors → becomes alive|Born|



## Patterns That "Feel Alive"

| Type             | Feels like...            | Key Example              |
| ---------------- | ------------------------ | ------------------------ |
| Oscillators      | Metabolism/heartbeat     | Blinker, Pulsar          |
| Spaceships       | Locomotion               | Glider, LWSS             |
| Glider Guns      | Reproduction             | Gosper Glider Gun        |
| Breeders         | Exponential growth       | Rakes, Switch Engine     |
| Self-Replicators | Autopoiesis              | Gemini, Demonoid         |
| Logic Machines   | Cognition or computation | Universal Turing Machine |

#### **Infinite growth and persistence:**

There **are** known structures that grow forever, e.g.:

- **Glider guns**: e.g., Gosper’s glider gun produces endless gliders.
    
- **Breeders / Rakes**: Emit glider guns or puffers over time, which in turn emit gliders.
    
- **Self-replicators**: Like _Gemini_ (by Andrew J. Wade), which rebuilds itself while moving diagonally.
    
- **Puffer trains**: Leave debris behind and continue moving indefinitely.
    

These are **not static**, and **always have movement**, but are **not immune to interference**—if you add random cells, you can disrupt or destroy them.

However, researchers have explored:
- **Life "ecologies"**: Some chaotic infinite patterns stabilize into “organisms” that persist for long periods and interact.
    
- **Debris fields + glider farms**: Large areas where new patterns (even if added randomly) are often “absorbed” or “eaten up” by the system. Not immune, but resilient.

In addition, there are **autopoiesis** or **life-like** behavior. Some examples:

- **Demonoids**: Self-replicating spaceships that can rebuild themselves after part destruction.
    
- **Recursive logic-based constructions**: These simulate computation and can be designed to rebuild themselves if damage is minor and localized.
    
- **Metacells**: Structures made to act like individual cells in a "Life within Life" simulation (e.g., **OTCA metapixel**).

### A **Life ecology**

A **Life ecology** is a _region_ in the Game of Life that:

- **Contains many semi-stable patterns** (oscillators, puffers, gliders, etc.)
    
- **Keeps changing** but doesn't freeze or vanish
    
- Can _absorb or react to new input_ (gliders, noise)
    
- Behaves like a living ecosystem: **organisms emerge**, interact, sometimes die, sometimes persist

To create a **living ecology**, you combine:

|Component|Description|
|---|---|
|**Glider guns**|Emit motion and new data — base of activity|
|**Puffers**|Leave junk trails — build up debris|
|**Still lifes**|Make the region stable and absorb chaos|
|**Oscillators**|Periodically interact with incoming motion|
|**Rakes**|Move while leaving gliders behind|
|**Random noise**|(Optional) triggers unpredictable behavior|

### Design idea

Imagine a world where:

- One part is a **glider factory**
    
- Another part is a **puffer colony** slowly expanding
    
- Random interactions (or added noise) create **new emergent behaviors**
    

These systems aren't truly immune to perturbation, but:

- There is **never a still state**
    
- **Liveliness continues**, even with minor interventions


### p5.js IMPLEMENTATION PLAN

- Set up a 2D grid (`cols x rows`)
    
- Add a **2D array** to store current state
    
- Implement **Game of Life rules**
    
- Place known patterns like **Gosper Glider Gun**
    
- Animate it with `draw()`


[Golly](https://sourceforge.net/projects/golly/)
[Web Golly](https://golly.sourceforge.io/webapp/golly.html)
[Life Lexicon](https://conwaylife.com/ref/lexicon/lex_home.htm)





### Playing Conway Life with AI

- **Human** places a live cell manually whenever they want.
    
- **AI**: Places one live cell **in response**, associates with human’s approach(more on this later) but **diverging slightly** to guide the world toward:
	- Continuity (avoid stagnation/death)
	- Variation (avoid repetition, encourage novel formations)
    
- The **Game of Life** runs continuously (automated ticking).
    
- If the grid becomes static or dies out, **nothing resets** unless the **user chooses to restart**.

```
┌──────────────┐   user clicks    ┌──────────────┐
│ p5.js client │ ───────────────▶ │  FastAPI API │
└──────────────┘                  │   (actor)    │
        ▲                         │              │
        │   JSON grid snapshots   │              │
        │                         │              │
        │                         └──────┬───────┘
        │        enqueue experience      │
        │                                ▼
        │                         ┌──────────────┐
        │   new weights (.pt)     │ Train worker │  (learner)
        └──────────────────────── │ (async proc) │
                                  └──────────────┘

```

- **Actor** – the FastAPI server your players talk to.
    
- **Learner** – a separate Python process that **reads gameplay logs**, improves the model every N seconds, and **drops a fresh `best_model.pt`**.
    
- **Hot swap** – the actor sees a new file, loads it instantly, and continues serving with the upgraded brain.


#### Folder / file map
```
life_ai/
├─ backend/
│  ├─ model.py          # PyTorch network definition
│  ├─ life.py           # Conway rules
│  ├─ evolution.py      # training script ✔
│  ├─ api.py            # FastAPI server ✔
│  └─ grid_state.npy    # saved grid (auto-created)
│  └─ replay.py
│  └─ learner.py
└─ frontend/
   ├─ index.html
   └─ sketch.js         # p5.js code ✔

```


## Set up Python workspace

| Step | Command                                                                       | Why                                       |
| ---- | ----------------------------------------------------------------------------- | ----------------------------------------- |
| 2-1  | `cd life_ai`                                                                  | enter project                             |
| 2-2  | `python -m venv venv`                                                         | isolate dependencies                      |
| 2-3  | `source venv/bin/activate` _(mac/Linux)_  <br>`venv\Scripts\activate` _(Win)_ | activate venv                             |
| 2-4  | `pip install torch numpy fastapi uvicorn pydantic`                            | minimal packages: model, math, API server |

## Add the core code (copy-paste if not already present)

| File                       | Purpose                                                                                                                                                                                     |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **`backend/life.py`**      | vectorised Conway “tick” function                                                                                                                                                           |
| **`backend/model.py`**     | `LifeNet` neural net definition (GRID default = 32)                                                                                                                                         |
| **`backend/evolution.py`** | **offline neuro-evolution trainer** that produces `best_model.pt`<br><br>Replace the **fitness function** with a **novelty + optional quality** function. Maintain a small archive list.    |
| **`backend/api.py`**       | FastAPI server:  <br>• persistent grid  <br>• user → AI move  <br>• background ticker  <br>• hot-swap model loader                                                                          |
| **`backend/replay.py`**    | in-memory → disk logger (experience buffer)                                                                                                                                                 |
| **`backend/learner.py`**   | **online learner**: reads buffer every 60 s, fine-tunes weights, atomic save<br><br>Give each stored experience a _novelty reward_ instead of (or in addition to) the “cells-alive” reward. |

_(All snippets were supplied earlier; paste them verbatim into matching files.)_

##### How we designed the simple replay in `replay.py`

|Element|Implementation choice|Why we picked it|
|---|---|---|
|**RAM queue (`queue.Queue`)**|Limited to 10 000 items|Fast, thread-safe, prevents memory blow-ups.|
|**Background flusher thread**|Dumps the queue to `experience.pkl` every 30 s|Makes disk I/O non-blocking for the actor; file write is atomic enough for small blobs.|
|**Pickle format**|`pickle.dump(list_of_items, file)`|Easiest Python-native serialization for NumPy arrays.|
|**Rotation guard (optional)**|Delete / rename file when it exceeds e.g. 200 MB|Keeps disk usage bounded after months of uptime.|

> **One record** = `{"state": grid_copy, "action": (ax, ay), "reward": 0}`  
> (~4 – 5 KB with a 32 × 32 grid)

The learner later opens the file, **samples** a batch (e.g. 256 random records), computes a reward for each, and runs one gradient step.


##### How we designed the learner script

1. **Reads yesterday’s diary pages** (the `experience.pkl` file).
    
2. **Turns each page into training data**:
    
    - “Here was the grid” → **input** to the network.
        
    - “Here’s the square the AI picked” → **target** the network should rate highly **next time**.
        
    - “How good was that move?” → **weight** telling gradient-descent how strongly to learn from this page.
        
3. Runs one mini-batch of **gradient-descent** (the basic learning step of neural networks).
    
4. Saves the new weights in `best_model.pt`, so the FastAPI server hot-reloads them.
    

Originally “how good” was measured only by **quality** (how many cells were still alive after a few ticks).  
Now we want to **blend in or even replace that with “novelty”**—how different the resulting pattern is from anything we’ve ever seen.

## Front-end scaffold

|File|Purpose|
|---|---|
|**`frontend/index.html`**|loads p5.js & your sketch|
|**`frontend/sketch.js`**|draws grid, polls `/grid`, POSTs `/user_move` on clicks|

Start a static server in that folder:

`npx http-server -c-1 .`

_(`-c-1` disables caching for instant updates.)_

## First offline training pass (bootstrap brain)

|Step|Command|Why|
|---|---|---|
|5-1|`python backend/evolution.py`|evolves 2 000 generations (≈ 15 min on CPU)|
|5-2|Confirm `backend/best_model.pt` exists|required for API startup|

> _Training once gives the system a “good enough” seed so gameplay isn’t random on day 1. Later the learner keeps improving it online._

## Launch the always-on services

|Terminal #|Command|Role|
|---|---|---|
|**1**|`uvicorn backend.api:app --reload`|**Actor** – serves API & life ticker|
|**2**|`python backend/learner.py`|**Learner** – continuous on-line updates|
|_(optional)_|Use **pm2/systemd** instead of bare shells|auto-restart on crashes / reboots|

Hot-swap logic in `api.py` automatically reloads new weights whenever `best_model.pt` timestamp changes (milliseconds, no downtime).

## Open the playground

1. Browse to the address printed by `http-server` (often `http://127.0.0.1:8080`).
    
2. Click any empty cell → your blue cell appears, then AI’s reply, grid immediately ticks forward.
    
3. Leave the page open; watch patterns change as the learner silently improves the model every minute.

## Manual controls

|Action|How|
|---|---|
|Restart from scratch|Browser console → `fetch('http://localhost:8000/restart',{method:'POST'})`|
|Inspect live grid JSON|`GET http://localhost:8000/grid`|
|Change tick speed|Adjust `await asyncio.sleep(0.2)` in `ticker()` (API)|
|Bigger board / smarter AI|Raise `GRID`, `POP`, `GENS` in `model.py` & `evolution.py`; retrain offline|

| Data item                           | Why we keep it                                                           | Typical size (32 × 32 board)          | Growth pattern                        | Easy containment strategy                                                          |
| ----------------------------------- | ------------------------------------------------------------------------ | ------------------------------------- | ------------------------------------- | ---------------------------------------------------------------------------------- |
| **`grid_state.npy`**                | The _current_ Game-of-Life board so the world survives crashes / reboots | 32 × 32 bytes ≈ **1 KB**              | Constant (over-written every tick)    | Nothing to worry about – it never grows.                                           |
| **`best_model.pt`**                 | Latest neural-net weights the actor loads                                | ~60–120 KB for a small MLP            | Over-writes in-place at every save    | Also constant. Keep only the newest file.                                          |
| **Experience log `experience.pkl`** | Raw “state + action” records that the online learner studies             | One record ≈ 4–5 KB (grid + metadata) | **Appends forever** if you do nothing | 1. Cap the in-RAM queue (already `maxsize=10 000`).<br>2. Rotate or trim the file. |
| **Server / learner stdout logs**    | Debugging information                                                    | 1–2 MB per day with default prints    | Linear per day                        | Pipe through `logrotate` or have PM2/systemd rotate logs.                          |

#### About MLP vs. CNN

### MLP
A plain **multilayer perceptron (MLP)** with two hidden layers (256 → 256)
```
grid (32×32 = 1 024 numbers → flatten)
        ↓
Linear layer (1 024 → 256) + ReLU
        ↓
Linear layer (256 → 256)  + ReLU
        ↓
Linear layer (256 → 1 024) + Sigmoid
        ↓
probability for every empty square

```
Total parameters: ≈ 525 k → < 1 MB on disk, < 3 MB RAM.

### CNN

**CNN (Convolutional Neural Network)** has special “filters” (like visual sensors) that scan across the grid to find patterns.

These filters have:

- **Structure**: A specific size (like 3×3) and fixed roles (e.g., edge detector)
    
- **Shared weights**: The same filter is used everywhere
    

👉 This is what makes CNN **great for spatial pattern recognition**, but...

👎 **Harder to evolve**:

- Filters must maintain their **spatial meaning** (e.g., detecting “glider tail”)
    
- Randomly mutating CNN filters often breaks their function
    
- Evolution algorithms must **respect the structure** of the filters and layers, or the network stops working
    

So CNNs are **not as mutation-friendly** unless you use smart evolution methods (e.g., NEAT, genetic CNNs).

| Feature                        | MLP                                | CNN                                        |
| ------------------------------ | ---------------------------------- | ------------------------------------------ |
| 🎲 Easy to evolve randomly     | ✅ Yes (simple weights)             | ❌ No (filters are structured, fragile)     |
| 🎓 Easy to fine-tune with SGD  | ✅ Yes                              | ✅ Yes                                      |
| 🧠 Understand spatial patterns | ❌ Not really (needs more training) | ✅ Yes (designed for it)                    |
| 🌀 Pattern diversity           | ❌ Often collapses to repetition    | ✅ Encourages gliders, chaos, local effects |
| 👨‍🔧 Structural flexibility   | ✅ Any shape, mutate freely         | ❌ Filters must stay well-formed            |
## How it compares to other choices

| Candidate model                                                 | Pros for Conway life                                                                          | Cons in _your_ setting                                                                          | Verdict here                                                    |
| --------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| **Our MLP (baseline)**                                          | ✔ One file, <1 MB  <br>✔ Fast CPU inference (≈ 0.5 ms)  <br>✔ Mutation-friendly (neuro-evo)   | – No built-in notion of “neighbors”  <br>– Parameter count grows **O(N²)** with board size      | _Best for ≤ 64² boards and quick iteration._                    |
| **Convolutional net (CNN)**                                     | ✔ Captures local patterns (blinkers, gliders)  <br>✔ Parameter count ≈ constant vs board size | – Slightly more code  <br>– Online gradient steps need careful LR tuning                        | _Great upgrade if you move to 128² or 256²._                    |
| **Graph neural net (GNN)**                                      | ✔ Naturally models cell adjacency                                                             | – Heavy libraries (PyTorch Geometric)  <br>– Slower per step                                    | _Overkill for a regular grid._                                  |
| **Transformer**                                                 | ✔ Global receptive field, good for large grids                                                | – Millions of params  <br>– Needs GPU for real-time                                             | _Not worth it unless you research scaling laws._                |
| **Tree search / Monte-Carlo (no NN)**                           | ✔ No training, only simulation                                                                | – CPU cost explodes with board size  <br>– No “memory” (doesn’t learn from past)                | _We used brute-force only as fallback._                         |
| **Reinforcement-learning (policy gradient) with CNN back-bone** | ✔ Learning signal tied directly to reward                                                     | – More code (advantages, baselines)  <br>– Susceptible to catastrophic forgetting online        | _Good future step once basics feel solid._                      |
| **Evolution-only, no gradients**                                | ✔ Dead-simple  <br>✔ Embarrassingly parallel                                                  | – Needs many rollouts → CPU hours  <br>– Harder to do tiny incremental updates while users play | _We hybridized: evo for bootstrap, SGD for online fine-tuning._ |

You can combine the benefits:

> Use a **shallow CNN encoder** (2–3 conv layers) to extract spatial features → then flatten and pass to a **small MLP head** to score all grid positions.

This gives:

- 🎯 Spatial awareness (via CNN)
    
- 🧩 Whole-board heatmap output (like MLP)
    
- 🧠 Easier mutation/fine-tuning (because head is MLP)


To build or customize LifeNet, start here:

|Stage|What to study|Free, up-to-date resource|
|---|---|---|
|1 Python & NumPy basics|Arrays, matrix math (you’ll use them in `life.py`)|_Any Python intro_ or **fast.ai Lesson 1 notebooks** [course.fast.ai](https://course.fast.ai/Lessons/lesson1.html?utm_source=chatgpt.com)|
|2 What an MLP is|Neurons → layers → activations (MLP handles whole-board planning)|DataCamp’s guide to **multilayer perceptrons** [datacamp.com](https://www.datacamp.com/tutorial/multilayer-perceptrons-in-machine-learning?utm_source=chatgpt.com)|
|3 What a CNN is|Detect local patterns in images (CNN helps LifeNet "see" human moves)|CNN visual intro by **Victor Zhou** victorzhou.com|
|4 PyTorch fundamentals|Tensors, `nn.Module`, forward pass, loss, optimiser|PyTorch "Learning with Examples" tutorial [docs.pytorch.org](https://docs.pytorch.org/tutorials/beginner/pytorch_with_examples.html?utm_source=chatgpt.com) + Daniel Bourke’s hands-on crash course [youtube.com](https://www.youtube.com/watch?v=LyJtbe__2i0&utm_source=chatgpt.com)|
|5 Building small nets in practice|Combine CNN + MLP layers, use `torch.save`, modular design|DataCamp: “How to learn PyTorch in 2025” [datacamp.com](https://www.datacamp.com/blog/how-to-learn-pytorch?utm_source=chatgpt.com)|
|6 Neural nets + Game of Life|Evolving Life patterns with nets — how AI learns to play Life|Medium article “Evolving Game of Life” [medium.com](https://medium.com/%40tomgrek/evolving-game-of-life-neural-networks-chaos-and-complexity-94b509bc7aa8?utm_source=chatgpt.com)|
|7 Going deeper later|CNNs + transfer learning, convolutional policy heads, evolution loops|**fast.ai Practical Deep Learning for Coders** full course [course.fast.ai](https://course.fast.ai/?utm_source=chatgpt.com)|
### About novelty search

Researchers have shown that **novelty alone can find complex, surprising solutions** even when objective-based search stalls [cs.swarthmore.edu](https://www.cs.swarthmore.edu/~meeden/DevelopmentalRobotics/lehman_ecj11.pdf?utm_source=chatgpt.com)[link.springer.com](https://link.springer.com/chapter/10.1007/978-1-4614-1770-5_3?utm_source=chatgpt.com), and that **MAP-Elites** (a grid of niches) combines novelty with quality to cover behaviour space efficiently [members.loria.fr](https://members.loria.fr/jbmouret/qd.html?utm_source=chatgpt.com)[algorithmafternoon.com](https://algorithmafternoon.com/novelty/map_elites/?utm_source=chatgpt.com).

## Key ideas in learner.py

|Name|Layman’s meaning|Code we need|
|---|---|---|
|**Behaviour descriptor**|A short numeric fingerprint that summarises the pattern after we drop the cell (e.g. “population = 180, centre-of-mass ≈ (10, 15)”).|A small function `descriptor(grid)`|
|**Archive**|A list of all fingerprints we’ve seen so far.|A global `deque` (ring buffer)|
|**Novelty score**|“How far is my fingerprint from the nearest old fingerprints?” (big distance ⇒ novel).|Function `novelty(desc)`|
|**Total reward**|How much to reward this move when updating the net. Could be **novelty only** or **novelty + a bit of quality**.|`total_r = n_r + 0.3 * q_r`|

If you set the weight `0.3` to `0.0` you get **pure novelty** learning.

## Why gradient descent “learns novelty” after this change

- **Higher total_r** ⇒ label at that square is bigger.
    
- Loss = `(pred – label)²`, so the optimiser tries to _raise the prediction_ for that square next time.
    
- Because big labels now come from **novel** outcomes, the network is automatically nudged to choose squares that **lead to unseen patterns**.
    

Tuning knobs

|Want…|Do this|
|---|---|
|**Pure curiosity**|`total_r = n_r` (drop the quality term).|
|**More stability, less randomness**|Increase quality weight: `total_r = n_r + 1.0 * q_r`.|
|**Bigger novelty horizon**|Roll the grid 32 steps instead of 16.|
|**Smaller archive**|`deque(maxlen=500)` – faster, but less historical memory.|
## Where to learn more (beginner-friendly)

1. **10-minute video** “Why Novelty Search beats Objectives” – Joel Lehman (YouTube).
    
2. **Article** “MAP-Elites in 5 minutes” – AlgorithmAfternoon blog (walk-through) [algorithmafternoon.com](https://algorithmafternoon.com/novelty/map_elites/?utm_source=chatgpt.com)
    
3. **Hands-on notebook** – QDax (JAX) examples: novelty, MAP-Elites, POET (GitHub).
    
4. **Survey** “Quality-Diversity algorithms” – Mouret, 2023 (easy PDF).


#### Why we have evolution function and learning function separately
##### The two techniques are complementary

|Aspect|Neuro-evolution (**offline**)|Gradient descent (**online**)|
|---|---|---|
|**Needs labelled data?**|No – scores itself in a sandbox.|Yes – gets “state, action, reward” from replay.|
|**Good at**|Jump-starting from random weights; escaping bad local optima; exploring weird regions.|Fast, incremental polishing; converging smoothly; working with small updates.|
|**Computational style**|Evaluate many networks in parallel, then _copy + mutate_.|Update one network a tiny bit every N seconds.|
|**When it runs**|Before you launch (or during quiet time).|While the app is live, between user clicks.|
|**Risk if used alone**|Takes CPU minutes every time you want the brain to change.|Starts from randomness→ plays terribly until enough data exists.|

By **bootstrapping with evolution** you avoid a helpless first hour.  
By **fine-tuning with online learning** you avoid freezing the interface each time you improve the model.

---

### Analogy

1. **Evolution phase** = _“hire a trainee who already knows the basics”_ (they practised alone in a simulator).
    
2. **Learner phase** = _“on-the-job coaching”_ — the trainee now learns subtleties from real customers without leaving the shop.
    

---

### Could we merge them?

Technically yes, but you’d either:

- **Run evolution continuously** → huge CPU load and noticeable lag, or
    
- **Start with pure gradient descent** → the AI would make random, boring moves until enough history accumulates.
    

Keeping the two files and algorithms separate gives you the best of both worlds with clear, beginner-friendly code boundaries:

- **`evolution.py`** – run once (or occasionally) to create a solid starting model.
    
- **`learner.py`** – keep running forever to make that model steadily smarter in real time.
    

That separation is all about **practicality and smooth user experience**, not about any hard technical limitation.


#### Designing Neural Net 

### How It Works in Simple Terms

## 🎯 Goal

Design a **mirroring function** where the AI:

- 🪞 Observes **where and how** the human placed a cell
    
- 🎨 Places a **complementary** cell, not a copy
    
- 🧬 Helps the game continue evolving, not die or stagnate
    

---

## 🔧 What Does "Mirror" Mean in This Context?

We can think of mirroring as:

- 🔁 **Geometric**: Reflecting or rotating the move (like symmetric play)
    
- 🧠 **Semantic**: Completing or responding to the pattern type (like finishing a glider)
    
- 🧩 **Relational**: Moving near the human cell but with a twist in purpose


### 🟩 **Option C: Learnable Mirror Embedding (LifeNet++)**

✅ Best long-term option  
⛔ Requires training

#### How it works:

- The model learns to generate a **heatmap** over the board
    
- But the **input includes a "mirror hint"** — a vector derived from the human move
    

You can encode the human move in the input in 2 ways:

#### 1. **As a Spatial Mask**:

- Add a 2nd channel (64×64) where only the human cell is marked
    
- The model _learns_ to focus on that area
    

#### 2. **As a Relative Vector**:

- Calculate `(dx, dy)` from human move
    
- Encourage the AI to place **within N units** of that, but not exactly the same
    

#### Training trick:

- During training, label good AI moves that:
    
    - Are **near but not same** as human
        
    - Lead to **stable + novel** future states
        

✅ Good for:

- Long-term strategic behavior
    
- Creative, adaptive mirroring
    
- Generalization to different humans


## A design mock idea

I want to use a simple game to simulate the act of working. The game is a higher-order representation of all kinds of work. The reason why I didn't want to dive into a specific job title is that, I want to spin out varieties of basic design concepts in the first place. Using a simple, abstracted work will likely help me do that more easily.

The important point of validation is how much the design can empower people who would start from scratch, so that in a real world scenario, anyone with a little interest can jump in and start to explore a new domain of work.

The game I have in mind is Conway's Game of Life.

Game of Life is a fascinating example that's reminiscent of the actual world we live in, but on a 2D, simple-ruled, checkboard. It is reminiscent of the world in the sense that, beneath the complexity we see in nature and society, there often lies a set of simple initial rules. But the simple rules can lead to mesmerising phenomena that is hard to grasp at each single instant as a whole.

I chose Game of Life also in the hope of bridging the gap between research in Artificial Intelligence and Artificial Life. Stepping outside from human-centric view of the world, we must admit that there are different forms of intelligence that don't limit to human intelligence which the current AI is modeled after. Even focusing solely on human species, we embody far more qualities than "intelligence". These other qualities and other forms of intelligence are studied in ALife, but not as much in ML and AI related domains. Closing this gap will enable us to envision a broader range of design possibilities alongside current agentic models—ones that may help overcome the challenges of deception, loss of user autonomy, and malicious intent in AI development.

In the interactive Game of Life, the goal for the user is to keep the variety and livelihood on the board regardless of the latest status, by placing a new dot on the board. Similar to the real world in which we face a fast-changing situation, but we (hopefully) freely choose a specific action that will (hopefully) keep the variety and the livelihood of the culture-natures on this finite planet. Sometimes the action is too small to cause anything, but we cannot know the impact for sure, at least at the instant of decision making, since the complexity is multiplied.

There are many ways AI can be added in this world. It can be another agent free of our control or a tool that does whatever we want to achieve; it can be mysterious and free, like part of the natural landscape of the Game of Life, or it can be supportive, clear and empowering. It really depends on the design.

Through this mock design, I want to experiment with different design concept to validate how different design approaches influence the user experience and most importantly, their autonomy. The design process can hopefully be shared soon.

### Today’s questions  
1. …

### Experiments / code  
```python
# paste snippet


### Today’s questions  
1. …

### Experiments / code  
```python
# paste snippet
