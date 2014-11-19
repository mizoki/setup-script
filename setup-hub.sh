#!/bin/sh

clone_hub_repository() {
  mkdir -p $GIT_REPOS/github/github
  cd $GIT_REPOS/github/github
  git clone https://github.com/github/hub.git
}

# Install hub ver2
# To install hub 2.x from source, you need to have a Go development environment, version 1.1 or better
build_hub_v2() {
  ./script/build
  cp hub $HOME/local/bin
}

# Install hub ver1
build_hub_v1() {
  rake install PREFIX=$HOME/local
}
