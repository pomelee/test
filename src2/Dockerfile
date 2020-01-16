FROM ubuntu:18.04
MAINTAINER Adrian Ko<adrian.ko@lge.com>

ARG user=ubuntu

RUN apt-get update && apt-get install -q -y \
    lsb-core \
    language-pack-ko \
    openssh-server \
    build-essential \
    cmake \
    python python-dev \
    libncurses5-dev \
    unzip git zip \
    make \
    wget exuberant-ctags vim tmux curl \
    g++ scons lcov doxygen graphviz rpcbind gcc-arm-linux-gnueabi g++-arm-linux-gnueabi \
    default-jre \
    sudo \
    net-tools \
    mc htop \
    module-init-tools \
    linux-source \
    mesa-utils \
    && rm -rf /var/lib/apt/lists/*

# set locale ko_KR
RUN locale-gen ko_KR.UTF-8

ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

# user add
RUN /bin/bash -c "useradd -ms /bin/bash $user -G sudo ;\
	echo root:blabla | chpasswd ;\
	echo $user:blabla | chpasswd"

# :x: share point
VOLUME ["/home/adrian.ko/01_util/00_docker/00_docker_share"]

USER $user
WORKDIR /home/$user
RUN mkdir /home/$user/share

WORKDIR /home/src
CMD /bin/bash
