# Navigational Conveniences
alias ls='ls -FnG'
alias l='ls -al'
alias ..='cd ..'
alias c='clear'

# neovim
alias vim='nvim'

# k8s Shortcuts
alias k='kubectl'

# critical-stack shortcuts
# start up a pod to do network things in
alias dnstools='kubectl run -it --rm --restart=Never --image=infoblox/dnstools:latest dnstools '

