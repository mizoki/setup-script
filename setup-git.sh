#!/bin/sh

init_settings_git() {
  git config --global user.name mizoki
  git config --global user.email h.mizoki@gmail.com
  git config --global core.editor vim

  git config --global include.path $HOME/.gitconfig_alias
}

init_git_centos() {
  sudo yum update
  sudo yum install \
    curl-devel \
    expat-devel \
    gettext-devel \
    openssl-devel \
    zlib-devel
}

init_git_ubuntu() {
  sudo aptitude update
  sudo aptitude install \
    libcurl4-gnutls-dev \
    libexpat1-dev gettext \
    libz-dev \
    libssl-dev
}

clone_git_repository() {
  mkdir -p $GIT_REPOS/github.com/git
  cd $GIT_REPOS/github.com/git
  git clone git@github.com:git/git.git
}

configure_git() {
  make configure
  ./configure --prefix=$HOME/local
}

build_git() {
  configure_git
  make all doc info
  make install install-doc install-html install-info
  make clean
}
