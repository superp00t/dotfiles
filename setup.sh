#!/usr/bin/env bash

set -e
mkdir -p deps
PATH=$PATH:$(pwd)/script

if is_service_installed "keyd.service"; then
  echo "keyd is already installed"
fi

# install keyd
install_keyd

# install dotfiles
install_dotfiles
