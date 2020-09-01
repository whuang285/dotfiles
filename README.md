# dotfiles
Dotfiles for an Arch Linux distro
Currently running:
- Display Server: Wayland
- Tiling Compositor: Sway
- Status Bar: Waybar
- Desktop Notification Daemon: Mako

## Setup
1. `git pull` from this repo 
2. *symlink* the `.config` from this project to `$HOME/.config` or individually symlink the individual files inside `.config` (take the config files for the applications you need)
3. depending on whether you're using **bash** or **zsh**, *symlink* `.bashprofile .bashrc` or `.zprofile .zshrc`, respectively, from this project's (bash or zsh) folder to the `$HOME` directory
   - for **zsh**: no need to *symlink* the `alias.zsh`, `env.zsh`, or `function.zsh` files 

## Helpful Commands
- Figure out what key is being pressed (doesn't show exact key name that corresponds with sway): `sudo libinput debug-events --show-keycodes`
- **Dell** Function keys can be reversed by `Fn + Esc`. Can change the function keys so that F1-F12 are the main use (without use of the Fn key) and the multimedia keys are on Fn and vice versa.

### How to `symlink` Files:
`ln -sv path/to/dotfiles/{folder_or_file_to_link} path/to/destination`

## Issues Encountered
- Sometimes `swaymsg` will start giving errors: `ERROR: Unable to connect to /run/user/1000/sway-ipc.1000.4981.sock`
  - Fix: comment out the lines in `.zprofile` that automatically starts sway (`exec sway`) and relogin to account. This should bring you to the terminal (**tty**). At this point, start sway manually by just entering `sway`. Then logout again to the tty terminal screen (out of sway - `mod+Shift+e` and then `e` to logout). Add the commented out lines back in to the `.zprofile` and then logout of terminal by executing `exec sway` (this'll take you to the login screen. exits out of the tty terminal). Log back in. At this point, `.zprofile` should automatically start sway and `swaymsg` should be working again. If not, reboot and repeat.
- When starting sway manually from tty terminal, receive errors similar to: `Wayland - Could not connect to remote display: no such file or directory` and `Sway - Unable to create backend`
  - Fix: Reboot
