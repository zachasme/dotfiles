#!/bin/bash

# error hanndling
set -e

if [ $(id -u) = 0 ]; then
   echo "Do NOT run this script as root" 
   exit 1
fi

# globals
gitdir=$(dirname $(readlink -f $0))
bindir=$gitdir/bin
srcdir=$gitdir/config
devdir=$gitdir/devices
cfgdir=$HOME/.config

# helper function: install package
function install {
  local packages=$@
  echo -n "  installing $packages..."

  if pacman --query --info $packages &> /dev/null; then
    echo " already installed, skipping"
  else
    # --needed      do not reinstall up to date packages
    # --noconfirm   do not ask for any confirmation
    # --quiet       show less information for query and search
    sudo pacman -Syu --needed --noconfirm --quiet $packages
    echo " done"
  fi
}

# helper function: install pacaur package
function install_aur {
  if ! which aurman &> /dev/null; then
    echo ''
    echo 'Error: Aurman is required to install aur pacakges'
    echo 'https://aur.archlinux.org/packages/aurman/'
    exit 1
  fi

  local packages=$@
  echo -n "  installing $packages from aur..."

  if pacman --query --info $packages &> /dev/null; then
    echo " already installed, skipping"
  else
    # --needed      do not reinstall up to date packages
    # --noconfirm   do not ask for any confirmation
    aurman -Syu --needed --noconfirm $packages
    echo " done"
  fi
}

# helper function: simple config symlink
function link {
  local path="$1"
  local dirname=$(basename $path)
  local destination="${2:-$cfgdir}"
  
  echo -n "  linking $dirname..."

  # clean
  rm -rf $destination/$dirname

  # install
  ln -s $srcdir/$path $destination/$dirname

  echo " done"
}

function setshell {
  local wanted="$1"
  if [ "$SHELL" != $wanted ]; then
      echo "Current shell is $SHELL, changing to $wanted"
      chsh -s $wanted
  fi
}

# detect which computer script is run on
device=$(cat /etc/machine-id)

printf "Detected device id: ${device}\n\n"

# ensure device has configuration
if [ ! -f "$devdir/$device.sh" ]; then
    >&2 echo "ERROR: No configuration found. Add it to devices directory."
    exit 1;
fi

# run device configutation
source "$devdir/$device.sh"

echo "Installation complete!"
