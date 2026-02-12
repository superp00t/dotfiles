#!/usr/bin/env bash

set -e

mkdir -p deps
CONFIG_LOCATION=$(pwd)

is_service_installed() {
  local service_name=$1
  systemctl cat "$service_name" >/dev/null 2>&1
}
# install keyd
# (among other things, makes Caps Lock the ESC key.)
if ! is_service_installed "keyd.service"; then
  echo "keyd is not installed";
  git clone https://github.com/rvaiya/keyd deps/keyd.git
  cd deps/keyd.git 
  make && sudo make install
  sudo systemctl enable --now keyd
fi
cd $CONFIG_LOCATION
# update keyd config and restart
echo "updating keyd config"
sudo cp config/keyd/keyd.conf /etc/keyd/default.conf
sudo systemctl restart keyd
# install dotfiles
cp -ar dotfiles/.* $HOME/
