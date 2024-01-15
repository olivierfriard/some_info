# Docker for Deep audio classify

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Install base system and devel tools
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt update && \
  apt install -y apt-utils && \
  apt -y upgrade && \
  apt install -y locales && \
  apt install -y libssl-dev libgit2-dev 

RUN apt install -y wget

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt install nvidia-cuda-toolkit -y
RUN sudo apt install libcufft10
RUN sudo apt install libcusparse11
RUN sudo apt install libcublas11 libcublaslt11

RUN apt install -y python3-pip

RUN pip3 install tensorflow==2.11.0
RUN pip3 install tensorflow-io==0.31.0
RUN pip3 install tensorRT


