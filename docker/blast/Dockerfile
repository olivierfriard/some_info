# Docker for bioinformatic
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install base system and devel tools
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt update && \
  apt install -y apt-utils && \
  apt upgrade -y && \
  apt install -y locales && \
  apt install -y libssl-dev libgit2-dev

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
        && locale-gen en_US.utf8 \
        && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt install -y ncbi-blast+ exonerate wget mafft vim  # ngs genewise
RUN apt install -y emboss

RUN rm -rf /var/lib/apt/lists/*


