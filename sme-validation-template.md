---
title: SME Asynchronous Validation Template
description: Template used to extract highly specific technical confirmations from senior engineers via Slack/Teams.
---

# SME Validation Request: Map Compilation Pipeline

**To:** @Backend_Architect  
**From:** Technical Documentation  
**Context:** I am mapping the undocumented data flow for the NDS.Live compilation service. I have already reviewed the Protobuf schemas and the recent CI/CD logs, but I have three specific edge-case questions. 

When you have 5 minutes, please review the assumptions below. You can just reply inline with "Yes/No" or a brief correction.

### 1. Schema Validation (Routing Layer)
* **My Assumption based on code:** The pipeline strictly enforces the v2.1 schema for the routing layer, but silently drops non-compliant tiles rather than failing the build.
* **Is this correct?** [ ]

### 2. Edge-Node Caching
* **My Assumption based on PR #442:** Edge node caches are invalidated globally when a new base map is published, rather than partially updated.
* **Is this correct?** [ ]

### 3. Diagram Red-Line
* I have attached a draft Mermaid diagram of the compilation sequence. Could you let me know if I missed any intermediate microservices between the `DataLake` and the `TileCompiler`?
