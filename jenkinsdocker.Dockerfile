FROM jenkins/jenkins:lts

USER root
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables && \
	update-alternatives --set iptables /usr/sbin/iptables-legacy && \
	update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
    
RUN curl -sSL https://get.docker.com/ | sh

RUN usermod -aG docker jenkins

CMD dockerd
