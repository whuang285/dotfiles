#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If ssh session, include hostname in prompt
if [[ -n '$SSH_CLIENT' ]] || [[ -n '$SSH_TTY' ]]; then
    export PS1='\[\033[36m\]\u\[\033[1;31m\]@\[\033[0;32m\]\h\[\033[m\]:\[\033[33m\]\w\[\033[m\]> '
else 
    export PS1='\[\033[36m\]\u\[\033[1;36m\]\[\033[33m\]\w\[\033[m\]> '
fi
export CLICOLOR=1

# alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

export LSCOLORS='FxFxBxDxCxegedabagacad'

# Navigational convenience
alias ls="ls -FhG"
alias l="ls -al"
alias ..="cd .."
alias c="clear"
alias back="cd - > /dev/null"

# functions
# wifi
wifi() {
    nmcli device wifi "$@"
}
