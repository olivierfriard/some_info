# R Docker

FROM ubuntu:22.04

ARG r_version=4.3.3

ENV DEBIAN_FRONTEND noninteractive

# Install base system and devel tools
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y apt-utils && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git htop man unzip vim wget && \
  apt-get install -y locales && \
  apt-get install -y libssl-dev libgit2-dev 

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

#
# R external dependencies
#
RUN apt-get install -y openmpi-*
RUN apt-get install -y gfortran
RUN apt-get install -y libreadline-dev
RUN apt-get install -y xorg-dev
RUN apt-get install -y libbz2-dev
RUN apt-get install -y liblzma-dev
RUN apt-get install -y libpcre3-dev
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libtiff-dev
RUN apt-get install -y libjpeg-dev
RUN apt-get install -y libicu-dev
RUN apt-get install -y libcairo-dev
RUN apt-get install -y default-jdk
RUN apt-get install -y tk8.6-dev
RUN apt-get install -y libpcre2-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y cmake
RUN apt-get install -y libfftw3-dev
RUN apt-get install -y libgmp3-dev
RUN apt-get install -y libfribidi-dev
RUN apt-get install -y libharfbuzz-dev
RUN apt-get install -y libglpk-dev
RUN apt-get install -y libpoppler-cpp-dev
RUN apt-get install -y libavfilter-dev

# for sf / stars
RUN apt-get install -y libudunits2-dev

# for rgdal
#RUN apt-get install -y libgdal-dev gdal-bin libproj-dev proj-data proj-bin libgeos-dev


# Compile and install an R in portable version
WORKDIR /tmp
RUN wget https://cran.r-project.org/src/base/R-4/R-${r_version}.tar.gz -O R-${r_version}.tar.gz

RUN tar zxf R-${r_version}.tar.gz
WORKDIR R-${r_version}
RUN ./configure --prefix=/opt/PortableR --enable-static=yes --enable-shared=yes --enable-R-shlib --with-tcltk

RUN make -j 20
RUN make install

WORKDIR /bin
RUN ln -s /opt/PortableR/bin/* .

WORKDIR /

#Setup CRAN mirror
COPY Rprofile.site /opt/PortableR/lib/R/etc

# install R packages

RUN export MAKE="make -j20"

RUN R -e "p='remotes'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"

RUN R -e "p='vegan'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"
RUN R -e "p='dplyr'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"
RUN R -e "p='writexl'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"
RUN R -e "p='xlsx'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"
RUN R -e "p='readxl'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"
RUN R -e "p='tidyr'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"
RUN R -e "p='tibble'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"


RUN R -e "p='dada2'; remotes::install_bioc(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"
RUN R -e "p='Biostrings'; remotes::install_bioc(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"
RUN R -e "p='phyloseq'; remotes::install_bioc(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"


RUN R -e "p='microbiome/microbiome'; remotes::install_github(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library("microbiome", logical.return=T)) quit(status=10)"


RUN R -e "p='microsud/microbiomeutilities'; remotes::install_github(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library("microbiomeutilities", logical.return=T)) quit(status=10)"
RUN R -e "p='ChiLiubio/microeco'; remotes::install_github(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library("microeco", logical.return=T)) quit(status=10)"


RUN apt install -y libmpfr-dev
RUN apt install -y libgsl-dev

RUN R -e "p='ggtree'; remotes::install_bioc(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"

RUN R -e "p='microbiomeMarker'; remotes::install_bioc(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"

RUN R -e "p='MicrobiotaProcess'; remotes::install_bioc(p, build_manual=FALSE, build_vignettes=FALSE, upgrade='always'); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"


# Define default command.
CMD ["bash"]

