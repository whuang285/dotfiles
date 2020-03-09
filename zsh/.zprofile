if [[ $(tty) = /dev/tty1 ]]; then 
    exec sway
fi

# Colorscheme
wal -q -i "$(< "${HOME}/.cache/wal/wal")"
wal -q -R
source $HOME/.cache/wal/colors-tty.sh
