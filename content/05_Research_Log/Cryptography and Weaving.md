---
title: Cryptography and Weaving
date: 2026-03-30
tags:
  - log
draft: false
---



>  Until modern times, cryptography referred almost exclusively to "encryption", which is the process of converting ordinary information (called [plaintext](https://en.wikipedia.org/wiki/Plaintext "Plaintext")) into an unintelligible form (called [ciphertext](https://en.wikipedia.org/wiki/Ciphertext "Ciphertext")).[[13]](https://en.wikipedia.org/wiki/Cryptography#cite_note-Kahn-1967-13) Decryption is the reverse, in other words, moving from the unintelligible ciphertext back to plaintext. A [cipher](https://en.wikipedia.org/wiki/Cipher "Cipher") (or cypher) is a pair of algorithms that carry out the encryption and the reversing decryption. The detailed operation of a cipher is controlled both by the algorithm and, in each instance, by a "key". The key is a secret (ideally known only to the communicants), usually a string of characters (ideally short so it can be remembered by the user), which is needed to decrypt the ciphertext.

[wikipedia](https://en.wikipedia.org/wiki/Cryptography)


>  There are two main types of cryptosystems: [symmetric](https://en.wikipedia.org/wiki/Symmetric-key_algorithm "Symmetric-key algorithm") and [asymmetric](https://en.wikipedia.org/wiki/Public-key_cryptography "Public-key cryptography"). In symmetric systems, the only ones known until the 1970s, the same secret key encrypts and decrypts a message. Data manipulation in symmetric systems is significantly faster than in asymmetric systems. Asymmetric systems use a "public key" to encrypt a message and a related "private key" to decrypt it. The advantage of asymmetric systems is that the public key can be freely published, allowing parties to establish secure communication without having a shared secret key. In practice, asymmetric systems are used to first exchange a secret key, and then secure communication proceeds via a more efficient symmetric system using that key.[[14]](https://en.wikipedia.org/wiki/Cryptography#cite_note-14) Examples of asymmetric systems include [Diffie–Hellman key exchange](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange "Diffie–Hellman key exchange"), RSA ([Rivest–Shamir–Adleman](https://en.wikipedia.org/wiki/RSA_\(cryptosystem\) "RSA (cryptosystem)")), ECC ([Elliptic Curve Cryptography](https://en.wikipedia.org/wiki/Elliptic_Curve_Cryptography "Elliptic Curve Cryptography")), and [Post-quantum cryptography](https://en.wikipedia.org/wiki/Post-quantum_cryptography "Post-quantum cryptography"). Secure symmetric algorithms include the commonly used AES ([Advanced Encryption Standard](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard "Advanced Encryption Standard")) which replaced the older DES ([Data Encryption Standard](https://en.wikipedia.org/wiki/Data_Encryption_Standard "Data Encryption Standard")).  Insecure symmetric algorithms include children's language tangling schemes such as [Pig Latin](https://en.wikipedia.org/wiki/Pig_Latin "Pig Latin") or other [cant](https://en.wikipedia.org/wiki/Cant_\(language\) "Cant (language)"), and all historical cryptographic schemes, however seriously intended, prior to the invention of the [one-time pad](https://en.wikipedia.org/wiki/One-time_pad "One-time pad") early in the 20th century.


>  AES is based on a design principle known as a [substitution–permutation network](https://en.wikipedia.org/wiki/Substitution%E2%80%93permutation_network "Substitution–permutation network"), and is efficient in both software and hardware.[[11]](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard#cite_note-13) Unlike its predecessor DES, AES does not use a [Feistel network](https://en.wikipedia.org/wiki/Feistel_network "Feistel network"). AES is a variant of Rijndael, with a fixed [block size](https://en.wikipedia.org/wiki/Block_size_\(cryptography\) "Block size (cryptography)") of 128 [bits](https://en.wikipedia.org/wiki/Bit "Bit"), and a [key size](https://en.wikipedia.org/wiki/Key_size "Key size") of 128, 192, or 256 bits. By contrast, Rijndael _per se_ is specified with block and key sizes that may be any multiple of 32 bits, with a minimum of 128 and a maximum of 256 bits. Most AES calculations are done in a particular [finite field](https://en.wikipedia.org/wiki/Finite_field_arithmetic "Finite field arithmetic").
>  
>  AES operates on a 4 × 4 [column-major order](https://en.wikipedia.org/wiki/Column-major_order "Column-major order") array of 16 bytes _b_0, _b_1, ..., _b_15 termed the _state_:[[note 3]](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard#cite_note-14)

wiki 



Plaintext (in binary) -> key (that performs xor) ->ciphertext
where key can only be used once for security
and plaintext length needs to be shorter than key
or multiple plaintexts


Claude Shannon: Secure Cipher Properties
confusion
diffusion
![[Pasted image 20260331131608.png]]
![[Pasted image 20260331131635.png]]
![[Pasted image 20260331131721.png]]
![[Pasted image 20260331131758.png]]
![[Pasted image 20260331131842.png]]
![[Pasted image 20260331131857.png]]
![[Pasted image 20260331132009.png]]
![[Pasted image 20260331132033.png]]
![[Pasted image 20260331132046.png]]
![[Pasted image 20260331132204.png]]
![[Pasted image 20260331132214.png]]
![[Pasted image 20260331132240.png]]
![[Pasted image 20260331132302.png]]
![[Pasted image 20260331132402.png]]
![[Pasted image 20260331132440.png]]
![[Pasted image 20260331132511.png]]
![[Pasted image 20260331132548.png]]

Diffusion:

![[Pasted image 20260331132811.png]]

![[Pasted image 20260331132856.png]]
finite value 256, same as a loom 8
![[Pasted image 20260331133010.png]]
![[Pasted image 20260331133145.png]]
![[Pasted image 20260331134439.png]]

>  ### Cryptography

Traditionally, cryptography concerned the question of how two people who share a key can securely communicate over an insecure channel. This question is related to the existence of pseudo-random generators and one-way functions, and involves deep open questions in computational complexity. Public-key encryption and signatures allow us to do even more things. Recently, we have considered fine-grained questions about ways in which information can remain secret, leading to applications such as secure and efficient computing using an insecure "cloud".

[Theory Group, UofT](https://www.cs.toronto.edu/theory/research.html)


Application to weaving

tie-ups : message

threading: 


treadling: 



### Brainstorm

#### Discrete Systems Built on Binary Logic
Weaving becomes a _material encryption system_: threads as bits, structure as code.

#### Matrix-Based Transformation
**Parallel:**
- AES: State matrix → transformed through SubBytes, ShiftRows, MixColumns
- Weaving: Warp/weft grid → transformed through tie-up logic and treadling sequence
**Art angle:**  
The loom becomes a _matrix processor_, not unlike a cryptographic engine.

#### Rounds vs Repetition
- Iteration creates **emergent complexity**
- Small rule changes → radically different outcomes
**Difference worth exploring:**
- AES aims for _opacity_ (hide structure)
- Weaving often reveals _legibility_ (pattern clarity)
**Art tension:**  
What happens when weaving is pushed toward _cryptographic opacity_?
==The threading/treadling cannot repeat a pattern, and threading on frames cannot repeat a pattern==


> [!NOTE] Title
> What if applied Thue-Morse [[Foldable Words and Thue-Morse]]


#### Permutation and Shift
AES uses:
- ShiftRows (reordering)
- MixColumns (diffusion across structure)
Weaving equivalents:
- Threading shifts → reposition warp threads
- Treadling variations → reorder interlacement sequences
- Twill progression → systematic shifting of pattern


#### Key vs Pattern draft
Draft = _open key_ (traditionally visible)  
But you could imagine:
- Hidden drafts
- Encoded treadling sequences
**Art possibility:**  
A textile whose pattern can only be “decoded” if the draft (key) is known.

==This relates to the copyright of textile discussed by Stitching Worlds==

#### Diffusion and Material Entanglement
- Both distribute local decisions into **global structure**
AES aims for:
- **Diffusion**: spreading information across the entire state
- **Confusion**: making relationships non-obvious
Weaving produces:
- Physical **entanglement of threads**
- Local actions affecting global pattern
**Art angle:**  
Material diffusion vs informational diffusion.



Error Sensitivity
- Are **highly sensitive to small deviations**
- Encode fragility within rigid systems

Time-Based Encoding
AES:

- Sequential rounds over time

Weaving:

- Treadling sequence unfolds temporally
- Pattern emerges line by line

Opacity vs Legibility (Critical Axis)
- Weaving as encryption (hidden patterns)
- AES visualized as textile (making encryption visible)


#### **Substitution vs Interlacement**

| AES                          | Weaving                       |
| ---------------------------- | ----------------------------- |
| Symbolic system              | Material system               |
| Discrete substitution        | Continuous interlacement      |
| Value-based logic            | Relation-based logic          |
| Transformation = replacement | Transformation = entanglement |
AES transforms meaning by **changing symbols**,  
while weaving transforms meaning by **reconfiguring relations in space**.

Topology studies:
- Connectivity
- Continuity
- Relationships independent of exact geometry
More like Blockchain?

AES SubBytes is:
- Explicitly nonlinear (designed mathematically)
==Weaving is:==
- ==**Emergently nonlinear**==
==Where Small changes in:==
- ==Tie-up==
- ==Treadling==
==→ produce disproportionately complex visual outcomes==

AES:
- Exists in an abstract computational space
- Operations are reversible mathematically
weaving interlacement is **material and irreversible**.

AES Model of Information
- Information = symbols
- Transformation = substitution
- Security = obscurity of mapping

Textile Model of Information
- Information = structure
- Transformation = entanglement
- Meaning = emergent from spatial relations


> [!NOTE] Research method
> Textile model of information might only allow a loving, less-adversarial encoding of language
> I can choose to push the practice in an unexpected direction,
> I can also respect the quality of weaving and welcome its limitation



Ideas

1. While AES achieves encryption through nonlinear substitution of discrete values, weaving operates through interlacement, a relational transformation in which elements remain constant but their topological configuration generates complexity. In this sense, textile processes do not encode information symbolically but structurally, producing what can be understood as a form of material or topological encryption.

2. “S-Box Weaving”: Design nonlinear pattern transformations inspired by AES substitution
“While AES encrypts information by abstracting it into unreadable complexity, 8-shaft weaving materializes algorithmic structure into tactile form. By translating cryptographic logic into textile processes, this research explores how opacity, legibility, and transformation operate across digital and material systems.”


3. Try to “decrypt” a textile:
- Can structure be inferred from surface?
- Where does opacity arise?


4. Twill 
> **progresses by a fixed shift rule**
- Each row = previous row + systematic offset
- This offset is often:
    - +1 (right diagonal)
    - -1 (left diagonal)
    - or more complex jumps (on 8 shafts)

So twill is fundamentally:

> A **rule-based permutation repeated over time**

In Advanced Encryption Standard, one of the core steps is:
ShiftRows
- Each row of the matrix is shifted by a different offset
- This:
    - Breaks alignment
    - Distributes information across positions

| Weaving (Twill)               | AES                       |
| ----------------------------- | ------------------------- |
| Row-by-row shift in treadling | ShiftRows operation       |
| Pattern moves diagonally      | Data moves across columns |
| Predictable progression       | Controlled permutation    |
In AES:
- Shifting is used to **destroy visible structure**
- Goal = confusion + diffusion
In Twill:
- Shifting **creates visible structure**
- Goal = pattern emergence (diagonal lines)
> The _same operation_ (shift) produces opposite effects depending on context:

- Encryption → hides structure
- Weaving → reveals structure


> [!NOTE] Title
> So textile is inherently open, 


You can:

- Shift by 2, 3, or irregular sequences
- Combine multiple twills
- Introduce interruptions (like “glitches”)

Example:

+1, +1, +2, -1, +3 ...


> [!NOTE]
> Controlled Legibility Gradient
> 
> - Small shift (e.g., +1) → clear diagonal (readable)
> - Irregular shifts → broken pattern (semi-readable)
> - Complex shifts → visual noise (encrypted)
> You can literally **dial between pattern and encryption**


Instead of:

- Encoding data as color or thread

You encode:

- Data = sequence of shifts

Example:

Message → [1, 3, 2, 1, 4, ...]


> [!NOTE] Title
> So the tie ups can either be plaintext, or key, for decoding


### Informational Diffusion

> The spreading of **symbolic information** across a computational structure through reversible, rule-based transformations.

> Key properties:

- **Abstract** (exists in data, not matter)
- **Symbolic** (bits, bytes, values)
- **Designed for obfuscation**
- **Mathematically reversible** (with the key)
- **Non-local effect**: one input affects the entire output

### Material Diffusion

> The spreading of **structural influence through physical entanglement**, where local interactions between materials propagate across a textile surface.

Key properties:
- **Embodied** (exists in matter)
- **Irreversible in practice**
- **Dependent on physical forces** (tension, friction, elasticity)
- **Spatially distributed**


In AES, diffusion spreads **information across structure**  
In weaving, diffusion spreads **structure across material**

### AES
- Local change → global symbolic impact
- But physically nothing changes

### Weaving
- Local change → global **material reconfiguration**
 The diffusion is:

- Visible
- Tactile
- Structural

### AES
- Diffusion happens in **discrete rounds**
- Time = computational steps

### Weaving
- Diffusion happens during:
    - Threading
    - Tensioning
    - Weaving process itself
It's at human scale 

In cryptography, diffusion ensures that information loses its locality; in weaving, diffusion ensures that structure gains relational depth.



http://www.yoshikoquilt.com/pigpen.html

![[Pasted image 20260331194034.png]]


### Encoding as Meaning Making

Analysis from an anthropological framework

Meaning encoding in a fabric
Women present their weave to male
The singing of Amazonian pattern
Weave turn as poem

[[Weaving Message, Talking Binary]]



Quine

# Toward a true “quine textile”

To fully unify:

You need:

pattern encodes treadling  
pattern encodes tie-up  
pattern encodes threading

AND:

decoded draft → reproduces same textile


Threading forces you to confront this:

> A textile is not just a sequence (like code)  
> It is a **2D constraint system**

So:

- Code = linear
- Textile = spatial

The knitting example is easier because:

- knitting is **sequential**
- stitches happen one after another

👉 closer to programming

A workable compromise (what you can actually build)
### Design:

- Main field:
    - encodes treadling (pattern = code)
- Border:
    - encodes threading (binary or shaft markers)
- Tie-up:
    - fixed and known
fabric → read border → threading
fabric → read field → treadling
→ reconstruct draft

https://www.youtube.com/watch?v=jhXCTbFnK8o
Substitution
permutation
![[Pasted image 20260407225754.png]]