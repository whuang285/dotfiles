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
- List class names for all open windows: `swaymsg -t get_tree | grep "class"`
- **Dell** Function keys can be reversed by `Fn + Esc`. Can change the function keys so that F1-F12 are the main use (without use of the Fn key) and the multimedia keys are on Fn and vice versa.
- Set a wallpaper and generate colorscheme with pywal: 
  - random image from directory: `wal -i "path/to/dir"`
  - specific image: `wal -i "/path/to/img.jpg"` 

### How to `symlink` Files:
`ln -sv path/to/dotfiles/{folder_or_file_to_link} path/to/destination`

### How to get Screen Share working:
**Only works on chromium. Does not work with google-chrome**
- Things to install:
  - `pacman -S chromium`
  - `pacman -S pipewire xdg-desktop-portal`
  - `yay -S xdg-desktop-portal-wlr-git`
    - *xdg-desktop-portal-wlr-git* is what's important here to make screen share work
  - `pacman -S libpipewire02`
- Setup:
  - Set the following environment variables:
    - `export XDG_SESSION_TYPE=wayland`
    - `export XDG_CURRENT_DESKTOP=sway`
      - this needs to be set to sway for *xdg-desktop-portal-wlr* to run
  - Enable `WebRTC PipeWire support` on Chromium: `chrome://flags/#enable-webrtc-pipewire-capturer`
- How to Run:
  - Get pipewire up and running before opening Chromium
    - ~~make sure `pipewire.service` and `pipewire.socket` are up and running~~
      - ~~`systemctl --user status pipewire.service`~~
      - ~~`systemctl --user status pipewire.socket`~~
    - Run this in background: `env PIPEWIRE_DEBUG=3 pipewire`
  - Run xdpw: `/usr/lib/xdg-desktop-portal --verbose -r & /usr/lib/xdg-desktop-portal-wlr -l DEBUG`
  - Run Chromium thru the terminal: `chromium`
  - **TLDR**:  
    In separate terminals execute the following commands in the following order:
    1. `env PIPEWIRE_DEBUG=3 pipewire`
    2. `/usr/lib/xdg-desktop-portal --verbose -r & /usr/lib/xdg-desktop-portal-wlr -l DEBUG`
    3. `chromium`

## Issues Encountered
- Sometimes `swaymsg` will start giving errors: `ERROR: Unable to connect to /run/user/1000/sway-ipc.1000.4981.sock`
  - Fix: comment out the lines in `.zprofile` that automatically starts sway (`exec sway`) and relogin to account. This should bring you to the terminal (**tty**). At this point, start sway manually by just entering `sway`. Then logout again to the tty terminal screen (out of sway - `mod+Shift+e` and then `e` to logout). Add the commented out lines back in to the `.zprofile` and then logout of terminal by executing `exec sway` (this'll take you to the login screen. exits out of the tty terminal). Log back in. At this point, `.zprofile` should automatically start sway and `swaymsg` should be working again. If not, reboot and repeat.
- When starting sway manually from tty terminal, receive errors similar to: `Wayland - Could not connect to remote display: no such file or directory` and `Sway - Unable to create backend`
  - Fix: Reboot

### Poweroff/Suspend Issues
- use `/etc/systemd/logind.conf` to configure how to handle the power key and closing lid

### Disabling Phantom Monitor  
In some cases, a non-existent monitor may be detected by the system. To disable it, find the name of the phantom output, e.g. DP-2, and turn it off with ```swaymsg output DP-2 disable```
