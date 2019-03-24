# Dockerfile for CoreOS Configuration Transpiler

Builds Alpine docker image with CoreOS' transpiler tool.

- See more about: [CoreOS Container Linux Configuration Transpiler Tool](https://github.com/coreos/container-linux-config-transpiler) @ GitHub

This dockerfile builds a docker image of a simple "[CoreOS Transpiler](https://github.com/coreos/container-linux-config-transpiler)" container running on Alpine linux. Especially for transpiling "CoreOS Container Linux Configuration" file (YAML) to "CoreOS Ignition" file (JSON).

## How to build

If you have `make` installed then just run `make`. Or build the image in ordinary way:

```bash
docker image build --tag config-transpiler:alpine .
```
