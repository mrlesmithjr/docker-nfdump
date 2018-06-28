FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends nfdump && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data

VOLUME /data

EXPOSE 2055/udp

CMD ["nfcapd", "-T", "all", "-l", "/data", "-S", "1", "-w", "-z", "-p", "2055"]
