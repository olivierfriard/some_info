# R Docker

FROM ubuntu:24.04

ARG r_version=4.5.3

ENV DEBIAN_FRONTEND=noninteractive

# Install base system and devel tools
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y apt-utils && \
  #apt-get -y upgrade && \
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
RUN apt install -y openmpi-*
RUN apt install -y gfortran libreadline-dev xorg-dev libbz2-dev liblzma-dev libpcre3-dev libcurl4-openssl-dev
RUN apt install -y libtiff-dev libjpeg-dev libicu-dev libcairo-dev default-jdk tk8.6-dev libpcre2-dev libxml2-dev
RUN apt install -y cmake libfftw3-dev libgmp3-dev libfribidi-dev libharfbuzz-dev libglpk-dev


# Compile and install an R in portable version
WORKDIR /tmp
RUN wget https://cran.r-project.org/src/base/R-4/R-${r_version}.tar.gz -O R-${r_version}.tar.gz

RUN tar zxf R-${r_version}.tar.gz
WORKDIR R-${r_version}
RUN ./configure --prefix=/opt/PortableR --enable-static=yes --enable-shared=yes --enable-R-shlib --with-tcltk

RUN make -j$(nproc); make install

WORKDIR /bin
RUN ln -s /opt/PortableR/bin/* .

WORKDIR /

#Setup CRAN mirror
COPY Rprofile.site /opt/PortableR/lib/R/etc


# Define default command.
CMD ["bash"]


# install R packages

# install "remotes" for installing all other packages
RUN R -e "p='remotes'; install.packages(p, dependencies=TRUE, Ncpus=parallel::detectCores()); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"


COPY install_r_package.R /

# required for R package terra
RUN apt install -y libudunits2-dev
RUN apt install -y libgdal-dev gdal-bin libproj-dev proj-data proj-bin libgeos-dev

RUN Rscript /install_r_package.R terra sf tidyverse umap univariateML dbscan cluster apcluster
 

