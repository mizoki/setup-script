#!/bin/sh

setup_mongodb_ubuntu() {
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

  sudo aptitude update
  sudo aptitude install -y mongodb-org

  # ref. http://te2u.hatenablog.jp/entry/2013/02/06/222342
  echo "smallfiles = true" | sudo tee -a /etc/mongodb.conf
  sudo service mongod restart
}

setup_mongodb_centos() {
  echo ''                                                                   | sudo tee -a /etc/yum.repos.d/CentOS-Base.repo
  echo '[10gen]'                                                            | sudo tee -a /etc/yum.repos.d/CentOS-Base.repo
  echo 'name=10gen Repository'                                              | sudo tee -a /etc/yum.repos.d/CentOS-Base.repo
  echo 'baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/' | sudo tee -a /etc/yum.repos.d/CentOS-Base.repo
  echo 'gpgcheck=0'                                                         | sudo tee -a /etc/yum.repos.d/CentOS-Base.repo
  echo 'enabled=0'                                                          | sudo tee -a /etc/yum.repos.d/CentOS-Base.repo

  sudo yum -y --enablerepo=10gen install mongo-10gen mongo-10gen-server

  # ref. http://te2u.hatenablog.jp/entry/2013/02/06/222342
  echo "smallfiles = true" | sudo tee -a /etc/mongodb.conf

  sudo /sbin/service mongod start
  sudo /sbin/chkconfig mongod on
}
