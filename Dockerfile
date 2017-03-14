FROM       ubuntu:14.04
MAINTAINER Aleksandar Diklic "https://github.com/rastasheep"

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y n2n && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV SUPERNODE_PORT 8989

EXPOSE 8989
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
CMD /usr/bin/supernode -l $SUPERNODE_PORT

