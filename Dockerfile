FROM ubuntu:14.04

MAINTAINER Matthew Parlette

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y n2n && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

ENV SUPERNODE_PORT 8989

EXPOSE 8989
EXPOSE 22

CMD /usr/bin/supernode -l $SUPERNODE_PORT
CMD    ["/usr/sbin/sshd", "-D"]
