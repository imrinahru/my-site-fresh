---
title: 2025-06-26 — AI Agent Meetup by AI Alliance
date: 2025-06-26
tags:
  - event
  - AGI
location: Meta Headquarter @ Toranomon
draft: false
summary: Multi-agent framework that can accomplish any kind of tasks.
---


## Overview  

This was an event summary around agentic AI development in Japan, held by AI Alliance. Dave Nielsen from IBM was hosting and his wide network made it possible.

Different topics were covered: agent design, MCP, A2A, RAG, and different variants and on-going trials in the domain. The topics were on the technical side, directed towards engineers in ML. Some business use cases were also covered.

Among the speakers, Eduardo Gonzalez and his company, Xpress.ai's take on new agentic model sounded quite intriguing. The undertone was a human-replacing AI that can do tasks from end-to-end, only requiring a manager of some sort to approve and check from point-to-point.

## Extended insights

### From Internet APIs to AI Protocols

The battles that once shaped the web through the control of Internet APIs have now shifted to a new frontier: the race for AI protocol dominance. Just as APIs once defined how data and services were exchanged online, the emerging protocols for AI are poised to determine how intelligence is accessed, managed, and integrated across systems. This shift underscores a broader competition over who defines the architecture of the next technological era.


### Multi-Agent Frameworks and the Rise of Agent OS


One of the key takeaways came from Xpress AI, which introduced the idea of an Agent Operating System tailored for enterprise environments. This system facilitates multi-agent frameworks where AI agents don’t just execute predefined workflows, but instead perceive their environment, act intelligently, and coordinate with other agents. The vision here is not about narrow task automation but about creating systems capable of sustained interaction, learning, and adaptive behavior within complex organizational settings.

The rational behind this startup based in Japan is, as pronounced by the founder, Gonzalez, is that "There won't be enough people in the future, we need AI to fill up the shortage".

## Beyond Workflow Automation

> In RL 'agents' are autonomous systems, that can perceive an environment (like a game),  'reason' to choose which actions to take to achieve a goal and effect the environment.

- Perceive the environment to understand the current state
- Reasons about the state and picks the best action
- Executes the action to effect the environment and eventually achieve a goal

Agent-based automation is often mistaken as merely a series of automated workflows. However, the true potential lies in systems that can fully comprehend tasks, learn from their performance, and operate across multiple steps with minimal human supervision. For this to work, AI agents need access to tools beyond their training data—such as desktop applications—and must have the ability to pause, reason, and request human input when necessary. The design of such agents suggests a move toward more context-aware, execution-capable systems that do more than follow static instructions.

An initial attempt at an AI agent, a "BabyAGI" was created in April 2023 by Yohei Nakajima. It was one of the **first attempts to use a LLM in an agent style fashion**. 

https://yoheinakajima.com/
https://www.yohei.me/

It worked by creating four "agents" which were prompts of specific tasks that break down a goal to a series of small steps and executing the steps until all the tasks are complete.

By adding tools that can interact with the environment BabyAGI can technically be an AI agent. With tools, the executor inside BabyAGI has a means of performing actions and seeing results, thereby updating the tools until it can sufficiently complete the task at hand.

## The Limitations of Today’s Large Language Models

Despite their powerful capabilities, large language models are not fully intelligent systems. Compared to humans—even young children—they often fail in strategic or interactive tasks. One critical limitation is their tendency to become less accurate as their context window expands, especially when that context lies outside the bounds of their training data. 

