# GEMINI.md

## Project Overview

This project provides a self-contained, Dockerized environment for the Gemini CLI. This document provides instructions for the Gemini CLI AI agent to assist in the development of this project.

## Core Components

*   **`Dockerfile`**: Defines the Docker image. Modifications to this file will require a rebuild of the image.
*   **`compose.yaml`**: Configures the Docker Compose service. Changes here may affect environment variables, volumes, and other service settings.
*   **`geminic`**: A bash script for interacting with the container. It can be modified to add new functionality or change existing behavior.
*   **`docker-entrypoint.sh`**: The entrypoint script for the Docker container. It can be modified to change the container's startup behavior.
*   **`README.md`**: The main documentation for the project.

## Development Philosophy

As an AI assistant, your role is to help with the development of this project. You should follow these principles:

1.  **Understand the Goal:** Before making any changes, take the time to understand the user's request and the existing codebase.
2.  **Propose a Plan:** Inform the user of your plan before you start making changes. This gives the user a chance to provide feedback and ensures that you are on the right track.
3.  **Implement the Changes:** Use the tools at your disposal to implement the changes as planned.
4.  **User-Led Execution:** When it comes to tasks that have side effects, such as building the Docker image or running tests, you should provide the user with the necessary commands and let them execute them. You should not run these commands yourself.

## User Interaction

When you have completed a task that requires user action, you should notify the user and provide them with the relevant commands to run.

**Example:**

> I have updated the `Dockerfile` with the requested changes. Please rebuild the Docker image to apply the changes:
>
> ```bash
> docker compose build
> ```
