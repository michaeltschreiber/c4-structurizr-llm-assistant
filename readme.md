<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# 

---

# C4 Structurizr System Architecture Modeler

The C4 Structurizr System Architecture Modeler is a specialized tool designed to translate natural language system descriptions into valid C4 architectural models using Structurizr DSL syntax. This tool streamlines the process of creating comprehensive software architecture documentation by automatically generating structured models from textual descriptions.

## Overview

This tool bridges the gap between conceptual system designs and formal architecture documentation by:

- Analyzing natural language system descriptions
- Identifying key architectural elements (people, systems, containers, components)
- Establishing relationships between elements
- Generating valid Structurizr DSL code for visualizing the architecture
- Creating multiple diagram types from a single model


## Features

**Comprehensive Model Generation**

- Generates complete workspace definitions with appropriate naming
- Creates hierarchical models with proper element relationships
- Supports multiple diagram views (System Landscape, Context, Container, Component)
- Provides proper element styling and tagging

**Intelligent Analysis**

- Identifies people (users, actors) and their roles
- Maps software systems (both internal and external)
- Breaks down systems into containers (applications, data stores, services)
- Defines components within containers when appropriate
- Establishes meaningful relationships between elements

**Documentation Support**

- Generates ER diagrams for data stores
- Creates data dictionaries for complex data structures
- Documents APIs and interfaces
- Explains key architectural decisions

**Visualization Options**

- System landscape views for high-level overview
- System context diagrams for system boundaries
- Container diagrams for application architecture
- Component diagrams for implementation details
- Data flow diagrams for ETL pipelines


## Getting Started

### Prerequisites

To use the generated C4 models, you'll need:

- Access to Structurizr (either cloud service or on-premises)
- Basic understanding of C4 modeling concepts
- Familiarity with software architecture principles


### Usage

1. Prepare a detailed system description covering key elements:
    - Users and their roles
    - Internal and external systems
    - Applications, data stores, and services
    - Key components and modules
    - Relationships between elements
2. Submit your description to the C4 Structurizr System Architecture Modeler
3. Receive the generated C4 DSL code along with explanations
4. Copy the DSL code into Structurizr or compatible tools to visualize your architecture

## Example Model Structure

The models generated follow this structure:

```
workspace [Name] [Description]
!identifiers hierarchical

model
  // People definitions
  user person User [Description]
  
  // System definitions
  system softwareSystem System [Description]
  
  // Container definitions
  webapp container Web Application [Description]
  database container Database [Description] tags Database
  
  // Relationships
  user -> system Uses
  webapp -> database Reads from and writes to

views
  // Various diagram views
  systemContext system SystemContext
  include *
  autoLayout
  
  container system ContainerView
  include *
  autoLayout
  
  // Styling
  styles
    element Person shape Person
    element Database shape Cylinder
```


## Best Practices

For optimal results:

- Provide detailed descriptions of all system components
- Clearly specify relationships between elements
- Include information about technologies used
- Define user roles and their interactions with the system
- Specify data stores and their contents
- Describe API interfaces and integrations


## Advanced Features

The tool supports advanced C4 modeling capabilities including:

- Deployment environment modeling
- Dynamic views for process flows
- Filtered views for specific aspects
- Custom styling options
- Hierarchical identifiers for complex systems


## References

This tool implements the C4 model as developed by Simon Brown and uses Structurizr DSL syntax. For more information:

- C4 Model: https://c4model.com/
- Structurizr DSL: https://docs.structurizr.com/dsl/
- DSL Cookbook: https://docs.structurizr.com/dsl/cookbook/


## Limitations

The tool works best with clear, well-structured system descriptions. Very complex or ambiguous descriptions may require additional clarification or manual adjustments to the generated models.

<div style="text-align: center">⁂</div>

[^1]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_efbac38f-95c8-441b-a701-1f98b06a9c9e/21e5188c-a233-4f87-b3fd-2f23e259a7d3/C4-Structurizr-DSL-Generation-System-Prompt.md

[^2]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_efbac38f-95c8-441b-a701-1f98b06a9c9e/b5002099-321a-4a49-882f-070552c5c9f6/example-Comprehensive-example-of-a-modern-e-commerce-system.c4.txt

[^3]: https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/collection_efbac38f-95c8-441b-a701-1f98b06a9c9e/feea8a80-bd3d-490e-b842-4f27f20fd357/example-basic-syntax.c4.txt

