---
title: System Audit Framework - Map Data Publishing
description: Standard operating procedure for documenting undocumented mapping pipelines.
target_audience: [technical-writers, engineering-managers, AI-copilots]
ai_metadata:
  process_type: documentation-discovery
  inputs: [source-code, PR-history, Jira-tickets, protobuf-schemas]
  outputs: [validated-architecture-docs, AI-ready-markdown]
---

# Engineering Discovery & Forensic Audit Framework

## 1. The Scenario
**Problem:** A legacy Map Tile Compilation Pipeline has no central documentation. The backend team, the vehicle client team, and the downstream routing team have conflicting understandings of how semantic map data (e.g., lane topology, traffic signs) is published to edge servers.

**Goal:** Establish a single source of truth that is human-readable for engineers and structured for AI/RAG copilot retrieval, minimizing the impact on engineering sprint velocity.

---

## 2. Phase 1: Artifact Archaeology (Pre-SME Work)
Before scheduling any meetings with engineering, I perform an independent audit of the ground truth:

* **Code & Schemas:** Reviewing Protobuf/JSON schema definitions for the map data payloads to identify required vs. deprecated fields.
* **Git History & PRs:** Analyzing commit messages and PR discussions in the Map Publisher repository to understand edge-case logic and recent hotfixes.
* **CI/CD Pipelines:** Tracing GitHub Actions or Jenkins logs to map exactly how data is compiled, packaged, and deployed to the streaming service.

---

## 3. Phase 2: Gap Analysis Matrix
After reviewing the codebase, I map out discrepancies between legacy documentation and actual system behavior. 

| System Component | Stated Behavior (Confluence) | Actual Behavior (Code/PRs) | Risk Level | Action Required |
| :--- | :--- | :--- | :--- | :--- |
| **Lane Topology** | Drops lane segments < 2 meters | Code actually drops segments < 5 meters | **High** (ADAS mapping failure) | Align upstream data specs via SME review |
| **Tile Publishing** | Triggers on every regional update | Triggers only on full map batch | **Medium** (Data latency) | Update architecture diagram |
| **Schema Validation** | Strict validation against v1.2 | Fails silently on missing semantic tags | **High** (Data corruption) | Raise Jira ticket for backend team |

---

## 4. Phase 3: Targeted SME Interrogation
To respect the time of senior architects, I utilize asynchronous, highly targeted validation rather than broad discovery meetings:

1. **Red-Line Validation:** I provide a draft Mermaid.js architecture diagram and ask the engineer to correct it. (Engineers correct architecture diagrams faster than they write them).
2. **Binary Questioning:** *"I noticed the Protobuf schema for lane geometry allows null values, but the downstream router code crashes on nulls. Is there a validation layer I am missing, or is this known tech debt?"*

---

## 5. Phase 4: Publishing for Humans and AI
Once the system architecture is validated by SMEs, it is published via a Docs-as-Code pipeline.

* **For Humans:** Heavy use of Mermaid diagrams, clear prerequisites, and inline code snippets.
* **For AI/RAG:** Strict semantic headers, YAML frontmatter, and explicit entity definitions to prevent LLM hallucination and chunking fragmentation during vector retrieval.
