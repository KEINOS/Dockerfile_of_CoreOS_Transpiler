# Build latest config transpiler
FROM golang:alpine AS build-env
WORKDIR /
ENV CGO_ENABLED=0
RUN apk update && \
  apk add --virtual .build-deps git make && \
  git clone https://github.com/coreos/container-linux-config-transpiler && \
  cd container-linux-config-transpiler && \
  echo '====>> List git branch: '; git branch --list && \
  echo '====>> Current commit ID: '; git rev-parse --short HEAD && \
  echo '====>> List of tagged in git: '; git tag --list && \
  echo '====>> Git describe: '; git describe --all && \
  echo '====>> Run: make'; make -d | grep Success | sed -e 's/^[ ]*//g' && \
  echo '====>> Version:'; ./bin/ct --version && \
  echo 'Done: make'

# Copy Bin and build image
FROM alpine:3.8
LABEL maintainer="https://github.com/KEINOS" \
      usage="https://hub.docker.com/r/keinos/coreos-transpiler" \
      description="Alpine container of 'ct' (Configuration Transpiler for CoreOS Container Linux)"
COPY --from=build-env /container-linux-config-transpiler/bin/ct /usr/bin/ct
COPY test.d/run_test.sh /test/
COPY test.d/sample_* /test/
CMD ["/usr/bin/ct"]
HEALTHCHECK CMD /test/run_test.sh
