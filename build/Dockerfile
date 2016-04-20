FROM ubuntu:16.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  libssl1.0.0 \
  libnl-3-200 \
  libnl-route-3-200 \
  libnl-genl-3-200 \
  iptables \
  libnfnetlink0 \
  libiptcdata0 \
  libipset3 \
  libsnmp30 \
  kmod \
  ca-certificates \
  iproute2 \
  libcap2-bin \
  ipvsadm && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/log/seesaw /etc/seesaw

ADD bin/* /usr/bin
