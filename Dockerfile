FROM alpine:latest
RUN apk add --no-cache bash make curl ca-certificates
ENV BATS_VERSION 0.4.0
RUN curl -o "/tmp/v${BATS_VERSION}.tar.gz" -L \
    "https://github.com/sstephenson/bats/archive/v${BATS_VERSION}.tar.gz" \
  && tar -x -z -f "/tmp/v${BATS_VERSION}.tar.gz" -C /tmp/ \
  && bash "/tmp/bats-${BATS_VERSION}/install.sh" /usr/local \
  && rm -rf /tmp/*
ENTRYPOINT ["bats"]
