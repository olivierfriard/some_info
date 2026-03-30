# Docker for acoustic analysis

# dtwave, praat, sox, ffmpeg, ffprobe
# python: pandas, numpy, matplotlib, scipy, librosa, parselmouth, opencv, pykanto, soundsig ...
# R: soundecology, seewave, hardRain

FROM ubuntu:24.04


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




RUN apt install git -y


RUN wget -q https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh

RUN bash Miniforge3-Linux-x86_64.sh -b -p /miniforge3

RUN rm Miniforge3-Linux-x86_64.sh

# RUN source /miniforge3/etc/profile.d/conda.sh


RUN git clone https://github.com/CAAIPD/DEERFold.git

RUN cd DEERFold

RUN cat << 'EOT' > deerfold_env_fixed.yml
name: deerfold_venv
channels:
  - pytorch
  - nvidia
  - conda-forge
  - bioconda
dependencies:
  - python=3.9
  - pip
  - openmm=7.5.1
  - pdbfixer
  - aria2
  - hmmer=3.3.2
  - hhsuite=3.3.0
  - kalign2=2.04
  - matplotlib=3.5.3
  - pytorch=1.13.0 
  - torchaudio=0.13.0
  - torchvision=0.14.0
  - pytorch-cuda=11.7
  - mdanalysis
  - pip:
      - pandas==1.3.5
      - biopython==1.79
      - deepspeed==0.5.10
      - dm-tree==0.1.6
      - ml-collections==0.1.0
      - numpy==1.21.5
      - PyYAML==5.4.1
      - requests==2.26.0
      - scipy==1.7.1
      - tqdm==4.62.2
      - typing-extensions==3.10.0.2
      - pytorch_lightning==1.5.0
      - wandb==0.12.21
      - chilife
      - git+https://github.com/NVIDIA/dllogger.git
EOT

RUN /miniforge3/bin/mamba env create -f deerfold_env_fixed.yml




# Define default command.
CMD ["bash"]


