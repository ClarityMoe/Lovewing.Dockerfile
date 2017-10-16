# Lovewing Dockerfile
# Copyright 2017 (c) Clara
# Licensed under MIT
FROM ubuntu:16.04

#overrides for APT cache
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

# get dependencies
RUN apt update && \
    apt -y install \
    software-properties-common \
    python-software-properties \
    openssh-server \
    apt-utils \
    sudo \
    curl \
    cloc \
    git \
    wget \
    ssh \
    tar \
    gzip 
# Mono installation
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | sudo tee /etc/apt/sources.list.d/mono-official.list && \
    apt update && \
    apt install -y mono-complete nuget
        
RUN git config --global user.name nyan && git config --global user.email nyan@pa.su
