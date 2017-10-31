#!/bin/bash

# error hanndling
set -e

# globals
BIN_DIR=$(dirname $(readlink -f $0))
CONFIG_DIR=$BIN_DIR/../config

# helper function: enforce pacaur installed
function require_pacaur {
  if ! which pacaur &> /dev/null; then
    echo 'INSTALL PACAUR'
    echo 'https://aur.archlinux.org/packages/pacaur/'
    exit 1
  fi
}

# helper function: install package
function install {
  local package="$1"
  # --needed      do not reinstall up to date packages
  # --noconfirm   do not ask for any confirmation
  # --quiet       show less information for query and search
  sudo pacman -Syu --needed --noconfirm --quiet $package
}

# helper function: install pacaur package
function install_pacaur {
  local package="$1"
  # --needed      do not reinstall up to date packages
  # --noconfirm   do not ask for any confirmation
  # --silent       show less information for query and search
  echo $pacakge
  pacaur -y --needed --noconfirm --silent $package
}

# helper function: simple config symlink
function link {
  local name="$1"

  # clean
  rm -rf $HOME/.config/$name

  # install
  ln -s $CONFIG_DIR/$name $HOME/.config/$name
}

# detect which computer script is run on
case $(cat /sys/devices/virtual/dmi/id/product_name) in
    # asus zenbook
    UX31A )
        MODEL=ux31a
        require_pacaur
        ;;
    # unknown computer
    * )
        echo "Unknown model"
        exit 1
        ;;
esac

# iterate over installation shell scripts
for file in $BIN_DIR/core.d/*
do
  echo "Sourcing $(basename $file)"
  source "$file"
done

echo "Installation complete!"
