# Usage:
#   wget -qO- https://raw.githubusercontent.com/zachasme/dotfiles/refs/heads/main/bin/dotfiles.sh | bash

# Exit immediately if a command exits with a non-zero status
set -e

GIT_DIR=${1:-dotfiles}

git clone --bare git@github.com:zachasme/dotfiles.git $GIT_DIR
alias dotfile='git --git-dir=$GIT_DIR --work-tree=.'
dotfile config push.autoSetupRemote true
dotfile config status.showUntrackedFiles no
dotfile sparse-checkout set --no-cone '/*' '!README.md !.gitignore'
dotfile checkout -f