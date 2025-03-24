# C4 Structurizr System Architecture Modeler

This repository provides tools, examples, and documentation for creating software architecture diagrams using the C4 model with Structurizr DSL. It serves as a comprehensive resource for architects and developers seeking to effectively document and communicate software architecture.

## Repository Structure

```
📁 c4-example/
├── 📁 docs/
│   └── 📄 C4 Structurizr DSL Generation System Prompt.md
├── 📁 examples/
│   ├── 📄 example - basic syntax.c4
│   └── 📄 example - Comprehensive example of a modern e-commerce system...
├── 📄 c4-example.code-workspace
├── 📄 structurizr-lite_launcher.sh
└── 📄 readme.md
```

## Contents Overview

### Documentation

The `docs` folder contains guidance and reference materials:

- **C4 Structurizr DSL Generation System Prompt.md** - A comprehensive guide explaining how to translate natural language system descriptions into valid C4 Structurizr DSL syntax. This document outlines a step-by-step approach for analyzing system descriptions, identifying architectural elements, and creating structured C4 models[^3].

### Examples

The `examples` folder includes sample C4 models of varying complexity:

- **example - basic syntax.c4** - A minimal example showing the fundamental structure of a Structurizr DSL file, including workspace definition, model elements, relationships, and basic views[^4].
- **example - Comprehensive example of a modern e-commerce system...** - An extensive model demonstrating a complete e-commerce platform with multiple systems, containers, components, and relationships. This example showcases advanced features like deployment nodes, dynamic views, and custom styling[^5].

### Development Environment

- **c4-example.code-workspace** - A VS Code workspace configuration file to help set up a development environment for working with C4 models[^1].

## Setup Instructions

### Visual Studio Code Setup

