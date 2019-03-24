# Build latest transpiler
FROM golang:alpine AS build-env
WORKDIR /
ENV CGO_ENABLED=0
RUN apk update && apk add --virtual .build-deps git make && \
  git clone https://github.com/coreos/container-linux-config-transpiler && \
  cd container-linux-config-transpiler && \
  make

# Copy Bin and build image
FROM alpine:latest  
COPY --from=build-env /container-linux-config-transpiler/bin/ct /usr/bin/ct
CMD ["/usr/bin/ct"]
