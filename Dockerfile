FROM ubuntu:14.04

MAINTAINER Matthew Parlette

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y n2n && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV SUPERNODE_PORT 8989

EXPOSE 8989

CMD /usr/bin/supernode -l $SUPERNODE_PORT