1. **Install VS Code**:
    - Download and install Visual Studio Code from [code.visualstudio.com](https://code.visualstudio.com/)
2. **Install C4 DSL Extension**:
    - Open VS Code and navigate to Extensions (Ctrl+Shift+X or Cmd+Shift+X)
    - Search for "C4 DSL Extension" by systemticks
    - Click "Install"
    - Or install directly from: [https://marketplace.visualstudio.com/items?itemName=systemticks.c4-dsl-extension](https://marketplace.visualstudio.com/items?itemName=systemticks.c4-dsl-extension)[^2]
3. **Open the Workspace**:
    - Clone this repository
    - Open VS Code
    - Use File > Open Workspace from File...
    - Navigate to the repository and select `c4-example.code-workspace`

### Installing Microsoft OpenJDK

The C4 DSL Extension requires Java 17 or higher to run the language server[^2]. Microsoft OpenJDK is recommended:

1. **Download Microsoft OpenJDK**:
    - Visit [Microsoft's OpenJDK page](https://www.microsoft.com/openjdk)
    - Select the latest version for your operating system
    - Download the installer or archive file
2. **Installation**:
    - **Windows**: Run the downloaded MSI installer and follow the prompts
    - **macOS**:

      ```bash
      # Extract the downloaded tar.gz file
      tar -xf microsoft-jdk-xxx.tar.gz
      # Move to appropriate location
      sudo mv jdk-xxx /Library/Java/JavaVirtualMachines/
      ```

    - **Linux**:

      ```bash
      # Extract the downloaded tar.gz file
      tar -xf microsoft-jdk-xxx.tar.gz
      # Move to appropriate location
      sudo mv jdk-xxx /opt/
      # Update alternatives
      sudo update-alternatives --install /usr/bin/java java /opt/jdk-xxx/bin/java 1
      ```

3. **Verify Installation**:

    ```bash
    java -version
    ```

4. **Configure in VS Code** (if needed):
    - Set the path to the Java installation via the `c4.languageserver.java` setting if VS Code can't find it automatically[^2]

## Using the Examples

1. **Explore the Basic Syntax**:
    - Open `examples/example - basic syntax.c4` to understand the core concepts
    - This file demonstrates the minimal elements needed for a valid Structurizr DSL model[^4]
2. **Study the Comprehensive Example**:
    - Review the e-commerce system example to see how complex architectures are modeled
    - Pay attention to the hierarchical structure, relationship definitions, and view configurations[^5]
3. **Create Your Own Models**:
    - Use the examples as templates for your own architecture documentation
    - Follow the hierarchical identifier pattern for clarity

## Visualizing Your C4 Models

There are two approaches provided for visualizing your C4 models:

### Option 1: Using Structurizr Rendering via the C4 DSL Extension

- **Enable External Rendering**:
  - Open VS Code and navigate to the settings for the C4 DSL Extension.
  - Locate the **Structurizr Rendering** options and enable the rendering feature.
  - Set this as the default renderer.
- **Security Note**:
  - **Important**: This method uses an external API for rendering. Avoid using this option if your diagram contains sensitive information.

### Option 2: Using Structurizr-Lite via Docker

- **Pre-requisites**:
  - Ensure that your C4 model DSL file is in the project root directory and is named `workspace.dsl`.
  - Make sure Docker is installed and running on your machine.
- **Using the Provided Bash Script**:
  - A bash script (`structurizer-lite_launch.sh`) is provided to simplify launching the Structurizr-Lite Docker container. Ensure the script is executable:
    
    ```bash
    chmod +x structurizer-lite_launch.sh
    ```
    
  - The contents of the script are as follows:
    
    ```bash
    #!/bin/bash
    # Get the current working directory
    current_dir=$(pwd)
    
    # NB: Ensure your diagram is in the current directory and named workspace.dsl
    
    # Run the Structurizr Lite Docker container
    # - -it: interactive mode with a TTY
    # - --rm: automatically remove the container when it exits
    # - -p 8080:8080: map host port 8080 to container port 8080
    # - -v "$current_dir":/usr/local/structurizr: mount the current directory to the container
    docker run -it --rm -p 8080:8080 -v "$current_dir":/usr/local/structurizr structurizr/lite
    ```
    
  - **Usage**:
    - Place your C4 model DSL file in the project root as `workspace.dsl`.
    - Run the script from the project root directory:
      
      ```bash
      ./structurizer-lite_launch.sh
      ```
      
    - Open your browser and navigate to [http://localhost:8080](http://localhost:8080) to view your rendered diagram.

## Using with GitHub Copilot

A powerful feature of this repository is the ability to use the C4 system prompt with GitHub Copilot:

1. Open the system prompt file (`docs/C4 Structurizr DSL Generation System Prompt.md`) in VS Code.
2. Having this file open provides context to GitHub Copilot, enabling it to generate more accurate and relevant C4 model suggestions[^3].

## Working with the LLM Assistant

This repository works seamlessly with an AI assistant specialized in C4 modeling. The C4 Structurizr System Architecture Modeler assistant can:

1. **Generate C4 models from natural language descriptions**
2. **Answer questions about C4 modeling concepts**
3. **Help refine existing models**

Access the assistant through Perplexity AI: [C4 Structurizr System Architecture Collection](https://www.perplexity.ai/collections/c4-structurizr-system-architec-jyMQoWbpQ2mDCufYSV_Lhw)

## References and Resources

- [C4 Model Official Website](https://c4model.com/)
- [Structurizr DSL Documentation](https://docs.structurizr.com/dsl/)
- [Structurizr DSL Cookbook](https://docs.structurizr.com/dsl/cookbook/)
- [C4 Structurizr System Architecture Collection](https://www.perplexity.ai/collections/c4-structurizr-system-architec-jyMQoWbpQ2mDCufYSV_Lhw)
- [GitHub Example Repository](https://github.com/godatadriven/c4-model-example)
- [C4 DSL Extension](https://marketplace.visualstudio.com/items?itemName=systemticks.c4-dsl-extension)