#!/bin/sh

# b4b4r07/enhancd
# https://github.com/b4b4r07/enhancd
#
# Requirement
# - peco, percol, fzf, etc.
# - awk
#
# Standard installation
# curl -L git.io/enhancd | sh
#
# Reference
# ターミナルのディレクトリ移動を高速化する - Qiita
# http://qiita.com/b4b4r07/items/2cf90da00a4c2c7b7e60
#

setup_enhancd() {
  if [ ! -d "$GIT_REPOS/github.com/b4b4r07/enhancd" ]; then
    mkdir -p $GIT_REPOS/github.com/b4b4r07
    cd $GIT_REPOS/github.com/b4b4r07
    git clone git@github.com:b4b4r07/enhancd.git

    echo ''                                                        >> $HOME/.zshenv
    echo '# enhancd'                                               >> $HOME/.zshenv
    echo 'source $GIT_REPOS/github.com/b4b4r07/enhancd/enhancd.sh' >> $HOME/.zshenv
    source $HOME/.zshenv
  else
    cd $GIT_REPOS/github.com/b4b4r07/enhancd
    git pull
  fi
}
