# Docker for acoustic analysis

# dtwave, praat, sox, ffmpeg, ffprobe
# python: pandas, numpy, matplotlib, scipy, librosa, parselmouth, opencv, pykanto, soundsig ...
# R: soundecology, seewave, hardRain

FROM ubuntu:24.04


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


RUN wget -q https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh

RUN bash Miniforge3-Linux-x86_64.sh -b -p /miniforge3

RUN rm Miniforge3-Linux-x86_64.sh

# RUN source /miniforge3/etc/profile.d/conda.sh


RUN git clone https://github.com/CAAIPD/DEERFold.git

RUN cd DEERFold

COPY deerfold_env.yml .

RUN /miniforge3/bin/mamba env create -f deerfold_env.yml




# Define default command.
CMD ["bash"]


