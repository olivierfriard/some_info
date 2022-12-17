# Dockerfile to install R with packages defined in install_packages.R


FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

# Install base system and devel tools

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y apt-utils && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git man unzip && \
  apt-get install -y locales && \
  apt-get install -y libssl-dev libgit2-dev 

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt -y install r-base 

RUN apt -y install libxml2-dev
RUN apt -y install libcurl4-openssl-dev
RUN apt -y install libgdal-dev
RUN apt -y install libudunits2-dev
RUN apt -y install libgmp3-dev
RUN apt -y install libv8-dev
RUN apt -y install libmagick++-dev

ARG R_REMOTES_NO_ERRORS_FROM_WARNINGS=false

ADD install_packages.R /

COPY Require_0.1.4.tar.gz /
COPY SpaDES.tools_1.0.0.tar.gz /
COPY NetLogoR_0.3.11.tar.gz /
COPY pedantics_1.7.tar.gz /


RUN R -f /install_packages.R

