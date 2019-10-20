FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive
ENV PATH /root/miniconda3/bin:$PATH

# Or your actual UID, GID on linux if default is not 1000
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y \
	vim \
	tmux \
	wget \
	curl \
	htop \
   	git

 # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
RUN groupadd --gid $USER_GID $USERNAME
RUN useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME
    # [Optional] Add sudo support for non-root user
RUN apt-get install -y sudo
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME


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
    werkzeug \
    pylint 

RUN conda update conda & conda update --all

# ==========
# vim config
# =========
RUN git clone https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

RUN conda install pytorch torchvision cpuonly -c pytorch
