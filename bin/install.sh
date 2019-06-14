#!/bin/bash

# error hanndling
set -e

if [ $(id -u) = 0 ]; then
   echo "This script must NOT be run as root" 
   exit 1
fi

# globals
bindir=$(dirname $(readlink -f $0))
srcdir=$bindir/../config
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


# detect which computer script is run on
case $(cat /etc/machine-id) in
    # office desktop
    2bf828620e3943068b85822a7b434766 )
        MODEL="office desktop"
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
for file in $bindir/core.d/*
do
  echo "* Sourcing $(basename $file):"
  source "$file"
  echo ""
done

echo "Installation complete!"
