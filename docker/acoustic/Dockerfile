# Docker for acoustic analysis

# dtwave, praat, sox, ffmpeg, ffprobe
# python: pandas, numpy, matplotlib, scipy, librosa, paarselmouth, opencv
# R 3.6.3: soundecology, seewave


FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

# Install base system and devel tools
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y apt-utils && \
  apt-get -y upgrade && \
  apt-get install -y locales && \
  apt-get install -y libssl-dev libgit2-dev 

RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

RUN apt install praat -y

RUN apt install -y lib32stdc++6
RUN apt install -y sox
RUN apt install -y ffmpeg

# RUN apt-get install openjdk-8-jre -y
# RUN apt-get install weka -y


# for R
RUN apt -y install libgdal-dev
RUN apt -y install r-base  
RUN apt -y install libxml2-dev libssl-dev libcurl4-openssl-dev
RUN apt -y install libsndfile1-dev
RUN apt -y install libfftw3-dev
RUN apt -y install libtiff-dev
RUN apt -y install libgmp3-dev
RUN apt -y install libudunits2-dev

RUN apt -y install flac

RUN apt -y install rename
RUN apt -y install mmv


ADD install_packages.R /

RUN R -f /install_packages.R


# python modules

RUN apt install -y pypy

RUN apt install -y python3-pip

RUN pip3 install numba==0.48.0

RUN pip3 install librosa
RUN pip3 install pandas
RUN pip3 install numpy
RUN pip3 install matplotlib
RUN pip3 install scipy
RUN pip3 install praat-parselmouth
RUN pip3 install scikit-maad

RUN pip3 install opencv-python-headless



# dtwave dist
ADD ../../scripts/dtwave_dist /bin
RUN chmod +x /bin/dtwave_dist

ADD ../../scripts/dtwave_unix /bin
RUN chmod +x /bin/dtwave_unix

ADD ../../scripts/HCopy /bin
RUN chmod +x /bin/HCopy

# praat CC
ADD ../../scripts/praat_cc /bin
RUN chmod +x /bin/praat_cc

# 3rd octave wit praat
ADD ../../scripts/3rd_octave /bin
RUN chmod +x /bin/3rd_octave
ADD 3rd_octave_single /bin
RUN chmod +x /bin/3rd_octave_single



## freq bin with praat
# ADD freq_bin /bin
# RUN chmod +x /bin/freq_bin

# Acoustic indices

# verify WAV (tuneR)
ADD ../../scripts/verify_wav /bin
RUN chmod +x /bin/verify_wav

# wav info
ADD ../../scripts/wav_info /bin
RUN chmod +x /bin/wav_info

# ACI with R (soundecology)
ADD ../../scripts/aci /bin
RUN chmod +x /bin/aci
ADD ../../scripts/aci_multi /bin
RUN chmod +x /bin/aci_multi


# ACI with R (seewave)
ADD ../../scripts/aci_seewave /bin
RUN chmod +x /bin/aci_seewave


# ADI with R
ADD ../../scripts/adi /bin
RUN chmod +x /bin/adi

ADD ../../scripts/adi_multi /bin
RUN chmod +x /bin/adi_multi

# NDSI with R
ADD ../../scripts/ndsi /bin
RUN chmod +x /bin/ndsi
ADD ndsi_multi /bin
RUN chmod +x /bin/ndsi_multi


# AR with R (seewave)
ADD ar /bin
RUN chmod +x /bin/ar


# Total Entropy( (h) with R (seewave and soundecology)
ADD ../../scripts/h /bin
RUN chmod +x /bin/h

ADD ../../scripts/h_multi /bin
RUN chmod +x /bin/h_multi


# rename audiomoth files
ADD ../../scripts/rename_audiomoth_files /bin
RUN chmod +x /bin/rename_audiomoth_files


# acoustic indices with python

RUN pip3 install pyYAML
ADD ../../scripts/acoustic_indices_python/acoustic_index.py /
ADD ../../scripts/acoustic_indices_python/compute_indice.py /
ADD ../../scripts/acoustic_indices_python/ai_dir.py /




