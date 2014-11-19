#!/bin/sh

setup_python() {
  sudo aptitude install python-pip
}

# ref. https://bitbucket.org/mgemmill/bitbucket-cli
setup_bitbucket_cli() {
  sudo pip install bitbucket-cli
  echo '[auth]'              >  $HOME/.bitbucket
  echo 'username = mizoki'   >> $HOME/.bitbucket
  echo 'password = ********' >> $HOME/.bitbucket
  echo '[options]'           >> $HOME/.bitbucket
  echo 'scm = git'           >> $HOME/.bitbucket
  echo 'protocol = ssh'      >> $HOME/.bitbucket
  chmod 600 $HOME/.bitbucket
}

