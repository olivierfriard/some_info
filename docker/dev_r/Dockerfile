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
# RUN apt-get install -y firefox
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

# for sf / stars
RUN apt-get install -y libudunits2-dev

# for rgdal
RUN apt-get install -y libgdal-dev gdal-bin libproj-dev proj-data proj-bin libgeos-dev

# download R sources
RUN apt-get install -y wget

# Compile and install an R in portable version
WORKDIR /tmp
RUN wget https://cran.r-project.org/src/base/R-4/R-4.2.2.tar.gz -O R-4.2.2.tar.gz

RUN tar zxf R-4.2.2.tar.gz
WORKDIR R-4.2.2
RUN ./configure --prefix=/opt/PortableR --enable-static=yes --enable-shared=yes --enable-R-shlib --with-tcltk

RUN make
RUN make install

WORKDIR /bin
RUN ln -s /opt/PortableR/bin/* .

WORKDIR /

# Setup CRAN mirror
COPY files/Rprofile.site /opt/PortableR/lib/R/etc

#RUN /opt/PortableR/bin/R --version
#RUN /opt/PortableR/bin/R -e "install.packages('littler')" && cd /bin && ln -s /opt/PortableR/lib/R/library/littler/bin/r .

# Tag the image with the actual repo commit
COPY BUILD_COMMIT /BUILD_COMMIT

# Dump all packages installed with it's version
# RUN dpkg -l > /PKG_LIST

# Define default command.
CMD ["bash"]

# install packages

# ARG R_REMOTES_NO_ERRORS_FROM_WARNINGS=false


COPY files/install_packages.R /
COPY files/packages_list.txt /
RUN Rscript /install_packages.R

