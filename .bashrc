#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f /usr/share/git/git-prompt.sh ]] && . /usr/share/git/git-prompt.sh

source ~/.config/bash/aliases
source ~/.config/bash/init
source ~/.config/bash/shell

export BROWSER=firefox
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR" # visudo tries SUDO_EDITOR, VISUAL, then EDITOR
export THOR_MERGE="code --wait --diff $1 $2"

[[ -f ~/.bashrc2 ]] && . ~/.bashrc2
