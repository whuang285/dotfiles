# dotfiles
Dotfiles for the following distros:
- Arch Linux 
  Currently Running:
  - Display Server: Wayland
  - Tiling Compositor: Sway
  - Status Bar: Waybar
  - Desktop Notification Daemon: Mako
- Mac OS          
  Currently Running: Catalina

## Setup
1. `git pull` from this repo 
2. *[symlink](#how-to-symlink-files)* the `.config` from this project to `$HOME/.config` or individually symlink the individual files inside `.config` (take the config files for the applications you need)
3. depending on whether you're using **bash** or **zsh**, *[symlink](#how-to-symlink-files)* `.bashprofile .bashrc` or `.zprofile .zshrc`, respectively, from this project's (bash or zsh) folder to the `$HOME` directory
   - for **zsh**: no need to *symlink* the `alias.zsh`, `env.zsh`, or `function.zsh` files - will be automatically pulled in when `$ZSH_CUSTOM` (in `.zshrc`) is set to the repective zsh folder

## Helpful Commands
OS specific tips and tricks:
- [Arch Linux](arch-linux/README.md)
- [Mac OS](mac/README.md)

### How to `symlink` Files:
`ln -sv path/to/dotfiles/{folder_or_file_to_link} path/to/destination`
