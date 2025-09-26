# Docker for Francesca Terranova

# dtwave, praat, sox, ffmpeg, ffprobe
# python: pandas, numpy, matplotlib, scipy, librosa, parselmouth, opencv, pykanto, soundsig ...
# R: soundecology, seewave, hardRain

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

RUN apt install git -y
RUN apt install libeigen3-dev -y
RUN apt install libboost-all-dev -y

RUN apt install make gcc g++ -y


RUN git clone https://github.com/dipetkov/eems.git

WORKDIR /eems/runeems_sats/src

#RUN sed -i 's|/usr/local/opt/include/eigen3|/usr/include/eigen3|' Makefile

COPY Makefile .

RUN make linux

RUN ls -l

# Define default command.
CMD ["bash"]


