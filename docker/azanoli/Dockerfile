# Docker for acoustic analysis

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

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt install -y gcc
RUN apt install -y curl
RUN apt install -y ffmpeg
RUN apt install -y hdf5-tools

RUN apt install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt install -y python3.10 python3.10-distutils python3.10-dev python3-pip python3.10-venv && curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

RUN apt install -y ca-certificates gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt update
RUN apt install -y nodejs

RUN npm -g i pnpm

RUN apt install -y wget
RUN wget -O v1.3.0.zip https://github.com/sound-scape-explorer/coral-sound-explorer/archive/refs/tags/v1.3.0.zip

RUN apt install -y unzip

RUN unzip v1.3.0.zip


WORKDIR /coral-sound-explorer-1.3.0

RUN python3.10 -m venv venv

# RUN npm init -y

RUN pnpm i 
RUN pnpm install:front


RUN sed -i 's#pip install #pip install --timeout=6000 #g' package.json

RUN pnpm install:processing


# Define default command.
CMD ["bash"]


