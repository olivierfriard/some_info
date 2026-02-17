# R Docker

FROM ubuntu:24.04

ARG r_version=4.5.2

ENV DEBIAN_FRONTEND=noninteractive

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

# for amt
RUN apt-get install -y libmagick++-dev

# for sf / stars
RUN apt-get install -y libudunits2-dev

# for rgdal
RUN apt-get install -y libgdal-dev gdal-bin libproj-dev proj-data proj-bin libgeos-dev

# for rjags
RUN apt-get install -y jags

# for amt
RUN apt-get install -y libmpfr-dev; apt-get install -y libgsl-dev



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
COPY files/Rprofile.site /opt/PortableR/lib/R/etc


# Define default command.
CMD ["bash"]


# R package exceptions
COPY files/Boruta_8.0.0.tar.gz /

# install R packages

# install "remotes" for installing all other packages
RUN R -e "p='remotes'; install.packages(p, dependencies=TRUE, Ncpus=parallel::detectCores()); if (!library(p, character.only=TRUE, logical.return=T)) quit(status=10)"


COPY  install_r_package_version.bash /
COPY  install_r_package.bash /

RUN export MAKE="make -j20"


RUN bash /install_r_package.bash abind; bash /install_r_package.bash ade4; bash /install_r_package.bash adehabitatHR; bash /install_r_package.bash agricolae; bash /install_r_package.bash amt; bash /install_r_package.bash apcluster; bash /install_r_package.bash ape; bash /install_r_package.bash assertthat; bash /install_r_package.bash audio

RUN bash /install_r_package.bash bayesdfa; bash /install_r_package.bash bindrcpp; bash /install_r_package.bash car

RUN bash /install_r_package.bash caret; bash /install_r_package.bash caTools; bash /install_r_package.bash class; bash /install_r_package.bash clue; bash /install_r_package.bash clustertend; bash /install_r_package.bash clValid; bash /install_r_package.bash coda; bash /install_r_package.bash correctR; bash /install_r_package.bash corrplot; bash /install_r_package.bash ctv

RUN bash /install_r_package.bash dendextend; bash /install_r_package.bash devtools; bash /install_r_package.bash digest; bash /install_r_package.bash diptest; bash /install_r_package.bash doParallel; bash /install_r_package.bash dplyr; bash /install_r_package.bash dtw; bash /install_r_package.bash dtwclust; bash /install_r_package.bash dygraphs

RUN bash /install_r_package.bash e1071; bash /install_r_package.bash ellipse; bash /install_r_package.bash factoextra

RUN bash /install_r_package.bash FactoMineR; bash /install_r_package.bash fasterize; bash /install_r_package.bash FD; bash /install_r_package.bash flexmix; bash /install_r_package.bash fossil; bash /install_r_package.bash foreach; bash /install_r_package.bash fpc; bash /install_r_package.bash fs; bash /install_r_package.bash functional

RUN bash /install_r_package.bash gdtools; bash /install_r_package.bash geometry; bash /install_r_package.bash ggplot2; bash /install_r_package.bash ggpubr; bash /install_r_package.bash ggrepel; bash /install_r_package.bash ggthemes

RUN bash /install_r_package.bash glmmTMB; bash /install_r_package.bash glue; bash /install_r_package.bash gmp; bash /install_r_package.bash gridExtra; bash /install_r_package.bash gtable; bash /install_r_package.bash gtools

RUN bash /install_r_package.bash jagsUI

RUN bash /install_r_package.bash Hmsc; bash /install_r_package.bash hopkins

RUN bash /install_r_package.bash kernlab

RUN bash /install_r_package.bash landscapemetrics; bash /install_r_package.bash lattice; bash /install_r_package.bash lazyeval; bash /install_r_package.bash lubridate


RUN bash /install_r_package.bash magrittr; bash /install_r_package.bash MASS; bash /install_r_package.bash matrixStats; bash /install_r_package.bash mcclust; bash /install_r_package.bash mclust ;bash /install_r_package.bash MCMCglmm; bash /install_r_package.bash mcmcplots; bash /install_r_package.bash MetBrewer; bash /install_r_package.bash mgcv; bash /install_r_package.bash mlbench; bash /install_r_package.bash ModelMetrics; bash /install_r_package.bash monitoR; bash /install_r_package.bash move; bash /install_r_package.bash moveHMM; bash /install_r_package.bash multcompView; bash /install_r_package.bash mvtnorm


