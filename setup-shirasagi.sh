#!/bin/sh

setup_shirasagi_centos() {
  sudo yum -y install ImageMagick ImageMagick-devel openssl-devel

  git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.profile
  echo 'eval "$(rbenv init -)"' >> $HOME/.profile
  exec $SHELL -l
  mkdir -p $HOME/.rbenv/plugins
  git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
  rbenv install 2.1.5
  rbenv global 2.1.5
  rbenv rehash
  gem install bundler --no-ri --no-rdoc
  rbenv rehash
  git clone https://github.com/shirasagi/shirasagi $HOME/shirasagi
  cd $HOME/shirasagi
  cp config/samples/* config/
  bundle install

  #rake db:create_indexes
  rake ss:create_user data='{ name: "システム管理者", email: "sys@example.jp", password: "pass" }'
  rake ss:create_site data='{ name: "サイト名", host: "www", domains: "localhost:3000" }'
  bin/rails s
}
