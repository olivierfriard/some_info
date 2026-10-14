FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV CONDA_DIR=/opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# System deps
RUN apt-get update && apt-get install -y \
    wget \
    bzip2 \
    git \
    nano \
    micro \
    gcc \
    g++ \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p $CONDA_DIR && \
    rm /tmp/miniconda.sh && \
    $CONDA_DIR/bin/conda clean -afy

# Make conda available in non-interactive shells
SHELL ["/bin/bash", "-c"]
RUN conda init bash

RUN git clone https://github.com/stellalessandra/ClearMap2.git

WORKDIR /ClearMap2

RUN git switch dev/nico

RUN sed -i 's#pytorch=1.0.0=py3.6_cuda9.0.176_cudnn7.4.1_1#pytorch#g' ClearMap_stable.yml

RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main

RUN conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

RUN conda env create -f ClearMap_stable.yml

COPY analysis_until_alignment.py /ClearMap2/ClearMap/Scripts

COPY analysis_after_alignment.py /ClearMap2/ClearMap/Scripts

RUN apt update && apt install -y libgl1

COPY configfile.yaml /ClearMap2/ClearMap/Scripts

RUN apt-get update && apt-get install -y \
    libxcb-xinerama0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-render-util0 \
    libxcb-shape0 \
    libxcb-cursor0 \
    libxkbcommon-x11-0 \
    libx11-xcb1 

RUN apt install  -y xvfb

# Default command
CMD ["bash"]
