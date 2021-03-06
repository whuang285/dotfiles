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

# OS Specific Aliases
OS=$(uname)
case "$OS" in
    'Darwin')
        export LSCOLORS='FxFxBxDxCxegedabagacad'
        alias ls='ls -FhG'
        ;;
    'Linux')
        export LS_COLORS='di=1;35;40:ln=1;35;40:so=1;31;40:pi=1;33;40:ex=1;32;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
        alias ls='ls -Fh --color=always'

        # Regular open doesn't do what we want; xdg-open *should* exist on all Linux platforms.
        # This is a "function", which we will cover later with scripting.
        #
        #     - The $@ says "take ALL inputs", allowing for say `open *.txt`
        #     - The &> is a shorthand for 2>&1 for bash 4.0+
        #         - We are sending it to /dev/null because we don't care what it has to say (usually)...
        open () {
            xdg-open "$@" &>/dev/null
        }

        # I want to be able to run vlc from the commandline without any output, and let it keep running after
        # I close my terminal (nohup).
        #
        # Of course...you have to have vlc installed.
        # vlc () {
        #     nohup "$(which vlc)" "$@" &>/dev/null &
        # }
        ;;
    *)
        echo "Unknown OS: $OS"
        ;;
esac

# Navigational convenience
alias l="ls -al"
alias ..="cd .."
alias cd..="cd .."
alias c="clear"
alias back="cd - > /dev/null"
alias python="python3.6"

# Power.  MUCH better looking grep.
alias grep="grep -Hn --color=auto"
alias egrep="egrep -Hn --color=auto"
alias pgrep="pgrep -Hn --color=auto"

# My root and user bashrc files are linked to be the same.  This makes sure that the
# root rm / cp / mv commands are prompting.
if [[ $(id -u) -eq 0 ]]; then
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
fi

#
# Thank you: http://madebynathan.com/2011/10/04/a-nicer-way-to-use-xclip/
#
# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
#
# Note: I changed my alias to 'clip', which is different from the original.
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function clip() { cat "$1" | cb; }
# Copy SSH public key
alias clipssh="clip ~/.ssh/id_rsa.pub"
# Copy current working directory
alias clipwd="pwd | cb"
# Copy most recent command in bash history
alias cliphs="cat $HISTFILE | tail -n 1 | cb" 
