# geminic

This project provides a self-contained, Dockerized environment for using the Gemini CLI. It simplifies the setup process, ensures a consistent and isolated experience, and makes it easy to integrate with other Docker (Compose) based services.

## Table of Contents

- [geminic](#geminic)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Working with Your Files](#working-with-your-files)
    - [Mounting Existing Projects](#mounting-existing-projects)
  - [Advanced Configuration](#advanced-configuration)
    - [Persistent Configuration](#persistent-configuration)
  - [Cleanup](#cleanup)
  - [Project Components](#project-components)
  - [Development](#development)

## Prerequisites

Before you begin, ensure you have the following installed:

*   [Docker](https://docs.docker.com/get-docker/)
*   [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

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

By default, running `./geminic` without any arguments will start an interactive session with the `gemini-2.5-flash` model. This is a temporary setup for development and testing, and it will be changed to `gemini` soon. You can override this behavior by providing your own arguments to the `geminic` script.

## Working with Your Files

To work with your own project files inside the Gemini container, place them in the `./workspace` directory. This directory is mounted into the container at `/workspace`, so you can access and modify your files from either your local machine or within the container.

### Mounting Existing Projects

You can also mount existing projects from your local machine into the container by modifying the `compose.yaml` file. For example, to mount a project located at `~/my-project` to `/workspace/my-project` in the container, you would add the following to the `volumes` section:

```yaml
volumes:
  - ./workspace:/workspace
  - ./data/gemini:/root/.gemini
  - ./data/config:/root/.config
  - ~/my-project:/workspace/my-project
```

For Linux users, bind mounting and FUSE filesystems are also useful options for more flexible file sharing.

## Advanced Configuration

### Persistent Configuration

The `compose.yaml` file is configured to persist your Gemini CLI configuration and history. This is achieved by mounting the following directories:

*   `./data/gemini` to `/root/.gemini`: This stores your Gemini CLI history and other user-specific data.
*   `./data/config` to `/root/.config`: This stores your Gemini CLI configuration.

If you are already using the Gemini CLI on your host machine, or if you are using multiple `geminic` instances, you can mount your existing `~/.gemini` and `~/.config` directories into the container by modifying the `compose.yaml` file:

```yaml
volumes:
  - ./workspace:/workspace
  - ~/.gemini:/root/.gemini
  - ~/.config:/root/.config
```

This will ensure that your Gemini CLI settings and history are shared between your host machine and the container.

## Cleanup

When you are finished using the container, you can stop and remove it by running the following command:

```bash
docker compose down
```

**Warning:** This command will remove the container and all data that is not stored in the mounted volumes (`/workspace`, `/root/.gemini`, and `/root/.config`). Any changes made to other files inside the container will be lost.

## Project Components

*   **`Dockerfile`**: Defines the Docker image, which includes the Gemini CLI and its dependencies.
*   **`compose.yaml`**: Configures the Docker Compose service for easy container management.
*   **`docker-entrypoint.sh`**: A script that runs on container startup, displaying a welcome message.
*   **`geminic`**: A convenience script for interacting with the Gemini CLI inside the container.

## Development

If you are developing the `geminic` project itself (manually), you will be directly modifying the files in the current (project root) directory, such as the `Dockerfile` or `docker-entrypoint.sh`.

To work on `geminic` from within the `geminic` container (bootstrapping), you can modify the `compose.yaml` file to mount the project root into the container's `/workspace`.