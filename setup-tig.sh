#!/bin/sh

clone_tig_repository() {
  mkdir -p $GIT_REPOS/github.com/jonas
  cd $GIT_REPOS/github.com/jonas
  git clone https://github.com/jonas/tig.git
}

configure_tig() {
  make configure
  ./configure \
    --prefix=$HOME/local \
    --with-ncurses
}

build_tig() {
  configure_tig && make && make install && make clean
}
