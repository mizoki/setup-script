#!/bin/sh

# ref. http://golang.org/doc/install
setup_golang() {
  GOOS=linux
  GOARCH=amd64

  brew update
  brew install go
  echo ''                              >> $HOME/.zshenv
  echo '# Go environment'              >> $HOME/.zshenv
  echo 'export GOROOT=$HOME/.go'       >> $HOME/.zshenv
  echo "export GOOS=${GOOS}"           >> $HOME/.zshenv
  echo "export GOARCH=${GOARCH}"       >> $HOME/.zshenv
  echo 'export PATH=$PATH:$GOROOT/bin' >> $HOME/.zshenv
  echo 'export GOPATH=$HOME/dev/go'    >> $HOME/.zshenv
  echo 'export PATH=$GOPATH/bin:$PATH' >> $HOME/.zshenv
  source $HOME/.zshenv
}

setup_golang_mac() {
  GOOS=darwin
  GOARCH=amd64

  brew update
  brew install go
  echo ''                                        >> $HOME/.zshenv
  echo '# Go environment'                        >> $HOME/.zshenv
  echo 'export GOROOT=/usr/local/opt/go/libexec' >> $HOME/.zshenv
  echo "export GOOS=${GOOS}"                     >> $HOME/.zshenv
  echo "export GOARCH=${GOARCH}"                 >> $HOME/.zshenv
  echo 'export PATH=$PATH:$GOROOT/bin'           >> $HOME/.zshenv
  echo 'export GOPATH=$HOME/dev/go'              >> $HOME/.zshenv
  echo 'export PATH=$GOPATH/bin:$PATH'           >> $HOME/.zshenv
  source $HOME/.zshenv
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
