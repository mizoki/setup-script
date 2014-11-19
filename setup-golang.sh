#!/bin/sh

# ref. http://golang.org/doc/install
setup_golang() {
  VERSION=1.3.3
  GOOS=linux
  GOARCH=amd64

  wget http://golang.org/dl/go${VERSION}.${GOOS}-${GOARCH}.tar.gz
  tar xzf go${VERSION}.${GOOS}-${GOARCH}.tar.gz
  mv go $HOME/.go
  echo ''                              >> $HOME/.zshenv
  echo '# Go environment'              >> $HOME/.zshenv
  echo 'export GOROOT=$HOME/.go'       >> $HOME/.zshenv
  echo "export GOOS=${GOOS}"           >> $HOME/.zshenv
  echo "export GOARCH=${GOARCH}"       >> $HOME/.zshenv
  echo 'export PATH=$PATH:$GOROOT/bin' >> $HOME/.zshenv
  echo 'export GOPATH=$HOME/dev/go'    >> $HOME/.zshenv
  echo 'export PATH=$GOPATH/bin:$PATH' >> $HOME/.zshenv
  source $HOME/.zshenv
  rm -f go${VERSION}.${GOOS}-${GOARCH}.tar.gz
}

# ref. http://motemen.hatenablog.com/entry/2014/06/01/introducing-ghq
setup_ghq() {
  go get github.com/motemen/ghq
  echo '[ghq]'                      >> $HOME/.gitconfig
  echo "	root = ${GIT_REPOS}"      >> $HOME/.gitconfig
  echo "	root = ${GOPATH}/src"     >> $HOME/.gitconfig
}

setup_peco() {
  go get github.com/peco/peco/cmd/peco
}