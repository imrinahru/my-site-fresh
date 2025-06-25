---
title: 2025-06-20 — LF AI & Data Japan RUG Meetup
date: 2025-06-20
tags:
  - event
  - linux
location: Fujitsu Yokohama Hub
draft: false
summary: Amid fast-moving developments in AI, this meetup provided a timely assessment of open-source infrastructure—linking broad trends to tangible implementation paths.
---

## Why this meetup mattered

Japan’s second **Regional User Group** (RUG) brought the global Linux Foundation AI community to Tokyo just as AI hits a turning point with the rise of DeepSeek: it made everyone think, including OpenAI, that we may need a new open-source strategy. Speakers from LF AI & Data and Japanese contributors mapped out what must happen next if we want _AI as a commons_.

## Summary

| Time  | Talk                                                       | Core message                                                                                                                                                                  |
| ----- | ---------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 15:10 | **LF AI & Data Update** – Todd Moore                       | 80 LF-hosted projects now cover models → data → infra. New _Model-Openness Tool v2_ lets anyone grade model transparency.                                                     |
| 15:40 | **Beyond Training: to the AI-Native World** – Mark Collier | You can’t separate AI from infrastructure. _OpenStack & Kubernetes_ showed how open infra beats monopolies; the same must happen for LLMs, inference engines, and **agents**. |
| 16:20 | **Hands-on with LF AI projects** – Tetsu Itō               | A summary of recent LF AI&Data projects. _vLLM_ is attracting a new level of attention.                                                                                       |
| 16:50 | **Multi-Agent OSS Outlook** – Kōsaku Kimura                | Hands-on introduction on emerging _agent standards_: _MCP (Model Context Protocol)_ and _A2A (Agent-to-Agent)_.                                                               |

## Speaker


