#!/bin/sh

setup_virtualbox_ubuntu1204() {
  echo 'deb http://download.virtualbox.org/virtualbox/debian precise contrib' | sudo tee /etc/apt/sources.list.d/virtualbox.list

  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

  sudo aptitude update
  sudo aptitude install -y dkms
  sudo aptitude install -y virtualbox-4.3
}
