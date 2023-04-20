# Docker for acoustic analysis

# dtwave, praat, sox, ffmpeg, ffprobe
# python: pandas, numpy, matplotlib, scipy, librosa, parselmouth, opencv, pykanto, soundsig ...
# R 4.2.3: soundecology, seewave, hardRain

FROM ubuntu:22.04

ARG r_version=4.2.3

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

RUN apt install praat -y

RUN apt install -y lib32stdc++6
RUN apt install -y sox
RUN apt install -y ffmpeg
RUN apt install -y libimage-exiftool-perl

# RUN apt-get install openjdk-8-jre -y
# RUN apt-get install weka -y


# for R
RUN apt install -y openmpi-*
RUN apt install -y gfortran
RUN apt install -y libreadline-dev
RUN apt install -y xorg-dev
RUN apt install -y libbz2-dev
RUN apt install -y liblzma-dev
RUN apt install -y libpcre3-dev
RUN apt install -y libcurl4-openssl-dev
RUN apt install -y libtiff-dev
RUN apt install -y libjpeg-dev
RUN apt install -y libicu-dev
RUN apt install -y libcairo-dev
RUN apt install -y default-jdk
RUN apt install -y tk8.6-dev
RUN apt install -y libpcre2-dev
RUN apt install -y libxml2-dev

RUN apt -y install libgdal-dev
RUN apt -y install libxml2-dev libssl-dev libcurl4-openssl-dev
RUN apt -y install libsndfile1-dev
RUN apt -y install libfftw3-dev
RUN apt -y install libtiff-dev
RUN apt -y install libgmp3-dev
RUN apt -y install libudunits2-dev
RUN apt install -y libfribidi-dev
RUN apt install -y libharfbuzz-dev

RUN apt -y install flac
RUN apt -y install rename
RUN apt -y install mmv

RUN apt -y install tilde

RUN apt install -y pypy
RUN apt install -y python3-pip


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


# Setup CRAN mirror
COPY Rprofile.site /opt/PortableR/lib/R/etc

# install R packages listed in
RUN export MAKE="make -j24"

ADD install_packages.R /
ADD packages_list.txt /
RUN R -f /install_packages.R


# python modules

RUN pip3 install numba

RUN pip3 install librosa
RUN pip3 install pandas
RUN pip3 install numpy
RUN pip3 install matplotlib
RUN pip3 install scipy
RUN pip3 install praat-parselmouth
RUN pip3 install scikit-maad

RUN pip3 install opencv-python-headless

RUN pip3 install soundsig
RUN pip3 install pykanto
RUN pip3 install pytz
RUN pip3 install exifread

# dtwave dist
ADD scripts/dtwave_dist /bin
RUN chmod +x /bin/dtwave_dist

ADD scripts/dtwave_unix /bin
RUN chmod +x /bin/dtwave_unix

ADD scripts/HCopy /bin
RUN chmod +x /bin/HCopy

# praat CC
ADD scripts/praat_cc /bin
RUN chmod +x /bin/praat_cc

# 3rd octave with praat/parselmouth
ADD scripts/3rd_octave /bin
RUN chmod +x /bin/3rd_octave

ADD scripts/3rd_octave_singlecore_vpiccola /bin
RUN chmod +x /bin/3rd_octave_singlecore_vpiccola



## freq bin with praat
# ADD freq_bin /bin
# RUN chmod +x /bin/freq_bin

# Acoustic indices

# verify WAV (tuneR)
ADD scripts/verify_wav /bin
RUN chmod +x /bin/verify_wav

# wav info
ADD scripts/wav_info /bin
RUN chmod +x /bin/wav_info

# ACI with R (soundecology)
ADD scripts/aci /bin
RUN chmod +x /bin/aci
ADD scripts/aci_multi /bin
RUN chmod +x /bin/aci_multi


# ACI with R (seewave)
ADD scripts/aci_seewave /bin
RUN chmod +x /bin/aci_seewave


# ADI with R
ADD scripts/adi /bin
RUN chmod +x /bin/adi

ADD scripts/adi_multi /bin
RUN chmod +x /bin/adi_multi


# Bioacoustic index with R
ADD scripts/bioacoust_index /bin
RUN chmod +x /bin/bioacoust_index

# NDSI with R
ADD scripts/ndsi /bin
RUN chmod +x /bin/ndsi
ADD scripts/ndsi_multi /bin
RUN chmod +x /bin/ndsi_multi


# AR with R (seewave)
ADD scripts/ar /bin
RUN chmod +x /bin/ar

# Total Entropy( (h) with R (seewave and soundecology)
ADD scripts/h /bin
RUN chmod +x /bin/h

ADD scripts/h_multi /bin
RUN chmod +x /bin/h_multi


# rename audiomoth files
ADD scripts/rename_audiomoth_files /bin
RUN chmod +x /bin/rename_audiomoth_files


# acoustic indices with python

#RUN pip3 install pyYAML
#ADD scripts/acoustic_indices_python/acoustic_index.py /
#ADD scripts/acoustic_indices_python/compute_indice.py /
#ADD scripts/acoustic_indices_python/ai_dir.py /




