# Docker for Deep audio classify

FROM nvidia/cuda:12.3.1-runtime-ubuntu22.04

# FROM nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04

# FROM nvidia/cuda:12.3.1-devel-ubi8


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
RUN apt install libcufft10
RUN apt install libcusparse11
RUN apt install libcublas11 libcublaslt11
RUN apt install libcublas11 libmp3lame0 libmp3lame-dev

RUN apt install -y python3-pip

RUN pip3 install tensorflow==2.11.0
RUN pip3 install tensorflow-io==0.31.0
RUN pip3 install matplotlib
RUN pip3 install tensorRT


RUN ln -s /usr/local/lib/python3.10/dist-packages/tensorrt_libs/libnvinfer.so.8 /usr/local/lib/python3.10/dist-packages/tensorrt_libs/libnvinfer.so.7
RUN ln -s /usr/local/lib/python3.10/dist-packages/tensorrt_libs/libnvinfer_plugin.so.8 /usr/local/lib/python3.10/dist-packages/tensorrt_libs/libnvinfer_plugin.so.7

ENV LD_LIBRARY_PATH=/usr/local/lib/python3.10/dist-packages/tensorrt_libs/



