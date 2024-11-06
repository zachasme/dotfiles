#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza -lh --group-directories-first --icons'
alias grep='grep --color=auto'
alias rcat=$(which cat)
alias cat=$(which  bat)
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias ga='git add'
alias srcinfo='makepkg --printsrcinfo > .SRCINFO'
alias dotfile='git --git-dir=$HOME/dev/dotfiles --work-tree=$HOME'

PS1='[\u@\h \W]\$ '
shopt -s autocd

export BROWSER=firefox
export THOR_MERGE="code --wait --diff $1 $2"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh
chruby ruby-3.3.5

export CDPATH=$HOME/dev

source .bashrc2
