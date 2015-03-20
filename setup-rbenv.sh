#!/bin/sh

setup_rbenv() {
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  echo '' >> ~/.zshenv
  echo '# rbenv settings' >> ~/.zshenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
  echo 'eval "$(rbenv init -)"' >> ~/.zshenv

  source ~/.zshenv
}
