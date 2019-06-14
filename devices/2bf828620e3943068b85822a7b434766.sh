# office desktop
echo "Office desktop"

link ".pam_environment" "$HOME"
link ".profile" "$HOME"

install compton
link "compton/compton.conf" "$cfgdir"

install feh archlinux-wallpaper

install firefox-developer-edition

install gnupg
link "gnupg/gpg-agent.conf" "$HOME/.gnupg"

install i3-wm i3status
link "i3"

install ranger
install_aur dragon-drag-and-drop-git
link "ranger/rc.conf" "$cfgdir/ranger"

link "ssh/config" "$HOME/.ssh"
link "ssh/config.d" "$HOME/.ssh"

link "systemd/user/ssh-agent.service" "$cfgdir/systemd/user"

install termite zsh powerline-fonts
install_aur oh-my-zsh-git
link "termite"
link "zsh/.zshrc" "$HOME"

setshell /usr/bin/zsh