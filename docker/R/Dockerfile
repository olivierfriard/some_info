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

# for rjags
RUN apt-get install -y jags


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


# Define default command.
CMD ["bash"]


# R package exceptions
COPY files/Boruta_8.0.0.tar.gz /

# install R packages

# install "remotes" for installing all other packages
RUN R -e "p='remotes'; install.packages(p, dependencies=TRUE); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"


COPY  install_r_package_version.bash /

COPY  install_r_package.bash /

COPY  install_r_package_from_github.bash /

RUN export MAKE="make -j20"


RUN bash /install_r_package.bash abind; bash /install_r_package.bash ade4; bash /install_r_package.bash adehabitatHR; bash /install_r_package.bash agricolae; bash /install_r_package.bash amt; bash /install_r_package.bash apcluster; bash /install_r_package.bash ape; bash /install_r_package.bash assertthat; bash /install_r_package.bash audio

RUN bash /install_r_package.bash bayesdfa; bash /install_r_package.bash bindrcpp; bash /install_r_package.bash car

RUN bash /install_r_package.bash caret; bash /install_r_package.bash caTools; bash /install_r_package.bash class; bash /install_r_package.bash clue; bash /install_r_package.bash clustertend; bash /install_r_package.bash clValid; bash /install_r_package.bash coda; bash /install_r_package.bash correctR; bash /install_r_package.bash corrplot; bash /install_r_package.bash ctv

RUN bash /install_r_package.bash dendextend; bash /install_r_package.bash devtools; bash /install_r_package.bash digest; bash /install_r_package.bash diptest; bash /install_r_package.bash doParallel; bash /install_r_package.bash dplyr; bash /install_r_package.bash dtw; bash /install_r_package.bash dtwclust; bash /install_r_package.bash dygraphs

RUN bash /install_r_package.bash e1071; bash /install_r_package.bash ellipse; bash /install_r_package.bash factoextra

RUN bash /install_r_package.bash FactoMineR; bash /install_r_package.bash fasterize; bash /install_r_package.bash FD; bash /install_r_package.bash flexmix; bash /install_r_package.bash fossil; bash /install_r_package.bash foreach; bash /install_r_package.bash fpc; bash /install_r_package.bash fs; bash /install_r_package.bash functional

RUN bash /install_r_package.bash gdtools
RUN bash /install_r_package.bash geometry
RUN bash /install_r_package.bash ggplot2
RUN bash /install_r_package.bash ggpubr
RUN bash /install_r_package.bash ggrepel
RUN bash /install_r_package.bash ggthemes
RUN bash /install_r_package.bash glue
RUN bash /install_r_package.bash gmp
RUN bash /install_r_package.bash gridExtra
RUN bash /install_r_package.bash gtable
RUN bash /install_r_package.bash gtools

RUN bash /install_r_package.bash jagsUI

RUN bash /install_r_package.bash Hmsc; bash /install_r_package.bash hopkins

RUN bash /install_r_package.bash kernlab

RUN bash /install_r_package.bash landscapemetrics; bash /install_r_package.bash lattice; bash /install_r_package.bash lazyeval; bash /install_r_package.bash lubridate

RUN bash /install_r_package.bash magrittr
RUN bash /install_r_package.bash MASS
RUN bash /install_r_package.bash matrixStats
RUN bash /install_r_package.bash mcclust
RUN bash /install_r_package.bash mclust
RUN bash /install_r_package.bash MCMCglmm
RUN bash /install_r_package.bash mcmcplots
RUN bash /install_r_package.bash MetBrewer
RUN bash /install_r_package.bash mgcv
RUN bash /install_r_package.bash mlbench
RUN bash /install_r_package.bash ModelMetrics
RUN bash /install_r_package.bash monitoR
RUN bash /install_r_package.bash move
RUN bash /install_r_package.bash moveHMM
RUN bash /install_r_package.bash multcompView
RUN bash /install_r_package.bash mvtnorm

RUN bash /install_r_package.bash NbClust
RUN bash /install_r_package.bash ncdf4
RUN bash /install_r_package.bash nimble
RUN bash /install_r_package.bash nimbleSCR
RUN bash /install_r_package.bash nlme
RUN bash /install_r_package.bash MuMIn
RUN bash /install_r_package.bash OpenImageR
RUN bash /install_r_package.bash osmextract
RUN bash /install_r_package.bash parallelDist
RUN bash /install_r_package.bash pdist
RUN bash /install_r_package.bash permute
RUN bash /install_r_package.bash pkgconfig
RUN bash /install_r_package.bash plyr
RUN bash /install_r_package.bash prabclus
RUN bash /install_r_package.bash purrr
RUN bash /install_r_package.bash pvclust
RUN bash /install_r_package.bash R2jags
RUN bash /install_r_package.bash R6
RUN bash /install_r_package.bash randomForest
RUN bash /install_r_package.bash ranger
RUN bash /install_r_package.bash RANN
RUN bash /install_r_package.bash raster
RUN bash /install_r_package.bash rasterVis
RUN bash /install_r_package.bash Rcpp
RUN bash /install_r_package.bash RcppArmadillo
RUN bash /install_r_package.bash RcppCNPy
RUN bash /install_r_package.bash RcppProgress
RUN bash /install_r_package.bash rdist
RUN bash /install_r_package.bash readr
RUN bash /install_r_package.bash reshape2
RUN bash /install_r_package.bash rlang
RUN bash /install_r_package.bash Rmisc
RUN bash /install_r_package.bash robustbase
RUN bash /install_r_package.bash ROCR
RUN bash /install_r_package.bash RSNNS
RUN bash /install_r_package.bash RSQLite
RUN bash /install_r_package.bash R.utils
RUN bash /install_r_package.bash runjags
RUN bash /install_r_package.bash scales
RUN bash /install_r_package.bash seewave
RUN bash /install_r_package.bash sf
RUN bash /install_r_package.bash sjmisc
RUN bash /install_r_package.bash smacof
RUN bash /install_r_package.bash snow
RUN bash /install_r_package.bash soundecology
RUN bash /install_r_package.bash soundgen
RUN bash /install_r_package.bash sp
RUN bash /install_r_package.bash spaa
RUN bash /install_r_package.bash splines2
RUN bash /install_r_package.bash stars
RUN bash /install_r_package.bash stringr
RUN bash /install_r_package.bash tclust
RUN bash /install_r_package.bash tibble
RUN bash /install_r_package.bash tidymodels
RUN bash /install_r_package.bash tidyr
RUN bash /install_r_package.bash tidyverse
RUN bash /install_r_package.bash trimcluster
RUN bash /install_r_package.bash TSclust
RUN bash /install_r_package.bash TSdist
RUN bash /install_r_package.bash tuneR
RUN bash /install_r_package.bash umap
RUN bash /install_r_package.bash unmarked
RUN bash /install_r_package.bash usdm
RUN bash /install_r_package.bash vegan
RUN bash /install_r_package.bash vegclust
RUN bash /install_r_package.bash warbleR
RUN bash /install_r_package.bash xts

RUN bash /install_r_package_from_github.bash pimentel/cluster
RUN bash /install_r_package_from_github.bash Cdevenish/hardRain

#RUN bash /install_r_package.bash local:Boruta_8.0.0.tar.gz Boruta
#RUN bash /install_r_package.bash bioconductor:phyloseq phyloseq







