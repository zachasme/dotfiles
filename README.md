```bash
git clone --bare git@github.com:zachasme/dotfiles.git ~/dev/dotfiles
alias dotfile='git --git-dir=~/dev/dotfiles --work-tree=~'
dotfile checkout --force
```