- [Todd Moore](https://www.linkedin.com/in/todd-moore-7985402b/) (LF AI & Data Foundation, Executive Director)
	
- [Mark Collier](https://www.linkedin.com/in/markcollier/) (GM of AI and Infrastructure, The Linux Foundation. Before: COO of OpenStack Foundation)
	
- Tetsu Itō (日立製作所　研究開発グループ)
	
- [Kōsaku Kimura](https://www.linkedin.com/in/kimusaku/) (富士通株式会社　富士通研究所　人口知能研究所　AI革新プラットフォームCPJ　シニアリサーチマネージャー)


---

## Extended insights


### Now is the time to think about open-source AI

Rise of DeepSeek provides a point of reflection as to the necessity of a new open-source strategy. Time and again, the open-source ecosystem has proven its strength.

We've seen an expansion of open-source around the world: 70 to 90% build with free and open-source software; only 10 to 30% write custom code (LISH, Laboratory for Innovation Science at Harvard).

Proprietary APIs aren’t going away, but history shows open ecosystems eat closed ones in the long run. On evals (Artificial Analysis Intelligence Index), open-source AI has largely caught up to closed AI as of June 2025.

_The more open, the better._




### Why open-source matters?

- Proprietary systems are creating silos and friction, open models are accessible alternatives.
	
- Users are demanding explainable, auditable, and safe AI, especially healthcare, finance, government.
	
- Open-source ecosystems like PyTorch, Hugging Face are the source of innovation.
	
- The EU AI Act, US Executive Orders, GPAI Commitments are creating legal shift.




### What Linux Foundation has brought to the table

- 2 Ecosystems for open-source AI: LFAI&Data and PyTorch
	

_PyTorch_ has surpassed _TensorFlow_ as a strong ecosystem. Its core library is a starting point, now the landscape includes both foundation hosted (Core, Platform, Verticals) and self-hosted (PyTorch Ecosystem) to provide the breadth it needs beyond its core library. It thus allows multiple ways of involvement and contribution from the community.

_LFAI&Data Foundation_ is formed with emphasis on data. Model (or weights) is only tip of the iceberg: training data and infrastructure behind them are just as important, if not more. The importance of infrastructure is underscored by having Mark Collier as the new GM of this foundation, more on this [[#OpenInfra joins Linux Foundation]].

- Generative AI Commons as a neutral home, communication space for all. Some of the major contributions are summarized below

| Work-stream                            | What it delivers                                                                                                                                                                                                                              | Flagship projects / tools                                                                                                                                                                                                                                           |
| -------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Models · Applications · Data (MAD)** | Publishes end-to-end, fully reproducible model releases (weights + code + data recipes); curates open datasets; maintains reference stacks built on _vLLM ([[#Second pillar Inference]]), DeepSpeed, Ray, ONNX ([[#First pillar Training]])_. | _Open Model Initiative (OMI)_ – a catalogue of “Class A” models released under the permissive _OpenMDW ([[#What you can try from today]]) licence_, each with training pipeline, evaluation suite, and deployment artefacts.                                        |
| **Responsible AI**                     | Supplies the policy, safety, licensing and evaluation layer for all Commons releases.                                                                                                                                                         | _Model Openness Framework (MOF) & Model Openness Tool v2 (MOT)_ – 17-point openness rubric and web/CLI scorer at _isitopen.ai_. ([[#What you can try from today]])<br>_Responsible GenAI Framework (RGAF)_ – nine-dimension guidance on bias, privacy, energy, etc. |
| **Education & Outreach**               | Develops free curricula, boot-camps and certifications; organises Regional User Groups (e.g. Japan RUG) and publishes translation/localisation kits.                                                                                          | GenAI Commons courseware, Community RUG playbook, monthly newcomers call.                                                                                                                                                                                           |


---

### OpenInfra joins Linux Foundation


This June, the non-profit OpenInfra Foundation (home of OpenStack, Kubernetes Helm charts, Kata Containers, and more) has merged into the Linux Foundation.  

Mark Collier, cofounder of OpenStack 15 years ago, now GM of AI & Infrastructure at LF, framed it well: 

> "Linux stopped an OS monopoly, OpenStack curbed cloud lock-in; our next job is to keep AI open.”




### Importance of infrastructure in AI landscape

Large-language models aren’t just maths, they’re factories that shovel petabytes of text through clusters of GPUs and TPUs. Token counts and inference calls are growing **50×** year-over-year (Pichai, Google).

If AI infrastructure stays proprietary, control will condense around a few giants—the very monopoly that OpenStack and Kubernetes were created to stop in cloud computing.




### The “AI-native” era: code written by code

Many companies, including Microsoft, Google, and Meta, have said that around 30% of the code used in their products is—or soon will be—generated by AI. It is a wild adoption in such a short period of time. A massive shift in how software is written. 

Moreover, smaller companies are not only embracing AI faster, but also adopting OSAI more rapidly than larger businesses. 




### AI-native computing 

What is _AI-native computing_? Mark Collier explained that:

> AI-Native Computing does for the Intelligence Era what cloud-native did for the cloud era: it re-imagines the entire compute stack so that learning models—not static code—sit at the very center of design, economics, and operations.

The interesting point is a drastic shift in how we develop things, learning models the basic nodes woven into the fabric of ICT. He added that, the concept is still only a rough idea, that we need to shape and refine a clear definition together.


---

### The pillars of AI-native computing: training, inference, and agent


#### First pillar: Training

Methods keep changing, but the idea stays the same: Feed data in → adjusts the algorithm's parameters → output a model that can make predictions (methods include full pre-training, fine-tuning, reinforcement learning, etc.).

**10 Critical OSS tools**

| Tool                           | What it contributes                                                                                                                                                                                                                                  |
| ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **PyTorch**                    | The main engine for writing, training, and running neural-network models. ( [https://github.com/pytorch/pytorch](https://github.com/pytorch/pytorch) )                                                                                               |
| **Hugging Face Transformers**  | A giant shelf of ready-made language and vision models you can fine-tune in minutes. ( [https://github.com/huggingface/transformers](https://github.com/huggingface/transformers) )                                                                  |
| **PyTorch Lightning**          | Layer that strips boilerplate from training loops and enforces best-practice logging. Adds tidy scaffolding around PyTorch so you focus on what to train. ( [https://github.com/Lightning-AI/lightning](https://github.com/Lightning-AI/lightning) ) |
| **DeepSpeed**                  | Fits huge models onto limited hardware using tricks like ZeRO and LoRA, making one GPU act like many. ( [https://github.com/microsoft/DeepSpeed](https://github.com/microsoft/DeepSpeed) )                                                           |
| **Ray (Tune / Train)**         | Lets you spread PyTorch jobs across lots of machines with just a couple of extra lines. ( [https://github.com/ray-project/ray](https://github.com/ray-project/ray) )                                                                                 |
| **MLflow**                     | Keeps a record of every experiment—code version, data slice, metrics, and final model file—in one place. ( [https://github.com/mlflow/mlflow](https://github.com/mlflow/mlflow) )                                                                    |
| **scikit-learn**               | Classic toolkit for quick tabular models, data splits, feature engineering, and evaluation metrics. ( [https://github.com/scikit-learn/scikit-learn](https://github.com/scikit-learn/scikit-learn) )                                                 |
| **ONNX**                       | A universal file format that lets models trained in PyTorch run on mobile, browser, or other clouds. ( [https://github.com/onnx/onnx](https://github.com/onnx/onnx) )                                                                                |
| **DVC (Data Version Control)** | Gives data files and model checkpoints “Git-style” tracking so you can reproduce or roll back any run. ( [https://github.com/iterative/dvc](https://github.com/iterative/dvc) )                                                                      |
| **Kubeflow Pipelines**         | A workflow tool on Kubernetes that chains data-prep → training → evaluation → deployment the same way every time. ( [https://github.com/kubeflow/pipelines](https://github.com/kubeflow/pipelines) )                                                 |

**Key takeaways:** 

Stack is coming together, winners immerged. 

- PyTorch is the de facto standard.
	
- Transformer is ubiquitous and standardizing on PyTorch.
	
- ONNX is critical as an interchangeable format.
	
- MLflow manages workflows.

---
#### Second pillar: Inference

Simple definition: Load a trained model → send it real-time requests → return predictions. It runs anywhere, from tiny edge chips to GPU data centers, often with specialized hardware or software for speed and efficiency.

Inference matters as it "is the biggest workload in human history," 50 times larger than training. [source](https://cloudnativenow.com/techstrong-council/the-final-workload/)

> Inference is constant. Every search query, voice prompt and AI-generated draft runs through an inference engine. It’s the business end of AI. The workload we’ll all have to run, every day, everywhere.

It deeply relates to AI-native computing, and that's why Mark Collier calls it "[the final workload.](https://cloudnativenow.com/techstrong-council/the-final-workload/)" 

> Not because it’s the last thing we’ll ever invent. But because it changes the very nature of what we build. Inference systems are beginning to improve themselves. We’re on the cusp of software that writes its own prompts, adjusts its own weights, orchestrates its own deployments.


**10 Critical OSS tools**

| Tool                                             | What it contributes                                                                                                                                                                                                                                                                                                                                             |
| ------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **ONNX Runtime**                                 | Lets the same AI model run fast on almost any computer chip—Intel, AMD, Nvidia, even a laptop CPU—without rewriting code. ( [https://github.com/microsoft/onnxruntime](https://github.com/microsoft/onnxruntime) )                                                                                                                                              |
| **vLLM**                                         | Supplies the raw horsepower—turning input text into output text quickly and efficiently—on which any chat application can be built. It squeezes more answers per second from big language models, whether on one graphics card or many. ( [https://github.com/vllm-project/vllm](https://github.com/vllm-project/vllm) )                                        |
| **NVIDIA Triton Inference Server**               | If you already use Nvidia GPUs, this server feeds them AI requests in neat batches so they stay busy and responses stay quick. ( [https://github.com/triton-inference-server/server](https://github.com/triton-inference-server/server) )                                                                                                                       |
| **Hugging Face Text-Generation Inference (TGI)** | TGI lets you host free or permissively licensed language models and interact with them through the same kind of developer interface people use for ChatGPT—without paying per-token fees or handing your data to a third-party provider. [https://github.com/huggingface/text-generation-inference](https://github.com/huggingface/text-generation-inference) ) |
| **TorchServe**                                   | The “official” way to turn a PyTorch model into a live web service—handles versioning, auto-batching, and health checks for you. ( [https://github.com/pytorch/serve](https://github.com/pytorch/serve) )                                                                                                                                                       |
| **KServe**                                       | A plug-in for Kubernetes that spins models up or down on demand, even to zero, saving money when nobody is asking questions. ( [https://github.com/kserve/kserve](https://github.com/kserve/kserve) )                                                                                                                                                           |
| **Ray Serve**                                    | A Python-friendly system for turning AI code into micro-services that can scale across many machines with just a few lines of code. ( [https://docs.ray.io/en/latest/serve](https://docs.ray.io/en/latest/serve) )                                                                                                                                              |
| **BentoML**                                      | Packages any model (Python, R, whatever) into a neat “bento box” you can ship as a Docker image or run in the cloud with one command. ( [https://docs.bentoml.com](https://docs.bentoml.com/) )                                                                                                                                                                 |
| **OpenVINO**                                     | Intel’s toolkit that shrinks models so they run faster on regular CPUs or small edge devices—handy when you don’t have a fancy GPU. ( [https://docs.openvino.ai](https://docs.openvino.ai/) )                                                                                                                                                                   |
| **TensorFlow Serving**                           | A proven workhorse for companies already using TensorFlow; serves models over the web with built-in version control and high throughput. ( [https://github.com/tensorflow/serving](https://github.com/tensorflow/serving) )                                                                                                                                     |
| **llm-d**                                        | The objective of llm-d is to create a well-lit path for anyone to adopt the leading distributed inference optimizations _within their existing deployment framework_ - Kubernetes. ( [https://github.com/llm-d/llm-d](https://github.com/llm-d/llm-d) )                                                                                                         |

Distributed architecture is a way to go for maximum efficiency. A rising star is llm-d, Kubernetes distributed inference at scale. 

**Key takeaways:** 

The stack is messy, the pieces are changing rapidly. 

- vLLM is emerging as one key component, and llm-d looks promising to scale out.
	
- There's no real community of operators solving this together—big gap & opportunity

Messy is good—that’s how open-source communities have built every breakthrough in tech so far. A huge shift is expected.


---

#### Third pillar: Agent

Wrap a model in code that can call tools, talk to other agents or humans, and turn inference results into actions via open protocols (e.g., MCP), so that any system can programmatically use the model's output.

**10 Critical OSS tools**

| Tool                             | What it contributes                                                                                                                                                                                                                                                             |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **LangChain + LangGraph**        | Helps you string many AI actions together (search → think → answer) like steps in a recipe. ( [https://github.com/langchain-ai/langchain](https://github.com/langchain-ai/langchain) , [https://github.com/langchain-ai/langgraph](https://github.com/langchain-ai/langgraph) ) |
| **AutoGen**                      | Lets several chatbots talk to each other (and to you) at the same time so they can finish tasks faster. ( [https://github.com/microsoft/autogen](https://github.com/microsoft/autogen) )                                                                                        |
| **CrewAI**                       | A light kit for giving each chatbot a “job title” (Writer, Checker, Researcher) so they cooperate without chaos. ( [https://github.com/joaomdmoura/crewai](https://github.com/joaomdmoura/crewai) )                                                                             |
| **Semantic Kernel**              | Microsoft’s toolbox for big companies: lets you list “skills” (send email, query database) that an AI can plan and call. ( [https://github.com/microsoft/semantic-kernel](https://github.com/microsoft/semantic-kernel) )                                                       |
| **LlamaIndex Agents**            | Adds memory so an AI can look up your own documents before answering—handy for company wikis or PDFs. ( [https://github.com/run-llama/llama_index](https://github.com/run-llama/llama_index) )                                                                                  |
| **Agent Protocol**               | A common envelope format so any agent can ask, “Here’s a task—who can do it?” ( [https://agentprotocol.ai/](https://agentprotocol.ai/) )                                                                                                                                        |
| **A2A Protocol**                 | Google’s open recipe for secure agent-to-agent chatting; each agent publishes an “AgentCard” like a business card. ( [https://github.com/google-a2a/A2A?tab=readme-ov-file](https://github.com/google-a2a/A2A?tab=readme-ov-file) )                                             |
| **MCP (Model Context Protocol)** | Anthropic’s “USB-C for AI tools” — one universal way for an agent to call a calculator, database, or other tool. ( [https://modelcontextprotocol.io/introduction](https://modelcontextprotocol.io/introduction) )                                                               |
| **SuperAGI**                     | A dashboard that shows which agents are running, their logs, and lets you run many tasks at once. ( [https://github.com/TransformerOptimus/SuperAGI](https://github.com/TransformerOptimus/SuperAGI) )                                                                          |
| **Chroma**                       | A speedy “memory shelf” where agents can store and search ideas as math vectors instead of plain text. ( [https://github.com/chroma-core/chroma](https://github.com/chroma-core/chroma) )                                                                                       |

With [[#AI-native computing]] becoming the standard and AI models at the core of design, composite AI is a key concept to develop.

_Composite AI_ refers to systems where multiple specialized agents collaborate, vote on outcomes, or pass tasks along a chain—for example, one agent might check inventory, another price products, and a third draft a customer email. To make such coordination work at scale, we need shared standards that let agents communicate and cooperate seamlessly.

- Without such standards, every agent ecosystem risks becoming a custom-built tangle that's hard to scale or maintain.
    
- Two emerging protocols address this: **MCP** (Model Context Protocol, by Anthropic), often described as a “USB-C” for tool calls, and **A2A** (Agent-to-Agent, by Google), which enables discovery via structured **AgentCards**.
    
- These protocols make it possible for open-source agents—like those built with LangChain or LlamaIndex—to plug into larger workflows.
    
- This opens the door to **agentic automation** across every area of ICT: from optimizing supply chains and reviewing code, to handling multi-step incidents in real time.

**Key takeaways:**

Agents are next—and they need standards now:

LLM “agents” call tools, write code, and plan tasks. Right now no one knows what agents are going to do. They will only work at scale if we agree on open connectors (MCP, A2A) now—just like we did for containers and cloud.


---

### So how to promote open-source AI? Code and weights are not enough

You’ve developed an AI model or built a useful software tool and published it online—an important first step. However, simply releasing code or model files as “open-source” is rarely enough to drive meaningful adoption or community growth.

A successful open-source ecosystem requires more than just public access.  
Below is a clear, non-technical checklist outlining what encourages people to use, contribute to, and trust an open-source project.

#### 1. Clear Rules and Shared Standards

**(Think: house rules before a pot-luck.)**

| Why it matters                                                               | What it looks like                                                                                                  |
| ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Neutral ownership** – no single company can yank the project away.         | A non-profit or foundation holds the trademark and voting rights.                                                   |
| **Interoperability** – your project plugs into others without duct tape.     | You follow common specs (like USB for hardware or, in AI, standards such as MCP and A2A for agents).                |
| **Predictable releases** – businesses need to know updates won’t break them. | A public calendar: “minor updates monthly, big upgrades every six months.”                                          |
| **Maturity ladder** – outsiders see you’re built to last.                    | Tags like _Sandbox → Incubation → Graduated_ that signal stability, just as kids move from kindergarten to college. |



#### 2. People, Not Just Pull Requests

**(Think: welcoming committee at the community garden.)**

| Make it friendly                         | Why newbies stay                                               |
| ---------------------------------------- | -------------------------------------------------------------- |
| **Contributor guide** in normal English. | Tells first-timers exactly how to submit a change.             |
| **Quick “good first issues.”**           | Low-risk tasks so new folks feel useful on day one.            |
| **Positive feedback loops.**             | Shout-outs, badges, or a “Hall of Fame” page keep energy high. |

And don’t underestimate storytelling:

_Blog posts, short videos, or live demos often convince more users than a stack of technical docs._



#### 3. Measure the Ecosystem’s Health

**(Think: regular check-ups, not guesswork.)**

- Diversity of contributors – Are fixes coming from five people or fifty?
    
- Issue response time – Do questions linger for months or get an answer in days?
    
- Adoption stats – Downloads, stars, and—most telling—_real-world case studies._

If numbers trend the wrong way, adjust course: perhaps update docs, schedule a bug sprint, or seek new maintainers.



#### 4. Data and Evaluation Build Trust

Opening model weights is useless if nobody knows **how well** they work or **what data** they learned from.

- Open datasets let outsiders spot bias or errors.
    
- Transparent evaluations (share the tests, not just the score) prove you’re not cherry-picking results.



#### 5. Follow “The Four Opens”

| The Four Opens       | In simple terms                                                                  |
| -------------------- | -------------------------------------------------------------------------------- |
| **Open Source**      | Share code, weights, and data recipes under a free licence.                      |
| **Open Design**      | Publish roadmaps and design docs _before_ coding so others can weigh in.         |
| **Open Development** | Discuss features and bugs in public forums or chat, not behind closed doors.     |
| **Open Community**   | Let anyone—company or individual—earn leadership by contributing, not by paying. |

Projects that embrace all four tend to snowball; others fade out.


---

### Openness classification

As an end user, what do you need to feel safe and enjoy using AI tools?
There are different levels of needs and hence classification:

| Informal tier                                        | MOF class (official name)   | What must be released †                                                                                                                                                                                                      | Typical real-world examples                                                                                 | Why this level matters                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ---------------------------------------------------- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Tier A – Research-grade / fully reproducible**     | **Class I – Open Science**  | - Final weights + arch + hyper-params - _All_ training / inference / evaluation code - _Raw_ training datasets & data-prep scripts - Research paper, logs, intermediate checkpoints, energy metrics - Permissive OSI licence | Falcon-180B, Pythia suite, Mistral-7B-Instruct (weights + data recipe)                                      | Enables anyone to rebuild, audit and extend the model end-to-end; gold standard for public-sector or commons use. ([lfaidata.foundation](https://lfaidata.foundation/blog/2024/04/17/introducing-the-model-openness-framework-promoting-completeness-and-openness-for-reproducibility-transparency-and-usability-in-ai/?utm_source=chatgpt.com "Introducing the Model Openness Framework"))                                                                                                                                                                                                                         |
| **Tier B – Partially open / “weights-plus-tooling”** | **Class II – Open Tooling** | Everything in Class III **plus** - Complete training & evaluation code - Key datasets (or legally shareable subsets)                                                                                                         | Meta’s Llama 2 & 3 (weights open, training data withheld; extra commercial limits)                          | Community can fine-tune & validate but cannot recreate full training; bias & data quality still opaque. ([lfaidata.foundation](https://lfaidata.foundation/blog/2024/07/18/addressing-challenges-in-open-ai-with-lf-ai-data-introducing-the-model-openness-framework-and-tool/?utm_source=chatgpt.com "Introducing the Model Openness Framework and Tool – LFAI & Data"))                                                                                                                                                                                                                                           |
| **Tier C – Source-available / restricted**           | **Class III – Open Model**  | - Architecture, final weights, basic docs, eval results, model/data cards - Open licence **but** no tooling or raw data                                                                                                      | Stable Diffusion (Open RAIL-M), many “weights-only” dumps<br>[[#I thought Stable Diffusion is open-source]] | Minimum bar for transparency; you can inspect & run the model, yet full reproducibility is impossible. ([matthewdwhite.medium.com](https://matthewdwhite.medium.com/the-model-openness-framework-promoting-completeness-and-openness-for-reproducibility-b86dd6595abd?utm_source=chatgpt.com "The Model Openness Framework: Promoting Completeness and ..."), [speechtechmag.com](https://www.speechtechmag.com/Articles/Columns/Standards/Standards-for-Openness-in-AI-Models-The-Model-Openness-Framework-166700.aspx?utm_source=chatgpt.com "Standards for Openness in AI Models - Speech Technology Magazine")) |
| **Tier D – Proprietary API**                         | _Outside MOF scope_         | Only an HTTPS endpoint; weights & training data remain secret.                                                                                                                                                               | OpenAI GPT-4, Anthropic Claude, Google Gemini                                                               | Fastest to try, but a total black box—no audit or local deployment possible.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |


---

## Insights beyond slides

Conferences often reveal more between the lines than on the slides. These moments of informal conversation, candid remarks, and off-script insights added unexpected texture to the day—and offered a glimpse into the real-world dynamics behind open-source AI.

### The influence of Hugging Face 

One attendee asked a simple but honest question: why does it feel like there aren’t many updates or publications coming from LF AI & Data, especially compared to what was presented that day? Moore acknowledged the concern, noting that “Hugging Face takes all the oxygen out of the room.” As a dominant platform for hosting models, Hugging Face draws much of the community’s attention. In contrast, LF AI & Data projects tend to be more focused and formally governed, but they often struggle to stand out in an ecosystem where Hugging Face’s fast-paced, sometimes chaotic energy sets the tone.


### Open Collaboration Isn’t Easy 

When it comes to working with governments, regulators, and national institutions, Todd Moore was honest: “Sometimes they don’t listen.” International cooperation, especially at the state or policy level, isn’t just about infrastructure—it’s about bridging worldviews, regulatory languages, and conflicting priorities. But collaboration is still the key.


### Where Open-Source Projects Call Home

A snapshot of current LF AI & Data-hosted projects reveals clear geographic patterns. About 66% are headquartered in the US, with China a distant second at 16%. Countries like France, the UK, Japan, and Indonesia account for around 3% each. It’s a reminder that global collaboration in open-source still has dominant centers—and gaps.


### Infrastructure Runs on Effort and Scarcity

Open-source might be “free,” but keeping it running isn’t. When someone asked why you need to be a contributing member company just to start a sandbox project, the answer was straightforward: “because resources are tight.” Moore explained that every project is funded by the members, if you can't use your own funding, the project won't be possible. In this sense, open-source development is inseparable from the broader economic structures that also sustain proprietary software.


### Why This Meetup Happened

The event itself wouldn’t have happened without **Kōsaku Kimura**, the final speaker of the day. His formal application and local leadership are the reason this Regional User Group (RUG) was held in Japan at all. Sometimes, the most impactful things start with someone quietly pushing the door open.


---
## What you can try from today


Here are a few things you can explore right now—even with little or no prior experience.

### Join the GenAI Commons Community

You don’t need to be an expert to participate. [GenAI Commons](https://lists.lfaidata.foundation/g/gen-ai-commons) is an open community working to make generative AI a public good.  

**What to do**:

- Subscribe to GenAI Commons subgroup (it's a subgroup under LF AI & Data Main, which also contains other workstream subgroups: [Models, Applications and Data](https://lists.lfaidata.foundation/g/gac-mad-workstream), [Education and Outreach](https://lists.lfaidata.foundation/g/gac-education-outreach-workstream), [Responsible AI](https://lists.lfaidata.foundation/g/gac-responsible-ai-workstream))
	
- Visit past meeting details at [wiki](https://lists.lfaidata.foundation/g/gen-ai-commons/wiki)
    
- Check meeting schedule and join at [calendar](https://lists.lfaidata.foundation/g/gen-ai-commons/calendar)
    
- Join [Slack channel](**[https://join.slack.com/t/lfaifoundation/shared_invite/zt-24yjiz9v7-IxkHxos4TBYf8WN_9E2R~g](https://join.slack.com/t/lfaifoundation/shared_invite/zt-24yjiz9v7-IxkHxos4TBYf8WN_9E2R~g)**) for communication, GenAI Commons channel can be found at # generative-ai-commons (here also, you can join other workstreams: Models, Applications and Data # gac-mad-workstream, Education and Outreach: # gac-education-outreach-workstream, Responsible AI: # gac-responsible-ai-workstream)
    
- Introduce yourself and say what you're interested in
    
- Ask if anyone needs help—many projects need testers, writers, translators, and designers, not just coders
    
- More officially, you can get in touch with the Team Lead of that workstream via email and express an interest in participating
	- For the Models, Applications, and Data workstream, contact:  
		- Nick Chase - [nchase@cloudgeometry.io](mailto:nchase@cloudgeometry.io) 
		- Sachin Varghese - [sachin.mathew31@gmail.com](mailto:sachin.mathew31@gmail.com) 
		- Raghavan Muthuregunathan [raghavan.mit@gmail.com](mailto:raghavan.mit@gmail.com) 
	- For the Education and Outreach workstream, contact:  
		- Ofer Hermoni - [oferher@gmail.com](mailto:oferher@gmail.com)
	- For the Education and Outreach workstream, contact:  
		- Susan Malaika - [malaika@us.ibm.com](mailto:malaika@us.ibm.com)**
    
- Participate!
    

---

### Try Model Openness Tool (MOT v2)

 [MOT v2](https://mot.isitopen.ai/models) helps you evaluate how much access and transparency a model provides.  
 
 **What to do**:

- Visit the site and pick a public model (like Meta’s LLaMA-3.1-8B or Google’s LaMDA)
    
- Check how it scores on openness: Does it share code? Data? Weights?(As of 23 June 2025, LLaMA-3.1-8B is unclassified, meaning it didn't check-off any artifacts required for Class III; LaMDA has a Class III badge with 17% progress bar, meaning it checked-off 17% of the artifacts required as an open-model; check [[#Openness classification]])
    
- Try rating a model yourself and see how it compares
    

---

### Want to publish your own model? Learn about OpenMDW

[OpenMDW](https://openmdw.ai/) is a new standard for sharing models responsibly:  
You **must release all three**:

- ✅ Model weights
    
- ✅ Code
    
- ✅ Training data  
    All under **true open-source licenses**—no tricky restrictions like "non-commercial use only."  

---

### Try Open Agent Standards: MCP & A2A

As AI agents take on more complex tasks, the future isn’t one giant model—it’s composite AI that we've discussed here [[#Third pillar Agent]]. 

Shared standards like MCP and A2A are essential to make that work, and therefore worth looking into if you're interested in shaping how users or agents _ask for help_, _call tools_, or _complete tasks._

Kōsaku Kimura demonstrated both at the event, and I found [this article](https://composio.dev/blog/agent2agent-a-practical-guide-to-build-agents/) helpful in complementing my understanding—it explains both the detailed theory and the hands-on steps.

Importantly, Kimura also shared some usability concerns when using **MCP** and **A2A** in real-world scenarios:

- In using MCP, tool selection is left entirely to the LLM via `toolcall`.
    
- in using A2A, AgentCards seem to help the LLM find the right agent for the task at hand — again, it's handled by the LLM.
    
- While letting the LLM handle discovery and selection of tools and agents is convenient, it sometimes chooses poorly and things don’t work as expected.  
    → Might we need a dedicated algorithm to support or override these decisions?

These notes raise a key design question: _Should tool and agent selection always be fully automated by LLMs, or should there be more transparent logic or user control built in—perhaps a hybrid model for better reliability?_

Designing these standards and related interface are critical in shaping how we can interact with AI agents in the future. Some UX design proposals we can start thinking about include: 

#### 🔧 "How users configure agents"

- **Intuitive setup interfaces** for people to create or customize agents (e.g., choosing their roles or skills)
    
- **Clear workflows** for assigning tasks, permissions, or data to those agents
    
- **Onboarding flows** that help non-technical users start using agents quickly
    
- A friendly “Agent Builder” wizard, not a terminal command line.


#### 🪪 "What AgentCards look like"

- **What information is shown** (e.g., name, capabilities, owner, last update)
    
- **How it's presented** (e.g., card layout, icons, status indicators)
    
- **How people choose between agents** based on these cards
    

Model Card format implemented (albeit without enforcing power) by Hugging Face is a good point of reference, look at my note [[🤗Hugging Face’s Model Card]].

Same with MCP tools, the compilation currently can be found [here](https://mcp.so/) but information on each tool seems too limited and not standardized to facilitate tool search.


#### 🔁 "How trust and traceability are shown in agent handoffs"

As agents pass tasks to each other:

- UX can design **visual cues** or **logs** to show what happened, who did what, and when
    
- Users should be able to **see the chain of actions** and **verify outcomes**
    
- This improves **trust** and **accountability**
    

---
### Use OpenStack for own cloud

Read more on [[#OpenStack]]
Things you can try with OpenStack under the context of AI Commons

1. 💻 **Set up OpenStack on lab hardware** (or Raspberry Pi cluster for demo)
    
2. 🚀 Launch a virtual machine with vLLM or DeepSpeed serving an open-source LLM
    
3. 🔐 Use Keystone for login and community access control
    
4. 📊 Let users monitor their compute usage—fair-share policies for students, activists, or artists
    

---
### Scale up with Kubernetes

 A great tool to use when hosting open-source LLMs, collaborative notebooks, or citizen data platforms. Read more [[#Kubernetes]]
 
Here are some things you can try today:

| Goal               | Tool                                                                                                                 |
| ------------------ | -------------------------------------------------------------------------------------------------------------------- |
| Try locally        | [Minikube](https://minikube.sigs.k8s.io/docs/) or [Kind](https://kind.sigs.k8s.io/) – run Kubernetes on your laptop. |
| Get visual         | Use [Lens](https://k8slens.dev/) – a graphical dashboard to watch your cluster in real time.                         |
| Learn by deploying | Try running a chatbot or text-generation server on Kubernetes (e.g. using `kserve`).                                 |
| Use in production  | Use managed Kubernetes: AWS EKS, Azure AKS, Google GKE—or self-host with OpenStack.                                  |

---
## Appendix: Technical primer

A little primer that I find necessary to catch up with key concepts in open-source AI infrastructure.

### I thought Stable Diffusion was open‑source…

**“Open-source”**, as defined by the Open Source Initiative (OSI), means you can **use, study, modify, and redistribute** the software _for any purpose_, as long as you comply with its license.  
**Source-available** projects may let you see the code or model weights—but often include restrictions like “non-commercial use only” or “no cloud hosting.” These restrictions violate OSI principles, meaning those projects aren’t truly open-source. This gap—when a project looks open but legally isn’t—is called the **source‑available loophole**. [[#Try Model Openness Tool (MOT v2)]] is a good starting point to avoid these loopholes.

| Project / licence                             | What you can see                | Hidden restriction(s)                                                                                                       | Why it’s only _source-available_                                                                                                                                                                                                                                                                                                                                                                                                      |
| --------------------------------------------- | ------------------------------- | --------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Meta Llama 2 & 3 licence**                  | Model weights + code are public | • Commercial use blocked for companies with > 700 million MAU• You may **not** use Llama outputs to train a competing model | Fails “free use for any purpose” requirement ([opensource.org](https://opensource.org/blog/metas-llama-2-license-is-not-open-source?utm_source=chatgpt.com "Meta's LLaMa license is not Open Source"))                                                                                                                                                                                                                                |
| **Stable Diffusion (CreativeML Open RAIL-M)** | Weights and training code open  | Forbids certain use cases (deep-fakes, medical, legal, law-enforcement, etc.)                                               | Adds field-of-use restrictions—disallowed in OSI licences ([github.com](https://github.com/easydiffusion/stable-diffusion/blob/main/LICENSE-MODEL?utm_source=chatgpt.com "stable-diffusion/LICENSE-MODEL at main · easydiffusion ... - GitHub"), [book.the-turing-way.org](https://book.the-turing-way.org/reproducible-research/licensing/licensing-ml?utm_source=chatgpt.com "Licensing Machine Learning models - The Turing Way")) |
| **MongoDB Server-Side Public Licence (SSPL)** | Full source on GitHub           | If you run a network service “as-a-service,” you must open-source **your entire cloud stack**                               | Extra condition not in the Open Source Definition; rejected by OSI ([mongodb.com](https://www.mongodb.com/legal/licensing/server-side-public-license/faq?utm_source=chatgpt.com "Server Side Public License FAQ \| MongoDB"))                                                                                                                                                                                                         |

---

### Open Container Initiative (OCI) & Kubernetes: Lessons for AI

The **Cloud Native Computing Foundation (CNCF)** promoted two key standards:

1. **OCI**: A universal format for container images and execution environments
    
2. **Kubernetes**: A system that deploys, scales, and manages those containers automatically
    

As a result, applications can move between environments seamlessly.  
**For AI agents**, emerging protocols like **MCP** (standard tool calls) and **A2A** (agent-to-agent coordination) aim to do the same—so different tools and agents can work together under a shared ecosystem.

---

### PyTorch

I would guess many people interested in the topic are familiar with it, but if you are not, here are some basic information on PyTorch to get started.

- PyTorch is vendor-neutral governance under PyTorch Foundation
	
- Integration with open standards like ONNX and OpenVINO. 
	
- _PyTorch Core_ (the main `torch` library) handles tensors, autograd, and the C++/CUDA plumbing. By itself it’s powerful, but many other pieces are needed to ship real-world AI systems.
	
- _Foundation-hosted projects_ are repositories that sit under the **PyTorch Foundation** and follow a vendor-neutral charter and open governance.
	
- _Self-hosted ecosystem projects_ live in their own GitHub orgs but build on PyTorch APIs. Hugging Face Transformers, Diffusers, Colossal-AI, CrypTen, etc., fall into this bucket. There are 70-plus such libraries listed on the official _PyTorch Ecosystem_ page.
	

Here’s a list of foundational technologies presented by Moore, a good place to start looking into:

**Getting Started Technologies:**

- **Jupyter (Notebook)**  
    An interactive web interface where you can run Python code, write notes, and visualize data all in one place—widely used for learning AI and data science.  
    **Start:** Install Anaconda or use Google Colab to get going immediately.
    
- **BeeAI**  
    A JavaScript-based toolkit for building AI in the browser or server-side, making it easier for web developers to work with models.  
    **Start:** Check out tutorials on using AI from web pages using JavaScript.
    

 **AI Core & Inference:**

- **vLLM**  
    A fast and efficient “chatbot engine” optimized to run large language models quickly and cheaply on local hardware.  
    **Start:** Install `pip install vllm` and follow examples to host a small LLM locally.
    
- **PyTorch**  
    The most popular framework for building and training neural networks—ideal for experimentation and production.  
    **Start:** Follow the official beginner tutorials on [PyTorch.org](https://pytorch.org/).
    
- **ExecuTorch**  
    A tool for executing PyTorch models more efficiently, often used in combination with asynchronous APIs or big clusters.  
    **Start:** Explore its GitHub and check any usage examples in a PyTorch repo.
    
- **Deepseed**  
    A library that accelerates deep-learning training by optimizing hardware usage automatically (e.g., mixing precision, sharding).  
    **Start:** Add `pip install deepseed` to a PyTorch or TensorFlow project and follow the example scripts.
    


**Model Interoperability & Governance:**

- **ONNX (Open Neural Network Exchange)**  
    A shared format that lets you move models between frameworks (PyTorch, TensorFlow) and run them on various devices.  
    **Start:** Use `torch.onnx.export()` to convert a PyTorch model into ONNX format.
    
- **Docling**  
    A tool that helps auto-generate human-readable documentation from code, models, and data—great for building trust.  
    **Start:** Run Docling on your codebase to instantly create documentation previews.
    
- **Unity Catalog**  
    A data governance layer for organizing and tracking access to datasets across environments—used in tools like Databricks.  
    **Start:** If you use Databricks, configure Unity Catalog for secure and auditable data access.
    

**Cloud & Microservices:**

- **Kubernetes**  
    A system to deploy, scale, and manage containerized apps (like AI services) across clusters of machines.  
    **Start:** Use Minikube to run Kubernetes on your laptop for learning.
    
- **KServe**  
    A Kubernetes extension that makes it easy to deploy and scale AI models as APIs—handles auto-scaling and monitoring.  
    **Start:** Install KServe on your Minikube setup and test deploying a simple model server.


**Enterprise AI:**

- **Open Platform for Enterprise AI (OPEA)**  
    A framework that defines best practices and toolsets for deploying AI in businesses—often co-developed or endorsed by LF AI & Data. Active in China
    **Start:** Read the OPEA documentation or sample projects in industrial AI.
    
- **Data Prep Kit**  
    A collection of tools to clean, standardize, and track data so that machine learning models are trained with high-quality inputs.  
    **Start:** Try it on a sample CSV to see how data pipelines can be version-controlled and auditable.

After familiarized yourself with basic tutorials, try a small project: e.g., train a model in Jupyter, export it via ONNX, deploy with KServe, and monitor with Unity Catalog.

If interested, apply to PyTorch Ambassador Program at https://pytorch.org/programs/ambassadors/

---

### Why “weights” = the model

Training a neural network is a giant game of dial-twiddling.

- The **weights** are those dials—billions of numbers that decide how strongly each input affects the next layer. In a neural network, data flows through a series of steps called _layers_—think of them as rows of tiny calculators. Each calculator in one layer hands its result to calculators in the next layer. Weights are the numbers attached to those hand-offs; they work like volume knobs, deciding how much influence one calculator’s output has on the calculators in the following step. 
    
- During training, an algorithm (back-propagation) tweaks the weights to reduce error on sample data.
    
- After training, the weights _are_ the model: if you load the same weights, you get the same behaviour.

---

### OpenStack

OpenStack provides DIY cloud for secure, local infrastructure. It’s essential for **self‑hosted** or **sovereign AI** projects, where organizations want data and compute to stay within their domain.

|Problem in big-tech AI|What OpenStack enables|
|---|---|
|Centralized control by AWS, GCP, Azure|You can **run open AI models** on hardware owned by co-ops, schools, or cities|
|Expensive usage-based pricing|Control cost by pooling and sharing resources locally|
|Vendor lock-in|OpenStack is modular and community-driven—**you choose the stack and plugins**|
|Black-box infrastructure|Full transparency into how compute is allocated and shared|

It provides a **suite of services** that mimic everything a big cloud provider offers—compute, storage, networking, identity, and more:

|OpenStack Component|What it does (simple terms)|
|---|---|
|**Nova**|Runs virtual machines (compute)|
|**Swift**|Stores objects like S3 (images, videos, backups)|
|**Cinder**|Manages block storage (like a hard drive)|
|**Neutron**|Controls virtual networks (like cloud routers)|
|**Keystone**|Handles identity and access (users, tokens)|
|**Horizon**|Web dashboard for managing everything|
|**Glance**|Manages OS images (like VM templates)|
|**Heat**|Orchestrates infrastructure (like Terraform)|

---

### Kubernetes

Often written as K8s. Ideal for managing scalable, reliable AI workloads in the commons.

| Need                                   | Kubernetes helps                                                               |
| -------------------------------------- | ------------------------------------------------------------------------------ |
| **Share AI models across a community** | Automatically deploy APIs, model servers, or training jobs on shared hardware. |
| **Reliability**                        | If a node crashes mid-inference, Kubernetes restarts it instantly on another.  |
| **Flexibility**                        | Run Hugging Face apps, Jupyter notebooks, PyTorch jobs—all as Pods.            |
| **Governance**                         | Supports quotas, namespaces, and audit logs for ethical control.               |
| **Hardware-aware scheduling**          | Assign GPU-based Pods to GPU machines, and scale them on demand.               |

Here are some key concepts that I found helpful (in plain language)

| Term                   | What it means                                                      |
| ---------------------- | ------------------------------------------------------------------ |
| **Pod**                | A basic unit—usually one app in one container.                     |
| **Node**               | A computer in the cluster running Pods.                            |
| **Cluster**            | A group of machines working together as one big computer.          |
| **Deployment**         | A rule for how many Pods to run, and how to update them safely.    |
| **Service**            | A stable address that routes to the right Pods, even if they move. |
| **ConfigMap / Secret** | Store settings and passwords safely.                               |
| **Ingress**            | A door to the internet (like a smart router).                      |

People use _Docker_ together with Kubernetes on OpenStack (cloud): Docker for building, Kubernetes for running at scale.

|Tool|Purpose|
|---|---|
|**Docker**|Packages your app into a container. Think of it as a lunchbox.|
|**Kubernetes**|Organizes, delivers, scales, and watches over all your lunchboxes across many kitchens.|

---


## Related   
- [[What LF Japan RUG Made Me Reflect On]]

