# Usage:
#   wget -qO- https://raw.githubusercontent.com/zachasme/dotfiles/refs/heads/main/bin/dotfiles.sh | bash

# Exit immediately if a command exits with a non-zero status
set -e

git clone --bare git@github.com:zachasme/dotfiles.git $HOME/dev/dotfiles
git --git-dir=$HOME/dev/dotfiles --work-tree=$HOME restore -s main -- .bashrc
source .bashrc

dotfile config --local status.showUntrackedFiles no
dotfile checkout --force