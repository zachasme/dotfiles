#!/bin/bash

# error hanndling
set -e

# globals
BIN_DIR=$(dirname $(readlink -f $0))
CONFIG_DIR=$BIN_DIR/../config

# helper function: enforce pacaur installed
function require_aurman {
  if ! which aurman &> /dev/null; then
    echo 'INSTALL AURMAN'
    echo 'https://aur.archlinux.org/packages/aurman/'
    exit 1
  fi
}

# helper function: install package
function install {
  local package="$1"
  echo -n "  installing $package..."

  if pacman --query --info $package &> /dev/null; then
    echo " already installed, skipping"
  else
    # --needed      do not reinstall up to date packages
    # --noconfirm   do not ask for any confirmation
    # --quiet       show less information for query and search
    sudo pacman -Syu --needed --noconfirm --quiet $package
    echo " done"
  fi
}

# helper function: install pacaur package
function install_aurman {
  local package="$1"
  echo -n "  installing $package..."

  if pacman --query --info $package &> /dev/null; then
    echo " already installed, skipping"
  else
    # --needed      do not reinstall up to date packages
    # --noconfirm   do not ask for any confirmation
    # --quiet       show less information for query and search
    aurman -Syu --needed --noconfirm --quiet $package
    echo " done"
  fi
}

# helper function: simple config symlink
function link {
  local path="$1"
  local dirname=$(basename $path)
  local destination="${2:-$HOME/.config}"
  
  echo -n "  linking $dirname..."

  # clean
  rm -rf $destination/$dirname

  # install
  ln -s $CONFIG_DIR/$path $destination/$dirname

  echo " done"
}


# detect which computer script is run on
case $(cat /etc/machine-id) in
    # office desktop
    2bf828620e3943068b85822a7b434766 )
        MODEL="office desktop"
        require_aurman
        ;;
    # unknown computer
    * )
        echo "Unknown model"
        exit 1
        ;;
esac

echo "Detected model: ${MODEL}"
echo ""

# iterate over installation shell scripts
for file in $BIN_DIR/core.d/*
do
  echo "* Sourcing $(basename $file):"
  source "$file"
  echo ""
done

echo "Installation complete!"
