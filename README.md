[![CircleCI](https://circleci.com/gh/KEINOS/Dockerfile_of_CoreOS_Transpiler.svg?style=svg)](https://circleci.com/gh/KEINOS/Dockerfile_of_CoreOS_Transpiler)

# Dockerfile for CoreOS Configuration Transpiler

Alpine docker image with CoreOS' transpiler tool.

- See more about: [CoreOS Container Linux Configuration Transpiler Tool](https://github.com/coreos/container-linux-config-transpiler) @ GitHub

This dockerfile builds a docker image of a simple "[CoreOS Transpiler](https://github.com/coreos/container-linux-config-transpiler)" container running on Alpine linux. Especially for transpiling "CoreOS Container Linux Configuration" file (YAML) to "CoreOS Ignition" file (JSON).

## Pull from DockerHub

```bash
docker pull keinos/coreos-transpiler
```

- DockerHub: <https://hub.docker.com/r/keinos/coreos-transpiler>

## Basic usage

```bash
docker run --rm -v $(pwd):/data keinos/coreos-transpiler ct <arg> [<arg> <arg> ...]
```

## See help

```bash
docker run --rm -v $(pwd):/data keinos/coreos-transpiler ct --help
```

## Sample usage

```shellsession
$ ls
cloud-config.yml
$ docker run --rm \
>   -v $(pwd):/data \
>   keinos/coreos-transpiler \
>   ct -in-file /data/cloud-config.yml -out-file /data/ignition.json
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

  - GitHub: <https://github.com/KEINOS/Dockerfile_of_CoreOS_Transpiler>

1. If you have `make` installed then just run `make` to build the docker image. 

  ```bash
  $ ls
  Dockerfile  LICENSE    Makefile   README.md
  $ make
  ...
  Successfully built 74db61a427af
  Successfully tagged config-transpiler:latest
  $ docker image prune -f
  $ docker image ls | grep config-transpiler
  config-transpiler    latest    74db61a427af    2 minutes ago   13.5MB
  ```

1. OR build the image in ordinary way:

  ```bash
  docker image build --tag config-transpiler:latest .
  ```
