
FROM ubuntu:18.04
MAINTAINER Adrian Ko<adrian.ko@lge.com>

ARG user=ubuntu

RUN apt-get update && apt-get install -q -y \
        lsb-core

RUN apt-get update
RUN apt-get install -y language-pack-ko

# set locale ko_KR
RUN locale-gen ko_KR.UTF-8

ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

# update aptget
RUN  apt-get -y update
RUN  apt-get -y upgrade

# ssh server
RUN  apt-get install -y openssh-server

# basic options
RUN  apt-get install -y build-essential
RUN  apt-get install -y cmake
RUN  apt-get install -y python python-dev
RUN  apt-get install -y libncurses5-dev
RUN  apt-get install -y unzip git zip
RUN  apt-get install -y make
RUN  apt-get install -y wget exuberant-ctags vim tmux curl
RUN  apt-get install -y g++ scons lcov doxygen graphviz rpcbind gcc-arm-linux-gnueabi g++-arm-linux-gnueabi
RUN  apt-get install -y build-essential
RUN  apt-get install -y default-jre
RUN  apt-get install -y sudo
RUN  apt-get install -y net-tools

# basic utils
RUN  apt-get install -y mc htop

# module init tools for NVIDIA driver install
RUN apt-get install -y module-init-tools
RUN apt-get install -y linux-source
RUN apt-get install -y linux-headers-$(uname -r)
RUN apt-get install -y mesa-utils

# user add
RUN useradd -ms /bin/bash $user -G sudo
# setting default passwd
RUN echo root:blabla | chpasswd
RUN echo $user:blabla | chpasswd

# :x: share point
VOLUME ["/home/adrian.ko/01_util/00_docker/00_docker_share"]

USER $user
WORKDIR /home/$user
RUN mkdir /home/$user/share

CMD /bin/bash
