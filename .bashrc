#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.config/bash/aliases
source ~/.config/bash/init
source ~/.config/bash/shell

export BROWSER=firefox
export THOR_MERGE="code --wait --diff $1 $2"

[[ -f ~/.bashrc2 ]] && . ~/.bashrc2