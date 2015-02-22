#!/bin/bash

set -e

if ! which pacaur > /dev/null; then
  echo 'INSTALL PACAUR'
  echo 'https://aur.archlinux.org/packages/pacaur/'
  exit 1
fi


BIN_DIR=$(dirname $(readlink -f $0))
LIB_DIR=$BIN_DIR/../config
CONFIG_DIR=$HOME/.config

case $(cat /sys/devices/virtual/dmi/id/product_name) in
    UX31A )
        MODEL=ux31a
        ;;
    * )
        echo "Unknown model"
        exit 1
        ;;
esac

echo $MODEL

function link {
  local target="$1"
  local name="$2"

  # clean
  rm -rf $CONFIG_DIR/$target

  # install
  ln -s $LIB_DIR/$target $CONFIG_DIR/$name
}

# iterate over installation shell scripts
for file in $BIN_DIR/core.d/*
do
  echo "Sourcing $(basename $file)"
  source "$file"
done

echo "Installation complete!"
