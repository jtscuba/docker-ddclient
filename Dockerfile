FROM ubuntu:latest
MAINTAINER Denis Gladkikh <ddclient-container@denis.gladkikh.email>

# Install ddclient
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y ddclient ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /sbin/entrypoint.sh

RUN chmod +x /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh", "start-service"]