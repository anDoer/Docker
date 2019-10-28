FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

ARG USERNAME=docker 
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
   	git \
	software-properties-common \
	apt-transport-https \
	wget \
	firefox \
	texlive-full \
	texmaker

RUN apt-get update

RUN groupadd --gid $USER_GID $USERNAME
RUN useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME

RUN apt-get install -y sudo 
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /home/$USERNAME

# ==========
# vim config
# =========
RUN git clone https://github.com/amix/vimrc.git ~/.vim_runtime
RUN sh ~/.vim_runtime/install_awesome_vimrc.sh

