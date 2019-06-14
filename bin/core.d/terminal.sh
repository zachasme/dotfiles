install termite zsh powerline-fonts
install_aur oh-my-zsh-git
link "termite"
link "zsh/.zshrc" "$HOME"

if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Current shell is $SHELL"
    chsh -s /usr/bin/zsh
fi