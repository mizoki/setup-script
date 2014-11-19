#!/bin/sh

clone_zsh_repository() {
  # mkdir -p $GIT_REPOS/git.code.sf.net/p/zsh
  # cd $GIT_REPOS/git.code.sf.net/p/zsh
  # git clone git://git.code.sf.net/p/zsh/code zsh

  # Mirror of the Z shell source code repository
  mkdir -p $GIT_REPOS/github.com/zsh-users
  cd $GIT_REPOS/github.com/zsh-users
  git clone git@github.com:zsh-users/zsh.git
}

configure_zsh() {
  ./Util/preconfig
  ./configure --prefix=$HOME/local --enable-pcre --enable-cap --enable-multibyte
}

build_zsh() {
  configure_zsh && make && make install && make clean
}
