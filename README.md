# Geospatial Docs-as-Code: System Audit Framework

This repository demonstrates a structured approach to technical documentation for complex, data-intensive mapping environments (such as NDS.Live publishing pipelines). 

## Purpose
In legacy or rapidly evolving software environments, map data semantics, publishing pipelines, and technical design decisions are often undocumented or scattered across PRs and Jira tickets. 

This repository contains the framework I use to:
1. **Act as a Software Archaeologist:** Auditing code, PRs, and schemas before consuming SME time.
2. **Execute Targeted SME Discovery:** Moving from open-ended interviews to asynchronous, high-fidelity technical validation.
3. **Build AI-Ready Documentation:** Structuring output with strict YAML metadata, semantic headings, and explicit data relationships so that LLM/RAG copilots can parse the system architecture without chunking fragmentation or hallucination.

## Contents
* `audit-framework.md` - The end-to-end SOP for documenting an undocumented data pipeline.
* `sme-validation-template.md` - A targeted questionnaire template for backend engineers and architects.
