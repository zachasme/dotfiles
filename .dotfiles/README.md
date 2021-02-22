# Zacharias' Arch Linux dotfiles

Software:

* i3 (window manager)
* ranger (file manager)
* ssh (add keys to agent)
* systemd (add ssh agent)

### Usage

* Get your device id using `cat /etc/machine-id`
* Create a file in `devices/MACHINE-ID.sh` with the same name as your device id
* Put in lines (e.g. `link i3`) for each package you wish to install or configure on the machine
* Then run `./install.sh`
