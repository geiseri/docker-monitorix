FROM ubuntu:14.04
MAINTAINER Ian Geiser <geiseri@yahoo.com>

RUN locale-gen --no-purge en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -yq rrdtool perl libwww-perl libmailtools-perl libmime-lite-perl \
                        librrds-perl libdbi-perl libxml-simple-perl libhttp-server-simple-perl \
                        libconfig-general-perl libio-socket-ssl-perl libvirt-bin lm-sensors \
                        smartmontools wget 

RUN echo "deb http://apt.izzysoft.de/ubuntu generic universe" >> "/etc/apt/sources.list" && \
    wget http://apt.izzysoft.de/izzysoft.asc && apt-key add izzysoft.asc && \
    apt-get update && \
    apt-get install -yq monitorix

# Add config for docker
ADD monitorix.conf /etc/monitorix/monitorix.conf
VOLUME /etc/monitorix/conf.d

# Add the launch script
ADD launch.sh /launch.sh
RUN chmod +x /launch.sh

ENTRYPOINT /launch.sh

