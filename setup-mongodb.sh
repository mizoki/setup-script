#!/bin/sh

init_mongodb_ubuntu() {
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

  sudo aptitude update
  sudo aptitude install -y mongodb-org

  # ref. http://te2u.hatenablog.jp/entry/2013/02/06/222342
  echo "smallfiles = true" | sudo tee -a /etc/mongodb.conf
  sudo service mongod restart
}
