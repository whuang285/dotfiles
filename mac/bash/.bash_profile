# .bash_profile

# Get the aliases and functions. Note we can use '.' as a shortcut to 'source'
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

#
# User specific environment and startup programs.
#
export PATH="$PATH:$HOME/.local/bin:$HOME/bin"

# Example: CUDA.  Since you (most likely) do not have this installed I have left it commented
# out, we will be modifying this later in the semester when we go over compiling projects
# from the source code.
# export PATH="$PATH:/usr/local/cuda-7.5/bin"
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-7.5/lib64"


# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

alias python="python3.6"
