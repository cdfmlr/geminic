# Project Overview: geminic

This project provides a self-contained, Dockerized environment for using the Gemini CLI. It simplifies the setup process and ensures a consistent experience.

The key components are:

*   **`Dockerfile`**: Defines the Docker image, which includes the Gemini CLI and its dependencies.
*   **`compose.yaml`**: Configures the Docker Compose service for easy container management.
*   **`docker-entrypoint.sh`**: A script that runs on container startup, displaying a welcome message.
*   **`geminic`**: A convenience script for interacting with the Gemini CLI inside the container.

## Using the Gemini CLI

To get started, you can use the `geminic` script. This script handles starting the container and running commands within it.

**Examples:**

*   Run an interactive Gemini session:
    ```bash
    ./geminic
    ```
*   Run Gemini CLI with custom options:
    ```bash
    ./geminic gemini -p "Hello, world!"
    ```
*   Access a shell inside the container:
    ```bash
    ./geminic bash
    ```

The `geminic` script is a wrapper around `docker compose` commands. It automatically starts the container (if not already running) and then executes your command inside it.

### Working with Your Files

To work with your own project files inside the Gemini container, place them in the `./workspace` directory. This directory is mounted into the container at `/workspace`, so you can access and modify your files from either your local machine or within the container.

## Developing the `geminic` Project

If you are developing the `geminic` project itself, you will be directly modifying the files in current (project root) directory, such as the `Dockerfile` or `docker-entrypoint.sh`. 