```bash
git clone --bare git@github.com:zachasme/dotfiles.git $HOME/dev/dotfiles
git --git-dir=$HOME/dev/dotfiles --work-tree=$HOME restore -s main -- .bashrc
source .bashrc
dotfile config --local status.showUntrackedFiles no
dotfile checkout --force
```
