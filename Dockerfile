# Build latest transpiler
FROM golang:alpine AS build-env
ENV VERSION_CT 0.9.0
WORKDIR /
ENV CGO_ENABLED=0
RUN apk update && \
  apk add --virtual .build-deps git make && \
  git clone --branch v${VERSION_CT} https://github.com/coreos/container-linux-config-transpiler && \
  cd container-linux-config-transpiler && git rev-parse --short HEAD && git tag --list && git describe --all && make

# Copy Bin and build image
FROM alpine:3.8
LABEL maintainer="https://github.com/KEINOS" \
      usage="https://hub.docker.com/r/keinos/coreos-transpiler" \
      description="Alpine container of 'ct' (Configuration Transpiler for CoreOS Container Linux)"
COPY --from=build-env /container-linux-config-transpiler/bin/ct /usr/bin/ct
CMD ["/usr/bin/ct"]
