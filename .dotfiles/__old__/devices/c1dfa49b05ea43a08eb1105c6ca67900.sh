# office desktop
echo "Scandi desktop"

link ".pam_environment" "$HOME"
link ".profile" "$HOME"

install feh archlinux-wallpaper

install firefox-developer-edition

install gnupg
link "gnupg/gpg-agent.conf" "$HOME/.gnupg"

install ranger
install_aur dragon-drag-and-drop-git
link "ranger/rc.conf" "$cfgdir/ranger"

link "ssh/config" "$HOME/.ssh"
link "ssh/config.d" "$HOME/.ssh"

link "systemd/user/ssh-agent.service" "$cfgdir/systemd/user"
systemctl --user enable --now ssh-agent

install termite zsh powerline-fonts
install_aur oh-my-zsh-git
link "termite"
link "zsh/.zshrc" "$HOME"

setshell /usr/bin/zsh

# appearance
install ttf-liberation

install compton
link "compton/compton.conf" "$cfgdir"

install i3-wm i3status dex
link "i3"