FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV PATH /root/miniconda3/bin:$PATH

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y \
	vim \
	tmux \
	wget \
	curl \
	htop \
   	git

RUN curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN bash Miniconda3-latest-Linux-x86_64.sh -b

RUN  conda install -y numpy \
    conda \
    anaconda-client \
    conda-build \
    curl \
    greenlet \
    cython \
    jupyter \
    jupyter_client \
    jupyter_console \
    jupyter_core \
    matplotlib \ 
    notebook \
    openblas \
    pyqt \
    pycurl \
    scikit-image \
    scikit-learn \
    scipy \
    werkzeug 

RUN conda update conda & conda update --all

# ==========
# vim config
# =========
RUN git clone https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

RUN conda install pytorch torchvision cpuonly -c pytorch
