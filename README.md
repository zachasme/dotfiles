# Keep track archlinux setup steps

## System setup

- `paru`, AUR helper
- `bat`, cat clone with syntax highlighting and git integration
- `zsh`: update `SHELL` in `/etc/default/useradd` to `/usr/bin/zsh`
- Update `/etc/environment`, set `BROWSER` and `EDITOR`


```sh
# useradd -m -G wheel zach
# passwd zach
```

## User setup

- `ssh`: Set up new ssh keys and add to github

```sh
~ echo "export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" > ~/.zprofile
~ git config --global user.name "Zacharias Knudsen" 
~ git config --global user.email "z@chari.as"
```