[LLMs Get Lost in Multi-Turn Conversation](https://arxiv.org/abs/2505.06120)

This phenomenon, sometimes described as a form of sensory overload, illustrates how more input doesn't always lead to better output. 
 
While in-context learning gives these models a form of short-term memory, long-term adaptation still requires changing the model’s underlying weights—something current systems struggle with.


## The Superficiality of Vector Databases

> In theory, a vector database can be used to store the conversations or reasoning traces depending on context and only bring up the relevant ones. 
> But the longer the context, the harder it will be to distinguish between the conversation. And if the conversation is simply shoved in, it will confuse the LLM and get it off track.


While vector databases enable LLMs to retrieve information efficiently, they only operate at a superficial level. True understanding or long-term retention requires modifying the weights of the model itself. This leads to a recognition that future AI systems must go beyond retrieval. They need to develop a sense of self-identity, learn from interaction and feedback rather than static datasets, and be capable of completing complex, multi-step tasks. 


> **Ideals for a 24/7 running agent**
> 
> - Has an self identity
> 	- A consistent identity is necessary to interact with a specific agent and to have it learn, and stay coherent over time
> - Learns from feedback
> 	- Instead of being hard coded into a simple task, these agents should fulfill more generic roles just like humans. It should not rely solely on data training.
> - Gets the entire job done
> 	- With the ability to task switch, and proactively assess the current state of things and act by itself.


### Limitations of current AI agent frameworks

**LangChain** started as a “prompt‑chaining” helper and has grown into a general‑purpose _orchestration_ layer for LLM apps: you assemble tools, memory, and agents like Lego bricks, deciding yourself how the flow should branch or loop.[Medium](https://medium.com/%40iamanraghuvanshi/agentic-ai-3-top-ai-agent-frameworks-in-2025-langchain-autogen-crewai-beyond-2fc3388e7dec)

**CrewAI** positions itself as a _multi‑agent workflow_ engine. It assumes you want several specialised agents (“Writer”, “Researcher”, “Reviewer”, …) that hand off tasks in a fixed pipeline the authors call a _crew_. Its goal is to make team‑style collaboration easy rather than give you total low‑level control.[Medium](https://medium.com/%40iamanraghuvanshi/agentic-ai-3-top-ai-agent-frameworks-in-2025-langchain-autogen-crewai-beyond-2fc3388e7dec)

**AutoGPT** began life as a proof‑of‑concept showing how a single GPT‑powered program could set goals, break them into sub‑tasks, call external tools, and iterate until “done”. In 2025 it has become a full platform for **continuous** autonomous agents that run with minimal human supervision.[AutoGPT](https://autogpt.net/everything-you-need-to-know-about-the-autogpt-platform/?utm_source=chatgpt.com)

> Most tools are inherently stateless and are "trapped in an eternal present moment."

So Gonzalez is working to tackle following solutions:

> **Multi-agent paradigm: the hard parts**
> 
> - Durable memory for the capability to retain and recall information beyond the context window
> - Maintenance of an internal state that evolves over time triggered by reflection ad learning processes
> - Ability to ensure task continuity with the ability to pause complex tasks and resume them later when appropriate
> - Learning systems that incorporates reflective memories into the LLM to alleviate the pressure on the LTM (long-term memory)
> - Not only self-driving but also self-pacing by having the ability to specify how many tokes/hour the system should be able to consume


Xaibo was mentioned as an example of an event-based system designed to self-finetune—something current architectures still lack.



### The Importance of Debuggability and Human Oversight

> Xaibo is a modular framework designed to help you build sophisticated AI systems that are easy to test, debug, and evolve. Move beyond monolithic agent scripts and start creating with components you can trust.

The concept is agents with tasks, not conversations. So the interface design look like an autonomous Kanban board, instead of a chat toom.

![[Pasted image 20250725163003.png]]

> Just like employees,  it is important to implement processes as workflows to ensure that tasks are completed in line with quality requirements.

For agentic systems to be trustworthy and effective, they must be transparent and debuggable. Human oversight remains crucial, particularly in tasks where decision-making involves risk or ambiguity. Instead of relying on ever-larger context windows, a better training paradigm may involve continuous feedback loops. Such systems can be corrected incrementally and guided to competence over time, rather than relying entirely on pre-training.




## Insights from Diffusion Models and Human Cognition

An intriguing parallel was drawn between diffusion models and the human brain. Diffusion models generate a range of possibilities simultaneously—an approach that resembles the way humans consider multiple unconscious thoughts before settling on one. This raises the question of whether AI might someday simulate a kind of dream-like training environment. In such a system, learning would occur offline or asynchronously, allowing the model to grow without direct supervision or instruction—much like humans do during sleep.



## Toward Real Memory Systems in AI

What is missing from today’s AI landscape is a robust, dynamic memory system. While context windows provide temporary memory, and external databases allow retrieval, we do not yet have a system where models can remember, locate from database, organize, and reflect in the way humans do. Techniques like text-to-LoRA offer shortcuts to weight adjustments without full-scale retraining, but they are still far from creating autonomous learning loops. The challenge ahead is to develop agents that can consolidate learning across time, ideally through mechanisms akin to memory consolidation in the human brain.


## Conclusion: The Open Questions Ahead

The topics covered in this event point to the next frontier in AI research, including, but not limited to: 
- How to build long-term memory?
- How to allow continuous feedback learning?
- How to assure open, clear, debuggability?
- How to design a framework of multi-agents?

And not to forget, solving the above questions only provide a one-sided wheel, that is a more powerful, human-replacing AI in a workplace. But another side of the wheel needs to answer, how users should adapt to use this AI, instead of being used and pushed aside by it?

