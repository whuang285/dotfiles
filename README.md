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


### How to `symlink` Files:
`ln -sv path/to/dotfiles/{folder_or_file_to_link} path/to/destination`
