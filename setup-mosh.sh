#!/bin/sh

clone_mosh_repository() {
  mkdir -p $GIT_REPOS/github.com/keithw
  cd $GIT_REPOS/github.com/keithw
  git clone git@github.com:keithw/mosh.git
}

init_mosh_ubuntu() {
  sudo aptitude update
  sudo aptitude install \
    protobuf-compiler \
    libprotobuf-dev \
    libncurses5-dev \
    zlib1g-dev \
    libssl-dev
}

configure_mosh() {
  ./autogen.sh
  ./configure --prefix=$HOME/local --with-ncurses
}

build_mosh() {
  configure_mosh && make && make install && make clean
}
