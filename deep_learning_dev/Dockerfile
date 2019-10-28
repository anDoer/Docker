FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

ARG USERNAME=docker 
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV PATH /home/$USERNAME/miniconda3/bin:$PATH

RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get install -y \
	vim \
	tmux \
	wget \
	curl \
	htop \
   	git \
	zip \
	gzip \
	software-properties-common \
	apt-transport-https \
	wget \
	firefox

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

RUN apt-get update
RUN apt-get -y install code

RUN groupadd --gid $USER_GID $USERNAME
RUN useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN apt-get install -y sudo 
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

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

RUN conda install -c conda-forge opencv
RUN conda update conda
RUN conda install pytorch torchvision cpuonly -c pytorch

# ==========
# vim config
# =========
RUN git clone https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

