#!/bin/sh

init_vim_ubuntu() {
  sudo aptitude update
  sudo aptitude install gettext libncurses5-dev libacl1-dev libgpm-dev \
  libperl-dev python-dev python3-dev ruby-dev lua5.2 liblua5.2-dev \
  luajit libluajit-5.1-2 libluajit-5.1-dev
}

init_vim_centos() {
  sudo yum update
  sudo yum install gettext ncurses-libs libacl-devel gpm-libs perl-core perl-libs perl-ExtUtils-Embed python-devel ruby ruby-devel lua lua-devel

  cd $HOME/local/src
  git clone http://luajit.org/git/luajit-2.0.git
  cd luajit-2.0
  sudo make && sudo make install
}

clone_vim_repository() {
  mkdir -p $GIT_REPOS/github.com/vim-jp
  cd $GIT_REPOS/github.com/vim-jp
  git clone git@github.com:vim-jp/vim.git
}

configure_vim() {
  ./configure \
    --with-features=huge \
    --with-compiledby="mizoki <h.mizoki@gmail.com>" \
    --prefix=$HOME/local \
    --with-x \
    --with-gnome \
    --enable-xim \
    --enable-fail-if-missing \
    --enable-luainterp=yes \
    --enable-perlinterp=yes \
    --enable-pythoninterp=yes \
    --enable-rubyinterp=yes \
    --with-lua-prefix=/usr \
    --with-luajit \
    --enable-multibyte
}

build_vim() {
  configure_vim && make && make install && make clean
}
