#!/bin/sh

# ref. http://brew.sh/linuxbrew/#installation

init_linuxbrew_ubuntu() {
  sudo aptitude update
  sudo aptitude install \
    build-essential \
    curl \
    git \
    m4 \
    ruby \
    texinfo \
    libbz2-dev \
    libcurl4-openssl-dev \
    libexpat-dev \
    libncurses-dev \
    zlib1g-dev
}

init_linuxbrew_centos() {
  sudo yum update
  sudo yum groupinstall 'Development Tools'
  sudo yum install \
    curl \
    git \
    m4 \
    ruby \
    texinfo \
    bzip2-devel \
    curl-devel \
    expat-devel \
    ncurses-devel \
    zlib-devel
}

setup_linuxbrew() {
  # ref. http://brew.sh/linuxbrew/
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
  # git clone https://github.com/Homebrew/linuxbrew.git ~/.linuxbrew

  echo ''                                                      >> $HOME/.zshenv
  echo '# Linuxbrew'                                           >> $HOME/.zshenv
  echo 'export PATH=$HOME/.linuxbrew/bin:$PATH'                >> $HOME/.zshenv
  echo 'export MANPATH=$HOME/.linuxbrew/share/man:$MANPATH'    >> $HOME/.zshenv
  echo 'export INFOPATH=$HOME/.linuxbrew/share/info:$INFOPATH' >> $HOME/.zshenv
  source $HOME/.zshenv
}
