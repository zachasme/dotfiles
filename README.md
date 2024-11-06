```bash
cd $HOME
git clone --bare git@github.com:zachasme/dotfiles.git $HOME/dev/dotfiles
alias dotfile='git --git-dir=$HOME/dev/dotfiles --work-tree=$HOME'
dotfile config --local status.showUntrackedFiles no
dotfile checkout --force
source .bashrc
```
