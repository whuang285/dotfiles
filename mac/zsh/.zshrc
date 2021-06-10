export PATH=$HOME/bin:/usr/local/bin:$PATH

# ===== OH-MY-ZSH =====
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="mh"
ZSH_CUSTOM=$HOME/dotfiles/mac/zsh
ZSH_DISABLE_COMPFIX="true"
plugins=(
    git
    brew
)
source $ZSH/oh-my-zsh.sh

# ===== VI-MODE =====
bindkey -v
