[![CircleCI](https://circleci.com/gh/KEINOS/Dockerfile_of_CoreOS_Transpiler.svg?style=svg)](https://circleci.com/gh/KEINOS/Dockerfile_of_CoreOS_Transpiler)

# Dockerfile for CoreOS Configuration Transpiler

Alpine docker container with `ct` command, the [Configuration Transpiler](https://github.com/coreos/container-linux-config-transpiler)) tool for CoreOS.

Use this container to transpile YAML to JSON. Such as "CoreOS Container Linux Configuration" file to "CoreOS Ignition" file.

- Image built: keinos/coreos-transpiler @ DockerHub
- Dockerfile : https://github.com/KEINOS/Dockerfile_of_CoreOS_Transpiler @ GitHub
- See more about: [CoreOS Container Linux Configuration Transpiler Tool](https://github.com/coreos/container-linux-config-transpiler) @ GitHub

**NOTE**: The ordinary ["coreos-cloudinit" has been deprecated](https://github.com/coreos/coreos-cloudinit). If you want to install "coreos-cloudinit" command to verify/validate the "cloud-config" configuration file, use the "[Configuration transpiler](https://github.com/coreos/container-linux-config-transpiler)" tool or this docker image instead.

## Pull from DockerHub

```bash
docker pull keinos/coreos-transpiler
```

- DockerHub: <https://hub.docker.com/r/keinos/coreos-transpiler>

### Basic usage

```bash
docker run --rm -v $(pwd):/data keinos/coreos-transpiler ct [ARG] [[ARG] [ARG] ...]
```

- NOTE: `ARG`s are the arguments for `ct`(the transpiler tool) command. For example to see the help of `ct` would be:

    ```bash
    docker run --rm keinos/coreos-transpiler ct --help
    ```

### Sample usage

```shellsession
$ ls
cloud-config.yml
$ docker run --rm \
    -v $(pwd):/data \
    keinos/coreos-transpiler \
    ct -in-file /data/cloud-config.yml -out-file /data/ignition.json
$ ls
cloud-config.yml    ignition.json
```

## Build your own

### Easy way

```bash
docker image build --tag config-transpiler:latest https://github.com/KEINOS/Dockerfile_of_CoreOS_Transpiler.git
```

### Tipical way

1. Clone the repo from GitHub

    - GitHub: [https://github.com/KEINOS/Dockerfile_of_CoreOS_Transpiler](https://github.com/KEINOS/Dockerfile_of_CoreOS_Transpiler)

1. If you have `make` installed then just run `make` to build the docker image.

    ```bash
    $ ls
    Dockerfile  LICENSE    Makefile   README.md
    $ make
    ...
    Successfully built 74db61a427af
    Successfully tagged config-transpiler:latest
    $ docker image ls | grep config-transpiler
    config-transpiler    latest    74db61a427af    2 minutes ago   13.5MB
    ```

1. OR build the image in ordinary way:

    ```bash
    docker image build --tag config-transpiler:latest .
    ```
