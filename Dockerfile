FROM       ubuntu:14.04
MAINTAINER Aleksandar Diklic "https://github.com/rastasheep"

# install supervisor, curl
RUN apt-get update && apt-get install -y supervisor curl

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y n2n && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD n2nssd.conf /etc/supervisor/conf.d/n2nssd.conf

ENV SUPERNODE_PORT 8989

EXPOSE 8989
EXPOSE 22

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/n2nssd.conf"]

