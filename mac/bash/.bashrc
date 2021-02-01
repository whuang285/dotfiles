# Source global definitions
if [[ -f /etc/bashrc ]]; then
    . /etc/bashrc
fi

# If ssh session, include hostname in prompt
if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    export PS1="\[\033[36m\]\u\[\033[1;31m\]@\[\033[0;32m\]\h\[\033[m\]:\[\033[33m\]\w\[\033[m\]> "
else
    export PS1="\[\033[36m\]\u\[\033[1;31m\]\[\033[m\]:\[\033[33m\]\w\[\033[m\]> "
fi
export CLICOLOR=1

export LSCOLORS='FxFxBxDxCxegedabagacad'
alias ls='ls -FhG'

export PATH="$PATH:/path/to/dir"

# Navigational convenience
alias l="ls -al"
alias ..="cd .."
alias cd..="cd .."
alias c="clear"
alias back="cd - > /dev/null"
alias python="python3"