RUN bash /install_r_package.bash NbClust; bash /install_r_package.bash ncdf4; bash /install_r_package.bash nimble; bash /install_r_package.bash nimbleSCR; bash /install_r_package.bash nlme


RUN bash /install_r_package.bash MuMIn


RUN bash /install_r_package.bash OpenImageR; bash /install_r_package.bash osmextract


RUN bash /install_r_package.bash parallelDist; bash /install_r_package.bash pdist; bash /install_r_package.bash permute; bash /install_r_package.bash pkgconfig; bash /install_r_package.bash plyr; bash /install_r_package.bash prabclus; bash /install_r_package.bash purrr; bash /install_r_package.bash pvclust; bash /install_r_package.bash R2jags


RUN bash /install_r_package.bash R6; bash /install_r_package.bash randomForest; bash /install_r_package.bash ranger; bash /install_r_package.bash RANN; bash /install_r_package.bash raster; bash /install_r_package.bash rasterVis; bash /install_r_package.bash Rcpp; bash /install_r_package.bash RcppArmadillo; bash /install_r_package.bash RcppCNPy; bash /install_r_package.bash RcppProgress; bash /install_r_package.bash rdist; bash /install_r_package.bash readr; bash /install_r_package.bash rgdal; bash /install_r_package.bash reshape2; bash /install_r_package.bash rlang; bash /install_r_package.bash Rmisc; bash /install_r_package.bash robustbase; bash /install_r_package.bash ROCR; bash /install_r_package.bash RSNNS; bash /install_r_package.bash RSQLite; bash /install_r_package.bash R.utils; bash /install_r_package.bash runjags


RUN bash /install_r_package.bash scales; bash /install_r_package.bash seewave; bash /install_r_package.bash sf; bash /install_r_package.bash sjmisc; bash /install_r_package.bash smacof; bash /install_r_package.bash snow


RUN bash /install_r_package.bash soundecology; bash /install_r_package.bash soundgen; bash /install_r_package.bash sp; bash /install_r_package.bash spaa; bash /install_r_package.bash splines2; bash /install_r_package.bash stars; bash /install_r_package.bash stringr


RUN bash /install_r_package.bash tclust; bash /install_r_package.bash tibble; bash /install_r_package.bash tidymodels; bash /install_r_package.bash tidyr; bash /install_r_package.bash tidyverse; bash /install_r_package.bash trimcluster; bash /install_r_package.bash TSclust; bash /install_r_package.bash TSdist; bash /install_r_package.bash tuneR


RUN bash /install_r_package.bash umap; bash /install_r_package.bash unmarked; bash /install_r_package.bash usdm


RUN bash /install_r_package.bash vegan; bash /install_r_package.bash vegclust; bash /install_r_package.bash warbleR

RUN bash /install_r_package.bash xts

RUN bash /install_r_package.bash exactextractr

COPY install_r_package_from_github.bash /

RUN bash /install_r_package_from_github.bash pimentel/cluster
RUN bash /install_r_package_from_github.bash Cdevenish/hardRain

#RUN bash /install_r_package.bash local:Boruta_8.0.0.tar.gz Boruta

COPY install_r_package_from_bioconductor.bash /

RUN bash /install_r_package_from_bioconductor.bash phyloseq


RUN bash /install_r_package.bash PAMmisc

RUN bash /install_r_package.bash crqa

RUN apt install -y gdal-bin libgdal-dev

RUN bash /install_r_package.bash SpaDES 

RUN bash /install_r_package.bash NetLogoR

RUN bash /install_r_package.bash fastmatch

RUN R -q -e "install.packages('box', Ncpus=parallel::detectCores()); stopifnot(requireNamespace('box', quietly=TRUE))"

RUN bash /install_r_package.bash grid

RUN bash /install_r_package.bash fpCompare


