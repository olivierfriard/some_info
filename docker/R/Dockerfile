FROM ubuntu:24.04

ARG r_version=4.5.3
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TZ=Etc/UTC

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# ---------------------------------------------------------------------
# Base OS packages
# ---------------------------------------------------------------------
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      apt-utils \
      build-essential \
      ca-certificates \
      cmake \
      curl \
      g++ \
      gfortran \
      git \
      htop \
      locales \
      make \
      man \
      pkg-config \
      software-properties-common \
      unzip \
      vim \
      wget \
      xz-utils; \
    rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen; \
    locale-gen en_US.UTF-8; \
    update-locale LANG=en_US.UTF-8

# ---------------------------------------------------------------------
# System libraries for compiling R and common R packages
# ---------------------------------------------------------------------
RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      default-jdk \
      jags \
      libcairo-dev \
      libbz2-dev \
      libcurl4-openssl-dev \
      libfftw3-dev \
      libfribidi-dev \
      libgdal-dev \
      libgeos-dev \
      libgit2-dev \
      libglpk-dev \
      libgmp3-dev \
      libgsl-dev \
      libharfbuzz-dev \
      libicu-dev \
      libjpeg-dev \
      liblzma-dev \
      libmagick++-dev \
      libmpfr-dev \
      libopenmpi-dev \
      libpcre2-dev \
      libproj-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      libtiff-dev \
      libudunits2-dev \
      libxml2-dev \
      openmpi-bin \
      proj-bin \
      proj-data \
      gdal-bin \
      tk8.6-dev \
      xorg-dev; \
    rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------------------
# Build and install R from source
# ---------------------------------------------------------------------
WORKDIR /tmp

RUN set -eux; \
    wget "https://cran.r-project.org/src/base/R-4/R-${r_version}.tar.gz" -O "R-${r_version}.tar.gz"; \
    tar -xzf "R-${r_version}.tar.gz"

WORKDIR /tmp/R-${r_version}

RUN set -eux; \
    ./configure \
      --prefix=/opt/PortableR \
      --enable-R-shlib \
      --enable-shared \
      --enable-static \
      --with-tcltk; \
    make -j"$(nproc)"; \
    make install

RUN set -eux; \
    ln -s /opt/PortableR/bin/R /usr/local/bin/R; \
    ln -s /opt/PortableR/bin/Rscript /usr/local/bin/Rscript

WORKDIR /

COPY Rprofile.site /opt/PortableR/lib/R/etc/Rprofile.site
COPY files/Boruta_8.0.0.tar.gz /tmp/Boruta_8.0.0.tar.gz

# ---------------------------------------------------------------------
# Bootstrap pak
# ---------------------------------------------------------------------
RUN R -q -e "install.packages('pak', repos='https://cloud.r-project.org', Ncpus=parallel::detectCores()); stopifnot(requireNamespace('pak', quietly=TRUE))"

# ---------------------------------------------------------------------
# Install packages in smaller, more stable groups
# Retired/archived packages removed:
# - rgdal
# - mcmcplots
# - TSclust
# - TSdist
# Base/recommended packages omitted:
# - MASS, mgcv, nlme, lattice, class, splines
# ---------------------------------------------------------------------
RUN cat >/tmp/install_packages.R <<'EOF'
options(repos = c(CRAN = "https://cloud.r-project.org"))

install_group <- function(name, pkgs) {
  message("\n==> Installing group: ", name)
  message(paste(pkgs, collapse = ", "))
  pak::pkg_install(pkgs, ask = FALSE)
}

install_group("core-1", c(
  "ade4", "adehabitatHR", "agricolae", "amt", "apcluster", "ape",
  "assertthat", "audio", "bindrcpp", "coda", "corrplot", "ctv",
  "digest", "diptest", "doParallel", "dplyr", "dygraphs", "e1071",
  "ellipse", "foreach", "fs", "functional", "glue", "gridExtra",
  "gtable", "gtools", "hopkins", "kernlab", "lazyeval", "lubridate",
  "magrittr", "matrixStats", "mcclust", "mclust", "MetBrewer",
  "mlbench", "multcompView", "mvtnorm", "NbClust", "pkgconfig",
  "plyr", "purrr", "R6", "RANN", "Rcpp", "RcppArmadillo",
  "RcppCNPy", "RcppProgress", "rdist", "readr", "reshape2", "rlang",
  "RSQLite", "R.utils", "scales", "snow", "sp", "spaa",
  "splines2", "stringr", "tibble", "tidyr", "xts"
))

install_group("core-2", c(
  "bayesdfa", "car", "caret", "caTools", "clue", "clustertend",
  "clValid", "correctR", "crqa", "dendextend", "devtools", "dtw",
  "dtwclust", "factoextra", "FactoMineR", "FD", "flexmix", "fossil",
  "fpc", "gdtools", "geometry", "ggplot2", "ggpubr", "ggrepel",
  "ggthemes", "glmmTMB", "gmp", "Hmsc", "landscapemetrics",
  "MCMCglmm", "ModelMetrics", "monitoR", "move", "moveHMM",
  "ncdf4", "nimble", "nimbleSCR", "MuMIn", "OpenImageR",
  "parallelDist", "pdist", "permute", "prabclus", "pvclust",
  "randomForest", "ranger", "Rmisc", "robustbase", "ROCR", "RSNNS",
  "seewave", "sjmisc", "smacof", "soundecology", "soundgen",
  "tclust", "tidymodels", "tidyverse", "trimcluster", "tuneR",
  "umap", "unmarked", "usdm", "vegan", "vegclust", "warbleR"
))

install_group("spatial", c(
  "exactextractr", "fasterize", "osmextract", "raster",
  "rasterVis", "sf", "stars"
))

install_group("jags", c(
  "jagsUI", "R2jags", "runjags"
))

install_group("stan", c(
  "rstantools", "StanHeaders", "rstan"
))
EOF

RUN Rscript /tmp/install_packages.R

RUN R -q -e "if (file.exists('/tmp/Boruta_8.0.0.tar.gz')) pak::pkg_install('local::/tmp/Boruta_8.0.0.tar.gz', ask = FALSE)"

CMD ["bash"]
