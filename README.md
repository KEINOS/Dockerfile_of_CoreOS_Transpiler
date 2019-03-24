# Dockerfile for CoreOS Config Transpiler

Builds Alpine docker image with CoreOS' transpiler tool.

- See about: [CoreOS Container Linux Configuration Transpiler](https://github.com/coreos/container-linux-config-transpiler) @ GitHub

This dockerfile creates an image of a simple "[CoreOS Transpiler](https://github.com/coreos/container-linux-config-transpiler)" container running on Alpine linux, especially for transpiling CoreOS Container Linux Configuration file to `ignition.json`.

## How to build

If you have `make` installed then just run `make`. Or build the image in ordinary way:

```
docker image build --tag config-transpiler:alpine .
```
