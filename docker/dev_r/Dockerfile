# R Docker

FROM ubuntu:22.04

ARG r_version=4.4.1

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
##RUN apt-get install -y xpdf  # No available in 20.04
##RUN apt-get install -y firefox
RUN apt-get install -y libreadline-dev
#RUN apt-get install -y texlive-latex-base
#RUN apt-get install -y texlive-fonts-recommended
#RUN apt-get install -y texlive-fonts-extra
#RUN apt-get install -y texlive-latex-extra
#RUN apt-get install -y texinfo
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

# for sf / stars
RUN apt-get install -y libudunits2-dev

# for rgdal
RUN apt-get install -y libgdal-dev gdal-bin libproj-dev proj-data proj-bin libgeos-dev


# Compile and install an R in portable version
WORKDIR /tmp
RUN wget https://cran.r-project.org/src/base/R-4/R-${r_version}.tar.gz -O R-${r_version}.tar.gz

RUN tar zxf R-${r_version}.tar.gz
WORKDIR R-${r_version}
RUN ./configure --prefix=/opt/PortableR --enable-static=yes --enable-shared=yes --enable-R-shlib --with-tcltk

RUN make -j 8
RUN make install

WORKDIR /bin
RUN ln -s /opt/PortableR/bin/* .

WORKDIR /

#Setup CRAN mirror
COPY files/Rprofile.site /opt/PortableR/lib/R/etc


# install R packages

RUN export MAKE="make -j20"

# install "remotes" for installing all other packages
RUN R -e "p='remotes'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"

COPY  install_r_package_version.bash /

COPY  install_r_package.bash /


#RUN bash /install_r_package_version.bash R2jags 0.7.1.1

RUN bash /install_r_package.bash sf

RUN bash /install_r_package.bash ggplot2

RUN bash /install_r_package_from_github.bash pimentel/cluster

# RUN R -e "p='R2jags'; list.of.packages <- c(p); new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,'Package'])]; if (length(new.packages)) remotes::install_version(p, "0.7.1.1", dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"

# RUN R -e "p='sf'; list.of.packages <- c(p); new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,'Package'])]; if (length(new.packages)) install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"

# RUN R -e "p='ggplot2'; list.of.packages <- c(p); new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,'Package'])]; if (length(new.packages)) install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"



# Define default command.
CMD ["bash"]

