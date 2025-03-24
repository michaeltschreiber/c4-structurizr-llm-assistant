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