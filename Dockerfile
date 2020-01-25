FROM debian:stretch-slim
LABEL maintainer="Stephen Price <stephen@stp5.net>"

ENV TIMEZONE UTC

RUN apt-get update \
  && apt-get install -y curl libcap2-bin dnsmasq

RUN chown dnsmasq /usr/sbin/dnsmasq \
    && setcap 'cap_net_bind_service=+eip' /usr/sbin/dnsmasq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 53/tcp 53/udp

USER dnsmasq
ENTRYPOINT ["/usr/sbin/dnsmasq", "--keep-in-foreground", "--log-facility=-"]
